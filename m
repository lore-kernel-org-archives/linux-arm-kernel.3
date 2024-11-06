Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C346D44D77
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PRWrlBN1fe5GdIYQH69+o+IM6TaCweq1lKM6yKDoek=; b=iycvojYB90qnOy93XTQjAoT9sU
	ei1ZpIXpmL/bgsLB55AN8hdq+dCuqe0UIHCKvTGxCBec1aoJmQC4pdy+3M3wvjVRZFcljTC4Rt+D0
	RU7uGqCsDC6sezW0dzmFXVo+z2Mx9wMMi+OuEn1X9JCbmoxPhr1yF9dEGMCBxg3jYvCgr57lTgfE8
	BkRz6/sK8hJWV/2EUh17uTkGEvw9CPWLOcr6PUc0Lt8mM+R9TODTj8vW9lh6IRSVe+Tn/nXSEHqeV
	turETUYo9n4zqooQEPjBvJRWsg5dEP2pgB8BhaqnOrjqr+ohKo1QFFGVjs1I97mnV8kg77CrAxoXk
	r0JW4Hag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gsh-00000003ZsV-29a0;
	Wed, 06 Nov 2024 14:19:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gXs-00000003W2U-1xiU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 13:58:05 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60E85475;
	Wed,  6 Nov 2024 14:57:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730901474;
	bh=JHxLQgSLWdft8dSzdvbt7oLzbR8ccNpS8nioRv0vsWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7cFdtyrLuTL573iQmGDrUByPoITVRPQxVYPi2KCf4Z/HiY8P4yZM8J5yLQi1eEJa
	 HEU2+dt6x9zxxzatiMNtPjyM60RInhwTuyv+f9hEaoEkuOzFo7oaEZuMTvHN7fPsCz
	 RVAjsnjvYS14JVV9hzz6PM2uqTSBptXcZWDCBsek=
Date: Wed, 6 Nov 2024 15:57:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v8 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <20241106135756.GI9369@pendragon.ideasonboard.com>
References: <20241106100534.768400-1-dan.scally@ideasonboard.com>
 <20241106100534.768400-6-dan.scally@ideasonboard.com>
 <lag7gfpuj2hdxw6i5pumaivxl5rylt2hztd57rynjestffwool@ate7u3zhrgfn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <lag7gfpuj2hdxw6i5pumaivxl5rylt2hztd57rynjestffwool@ate7u3zhrgfn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_055804_671402_D6015E18 
X-CRM114-Status: GOOD (  20.90  )
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

Hi Krzysztof,

On Wed, Nov 06, 2024 at 01:15:23PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Nov 06, 2024 at 10:05:22AM +0000, Daniel Scally wrote:
> > Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> > 
> > Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> > Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v8:
> > 
> > 	- Added the video clock back in. Now that we have actual hardware it's
> > 	  clear that it's necessary.
> > 	- Added reset lines 
> > 	- Dropped R-bs
> 
> These are trivial, so I wish you kept the review... but since you ask,
> then comment further
> 
> I recommend using b4, so your cover letter changelog comes with nice
> links to previous versions. I scrolled through entire cover letter for
> this (for me that's almost the only point of cover letter) and could
> not find them. Anyway, just a remark.
> 
> 
> ...
> 
> > +  resets:
> > +    items:
> > +      - description: vclk domain reset
> > +      - description: aclk domain reset
> > +      - description: hclk domain reset
> > +
> > +  reset-names:
> > +    items:
> > +      - const: vresetn
> 
> drop "reset", it's redundant and rather come here with logical name. I
> wonder what "n" means as well. It's not a GPIO to be "inverted"...

The aresetn and hresetn names come directly from a hardware manual
(vresetn seems to be called rstn in that document though). As far as I
understand, they are the names of the external signals of the IP core.
I tend to pick the hardware names for clock and reset names. That makes
it easier for integrators, and from a driver point of view it doesn't
change much as DT names are just a convention anyway.

That being said, if there's a good reason to do otherwise (such as
standardizing property names to make handling through common code
possible), that's fine too.

> I wonder about reset domains for clocks as well... is this just gate
> clock misrepresented?

No, those are real reset signals. There can be clock gates external to
the IP, and those are handled by the clock providers. The IP has three
domains of logical that are synchronous to three different clocks, and
they have one reset signal each, hence the description mentioning "clock
domain".

-- 
Regards,

Laurent Pinchart

