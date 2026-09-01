Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5B9C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 03:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mz+07mICPoRLK08jztHD58aBq0D+ziKWII3djAJ2Nwg=; b=jkl18DNCtFJ/gcfBtH2s+9PNCK
	Vovw7S1a2IH7kwDyjuEZtuhQqhlF/LeSA1TEux+UCg0Lim3pQp4BPs50Q78Hp0FQeRTylfvtk0/S6
	Z8pBLNvHeMCoQX7eXeiZnd6WdRRW+RX1xMWC6gMcZFauJMbYheirkhTdTq0Wnx+mdkEUFNS753w2z
	aTp8cTvfJQHSbvU08vcHmv4gwUUOVGJS4rE4u71xs1xSUahVOkpDggN9ZNMCbLCTx88RZ1licCyD3
	HITrUhxaMUzhdYvnHNkLbBA8SmG8vBVzQuHYEnE8Ei/3EmaYzqGGDIVicXozm7YPybV3aX6MSqfOw
	+7EnHzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Eyq-0000000Avlk-2UAh;
	Tue, 01 Sep 2026 03:16:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Eyp-0000000AvlN-1c6t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 03:16:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FB1B601DE;
	Tue,  1 Sep 2026 03:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997FB1F000E9;
	Tue,  1 Sep 2026 03:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788232570;
	bh=Mz+07mICPoRLK08jztHD58aBq0D+ziKWII3djAJ2Nwg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nTyAbdp2lsxTPw1V0ikCo5Q+30kQ6UYxW2uAhhGfEYpArIZ2CfpDUdgAJv4pdLmu5
	 GLAS7U/Oe7pUX6SnLbvYntiGAutdOdY3CLoj5tXayWTpRpqo7+HspOjZ2txuf2SqJO
	 fMn6Old+kvY2+sovrQ+ajp+oNxTtY1qdnW6CfTtPa9JO6BsUuw6NERHws91uMO2fy9
	 LQOqqwy8vwVRhfgh/KtpB/zXPbaiS2BheyRuCLF55z3NpICUFmrtqTiTsmCSHqNz6H
	 vUtrjMr/kMeu41fJLlICH3v4R+hk9BmyWDn2NG4uC/p1qwGFcI3amK435jdxDxrSZP
	 56UjwpuG4d03Q==
Date: Tue, 1 Sep 2026 04:16:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: mdshahid03@gmail.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] iio: adc: bcm_iproc_adc: fix include
 dependencies
Message-ID: <20260901041604.5729b0e1@jic23-huawei>
In-Reply-To: <apY4GY-0_XMSfE9B@debian-BULLSEYE-live-builder-AMD64>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
	<20260830170919.470974-3-mdshahid03@gmail.com>
	<apY4GY-0_XMSfE9B@debian-BULLSEYE-live-builder-AMD64>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 31 Aug 2026 23:27:37 -0300
Marcelo Schmitt <marcelo.schmitt1@gmail.com> wrote:

> On 08/30, mdshahid03@gmail.com wrote:
> > From: Mohammad Shahid <mdshahid03@gmail.com>
> > 
> > Add the headers required directly by the driver for completion and
> > mutex APIs.
> > 
> > Remove the unused `linux/io.h` header now that register access is
> > handled through regmap APIs.
> > 
> > Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> > ---
> >  drivers/iio/adc/bcm_iproc_adc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> > index e46e3761993a..2b59819c4ca4 100644
> > --- a/drivers/iio/adc/bcm_iproc_adc.c
> > +++ b/drivers/iio/adc/bcm_iproc_adc.c
> > @@ -4,11 +4,12 @@
> >   */
> >  
> >  #include <linux/clk.h>
> > +#include <linux/completion.h>
> >  #include <linux/delay.h>
> >  #include <linux/interrupt.h>
> > -#include <linux/io.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>  
> 
> I think that's okay. Though, if you go for a v3, you may also add 
> #include <linux/bits.h>
> #include <linux/types.h>
> #include <linux/array_size.h>

These 3 are good.

> #include <linux/device-id/of.h>

Generally now assumed to be from appropriate bus header.

> #include <linux/iio/types.h>

Assumed to be via iio.h. I can't really remember why it is a separate header :(


> which mostly completes the list of includes iwyu tool reports to be missing.
> 
> With best regards,
> Marcelo


