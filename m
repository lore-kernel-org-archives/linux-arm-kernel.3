Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4974EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9sJgZkwObZZZ/WV0HjnziR3OT4ESIIcpDukzt2Zb4s=; b=fUEYPgy8tXeaAN3b3oEozdyJzp
	FimOteXNoKy952PRJCrg1Yu8BmBrtfK0lJ8Z0g6noF+J8Zvol6NmezNzeaheh9cF9zWo7+xDkuBlD
	LKKwLCj/HC/QlLtOsSE/uFPjw4oTZtgntV9/TDYnGbUnc934M6TCSz/dFbF0NLcw8QYsVZTivL8+0
	Sy6ctprH5lR257f2v6O5YJ/wI39PLZetjDXKL2FCSfrtpvQbhD2SmqqavlKXJ0WyQMYUpm2fqbLkz
	LwOS+J1f5ekoBuKxABOqvyO6QFmTkmskhTsgnPOMIMB8chwCa1Pw9anMBpiSRaLky+bAQz+Lx7VC2
	alGBENCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSNY-0000000AX7m-0cl1;
	Fri, 07 Feb 2025 17:43:00 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRwr-0000000AS3D-1lgZ;
	Fri, 07 Feb 2025 17:15:27 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738948522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9sJgZkwObZZZ/WV0HjnziR3OT4ESIIcpDukzt2Zb4s=;
	b=Mme29LFFtloTAst8s+o3ggTPvUtlDtIDaHNR4Ti+CdP8H4fDOMgUQEFHtPReb4j4HU65w2
	RYlzX9uZKgnJkc6CDP5htfsDwwlbFVD/D8XOX9Hd21Gqza6iHpkqjL/ir+H1VEX+OzIad1
	bihpS+mAHXlaA4hORWckcP2yXtfX9NVlivPzKOHcAkbZo5KT9//J1DDDk2t5aJLv84vaAe
	Cy7jdZPSSvyOI++KZXMB1YM9S9njI4GSZhbxR9ohSMw7DJ+LnezliWZ+Dj78pux/JGfbz4
	2NeSnNAexum0rP1+jqyuneuVQlxKWUQ+jvf0SVXxQgwfllFfo2GRSaXduMKAZw==
Date: Fri, 07 Feb 2025 18:15:22 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] thermal/drivers/rockchip: add missing rk3328 mapping
 entry
In-Reply-To: <20250207164740.14475-1-twoerner@gmail.com>
References: <20250207164740.14475-1-twoerner@gmail.com>
Message-ID: <fc3c4542d5cc4d95f74692140e5ea8b5@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_091525_611084_A75CF17F 
X-CRM114-Status: GOOD (  14.46  )
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

Hello Trevor,

On 2025-02-07 17:47, Trevor Woerner wrote:
> The mapping table for the rk3328 is missing the entry for -25°C which 
> is
> found in the TRM[1] §9.5.2 "Temperature-to-code mapping".
> 
> NOTE: the kernel uses the tsadc_q_sel=1'b1 mode which is defined as:
>       4096-<code in table>. Whereas the table in the TRM gives the code
>       "3774" for -25°C, the kernel uses 4096-3774=322.
> 
> Link:
> https://opensource.rock-chips.com/images/9/97/Rockchip_RK3328TRM_V1.1-Part1-20170321.pdf
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Thanks for the patch.  I think this should also include a Fixes tag
and be submitted for inclusion into stable kernels.

> ---
>  drivers/thermal/rockchip_thermal.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/thermal/rockchip_thermal.c
> b/drivers/thermal/rockchip_thermal.c
> index f551df48eef9..a8ad85feb68f 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -386,6 +386,7 @@ static const struct tsadc_table rk3328_code_table[] 
> = {
>  	{296, -40000},
>  	{304, -35000},
>  	{313, -30000},
> +	{322, -25000},
>  	{331, -20000},
>  	{340, -15000},
>  	{349, -10000},

