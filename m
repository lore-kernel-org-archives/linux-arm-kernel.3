Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3372CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=phOTkO8Gp6UOyxxexRbWZlNYnHe4XUhUoNN0wC8w1EE=; b=LiAJ+O9iBxG+pMwNF6kdXu+WAF
	vIoXX0WsAsY7HBjUQHTpyYWBKlvrESfm1LwAc9rlUL5+xMM7t7JfAugROxyH9vVD68qb4pmpCti00
	vqmboRWBIh7YIfHgX36EuHtN3go3vhrh+FseDt+Qtj/jNCpFpGzmYPhZOOrVnI/Z0yRm8yr2N2Aza
	WdJZbqipN9xIdhpGM5rUtJNwiKaWRILL6DpenDvnthMGXq1UnUEVwhu7B0oKqot/nZMt3n8++f/U0
	Ys1TITcxXbVpF+3A9ggGtejLHq9ef5K+Y6uTVsfNKih6G6GN+zwj4OVqQ220v+sGYAiq8dgsVMdry
	7Qbr2/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uur10-00000007fL3-2kRj;
	Sat, 06 Sep 2025 11:23:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuqyC-00000007ejQ-1ZJ3;
	Sat, 06 Sep 2025 11:20:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso19848385e9.3;
        Sat, 06 Sep 2025 04:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757157634; x=1757762434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=phOTkO8Gp6UOyxxexRbWZlNYnHe4XUhUoNN0wC8w1EE=;
        b=B8XGHph5hrCSQMoZbFln3bj4kQkJK41TZtncZyjWNhrorc5pzKE9OwvASISPjmr11G
         E+mfokwlp31R6a3/ivka2AXEj6WP8GC6CVqdhUduONNSpLp5A6ny3CfRC1G5GBpZaa/+
         U4CqbiJQ7gOA9N/SG/Uzi5MTnYKdUdxSNS5hpd5dIbUkCR2azwamCCv5vr9ab492lucL
         3ZJT09w4Ecf/Dn0oclnYrSXaemQIkzoaSPgnAuV/PpGtAOtipSRu4cn1ArezyWcrNLK2
         0+zF1HS48btXwIIkHOtrBsXIuRAwiGIuZLsLQSpGw0akfdwJgaKNFGfmG4wyvY0OSTdt
         Q0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757157634; x=1757762434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phOTkO8Gp6UOyxxexRbWZlNYnHe4XUhUoNN0wC8w1EE=;
        b=dsvnzTW+WZwt8HAtQbVSU949VTbfKn6z+8+dJiAoAGtxeYR9zLc4dxtoBmC5+SltJL
         0y1GrSc7WBIJRHqb/h2k6EfHxATY3+MYZpbmgAuLlHiNUEzMDa3nq0+/U26lW9Knhu9M
         yy9uf6Oveblab67KetDLO+I/ZBGACjCGb/RAXWPg9GLq7L2O7hhuuTuUCD5saZ/rFaWb
         mbHnf2o0lOsgLQ/202EH7K71NJeEkBOZbYJ2WyD/b/lhnncLYbGWuz2BD6vpVLJC5LBS
         D1aEWIlF8kj+Il2LqAlSXCBEzv292qHiGu29o9P1LkAVGzKE1Wc2mIm6t6TZRAVr/TRW
         vZvw==
X-Forwarded-Encrypted: i=1; AJvYcCVwJHh1iV0n2k1Hg2OBXgV0X/Kuhgm60GAFy/sG7SNRaJG9Vayr2YpY7mCD4qj85TD9nTaDoG/wJOEYin3l0kI=@lists.infradead.org, AJvYcCWtlMyJ4oSnyT3aSD/DXcCDZTs+ilEoT0CFWrWNiczjGzGIHtOM5Nc4NH9egXCOKTfTzj+zVQX4XiP1HhHdjwf4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7iE/iqpjYAdYjZUbIL5CwoAKH3cQT7Ye4N2AXFbbcQm1gn3a2
	3ivHA3Czz7QrmIylVVWC7CW4pjATdiotnhYwGK2ubPMpbNf4bFgiARhN
