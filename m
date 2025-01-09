Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B6FE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjFANMZo3z7Fe28Zh3gDw9k/gPDCvOxISY207UFk3/Q=; b=pHiEKPIRvAxzMN4jUV2tpeJNfV
	G6p0iw20XUdSk2U8+MndJczNIn3uVm8+RBJkzzoi1At73LDuDNZoryoh7XSR9n4ePVQ59ESEDtYNR
	Djs0H/5x76feWQ9jY6UdwOHHh0wmlEd9TPpzutzOQN4qqp0R/O8mZCzEkjt6aXjXorZlS4uO1dFLX
	bfq+b4I/UBleVdUFOUnMnKAXblw6mwPqiMPPbcFZyqkXMpu85jS8azp5RwpFaZKq0sTJQdkzchUFo
	7H5oHbj3AI1qxk0ZJouSqkGEb5eRm6REM0piRjFwPgPWLy+A/aU3a8mcTfYIpJpEwM9NdKqs77G+Q
	feJo2Fyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVw9H-0000000CoJc-3yxg;
	Thu, 09 Jan 2025 17:16:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVw83-0000000Co0l-2mdL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05C13A42464;
	Thu,  9 Jan 2025 17:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC03FC4CEE1;
	Thu,  9 Jan 2025 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736442930;
	bh=3HlqvF1gFu/ouXfon4HTvBR/I+5OhI7gGNbobwdgUWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NDNegEXI702D2udL3wNx6CfldwqoekpJ2rRwAlWiJZl095k7XoTxDBhSQXF17ZTp6
	 h65IjeIkUPFLVw9bmIgOPGTd3qwxMvJjOi0g8Rwuy/M2AkspSsalZQ6huOJ+pu2ceF
	 q2ElZ2DKDYYMVBhWCGepZq0fwbrfbymYQAxWCwvh5cXtxRVgQF4baSl0uOiH6yrQ9m
	 UMAyDai6PXmC9YGgjFVqLE4C60uVGnysbpYQtn+4vBI+f6tvfx+rJ0Jbw+dU2t/Tdd
	 5DwvMFWZjsIGf9avahbyqhKU/md38tyBY77AvAI41PmcPZtXJYF7aI+3wsNvWHh166
	 n8LZa9iQx7+aQ==
Date: Thu, 9 Jan 2025 17:15:23 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <Z4AEK1LzFeR1DnPk@aspen.lan>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-3-towinchenmi@gmail.com>
 <Z35Y9rzS6tLVgsRo@aspen.lan>
 <ad3cbf5a-6322-4256-9284-f739d4c3aa45@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad3cbf5a-6322-4256-9284-f739d4c3aa45@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_091531_778017_5CD9614C 
X-CRM114-Status: GOOD (  19.21  )
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

On Thu, Jan 09, 2025 at 11:52:56PM +0800, Nick Chan wrote:
>
> Daniel Thompson 於 2025/1/8 下晝6:52 寫道:
> > On Wed, Dec 11, 2024 at 07:34:38PM +0800, Nick Chan wrote:
> >> Add driver for backlight controllers attached via Apple DWI 2-wire
> >> interface, which is found on some Apple iPhones, iPads and iPod touches
> >> with a LCD display.
> >>
> >> Although there is an existing apple_bl driver, it is for backlight
> >> controllers on Intel Macs attached via PCI, which is completely different
> >> from the Samsung-derived DWI block.
> >>
> >> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> >> ---
> >>  drivers/video/backlight/Kconfig  |  12 +++
> >>  drivers/video/backlight/Makefile |   1 +
> >>  drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++
> > I'd rather this was called apple_dwi_bl.c to match that config options,
> > etc.
> Still trying to determine the type of the backlight control, I think
> it is linear however and I will send a new version when I am more
> certain.

If you've got an physicalinstance of the backlight then you can get a
general idea by comparing levels: 512, 1024, 1536 and 2047.

A linear backlight will feel make the gaps feel uneven (e.g. the
difference between 1536 and 2047 will look very different to the
difference difference between 512 and 1024). A logarithmic backligt
will make the perceived brightness intervals between the above all
feel pretty similar.


Daniel.

