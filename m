Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E893C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojUr1vX2O+SkyztTvSXJfl/0FZqERFScpoC9eKoRr3A=; b=unY6TdAHlh6Zzh8q2lh2SwhkYD
	X7OVOgrfAeoSwZ77SOBBmETlAYS13uS/KbIKclREj9eoaMOeZOdvdvLSzj0nzNT0PYAgLC3/UvCUC
	X3B4MTRkq8gPsFJ1HvDgr+Q3ckV6CGQPViysU+Y/um9L9y/6cnCyKxm6h+7dusgaMcb9M8LfmiqoQ
	SWolY2N2UeVU4AdTt1h8p1BW5/9dfcoKEQ0rZqwkzO/uXyPHFPL3fodNfekK09iWWndGC8aouJhiy
	qY6K92TVMnBfoGfHxUImQZC7zid+kPvXUgeFZw+KWJLCyYdJDWZ3OZI6kNqxhjw2okNbdFTx51w0W
	Hv6J4wPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdib-000000073js-2wIw;
	Fri, 03 Jul 2026 13:14:09 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdiX-000000073jW-3vFt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:14:08 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 621531400039;
	Fri,  3 Jul 2026 09:14:04 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 03 Jul 2026 09:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783084444;
	 x=1783170844; bh=ojUr1vX2O+SkyztTvSXJfl/0FZqERFScpoC9eKoRr3A=; b=
	fgnyp9Difn+D/cV45yJ4PTnrCJVtrVnbTvBiIXCABXQAlIDtbRWF3OlOJ+Nro2eT
	SEdd0ui/r1G/7hm6fPqGg2cSnCf24AvFm1Xn5siELXQVm2+0C+CBsKBzgeD4jC4P
	cD/UnPbg9WeWePshoQMlmsjsfMmqH4KgnvuuoZ7pFu0vp0TnOgDDC3qAw533C+i8
	eslc/y/SBE6Sg8P2qCF23Z+0pI6iA+hcogHXi0D6DlAXsuGXaWikLeZ+UOU0bAos
	jCky5+ZFBnfo5RJtDoewhr1xzqYy1MLsc0DUODIuOaATBa5jE7UMGeopKzmpFRG5
	h/w+lnHfe0gLIOguuTZiyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783084444; x=
	1783170844; bh=ojUr1vX2O+SkyztTvSXJfl/0FZqERFScpoC9eKoRr3A=; b=e
	XZ0wYWcVGEjdjKRsNNX4KaPoIQqhCID6z6BkKV4oaZIdHIYnTmnrbvhFEAmspIQp
	xhcTaPW09ns6whwMN5hBNkDaSgx3QN+5Y/jdcXerJKDXH339OnhSeNiwwc8fuSzQ
	5cKmDbKQJUWk9Th7x2RLwXbMfiaS7glyX7lzQUFc+56wXJrG105dK3vToKYhPZK3
	wsKhdTEJNyab60hVtdcS7jKlpsCAj47qES5PW/OrHZWxvlBihYEqG3kz4rT0Bcjm
	HTywB1PkhmXeKkwNycg8XAO7Ob8Jpi38EUr37h+a9qKeGLo728pvPTYJ3OeHQ2Aq
	ql2QFbnzmPCZitvoZCEVw==
X-ME-Sender: <xms:mrVHamO_xOwF6HXzs3gVfVdTpxEh0HOAFUqW486vbBYKsk3my0HY5Q>
    <xme:mrVHavxCi7ghkJMeoh8TF8NQFYKE4IKSazTt8i9qYjBi58-wb01Nrv9WC45p6dyXg
    n4JOJ_mrZdrR9OWz1MqLbHFI1T6kaHO0eHKORNDRhCSSPak-9K2pQ>
