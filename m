Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34534C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 01:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=197jgArcHmxjLWJHP3d90o+UVqJqNHrwpTlU4PAOVr8=; b=cfC0ZP9/xGvzWRQhb68u1eeuSM
	r5p+UESiyTyeStLQEubWZd5M3ONWAIlVctqabCJiUdYSIWF7lqiPSAh0dPLMSvNknvzXTiVctZXsN
	UIMrgm5B0Y8Bk717vBMl3yi4YmVjvYsw8kdDf8QPijYF12ozmOo7M63Y8vY/WsUW581B0k0X3bEnW
	GwjQMuz1xt97giRqEKxxNoln01ldqTZfyXUyY5WHW/qCRvTd0vWMT6NE+9mQKVqg7+OAyePeXffcY
	fPkfrHK9lbpWq69eCmExqYYBjmBRr5pWR2PSMDqu2HUrmKTbi917IMmn1NtGQYEa4pLrWY7nPxziy
	gv8Fy0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjpXH-00000002wG3-2ADF;
	Mon, 17 Feb 2025 01:02:59 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjpVp-00000002w5U-0mt2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 01:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739754086;
	bh=197jgArcHmxjLWJHP3d90o+UVqJqNHrwpTlU4PAOVr8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dVKCB49IuOAKDBlVaPc9OJo6YDFoJZbcM/73itjicoXBVo6S2sPz98dFefq4uonsz
	 0BOxMYXB3j2NK8CAWrVU1QDuLIi72fkv/qGyupH2DHgDsjVyyLyY/pQ9gcPQVdIRiN
	 gh85us7w3ofG5oaX9OrRJ7r85MgpoDeJbBNtYtpOjLvnB6Sasq++sGDmHN2A0g5cLB
	 lXnfnx/7FBFsUK91O82KNMj+2Py7brat2sbPFe1om68YHwBKdLtp+nTOyEo8RkWIJf
	 hj+Y3J40hjbSES0Y1Q2wl0/HFqwK/O645xee/IlHgmN9ZNkmH5W0rx5iRXBl3vtwAy
	 Z+pURH3shKXwA==
Received: from [192.168.68.112] (ppp118-210-170-58.adl-adc-lon-bras34.tpg.internode.on.net [118.210.170.58])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0C16364E5C;
	Mon, 17 Feb 2025 09:01:25 +0800 (AWST)
Message-ID: <047ea26fbb5713e852431d0731e21d34af39e1c2.camel@codeconstruct.com.au>
Subject: Re: [PATCH dev 6.6 v3] ARM: dts: aspeed: yosemite4: add I3C config
 in DTS
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>, patrick@stwcx.xyz
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Feb 2025 11:31:23 +1030
In-Reply-To: <24d2d411365004f11498777501da54d6a9c6e758.camel@codeconstruct.com.au>
References: <20250214011556.1891113-1-marshall_zhan@wiwynn.com>
	 <24d2d411365004f11498777501da54d6a9c6e758.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_170129_425855_060881A5 
X-CRM114-Status: GOOD (  13.69  )
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

On Mon, 2025-02-17 at 11:14 +1030, Andrew Jeffery wrote:
> Hi Marshall,
>=20
> On Fri, 2025-02-14 at 09:15 +0800, MarshallZhan-wiwynn wrote:
> > Set I3C config in yosemite4 DTS.
> >=20
> > Test plan:
> > Tested pass with aspeed I3C patches and I3C hub driver.
>=20
> Can you please expand the commit message to provide details? This
> statement is quite vague, and I don't find it terribly helpful as it
> stands. Which aspeed patches? What tests?

Also, you've sent this patch to the upstream lists and maintainers, but
it appears you're intending this to be applied to the OpenBMC kernel
fork. Please understand the difference between the two and review my
recent response to Rush Chen:

https://lore.kernel.org/all/9f0447151e6574d74e7fa9cbbb50d8e970059273.camel@=
codeconstruct.com.au/

Beyond that, for patches to be backported into the OpenBMC fork they
should first be merged upstream, in which case they must be tested
against a recent upstream tag (e.g. v6.14-r3) before they are sent. It
will be worth reviewing the following:

https://docs.kernel.org/process/development-process.html

The "Submitting Patches" documentation provides a more succinct
treatment:

https://docs.kernel.org/process/submitting-patches.html

If you have any questions, please feel free to contact myself or Joel
off-list.

Andrew

