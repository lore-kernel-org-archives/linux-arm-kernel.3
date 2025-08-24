Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E66FCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpMC3BrM1uIB0XbsX1fqE/ZITuthT+QHhc9H0DCFYDU=; b=PJKpAIcYv68JeDJ2n0XC9GjrKt
	V/uveSxDl2mD4J4QjwTj7MiZCMJTV0zMX2bUncc3dEmZA/rXljwgKdpEOaetVRVyl38CJjxVTFEv4
	7XnmkHO1SQow3rRakIubJDQn18eAwVx5Rk0YVbPb7AYtbF4PeRdafi3pPArqFooTyWrqafk9tEsvz
	Rla3y9ybmJcnaaf2YJNXepY6HFsCyRFE+JPGtpDscI2aqe6QHP/sbWi6bnLpZllbH1TpnvUH8Ps2q
	o+PBxhaqn0ULZtsQJaZOKod6YUUqcq+FRSlW30PBpX/orKBvb9siNen9TWT1kSZOGkGW7piFTYCFr
	GD06W6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8kT-0000000642c-1ImX;
	Sun, 24 Aug 2025 11:18:57 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8UF-000000062NV-0MJI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 11:02:13 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756033284; x=1757333284;
	bh=XpMC3BrM1uIB0XbsX1fqE/ZITuthT+QHhc9H0DCFYDU=; h=From;
	b=bXRStTSjPngcKJy7ovasYiZxGDbWwFqFjxD7iCJDgaYdEg2czS3dN9Xwq17YhZh94
	 LdpKiMYPy9/2x75MYkbmijSSQZUrU9r9fYu5uXS6M4AmVSgF5v5aBtl02sjXFIwqF8
	 43YlJDgh3l0/Wv9PMgV5TdZkKpDwBXhHnhQ2OYSsQ4PoGnFJDkemrPVHqXHxILVl6D
	 3iRpkoGXsxGKh5DIHx/t9zLMy9hMuVKHDQ22lUEvm133+5zScxn6QuQ47XZ7KIR8It
	 gHw/PBFLLEHK6bptL9cTxSHwgJnKs/KrLAT0LF9RFZfs7clzEApjUXlSI5HaXEKvnN
	 rwfEun+gfal9w==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 57OB1N4a083637
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 24 Aug 2025 13:01:24 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: linux-mmc@vger.kernel.org, ulf.hansson@linaro.org,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>
Subject: [PATCH mmc/next 2/3] arm64: dts: samsung,coreprimevelte: add touchscreen
Date: Sun, 24 Aug 2025 12:53:44 +0200
Message-ID: <20250824110039.28258-3-balejk@matfyz.cz>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824110039.28258-1-balejk@matfyz.cz>
References: <20250824110039.28258-1-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_040211_718101_815C4947 
X-CRM114-Status: UNSURE (   8.56  )
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

Bind touchscreen for the samsung,coreprimevelte smartphone. The
downstream code sets the VDD voltage to the exact value of 3.1 V,
however it's been empirically verified that the lower bound used here
sufficies for the proper operation of the chip and is thus used for
power-saving purposes.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 .../mmp/pxa1908-samsung-coreprimevelte.dts        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 240021e7a371..834b2cf1a204 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -312,6 +312,11 @@ pmic@30 {
 		wakeup-source;
 
 		regulators {
+			ldo2: ldo2 {
+				regulator-min-microvolt = <1900000>;
+				regulator-max-microvolt = <3100000>;
+			};
+
 			ldo6: ldo6 {
 				regulator-boot-on;
 				regulator-min-microvolt = <1200000>;
@@ -329,6 +334,16 @@ ldo14: ldo14 {
 
 &twsi3 {
 	status = "okay";
+
+	touchscreen@50 {
+		compatible = "imagis,ist3032c";
+		reg = <0x50>;
+		interrupt-parent = <&gpio>;
+		interrupts = <72 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&ldo2>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <800>;
+	};
 };
 
 &usb {
-- 
2.50.1


