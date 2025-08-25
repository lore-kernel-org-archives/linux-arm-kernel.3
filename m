Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AF7CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIWXtqAycbzhe4Sr5Ts/vyd9th8G9u/Hp7QGpaPlOCY=; b=Q+trVUIueLaz/yvt7K5cNAxxeO
	33jWAmwmsQ5bErvYKLStYtnu9KLx54yRN00yeZHb6oGFGZ3KRD2C23LZAF9lFgIYj5p5MNPAXMXVU
	b/ZbygkEynzmzd1CiaVuagUI/PAifJBA1M8Gq3Lw0rbhMeTgg5WTXF8i8ZgTduzRSnjSEHHYvLryO
	FelUDFdhvngjpu0HYCEpn3OTYlSO90yEzMF+BNXN14Ha06JveFuZKv0UPP1zRrczWyd9jrsLh5G3+
	dGpJ+KlWpAjrjOVK7QRA0ITuG4BlBTbhknWuWqAEuphavlCt8N5opjtEOnkSUM8643XQAfpg5OHjY
	d2rUkseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRLt-000000078LL-0xW0;
	Mon, 25 Aug 2025 07:10:49 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR4i-000000074kU-3kYV;
	Mon, 25 Aug 2025 06:53:08 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76e34c4ce54so3284845b3a.0;
        Sun, 24 Aug 2025 23:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104784; x=1756709584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIWXtqAycbzhe4Sr5Ts/vyd9th8G9u/Hp7QGpaPlOCY=;
        b=AtrI0blbnrLs0Jw+WmSZASP9Z88J7vfULgFPfXMDfF+W0ef3wK3VSTrLPqGeNPnwUm
         ScQg13gJiRDITkDwcddIHCNYVLsDbM4B3gkPmLW+iAKQqEhUd7lxZB+LEPOYjcnqq3g3
         Jv+u3VQkmyyOfmvEGrKorEb1kCW0futjr51n7I4jT1KdyS47DpCBLL5LNn7j3on1tcP9
         DT9kk1Hk8s4mUY4e+XKipig66NxBSwoHM6f8ZN6Fuv4el/bHfu4wUJhzTI4os3THZW91
         plHJd5sQf+3TyMp4QiBP2Q6lQzz15J6Px0G0fgPGEbiXG2eUdUB6bi26sZ9FopqMqzjE
         h99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104784; x=1756709584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIWXtqAycbzhe4Sr5Ts/vyd9th8G9u/Hp7QGpaPlOCY=;
        b=nwHiWXB6Y1BBf2TStrBUvuO48aDDzjYHahf5xuYMC55QNxl41DhNX/KpN4HEzCEgBu
         5PmGdcScp3NBgg+yJU5KFSFHjws02dxDAkdWTUY6TA0/mcY4xFbsaWrUvn04J7GdiJRy
         zEHW4G/LYi7KSoQRkzKwtIMlN28AOlRI3mpeKOrKSawvp7XHagnYh8Ze/WP8DMtOT6zU
         uHAUEG8CU5bL0zs1x0WujpiDH5CrJrYoSnDpRAZDv/8W6b6yjyhPRZb2o3C8CcE9qBYa
         LIsgU5QvT70zBUVkwobzVrzMu+mvylg7Dqvad8EX5gvrFZSk98PMl8IM6XbS2vA6TE+S
         XN+w==
X-Forwarded-Encrypted: i=1; AJvYcCUBHJCTN4OynZecZC6E63gix4X0bndcM/3yqTleOIsLpzXQPUy6M2YDiX2vN0TPAo5WqOClztApevwQHLl3@lists.infradead.org, AJvYcCVjQtimeemxMHBRPEJjxunWdnM41XZlwctUF4Ef74XQ4JKbcvUn1+RDpq8RCC1BYPKRrFQmQRGuqufEXsuXVNPduw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAZuC/hAxFMhb1/8RCi6lFjLBjxbBL6HkB2tD8FGuynMbhMzY4
	OWz21H/mhtlNfeLaCJWtixObwFhRZpMlbDTDIxJwbsCqS0K4LM2KuaCz
X-Gm-Gg: ASbGncsabRBG8ks/lBqHqBmikAC6I/G6HJwqUaEvXuAeSEJq0Yo0azym5W5X/Ovpe6L
	ZFYnWgLPlyEddzKaBPTsb0R20MrYPS76TJ5wU8RyHTR/ne368IicgM7swNMznRmGW1EkynEGYiE
	NwofUPaRKqXqhgfZp0GJR+cjP1np7WLcLQ9lg5ek+fudbDhIPBJmVB1L+zcWnOVCzwBF6VMmzb7
	zdj2VElquI95iRYgOdhfSq7/AU2naa6/Xv7domzn/cTj0HzwO/XAO7T7Ty6BI74CTfGHKA+TKae
	8FobszWVVvkFj9i45KdlRjPgSsSiDb+GI4DlbeLxXEyPSP9AzoN63BDAWkmd8ECkzFSMgN1S/fY
	9bCOvIEgJ1iZu/7/P2PgxniF0lDxxZC8=
X-Google-Smtp-Source: AGHT+IFajvwzq6Qo3npfwFwSekJ/XSu0iCw1ahqWn11zFaTmKTFkPXUZL0TSPeczoZ04P7j1uIIcFQ==
X-Received: by 2002:a05:6a00:3a0b:b0:76e:7ab9:a239 with SMTP id d2e1a72fcca58-76ea311ed45mr18401779b3a.16.1756104784032;
        Sun, 24 Aug 2025 23:53:04 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:53:03 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 02/11] arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
Date: Mon, 25 Aug 2025 12:21:42 +0530
Message-ID: <20250825065240.22577-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235304_930892_A44D4A5A 
X-CRM114-Status: GOOD (  11.16  )
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

As per S905X3 datasheet add missing cache information to the Amlogic
SM1 SoC. ARM Cortex-A55 CPU uses unified L3 cache instead of L2 cache.

- Each Cortex-A55 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 256KB Unified L2 cache.

Cache memory significantly reduces the time it takes for the CPU
to access data and instructions, leading to faster program execution
and overall system responsiveness.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 966ebb19cc55..e5db8ce94062 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -55,6 +55,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -64,6 +70,12 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -73,6 +85,12 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -82,6 +100,12 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -90,6 +114,9 @@ l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x40000>; /* L2. 256 KB */
+			cache-line-size = <64>;
+			cache-sets = <256>;
 		};
 	};
 
-- 
2.50.1


