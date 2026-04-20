Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4FAF588CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mj8RAP9/uofykJIdVLa13LaWWUYKPuyG+u16lfjWh4=; b=OUjBxad0V3nV3xIL4Uan8N1DRc
	DFOMeIL1gXFH8D0MFwE88B556xjRZQtL5iSnQosXJaP5Hi3lRiCtz4k0cMhf3H/J2Np6y3glf0Ft9
	Fg1FryUHEbG43n+FD0yhQAjc42035nDJbxAUO5MUyK7zU9MPqGfyQ6b2jaIANV9Vm4vW5eJi9XPNh
	HKvk+gnaYTr7ZlirhWT0jQ3elVBnJexYQrHbQnLlDHgXaX/XYqA9BKnRCJkYepMZm2PmE4iAQsBWT
	zkL5BGPZWssSiYALeLh9v3nDdCZP7MJdoK9bthi8Wfi2XCHroS6zH3k2ViFF9sSs91CdeZTKEn+G7
	9kTzKgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpGC-000000078Ug-0gJ0;
	Mon, 20 Apr 2026 14:06:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpG9-000000078SJ-2PK4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:05:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 508CFC5C997;
	Mon, 20 Apr 2026 14:06:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EAD05FFA5;
	Mon, 20 Apr 2026 14:05:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D831D104609B0;
	Mon, 20 Apr 2026 16:05:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776693952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/mj8RAP9/uofykJIdVLa13LaWWUYKPuyG+u16lfjWh4=;
	b=pQiPoimtg6qTaag9BcjlaMczteF6DEA8IoDnUWB7NIclufHoCNSD0R4oQG0Zh5NL+WuZEA
	iajliuAqic0sAA1X8q/g4FEFzdJjskYVDeyH60UWuuFw1rnndOU7AAUCsKK7V8+HErGW7t
	aQv9FlgwYpJtba4/s2MF0F+SwP6WfiaPuCI9uiz3skDP190p2QPAr0lMhykXaaD1/oPIhq
	I/9e2yA/IxnsTwrNbZae5EwaIsd/JJq9O9Q1hAy+qoNnXZrfuqc5679z1HWayG4N6rhZtW
	mDMCMzWP9l9nW8XfwX8JDe+WSVELP6VS7thbv400ohavmqdYWNGj1C6Gs/rujg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, Andrew
 Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.1 (#1)
In-Reply-To: <20260414-nifty-conscious-fox-973b65@quoll>
References: <87cy072bho.fsf@BLaptop.bootlin.com>
 <20260414-nifty-conscious-fox-973b65@quoll>
Date: Mon, 20 Apr 2026 16:05:50 +0200
Message-ID: <87mryxrakh.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_070557_756521_551CAF21 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

Hello Krzysztof,

> On Fri, Apr 10, 2026 at 03:25:39PM +0200, Gregory CLEMENT wrote:
>> Hi,
>>=20
>> Here is the first pull request for dt64 for mvebu for v7.1.
>>=20
>> Gregory
>>=20
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f=
27f:
>>=20
>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>=20
>> are available in the Git repository at:
>>=20
>>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/=
mvebu-dt64-7.1-1
>>=20
>> for you to fetch changes up to 00e6d608fe80b0f68c325cb46862f78e9a8ec768:
>>=20
>>   arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller =
node (2026-04-09 10:14:40 +0200)
>>=20
>> ----------------------------------------------------------------
>> mvebu dt64 for 7.1 (part 1)
>
> This was sent just 2 days before merge window open, thus I applied it as
> late branch.


Thanks for finally merging it.

Gregory

>
> Best regards,
> Krzysztof
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

