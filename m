Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBDCC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rOxHHSAUSuNc7w/lG1CMaa9WS/XHdtKtefSnIfHOdVQ=; b=4tVjW+hp9KCLEpUl3ojP34Qa82
	gOGFwctR3agqNXxl0A/jMQEocVXIylWat4X+PxonoS+nyek8VMPTEyVBWoXY0+DB1d9d1byF1Xgw3
	+xamPjSBdUP/V4Y/k8uDnynKpm221jlf+YbNmqL5VitIpNOdvJSoxIWRq4o8wtcmy26Stp5cI51tG
	tpUUoe/LmV2mUh5ZCWS5ZsThp+Sb4H4oMOUe83vEAhuEIZisLknDVqUkF2LfmFRJ/0yNMzTFNa4Dk
	NtMqxVzEOxk+Q6Uwy0WLprYCyK9+L71m8cFrKAZy1IB7ZebOD4J8OVXcrf5u5NEo8js/H/jNfry50
	M5pDv/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0wk-0000000FyBn-2pXO;
	Fri, 14 Feb 2025 19:01:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Nz-0000000Frva-2ZHU;
	Fri, 14 Feb 2025 18:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739557557;
	bh=+x+hwGbeiiewIBUcuyA6IeK0Cv+3CNmAHDuMbjvIz6Y=;
	h=From:Date:Subject:To:Cc:From;
	b=FnJ6qMU3StLaOoSe1JuVVdejdtt0RqIDPk1bTxBFNPP0dyUhngVKn9kqDNFKYlq2E
	 c1EEOmz7gTi9JWcSicMlwqgr7TGQMbQc2rDHUqj7zCYrhqLnN9o3LbZBB6gqV4mtdU
	 Zbm8NhvE0J7qGytFx+wCCli69zHhYmb+BfNhuO49HY0IBUCVXFcqclyXBYi6y9Nys8
	 GUJ/apo2REPQlP8MhiONgLcvqvV853LqLw1mqxUtGd7Ctg8ESzkLvX+i0SnE/p7HVS
	 mBDby8L0H1MDAj0JfXf4h5UapUUsLXug3j6Y+YW2T7dBxmShfluNJxI3W71lC3/NxE
	 FZlJogFvF3SWA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F08E417E0FC1;
	Fri, 14 Feb 2025 19:25:54 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 15:25:48 -0300
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Add DMIC codec
 for delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-genio700-amic-wakeup-delay-200ms-v1-1-0094837c62b7@collabora.com>
X-B4-Tracking: v=1; b=H4sIAKuKr2cC/x3NSwqDQBBF0a1IjVNQdvxAthIyKPXFFGor3ZhEx
 L3bODyTe3eKCIZIj2yngK9Fm31Cfsuo/ajvwdYlkxNXissL7uFtrkVYJ2v5pwPWhTuMurETmSI
 3dVMpyuoOCKXMEvC2/7V4vo7jBBfc4ldyAAAA
X-Change-ID: 20250214-genio700-amic-wakeup-delay-200ms-b7b6ae563ee0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Zoran Zhan <zoran.zhan@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_102559_800876_6B04AFB9 
X-CRM114-Status: UNSURE (   8.00  )
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

The UL_SRC_BE DAI is connected to the MT6359 PMIC which can switch
between a headset microphone and a built-in analog microphone. Both
microphones' signals require around 200ms to settle after being enabled.
Add a dmic-codec DAI to the UL_SRC_BE dai link with the corresponding
wakeup-delay-ms to let the signal stabilize and prevent a "pop" sound.

Co-developed-by: Zoran Zhan <zoran.zhan@mediatek.com>
Signed-off-by: Zoran Zhan <zoran.zhan@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index a37cf102a6e928440cc88e7e8fe0225fc28ec962..6c934d70c1eadbc7af3f97af1961e629ab62ab3d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -218,6 +218,13 @@ usb_p2_vbus: regulator-9 {
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 	};
+
+	amic_codec: amic-codec {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <2>;
+		wakeup-delay-ms = <200>;
+	};
 };
 
 &adsp {
@@ -970,6 +977,14 @@ codec {
 			sound-dai = <&pmic 0>;
 		};
 	};
+
+	dai-link-1 {
+		link-name = "UL_SRC_BE";
+
+		codec {
+			sound-dai = <&pmic 0>, <&amic_codec>;
+		};
+	};
 };
 
 &spi2 {

---
base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
change-id: 20250214-genio700-amic-wakeup-delay-200ms-b7b6ae563ee0

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


