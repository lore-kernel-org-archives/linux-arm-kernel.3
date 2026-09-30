Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DD5CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFVT5QTGgWVX3GeKH0ZmOYAa25Bwp6h9DphCo8+86+A=; b=UrNqQ88/kTkO+dCQMxnfGYU/8a
	PDIycG4WJ7TczrkeEiweb37lXx1t3dwSWdhaw7cBSjx5AuHQjPpZGSpzvVFG/hU1AlZyXTcsh0jjg
	ZS8L09wHQh6nq1eBLTA9AQi++RWbRzUW1lJ6oM5huzs8pRdb8rGTOn7gUkS63wWajWWhheQ+r9vjZ
	i7O+I6zrhnughEHel7FIJ99ov+4pqE+3A9vq62z6XwV49zI369CCxjUO9xKkPZWOV5aQfko0AP9Rh
	7ZyMeEJrFhXpGbd38YsANHVh7PrmMiyOkXOhnfKJri3WqvtFPh6yF5VWUmYc5YaiQtKxIkd5/1wvw
	t45IgF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtr5-0000000649k-3o0i;
	Wed, 30 Sep 2026 12:56:16 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtr2-0000000649J-2oSv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:56:14 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CB48114001B4;
	Wed, 30 Sep 2026 08:56:09 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 30 Sep 2026 08:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790772969;
	 x=1790859369; bh=tFVT5QTGgWVX3GeKH0ZmOYAa25Bwp6h9DphCo8+86+A=; b=
	QtjLK636eoKEQeRuFRINRu0FhINzYmQz9wqNf5j8Ce24uhwRNjLEi2tx35yJj2L5
	r5vd36VMkGNKNOkkGBaooCMivizQ/jm81k3chI43+wenr0kidbj/iugP2PykSDwM
	c73aoV2H2Nod6Pf8/qWQ+EnK7uFHxrV5jBZ8KkbDmM+f9R6pefhZN8j8704jV1nl
	k4wwngRCRAL/CORgczHfUR04NYIpRGWqNmbxA7impc4rl8AqrwMvRf8j9urLsJAT
	GiogIrv7Vn4LYPiqPJcYa8tuJc80+eNOv+ZcCOG8eJu1ciU9T3yfRBPfSqUYHhix
	lE1ePDzwaTPn1rk+PbIe2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790772969; x=
	1790859369; bh=tFVT5QTGgWVX3GeKH0ZmOYAa25Bwp6h9DphCo8+86+A=; b=D
	buL9emGoW9mK54xZpgHEbX/bmDlNEjDbo5v8htlBY4VsTPffMfVhQK5avi4mQvl1
	IM4a2DXwgk1lHigZMkvhkMCS/ckCJRqzOeKmpTWmm5j45b9lKYKCP8Z+Apw38ft0
	ymoSQ/vMJmHbkLRVJ68P8BcMlBBV/Nn6BCPI9zWoCJ13Ttlboe7Mq4+3XiPbDEwb
	gl2fALqzjWRw4JxRUdU+MJSMFg5gy86NebmyWjMgF4z1yg8I95LoRMHLFJoGJp2J
	rkRFlR2a4oRt6xFWwgpcOKOoGCRVX+wblPvJSCFI+lvevDCqq2RXDM4oaMoA+hpP
	TZYRi1rUwd7hD+b299G+A==
X-ME-Sender: <xms:5Aa9aq0eq_NBtTAnUMcReYc6Ej9jshRq-M_9e9ZWdTgq5OZTKm-y-A>
    <xme:5Aa9an5RdqbziFMs7PHY4i6H9hdPFnzDt6F0wxU8l3clWYRoAQAPmLdwmhdQAngNm
    d0kY_JD3QoubSzCAmjdvaew1q5bCVYl6eLyiTI-KDpaL1h0ZVLbrlY>
