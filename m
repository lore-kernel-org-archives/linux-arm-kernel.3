Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E193FCF45DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 00:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVaR7pDXKQQZrzQCpbAsKQEkeRYpez2j/VHjvnBNbww=; b=rmX7YBCY+XJlFh+wb+cpvwwqIA
	5TL1IDnDkn5ZHb/NChq9gBVi54TcMo0gCQFkPu1ebSjoArTedmFs6QWPWcGKYqxNIPX5cXYkJpOeV
	+IHWZ0MK4fOozUGS5Hze49+r/ZVloJEL8yr0cO2dTret5hzFudzu5qqpZE7hMVZrIvaKqM7w1djpA
	KvQWwIWoOOZEr4XRax2c7gRCWpyVHX3eokXWLWpIoHtIXklPJCG7TJbVqsBGloRTmwYS4tZPHVjus
	HajBp/zWQyXxddB+p/H528k/wunvqCqCSxlBCob74FInE/9ZaqRxYvGvhBk1Nj3EBSbWEKVctfqXN
	dCE2rkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfSjD-00000006Mjw-3uge;
	Tue, 13 Jan 2026 00:57:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfSjA-00000006MjZ-3NtZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 00:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768265850;
	bh=SVaR7pDXKQQZrzQCpbAsKQEkeRYpez2j/VHjvnBNbww=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=H7mvQPUX98ELFBCpdHBxurf7rawwayXoOHboAkmLIBW+BXVZ4/NNmuT+79S12Tiqf
	 qSQbCuLyfQzuLPneT4m0i00TtwWrVy7MMszQhS98zxQm/z5Sy4oCmWzrQxEVQxOJJG
	 L4eDSDR2+/M8Jyodgbwmw3U68FhvN8fn+ZwV/seDPzDzcduuwTvmH0GIoK5U5FEOmq
	 LwpLp5zufMPe7YK7Hsu/vbU22lkrVxGp7L5ugBOnSXmvRrP5xXl9xk1VWxgv3ceSSf
	 LdY6E6JKAkNGlc4rK4u6Szzg93gaoV2taKf0KEQrsgXsfB9DBldwTRvwYflgJZFZ0f
	 80zGvtm+44vsg==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 52C3864706;
	Tue, 13 Jan 2026 08:57:29 +0800 (AWST)
Message-ID: <e97b7a193f8bbfca9ec00037808ad80a5baf9f00.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asus IPMI card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, Krzysztof Kozlowski
	 <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Tue, 13 Jan 2026 11:27:28 +1030
In-Reply-To: <CAJ13v3RKydFK+sP_Cm-HnQjsOJSDyX_dsGs_Yy564V=Wc7tQFw@mail.gmail.com>
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
	 <20260111201040.162880-2-anirudhsriniv@gmail.com>
	 <45bdf2a6c0d33dd6ce0fd3cc279ef6edc509a540.camel@codeconstruct.com.au>
	 <20260112-whimsical-annoying-fulmar-25e4d9@quoll>
	 <CAJ13v3RKydFK+sP_Cm-HnQjsOJSDyX_dsGs_Yy564V=Wc7tQFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_165745_051415_02CAF4E9 
X-CRM114-Status: GOOD (  22.99  )
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

On Mon, 2026-01-12 at 15:21 -0600, Anirudh Srinivasan wrote:
> Hi Krzysztof,
>=20
> On Mon, Jan 12, 2026 at 5:47=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >=20
> > >=20
> > > It's a bit bike-sheddy, however: the pattern tends to be
> > > ${vendor},${platform}-bmc, but as the platform can't be specified and
> > > the card's function is the BMC itself, I'd go with "asus,ipmi-
> > > expansion-card" (I couldn't immediately find a useful identifier othe=
r
> > > than the product name).
> >=20
> > This should include some model name or at least soc. What if you have
> > IPMI card for ast2600 and later completely different for ast2700?
>=20
> Personally, I was okay with Andrew's suggestion of naming it
> "asus,ipmi-expansion-card" because that's the official product name
> and that exact term works well for online searches.
>=20
> This seems like a pretty niche product Asus announced 4 years ago and
> made in very low volumes. I'm not sure if they'll make a new one with
> an ast2700, given how the modern trend is to have BMCs on
> motherboards. What do you think about the naming Andrew?

I agree that the product seems niche. There's practically nothing on
their website on the marketing side - from searching around the details
are pretty much limited to the support pages. I can't really speak to
future stuff like an AST2700-based design though, who knows.

A couple of numbers turned up that might be helpful:

   1. The Quick Start Guide[1] seems to use "E21524", which is also
      used by some random blog[2] to identify it.=C2=A0
   2. There's "R1.04" on the silkscreen.=C2=A0

Perhaps we could incorporate either of those?

 * asus,e21524-ipmi-expansion-card
 * asus,ipmi-expansion-card-r1-04

However, they're not without some risk:

   1. It's hard to tell whether E21524 is properly representative
   2. R1.04 may also problematic as an AST2700-based card will likely
      restart the numbering and risk a collision

Otherwise, I guess there's:

 * asus,ipmi-expansion-card-ast2600

Andrew

[1]: https://www.asus.com/us/supportonly/ipmi%20expansion%20card/helpdesk_m=
anual/
[2]: https://blog.liaosirui.com/%E7%B3%BB%E7%BB%9F%E8%BF%90%E7%BB%B4/A.%E6%=
9C%8D%E5%8A%A1%E5%99%A8/%E5%B9%B3%E5%8F%B0%E7%AE%A1%E7%90%86/BMC%E5%BA%95%E=
6%9D%BF%E7%AE%A1%E7%90%86%E6%8E%A7%E5%88%B6%E5%99%A8/IPMI%E8%BF%9C%E7%A8%8B=
%E7%AE%A1%E7%90%86%E5%8D%A1.html

