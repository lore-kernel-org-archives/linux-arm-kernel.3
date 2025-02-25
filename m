Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DDEC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxDpq1MTc8T7isEWATvD0EHbxutb1rkwsDjYgWdD0HY=; b=0XhReVyk1mrQEx/H9HEo0xJuQ4
	73C/0XdVVq7Ahd8JPZc593Byygau56UpC6bFU/0HB4dsjDjIgdVn7bZmXjnIgdNtaI97J6k/DCMhj
	RexY+VzmsYXgxFG4rPIs8J5kv0Jsymrdqj3N0PX3nUImqoJvOHFlP6Ai2cfW4ontZZXd45RQTR/AW
	+gdSUTmtBYC2qVB5Q1Cah4AfzOc9WSQvwJE4GyK5rkGhrnZWS0SddzZ7q/OTgCQtjhZtZCP1meVkt
	F/tgqz5oVQjOC9v06aGhsUCf7W46xt0iyiA2eNMpoD9CZvp1t4KeYqSkQ1KX+JGR1iNI4FetC3fCj
	hYsSkFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzi-00000000JfX-204X;
	Tue, 25 Feb 2025 16:41:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw26-0000000HXrJ-1KzB;
	Tue, 25 Feb 2025 14:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494136;
	bh=qVV8kVOhgmF8ivc217Cn73eSTlkBc3CdkndiqKhaMgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FhjLbkqddWAwTD4TtQ4cAhWO0rMwRCsgE9B3muy8SXbHEEhqkSiG+9bwExP/7MBCJ
	 44dvHpYoviV1HjASKa7hm8dSvLG6t4hV3pMyhlFLOFU5vA/L+9sj/diiU7r6v8Hx98
	 qaRfiJzJj7esvIksUT2kAyIpJXDZWyYEZujAaTeYC5M9W3nehQAwVRGz22x2TrdKVB
	 AlwWx6xJ4WPvO6an2zvWKoXUFxf6OugCKBPuSwfNO90VfLXfGwL7+F2q2x7YbNNU+a
	 i9IRZlWuHkKf2CwWlvHKC74vUrBH2fZft5IlSFRSgDo5jOuIKHOQDQFfAnYFfzrnTa
	 bGccwDUcUBp1g==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F15BA17E0DD7;
	Tue, 25 Feb 2025 15:35:32 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 25 Feb 2025 11:33:54 -0300
Subject: [PATCH v2 8/8] arm64: dts: mediatek: mt8390-genio-common: Add
 delay codec for DMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250225-genio700-dmic-v2-8-3076f5b50ef7@collabora.com>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
In-Reply-To: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Zoran Zhan <zoran.zhan@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063538_501180_0953030C 
X-CRM114-Status: UNSURE (   8.94  )
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

The signal from the dual digital microphones connected to the DMIC_BE
takes 30ms to settle after being enabled. Add a dmic-codec with
corresponding wakeup-delay-ms to prevent an initial "pop" sound when
recording with the microphones.

Co-developed-by: Zoran Zhan <zoran.zhan@mediatek.com>
Signed-off-by: Zoran Zhan <zoran.zhan@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index efdeca88b8c4e58f0c17825156276babf19af145..6aa59acd77c245e5fcf7044859a5985f503daeb3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -218,6 +218,13 @@ usb_p2_vbus: regulator-9 {
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 	};
+
+	dmic_codec: dmic-codec {
+		#sound-dai-cells = <0>;
+		compatible = "dmic-codec";
+		num-channels = <2>;
+		wakeup-delay-ms = <30>;
+	};
 };
 
 &adsp {
@@ -974,6 +981,14 @@ codec {
 			sound-dai = <&pmic 0>;
 		};
 	};
+
+	dai-link-1 {
+		link-name = "DMIC_BE";
+
+		codec {
+			sound-dai = <&dmic_codec>;
+		};
+	};
 };
 
 &spi2 {

-- 
2.48.1


