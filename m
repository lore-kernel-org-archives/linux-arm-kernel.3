Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7F8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeDvNqquN3RAV/Twt2xaw5Tp8/LqqynnM5dSfbSWa7U=; b=YPWlCNzuhQzrSNXeiiNTBQj0WU
	LKePOJVwKr44cX2ZlSBx5AvQLB+LBRcVcobsjUPKNz8q9TANw8xva+TNDVoEagmTGT8lWh1qIuzZJ
	V+ydRekDbVcppmoHArLjgavz7AGa0G0kzIN+MF7WZRQdr15tn7/t3uJQLcPc50TFhmfF1RuEO3YFg
	xtSPEwW6TVAmWWziNZUaf8kt0wEX1FNtSPrh9EL4XyJJSA2PRFFjXw55rgZGoSYMWkqcolcQkS57x
	zqVWazEerDtYHNA0H+LcUTr7wl0ugN3UqM0LlZfG7cqDBVcd/yzBW3TrYLF762b+Fw9quRHUkzMkT
	5Jg6ofRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tomVw-0000000GN5a-2Bor;
	Sun, 02 Mar 2025 16:50:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomET-0000000GKVC-032N;
	Sun, 02 Mar 2025 16:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740933119;
	bh=blWuAtLpdGFI63hnHg9AWnYvcxAarPSsE7Vp8kiBoC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gXs5rFt+gbMfB6kLN4m5LcMCU9n1N9UAdm82ahW/T7eYUPq52atAHtxs/rv7EqQAq
	 B4PhsYWR5MPavvKyPq8IUJy6CdRpd7KeqjJi1zaMGOAMtLzWgMw0rOaRo5JEsCjBcR
	 zXiaa8xgf73PdF3YCB22Kl0SMs8UPZ+hluKHU7jsxek+n1nQgQvsnkVVZJ+2NW/9KV
	 rRfWxSx7JXHdRxLeJ9IkipbJOwa/JiJzlh+ZKAnfZcYlWSsGV4cuPgcbLGxAjygcyu
	 o3pWKBB7F2H5bhzbZ4a8t5hKAtK8pT3orJyib5hPbM7md1/zZpRRsXrh5sSHseL67g
	 DjqBVBnfTJR4g==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A46D17E023F;
	Sun,  2 Mar 2025 17:31:54 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sun, 02 Mar 2025 13:30:50 -0300
Subject: [PATCH v2 11/20] ASoC: mediatek: mt6359-accdet: Drop unused
 moisture variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250302-mt6359-accdet-dts-v2-11-5bd633ee0d47@collabora.com>
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
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_083201_221765_97F7ACD0 
X-CRM114-Status: UNSURE (   7.82  )
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

The dts_data struct contains several variables for moisture
configuration that are simply never used. Drop them.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 54a33a0f0e084f80df33386b3df9bba9525fa880..38c36d59b9cc68bd90e16137a05a62b521b75ac1 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -74,14 +74,9 @@ struct dts_data {
 	unsigned int mic_mode;
 	bool hp_eint_high;
 	struct pwm_deb_settings *pwm_deb;
-	unsigned int moisture_detect_enable;
 	unsigned int eint_detect_mode;
 	unsigned int eint_use_ext_res;
 	unsigned int eint_comp_vth;
-	unsigned int moisture_detect_mode;
-	unsigned int moisture_comp_vth;
-	unsigned int moisture_comp_vref2;
-	unsigned int moisture_use_ext_res;
 };
 
 struct mt6359_accdet {

-- 
2.48.1