X-ME-Proxy-Cause: dmFkZTFijiV+Hxb1I8GIafnwxZ7Y4UZWzsfWHbcxIgSRl7aYgeSb7kT+748ziVX9pclXEX
    y7vh7R2SlGdE2wq8pxWKdJzP5MHqznr8B+8bA9vF09K6tGrjGdvT4lUytvMFcOJkfstRYq
    Wi0y8wt+6u2iZjk+pw+3JWHBumbCOPcexhKItvFWxa0VRC6oMbnrJwuxQdBee1DPD5MwUS
    lx9/baMnNcAz50PtT280fWxG4NlZQUZTX/sCDo1I81l7f1m7oEH/cruhGrQjYqc81kmxSE
    azkJ7ueE3t8bzjYCvT/jfvGS/uiIvC+Xp1Vk+8SULmgqUx9RUAGfoYcLDIx+1DSvEjzWsu
    VaWzeA9O/oHF7gyV5p9iZLdCZHft8593QqXRUIkRmzztJjPVpT9q/BiAoJj4FqEF/VvGvE
    NbBqnsT1RRnL4HOgcSCLZfFwTjXAoKxus+TOWKhywNY3MVL5L6gtt3SgnUQjrm+P9VLjmk
    oMHESeZSkOirrAcQjXRbCp5KzTCHCadAa6gF5fm8cwMrqUkkrv6IqTE5lW9x4m86uNo4cr
    0KVzaBMA1fR+6ghmnSpXSurSGyVBOh0yCfN6ZMzI+eeW+7HpnCaomDdyVD2CiTM6QkNXki
    D7qypqzl2zUHB08rsfjDvQzji2oS+siNNbTC37lIM+4thRNcSNlJbTJvelVw
X-ME-Proxy: <xmx:5ga9asuGHGNEl-y30_zvVZOheSJcRQdZrh2nYxleVzFPvgscA2mGFg>
    <xmx:5ga9akKfCUTqBNkvKGwKgk5jLTS7Q3ZqhsfcUoNhbHv6xSoPO5g2KA>
    <xmx:5ga9aubNxbbz5RUu_RN0GUctCXVEyWT-irIrROcMYobbamI6NQSBbg>
    <xmx:5ga9aqLqZWot82K3dw-NZWhwhE3J2iYV4bMAnwrR-sgIYllFdPZgsQ>
    <xmx:6Qa9auuUu2E5L2J9dBI4DxAEU88xCJJDrovLOOfTrpkC0P2vmKXy7oiB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0B73F32A008A; Wed, 30 Sep 2026 08:56:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AAFgH-j8k6Zg
Date: Wed, 30 Sep 2026 14:55:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: "Linus Walleij" <linusw@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 "Jason Li" <jason.li@cortina-access.com>
Message-Id: <432b697a-d931-4523-91e5-9b45a08617ec@app.fastmail.com>
In-Reply-To: <179077030602.3399593.12266354979192327093@gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
 <179076583795.3054628.14443934429806440798@gmail.com>
 <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
 <d97a806f-a5a3-476e-8910-30027a6f568d@app.fastmail.com>
 <179076863241.3327419.16233537387530771884@gmail.com>
 <f6d0478a-3438-4903-a9e2-5d314f5948c4@app.fastmail.com>
 <179077030602.3399593.12266354979192327093@gmail.com>
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_055613_023227_56659767 
X-CRM114-Status: GOOD (  19.53  )
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

On Wed, Sep 30, 2026, at 14:11, Fil Dunsky wrote:
> On Wed, Sep 30, 2026 at 02:02:43PM +0200, Arnd Bergmann wrote:
>
> The boot loader is the stock U-Boot 2009.11 from the router vendor, and
> replacing it on these devices is risky enough that I would rather not
> depend on it, so PSCI is not really an option here.

Right, makes sense.

> A generic spin-table for arm32 would work for me, with two differences
> from the arm64 one that it would have to cover: the release address
> here is an MMIO register in the global control block, not a word in
> memory, so it has to be written with writel() through an ioremap(), and
> the Cortex-A9 SCU gets enabled in smp_prepare_cpus() (I have not
> checked whether the stock U-Boot already does that). If that sounds
> acceptable, I can post it as a separate patch in v2 and drop the
> enable method binding and mach directory from this series; otherwise
> I will keep the small platsmp.c under the name you and Linus agree on.

It sounds to me like this is different enough from the generic
spin-table that we should keep your current version then.

       Arnd

