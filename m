Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9CAC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EdTEdM+6sVB4ajKiWYA2xR3s3kkSBIeIRL2MZ5XKWs=; b=0fcG5W32DrasVn/45hD2KSZRnH
	CnPFqaqMysuasTTFxH/ftLLf6H9W4kLaYZRicqBAXMRYHUbLvml6YhVDOQVIbCCYnH4eMEiBvBbcp
	VQ3zT4vqkqEb0r9ge40EVqc4qPn1M847XAMgBl9tAQLam2wG+uCrP1lQMMJzgKQPax27gMkCM1tHJ
	e0X9WvfTGMirf6iJL8zBMQ2U8ZxtdVwwikA8fkF7IIhgjnWA+ayflylOenCheZPHZOGgeD+dT3MGw
	M5MfhBy4yDwACm2XtZ13zuRAnhLkxPWpTI3Rhll2zTq1zMjSeyhAis9GQ6TaI4XDg2RILzPMks2JS
	EyuDbvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66iA-00000003l0l-2OBo;
	Mon, 14 Sep 2026 13:27:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66i5-00000003kwc-1pNM;
	Mon, 14 Sep 2026 13:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392419;
	bh=XC69gvVZiYhJa7pRhxgITvDTrC3MDY2qfawTaSxCKZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RYvj2qBVaZwxb5KKhbaC+AAmziCSDFvLmwclGGwfxDxXm/nKS6NdjRRXbik6Ilpi0
	 vAfb/WCvVH1UCEIG7j44wEnX+M7JDIF4MXdtLXVUPpYBci5WoxPmV7saa76ppi37Cj
	 /eQms8bgaJp0H5KOvnVOj27Q8C/LGAXLeNZY8Ton9X0PTU1JOti0fh9SDSK12o1TBG
	 65XPiPPts1oRTFk1PXrUaNOi+fAuJR02YUSpgVJpsT5iZu/0TO5jfWT314TBlarwW0
	 HKRiae1zG8e2iPLbga16EWu5C0qB7q7JhLGi474+AwZmhrJPZYS2qqw2NJHTIvJ1QQ
	 E5DOlgh41tT+g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2AA0A17E093B;
	Mon, 14 Sep 2026 15:26:59 +0200 (CEST)
Message-ID: <2a4b5af7-89f0-48a8-96a0-84a25c4c0ade@collabora.com>
Date: Mon, 14 Sep 2026 15:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] ASoC: mediatek: mt8189: Return error for missing
 regmap
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-2-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062701_655128_82741A03 
X-CRM114-Status: UNSURE (   6.39  )
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

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mt8189_afe_enable_top_cg() currently returns success when the AFE
> regmap is unavailable.
> 
> Return -EINVAL so callers can handle the error.
> 
> Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


