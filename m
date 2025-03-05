Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0975EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwcp+k7ZQvRTd7IQ5/92ptIUxiRcw/r4u9UflcpI4Vg=; b=wUaZQ8MgTd4XUuJcQ9Aeamwlg2
	cAWT6ZDO3qPO3F4YFQbVMOvgW+H7qh28K4/V1QeBreJOuLij4B1ZCp+Wtar9ybfcqdushjoXDA8Z1
	mDvue/SlwdlaRz6ZaQAIs5pHMJtz4BlLdxLczi7agzYbZJL1VzqZW7xiXDSs6cFkutWgrNTZCHlgV
	6iN6oRA+GgYhHsz9UbziURsXcpjSEMzmiNFpgM3ZoTiJrJVbK6SNcz37gAmDTKMtista+R2yUvdwt
	oZP4UjjUFioq5mI3Gh0/m9+4isdviWfeTQAZTLKPgOIfLeubcy4EBqjifgwy6PJIesOW01jd/Fsfl
	UyEYQaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuGg-000000093C2-0Wqe;
	Wed, 05 Mar 2025 19:18:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptyc-000000090Mm-2YLG;
	Wed, 05 Mar 2025 19:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201217;
	bh=nJmb237CbucvJKm/CuN9D5tE8zn4QuoUQDJSwYS6fXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lk5hFQazmOQJIF0vamtqSxirnH5zfQBapxQpL7qiCSRyb4XT2bU6gGhfTudmQJdbx
	 0l0wMZzd1p88PGEvHYgZXAlmdZlcg42F9Gv83GKrsM1qcmtfYrDNBMIUtE8Y2ltSNN
	 Yj+COCOFWLDBddFDZtVMT/sMgjlD2qzkc9/X2KD6AilQtJtp1oiPMV43RMYc+AL5Zj
	 1/9HZ64TwyYTcMg3QSWwHDedTSe9d0Tw4lPShRYPAt1Q9vv+0xrqdAq3VzkXp+2eBq
	 yO4l4ecQMu1RJAW6FHc8tnB46f/Uo93oup18+weMXPrJiwdZKUp0KD1Y9XR6foc7lc
	 d1j5WLASAsRXA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E63BB17E0649;
	Wed,  5 Mar 2025 20:00:11 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:25 -0300
Subject: [PATCH v4 10/19] ASoC: mediatek: mt6359-accdet: Drop unused
 moisture variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-10-e5ffa5ee9991@collabora.com>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
In-Reply-To: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
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
X-CRM114-CacheID: sfid-20250305_110018_813672_FC1DED53 
X-CRM114-Status: UNSURE (   8.26  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


