Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2E7F33824
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fLxoANUqctZUS+Z3Co69HqUNOcNosCE/Q8jVsqBBUg=; b=RuDAvY9zkibUWgSAHieAca2s6Z
	VaauP5aMrPcifyHjSEDbDCL9p6KV6SpdPgOAPCIaccNXUZEOy/Hex1o/updktytx9xdxjDEF21jEF
	mftc2MjJnYle1algfYzb9jeEmVsRthTwR3miCSrQI+ptazHey09Bo6ugGwLU4pl0msviTwnEAGvkI
	y80T8mmr9e4ehPP3NG9Qs+Z5KWlSB4QaU+IvxMopeKGrv8u312RfsUslr5rbRBTCe0NRS0mE6Assa
	vwMwhtcrkoEle4+wxouMn/ibKIneRNB3MMynmhA3eaC+Kg2bRudzIeB68+jkeC+vZ7OfJrzikuKfa
	Cwr/OR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2R4g-00000005vTs-0yqP;
	Tue, 17 Mar 2026 09:50:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2R4e-00000005vTb-0bmA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 09:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5fLxoANUqctZUS+Z3Co69HqUNOcNosCE/Q8jVsqBBUg=; b=auY3XzqqLZi/7NyrQKJatmO/yT
	H1KkcfGED4tT4swRRtUafwhhMmgveIwrGggS7k4lfxFHa3zK1r+ROQ9S/O6ZAcheMo1Yb1YBlIs+7
	9CavruBNOEO76/2UhDvabweZ3SRSe5JQTUHlS8XUPWtXU+acTkwgx6aQ8feU+uhz8U+ZQLoQianlm
	baiGKBs99Yv84U8t4+EwbIOGTC3H6ZPv3SKQBAgyuMsO9E5tjjVHmH0clqxDX3QmQ1+oGmVHqfQxi
	zv9ttNFheEAV5rbZjR8L0fKqGnt/LkXCDDqFLb8Xn1ABHdcnVEeJSCpTzdH13yvv/+tPHajLvoNWG
	uCj6MqTA==;
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2R4a-00000008bWW-08SF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:50:50 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 4E466EC00DD;
	Tue, 17 Mar 2026 05:50:42 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 17 Mar 2026 05:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773741042;
	 x=1773827442; bh=5fLxoANUqctZUS+Z3Co69HqUNOcNosCE/Q8jVsqBBUg=; b=
	j9izheczf9aXHJ3ux1Ulk46cPvtmXGU6l5efH9OapXxeqAsXntGEdDL9qxCMXStG
	fkAGLeArjUnIc1TYDeDdzPKRN0fuAWkudgs/Ms1mFEQE4ktPc+z4ETtXoMD+NS4g
	Amb1DvREGwg737NlFYD+bHd1Rr+jp31cio2idHBrQ6Pxx3/kNBZEM+J1VYqXvku5
	ZAuxAwazvXYjI9AXrlJxASnPrmfTOrDBlMspqpTflfASkF9vaxmAfCSLkweE+5+h
	WTBubjmgB0HA9w7lPlcGQgY22YVHWU4I3rHCZqawtwAXN3YZ5V6kQ/xp7kAs15Oz
	uCqL8oKfIBi9o/k/VFGpKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773741042; x=
	1773827442; bh=5fLxoANUqctZUS+Z3Co69HqUNOcNosCE/Q8jVsqBBUg=; b=S
	phob5ghFn0DzHcEbtHEBV5Nllsaqn0xB7zZEmEtSv/6QFpFi9jsLW1o6PCgXLAAk
	4oLzUYxc+yDp0+fDEqV7M7M+NCmdy4DY8Gb4UIj7KAwadWr9K1PJ99nXcnj8pYI8
	rQDukuCasyugtvAfAHshMDm09awoOn3m844pFGd5P9UL9pR6JFWFGpFQJXxsiyLO
	eT2j/cIjOQpRlfHQXA9p+RwXmXaX4RXIKnIBddp6mUwtHjn6UKwiz5uJiJJwwyh1
	vJqcCNX5LP3i+qhHKNVxFhbdNia9sC4eGyCt7bDcYSCZH9VKCWbHuE4pFuDbNCSv
	PQfr4Zmoga9Z1uSYNyk1Q==
