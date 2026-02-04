Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D48E9D41E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 17:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zdn9VkAm3vurRCCFrd3t8vXr0fJB5Ku03TcZ3ClNuDk=; b=QVV6oNuPWuZ+OfUhfGEb0GWULa
	CKdJraeK42MiLIlj6VNFtwXEnHRArQZRqZxHgX4bU7lg2nienat/tGaxMDfNPLZPc2iEUQRxMKC4I
	y+UfjLH6uMmDr64+7AX1bLr8WrXGaCPCtorhfnXQVyOIdMZmkFJmrXkFqbjak1P0JUzsJGcXDRvPW
	Ktb5oNQOTIPel3HenwaBG3Z9mRphMehy/6LBL5FCKDyoV/T5x93HM1HjMioJJNoFkhSu3D8Ihz/i7
	qqzeqtOZDqNS5cLlQmYxRem3wMdwFo9OwIrqFJa20EMzxpAc/g6tt0hacqxMwDxanVNt+/zqlFKHy
	BWNaPvPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngx8-00000008sWN-365R;
	Wed, 04 Feb 2026 17:46:10 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngx6-00000008sVc-1t02
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 17:46:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43590777e22so70755f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770227166; x=1770831966; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zdn9VkAm3vurRCCFrd3t8vXr0fJB5Ku03TcZ3ClNuDk=;
        b=aGgCq0JSsQjOspveK7jx8UE/LEwRbvgmAIS34kL/+Bz67YSq5N3wiffTGh9aI6HDLL
         Ko6qXFMeVRFZDNfl2aiMa6CDCxAV5iqqEgZ1rJCzwUJJJHXWlZwPVRicFxAuO/2AokNe
         bXU0XGaAop1mCZWLhSDbqQaFT7G1T1o07NTNBorOSGThWLzYo8dBV0H/czer1kjDVieP
         L4SIIrrjOME3ONgyza7BberPoQFGYI1yr1ixqxVoyjtlogrdftMJkrz1ha3P0/XV/6TE
         iiU4YSkepfVDh3UDoiUmufYi2kyXJvOLtJVK44UQkwan6Uc4S2/qZOw/l0IkoXaitMsx
         7CcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227166; x=1770831966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdn9VkAm3vurRCCFrd3t8vXr0fJB5Ku03TcZ3ClNuDk=;
        b=LSFI/dtJmHyVRFUyW+qEG5BaD95w8KI7W99ZApiG0NOxypvasSz+mPZlD/jNFb/kOI
         MsoE1IywNEGhqpHbhwrMHLufUEx5ZKbV3GuDRie5zVSseyT3HdEAzPLKQ1A7Z0RBXKM3
         6W6JU0Bg7xp5wLEk+6o7SKTP8YeGhtSBcclZMmgsQeq12ZTOJBHBkGqMupBnnYjnKI0N
         2t7cZPygyGYQJHfZHrgMsHfTyqLAR1vYLgaZI0ddUbK+asljAE4tAMmU2HXxjKKOsCqJ
         5Zx3zz88DefpbpL36cYbDwRVOgoRhinK/L/Z42pFx6Co2qDqmnLPJsdeUZBIdmUkrlrD
         Mg2w==
X-Forwarded-Encrypted: i=1; AJvYcCWUIghJcNjar1iIzZQa/vTJcFjqsnW0EekDOuZ2N1Zs6HHZS8Eb4ZU6ArorzKXeOErZipwEOhj9TLQP6/GJmUvr@lists.infradead.org
X-Gm-Message-State: AOJu0YzmrO7LwHc1BgQAxf95MUBunVIx+s8bG04kCqBOQ8IWXLWbDIRB
	2MKYqHocu7VrfAAtAi4ddS3wt8l/33fIHFcztJvrS8jLAzisw1z1h2yq
X-Gm-Gg: AZuq6aLMfXaJCqVtdnZ2dX55i0tZg1QkZFd0eEnsCE2z4/x/S04PjjdX028e/7VrlmA
	oM+EUuqQUKwGLEQKTsOyhVFgxpWy3AYi194D98ld1G6ppBXYMZ/a8nooUXF+EJ6I5opuS34dzx1
	dsY5xMiScXip0M0SOqH4k2tubF297MgK5cogl2gP7KucDetKv1hZg86z7tx55k+/ByLDLLYn9fx
	kH6sA750zIa/AaEZgQLPCmxV7sOjmQ33Uq8j3I1CjDAVx8gdW4AdUwegxPAP2QUkbD0jCK6I4HA
	3cTUWu4Y//CCdSrt6f3blLIdvyG6ZXq6Z+cQGPnWdFe5RdMIWLSKlcIljR1QyKkXthRj4YOGhuT
	eJPWYu4v/d2AbT62n5iuGrXIwDdjRFUPjUkIh6bvqLd5gdvGJWvOQHyDnCaEqNzKAK5QodeG88m
	KfIU4eRqlmJKMdF5W5LK0BXgpJnc694cgGJBvFgfsrFg5C+PkVcnAJ+Kw5rZVP
X-Received: by 2002:a05:6000:2207:b0:430:fc63:8c8 with SMTP id ffacd0b85a97d-43618055383mr5643157f8f.35.1770227166263;
        Wed, 04 Feb 2026 09:46:06 -0800 (PST)
