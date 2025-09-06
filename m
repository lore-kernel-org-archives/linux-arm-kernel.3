Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA85CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D8Mr/6zv4AcMMEkuwvT+ySaDwWnup/zkHcnhD+HTewc=; b=hDK8DePFrhF6TX2yan5NeUUJV4
	OaPWrGEtRoEayYfTgN0t35WUNGX1/PvrhKwOovXl7gNay2YgP7xBckTzfkinNWR1UeKDy9vSlLbOc
	t9ozLkqa46e2EGBQ1e6mkz0sjKGg6PpMUchcO4M96dPSdfJu8XFFQIW//PcoWOHPmdU9Jbw7uyVxJ
	3nY6ds+yroe0VMCNNGiCeqahUTGFBm4TUort1Wrn7BuXfzrBNXBAONHzKkdiBjetgtBuCddyHIFrD
	4+Ngp/OPIOVCBMYagDkyJ/86TpboPXCW9tylcPmpkbyu484pUa5M3H6+LlBLA+1lH0kd1FxxJmUYT
	fdy+N17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uurlg-00000007juJ-3lFX;
	Sat, 06 Sep 2025 12:11:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuriL-00000007jcV-3Mt3;
	Sat, 06 Sep 2025 12:08:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45de2132c49so156895e9.1;
        Sat, 06 Sep 2025 05:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757160496; x=1757765296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D8Mr/6zv4AcMMEkuwvT+ySaDwWnup/zkHcnhD+HTewc=;
        b=KGwx3yaqw71wMpg5o8mjmrfujw7Hpu0693QF7R7M/sop/fJu3IrTXRa0Qc5JApI1ek
         wjcYBcXHDo/Rp+SyG4Apr5Mq47fxd7jn6C1Z0c+tJtFwCHONmXP27KxiQpPgB6Lu29Is
         arAs4BnCPckwxMTlVvOf7TFoSJXVAGEXAVNIaLJfnl0lI4z//T+fmjJUnV1mmwpzrZVZ
         REHhOZmKx/yJhI9vLoNGSDgSpVzXUReqkxoz5X3HD0NXOLV3fHQ0kWeSA0AieVQT98LT
         OA2bEr/75FYiDcMrKqcZ29NmsNI7dXT3sCQL8yVsZFk0CA7x2y5DhV7Ny1g+2N9+sEdN
         smbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757160496; x=1757765296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8Mr/6zv4AcMMEkuwvT+ySaDwWnup/zkHcnhD+HTewc=;
        b=twVjumRt6fJ7y59zCUJ9bUEA7KU1YNzI9LxJZeHT7RKc1ePq1qtz0JlAPeY+bevCIR
         htd1fSWy432KBsAxIhM1UEbYHiax5mtvylrrS63V43Gg6GeZT/UH64fnohTw4uSKjXtX
         HuOLG9+UJb59c9IulwiPHtxb/npJmXCBsMGT66BNhjZ5jDYe14p4A5L9Z/04MiZYRb+T
         q+TFUa31kPX1QnWV+v3pP1FjtoihT9xkNG52asojEZiQl9+5JB8PiYp7VME5g4QELw6O
         J4yUdm4DPUowbr9cPEvDLEYtZzDXw6YqDzs/bivTk/EwDdUV7Yz0Y75QCJooI+2wLGSe
         1Mjw==
X-Forwarded-Encrypted: i=1; AJvYcCV544k7ARg6sBSha8QblrFPPYDCajYmwP/rCZg2SHtyrEKtq1La5XxqOuj8TGaHCc3LoRKlyEZk3WeI0tNXV+c=@lists.infradead.org, AJvYcCX6y9BgcM9VbpJg4OcG6XVyGZcIO14d1P4eIN91EymU+ZUwCNArxu+g9tD4E4W0Ui9ZDAZfoeYh2AHOhxfg9H6A@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5LsjoPPGg6JxanErN2aHOiHw6iYPBf86ILxDf96zngtDSuM1g
	c2/rKMc0KWisaDjcP4M0NsJN68qpTXXRWQLHHcnll7hmcZ6CZe1OnMCW
X-Gm-Gg: ASbGnctHuoxsSuG71eMyvymEqh49JmRJU64UoifgHyrBX3nL7XPjvxR+hYPVrQ/UpmZ
	xmYHoK74aXHW+S6xACSjM7PC86jcgkEsnZAbaJDhHutkIIi0J5DKsIQltuQemLKmf5kHRi2Na4q
	OhBjcKl+1vvW/GvbaxetSCINM5mfuuft5yFDZ+dPb3bsxjoxn1JQ8idQSNS3bqMRu/QYg28yWfy
	jFBcBe52EkmGYdpYV6fIGEEriVAJYIBlWSoM68yp4mVQfil84Prwu/XbdG0vOuAKNXFTGILGIbV
	qWlFA9vDU4k3IKqNkSP+2Y9wVqhC+c7Azv1xnyqb4uQRzUXloABfS+pg592B9obqH4uGgWeqw5e
	VgAieFsp5AeFFusrKCTDKe8rrewHHMdnHWFvMgg==
X-Google-Smtp-Source: AGHT+IEGnMuR1OcLq5hi6KejZJYg5UBBpTJ9CwU7pKvWahTivnfLTRqyzm4V0K2QWcSXvSQ2S/JUpw==
X-Received: by 2002:a05:600c:8b71:b0:45d:d903:beea with SMTP id 5b1f17b1804b1-45dde034574mr20619905e9.30.1757160496089;
        Sat, 06 Sep 2025 05:08:16 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd058ed5esm60978455e9.1.2025.09.06.05.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 05:08:15 -0700 (PDT)
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
Subject: [PATCH v3 1/2] arm64: dts: rockchip: add GPU powerdomain, opps, and cooling to rk3328
Date: Sat,  6 Sep 2025 12:08:09 +0000
Message-Id: <20250906120810.1833016-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_050817_863347_62DA2CA3 
X-CRM114-Status: GOOD (  12.25  )
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
Changes since v2:
- Revert to gpu_opp_table but retain opp-table-gpu $nodename
Changes since v1:
- Use opp_table_gpu not gpu_opp_table to fix dtb schema warnings

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 39 +++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 6438c969f9d7..610c1c27b798 100644
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
+		operating-points-v2 = <&gpu_opp_table>;
+		power-domains = <&power RK3328_PD_GPU>;
 		resets = <&cru SRST_GPU_A>;
+		#cooling-cells = <2>;
+	};
+
+	gpu_opp_table: opp-table-gpu {
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