X-ME-Proxy-Cause: dmFkZTElqKxXAyszbKaXUmh2Ouw+7YSCQNqD/A4IeDeBk0Xu9CXTdS5YsOXmraHljjSWr/
    tzus8WG0A7nQretBNG8jkMWDnZ1kzuE6GutRzvYD62EkWcAm5LVGGnOyTmw89Sy9fUmWWr
    7bTTp9plNOp+i4899VdcmB2eJzEIjwNa0kpqnbxrn3ElUvdRJchamW5+sYL3jUE8C2dKUr
    kpAzbEWzV3dk4G4NEo0IW+RNS/2sx2tSUhvj4sYEC0eBst4BvLgmx/LIG9nRXcTSto8M95
    tERQhlgG58r1OoV/IdBeiKaS6ER8YCeJRoWKCxmsUSrgw9+M5BDgRwCaA9I++zneOMxtGJ
    mwmrUmZgZorCV6xWOjOM+qXHvBHSkUy9DRskkw6LNCcCGDzqmpQKbLdygEDfeYeOspAdcZ
    YNfV+PccHNEGTPpwvLWxqHyx7GyQgDFtNZabYHtiQQMia29OyQHMpt2k1DTnIqvzcoeg1c
    5Sd4Xwo9whta/wU5QNx/6oKclD+W074mcJs5xiT4g6RRXCTMlwL1J3Aw4H0DD2tErnEAVY
    /QKMpKEPqdBcZCIxzpZEL3BB55MNIMtUh4qOlGXhbsWFCUl+Vehy1s2TOJhqAVY/bXXs2X
    Q7KrV3LdM+Ub4rBZDmWE8UmP5D3qNq4NcSkjdp/mFEE5hqaeQ4to0mbYrsmg
X-ME-Proxy: <xmx:mrVHarEi7cnbUQDQjBuxT4k_AJoZpOoXifcSemhyNWN6iZHfjI_1Jg>
    <xmx:mrVHauoTuBMsUJqoF3giMq91GNA82Pv9N6UR1MxcW7p9n8XrWowk4g>
    <xmx:mrVHajIsiQD9Zs5p5un1ZChnOrc-VwBOWVdgY-qpRxqHmv7KK5nURg>
    <xmx:mrVHamZeMfENYRV915qvkADoMRPnsIjH1UBX5n_p0tG0LyYxKfChBg>
    <xmx:nLVHanNIuRxMDcvZej3krdovS663tCIPC3ChkJDDJqYtBso5KORVTyGq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CB0D6182007E; Fri,  3 Jul 2026 09:14:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AGmtKsPYCFtV
Date: Fri, 03 Jul 2026 15:13:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Daniel Mack" <daniel@zonque.org>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, "Marc Zyngier" <maz@kernel.org>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Ralph Siemsen" <ralph.siemsen@linaro.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>,
 "Stefan Wiehler" <stefan.wiehler@nokia.com>,
 "Tony Lindgren" <tony@atomide.com>, "Vladimir Zapolskiy" <vz@mleia.com>,
 "Will Deacon" <will@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Message-Id: <58b4260b-8d55-49fc-bdea-f338a04b9678@app.fastmail.com>
In-Reply-To: <CAD++jL=+GTZ0FfzPUvp-4y+Hvkh9MCnr2imsoxkRAZtWdKNEyQ@mail.gmail.com>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-15-arnd@kernel.org>
 <CAD++jL=+GTZ0FfzPUvp-4y+Hvkh9MCnr2imsoxkRAZtWdKNEyQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/19] ARM: mark mach-sa1100 as deprecated
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_061406_967484_53944240 
X-CRM114-Status: GOOD (  17.82  )
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

On Fri, Jul 3, 2026, at 14:30, Linus Walleij wrote:
> On Wed, Jul 1, 2026 at 11:26=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>
>> If anyone is still running one of these four machines and planning
>> to keep updating their kernels, please speak up now so we can adapt
>> the plans as needed.
>>
>> If nobody is found using StrongARM1100 any more, it can be removing
>> during 2027, leaving 6.12-LTS as the last longterm support kernel
>> for it.
>
> I thought for a while I would do it but didn't have the time or
> energy, so I dropped the ball on this.
>
> That said, the current LLM code agents are a bliss for tedious
> tasks like this, it should be pretty straight-forward to convert
> SA1100 to DT-only if (and only if) there is active interest.

Right, and of course we can always bring it back later if
we someone does a DT port, we would just treat it as a new
platform then. I had started cleaning up
arch/arm/mach-sa1100/include/mach/ at some point in the past
but gave up as it got too hard to untangle those without
breaking stuff. A new port would likely be easier there.

       Arnd

