Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6D3CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 00:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trv/5zES0J71ogwwSlHNmpRE442auLyV/o1fTLjOtsY=; b=ViGic1as0xRDrlgYkYR8ZBc4Fa
	hFlbr8Fto3sMn/n0TYnkYS6zl+8ADyVAfrCWZHzGdpLwZ+eJG/KQIrh+PtBxGeCbHinz0q2Lv2+Rf
	7UcmqYkrqcqfNmZv6gYRRIEcRJ8Q/a6S9dbLojc4uHiF0ALOvVvW1xK4AYO8GDNFhX8C+0im26m+9
	PyLuhUgQmqF+hi3KINPw1zEA0hLEvqVNp03jFxAGrRO+gJmIyAjJw/MwwQQSvXP2CNHh5Yuin394R
	2QlfCYMrTUgd5ChlS2oHtJG/d5cPQaTBgR0dfL8GrUjyUZfDYYnIjwH+uH7g65wEHLn6zaZxByrtJ
	NzDsDNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZfS-0000000528L-1AfY;
	Thu, 25 Sep 2025 00:17:02 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZfP-0000000524o-0Ge0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 00:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758759414;
	bh=trv/5zES0J71ogwwSlHNmpRE442auLyV/o1fTLjOtsY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OJ2QRaPE5M6I7OP/H1j/PrTVgCrSMP8UrZbzVbJyJ9se212oYGTasKT/W0nJ7I+XH
	 ufKTD795DRI0fcQbAbG4Akd1jFQhFgIBgbF9Hsd9dw62X2HbwkoHeOTNow7OPwDWHO
	 01TvqkRQaD37ozssgLvRxP2BAueimrUnliWp0A5eAXcAgpoXodP0Uz993+ElhG/G5j
	 hZb7lX1kvo7ItL6eQKyReGgHb3fIB4nnpYY5Psj6Olq3TMKiyomvU1KqwmUNxQA2bK
	 N6lSo2VEHUf2xwIN6720wRPNbNRpW4oVU/TXB1hs2vZgfs+iZTeHf20qDw0vajdGqj
	 k3l0y0U2BxUNg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 55C40738DF;
	Thu, 25 Sep 2025 08:16:52 +0800 (AWST)
Message-ID: <090d0e196fd0f814b5385f2c6e47e5196f0be649.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>,  Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Thu, 25 Sep 2025 09:46:51 +0930
In-Reply-To: <CAL_Jsq+zBK1CBJX0XcaqaYeOPUhoRE-nMeYvkTNwQovJ+dakGg@mail.gmail.com>
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
	 <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch>
	 <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
	 <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au>
	 <CABh9gBcoWbXurPo0f9U9+gz8k6gttUvj=NMMDVfgjo5dgaTLSA@mail.gmail.com>
	 <CAL_Jsq+zBK1CBJX0XcaqaYeOPUhoRE-nMeYvkTNwQovJ+dakGg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_171659_468200_7B35D02D 
X-CRM114-Status: GOOD (  13.27  )
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

Hi Kevin,

On Wed, 2025-09-24 at 08:34 -0500, Rob Herring wrote:
> On Wed, Sep 24, 2025 at 8:05=E2=80=AFAM Kevin Tung <kevin.tung.openbmc@gm=
ail.com> wrote:
> > I also checked the work with `make CHECK_DTBS=3Dy
> > aspeed/aspeed-bmc-facebook- yosemite5.dtb`,
> > and the warnings that appear are not related to these patches.
>=20
> Um, they are related because they are warnings for *your* platform.
> You don't care that there are warnings for your platform?

Which is to say, by contributing a DTS that relies on the ASPEED DTSIs
you're now part of the community of people interested in maintaining
support for ASPEED SoCs in the kernel, and it will be appreciated if
you could help improve what we have.

If you could pick a warning or two from the DTSIs and contribute
changes to address them that'd be great, as this improves the situation
for everyone.

Andrew

