Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFCAC282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIS/32Av80CPwFp2DKGQiMUYH9j+z5qLFhZJxaay/8M=; b=jKFDsZ1yS4X2Zg2fyesm2beRSK
	LHpWLM2wyYeLjtTrzmWOyHT0HOKnm4MOPMOE1Nc5diW3qRg4YBJ9pd3KwQfw6aafjRV/WZaZeoBOd
	PZyrHa/OKFXcZ/fP6tian1FnjBB2AQXYD3p90FS6hSziibeDBdV7iDl0o/otjLlEUl0NgGkiSlVqr
	kMXzYqLH+siEWyWBSWEANGqI/Xo70P3KBC59J7DGno1GN398OWeyfRVmCVHzLAk0dgnR4AGRKXZM4
	gWsWQaH55xH3FE6FUhRvrIBtD/fCBFB9IMo7VdZl2zsMFeJPbwCwCTg9DGFOh42F7NLdO92Z7rI59
	f4IpNfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpV2t-00000005PbB-2RGh;
	Tue, 04 Mar 2025 16:23:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU1q-00000005AUM-3Bdt;
	Tue, 04 Mar 2025 15:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741101473;
	bh=LBdY8EkTk1rXFVfcF9dktYOACXoiU+urwy0jL5VUVpg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gy2RG9LMsBemqeh+coWSVcgDb0ddKIAPAk4dGvzsOR85NQRhh7CmgEtZ8JTbcqhi8
	 xpFFtH4S7LQ+25q9bKEmaVpQNSFaMtmIBM8gdzUvrp+NSCjkfgVvPgzrIwtroZlm0W
	 vhjaLDKwIbfUjgTBBg7jzMUOgQNAlcE9/Tei2Gg2aXhdP/OXUZ22MhRgpgTruPZQsA
	 I8mN1lVjgTXdXhFR3lZHX2+1OEgcZFNZXExJZmqN08eNy2yK6J2HtCSBZhpLsc6L+7
	 r+S14/ChtPNuKjeJ9ZJLpWTRLElh+UVBp3hpkFtA6lTnAadpJqlH09QMbyLpJPYJTv
	 +Br3G46MPJoBw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D3AC17E07F8;
	Tue,  4 Mar 2025 16:17:47 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 04 Mar 2025 12:16:00 -0300
Subject: [PATCH v3 19/20] arm64: dts: mt6359: Add accessory detect node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-mt6359-accdet-dts-v3-19-5b0eafc29f5b@collabora.com>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
In-Reply-To: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_071754_969257_A0587688 
X-CRM114-Status: UNSURE (   9.46  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 7b10f9c59819a9ad02319f00938f35c931091f9f..e24e4aeb3b9cafa2af56c62bc4c549df27d0ec73 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -15,6 +15,10 @@ pmic_adc: adc {
 			#io-channel-cells = <1>;
 		};
 
+		accdet: accdet {
+			compatible = "mediatek,mt6359-accdet";
+		};
+
 		mt6359codec: audio-codec {
 			compatible = "mediatek,mt6359-codec";
 		};

-- 
2.48.1


