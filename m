Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27442E63CA2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 11:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/ESZ+BjF+l0bKx2dy8B0A8Rnl/sw5R4KcwWPDgIvMU=; b=cgg1eqndW1Fj69HKJSflwf7elQ
	VVkYxAhmELR6bQHhYtW0wE+h2mU2tcu3vCcfSlo3Ogr9Z5EpTk8/RIJ0kDVFR8PaGsHHKV87w2mMj
	QKc7+JON1LRINqSNlxNyGqtivKDCMsQPf0394j8WVSjV8NolwKQ6iM7t6KFEwDp3YmUO+zJIhV9bD
	H5u3kKgYjtTIPoqV1RdH1w3PCUzf7U8gnS13tQk92uAvZ7l3osia1XuK727wo29UM5zcPh5DcjUAk
	aVyLthyTk7C+YjmTLXNi1Lq6YTcJfR1Py9YH/0/z1hC7EBkbOZv5eyN5/+9GYzILOj2NPi/yaiUyZ
	GTcU7qZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyc2-0000000B8du-1tpG;
	Sun, 25 Jan 2026 11:49:02 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyc0-0000000B8da-0jOX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 11:49:01 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 22AEC7A0186;
	Sun, 25 Jan 2026 06:48:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 25 Jan 2026 06:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1769341738; x=1769428138; bh=d/ESZ+BjF+
	l0bKx2dy8B0A8Rnl/sw5R4KcwWPDgIvMU=; b=cOE/nwD4KhI9/lkClbht6dYy8N
	TsM81QddgixChETN62/eQN+l/Y/XCJTRKKxu53oXr4O05Y7ppRcVFxL+ettHvSVh
	lkqV6UTkZ/z27XXnUpXtKFtYL48n55/qjCi2zTypEl3MP12LZI/aSLz3IwPKI/87
	KhAlhcJaI3hvlafS0NDgOPWZGnMAuvJRwgPVKOb2ExrmUfkkYrwI0Tu+GZveXlWO
	mYIO2XN2RHgYKQD8ZFkxzdOzGOPC7xTW6DwxlYtNm6+Zdddf9OiXHgwy+9+WPiN0
	T2Z7l0sK6EoxR9F2bbvhxR0YtTZSDexv/hHCtVEpbxDmCR6V9iP6i69XX7EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1769341738; x=1769428138; bh=d/ESZ+BjF+l0bKx2dy8B0A8Rnl/sw5R4Kcw
	WPDgIvMU=; b=w3Vm91frxER6kV66GFu7X+vWbBMjQnAAS9xdxMnnsFpB8zWdbTx
	chV9uMnBLuqOfsBklmBCIcxVxW3HUXWS4ECzBLNKD4QH5jb1z6ni9lMIX0HL3kwO
	7UwdgvsDnZPsViArfBcEepQ0Xax5oAVrVHKY1DvTfIvKFVoNwqHl0x0y4B3JTBuD
	FqGTKKkvcxgVFwKuNmGxMfO/z0/JcM/RujoCJQQt/PARPnI5xHsjIkieoscnap5/
	/7GGgv29CZafYqZqilu5xb6RFS05CWowE6AYquqr3yFqKaWrEU7aprsb47iDbRee
	Tb7sYSEXZIsSH8Cy+rqG82pAO4suiqkmUig==
X-ME-Sender: <xms:KgN2aWCf5gMdOgbSrp1NBxS6c8GrJPL0vsIk0EdeNtHpnpu4CGxQcg>
    <xme:KgN2acWGE8ZwYcNG4Vab8tNS5dDKmokwsDjWPhVpcc3LhX2fFVCyVOaSo1u3ogmvd
    9rIya7LdON9E5Ao5Q0yHUH11oUjevG6Zns5AE27dasUDThdadLeXNo>
