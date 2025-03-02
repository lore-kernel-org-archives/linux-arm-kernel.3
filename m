Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4714FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ont19LZTzWI/c2XxW6hZfyxgIzp6LURB99deqxwx6L8=; b=dBrmfyGwFnXt/hMf09qKkX3kNJ
	+EJMqXleIFpNz2VQiLnhwp2oot4LoValjZGHeEJQcOR2F/Y3B2eZeYIKd2J1vgN38oCWF65l1APzG
	mIJUh/DcVWkT8txXKTaOO/cMCk0WO2VK0INHAgq7e+sJhpM5tqkj44ztEJyWny7WzMQk5wgRf23H4
	loMoXRCdmgRnp4Y8sY9bXO+PezFMy7Lzwz2raz5U/pO2uV0Sinjgvij6FYAUiaNYjt5BNaMXFBK1G
	CYEQ0+Jrxi2LBOQOOjdBtO/MFnKYB9SfscCqgJDdjXtWBBw9y0mhrcB++v8K/y5MPJIDhSZjP+AJC
	sYN0jphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tomiH-0000000GOhe-1dZN;
	Sun, 02 Mar 2025 17:02:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomFB-0000000GKhD-1Ym2;
	Sun, 02 Mar 2025 16:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740933164;
	bh=0edwmZTqIoP0Y3Y1W2SP+6v6qgCgyweYZ2J4KDdZrHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=COi96ex2/zAJNE/zRWK1Of1Yb0B/BCzL/x0th603vl42Xvu8FRX+ZyDQH47uLTelp
	 S7jxpANwQ7rfQ9xz5o+63xyFdGGj2R/i6+qoc4WCtLAAWoww7SFmxva8T4RwYgmZXn
	 mMeo57kLd7cp9m9njEw3ElmnFglNZIEb+gUnmpG65XE0flmE2gwv3ULykwisz+yfuf
	 mRHc4bA14D8dDuQP19v6N1QiXGSO3/ziqe+T3XwsaDLkXpCxkoku54RZ1sjGxoxvGa
	 RplC7NnmPV42vqs3q4FmhKWq5Z9XxFMrqxhL7VLuWGaESaPgY6qhGiJqhEcJ/NVE/z
	 7vcOiZNQZu2RQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDEE817E07F8;
	Sun,  2 Mar 2025 17:32:38 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sun, 02 Mar 2025 13:30:58 -0300
Subject: [PATCH v2 19/20] arm64: dts: mt6359: Add accessory detect node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250302-mt6359-accdet-dts-v2-19-5bd633ee0d47@collabora.com>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
In-Reply-To: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
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
X-CRM114-CacheID: sfid-20250302_083245_559759_B70A5FAC 
X-CRM114-Status: UNSURE (   9.04  )
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


