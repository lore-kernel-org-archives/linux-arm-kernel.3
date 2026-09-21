Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB56C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynllzazNvLa6sdXptheLKncoSIIa92ngh94S7ablR5Q=; b=jfJiFq8aD9IUoltj29Afqq80ZB
	LGc7QT29nW/pvBSPgXt8HOV3B3o5FT+7auQ8n2TdyRhz6YW46aUNxwVt3yn9Pt0sx0hO/LPSmvZq5
	gZKOH40T2P7TBkxaRgljXlN1qyAIGAT5rAy8kQMMwiTltS22LcWpRg/3rA6jKWYGL/AeUdVfp5E+D
	a2mt1XyEaLxx1P3mxUq29Spd1Fkui0+vmcImlSijHhGQIlk6v4VUdei/wY5lyRCTU2g6qq8npFDyd
	WEYkYxeWMoYAWRQS9BRfohW+hML5coJHnhHjX3AwtDMLI7bjiSb5M0s2hjZgtRvWte6ZDu39x+iJT
	aoxTGvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8j7b-00000003Aqy-2ski;
	Mon, 21 Sep 2026 18:52:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8j7W-00000003Aos-16im;
	Mon, 21 Sep 2026 18:52:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B3FBFC5CD60;
	Mon, 21 Sep 2026 18:52:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AFB25FFB2;
	Mon, 21 Sep 2026 18:52:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 025ED10328D5D;
	Mon, 21 Sep 2026 20:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790016716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ynllzazNvLa6sdXptheLKncoSIIa92ngh94S7ablR5Q=;
	b=EQ+P/mLVE8/BKXKD/OxABygryvUhWzVKUliyIZQZ9zBKQIsd5cEGBgNogarz+dTxnt0cvQ
	n5z151+B1RU62F5ely8avEytG+VufUox8Z81DuxyAmBGTyinkg2dcidf+hAdL9MOhMg0UH
	l2YFQN51bAf3uxcjxHDvpzm9iqTco5GTSb8dDVU1CPc5LIeiI6AsKkRuJvSL18PHSXVvF8
	HWA6LC0Z49eD3Nz9qESVkQyas9qtld+oxB7cyIf4+Hj50jkF9VTIw6NjUhRM8gMn0hp9Ii
	rDQ+MH+nEwDK1vcgyg+ZV4ZMW+3PEI9lPDMMl3BmvR/5Tmwdjxx7cR26AXsdow==
Date: Mon, 21 Sep 2026 20:51:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5
 RTC
Message-ID: <202609211851510a4eec42@mail.local>
References: <20260917135841.841680-1-sander.speetjens@gmail.com>
 <20260917135841.841680-2-sander.speetjens@gmail.com>
 <20260918-steadfast-unselfish-loris-996d7d@quoll>
 <f5c04c5a-20c3-4f4c-bd1f-045516d24140@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5c04c5a-20c3-4f4c-bd1f-045516d24140@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_115206_463585_CD7B9DB6 
X-CRM114-Status: GOOD (  10.60  )
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

On 18/09/2026 15:27:55+0200, Stefan Wahren wrote:
> Am 18.09.26 um 13:44 schrieb Krzysztof Kozlowski:
> > On Thu, Sep 17, 2026 at 03:58:40PM +0200, Sander Speetjens wrote:
> > > Add trickle-voltage-millivolt property for the Raspberry Pi 5 RTC.
> > Why? Describe the hardware, the need, not the diff.
> Is this something we can avoid by making this configurable via userspace /
> hw_clock --param-set=parameter=value ?

I don't think so, the battery, once select is unlikely to change and so
having it is the device tree is describing the HW properly.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

