Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F626C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 22:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kV2dCWqh30wK5eomOYuM1ivS9aep8Oxf9tocWiaMXy4=; b=ToQYPBqtpDG62SmU5lJsMHT4e2
	CUvEeYkJrxdNAf2oZ4p8iARZTptj/LmfEHZz2fNUqoTlN0JGlvwzAnD2z+B+TzkMWoVXs/aAcb2PG
	IQUezjea5g5yGHzUh0TyNm6Nr4Zg8uWWiiAZgTE9VOKMbUE3MY8UOUcr4wgEctO5WE/7TkxsH+v4O
	tzp+xAl/9iJ7rSBt/OqbjwpuT6HDUDLIanqfGvdlJ14uBHfWtF+oNWHn/pNZzmHNFXBEO32tVQmlW
	KwUwP3gIH0KfZX/ReDGmcC38G0BXbvLRecYeMhb9dm+XCnlIs3UGbfCYrmF9jrwWshuqsLumEiZmI
	I/YrdU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufnF-00000007I6W-2vHH;
	Tue, 18 Mar 2025 22:52:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufla-00000007HqP-1eat
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 22:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3011615BB;
	Tue, 18 Mar 2025 22:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601FBC4CEE9;
	Tue, 18 Mar 2025 22:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742338233;
	bh=c4bsVe+5uL9D6uBKzHJO71coGq992rq3ehHjhbm4ZO4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TxRsJ2Nwag6309asbOZC3fzbTIIkz6FiBRP5612KDJkVMfcmjUHRFhiHSoGe63NzB
	 QnSrAHR5WTT6/rOSny96TnP0KVrS7HKtcABULGkvLuzBdwT9uzPxJFZ1kgI3SIFY+l
	 B/pfSUjPIHl+ZKU6IdwM+Ly/o0bZoAJKtwH5l21igPdgXR2NLP1B1+G633bGdCas3a
	 +I4DYgOhHcSFrKWf7TZYKXZ39Woimk6n9VsO46V2APqdm37McEA8Mv1tM/FX5Qz90d
	 lzsquBJaVkX5O5WB/gBHf/qFK5Y4Z3imxIXMpmIJq3fIHDjm8AXkAEoIlPE1cb5nIp
	 MeB2r2YbGnUsw==
Message-ID: <ef86ccad056bc03af7f01d5696787766.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <65gl7d6qd55xrdm3as3pnqevpmakin3k4jzyocehq7wq7565jj@x35t2inlykop>
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com> <20250313110359.242491-5-quic_mmanikan@quicinc.com> <65gl7d6qd55xrdm3as3pnqevpmakin3k4jzyocehq7wq7565jj@x35t2inlykop>
Subject: Re: [PATCH v12 4/6] clk: qcom: Add NSS clock Controller driver for IPQ9574
From: Stephen Boyd <sboyd@kernel.org>
Cc: andersson@kernel.org, mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, richardcochran@gmail.com, geert+renesas@glider.be, lumag@kernel.org, heiko@sntech.de, biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, nfraprado@collabora.com, elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com, javier.carrasco@wolfvision.net, ebiggers@google.com, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, quic_varada@quicinc.com, quic_srichara@quicinc.com
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Marek =?utf-8?q?Beh=C3=BAn?= <kabel@kernel.org>
Date: Tue, 18 Mar 2025 15:50:31 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
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

Quoting Marek Beh=C3=BAn (2025-03-17 07:08:16)
> On Thu, Mar 13, 2025 at 04:33:57PM +0530, Manikanta Mylavarapu wrote:
>=20
> > +static struct clk_rcg2 nss_cc_clc_clk_src =3D {
> > +     .cmd_rcgr =3D 0x28604,
> > +     .mnd_width =3D 0,
> > +     .hid_width =3D 5,
> > +     .parent_map =3D nss_cc_parent_map_6,
> > +     .freq_tbl =3D ftbl_nss_cc_clc_clk_src,
> > +     .clkr.hw.init =3D &(const struct clk_init_data) {
> > +             .name =3D "nss_cc_clc_clk_src",
> > +             .parent_data =3D nss_cc_parent_data_6,
> > +             .num_parents =3D ARRAY_SIZE(nss_cc_parent_data_6),
> > +             .ops =3D &clk_rcg2_ops,
> > +     },
> > +};
>=20
> This structure definition gets repeated many times in this driver,
> with only slight changes. (This also happens in other qualcomm clock
> drivers.)
>=20
> Would it be possible to refactor it into a macro, to avoid the
> insane code repetition?
>=20

We have this discussion every couple years or so. The short answer is
no. The long answer is that it makes it harder to read because we don't
know what argument to the macro corresponds to the struct members.

It could probably use the CLK_HW_INIT_PARENTS_DATA macro though.

static struct clk_rcg2 nss_cc_clc_clk_src =3D {
     .cmd_rcgr =3D 0x28604,
     .mnd_width =3D 0,
     .hid_width =3D 5,
     .parent_map =3D nss_cc_parent_map_6,
     .freq_tbl =3D ftbl_nss_cc_clc_clk_src,
     .clkr.hw.init =3D CLK_HW_INIT_PARENTS_DATA("nss_cc_clc_clk_src",
                                              nss_cc_parent_data_6,
					      &clk_rcg2_ops, 0),
     },
};

but then we lose the const. Oh well.

The whole qcom clk driver probably needs an overhaul to just have
descriptors that populate a bunch of clks that are allocated at probe
time so that the memory footprint is smaller if you have multiple clk
drivers loaded and so that we can probe the driver again without
unloading the whole kernel module.

