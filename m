Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6224F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TrYk4r0F;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0wOxpgL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bHMBIGjV7agyOHt6Hp+nP2PIEn9rwDtlyNv8Pqsbru0=; b=TrYk4r0FxBrS+DR9a4HFiov5gh
	ZLk/z2XUKLR3WKx8jNqnDkCFHirBNkwN6ixi2eqegtr1C73bIb1jvqFPusNa1fgt8ohyUmy0XUlne
	EfH7hVbjX7NfmeCQ3IQh26xqQy6K7y/w6B39Rln/0MyBFBXYL3Xyty9kgG6vD5b1jynsRkH3REh37
	b6NuYiQxv0V8pbvSeajeosRjHf6VOUcUtNtJXmZDFEYxBunpgyT6kAimKSQctyu2B47pvHb0WuqAN
	nyxd8v6135t6rT2NnxtbOgIdi8kZK4+LVckuNTAFYRb7QDWmIMB7i71VLHv0jA8Wy0La88r6eq+HI
	9mRuFDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWf-0000000EvxG-3iTk;
	Sun, 01 Nov 2026 21:55:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWd-0000000Evvn-3Ghl;
	Sun, 01 Nov 2026 21:55:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4716B43955;
	Sun,  1 Nov 2026 21:55:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570139;
	b=tspgNHlUOqkn0Q+g8lZwTO+BIfdyuDje7G4iRX3Z6jaX7ZAeePWPyp8fifkQM6Uv338g
	 UonEC0oGwV57bwlbynw+kzORKNu0y8Wnt8oPdG17XGn/oKeqpPOX2Bz2SVSXvsncjOOfG
	 HvUL8c/fie3LNHuKlA8T9qbctMDMZkfMLRgfDVxLKFEtXev9ElV7HoJpb5hQ388PmdJ9R
	 Al2OTOTlQ1KlbADA72I3ogQWfJHgaGxdVzicNYOAsYtlkFmPTPDaM/LE0TyOWeWyT/Vmo
	 /t0gTgP+EYBmCkBN3SvMKoTpXvSGBrB+4KhfuT10meg8PWjkMP9G3g379powY1Zh00g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570139;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bHMBIGjV7agyOHt6Hp+nP2PIEn9rwDtlyNv8Pqsbru0=;
	b=En62+SjF4lGhhi9N9NQtWLJZiJbcDaXnv/gsdFLt59FEvgNMRTrIY8fz4NjYL8YxPQEV
	 6vqo3w/bky/kpDjt3I9zfaj/vMbHWWA8kZ7W6ZAuVU1WTp5046WPvzEP/y0FiJJaR8vlE
	 BhLexZUgbgjBFJNp4aAGIgPoCWD9IAj+/Iehr4LhwxglCg9WYAU0AqPlX7PVCtREsTjuH
	 QybjEKu/0TwzmJZ3uThvZA9N2Q39219+hzfvpEM9IS8tqv+KLvIcQhjN3ncQew3NICiwk
	 /JMbS7fd7Z1Js8WV+mhbddr+tJch4o7HPTo1mII46YgiJYi4BJ+MOi0kPo2/bnE6r2g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8747A1F00A15;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570139;
	bh=bHMBIGjV7agyOHt6Hp+nP2PIEn9rwDtlyNv8Pqsbru0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=e0wOxpgLZhx7YhkIg4pZngj370UV8EDMDhp2JUln1bjfSfqNTLMzdmqSdZGWfjl5O
	 X0Wcg2pNqFg9fv8dfZbNghpSm2wVbV1nAE5P6RgAFm8sOodZOjdTctjpSf2QRWLepu
	 9/zTgsVj35yk7xzdlOfpNbl4c+m6/Ji5hTksOwrYGH+tbTEfutot0A98S43A9neSpx
	 dSc2lF1qsECCH7Mtbymwhij5iA/Pe8qcX/zZrSO1wu4hpO//ZR/76jBh5hfQPdqNlP
	 TMhfh9cpaI5t9To10M+rp7LNja2JO6OLYZbqcDnHdyCyB5cAeUcoVnd0uOcQ3AkyVJ
	 RJOC6LfXpitvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 148CA4629C;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:22 +0100
Subject: [PATCH v2 4/9] arm64: dts: rockchip: rk3588s-nanopi: move
 vcc_3v3_s0 to nanopi-r6
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6-improvements-v2-4-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=3034;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=dWqYao84dXGl0VgSR8rR8KfWQ837wswkWI3lJXw6bW0=;
 b=dbcnAXx4MHqgCRiY/Wc1BZxsJnDEYc3ECZpQNsB9wTo4gqac65FmvMKCzDn+/QMXq7BeiEfFa
 kAsXIdyHObzAgCYtGX2WVnO2bmzodAgP1W3kKrxaDuwhm3xSUDmzzFZ
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joachim Eastwood <joachim.eastwood@gmail.com>

This regulator (power switch) is only present on R6 boards, and not M6
boards. It is regulator-always-on and regulator-boot-on because it's
controlled by the vcc_1v8_s0 power rail from the PMIC.

On R6 boards it's used by the Ethernet phy, and some VCCIO rails on the
SoC itself.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi |  4 ++++
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi    | 11 -----------
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
index 6644d3b72c9c7..6205a542cd1ab 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
@@ -85,6 +85,10 @@ &i2s0_sdi0
 	status = "okay";
 };
 
+&gmac1 {
+	phy-supply = <&vcc_3v3_s3>;
+};
+
 &pcie2x1l1 { /* M.2 E-key 2230 */
 	vpcie3v3-supply = <&vdd_mpcie_3v3>;
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index ac9eebd2b7906..b0892a3c633b1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -48,6 +48,16 @@ lan2_led: led-3 {
 		};
 	};
 
+	vcc_3v3_s0: regulator-vcc-3v3-s0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vcc_3v3_s0";
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
 	vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -61,6 +71,10 @@ vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
 	};
 };
 
+&gmac1 {
+	phy-supply = <&vcc_3v3_s0>;
+};
+
 &pinctrl {
 	gpio-key {
 		key1_pin: key1-pin {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index a47677926a59b..a99e2e60c5f72 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -61,16 +61,6 @@ vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	vcc_3v3_s0: regulator-vcc-3v3-s0 {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-name = "vcc_3v3_s0";
-		vin-supply = <&vcc_3v3_s3>;
-	};
-
 	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -154,7 +144,6 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii-rxid"; /* Vendor provided tx delay value below */
-	phy-supply = <&vcc_3v3_s3>;
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2
 		     &gmac1_rx_bus2

-- 
2.56.0



