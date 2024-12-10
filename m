Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E97E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 20:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+CcXLld0h1DLrJWltH+iGK5AUXiVFw8rQywDEbdIw8=; b=TdSwtzjYpHFiPVHcetgQMAnUDh
	0ciwt3bFANSF7khTn7gsVn/ynoOcsCbDBpCK1ik3gv+jD7hijNEiDhlzIQbN9c37xC/XY57rXPAm6
	Zesl39BpXzyOM3co/aRWDrsYcAH1z/BgYetwTOeIyutUpHYdQk4OVQ+YB2Npbbp17GnkOE9e5oi0W
	ju956Jfv/jCFYQFHhL4hfu0gM3hBggm25zsl5Emsntfv8OZHHp8vCjoN+rNmNFz1OUaQjdlcgUCBK
	xxP8ji9yWoLgTa2yKuALEzmKBMkUreU2e30RW7Scv+QuPQpawuwdW3DIERDQl03fDjlu0nLEvgikz
	WROah5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Jm-0000000CjxB-0SCp;
	Tue, 10 Dec 2024 20:58:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Fx-0000000Ciwb-1Lze;
	Tue, 10 Dec 2024 20:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733864095;
	bh=LqEkimeRIC2RS4VpxiR75y2hmkC90M/mOqKrUkHY3Qk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GhhT67clcJoTkt3EMvN1kfcyptYhyav38nirR5fIkZTbc2S1WIb5msNnssy5PGuj0
	 6va9Uu7uvzUd5d3hI+Xm4xeqNTkRKg8yWNC1mn9CLu+dzRmJqUdKfJd/22VfuCo368
	 XkQ02z5kvFmEDOEuulVCTsxy3iEU61Xlpb9eZkEcdBjSFZDgt7jbHav1XMZTLxU2fi
	 gQ/qyez2ApP3Wk9clHqawk7lZ5i7tUnE0WiDqknvkb4UIZjfGnw9ew7Fe5Bmvdo5HQ
	 nMaqdma9p2JYTbcpUmcvHxPYYUZES37X4PZ3F8EpFiCskiOQRwa+9ICYVMPRREwU7z
	 AdCRmyv4eTI+g==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3C5917E3806;
	Tue, 10 Dec 2024 21:54:51 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 10 Dec 2024 17:54:29 -0300
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8390-genio-700-evk: Add
 sound output support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241210-genio700-audio-output-v2-2-c50886ae0be2@collabora.com>
References: <20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com>
In-Reply-To: <20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Aary Patil <aary.patil@mediatek.com>, 
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>, 
 parkeryang <Parker.Yang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_125457_533975_747585F1 
X-CRM114-Status: UNSURE (   9.72  )
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

Describe all the components to get sound output working on the two audio
jacks, Earphone and Speaker, present on the Genio 700 EVK board with the
audio DSP enabled.

Co-developed-by: Aary Patil <aary.patil@mediatek.com>
Signed-off-by: Aary Patil <aary.patil@mediatek.com>
Co-developed-by: Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>
Signed-off-by: Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>
Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 13f2e0e3fa8ab6679f843693230b9661d323a705..04e4a2f73799d04d50476eb1664b1afdbc66c124 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -93,6 +93,24 @@ vpu_mem: memory@57000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x57000000 0 0x1400000>; /* 20 MB */
 		};
+
+		adsp_mem: memory@60000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60000000 0 0xf00000>;
+			no-map;
+		};
+
+		afe_dma_mem: memory@60f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60f00000 0 0x100000>;
+			no-map;
+		};
+
+		adsp_dma_mem: memory@61000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x61000000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	common_fixed_5v: regulator-0 {
@@ -210,6 +228,16 @@ usb_p2_vbus: regulator-9 {
 	};
 };
 
+&adsp {
+	memory-region = <&adsp_dma_mem>, <&adsp_mem>;
+	status = "okay";
+};
+
+&afe {
+	memory-region = <&afe_dma_mem>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&mt6359_vproc2_buck_reg>;
 	status = "okay";
@@ -932,6 +960,26 @@ &scp {
 	status = "okay";
 };
 
+&sound {
+	compatible = "mediatek,mt8390-mt6359-evk", "mediatek,mt8188-mt6359-evb";
+	model = "mt8390-evk";
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_default_pins>;
+	audio-routing =
+		"Headphone", "Headphone L",
+		"Headphone", "Headphone R";
+	mediatek,adsp = <&adsp>;
+	status = "okay";
+
+	dai-link-0 {
+		link-name = "DL_SRC_BE";
+
+		codec {
+			sound-dai = <&pmic 0>;
+		};
+	};
+};
+
 &spi2 {
 	pinctrl-0 = <&spi2_pins>;
 	pinctrl-names = "default";

-- 
2.47.1


