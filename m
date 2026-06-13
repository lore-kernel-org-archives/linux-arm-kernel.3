Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DDCCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 23:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mZeHPaYgjAc0cmERq1W7zmI0HdZsP4dzCZuF2djjKP8=; b=Hr7XuQblrVpLRyKzp7GOk/uaVF
	ctZNdQRlNvRENdieIFkmj3SIKC2YZ4b4JBtnM5quXL29k4te7tH+Y7AePtbCPPFAsYrl2YsDVALNJ
	PVDmAnkyOXMpw+oUw6X3RW7xIXtrH2zod48HIHFllMjlggHkXzX6VWxAadnWh95KdeTYLqUSM7gQq
	b141TnqNCBC1Bkkr6bRVj6GGcb1OID9JjKLWPcm/W8M/v5G/2RYRSIHMfUSZr5tahO0frGB1gcdGS
	dYLbYok1C0fstRUyBTkcq9lcdkuz6U7sq6kqjTSDlbggF0v+8jTIKsGc5278H90w9HHZguioYKZGG
	jIPTOSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXy0-0000000CcGP-4AnV;
	Sat, 13 Jun 2026 23:40:44 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXxw-0000000CcFc-1rWd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 23:40:43 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-842848fd613so2018668b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 16:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781394039; x=1781998839; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZeHPaYgjAc0cmERq1W7zmI0HdZsP4dzCZuF2djjKP8=;
        b=crBDhtYJ3a/Z01f1D0X7+sh80cF541Ye/vJkc4y+0SeqXGXanvVn1N0Z7iWlXgXL05
         VEJ8Df6hveBrHjrnO65sDgRHmCnp2E8MNQkxg5TON9dNa78h51GBOpZAe27HVFBxrKrj
         XZP3TdBelivSqOv9LJMj45UPLzCS4RoSWGXEgeZgUdYMadUWzDmcSViXRVfyrWLmAwIj
         qnC4WGA+yvBabHR2kborwFmEXKxYpd3H9EJOxVnbSq951tD+SOphcwT4mu+X8oJCxVDc
         aKb4dA5+GBWaLa8CwpmlzriyfFtPqgEEbYfARkk8VDT/Tq6jkxLxYhYPaceMX5fAHZVY
         Ctew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781394039; x=1781998839;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZeHPaYgjAc0cmERq1W7zmI0HdZsP4dzCZuF2djjKP8=;
        b=AztLYC+aeeMN/NhW8LakGUIj2c/O0B5vY32EoveEYK9HnjVMlDsnS2OVoHEjv7wetV
         YQwEmofHSZtO1xJSat7epPl+W9/LsmpNgVAgdA04yI/XlIowRj5nEKTZu8DR3G7kNU4J
         lMWZt4b+/Qqaj3+DS3e7Wm9biL7QKOWBNP3jZJN94cAAYxyJIhYlpYU1uAhVpMBeJigu
         bHbjLvfN+4pQlgN8kHe0llj2wNPL85nzyz8DnrhEqF+Dyh8maRMD1PhxqPfm7vo855vi
         0KyLA/OqYGWiRK93CMz6AN2WNAi+xevyeVOJ0nmG2UkQeB4Yyts1InOOhyZx+OlMxGoA
         2iWA==
X-Forwarded-Encrypted: i=1; AFNElJ+DqbFbHpb+q9IjmddQGFLK0/J6yYZFzxy7sI75MThjbNSOz2ojH/xpK9wnTIp5Pogn0pzDeEa3g3s4SZef5XI0@lists.infradead.org
X-Gm-Message-State: AOJu0YwaU9+pNegCl7jnqV/FGg+Jm0sCEfx32E4aV6VZQ0T6zZQVQ0+f
	G9wM+i2NXBK4Kxl9kTUIHEleMuKhqnfGz060Z0rEi9y1tYhOgMjooZeT
X-Gm-Gg: Acq92OHdywDZYsYcVKwASsBzknn/JPoMkuYaLB1Sf4K1BTi22q10CKOE0eqZF6vf98x
	v9ZrOZ+i92vzol4Ba/30C+IJY6INLuewB2dO6ZN9akoI/ngYYB8EG5InQlYnbTkFGpqqv83/36v
	uefAibZNEpwLrZKS9u6JUk/0kGQ0jpVqSj95bLprNNsT1pDFuE9o+ZT1T0PG4aJzAgYrVMbENES
	jYLYYedAw3jggBdU87bjYH+0U6kpMKE/aL6Hgqr5N+i+KkJcdcPtcDRRpov2lPm4UQ+SygQX/Py
	JDMk7ru7C+4LoWlAB2HCan7TYcPxHWgoBT9o7Ej4RIDOHkf6r7ZVZj0hn6lN70XPWVy3fYgb7hO
	SW90T5tS8nDaPg2NWKbcllSg8HNZIo0yZB+3Vb5EDPeVuApT7HjQJrKWu74N7rHU6hN5zc79LKl
	EHuYtPJugnWEkN2/qcPNwxK2GfgVQ=
X-Received: by 2002:a05:6a20:d818:b0:398:bda8:d8cd with SMTP id adf61e73a8af0-3b783b3e3e4mr9852452637.7.1781394039406;
        Sat, 13 Jun 2026 16:40:39 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434aca3041sm6041307b3a.5.2026.06.13.16.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 16:40:39 -0700 (PDT)
Message-ID: <6a2dea77.01c4f138.336eeb.a256@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 07:40:19 +0800
Subject: [PATCH] net: airoha: Remove dead MT7996 NPU firmware declarations
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_164040_486832_43C892C6 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Remove the NPU_EN7581_7996_FIRMWARE_DATA/RV32 #define macros and
their corresponding MODULE_FIRMWARE() declarations. Neither the
en7581_npu_soc_data nor the an7583_npu_soc_data references these
firmware names, and no firmware loading path in the driver ever
requests them. The only references are the #define lines themselves
and the MODULE_FIRMWARE() declarations below.

Keeping dead MODULE_FIRMWARE entries causes modprobe/udev to attempt
pre-loading non-existent firmware files, generating kernel log noise
and misleading distributors about which firmware files to package.

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Signed-off-by: Wayen <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 17dbdc8325..93095f3894 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -16,8 +16,6 @@
 
 #define NPU_EN7581_FIRMWARE_DATA		"airoha/en7581_npu_data.bin"
 #define NPU_EN7581_FIRMWARE_RV32		"airoha/en7581_npu_rv32.bin"
-#define NPU_EN7581_7996_FIRMWARE_DATA		"airoha/en7581_MT7996_npu_data.bin"
-#define NPU_EN7581_7996_FIRMWARE_RV32		"airoha/en7581_MT7996_npu_rv32.bin"
 #define NPU_AN7583_FIRMWARE_DATA		"airoha/an7583_npu_data.bin"
 #define NPU_AN7583_FIRMWARE_RV32		"airoha/an7583_npu_rv32.bin"
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
@@ -822,8 +820,6 @@ module_platform_driver(airoha_npu_driver);
 
 MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_RV32);
-MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_DATA);
-MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_RV32);
 MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_RV32);
 MODULE_LICENSE("GPL");
-- 
2.51.0



