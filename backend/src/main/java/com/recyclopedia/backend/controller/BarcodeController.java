package com.recyclopedia.backend.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@CrossOrigin(origins = "http://localhost:3000") // allow your React dev server
@RestController
@RequestMapping("/api")
public class BarcodeController {

    // Minimal in-memory demo data
    private static final Map<String, Map<String, Object>> PRODUCTS = new HashMap<>();
    static {
        Map<String, Object> bottle = new HashMap<>();
        bottle.put("product_name", "Generic Water Bottle");
        bottle.put("material", "PET Plastic (#1)");
        bottle.put("recyclable", true);
        bottle.put("instructions", "Rinse and recycle with plastics.");
        PRODUCTS.put("0123456789012", bottle);

        Map<String, Object> chips = new HashMap<>();
        chips.put("product_name", "Chip Bag");
        chips.put("material", "Multi-layer film");
        chips.put("recyclable", false);
        chips.put("instructions", "Not curbside recyclable; dispose in trash.");
        PRODUCTS.put("0000000000002", chips);
    }

    @PostMapping("/checkRecyclable")
    public ResponseEntity<Map<String, Object>> checkRecyclable(@RequestBody Map<String, String> body) {
        String barcode = body.get("barcode");
        if (barcode == null || barcode.isBlank()) {
            return ResponseEntity.badRequest().body(Map.of("message", "Missing barcode"));
        }
        Map<String, Object> product = PRODUCTS.get(barcode);
        if (product == null) {
            return ResponseEntity.status(404).body(Map.of(
                    "product_name", "Unknown product",
                    "material", "Unknown",
                    "recyclable", false,
                    "instructions", "No data found. Check packaging for recycling info."
            ));
        }
        return ResponseEntity.ok(product);
    }
}