Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201FCCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VduldurJ6yueqRi+j1LwKyCAER+MpiJCGhM98uQ5wU=; b=JO5v/ziwy3tb9bV5smtTzAxpLj
	VLTCANjVQHhEqXbBFyiwwUB7GxqtEqCMOlKSuCnR6O0PSrYJbwAhrdvjc/bA9H32wMp8h3UrLvMlN
	/4tzDafiiDSrs2jKlKVRI4rwAxqbC5NCfX5wzx6NSu6DJS+3dd2BDedEIOh7EBHIQyRtnhP55Fdm+
	z5kk00e2xgYj8XHJXfRjGASDU3OmvgrSKZtIPzxk46hY3lbEXyBiSQ/aH2ZmoMdGqDdGWmJxPyT0m
	YRTaJQe7vAGe+Lek4zVFYNSH7qpvQdgeq4wwelmQNfbW64/PRrgN34s3t3WWUm6blwTY2zA4/YNej
	fzHruSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9uw-00000002BwL-34r7;
	Wed, 29 Oct 2025 17:25:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9uu-00000002BvA-18jC;
	Wed, 29 Oct 2025 17:25:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9940043F46;
	Wed, 29 Oct 2025 17:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560EFC4CEF7;
	Wed, 29 Oct 2025 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761758699;
	bh=Y9eg+bqtuiBvhj27qPsEMgI3sW1YPbmbNenD0mtafaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EaCvJ3fiHxDt543+sjeDB8LsZ82ttPD7FQK0tI8+cvxbDcPE7liNpVCjbI6Bd3T5Y
	 x+w4+dvepmDJXwiWd50kB95RLAM9dQRLbW3k60fPkivDBZVeYqxun0qWyark9akkKn
	 MhL7NBjfLVhfH1d0eQY9xoeY68/dNDYU95kQuI9PURJVhVHno8mZ4PSGbBHoyAz4b6
	 wQ3yxMXqOcUO/G7tU740cLgruD5pAF4FAaN+v+nqe/9gO7LDQaXab1TKVs8NJWeAZx
	 qb3CCXhg5Fm7q365p30Cx5ETU4bXovasTXW64WcHN4Y0X5sqnBhh15ZCxj3k5vVek3
	 vSWVve+SE470Q==
Date: Wed, 29 Oct 2025 17:24:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add NineTripod
Message-ID: <20251029-reseller-unsavory-5461fe7f6cce@spud>
References: <20251028-semicolon-audacity-dd5bdd418207@spud>
 <CALj3r0hWzH+pmkbJe7DdqEzwqcpSQdkfPFtv3S7m-H8gZp0A6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bqqsbG4ObdDSRjQO"
Content-Disposition: inline
In-Reply-To: <CALj3r0hWzH+pmkbJe7DdqEzwqcpSQdkfPFtv3S7m-H8gZp0A6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_102500_352007_85F56753 
X-CRM114-Status: GOOD (  34.10  )
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


--bqqsbG4ObdDSRjQO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 01:04:32PM -0700, Coia Prant wrote:
> There won't be any problems at the moment.

Please stop top posting.

> Just out of habit (because when writing code, variable names cannot
> begin with a number)
> There may be some misimplemented parsers that cannot do this.
>=20
> As a practical matter, the branch of openwrt has added support for
> this board in advance, and openwrt uses the DTS name to initialize
> some default settings such as LEDs and bridge

That sounds like a problem with the WRT development process. This is a
trivial change, there could be more disruptive things required to
satisfy reviewers. Why was it submitted there in advance anyway?

> I'm not sure if he will affect the version that has been released.
> But maybe it's not a big problem.
>=20
> If you feel that there is no problem, I can send a new set of patches
> to fix this problem.

Please do.

> 2025-10-28 19:46 (GMT+00:00), Conor Dooley <conor@kernel.org> said:
> > On Tue, Oct 28, 2025 at 12:38:10PM -0700, Coia Prant wrote:
> > At first, it was to avoid problems with the beginning of numbers.
> > What problems does starting with a number produce?
> > Given that it is already used by downstream projects, we have retained
> > this to ensure that users can seamlessly migrate to the mainline
> > version.
> > What's the actual impact of changing it from "nine" to "9" for
> > downstream users? This is a board vendor, probably nothing is even
> > interacting with the board-level compatible at all programmatically?
> > Please don't top post.
> > Thanks.
> >
> > 2025-10-28 19:35 (GMT+00:00), Conor Dooley  said:
> > On Sun, Oct 26, 2025 at 10:36:44PM +0800, Coia Prant wrote:
> > Add NineTripod to the vendor prefixes.
> >
> > Signed-off-by: Coia Prant
> > ---
> > Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index f1d188200..37687737e 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1124,6 +1124,8 @@ patternProperties:
> > description: National Instruments
> > "^nicera,.*":
> > description: Nippon Ceramic Co., Ltd.
> > +  "^ninetripod,.*":
> > Why ninetripod instead of 9tripod? That's what the company uses and in
> > the marketing fluff for the boards.
> > +    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
> > "^nintendo,.*":
> > description: Nintendo
> > "^nlt,.*":
> > --
> > 2.47.3
> >

--bqqsbG4ObdDSRjQO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJN5gAKCRB4tDGHoIJi
0jDdAPoClQkD6kyF0W8zdSBg6g+HBjeLj8bAkhQPXRv5HmS7DAD7B0sWK1QT34S4
iTErDKBUfPq7GGimNUNj0cY2Mjo7tgI=
=2YvP
-----END PGP SIGNATURE-----

--bqqsbG4ObdDSRjQO--