Received: from [192.168.0.29] (static-95-59-231-77.ipcom.comunitel.net. [77.231.59.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e3a486sm8256763f8f.16.2026.02.04.09.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:46:05 -0800 (PST)
Message-ID: <ba86661d-3016-4205-8515-5e9ab2fa309b@gmail.com>
Date: Wed, 4 Feb 2026 18:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pmdomain: mediatek: Add bus protect control flow for
 MT8189
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
 <20260202064820.347550-3-irving-ch.lin@mediatek.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20260202064820.347550-3-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_094608_556830_B6EDB99E 
X-CRM114-Status: GOOD (  20.78  )
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



On 02/02/2026 07:48, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> In MT8189 mminfra power domain, the bus protect policy separates
> into two parts, one is set before subsys clocks enabled, and another
> need to enable after subsys clocks enable.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 31 ++++++++++++++++++----
>   drivers/pmdomain/mediatek/mtk-pm-domains.h |  5 ++++
>   2 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 0f0662676c07..3eeb0dabf7d7 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -250,7 +250,7 @@ static int scpsys_bus_protect_set(struct scpsys_domain *pd,
>   					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
>   }
>   
> -static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
> +static int scpsys_bus_protect_enable(struct scpsys_domain *pd, u8 flags)
>   {
>   	for (int i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
>   		const struct scpsys_bus_prot_data *bpd = &pd->data->bp_cfg[i];
> @@ -259,6 +259,10 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
>   		if (!bpd->bus_prot_set_clr_mask)
>   			break;
>   
> +		if ((bpd->flags & BUS_PROT_IGNORE_SUBCLK) !=
> +		    (flags & BUS_PROT_IGNORE_SUBCLK))
> +			continue;
> +
>   		if (bpd->flags & BUS_PROT_INVERTED)
>   			ret = scpsys_bus_protect_clear(pd, bpd);
>   		else
> @@ -270,7 +274,7 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
>   	return 0;
>   }
>   
> -static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
> +static int scpsys_bus_protect_disable(struct scpsys_domain *pd, u8 flags)
>   {
>   	for (int i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
>   		const struct scpsys_bus_prot_data *bpd = &pd->data->bp_cfg[i];
> @@ -279,6 +283,10 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
>   		if (!bpd->bus_prot_set_clr_mask)
>   			continue;
>   
> +		if ((bpd->flags & BUS_PROT_IGNORE_SUBCLK) !=
> +		    (flags & BUS_PROT_IGNORE_SUBCLK))
> +			continue;
> +
>   		if (bpd->flags & BUS_PROT_INVERTED)
>   			ret = scpsys_bus_protect_set(pd, bpd);
>   		else
> @@ -632,6 +640,15 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   	if (ret)
>   		goto err_pwr_ack;
>   
> +	/*
> +	 * In MT8189 mminfra power domain, the bus protect policy separates
> +	 * into two parts, one is set before subsys clocks enabled, and another
> +	 * need to enable after subsys clocks enable.
> +	 */
> +	ret = scpsys_bus_protect_disable(pd, BUS_PROT_IGNORE_SUBCLK);
> +	if (ret < 0)
> +		goto err_pwr_ack;
> +
>   	/*
>   	 * In few Mediatek platforms(e.g. MT6779), the bus protect policy is
>   	 * stricter, which leads to bus protect release must be prior to bus
> @@ -648,7 +665,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   	if (ret < 0)
>   		goto err_disable_subsys_clks;
>   
> -	ret = scpsys_bus_protect_disable(pd);
> +	ret = scpsys_bus_protect_disable(pd, 0);
>   	if (ret < 0)
>   		goto err_disable_sram;
>   
> @@ -662,7 +679,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   	return 0;
>   
>   err_enable_bus_protect:
> -	scpsys_bus_protect_enable(pd);
> +	scpsys_bus_protect_enable(pd, 0);
>   err_disable_sram:
>   	scpsys_sram_disable(pd);
>   err_disable_subsys_clks:
> @@ -683,7 +700,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>   	bool tmp;
>   	int ret;
>   
> -	ret = scpsys_bus_protect_enable(pd);
> +	ret = scpsys_bus_protect_enable(pd, 0);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -697,6 +714,10 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>   
>   	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>   
> +	ret = scpsys_bus_protect_enable(pd, BUS_PROT_IGNORE_SUBCLK);
> +	if (ret < 0)
> +		return ret;
> +
>   	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
>   		scpsys_modem_pwrseq_off(pd);
>   	else
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
> index f608e6ec4744..a5dca24cbc2f 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
> @@ -56,6 +56,7 @@ enum scpsys_bus_prot_flags {
>   	BUS_PROT_REG_UPDATE = BIT(1),
>   	BUS_PROT_IGNORE_CLR_ACK = BIT(2),
>   	BUS_PROT_INVERTED = BIT(3),
> +	BUS_PROT_IGNORE_SUBCLK = BIT(4),
>   };
>   
>   enum scpsys_bus_prot_block {
> @@ -95,6 +96,10 @@ enum scpsys_bus_prot_block {
>   		_BUS_PROT(_hwip, _mask, _set, _clr, _mask, _sta,	\
>   			  BUS_PROT_REG_UPDATE)
>   
> +#define BUS_PROT_WR_IGN_SUBCLK(_hwip, _mask, _set, _clr, _sta)		\
> +		_BUS_PROT(_hwip, _mask, _set, _clr, _mask, _sta,	\
> +			  BUS_PROT_IGNORE_CLR_ACK | BUS_PROT_IGNORE_SUBCLK)
> +
>   #define BUS_PROT_INFRA_UPDATE_TOPAXI(_mask)			\
>   		BUS_PROT_UPDATE(INFRA, _mask,			\
>   				INFRA_TOPAXI_PROTECTEN,		\


