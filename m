Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5A3C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxtFhLzSHt+nahGfRB9UVm+Cbn4C6aY1wYx6sp3xHJA=; b=j41cujIN9Gm0QKMwo3pN76LrC7
	CzmACMyC47PihvIXTeU2Dl+YmQ9CMHeKm30j62Q/E/v2z4JsIwv03K1CUODYoozkeZV2kyjauwdGM
	7GtCwuxBuVEXgoGQEVN+4lGOGqm/qRHZLwRbTIRFlVH/nRma8Wq32qfQrzGwaVu4cIHnLEMJQhlEj
	fJX+/L5mm7rNP17Dmd/6op02RBWMRwh/S8qpsASTzHuku07l4LXQTdy2vxBYw8ym1kcsj1X/k9zDL
	SqFuoDz0+/IPNu6EyVVmlRD+K+L+yG/NFRVMBVHfAIDYDv1o2ayFjnrrK7R/s0UeACHRav2W+1ObQ
	DO4QwgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wey70-00000002aSY-3csC;
	Wed, 01 Jul 2026 16:48:34 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wey6v-00000002aQL-0NM1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:48:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A5324E40BFA;
	Wed,  1 Jul 2026 16:48:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF9515FD9D;
	Wed,  1 Jul 2026 16:48:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 612B9104C948E;
	Wed,  1 Jul 2026 18:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782924504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=qxtFhLzSHt+nahGfRB9UVm+Cbn4C6aY1wYx6sp3xHJA=;
	b=PwApHo/8B8Epz4Vt7aF8WpSL7rgkO6iJ2++Z5ARi/DD2CMEDZchzNpLSF+DlHBO9cH4qME
	K54lB9odaBwrcVe6ZDujZvDh/vnWlvDxtRxIa95VXY6b7rabchl5Jy16rlch6Qlgt13c71
	XjCn5pVC2upoxr4VDY9fDxkDYPJfDaKpK4A+lsYlm8WUoboO7/uNZf6ZCafdtNHXj7d8QT
	e3rHiScXuYFxNGxECrUnB78L1bco6nedN9qZ95hnVZ3Xwiqth+Mt+Yju2oI6rx13iWc7J8
	9B8gnokziJEoxfxQKkrZ7GJKDKmn7x7i8+NuJquh7LwajrdbGBL9So5/z/ATsQ==
Date: Wed, 1 Jul 2026 18:48:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add sii,wakealarm-output-pin
 property for S35390A
Message-ID: <20260701164821b7492eac@mail.local>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
 <20260701-bronze-jaguar-of-perfection-028bac@quoll>
 <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
 <7de66163-369e-4118-af51-6913b565fa4b@kernel.org>
 <d06dd0726aa3795ae99df5fa8a9c05d6e2001efd.camel@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d06dd0726aa3795ae99df5fa8a9c05d6e2001efd.camel@posteo.de>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_094829_269063_E48A1B4C 
X-CRM114-Status: GOOD (  21.76  )
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

On 01/07/2026 16:43:07+0000, Markus Probst wrote:
> On Wed, 2026-07-01 at 17:14 +0200, Krzysztof Kozlowski wrote:
> > On 01/07/2026 15:25, Markus Probst wrote:
> > > > > +
> > > > > +maintainers:
> > > > > +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > 
> > > > This should be someone caring about this hardware.
> > > He does have the majority of commits on this driver (excluding merge
> > > commits and commits not exclusive to this driver), although most of
> > > them are pretty tiny.
> > > 
> > > Who would you suggest instead?
> > 
> > Someone adding features for this driver, maybe driver maintainers. But
> > if Alexandre is fine, you can leave him.
> > 
> > > > 
> > > > > +
> > > > > +description:
> > > > > +  The S-35390A is a CMOS 2-wire real-time clock IC which operates with the
> > > > > +  very low current consumption in the wide range of operation voltage.
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: rtc.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: sii,s35390a
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  sii,wakealarm-output-pin:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    enum: [1, 2]
> > > > > +    description: |
> > > > > +      The output pin to wake up the system.
> > > > > +      Default will use the output pin for interrupt signal 2.
> > > > > +        <S35390A_OUTPUT_PIN_INT1> : Output pin for interrupt signal 1
> > > > > +        <S35390A_OUTPUT_PIN_INT2> : Output pin for interrupt signal 2
> > > > 
> > > > Does that mean device generates the interrupts?
> > > Yes.
> > > 
> > 
> > 
> > Then I think you miss interrupts property.
> From what I can tell the line is used to generate a system wakeup
> event.
> 
> There would be no obvious benefit of connecting it to an interrupt
> controller, so this property would be obsolete?
> 

Then you need proper wakeup-source support



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

