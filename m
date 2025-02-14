Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC57C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S49iaesdMmDgotoaLFpfWznFLyv7MEsbmzFOp6EW91E=; b=I0xBlFH772ddlWeKqd87wLdZO2
	8rm5u2M9wEgozX2MhV4U4RlCON065fFV5KZ1rAl7RPF5QzKV4B0T/cHPlfacu1icE+/AU8LEF63DT
	fW0LUJjqwOslWcHivbg9gCvEqhapAe/OlXLH+Wt0ymINNr2DKQM3DbjXC9kynLVvmkpeIqvqdJWxz
	VuEHdqHv/nUdYYcgTMHYbWFEXAYvPEDTv4FBI6WPWV+303x2PWk6kHg14CZQ5Tzvo6Cdr/7s/F9MW
	jvQkEqC6NyXNCAVM1VHax0Hc8VUhhMKsAmHiw/HekqvT4B4h5Nv+IrJdBBF6DviahRbUvetB7U3Yd
	P0Tr6/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07J-0000000Fp0e-2YvU;
	Fri, 14 Feb 2025 18:08:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizMU-0000000FgDL-1RDP;
	Fri, 14 Feb 2025 17:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739553621;
	bh=L2T4ek7h+Mjl4qzzgisy3XYBCi228hsxzedCePnCexI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=auKxJJZUPekOf9Bnx36fTulkRnQEg57CiyhOlb3MLcwskpDf4OLbEmACcNzodrjVv
	 z8m6OC+B8VMgW5gauE6O0YI1A0JIF8fu/JzqBhybz8r3Nydud4toCYg/9y2+ekliqh
	 LRP9j9v7WRVbDsvBf/JX9MsINIB6f19McQlsXTMBlB3VvHR870Y2jj4WOuop/st5Y7
	 ajH6r6i/1KCLYTAkNtbRIwApOljMpDJfQ4JRnd/+AUVWfQhLF+10qR+kx2LgebCt8v
	 Lr/iqezRlm/pVtPiyDZXGRGFryzYu2vOdom6keujVmNlUlAUULsPgIoNEi3sH0c1xn
	 uvQaD7sO9c6PQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CDA817E0239;
	Fri, 14 Feb 2025 18:20:15 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 14:18:44 -0300
Subject: [PATCH 13/13] arm64: dts: mt6359: Add accessory detect node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt6359-accdet-dts-v1-13-677a151b9b4c@collabora.com>
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
In-Reply-To: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_092022_524737_32A907C0 
X-CRM114-Status: UNSURE (   8.34  )
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

Add audio jack detection node. PMIC accessory detect driver will
create an input device that will send key events on jack
insertion/removal or accessory device key presses.

Co-developed-by: Andrew Perepech <andrew.perepech@mediatek.com>
Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 150ad84d5d2b30ab6064c71e1375ce5df5ae4b36..44631fa046b88fffe888d94bfb9b5943b8a66b24 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -15,6 +15,30 @@ pmic_adc: adc {
 			#io-channel-cells = <1>;
 		};
 
+		accdet: accdet {
+			compatible = "mediatek,mt6359-accdet";
+			mediatek,mic-vol = <8>;
+			mediatek,mic-mode = <2>;
+			mediatek,pwm-width = <0x500>;
+			mediatek,pwm-thresh = <0x500>;
+			mediatek,pwm-fall-delay = <1>;
+			mediatek,pwm-rise-delay = <0x1f0>;
+			mediatek,debounce0 = <0x800>;
+			mediatek,debounce1 = <0x800>;
+			mediatek,debounce3 = <0x20>;
+			mediatek,debounce-auxadc = <0x44>;
+			mediatek,eint-cmpmen-pwm-width = <4>;
+			mediatek,eint-cmpmen-pwm-thresh = <1>;
+			mediatek,eint-debounce0 = <5>;
+			mediatek,eint-debounce1 = <3>;
+			mediatek,eint-debounce2 = <3>;
+			mediatek,eint-debounce3 = <5>;
+			mediatek,eint-inverter-debounce = <0xe>;
+			mediatek,eint-detect-mode = <4>;
+			mediatek,eint-num = <0>;
+			mediatek,eint-comp-vth = <2>;
+		};
+
 		mt6359codec: mt6359codec {
 		};
 

-- 
2.48.1


