Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0532CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2azQDmDFKL9NCyN7smA0+eLAEoPB8zs5i4rYQrRhVk=; b=0JwtWwK1OuvXgET481q2HXJnQ7
	IyDMrb9I6KAV/5HQbBKY6NRkBA4AN0N3k2VWW/Wu5+/zzFZWfDCL/cfyvtulXdRaMcFnaE8F+l9K9
	qkmuJ8EH+OuO9YwRPQ6I+i8ERs34pFwerhkGEq6i+yXa00wHIhj8qx88bwvYJDCSo2UgzTy6ZVl1q
	Eia4FEDz+RcG/kwcDR5sDMY+SzSRMvGrG4ht7oLGdowr4khRbRifQXtjMDXqMGHdH5ZvbbZh/LwsD
	3ut1nNjmO4lDqnPXneW04hz+8kBD8xQfZDgDMmNiz6l/A78NR8qxMVN8KKoYB89lglJ3svKCoWUkP
	WjvDWmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigCx-0000000CcDI-1MfY;
	Thu, 13 Feb 2025 20:53:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tigB6-0000000Cbvj-2imG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:51:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3452CA41FE3;
	Thu, 13 Feb 2025 20:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED96C4CED1;
	Thu, 13 Feb 2025 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739479879;
	bh=512cv4Hj1Kz9k8u6r5KTAHRKubmEdQ2373KIf+8y/nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rOQzpPjrf+SK50+lfxnvf1j6ydyFhRq+h3/1SS37zqLNdyguRVlBObbP1/wRV0at/
	 +cca9LNWhv8GMr4NpXlWyHwjN2EsM3Zze84WS+MnVfh5DDswhAOygzmSDUKi4RNEMw
	 W9XTcRCyXaqAiS0YlOjJ93ByT9I6kNGLTbYgKNCFtL2uFjH6E3cpzuaQHLZrq5Fh43
	 meI4vmlfv8CvQzjCMKOzSD9/HcXIvAWoRS+Zs0aZLI5YIsWmaBcg8f/mx+LgeXocUJ
	 GwMtsdYdGuWko8E5Vr4XkKGEcj8pddoYRhOHKbgd6vfPEcY5H+KykSlOKqAoh7HEqH
	 nTNI4vN7xs7jQ==
Date: Thu, 13 Feb 2025 20:51:13 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v5 RESEND 2/3] backlight: apple_dwi_bl: Add Apple DWI
 backlight driver
Message-ID: <Z65bQeITMp1mpHp8@aspen.lan>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
 <20250203115156.28174-3-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203115156.28174-3-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_125120_752429_1602DDAA 
X-CRM114-Status: GOOD (  19.10  )
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

On Mon, Feb 03, 2025 at 07:50:33PM +0800, Nick Chan wrote:
> Add driver for backlight controllers attached via Apple DWI 2-wire
> interface, which is found on some Apple iPhones, iPads and iPod touches
> with a LCD display.
>
> Although there is an existing apple_bl driver, it is for backlight
> controllers on Intel Macs attached via PCI, which is completely different
> from the Samsung-derived DWI block.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/video/backlight/Kconfig        |  12 +++
>  drivers/video/backlight/Makefile       |   1 +
>  drivers/video/backlight/apple_dwi_bl.c | 123 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/video/backlight/apple_dwi_bl.c
>
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 3614a5d29c71..c6168727900a 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -290,6 +290,18 @@ config BACKLIGHT_APPLE
>  	  If you have an Intel-based Apple say Y to enable a driver for its
>  	  backlight.
>
> +config BACKLIGHT_APPLE_DWI
> +	tristate "Apple DWI 2-Wire Interface Backlight Driver"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	default y

Sorry to pick this up late and on a resend but... I can't come up with
any justification for "default y" in this driver.

Other than that this is a really tidy driver so with that changed please
add:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

