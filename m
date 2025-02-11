Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36094C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 01:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59d5DCmTv0tcVe/lLttR0UbGP6r3tAFEV70fpHz4iEE=; b=N7ba02Civy6dOuh9Ej1IiuRZQK
	kpZxc9J7rti2HziM7VKxITawzgBD8G/u34+snh0Hk/YIMlkvgsrHbz44fZvcuQKcV5HdNZ5rJ5ovE
	x6Ql6JSd1x+u1zAiPe/QgAbwF34eOZGmVKgWBIAWZdCODJVBHVWi5FvtXD0hFUR0PSGA9Uhe7l96J
	boIil00lDi+51N68OOiCOYf1LbwxHHlDmFNDz9utnX2iE+eRmgt6Nfx/32CxKMpdYkCru2IE9EZM+
	gf6NqsYpGiRLJ00BsXtJopeeZsfV/o5PZ+weHU1zGMqLaFHUBZcz6WwriUulSJKxtlYsX3Az/IOG3
	9KptraYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thfHq-00000002AhZ-1hEs;
	Tue, 11 Feb 2025 01:42:06 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thfGP-00000002AMc-1WUH;
	Tue, 11 Feb 2025 01:40:39 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739238034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=59d5DCmTv0tcVe/lLttR0UbGP6r3tAFEV70fpHz4iEE=;
	b=FChz8yT/sCzvZpcb9Y6uCUI5b+dSKm4yzDwWaNUwL9UXG8DeR2W2gsIOeAINStfcmoKgSX
	sfiX2wotwRPsz2j/DBMOamYY7oJQ2XK2yjuyDZvMqWDetYoXnKhAnGWCJDrsfHAtHXAgAJ
	jtZbsFW5Rwl4gnTM6vTrDv5azgAVpKLYeFpJpnmaSKhiT5uFSNfFvMnGOPQ9je2r8rtGS2
	/3DcwHEaqDSM38lnwWxYhLivzGeB5r9NnmJjZPeWA8mYdr5isFJkCtYsULAQiwIRssE1M5
	mjjY6t+F/C3yAq7TdoghYKQZyS0OudDiNquHZdKQl6vvHLTP+1uJkxUENyFXFA==
Date: Tue, 11 Feb 2025 02:40:33 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>, Caesar
 Wang <wxt@rock-chips.com>, Rocky Hao <rocky.hao@rock-chips.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] thermal/drivers/rockchip: add missing rk3328 mapping
 entry
In-Reply-To: <20250207175048.35959-1-twoerner@gmail.com>
References: <20250207175048.35959-1-twoerner@gmail.com>
Message-ID: <5f9cf65221690452d7e842ee98535192@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_174037_694252_374EA2A7 
X-CRM114-Status: GOOD (  22.82  )
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

On 2025-02-07 18:50, Trevor Woerner wrote:
> The mapping table for the rk3328 is missing the entry for -25C which is
> found in the TRM section 9.5.2 "Temperature-to-code mapping".
> 
> NOTE: the kernel uses the tsadc_q_sel=1'b1 mode which is defined as:
>       4096-<code in table>. Whereas the table in the TRM gives the code
>       "3774" for -25C, the kernel uses 4096-3774=322.

After going through the RK3308 and RK3328 TRMs, as well as through the
downstream kernel code, it seems we may have some troubles at our hands.
Let me explain, please.

To sum it up, part 1 of the RK3308 TRM v1.1 says on page 538 that the
equation for the output when tsadc_q_sel equals 1 is (4096 - tsadc_q),
while part 1 of the RK3328 TRM v1.2 says that the output equation is
(1024 - tsadc_q) in that case.

The downstream kernel code, however, treats the RK3308 and RK3328
tables and their values as being the same.  It even mentions 1024 as
the "offset" value in a comment block for the rk_tsadcv3_control()
function, just like the upstream code does, which is obviously wrong
"offset" value when correlated with the table on page 544 of part 1
of the RK3308 TRM v1.1.

With all this in mind, it's obvious that more work is needed to make
it clear where's the actual mistake (it could be that the TRM is wrong),
which I'll volunteer for as part of the SoC binning project.  In the
meantime, this patch looks fine as-is to me, by offering what's a clear
improvement to the current state of the upstream code, so please feel
free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

However, it would be good to include some additional notes into the
patch description in the v3, which would briefly sum up the above-
described issues and discrepancies, for future reference.

> Link:
> https://opensource.rock-chips.com/images/9/97/Rockchip_RK3328TRM_V1.1-Part1-20170321.pdf
> Cc: stable@vger.kernel.org
> Fixes: eda519d5f73e ("thermal: rockchip: Support the RK3328 SOC in
> thermal driver")
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - remove non-ascii characters in commit message
> - remove dangling [1] reference in commit message
> - include "Fixes:"
> - add request for stable backport
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

