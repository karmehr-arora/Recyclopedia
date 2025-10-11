package com.recyclopedia.backend.dto;

import java.time.OffsetDateTime;
import java.util.List;

public record KpiResponse(
    Streak streak,
    int points,
    List<Badge> badges,
    List<Scan> recentScans,
    Pickup nextPickup
) {
    public record Streak(int current, int longest) {}
    public record Badge(String code, String title, OffsetDateTime awardedAt) {}
    public record Scan(String upc, String name, String material, boolean recyclable, OffsetDateTime scannedAt) {}
    public record Pickup(String stream, OffsetDateTime datetime) {}

    public static KpiResponse mock() {
        return new KpiResponse(
            new Streak(7, 21),
            135,
            List.of(
                new Badge("RECYCLE_10", "First Ten", OffsetDateTime.now().minusDays(6)),
                new Badge("STREAK_7", "One Week Strong", OffsetDateTime.now())
            ),
            List.of(
                new Scan("012345678905","Water Bottle","PET (#1)", true, OffsetDateTime.now()),
                new Scan("098765432101","Yogurt Cup","PP (#5)", true, OffsetDateTime.now().minusHours(12))
            ),
            new Pickup("Recycling", OffsetDateTime.now().plusDays(2))
        );
    }
}
