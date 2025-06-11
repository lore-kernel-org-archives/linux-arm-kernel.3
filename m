Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E291FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8wENgIyz321IaLPGJJBJsCrpwVOpegVPIbotUoBSowg=; b=daBxE4uhcEh8BNmELX4O+w4YLt
	g5EnGjjeTA+/XoJPZCaKYLiVwf/SP7XfckfabdU0sA+MRx46bIChS3l/+hgyEsTH49YnsBIn4K2PG
	LdqzLOb0IjWmBb2UNowtmqcys1UD8gJ7449viX+jhL7PvXDVr0/Fk4BP1Yy6wbXJiF5DqIxaOi+x/
	SJRLy00a5oOAVJDTRDxxgod7aDPh46iACNJNRWCVcoJjYdbAE9Z/7F//G9YF5Jw/GhW1gI9nGFvhI
	KDf8M2VjY5iTdMVojjYVFCSwLcifr2/c+xp4cP5pwIzP3m0iERXWAO4DqPFsyjtE5GRFCHAzqQCNN
	uXjlKprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRXD-0000000B2QW-1wga;
	Wed, 11 Jun 2025 19:54:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNEB-0000000AMYs-29HY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1BBA6000A;
	Wed, 11 Jun 2025 15:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AD74C4CEE3;
	Wed, 11 Jun 2025 15:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749655138;
	bh=wB4gN/vQqwxjlQjrCtsB7lnBgH7W5zGItspRFqPIMtc=;
	h=From:Date:Subject:To:Cc:From;
	b=g/Hp5tRh1K0/DPlhRjvDbH+NuOiHRZwFtGnWYYH6v89SsCBBbCNvqXZ9/tw3ObEDC
	 RIE2oUjGookLDjWKpZxDD8t+bNE53aEhml5fjxE+bUjd3ap36IUz4cykrmSC4mnz05
	 dT+hK3uu2E+fvy5/mexeeeenmzEHHnU7xX/26KW9PBoAE0puuijBNhgjQWNZyZYi7R
	 QVVgymUDwXixaFVYT0h3SAfNwDalGSsIhppWKVw4Q7qcEgO1k3QaBFg8lWhNP7vIii
	 UDjFHZJpJSuTzC8lM9Tp3wbtqTEJTB04pqGbUUtkLJbes9Oa11bhFMApEk3TafVrac
	 4JTfvUICxw+PQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31953C71133;
	Wed, 11 Jun 2025 15:18:58 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Wed, 11 Jun 2025 15:18:53 +0000
Subject: [PATCH] arm64: dts: apple: Move touchbar mipi {address,size}-cells
 from dtsi to dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-display-pipe-mipi-warning-v1-1-bd80ba2c0eea@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFyeSWgC/x3MQQqDMBBG4avIrB1ILEnRq4iLoKP+UOOQgG0R7
 25w+S3eOylLgmTqqpOSHMjYY4GtKxrXEBdhTMXUmMYZby1PyPoJf1ao8AYFf0OKiAt7b1pnX0H
 c+KbSa5IZv+fdD9d1A4feWKhrAAAA
X-Change-ID: 20250611-display-pipe-mipi-warning-6609513ae5c7
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3299; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=wB4gN/vQqwxjlQjrCtsB7lnBgH7W5zGItspRFqPIMtc=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4bnvHjGqnmsFYtcpfM3uQiaifDP/CVvzX/vUirjh5e1L
 UVTP/R0lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACZywJKRYW3m9ZkZebyHPeMX
 BE6M03PdX7svdr3TLqOjuR4/T3Sk1zD8Mz4VtmI+z/eIP3X7vOt8prbqaVSFcPxylD7B6tTSsCK
 MAQA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Move the {address,size}-cells property from the (disabled) touchbar screen
mipi node inside the dtsi file to the model-specific dts file where it's
enabled to fix the following W=1 warnings:

t8103.dtsi:404.34-433.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
t8112.dtsi:419.34-448.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

Fixes: 7275e795e520 ("arm64: dts: apple: Add touchbar screen nodes")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 2 --
 arch/arm64/boot/dts/apple/t8112-j493.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 2 --
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index e2d9439397f71a93c28b75a7eea589f4bcb3e374..5b3c42e9f0e6776241bf746d3458766e44e3639a 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -100,6 +100,8 @@ dfr_mipi_out_panel: endpoint@0 {
 
 &displaydfr_mipi {
 	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
 
 	dfr_panel: panel@0 {
 		compatible = "apple,j293-summit", "apple,summit";
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 20faf0c0d80927b2e18dd966a61b5507b322c72f..3a204845b85befb093dd470b4280e778c2894b09 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -405,8 +405,6 @@ displaydfr_mipi: dsi@228600000 {
 			compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
 			reg = <0x2 0x28600000 0x0 0x100000>;
 			power-domains = <&ps_mipi_dsi>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index be86d34c6696cb47d31696541266e504cee8ce10..fb8ad7d4c65a8fe7966f5541f24f03a379143cfb 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -63,6 +63,8 @@ dfr_mipi_out_panel: endpoint@0 {
 
 &displaydfr_mipi {
 	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
 
 	dfr_panel: panel@0 {
 		compatible = "apple,j493-summit", "apple,summit";
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index e95711d8337f6cea898e88a3d564caf2c4f94404..f68354194355807dae9b5922bb8aff74da3c29e6 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -420,8 +420,6 @@ displaydfr_mipi: dsi@228600000 {
 			compatible = "apple,t8112-display-pipe-mipi", "apple,h7-display-pipe-mipi";
 			reg = <0x2 0x28600000 0x0 0x100000>;
 			power-domains = <&ps_mipi_dsi>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 
 			ports {

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-display-pipe-mipi-warning-6609513ae5c7

Best regards,
-- 
Sven Peter <sven@kernel.org>



