Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFBECD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUrsjg1wZB2HsTkuGMNMT0h1rEjr97S980qFtRh898Q=; b=kO0Gg4h5lU58AnYbFmlbLtc2h1
	c9PRdorwLykF0feLeS5eaZS0hSmXyyh5FG9YTCs39zkqg0KkE8kyUcJfNDJYtLjnRisl2VYYMCgH8
	PVYzyVWlrdKKG/wx4EqeU5SP0GkZbpEA4Tf4cL887nHi8m3fHvb8ztM6t+2krKWtQhdaO/qjD0fVW
	Bmq4TBVqL5vIVmQjsBtikIZi6kP3EHZH7svlqdQxq/N78wPHwM0aVn6yvCFpQ56DVh0nK207jXIYY
	QJHUdctYOxWYWbcDzui+LVZaUVLiAIkChqz9sbQnhqE2oxTj09KO1Ch9GHye8U7r14LJ8JVJCY+pC
	AsI4/McQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQww-0000000GhC1-1Lim;
	Mon, 25 May 2026 08:46:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQwt-0000000Gh8m-0QlB;
	Mon, 25 May 2026 08:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779698766;
	bh=G9Tat5XVlt3hSUrqlBT9oU7ZJpYohFdZokySMUaIDIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SEPybhqMb7/lv52S+LVmFGv3hBCKyhqYfsnBmONXkFqYIKPvVkvPRNQoZFL8anlzV
	 Y1hqBJfSyYsfNSip+7BJcmK7QwaG9JNPVIFb1Gq5J09QVYcTaAk/j7lNw6KPUpwuet
	 bbeQl+oLDTDknbl7Muy6sKCicTMGsU37K02KFBSv+gH7TosQytPRmtFpb+xIVfpUqJ
	 vP3lmlMtv60LT9/0DvIC+SDzDgUUBBnEBgH5QEP/MEoo2tNLveve13CXErtmo1HQqU
	 EVqP+9ICWwy5blUa9i3EPrJzDJ9NWgKgq/G3gJmFnLxAE0iUK5cH/nrmAfyixovqa3
	 cJVia8ZjQdtgw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E05D17E0CAC;
	Mon, 25 May 2026 10:46:05 +0200 (CEST)
Message-ID: <1b430dea-6d84-4ba5-845f-bdea1c0fa569@collabora.com>
Date: Mon, 25 May 2026 10:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
To: Akari Tsuyukusa <akkun11.open@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, bmasney@redhat.com, matthias.bgg@gmail.com,
 wenst@chromium.org, laura.nao@collabora.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20260522133023.355404-1-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260522133023.355404-1-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_014611_290068_E5F68FEE 
X-CRM114-Status: GOOD (  13.73  )
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

On 5/22/26 15:30, Akari Tsuyukusa wrote:
> The MediaTek MT8196 vlpckgen clock driver uses
> __devm_regmap_init_mmio_clk() by devm_regmap_init_mmio(),
> which is defined in drivers/base/regmap/regmap-mmio.c.
> However, the driver's Kconfig entry does not select REGMAP_MMIO.
> This causes a linker error when REGMAP_MMIO is not enabled.
> 
> Fix this by selecting REGMAP_MMIO in the Kconfig entry.
> 
> Fixes: 2f8b3ae6f0cb ("clk: mediatek: Add MT8196 vlpckgen clock support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/clk/mediatek/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 2c09fd729bab..fd8440122ec2 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -1006,6 +1006,7 @@ config COMMON_CLK_MT8196
>   	tristate "Clock driver for MediaTek MT8196"
>   	depends on ARM64 || COMPILE_TEST
>   	select COMMON_CLK_MEDIATEK
> +	select REGMAP_MMIO
>   	default ARCH_MEDIATEK
>   	help
>   	  This driver supports MediaTek MT8196 basic clocks.


