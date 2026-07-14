Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF754C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 21:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zN7E98zM8jVAhgF74XVOV7g2x2zGcHzUWYai2sRHvlE=; b=DM8srvpdYcJs4palM+iChdKWOe
	9TEdxCdEyBrMh7x9R/MA/IjsNDiNHOUxNf2jDSn0ef9Ewn1OxJqgtbT9zNmuPunJO6Gss6ElhfVLR
	1rCthgvhWxW5M02QnTGlrxsAYHID1pHmRPWrYyyjXV7zSRKG5pFHxP5A2DpKKWJfWtz7ESfNscvWT
	8Bcz1Hd3Rs9yoURnMLOohEacNi+CW/2MaCukppOQaDPOe60Me4nZqapcVBSQXe+1qzk06CtqOV4Yx
	Vnu5+2FcM5GDIQuju/miQy3zUWur9kag00Pm+8WtztY4uU6TBSkUN8tB3EqWaPkItk/def0rW/yx+
	Vts0dejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjl2S-0000000DNJI-1OJ4;
	Tue, 14 Jul 2026 21:51:40 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjl2P-0000000DNIj-0jfi;
	Tue, 14 Jul 2026 21:51:38 +0000
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 892F3804B0;
	Tue, 14 Jul 2026 21:51:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id A1A506000C;
	Tue, 14 Jul 2026 21:51:27 +0000 (UTC)
Date: Tue, 14 Jul 2026 17:51:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Russell King
 <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 6/6] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
Message-ID: <20260714175131.1edfc880@gandalf.local.home>
In-Reply-To: <20260712-printkcleanup-v3-6-574547b8f71b@thegoodpenguin.co.uk>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
	<20260712-printkcleanup-v3-6-574547b8f71b@thegoodpenguin.co.uk>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 7zy31kt8rbwtcxpe5riua91mpmyq316o
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: A1A506000C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18CNmWd2YhLXQvEn1XaHEtwP0wzcKYWfXE=
X-HE-Tag: 1784065887-653010
X-HE-Meta: U2FsdGVkX18t0ruRrD4DDDo0OZ1UA5N76Mf6Lk9oRwOylkSPIbsZWq73qoTz/bkApRB0oxXicLVMDXuK/ZC8dSH77knGTVCpJAZxUxtyvEH/UImu4r3aD8mxRcA5JsRDxTK2N0nO/Q3xgVVpTuV+t1StncIDm3pwv3kYfoeMs8Jg0EJem2UEWPdzi9oJndMRunIH/kS0lPHLDnjK39PoWXSlEiQYG7RJMAz69lnU0kl6Sb7Keuvboe2QUYC4iTAc0pSUneUfPyg9zXOkZ7TN5xPibPrdNOnPExVT/RiRYqicpYieJo2Af3W1FtfKy6YFNnYkT1kxOd8XliV8F5iK8P87+FxnmpA29LqdXki/3Q9gI9m/b6mxPiufh8MKnRsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_145137_280696_6325A386 
X-CRM114-Status: GOOD (  15.82  )
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

On Sun, 12 Jul 2026 11:20:37 +0100
Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:

> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 2884103b93bca7b76cd3a93946276074cf62d0a1..1118feda87b1b04543b1da0bd52c090b1fddaeac 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -650,11 +650,19 @@ Kernel parameters
>  			See Documentation/block/cmdline-partition.rst
>  
>  	boot_delay=	[KNL,EARLY]
> -			Milliseconds to delay each printk during boot.
> -			Only works if GENERIC_CALIBRATE_DELAY is enabled,
> -			and you may also have to specify "lpj=".  Boot_delay
> -			values larger than 10 seconds (10000) are assumed
> -			erroneous and ignored.
> +			Milliseconds to delay each printk during and post boot.
> +			Boot time delays only work if GENERIC_CALIBRATE_DELAY
> +			is enabled.
> +
> +			Once booted the delay can be removed or adjusted via
> +			the printk_delay sysctl.
> +
> +			Please note that you may also have to specify "lpj=".
> +			Boot_delay values larger than 10 seconds (10000) are
> +			assumed erroneous and ignored.
> +
> +			This will soon be deprecated, please use printk_delay
> +			instead.
>  			Format: integer
>  
>  	bootconfig	[KNL,EARLY]
> @@ -5468,6 +5476,19 @@ Kernel parameters
>  	printk.time=	Show timing data prefixed to each printk message line
>  			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
>  
> +	printk_delay=	[KNL,EARLY]
> +			Milliseconds to delay each printk during and post boot.
> +			Boot time delays only work if GENERIC_CALIBRATE_DELAY
> +			is enabled.
> +
> +			Once booted the delay can be removed or adjusted via
> +			the printk_delay sysctl.
> +
> +			Please note that you may also have to specify "lpj=".
> +			printk_delay values larger than 10 seconds (10000) are
> +			assumed erroneous and ignored.
> +			Format: integer
> +

The two parameters descriptions are identical. They should show something
different. Is it just that the "boot_delay" name is getting deprecated?

-- Steve

