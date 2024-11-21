Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996D9E65D00
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 23:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uu3DVFkSAaOEW7I/uq+yG57rWBmWL715YZ3wLl/sEaI=; b=xc/lrBeD/Z2KSgSXe9kT+socq+
	lCrulL0jg5smtb5pyKcSi7RtDLWhTFa57JtwD4emE2G9WztvX5MIFnpPdXhoq1aDkBROr8arARyDS
	xbc0JuwgmrEDY47FRnfCskXO9Z3fVTQZh5sgHTwGQQqcgkwx40H7m6q371RYhkBPnjf2E2t0AGF9x
	47deHIW1miJF9ioyKf9Wv6Cf2FP+5VKYKuoOthFYVJUVai+IPsxj67MbT536db7pRhdpmuheD9V+n
	cpNKx96RWGZSyt74QHb2W0GHIE3rq1VPXMfMY3VMSnZclolkqzmOVf5XU25chwzp9NahB1QOXaJk9
	TpcmpwwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEGH8-000000017x1-0K1Q;
	Thu, 21 Nov 2024 23:07:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEGGB-000000017sb-1ij0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 23:06:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E295B5C57C8;
	Thu, 21 Nov 2024 23:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52799C4CECC;
	Thu, 21 Nov 2024 23:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732230410;
	bh=ykM+cGUh7CJ7hLxw+42G2uQHh3ba9Rwc9VKC1VnWXRk=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=g4Brk4SY0k1fTpVU+0kDUdTeSulN9g/VBSTR1qryVPq6oVLhVxbz04ZQx/7hd+LPW
	 96aB9YtVXoXTPFpecXjxRt/ZGyEqagdf4OrQxbLogK9l+yuu9tKTpE/gDh526OcWoj
	 H1ObMi9LnfHduPi9Obq8Gruu9kSq5P5C14q6uwmaBKyxFfIreFHxgs9Pvg4/OJdQIf
	 oY6fqTUDmkDSU8rClMhHbDWsfMAkhimLjaVGJfRfytLzK4Xyfzq/EyUJOp0EKLJWrQ
	 LfWgKGXReTmgbx4NkMcH+bTyMRzFmOgsyJgVPBKcpy5UNg5aIewth2IqT+aKOVQxyl
	 YeUOgZXgiHZmw==
Message-ID: <a68516df98c8b8fb80f094e6e55fcb8d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <SI6PR06MB7535F5D22E3FCCF5C610B307F2552@SI6PR06MB7535.apcprd06.prod.outlook.com>
References: <20241028053018.2579200-1-ryan_chen@aspeedtech.com> <20241028053018.2579200-4-ryan_chen@aspeedtech.com> <287924eed186e3b6b52cd13bcf939ab6.sboyd@kernel.org> <SI6PR06MB7535F5D22E3FCCF5C610B307F2552@SI6PR06MB7535.apcprd06.prod.outlook.com>
Subject: RE: [PATCH v7 3/3] clk: aspeed: add AST2700 clock driver.
From: Stephen Boyd <sboyd@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, joel@jms.id.au, krzk+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Thu, 21 Nov 2024 15:06:48 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_150651_535386_47658B62 
X-CRM114-Status: GOOD (  24.70  )
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

Quoting Ryan Chen (2024-10-31 00:24:39)
> > Subject: Re: [PATCH v7 3/3] clk: aspeed: add AST2700 clock driver.
> >=20
> > Quoting Ryan Chen (2024-10-27 22:30:18)
> > > diff --git a/drivers/clk/clk-ast2700.c b/drivers/clk/clk-ast2700.c new
> > > file mode 100644 index 000000000000..db9ee5031b7c
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-ast2700.c
> > > @@ -0,0 +1,1513 @@
> > > +// SPDX-License-Identifier: GPL-2.0
[...]
> > > +struct ast2700_clk_info {
> > > +       const char *name;
> > > +       const char * const *parent_names;
> >=20
> > Please don't use strings for parent names.
> Sorry, do you mean use clk_parent_data struct for parent?
>         +const struct clk_parent_data   parent;         /* For gate */
>         +const struct clk_parent_data   *parents;               /* For mu=
x */

Yes.

>=20
> >=20
> > > +       const struct clk_div_table *div_table;
> > > +       unsigned long fixed_rate;
> > > +       unsigned int mult;
> > > +       unsigned int div;
> > > +       u32 reg;
> > > +       u32 flags;
> > > +       u32 type;
> > > +       u8 clk_idx;
> > > +       u8 bit_shift;
> > > +       u8 bit_width;
> > > +       u8 num_parents;
> > > +};
> > > +
> > [...]
> > > +
> > > +static const struct clk_div_table ast2700_clk_div_table2[] =3D {
> > > +       { 0x0, 2 },
> > > +       { 0x1, 4 },
> > > +       { 0x2, 6 },
> > > +       { 0x3, 8 },
> > > +       { 0x4, 10 },
> > > +       { 0x5, 12 },
> > > +       { 0x6, 14 },
> > > +       { 0x7, 16 },
> >=20
> > Isn't this the default divider setting for struct clk_divider?
> Sorry, I don't catch your point.
> the SoC do have default divider setting. But it can be modified.
> And also have different divider table setting.

I mean that this is the way that struct clk_divider works already. So
you don't need to make the clk_div_table array for what is supported in
code.

> >=20
> > > +       { 0 }
> > > +};
> > > +
> > > +static const struct clk_div_table ast2700_clk_uart_div_table[] =3D {
> > > +       { 0x0, 1 },
> > > +       { 0x1, 13 },
> > > +       { 0 }
> > [...]
> > > +               .bit_shift =3D 23,
> > > +               .bit_width =3D 3,
> > > +               .div_table =3D ast2700_clk_div_table2,
> > > +       },
> > > +       [SCU0_CLK_GATE_MCLK] =3D {
> > > +               .type =3D CLK_GATE_ASPEED,
> > > +               .name =3D "mclk-gate",
> > > +               .parent_names =3D (const char *[]){ "soc0-mpll", },
> > > +               .reg =3D SCU0_CLK_STOP,
> > > +               .clk_idx =3D 0,
> > > +               .flags =3D CLK_IS_CRITICAL,
> > > +       },
> > > +       [SCU0_CLK_GATE_ECLK] =3D {
> > > +               .type =3D CLK_GATE_ASPEED,
> > > +               .name =3D "eclk-gate",
> > > +               .parent_names =3D (const char *[]){  },
> > > +               .reg =3D SCU0_CLK_STOP,
> > > +               .clk_idx =3D 1,
> > > +       },
> > > +       [SCU0_CLK_GATE_2DCLK] =3D {
> > > +               .type =3D CLK_GATE_ASPEED,
> > > +               .name =3D "gclk-gate",
> > > +               .parent_names =3D (const char *[]){  },
> >=20
> > This has no parent? Why is parent_names set to an empty array?
> Due to I use clk->parent_names[0] for clk_hw_register_gate, const char *n=
ame parameter input.
> If null, that will cause panic for NULL point.

But the parent is NULL? How many parents does this clk have?

> >=20
> > > +       if (!clk_data)
> > > +               return devm_of_platform_populate(dev);
> >=20
> > What is being populated? Isn't there always clk_data?
> Yes, it is always clk_data, I will modify to be following, is it ok?
> If(!clk_data)
>         Return -ENODEV;
>=20

Sure.

> >=20
> > Please don't use strings for parent_names. Use clk_hw pointers or DT in=
dices.
> Use clk_pareent_data is it ok ?

Yes.

