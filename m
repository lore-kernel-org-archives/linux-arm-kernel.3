Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0375CE85372
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLnwGWL6TgcYasgyv0J5P3QylGUlytMkTqWZKROjvys=; b=k1nxJkOtUSGHxh2pd1mu1srh48
	B6RVIW9pT3OH6xCa069FDJgdWiqD7wZ6IihhDv5R6mK7y533PpZnaG1s2+kW5XjB5++PDnJxZWTI0
	+g5Z2/l99Mhc6TeFLJxO9c+fxMx11bZ0vNqHuu0hGP/5UZTiD10bXrA+yHG+GTVt3ZH40hXain1Dk
	413Iw5fRWrfnU3YsiReBfhf2kL889+RJTH1WPWJuCRF8/WlMGnu965qserHN85Y5oOUgtRh8ap4UT
	aEtLQ2JrsLW6DmAJhCH7rFOp9PkuF9+0lIjsKjT6y4ZWIXS46iArHAIfTU3sEaNpVdDrjVaodIUw2
	Q4U1veHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fYQ-000000029PI-0PfE;
	Fri, 03 Apr 2026 14:31:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fYN-000000029Ne-481n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YLnwGWL6TgcYasgyv0J5P3QylGUlytMkTqWZKROjvys=; b=SCtPbH0VqwVH77TZpjAYo8qz6T
	qWxPm1gO6ha8ukxYYosimjxw8LazWPmZ/JwaexvKDX8aVy4Q/x+q/WW3kXyrEPR89YVFJJ6tZ0RZl
	zYrXKpS4lO9XI9OdbuXtmJDA9mBDy2EBhUvNWJtkrZCfgX2im+dpn+sPbeJjiNEp2YHw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w8fYC-00Efvy-89; Fri, 03 Apr 2026 16:31:08 +0200
Date: Fri, 3 Apr 2026 16:31:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: mvebu: validate memory node device_type strings
Message-ID: <a78b3608-486d-47d9-8b3d-558ed92733ea@lunn.ch>
References: <20260403151504.4-dt-arm-mvebu-resend-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403151504.4-dt-arm-mvebu-resend-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_073120_020031_30076111 
X-CRM114-Status: GOOD (  19.60  )
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

On Fri, Apr 03, 2026 at 10:42:46AM +0800, Pengpeng Hou wrote:
> mvebu_scan_mem() fetches the raw device_type property and immediately
> compares it with strcmp(). Flat DT properties are external boot input,
> and this path does not prove that the property is NUL-terminated within
> its declared bounds.
> 
> Use fdt_stringlist_get() so malformed unterminated device_type
> properties are rejected before they are used as C strings.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/arm/mach-mvebu/board-v7.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-mvebu/board-v7.c b/arch/arm/mach-mvebu/board-v7.c
> index a0740ab0dca9..f867f6233108 100644
> --- a/arch/arm/mach-mvebu/board-v7.c
> +++ b/arch/arm/mach-mvebu/board-v7.c
> @@ -11,6 +11,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/libfdt.h>
>  #include <linux/of_address.h>
>  #include <linux/of_fdt.h>
>  #include <linux/io.h>
> @@ -66,7 +67,8 @@ void __iomem *mvebu_get_scu_base(void)
>  static int __init mvebu_scan_mem(unsigned long node, const char *uname,
>  				 int depth, void *data)
>  {
> -	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
> +	const char *type = fdt_stringlist_get(initial_boot_params, node,
> +					      "device_type", 0, NULL);
>  	const __be32 *reg, *endp;
>  	int l;

Did you read the comment?

/*
 * When returning from suspend, the platform goes through the
 * bootloader, which executes its DDR3 training code. This code has
 * the unfortunate idea of using the first 10 KB of each DRAM bank to
 * exercise the RAM and calculate the optimal timings. Therefore, this
 * area of RAM is overwritten, and shouldn't be used by the kernel if
 * suspend/resume is supported.
 */

You probably want to make use of:

 *     -FDT_ERR_BADVALUE if the property value is not NUL-terminated
 *     -FDT_ERR_NOTFOUND if the property does not exist

	Andrew