X-ME-Received: <xmr:KgN2aU-ZUr1hjuH0-mFE7Tnh8I3jObm6C4RPOTyd9hnWZlW7TtTq2wOzoqzLMgkzTaj8H2_rEpNOlAp2nd4hkE1wy9-lyk6T300>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheegjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeeigf
    dvheehleegiedtgfeljefgjeevfeejgeetkeetfeevtdefkeeluefhieegtdenucffohhm
    rghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphht
    thhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhhkrdhkvghtth
    gvnhhishesgihsgegrlhhlrdhnlhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepthhglh
    igsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhihes
    lhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
    hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:KgN2aeR9atulmEYUpnk1EtQsUJ6yNX5AC0joewSERRVeO87DY0Gz2g>
    <xmx:KgN2aZQILSZebzY-Ov0cXT7CpZP4zobydWf9Br34hEswQ6wpJBZhcQ>
    <xmx:KgN2aa5wUCL--fp9fGqs4jQYl4l7NQc4lT9rYijgCnyyqLmvn9mKMQ>
    <xmx:KgN2aeVbfW9Kpux3ndc2tBZoHp8WPotuZWZKzW2XVmU3PI7vuxCfcA>
    <xmx:KgN2aVugQMkSEeassmSfPupr7xzZW6DxG1do6D-0Sqq4cLmtD3a-WuP4>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jan 2026 06:48:58 -0500 (EST)
Date: Sun, 25 Jan 2026 12:48:57 +0100
From: Janne Grunau <j@jannau.net>
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: sven@kernel.org, neal@gompa.dev, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
Message-ID: <20260125114857.GA1667597@robin.jannau.net>
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
 <20260125-irq-apple-aic3-v1-1-a2afe66a6ab9@jannau.net>
 <87y0ll6i23.fsf@bloch.sibelius.xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87y0ll6i23.fsf@bloch.sibelius.xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_034900_255001_EBE0C944 
X-CRM114-Status: GOOD (  27.98  )
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

On Sun, Jan 25, 2026 at 12:35:48PM +0100, Mark Kettenis wrote:
> > From: Janne Grunau <j@jannau.net>
> > Date: Sun, 25 Jan 2026 12:08:45 +0100
> 
> Hi Janne,
> 
> > 
> > AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
> > in its base functionality. It can use the same device tree bindings as
> > AICv2 so add it to the AICv2 bindings.
> > This interrupt controller is used on all Apple SoCs starting with M3 up
> > to at least M5.
> > The only apparent difference is the increased IRQ config offset. Apple's
> > device tree codes this new offset as property of the "aic" node but the
> > value stayed constant for all SoCs with "aic,3". Since the SoC specific
> > compatible "apple,t8122-aic3" will be used in the driver this offset can
> > remain a driver implementation detail.
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  .../bindings/interrupt-controller/apple,aic2.yaml  | 29 +++++++++++++++-------
> >  1 file changed, 20 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> > index ee5a0dfff437816056bda0de5523bf38be4f49ba..933e134d82bb599a68707ba34e04ea55d61050b9 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> > @@ -4,10 +4,10 @@
> >  $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: Apple Interrupt Controller 2
> > +title: Apple Interrupt Controller 2 and 3
> >  
> >  maintainers:
> > -  - Hector Martin <marcan@marcan.st>
> > +  - Janne Grunau <j@jannau.net>
> >  
> >  description: |
> >    The Apple Interrupt Controller 2 is a simple interrupt controller present on
> > @@ -28,14 +28,23 @@ description: |
> >    which do not go through a discrete interrupt controller. It also handles
> >    FIQ-based Fast IPIs.
> >  
> > +  The Apple Interrupt Controller 3 is in its base functionality very similar to
> > +  the Apple Interrupt Controller 2 and uses the same device tree bindings. It is
> > +  found on Apple ARM SoCs platforms starting with t8122 (M3).
> > +
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - apple,t8112-aic
> > -          - apple,t6000-aic
> > -          - apple,t6020-aic
> > -      - const: apple,aic2
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - apple,t8112-aic
> > +              - apple,t6000-aic
> > +              - apple,t6020-aic
> > +          - const: apple,aic2
> > +      - items:
> > +          - enum:
> > +              - apple,t6030-aic3
> > +          - const: apple,t8122-aic3
> 
> I think this is missing a
> 
>          - const: apple,t8122-aic3
> 
> otherwise, the non-{Pro/Ultra/Max} M3 can't have the simple
> 
>     compatible = "apple,t8122-aic3"

indeed, I forgot to copy my t8122 device tree over when I ran dtbs_check
before submission. Fixed locally and I added a apple,t8122-aic3 example
which tests the #interrupt-cells 3 case

Thanks

Janne

