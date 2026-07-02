Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF26C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJc2ZXFFVkna7QBtpQqQx1joA9VijE2aSoSY4AV7Vrs=; b=OP0s9uz00sx1zWKjdiReljBYhY
	8ugZcfD/pUePuVZZyAzVWyeX+v9yUAWiAQUcdFykPN577EoHncGzh+DmXhue0zQnthpjxF//vUAly
	WXg/jTvtdacYms19e0/914xke1yK4s4BF6cSuXMdEYiWeTrmyJ3GOdEtQo9jm7DgaUlqrqSq4HfAd
	VAvKSV48ZgQ4ENJFZ0VgpaEI7aUNm72bNk/wmJzY3/e+UUSvww6dq5GEi+76lud34qMAvDqdykx2z
	rojnXec1RK0Yx3rHd4+zdAHwSkSrtLQtTr0Q/G4siNcs96039yri4iDdSESIXeIHPhoID2tV7jo+l
	xFxWZUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCbn-00000003pWm-3wzn;
	Thu, 02 Jul 2026 08:17:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCbf-00000003pVf-0hf6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:17:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 024EC1A0DD5;
	Thu,  2 Jul 2026 08:17:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B62655FF03;
	Thu,  2 Jul 2026 08:17:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90A3F104C96A5;
	Thu,  2 Jul 2026 10:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782980225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gJc2ZXFFVkna7QBtpQqQx1joA9VijE2aSoSY4AV7Vrs=;
	b=ERANWzcFm1uj6GQ7c2DRm/HlQFI9/dQl5lNS9uP6do/bkXXYKUsaLzW7s16mpLsWOXhgV1
	gEpaCqZ/FI9OhjNAw6x14AdwKSR09BJLxabLEvPQneiA5h40NVu1QCtl4Zj4VMGA11qfZ8
	a8SRokCjPigVA2B5U3fQW4Fl8Z1xs1Pn/GvxN1FWTu/B7B3LWjqivUN3RDR+nOMRRgY6AX
	HM6XWG467tElfQGSE68i96OLTXCd2+S8nixInDL2Sz9f8PHwdpYuA8Tyn7y/3PAdtrIG8t
	APMseIuMqQdwAgeqvRK8b8Jg7u4PhXh7pDlpJsWDc535X9J8b1j0734RdnWmNg==
Date: Thu, 2 Jul 2026 10:17:01 +0200
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
Message-ID: <202607020817017cde494f@mail.local>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
 <20260701-bronze-jaguar-of-perfection-028bac@quoll>
 <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
 <7de66163-369e-4118-af51-6913b565fa4b@kernel.org>
 <d06dd0726aa3795ae99df5fa8a9c05d6e2001efd.camel@posteo.de>
 <20260701164821b7492eac@mail.local>
 <74b32ed0a700e3900c0f34d730b2b5b69eb2ca19.camel@posteo.de>
 <187099d0-5e09-49c2-b67d-8bd4366ff1a0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <187099d0-5e09-49c2-b67d-8bd4366ff1a0@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011711_522700_0636152D 
X-CRM114-Status: GOOD (  13.78  )
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

On 02/07/2026 08:09:55+0200, Krzysztof Kozlowski wrote:
> >> Then you need proper wakeup-source support
> > Wouldn't that break existing devicetrees?
> 
> How?
> 
> > 
> > The current driver allows to wake up the system, even without
> > having wakeup-source set.
> 
> Anyway, wakeup-source is already there in rtc, so this would be done. I
> don't get though, why there is no benefit of routing it to interrupt
> controller (interrupt controllers do wake up the system). Additionally,
> if you do not connect it to any interrupt, then how does it wake up the
> system?
> 

Some systems are routing the interrupt output of the RTC directly to the
PMIC and the PMIC is the one responsible for waking the rest of the
system, including the SoC.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

