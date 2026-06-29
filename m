Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722DBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 06:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dB9JRvxnhnqiTxASidvAztScsUR1iGkU1aIGfbiC9yA=; b=moIQnxAOYwkA2bBGaoP7B1C0b1
	RdZqD7r3UWq2HKjOiu4oM9yFW7zNIczXw0qfGfZnyPOh3LFSG90yAF3+/os1vowE1wlf7NUoMm0nU
	JEJPtdnnfsynz4EuFQO7nlma8ED+48YWjELGnuxe225DFfvpVQCRWKUPMgq6ZoSyUfNVjB4WkvjBA
	LMe/LZPOJXYsqgnS1oOt6xuRBFiKslZtsL4t0JiAfrB4bByeeyu7Q9n2pkZhgGkLgW21uAH/H2/T0
	11uaa69dIfHVbR3+HB6GFJfJMPLWlvpIkcJ6sbHEpErScS8ONiw6MqO5lDL5UgCBtXj+SvsenrC91
	IIwiQx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5pw-0000000Do7I-1b2D;
	Mon, 29 Jun 2026 06:51:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5pu-0000000Do74-3aFF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 06:51:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9931C40DEF;
	Mon, 29 Jun 2026 06:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D311F000E9;
	Mon, 29 Jun 2026 06:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782715878;
	bh=dB9JRvxnhnqiTxASidvAztScsUR1iGkU1aIGfbiC9yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fir7FRGGQMtmHlpqAhi/pLMkAJ20luA9HPlO1oeC7nw8Fb0kTJPvv5ZSdxHmNZKZX
	 eK431aHszfxNt2azRbVaxZzOXDBnWfbzMK1vjbvz7OCv8ddpsY3b7UpqN3hiWWWLz2
	 yszDF3LKWEm5XwX6BZ+ON/IYDFNtsyvZ3je0n/F77qX+bM9RtZHJA4iM6mPMfgj5bv
	 sejXZh5qxPQa2e2YRBPmrtVNLB2+ZW43/6KlCI1YGFFynyqkO1gprJXytm1NFtRjyp
	 6S7bQOazgHqnx4CMS+COVjJY0xst78QcaGqfOIVCdV4a0zmYXR4js3Ej/PbAJQtxrt
	 o5fVQUvQMDM3A==
Date: Mon, 29 Jun 2026 14:51:09 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Gary Yang <gary.yang@cixtech.com>,
	"Fugang . duan" <fugang.duan@cixtech.com>,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH] MAINTAINERS: Update maintainer and git tree for CIX SoC
Message-ID: <akIV3eH0n9kRMNvf@QCOM-gEdNzOMOFu.na.qualcomm.com>
References: <20260626092015.1709904-1-gary.yang@cixtech.com>
 <21f81761-ac02-4771-9dfd-38e653d1f74f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21f81761-ac02-4771-9dfd-38e653d1f74f@app.fastmail.com>
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

On 26-06-26 15:03:53, Arnd Bergmann wrote:
> On Fri, Jun 26, 2026, at 11:20, Gary Yang wrote:
> > Peter Chen has left CIX Technology. Take over maintenance of the CIX SoC
> > and Update the git tree URL accordingly.
> >
> > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
> 

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> This obviously needs an Ack from Peter. I assume he's ok with the
> change, but you should document that since maintainership
> is tied to the person by default rather than their employer.
> 
> I've added peter.chen@kernel.org to Cc, hopefully this forwards
> to a current address.
> 
>       Arnd
> 
> > ---
> >  MAINTAINERS | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2fb1c75afd16..17b3704bbcde 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2692,12 +2692,12 @@ F:	arch/arm/mach-ep93xx/
> >  F:	drivers/iio/adc/ep93xx_adc.c
> > 
> >  ARM/CIX SOC SUPPORT
> > -M:	Peter Chen <peter.chen@cixtech.com>
> > +M:	Gary Yang <gary.yang@cixtech.com>
> >  M:	Fugang Duan <fugang.duan@cixtech.com>
> >  R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
> >  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:	Maintained
> > -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
> > +T:	git https://github.com/cixtech/linux-mainline.git
> >  F:	Documentation/devicetree/bindings/arm/cix.yaml
> >  F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
> >  F:	arch/arm64/boot/dts/cix/
> > -- 
> > 2.50.1

-- 

Thanks,
Peter Chen