X-Gm-Gg: ASbGncs05OJ/3aw8Gric+tODjQd0RJrCFL89tEc3KMa/30HpkEqrGkuB17bqEwIfSeA
	zQdvEhrP4tcUjkBGONO/hhqL2sTI5zY6HAUMxg2QQkNaz/pSed26tLYUeH3RXfu5EkV1eGaiS7K
	bCstuecacl27gmKssks0eIGs1/oeNKI6i28tlnI7jF4/mMK7/hiE967v+sWplbDpOrVjSzHvQrQ
	7vOruEMW2VAy+oUiiy6kwMmvDpZ7wC2kya89WfvDYTWgTaEyuG+oZmuBFQrtTXjrUM64iJtCMLM
	sjjOZ6w86IlzA4SFF7seNGxAOmqbKC3v385WoaDNtvvDLgNE6m8TVVTZeexbFTCd9UkxFTl8KB8
	W2fo0u1ezpU+cvGiNDIHC3+/vf6NWCQUXfT0WoQ==
X-Google-Smtp-Source: AGHT+IHT2DCsTdLyK7hMXnyf7nuV8L5ZvBVobCadVxozJnday1OLD/JOCxtfevqmsVo0tPUhkWbrSw==
X-Received: by 2002:a05:600c:3516:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45dddedde1amr15969715e9.32.1757157633669;
        Sat, 06 Sep 2025 04:20:33 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de18f4824sm6646655e9.10.2025.09.06.04.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 04:20:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: rockchip: add GPU powerdomain, opps, and cooling to rk3328
Date: Sat,  6 Sep 2025 11:20:29 +0000
Message-Id: <20250906112030.1829706-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_042036_422162_7561B22F 
X-CRM114-Status: GOOD (  12.02  )
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

From: Alex Bee <knaerzche@gmail.com>

Add GPU powerdomain, opp-table, and cooling map nodes for the Mali
GPU on the RK3328 SoC. Opp-table frequencies are sourced from the
Rockchip Linux v4.4 vendor kernel while voltages have been derived
from practical use and support work: keeping voltage above 1075mV
and disabling the 500MHz opp-point avoids instability and crashes.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes since v1:
- Use opp_table_gpu not gpu_opp_table to fix dtb schema warnings

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 39 +++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 6438c969f9d7..01ed2bfa7ee1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -331,6 +331,11 @@ power: power-controller {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			power-domain@RK3328_PD_GPU {
+				reg = <RK3328_PD_GPU>;
+				clocks = <&cru ACLK_GPU>;
+				#power-domain-cells = <0>;
+			};
 			power-domain@RK3328_PD_HEVC {
 				reg = <RK3328_PD_HEVC>;
 				clocks = <&cru SCLK_VENC_CORE>;
@@ -570,9 +575,13 @@ map0 {
 							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 					contribution = <4096>;
 				};
+				map1 {
+					trip = <&target>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <4096>;
+				};
 			};
 		};
-
 	};
 
 	tsadc: tsadc@ff250000 {
@@ -651,7 +660,35 @@ gpu: gpu@ff300000 {
 				  "ppmmu1";
 		clocks = <&cru ACLK_GPU>, <&cru ACLK_GPU>;
 		clock-names = "bus", "core";
+		operating-points-v2 = <&opp_table_gpu>;
+		power-domains = <&power RK3328_PD_GPU>;
 		resets = <&cru SRST_GPU_A>;
+		#cooling-cells = <2>;
+	};
+
+	opp_table_gpu: opp-table-gpu {
+		compatible = "operating-points-v2";
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <1075000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1075000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1075000>;
+		};
+
+		opp-500000000 {
+			/* causes stability issues */
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <1150000>;
+			status = "disabled";
+		};
 	};
 
 	h265e_mmu: iommu@ff330200 {
-- 
2.34.1


