Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546A2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3XoWcvCU8wzeGoOynPkYxwnAByrmkOU41swl4JF6g4=; b=2Kj2hWAboHhu96Zs9IUTNRznJ+
	r4tzk0eo6yytE9GnXagppxYmJXEw9S/yDB3Ouko+Tc5cqwOwQXM03OHsgcELR08nNEuXyjNbH9GJl
	fwLOC0w9dSDDr5XuVCAQTCijRbIO4RbCl/ubTiCdKDr5NqvyN+TB5/MmhhNLe6stPscI6Gc9xRmbm
	+tu9NyiwX6H/ue66kiE9yJI75m3PJcaKsT1ofu6gDEGuZ7PL/OqUb1PDUfIT7ZuQjys14xjgwRZrD
	S8qoz8eyIGzA4WK5NcncD+tMto4tdxZVd8+dL76XRr7KWtibmvbyD6URylfmK3Ic2c2GVniv7foA1
	Ip8rs5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCtN-00000003tEs-1x7d;
	Thu, 02 Jul 2026 08:35:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCtJ-00000003tDx-0qJh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:35:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DC97B4E40C29;
	Thu,  2 Jul 2026 08:35:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B12185FF03;
	Thu,  2 Jul 2026 08:35:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 486C3104C960E;
	Thu,  2 Jul 2026 10:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782981321; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v3XoWcvCU8wzeGoOynPkYxwnAByrmkOU41swl4JF6g4=;
	b=saszGIV/t7Y7j0JCiRiMUZrrUjHgBxZCHRP9SZrxi6DyLprb0yS0sqEUUCgbVRd1j2kDc0
	mmV+Laa54Jw23TXNMja9633XtjD8NiBsMe3Kp2lBv2d+oAdyoaAQaSjr/yx/Rw3AXjVS48
	/7gmJKz2k6Xxff3YAjAbIvnU7lUZF9MhDwYr/j0imQtjLeJiPpaCC0fbG5OYSbto/VEO02
	MwGmNXVAzg2tf90MBY0RClJyont9a5FyoivIAuz6GiJYx8vrtvTv3ImtWQwrkR/i5SPe0F
	XNqBBcQuTOxaC+xM5I56CdSoyn18G8woFKkwT49z17GjmweTSDTvd+qX8fls7w==
Date: Thu, 2 Jul 2026 10:35:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Markus Probst <markus.probst@posteo.de>, Rob Herring <robh@kernel.org>,
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
Message-ID: <20260702083517a6b67a86@mail.local>
References: <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
 <20260701-bronze-jaguar-of-perfection-028bac@quoll>
 <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
 <7de66163-369e-4118-af51-6913b565fa4b@kernel.org>
 <d06dd0726aa3795ae99df5fa8a9c05d6e2001efd.camel@posteo.de>
 <20260701164821b7492eac@mail.local>
 <74b32ed0a700e3900c0f34d730b2b5b69eb2ca19.camel@posteo.de>
 <187099d0-5e09-49c2-b67d-8bd4366ff1a0@kernel.org>
 <202607020817017cde494f@mail.local>
 <887cb4e9-d60d-47b5-9110-e00d18e9e46c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <887cb4e9-d60d-47b5-9110-e00d18e9e46c@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013526_489546_F05A864D 
X-CRM114-Status: GOOD (  17.18  )
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

On 02/07/2026 10:20:20+0200, Krzysztof Kozlowski wrote:
> On 02/07/2026 10:17, Alexandre Belloni wrote:
> > On 02/07/2026 08:09:55+0200, Krzysztof Kozlowski wrote:
> >>>> Then you need proper wakeup-source support
> >>> Wouldn't that break existing devicetrees?
> >>
> >> How?
> >>
> >>>
> >>> The current driver allows to wake up the system, even without
> >>> having wakeup-source set.
> >>
> >> Anyway, wakeup-source is already there in rtc, so this would be done. I
> >> don't get though, why there is no benefit of routing it to interrupt
> >> controller (interrupt controllers do wake up the system). Additionally,
> >> if you do not connect it to any interrupt, then how does it wake up the
> >> system?
> >>
> > 
> > Some systems are routing the interrupt output of the RTC directly to the
> > PMIC and the PMIC is the one responsible for waking the rest of the
> > system, including the SoC.
> 
> Yeah, then the PMIC has interrupt line to the SoC and the PMIC is the
> wakeup-source, not RTC.
> 

This would be case 3 of Documentation/devicetree/bindings/power/wakeup-source.txt

> Best regards,
> Krzysztof

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

