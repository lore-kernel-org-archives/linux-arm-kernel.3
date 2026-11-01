Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AFA606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 20:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ynh22KaY;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=20rNYJKo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nbWzpEen76KfcL+CtXPbSjVeFwZsdAxBkZAu3PHXVRY=; b=Ynh22KaYrVwSx+fU4/Wgy/7r0E
	WLs62WexBOAiP5kIP5xCuImerqb0voR5rRtDoX7PrijJod/U+ZnKxGEqcMCA/FYR8q8wFg/qiD3ww
	Cy6tqFQq1r1GT8Rz31PA0FWyfCutdI+MwRkCL1574SnZVOHlWfcINsWh8KliO2ND50xqcfSoymgZZ
	Vt3gQUngCs/EWkGHev0ihbS0yV8k9+CbNcyQZNkn1+tpJsLLm5xjKCaEulH3VeTO9KfQ/rOYS4hfu
	zBPtpaa9/cJXLRi3PyfVqiO66DkYK4rW+L8H9LG99nMAkgepzJs6XkS14TjN/ukqQWbBCrE9vdVY2
	zN40mvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNc1o-0000000Es7b-3W1T;
	Sun, 01 Nov 2026 20:19:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNc1m-0000000Es7C-2iNP;
	Sun, 01 Nov 2026 20:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nbWzpEen76KfcL+CtXPbSjVeFwZsdAxBkZAu3PHXVRY=; b=20rNYJKowS8QgUWQ4jODdI+Rso
	vpy8xoxE5/YhQST3EwqyZxQNmAV03Y5o751usgC31Yc/McSk1TOqOl3zTIEtG/Tj6ZNluFes8ihJp
	+X13l9D3X4pnJOeyY2ekAMmWEDtrZSMUZ8LP3lJzUj7Lu1F6xYTU5pAYBiiJK0jUrI9hRxttmqeV0
	Upd10k0OsFPkI6kQGZjcz3bMChwkDKqtnvkeXN0sYn6goMIBQDkrUfV9dFr7bcLRDR225P4brDNnU
	UZhNWMWPmvq/HDXj1olPKXAI2ZcmO3wnp6wRkxfXQpLJhBxOxhPTB95rlPaSeerNlr2/rBXJMkQDh
	+jFRBS9Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 1/3] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock
 nodes
Date: Sun, 01 Nov 2026 21:19:33 +0100
Message-ID: <23607754.hxa6pUQ8Du@diego>
In-Reply-To: <CALj3r0g5twZNEiO5b1hHpxy3kAVBxLZNt55E2dxSSeZ5GgXisA@mail.gmail.com>
References: <20261023053548.1595033-1-coiaprant@gmail.com> <2977688.AiC22s8V5E@phil>
 <CALj3r0g5twZNEiO5b1hHpxy3kAVBxLZNt55E2dxSSeZ5GgXisA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_121942_769607_7441D1EF 
X-CRM114-Status: GOOD (  30.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Sonntag, 1. November 2026, 21:11:56 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Coia Prant:
> Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2026=E5=B9=B411=E6=9C=881=E6=97=
=A5=E5=91=A8=E6=97=A5 22:06=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > Am Freitag, 23. Oktober 2026, 07:35:46 Mitteleurop=C3=A4ische Normalzei=
t schrieb Coia Prant:
> > > The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
> > > the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
> > > interfaces via its four MII ports.  Add the XPCS device node to the
> > > SoC device tree.
> > >
> > > The XPCS device is accessed via the APB3 bus at 0xfda00000 and
> > > requires the CSR clock (PCLK_XPCS) for register access and the EEE
> > > clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
> > > PD_PIPE power domain must be enabled before any register access.
> > >
> > > Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
> > > labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
> > > 125 MHz reference clock for the GMACs when operating with XPCS.  Their
> > > clock-output-names match the CRU mux parent names in clk-rk3568.c, so
> > > boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
> > > assigned-clock-parents.
> > >
> > > The XPCS node is disabled by default and must be enabled at the board
> > > level when 1000BASE-X/SGMII/QSGMII is in use.  The fixed-clock nodes
> > > are always present and do not have a status property, as they are
> > > static clock sources.
> > >
> > > The XPCS node requires a reference to the appropriate Naneng Combo PHY
> > > via the phys property.  dtbs_check only validates required properties
> > > for enabled nodes, so the SoC dtsi does not provide phys: boards that
> > > enable the XPCS must supply it, since the SerDes link is a board-level
> > > design choice (combphy1 on some boards, combphy2 on others).
> > >
> > > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 23 +++++++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/bo=
ot/dts/rockchip/rk3568.dtsi
> > > index 3bc653f027f1f..20a72785adbc2 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > > @@ -8,6 +8,20 @@
> > >  / {
> > >       compatible =3D "rockchip,rk3568";
> > >
> > > +     clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> > > +             compatible =3D "fixed-clock";
> > > +             clock-frequency =3D <125000000>;
> > > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > > +             #clock-cells =3D <0>;
> > > +     };
> > > +
> > > +     clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> > > +             compatible =3D "fixed-clock";
> > > +             clock-frequency =3D <125000000>;
> > > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > > +             #clock-cells =3D <0>;
> > > +     };
> > > +
> >
> > these clocks don't belong here.
> >
> > When you place these nodes in the main, they seem to come out of
> > thin air, while that might be true for some boards, that they
> > have dedicated oscillators for that, this will likely not be true
> > for all.
> >
> > So these should be defined in the board dts, to match the actual
> > hardware.
> >
> >
> > Heiko
> >
>=20
> Hi Heiko,
>=20
> Okay, these are board-level clock sources, not something the SoC
> provides. Moving both fixed-clock nodes to the Photonicat DTS and
> leaving only the xpcs node in rk3568.dtsi.
>=20
> I'll respin.

please also at least describe in the commit message, where the
board generates these clocks.

Thanks
Heiko



