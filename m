Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB380E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GevLmvfwiXsrwkExVMB51n5zrgaKIKEjgRHeUZKe3dA=; b=4SPOqylbCGjMysMNOyIsDiOBwk
	oFeZWSWItWyyHWkLLULYwg2lPb1Co4uN00G3zsI6+Y//gOzVPTftmF+w5du2n8qjFsYKeSUGFvMN/
	XR/hKjfLgL3I2AS6yYDfrPxOn7/+S3OCF7uHcg5JGSs5QkF0BCXHlvEVfwMJWtoJutNgNidMMjv8c
	zpqPHatJcVi4vtz1unthv8sbkQjJW+h+MsGyz6WWvdfwbHLivDHGodukbAZ8H4j5EEYbfcYCrAhY7
	94l9+50c+IRmMBgMh49/KDtldesiCC/N8mOa2OuVv4fMWsfGsK/s+ggGkITRenxKpAD/+1PNo6b1K
	L2Jtc/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgfK-00000002szP-0ZNm;
	Fri, 06 Dec 2024 22:19:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgc2-00000002sZC-3qoY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:15:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2024A44550;
	Fri,  6 Dec 2024 22:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0D1C4CED1;
	Fri,  6 Dec 2024 22:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733523349;
	bh=5hI/uypdQ/H8IoEyLiu4ZQJXiF2mNJEIaK8PWV6n+Us=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=GvqzUsXZoGMcNUjVnwdwKwQVvHQX3ZGAVH/1iCL4fI1Att4BK5LiOOpASFiQUA4p1
	 p+bONBwTrRgrlGDAOYAOmowbokEdDtazIvMBcOKBtsi+W3G4dr57OH3vGpUSlNJO1I
	 uwcQ8VtvlQlhR/ktqYNx97hG/IBDHkThDgtQLffUYtHfZKgXIx6VZusZdp0kGT8iiG
	 S1+5EoLHmj9ZIwfRmstGG2N7U7HRbQepRqApC7i0+qlyvQu8UGY1jlZMFXG7AZwQ10
	 A8QMNELaAHuyoclDsPYHiFEw+CZlXv6FmrCw4R77ukLGfhUhEC9TI3FL5d42aDMEx4
	 cm16AMPPg28sg==
Message-ID: <c898338622625cbfc825e8d4cc5f0fff.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OS8PR06MB75418449B451224C5AB46FBFF2302@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241028053018.2579200-1-ryan_chen@aspeedtech.com> <20241028053018.2579200-4-ryan_chen@aspeedtech.com> <287924eed186e3b6b52cd13bcf939ab6.sboyd@kernel.org> <SI6PR06MB7535F5D22E3FCCF5C610B307F2552@SI6PR06MB7535.apcprd06.prod.outlook.com> <a68516df98c8b8fb80f094e6e55fcb8d.sboyd@kernel.org> <OS8PR06MB75419637D55A022300E00850F2352@OS8PR06MB7541.apcprd06.prod.outlook.com> <9ccfb478d9a122db6c634e9559e211ff.sboyd@kernel.org> <OS8PR06MB75418449B451224C5AB46FBFF2302@OS8PR06MB7541.apcprd06.prod.outlook.com>
Subject: RE: [PATCH v7 3/3] clk: aspeed: add AST2700 clock driver.
From: Stephen Boyd <sboyd@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, joel@jms.id.au, krzk+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Fri, 06 Dec 2024 14:15:47 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_141551_021104_5CECA0D9 
X-CRM114-Status: UNSURE (   8.30  )
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

Quoting Ryan Chen (2024-12-04 16:48:42)
> > > struct ast2700_clk_info {
> > >         const char *name;
> > >         u8 clk_idx;
> > >         u32 reg;
> > >         u32 type;
> > >         union {
> > >                 struct ast2700_clk_fixed_factor_data factor;
> > >                 struct ast2700_clk_fixed_rate_data rate;
> > >                 struct ast2700_clk_gate_data gate;
> > >                 struct ast2700_clk_div_data div;
> > >                 struct ast2700_clk_pll_data pll;
> > >                 struct ast2700_clk_mux_data mux;
> > >         } data;
> > > };
> > >
> > > struct ast2700_clk_div_data {
> > >         const struct clk_div_table *div_table;
> > >         const struct clk_parent_data *parent;
> > >         u8 bit_shift;
> > >         u8 bit_width;
> > >         u32 reg;
> > > };
> > >
> > > static const struct ast2700_clk_info ast2700_scu0_clk_info[]
> > > __initconst =3D { ...........................
> > >         DIVIDER_CLK(SCU0_CLK_AHB, "soc0-ahb", soc0_ahbmux,
> >=20
> > Can you also show what soc0_ahbmux is?
> It will be following.=20
>=20
> static const struct clk_parent_data soc0_ahbmux[] =3D {
>         { .fw_name =3D "soc0-ahbmux", .name =3D "soc0-ahbmux" },
> };

Instead of that, please use only the index.

 static const struct clk_parent_data soc0_ahbmux[] =3D {
         { .index =3D <number from DT binding> },
 };

