Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C8CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUq77VZuYMfTn97VoFRP5ysbWEQeLAitEIJ3wotlPbA=; b=qJ9gLUuOuEIbmq0IP3iK2e8HCP
	lnrZ+R/YN5zviaW01Im2MnqnPc2LVkSLgaOI8UT9Jj1jmQOK96epaTDCE2/J1QyHINhQKGmfJQYPZ
	S1NirxHZAjYcl6pnN55D0Y8owH9Ob1PlI8OD5LXlK3Tt91CfFo9g1llA7s6lhKrlX3eLzUJr4CJo5
	pAeRyH6Cfzbo5QI24IJxqPrP/qm/HHRrnwDj/ibQbY1h0AKCi6zCqgdHHDlh+xFLWRC9r9bfG8kPl
	LIqA6TxNehccJuENYolpdNzYZ/xlwGWfrppanRIbrhVD0w4053bfjka9OE739+6CLnFJ6Hy42P8HW
	JhdCLzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trb4s-00000002OJd-2GdB;
	Mon, 10 Mar 2025 11:13:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tragR-00000002IyD-05im
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:48:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95160153B;
	Mon, 10 Mar 2025 03:48:39 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E4223F673;
	Mon, 10 Mar 2025 03:48:24 -0700 (PDT)
Date: Mon, 10 Mar 2025 10:48:21 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Ryan Walklin" <ryan@testtoast.com>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Chris
 Morgan" <macroalpha82@gmail.com>, "Hironori KIKUCHI"
 <kikuchan98@gmail.com>, "Philippe Simons" <simons.philippe@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, "Conor Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 22/27] dt-bindings: allwinner: add H616 DE33 mixer
 binding
Message-ID: <20250310104821.3c85977a@donnerap.manchester.arm.com>
In-Reply-To: <c8b85753-5c97-4258-a158-06a17929fad6@app.fastmail.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
	<20250216183710.8443-23-ryan@testtoast.com>
	<20250224175642.170c124e@donnerap.manchester.arm.com>
	<c8b85753-5c97-4258-a158-06a17929fad6@app.fastmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034831_101104_00E0E77B 
X-CRM114-Status: GOOD (  17.38  )
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

On Mon, 10 Mar 2025 22:30:36 +1300
"Ryan Walklin" <ryan@testtoast.com> wrote:

Hi Ryan,

> On Tue, 25 Feb 2025, at 6:56 AM, Andre Przywara wrote:
> 
> Apologies Andre, I came to review your comments on the TCON series and realised I had missed responding to this comment before sending v8. 

No worries about that!

> >> +      - allwinner,sun50i-h616-de33-mixer-0
> >>  
> >>    reg:
> >> -    maxItems: 1
> >> +    minItems: 1
> >> +    maxItems: 3  
> >
> > What are those three regions? I wonder if we should have reg-names here,
> > to fix the order, and to document them on the way?  
> 
> This would be the top, display and mixer groups for the DE333, and mixer for DE3 and earlier. Can certainly add in names for these. Is there any example elsewhere in the bindings to look at?

It's basically the same idea as for clock-names, as used in this very file
here (allwinner,sun8i-a83t-de2-mixer.yaml). You can find an explicit
example for reg-names in allwinner,sun4i-a10-mbus.yaml, for instance.
In the code you would use devm_platform_ioremap_resource_byname() then.

Cheers,
Andre

> >> @@ -61,6 +63,23 @@ properties:
> >>      required:
> >>        - port@1
> >>  
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          enum:
> >> +            - allwinner,sun50i-h616-de33-mixer-0
> >> +
> >> +    then:
> >> +      properties:
> >> +        reg:
> >> +          maxItems: 3  
> >
> > Should we override minItems here as well? I guess any driver would need
> > all three region to work?  
> 
> This seems sensible, as you say it would always be 3 groups for the DE33.
> 
> Regards,
> 
> Ryan


