Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5B5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 06:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZTQQuCL7FpY90fviFNuryA5K0USXRmsaYT1nxgBXO4=; b=C6H0zvNwGwE5MbRO6JsR9NAPWU
	wUq7zim8BEy22eDB4nfHJWfSnkvwexu4gjUheDileSQ+cF0pn1xHQiz4i3p6fJXJ00REdYUaLB7TU
	CQSzZa6t/f5lMU00DgleRJXfSF2JxQDqAd0zbaxw4JMUeCrKnycy2yy10tI6lgJ/7tFID/2V4TvvF
	b41fhIgwFzCmyX8sPG7jAPNvy/jZc/6EHeqjgonjvCNeQkyW9TDSgpT/RmZGff0OsWyDF0MnCMG0Z
	82q5yVbIYzyz3GJlQt8y+Y9sBDTbSe2TyuquvvzAkXgdNLA9Kzc4P/0si0N9RbeZsMj8NmSRJEZ68
	nM/h9yWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTavH-00000001m6R-052n;
	Mon, 23 Jun 2025 06:44:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTaf3-00000001jQP-0lbB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 06:28:10 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uTaeS-0007Ec-61; Mon, 23 Jun 2025 08:27:32 +0200
Message-ID: <133e7a14-9c61-46e6-9ac4-e1c17c0c28b1@pengutronix.de>
Date: Mon, 23 Jun 2025 08:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: export __memset/__memcpy/__memmove
To: Arnd Bergmann <arnd@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Abbott Liu <liuwenliang@huawei.com>,
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250620111257.3365489-1-arnd@kernel.org>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250620111257.3365489-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_232809_225175_9E4D2BB4 
X-CRM114-Status: GOOD (  18.29  )
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

On 20.06.25 13:12, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When KASAN is locally disabled for one file, the string functions
> get redirected to internal helpers, but those are not actually exported,
> so this only works in built-in code but fails for loadable modules:
> 
> ERROR: modpost: "__memset" [crypto/ecc.ko] undefined!
> ERROR: modpost: "__memcpy" [crypto/ecc.ko] undefined!
> 
> Add the missig exports.
> 
> Fixes: d6d51a96c7d6 ("ARM: 9014/2: Replace string mem* functions for KASan")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  arch/arm/kernel/armksyms.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/kernel/armksyms.c b/arch/arm/kernel/armksyms.c
> index 82e96ac83684..1ff50106afa4 100644
> --- a/arch/arm/kernel/armksyms.c
> +++ b/arch/arm/kernel/armksyms.c
> @@ -83,10 +83,13 @@ EXPORT_SYMBOL(__raw_writesl);
>  EXPORT_SYMBOL(strchr);
>  EXPORT_SYMBOL(strrchr);
>  EXPORT_SYMBOL(memset);
> +EXPORT_SYMBOL(__memset);
>  EXPORT_SYMBOL(__memset32);
>  EXPORT_SYMBOL(__memset64);
>  EXPORT_SYMBOL(memcpy);
> +EXPORT_SYMBOL(__memcpy);
>  EXPORT_SYMBOL(memmove);
> +EXPORT_SYMBOL(__memmove);
>  EXPORT_SYMBOL(memchr);
>  
>  EXPORT_SYMBOL(mmioset);


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