X-ME-Sender: <xms:8CO5aVCSbFm5-5AI28l-qPCyJjvkZMYQiac3oozMCeGzH0X1xSH3hg>
    <xme:8CO5aeX__LuecRfzEcH7oHPPx27sSRAJcCtQXcrV10s2k0BNIqoJ-Z5pF9xBZKxJg
    yUKOyzuBbSPnKfbaZ-ptbCBZ_X0I0oZcdj8EON6JIVgsUPfF4r_8cQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftddtleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhihrghnpggthh
    gvnhesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohephihhpggthhhunhhgsegr
    shhpvggvughtvggthhdrtghomhdprhgtphhtthhopegrnhgurhgvfiestghouggvtghonh
    hsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepmhgrtghivghjrdhlrgifnhhitgii
    rghksehinhhtvghlrdgtohhmpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupd
    hrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8CO5aZMbSeyN3RQqG9n6P2uzhCmKggv9NMbIEQoDWv_MS110fnCGmw>
    <xmx:8CO5aX6Or3i-QsBLWieYFayNJ9ph_3S937sX1O7wvmzYSb4WVb4drg>
    <xmx:8CO5aeZ7zn9ATGkDVlAtAgvHlTh9weIuEzEbAczQtSxuT6AUBHJ6Gg>
    <xmx:8CO5acE96byr1qKyXDx_eNW4OXzKtW19QrMcsfFfucQANLw8sL22Jg>
    <xmx:8iO5afCGo-vGSYe9A1p9dM1cRzSVO7DRrUI6Yb2rfFtanz03t8PGKo1x>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE679700065; Tue, 17 Mar 2026 05:50:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A224H4bSXjB-
Date: Tue, 17 Mar 2026 10:50:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: aspeedyh <yh_chung@aspeedtech.com>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Conor Dooley" <conor@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "maciej.lawniczak@intel.com" <maciej.lawniczak@intel.com>,
 "Mark Brown" <broonie@kernel.org>
Message-Id: <0f7f0f96-a918-47d5-a0bd-bbde494c8fed@app.fastmail.com>
In-Reply-To: <KL1PR0601MB4276ED93723F0B1F42349AD89041A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
 <c3b28ee92fa46700887d0c68b23045b2418358a7.camel@codeconstruct.com.au>
 <KL1PR0601MB4276ED93723F0B1F42349AD89041A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_095048_690072_58E3CFD6 
X-CRM114-Status: GOOD (  23.05  )
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

On Tue, Mar 17, 2026, at 09:14, YH Chung wrote:
>
> In the meantime, my understanding is that this driver is for the Intel 
> eSPI interface used by the AST2600 BMC,
> rather than fitting a conventional SPI controller/device model. That 
> was the reason for initially placing it under
> drivers/soc/aspeed/, since there does not appear to be an in-tree eSPI 
> subsystem at present.
> However, if that is not the preferred upstream direction, we are happy 
> to restructure the series accordingly. 
> It would be very helpful if you could advise on the preferred placement.

I think we need to make sure everyone understands what the options are
here based on what the hardware can do, and what your use cases require.

From reading the old comments that Andrew linked to at

https://lore.kernel.org/linux-aspeed/HK0PR06MB377924CFCBFE9BD40E1C4A5D91D49@HK0PR06MB3779.apcprd06.prod.outlook.com/

I understand that the SoC has a "hardware mode" in which eSPI is
directly implemented by redirecting upper-level eSPI transactions into
functional blocks of the chip, while the software mode behaves like
a regular SPI endpoint controller and your driver implements the 
same interfaces in a mix of kernel and userspace components. Can you
confirm that this is a correct understanding of what the hardware
does, or where I misunderstand parts?

If I understood this correctly, I think there is a general agreement
upstream that the low-level device access should indeed be in a
drivers/spi driver, with no ports of it in drivers/soc/aspeed. Using
a portable driver subsystem is always better than a custom solution
if it works at all.

For the higher-level interfaces (flash, gpio, ...), I don't think
there is any consensus yet about how this should be done, but again
I think this won't be drivers/soc but instead something more
generic.

One option here would be to sidestep this problem entirely by
moving all of the eSPI implementation out of the kernel but instead
have a hardware-independent userspace implementation that uses
the spidev ioctl interface. This is always going to be slower than
an in-kernel implementation, but also much easier to implement
and debug.

An in-kernel implementation of the eSPI backend (on top of
the SPI layer) is certainly a realistic option for the higher
layers, but requires finding consensus both on the the logistics
(subsystem, code ownership, interfaces to other subsystems)
and more importantly the user space interfaces that look like
they will require several revisions on top of what you have
today.

      Arnd

