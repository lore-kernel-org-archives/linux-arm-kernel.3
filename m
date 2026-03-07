Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91663FC9EFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/p1L4/MpyS/oVrRUqVZ6WW0b/kykVlPX+MeBTz76C6I=; b=0h6gxi92QOOpcbzW1LqHraK2pu
	1zcv/OFYPaNXkb4jsQ23IeLjnOq06shbvhyOs6K3wWmAYf1ZAn1+XgUWGAuP98HzB/l0Eqk1YjpwR
	d7qgTtF2q/Tg7bndxr9Fco15jF7ujvFdKE7EkRQdWvKRhuirJyNNIww4jNUbprFEaZ2dSx4n4mjfC
	+1qQmaKWim4Ev0TztcA/WnCtcErfLd8J8Jv6kJkUNUMzy7mua2vd6zg4tdrr7HIMjej71Tb8ltq1+
	0b+FfodW+4qOBGxt8K9o9OAKzLqxSLW7telxYAbUHA8KICHDkzMA3d721N9k/6YqYeO44JQezAMOt
	/6YaMZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytSJ-00000005IS5-0E9h;
	Sat, 07 Mar 2026 15:20:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytSE-00000005IRY-0z0f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 621BF43CA1;
	Sat,  7 Mar 2026 15:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB40C19422;
	Sat,  7 Mar 2026 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772896833;
	bh=/fgbxZZex2Gb6npThQnHI6xLOWIQ4ppsK1R84CUgPAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=soxIpDOksKbESCJdJFuLSgfz45rhuLwdpu14rEsnlee7DXFGK+txM3Bh72up7M04O
	 7HAebHb7JtLpGmFqYPczDecSwLdDzlFi9LpVbQ5Sk9MkdLTM8hyDycSFXPIHPBoogx
	 X04+8tvaiVtj0yYVoF2eZzRUb1i2lCZ221T/HXJNGBCVXpf4b+I0SN6K2MLESDLCV6
	 FSOXab+PEdEWJQ9lpv7e01HOsKRGs1jgJINWV9LAKUv7aRmvSOmhwjr93a6Tpw5egz
	 IsTNuhaXbiCw0VfqT6FatuBAD4J+Qr1TprLWQUKcv9HY09eTLb9bHOAL+k/weNo0zy
	 9NcRRGdbURucQ==
Date: Sat, 7 Mar 2026 16:20:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Zichar Zhang <zichar.zhang@cixtech.com>, brgl@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, peter.chen@cixtech.com, 
	fugang.duan@cixtech.com, jank@cadence.com, cix-kernel-upstream@cixtech.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
Message-ID: <20260307-original-fantastic-potoo-c2c5a0@quoll>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
 <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_072036_054248_0AE5F77E 
X-CRM114-Status: UNSURE (   8.99  )
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

On Fri, Mar 06, 2026 at 11:10:35AM +0100, Linus Walleij wrote:
> Hi Zichar,
>=20
> On Fri, Mar 6, 2026 at 10:32=E2=80=AFAM Zichar Zhang <zichar.zhang@cixtec=
h.com> wrote:
>=20
> > +  clock-names:
> > +    description:
> > +      Optional name for the GPIO controller input clock.
> > +    minItems: 1
> > +    maxItems: 1
>=20
> I think clock-names: true should suffice, but the binding maintainers

There is no need for clock names in the first place. It's pointless here.

Best regards,
Krzysztof


