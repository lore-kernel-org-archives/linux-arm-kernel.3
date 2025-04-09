Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EB4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 20:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=awPxdW7QrOZOE82KuaixkROaCo7nOUdU2biny0ObNVI=; b=E8SPPfRwEZBZtFKu94fyOIAZDk
	6DseZili3uSawn8/llIHL/L71iHd6mZKGphYiqABKA187Erfq5NY+JI0qs5Rv4sV5sQFX75jubn3c
	+7jwMyXL43mpBTro9z90S47hnn3uoO6OhCLiE8+RpfR9YMpuW6yolE5N/Nc4Dfk95bgs4ozw550MT
	5BBzXEW5AN3QqvPOD95fXUTYg8iNOFXJywbNOJ9wgEGyYMZG1NtixLy6EN+YsbNQfXKxYL7fE89ZL
	Csv35jnomLz9AKetc6QzigFUlC3Hy9NdPoeiAzrXBb5tiYgq0QUGQ5XT/06VtJg+fsiu1xiY1+jws
	m6wOwo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cBs-00000008Sr0-2c4d;
	Wed, 09 Apr 2025 20:38:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cA6-00000008SUr-0bKq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81FE861127;
	Wed,  9 Apr 2025 20:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C768C4CEE2;
	Wed,  9 Apr 2025 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231000;
	bh=xJwJ3ShUG3Jlgyn6wMt/Wseu2u4t82y4o7Ga/V6vaWA=;
	h=From:To:Cc:Subject:Date:From;
	b=MKnvLt4cioOilD9bPLdftibKOo/l5OcBBcn/L+Fk0sULUO/YNuPcjArKphQSXG7q9
	 LzlHpAJMW4sxuhiCi3Y1AUM1svhqYxcka9M2Uf4WrTngF1yAzS1z4bKSvSazUb0TmV
	 alOnnLjgANZjqwxTUJ90W+M4aackwzJ6I2tKJYwVPZU63VRVAtSIw2nP8avE0M2FSJ
	 HP4vODCJpihvkkUUhCoaSgKP20mVcg0NkDrca3F/Ct9Fz7fRfNtFf6oifmdvv+t/UK
	 6KgDH5eE2WcSPYCkDTSKim89D4TzswUi9sWhFA4vAME+MFUCNPXY8ESH1K8Xuzcjld
	 Kf99XhzaN7H2A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm/arm64: dts: allwinner: Use preferred node names for cooling maps
Date: Wed,  9 Apr 2025 15:36:12 -0500
Message-ID: <20250409203613.1506047-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The preferred node name for cooling map nodes is a 'map' prefix. Use
'map0' like most other platforms.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi  | 4 ++--
 arch/arm/boot/dts/allwinner/sun8i-h3.dtsi    | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi   | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
index addf0cb0f465..6f88d8764e6a 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
@@ -1225,7 +1225,7 @@ cpu0_very_hot: cpu-very-hot {
 			};
 
 			cooling-maps {
-				cpu-hot-limit {
+				map0 {
 					trip = <&cpu0_hot>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -1255,7 +1255,7 @@ cpu1_very_hot: cpu-very-hot {
 			};
 
 			cooling-maps {
-				cpu-hot-limit {
+				map0 {
 					trip = <&cpu1_hot>;
 					cooling-device = <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3.dtsi b/arch/arm/boot/dts/allwinner/sun8i-h3.dtsi
index eac2349a2380..cfd039840b43 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3.dtsi
@@ -262,7 +262,7 @@ cpu_very_hot_trip: cpu-very-hot {
 			};
 
 			cooling-maps {
-				cpu-hot-limit {
+				map0 {
 					trip = <&cpu_hot_trip>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
index a5b1f1e3900d..fa162f7fa9f0 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
@@ -146,7 +146,7 @@ cpu_very_hot_trip: cpu-very-hot {
 			};
 
 			cooling-maps {
-				cpu-hot-limit {
+				map0 {
 					trip = <&cpu_hot_trip>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
index d3caf27b6a55..51b61f0d2f44 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
@@ -207,7 +207,7 @@ cpu_very_hot_trip: cpu-very-hot {
 			};
 
 			cooling-maps {
-				cpu-hot-limit {
+				map0 {
 					trip = <&cpu_hot_trip>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-- 
2.47.2


