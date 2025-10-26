Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C48FCCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 18:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thIl0eoythKb01PWr+ANwhU9Ff6R4yl+rTHFbaUTblI=; b=dkGN6ugF/KmTy4P+TaEggxa5Pz
	kpITBbadvXL/4Q3mjBY1epyzgNNAnqF4YXKxTz9msP7MDwfM9CPqXfR5Pkz607lxgFm6a5ltC3spP
	UWpFdgauU0rnxUPA6bUtAqa+kRSF+C/9O5DGzkhT7sL6hS6m9gUBcUoUseKUDKLLlgHU0uXU1IU2v
	Rh08Bz5r9IZwJxGZVTvjiq4CkWp1fO7+yo/oRkpcQKMb9d7rzET1m8BLjwmFQfxzi8TfWnY3EAoGU
	WcA2gWva92SBZyKQei7jIw7JPLOAyoZNWFPCDAAoWED/iHwNqL10YQJOf5sklcsxgQsZ/HLC4ae4O
	yei2j3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5TA-0000000Cd86-2zGe;
	Sun, 26 Oct 2025 18:27:56 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5T3-0000000Cd5I-0c4K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 18:27:52 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1761503228; x=1762803228;
	bh=thIl0eoythKb01PWr+ANwhU9Ff6R4yl+rTHFbaUTblI=; h=From;
	b=Alvj1afza8dYCwi0s/dGQRKNnatbHJflZbyYAYLJg0iaHsYdPTg3Ak3CnTSa4Mj0T
	 H7D49mQ8BjVd6krsOK2qcgoUc+ziHnYRt+izW8yW5fOTXibom0SCSpm5T8R+lez2wG
	 IH+5VJA0oCzOJikDRjHyosg72fInAPlXBsxFcGOlsemuBl4w+5/qAhGjowantpx9Nt
	 4bbE3S4MQwnMaQBd1z/FRxlpSFbfr+lyJyfPOiogPMx5p/QPF4w4FsIpWTMybkc9+1
	 mgO4TnvKR32d8Bbl9mpwf9iyFCHyr9+hCHs9VY70agWF1DWPTFUBAutZ6YDA5NVFF5
	 Y4GCS7skZiphQ==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 59QIR6Wb043073
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 26 Oct 2025 19:27:08 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Brian Norris <briannorris@chromium.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>, Jeff Chen <jeff.chen_1@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [DONOTAPPLY RFC PATCH v2 4/4] arm64: dts: samsung,coreprimevelte: add wifi node
Date: Sun, 26 Oct 2025 19:20:41 +0100
Message-ID: <20251026182602.26464-5-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026182602.26464-1-balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_112749_812798_E9500032 
X-CRM114-Status: GOOD (  11.21  )
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

Add a node for the phone's WiFi serviced by the Marvell SD8777 chip a
communication with which happens over the SDIO. Also enable a regulator
without which it is not possible to connect to networks although they
are discovered properly.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 .../mmp/pxa1908-samsung-coreprimevelte.dts        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index b2ce5edd9c6a..36d6ae4e902e 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -475,6 +475,14 @@ ldo14: ldo14 {
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3300000>;
 			};
+
+			/*
+			 * Needs to be enabled in order for the WiFi to be able
+			 * to connect to networks.
+			 */
+			ldo15 {
+				regulator-always-on;
+			};
 		};
 	};
 };
@@ -523,6 +531,13 @@ &sdh1 {
 	pinctrl-1 = <&sdh1_fast_pins_0 &sdh1_fast_pins_1 &sdh1_pins_2>;
 	bus-width = <4>;
 	non-removable;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi@1 {
+		compatible = "marvell,sd8777";
+		reg = <1>;
+	};
 };
 
 &pwm3 {
-- 
2.51.1


