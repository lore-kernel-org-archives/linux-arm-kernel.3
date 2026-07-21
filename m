Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2956BC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s714PIQghkY/9MW6D33qGrQ8jbCA0pA9r36Jd3aKNCE=; b=s0ViBHfaVZrXQQ9OnsecN4OCBz
	sRz1k8CouBuw7HTX5FTlzc/QL94xfCcZLeklJeERBFoLnoO0CFCOzpIvXVs7SnC637reI2BJlznzT
	Ri725dTEBegnyzzqzMvm3i3bqIVW/mgQHBv9vwwG0RZDqJ7uzwwdtzdKil1PDV0vHfWqJn3C2G1vl
	6ekjM3J++E0lDUoBYLZ0QL3/MjxOc3WsFiCap/wBUYf6TYgdaHWdip5URCawIuzQPEg0adQhMhjWO
	hV3ti1gUifd0v1xAmkeb7bOZnSDvueuf+gsp7snAqpqBBauTl1Nx/6k/jDqZv81bfe8of8nk+T7NX
	oxTUWYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6fn-00000008xr6-29zI;
	Tue, 21 Jul 2026 09:21:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6fk-00000008xqG-3g1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784625714;
	bh=erEGNGVLEIxDkPO6zBTgGI3KJKyGhoY67y0vl9j6x84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KfhF4bEaynKj1/w6EFnk/y0cfay9TU82h1NZr440/4ECY+S30klxfJ8mgfgtNFi8v
	 QuAaNdaM708kWDzouvnXXNPu80WJLFi+/NuXpC16E2RKX4klusHBxLfN3IVCMb2lpf
	 bzDd+2uHthQH4q8DPXWgIHO81u9vlTY9+jqxuCvkZEXnktihZA8UCjRlMU4xFyFPf6
	 jmZstNm5dAsCjfq9ugSRWZ8pYTqum9FnR7t7Q2EBjK5kyyKuQCkk2T9wPvg/Q6rIiQ
	 /3xKfPEcU4dbhm/L3RclO3wCRBvjlRg+3TZ7Cc/flmQUP8c5iCFp+AbcxgYoDv0tRk
	 yeL1m5a/P7r6g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64A3317E0A46;
	Tue, 21 Jul 2026 11:21:54 +0200 (CEST)
Message-ID: <323095f5-0006-4473-925f-2e2f1febf8de@collabora.com>
Date: Tue, 21 Jul 2026 11:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: mediatek: preparation for Card capsuling
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Darren Ye <darren.ye@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
References: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_022157_071322_8A7D2BD8 
X-CRM114-Status: GOOD (  11.99  )
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

On 7/21/26 03:33, Kuninori Morimoto wrote:
> 
> Hi Mediatek developers
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup mediatek drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> 

Entire series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> Kuninori Morimoto (4):
>    ASoC: mediatek: mt8192-mt6359-rt1015-rt5682: use *dev in mt8192_mt6359_card_set_be_link()
>    ASoC: mediatek: common/mtk-dsp-sof-common: use for_each_card_prelinks()
>    ASoC: mediatek: mt8196-nau8825: remove unnecessary declaration
>    ASoC: mediatek: mt8365-mt6357: remove useless assignment
> 
>   sound/soc/mediatek/common/mtk-dsp-sof-common.c       |  7 ++++---
>   .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 12 ++++++------
>   sound/soc/mediatek/mt8196/mt8196-nau8825.c           |  2 --
>   sound/soc/mediatek/mt8365/mt8365-mt6357.c            |  1 -
>   4 files changed, 10 insertions(+), 12 deletions(-)
> 

