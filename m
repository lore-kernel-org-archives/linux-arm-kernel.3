Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E21CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkpL0tmHxowKoCQg6KgQE7aVVXQ8VXFIV/me0DgJOe8=; b=wNG05CAzOff34hMR5hw8Q2qZnc
	xrNzd26CHDz+CCX575thvoH7HPc5e6ZFQGbydhEAxGjQbEWI99QU1gxCPCG+DAkmg2leMC9pm1W4T
	YPB9K1tM5hYihlm+twLfC4iM4J456LfKG8bUO47bMvh2I2c+t/SDs4EApq7v3AHoKOf/qQNErfeVA
	dMXktW9o9OS/cgs0X2wDm48AyP15htaC8nOToPlcMFlY0tp418D6DPwAAn8tPxuJp/QsZdp8EANye
	aVK0UcD0s2drGSSwBJavt4D1XFbcw5Cn1YZzQhNIVl7AnfA4S/vG3iSl270Kqq7du8pRA9HtkjnJH
	Q2pUZO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ihY-0000000As7c-4BwT;
	Mon, 22 Sep 2025 15:43:41 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ihX-0000000As3j-02ZK;
	Mon, 22 Sep 2025 15:43:40 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id 0ihNv1uZQ6fJ30ihNvRBh2; Mon, 22 Sep 2025 17:43:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1758555813;
	bh=FkpL0tmHxowKoCQg6KgQE7aVVXQ8VXFIV/me0DgJOe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=AJj3luLdsdZm6Hh9cs8v3hu1Xrx/xtjz6njOnl5bdrsltRGWoLkcpzbo3ji7oS6mC
	 5YZaQyvvjYyK1wwjrJP8l42XJEaw/Dq5KvFKbSBJWHzyAk+lqlHGJtxMIGEHBwgsf3
	 pYd8pmC4hcZpAGD3ZdEPKpVlCzjgF8D97oDt92/q7T6CTj7umly4owlqUQfQSZ+sZw
	 Zf/Kw+b9ryh7irWVLdjOEhvLQ2DEfal6jZBAZiSy5YmyFLth7HKC3Y17SdKeVQdC0l
	 iC53qyWGA6KOu0Y98FUDUUbm0XISxieirL48iwVUOnd0qPfRJMgpsWp3P2EwI9YZN0
	 DB2lcqiMlrCRw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 22 Sep 2025 17:43:33 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <dcb6023b-8c14-4bbd-9bac-2933e91ef553@wanadoo.fr>
Date: Mon, 22 Sep 2025 17:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: mediatek: mt8365: Add check for devm_kcalloc()
 in mt8365_afe_suspend()
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20250922153448.1824447-1-lgs201920130244@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20250922153448.1824447-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_084339_196067_AD94CF03 
X-CRM114-Status: GOOD (  19.46  )
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

Le 22/09/2025 à 17:34, Guangshuo Li a écrit :
> devm_kcalloc() may fail. mt8365_afe_suspend() uses afe->reg_back_up
> unconditionally after allocation and writes afe->reg_back_up[i], which
> can lead to a NULL pointer dereference under low-memory conditions.
> 
> Add a NULL check and bail out with -ENOMEM, making sure to disable the
> main clock via the existing error path to keep clock state balanced.
> 
> Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
> Cc: stable@vger.kernel.org
> ---
> changelog:
> v2:
> - Return -ENOMEM directly on allocation failure without goto/label.
> - Disable the main clock before returning to keep clock state balanced.
> 
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

This should be above the ---

> ---
>   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> index 10793bbe9275..55d832e05072 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> @@ -1975,11 +1975,15 @@ static int mt8365_afe_suspend(struct device *dev)
>   
>   	mt8365_afe_enable_main_clk(afe);
>   
> -	if (!afe->reg_back_up)
> +	if (!afe->reg_back_up) {
>   		afe->reg_back_up =
>   			devm_kcalloc(dev, afe->reg_back_up_list_num,
> -				     sizeof(unsigned int), GFP_KERNEL);
> -
> +				    sizeof(unsigned int), GFP_KERNEL);

you should not remove a space here.

CJ

> +		if (!afe->reg_back_up) {
> +			mt8365_afe_disable_main_clk(afe);
> +			return -ENOMEM;
> +		}
> +	}
>   	for (i = 0; i < afe->reg_back_up_list_num; i++)
>   		regmap_read(regmap, afe->reg_back_up_list[i],
>   			    &afe->reg_back_up[i]);


