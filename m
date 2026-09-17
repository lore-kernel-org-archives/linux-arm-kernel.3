Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4BEC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCPgAIlGTr5u1ukHAetOMBXtOrNSCf5qagcxmn2ADog=; b=km6EllllbS7fsOMoyWcwm+E1/J
	lIXBJWynQElrGC/E8cfiSNkZfXnAg5AwCI6gS52D4tdLWGof7XvDlBurbLpw3eNarUBLCKaxyuV7b
	CYt2UDh9laxmr8BWiug0mkeSEhPQK/3h9KBa3HGySw7HD0Zk2Z/fCNcs3BUGccL178yR/VCWlmzHi
	Vfr2J3r2wX9CfCD0ZNpTCYpOiQQYafTGha+tXONmd5VpmPWnVqng1etApRT9dvpgisJZ5xipFVPik
	xXumPSBDQ3sl0w9vUTrizGFHA8dThkbuyJyB5Yizpr4MyJatTAYsjpEnAhZlRNRFBhHorQBeoMN3n
	E8cbad+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IWS-0000000CPLC-1qF0;
	Thu, 17 Sep 2026 20:15:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IWQ-0000000CPKD-3j1A
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 20:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zCPgAIlGTr5u1ukHAetOMBXtOrNSCf5qagcxmn2ADog=; b=QrzMqYuWg0VWoBZGCiIG+HVmNq
	k0X5qLl0thcfR4EDWtz2V1dczpWMcHdQ2RzRbZ1FkkGnnB02TOauACa7PFySeJ1EWoC/5LR6JoAVg
	3wYvGhuw7p8v9I+9dlBeqbhZtL3Qgg41QecylYh3PhlEL+rKSiY/HXB8eJV8VsWMgI4k52FjAyVea
	t147XkTD2wm0mxYW5Ia2aTz/dGzWcMvmBZ1GQizohBuN04vMRPqzU+OEBfZYpgJk1jHy60ScxgZPE
	eE/2Exl3YiZGOakC0ZRY9y7TgRns8lRmt1P3cw7N0foT7DlJkybsS8Xmu7zoiQrG2LnTwYHk7oKSA
	6NRIFUtQ==;
Received: from mail-ej2-x07.google.com ([2a00:1450:4864:34::7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7IWN-00000009Emo-39ZX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:15:53 +0000
Received: by mail-ej2-x07.google.com with SMTP id a640c23a62f3a-c28e3998eb7so687166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789676150; cv=none;
        d=google.com; s=arc-20260327;
        b=StaWJi62YPnYedWgd3nj0v9MYtN27m7xB8QulueKiGd04/6SA7/vsaJMmB8O6ArWJC
         q1Y7wj2FMSt7PS+Tf+n3GkeOC4RmgZKynGDIuO03cn6L+GpiNK2Gy+JuMvOLS2/wYzRP
         d5md45CRJsf5H4eMq53+G4ANAXk1SGzUS0xHwhXAiCzmK9raqHRqYDhKeFOp7fMPPuLj
         Ot+Q30z58pwuCTvwJ0MHEQfvi1IpyqqAQSgUiWtTSFiTtVFM7hkaP2tZ1R4BDWsfpWZw
         KnWzyFZ8bN+CL+JXL22VEZ4nGgpt2aIq4Ma789F78mrHqFeBEqM3JpG0fVG1ilys45Z1
         9GAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zCPgAIlGTr5u1ukHAetOMBXtOrNSCf5qagcxmn2ADog=;
        fh=Yl8ao8QKUmbzZ9HeECGODbaIanemV8b5f9c6FG9XvPw=;
        b=XrK2XdjUqUKZ2eoMVGM6W+NBPk6K8ANldcc6MJobzjJyZO6a3KNpUVM4wdnOxeFKoR
         KDecyQHhcb62vVVTXdvZQCQWhjViObuRpR8oxkqFaqNzFYi99LXbF26j5nndZoaCjA7+
         IMU7Po0CNOjpSrMYWCNmQk1MDBnNZAXs8jaWmxkGiRE0PPGLifPEdWnLwsqy3tjZM3/J
         gQNAx9pxWRBLbdyVIADhisGtprh2kjktOPePOa7vO2HFNhI1rJUM8Hi6qAcdZf1TZKZx
         O0pQBOY9ZAG5TEMGHkm0o4Jg5k5+PQaVv7zTslhs14jGhCpwPlK8L/KpYj0D1bRkDeQ1
         /f3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789676150; x=1790280950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zCPgAIlGTr5u1ukHAetOMBXtOrNSCf5qagcxmn2ADog=;
        b=Pqdrzjw3HLrOrzXGOOqnjC5O9/FXJOZKPaRuMe7cPKr/HtY7Izn9abUuZVkFq7y/IG
         HHng9GTWyksc46gYIc0uThvP41oWv3F7s5E2hwhEZL5MC233uquqvbP6KfpDVQg5HHob
         E+AhpQCCjKb4gEzS6iQSLbBwNrYQ5OUpvuI7bBS2ZScPp1U6SsN31BiVBaMWA08pc6bP
         KyYi1ZusceayL0bno83FD8zW2Jiju6+sNUMiloR3ZGDJhDlU+PX2eVEC2IvWWbUf6gow
         3uJZtDB3iMNsEKNLiZZ11aNf8EYi4fniettWOSGnGlokkhyAP4wne1+5VIbA9t71f4fX
         T2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789676150; x=1790280950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCPgAIlGTr5u1ukHAetOMBXtOrNSCf5qagcxmn2ADog=;
        b=mRtfSa4HJbmFtN6hyTLEps6pNbUldDhrfsq9FUEHiy3u/Q+Hplgtpl8TtzjZE1DDHY
         BES7iytO2VLDcHjp3DJuK946F5S+geb7R7N0gYrvVUiSjKO7pJMNJTa9hpLEFS7ZMDMU
         I6uASOK1Kk69PCYC8h4vXiI9LtGk0xVSFQzJxjGMLdnJ3G+SrIZKsf6EzBYmRsM01hX1
         LIHaa15E2yV95lbwkmlow9RFSZv96L+76q3z1803J2VaPMyXzpGLIEl0RHXcreBU5f41
         FwAQ0LbNPrZLnorwxUs4ujxS8cYfaER0KbpWDc4Kp+VWK/6djE0SznXq36ArMscGxvYr
         6zHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd5CJc7AV6wdQv82HqMFOKfFjRh30DImj5dKEl+YQ1f0UOBcfXu5hZSUA59TCszQZvEbq579eQtAJP26UVjZk8@lists.infradead.org
X-Gm-Message-State: AFuF++k00ix76xbG8ih+Cl/P/4coFyy5PhdkCGZ7hKO+xZC3xwu4iwvM
	kpCnmM2K2L7O1oSgOybBRA7aPOI1GruQiNj4i2cLd8XUdUvfUeMUQZHc7ZXEGgNqO4UeMOCKn+V
	NVj8dCVozxL8JIa+coY2colOYIeAo8Ew=
X-Gm-Gg: AYBFou2asvoA8x6UlgwDrkFpnAGE8E+Wj41hu/2UEy70ioRVvhCmtgaTbKu/WwZgxVW
	8jSwTQo02QDwsf6c46TNP7yYnFJzxvTVFO/EZLoFNcKp28Objv/I9cgebQpVO6UD5vyajbUcyaf
	jTg9hIOW+zgghVPAdHG53uDEW+DnIvCCaKX9/EZe75xHMgMNu/dB1PWG0w3vafFPN7/OaKsv08p
	tIgiOD3YgzJRlRseYa7Z50fxwqwFFP5z89Q0/2Js15kNjhG3/QvNg2ulBWioW/viF9P5pDGzik4
	jzVq1HtnmkHQ3rW6zbHOuhGrDZUBV5o3hvbNW8TBNl4ZLDL78rwTFZ1edQ==
X-Received: by 2002:a17:907:7b8a:b0:c15:f598:60c0 with SMTP id
 a640c23a62f3a-c2a1581915cmr30112766b.4.1789676149887; Thu, 17 Sep 2026
 13:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260915123802.1561724-6-coiaprant@gmail.com> <178967029365.22033.1005706659427633436@kernel.org>
In-Reply-To: <178967029365.22033.1005706659427633436@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 18 Sep 2026 04:15:39 +0800
X-Gm-Features: AcwNN1XbjpFu6nolR2hwxu8hiEjSxd-JBBWVCJNN3qMYqxrhw7mXPkQuGTH5DI8
Message-ID: <CALj3r0i4Dg2jq_4WPQ6Q4t6gbJd6CTV9Y0iP0GssAwy_AVY0xQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 05/11] arm64: dts: rockchip: rk3568: add XPCS
 and fixed-clock nodes
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org, 
	linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz, 
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_211552_146885_D21E0890 
X-CRM114-Status: GOOD (  45.80  )
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

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8818=E6=97=A5=
=E5=91=A8=E4=BA=94 02:38=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 2
>
> - [Medium] The new `xpcs: ethernet-pcs@fda00000` node in
>   arch/arm64/boot/dts/rockchip/rk3568.dtsi (line 113) omits `phys` and=E2=
=80=A6
> - [Medium] dts: incorrect fixed-clock modeling for XPCS generated clock
> - [Low] Concern (invalidated by later patches in the same series):
>   `compatible =3D "rockchip,rk3568-xpcs"` matches no driver, the `eee`=E2=
=80=A6
> - [Low] The commit message states it adds "two fixed-clock nodes
>   (xpcs_gmac0_clk and xpcs_gmac1_clk)".
>
> --
>
> arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
>
> This adds an ethernet-pcs node at 0xfda00000 for the RK3568 Synopsys
> DesignWare XPCS, along with four ethernet-pcs-mii child nodes, all disabl=
ed
> by default.  It also adds two fixed-clock nodes providing a 125 MHz
> reference for the GMACs when running through the XPCS.
>
> No Link: tags present in the commit header.
>
> Two remarks on the changelog first:
>
> > Also add two fixed-clock nodes (xpcs_gmac0_clk and xpcs_gmac1_clk)
> > providing the 125 MHz reference clock for the GMACs when operating
>
> [Severity: Low]
> Could the names here be updated to match the patch?  The nodes added are
> clock-xpcs-gmac0 and clock-xpcs-gmac1, labelled clk_gmac0_xpcs_mii and
> clk_gmac1_xpcs_mii, and there are no xpcs_gmac0_clk / xpcs_gmac1_clk
> identifiers anywhere in the diff.
>
> The exact strings matter for anyone cross-checking the reparenting, since
> clock-output-names has to match the CRU mux parent names in
> drivers/clk/rockchip/clk-rk3568.c:
>
>   PNAME(mux_gmac0_rx_tx_p) =3D { "clk_gmac0_rgmii_speed", "clk_gmac0_rmii=
_speed", "clk_gmac0_xpcs_mii" };
>   PNAME(mux_gmac1_rx_tx_p) =3D { "clk_gmac1_rgmii_speed", "clk_gmac1_rmii=
_speed", "clk_gmac1_xpcs_mii" };

Fixed in v7. The commit message now uses clock-xpcs-gmac0 and
clock-xpcs-gmac1, and mentions that clock-output-names matches the CRU
mux parent names in clk-rk3568.c.

> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3568.dtsi
> > index 3bc653f027f1f..227d03e336043 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
> >               status =3D "disabled";
> >       };
> >
> > +     xpcs: ethernet-pcs@fda00000 {
> > +             compatible =3D "rockchip,rk3568-xpcs";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             reg =3D <0x0 0xfda00000 0x0 0x200000>;
> > +             clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> > +             clock-names =3D "csr", "eee";
> > +             power-domains =3D <&power RK3568_PD_PIPE>;
> > +             status =3D "disabled";
>
> [Severity: Medium]
> Does this node validate against its own binding?  The schema added earlie=
r
> in this series, Documentation/devicetree/bindings/net/pcs/rockchip,rk3568=
-xpcs.yaml,
> lists phys and phy-names unconditionally:
>
>   required:
>     - compatible
>     - reg
>     - "#address-cells"
>     - "#size-cells"
>     - clocks
>     - clock-names
>     - phys
>     - phy-names
>     - power-domains
>
> The node here supplies neither.  At the tip of the series only
> rk3568-photonicat.dts fills them in via an override:
>
>   &xpcs {
>         phys =3D <&combphy2 PHY_TYPE_SGMII>;
>         phy-names =3D "serdes";
>         status =3D "okay";
>   };
>
> Since dt-validate matches by compatible regardless of status, wouldn't
> every other rk3568 board DTB now report "'phys' is a required property" a=
nd
> "'phy-names' is a required property" under make CHECK_DTBS=3Dy?
>
> Would it make sense either to drop phys/phy-names from the binding's
> required list (the SerDes phandle is board specific), or to give the dtsi=
 a
> default combphy phandle here, given combphy is an on-SoC block?

dtbs_check only validates required properties for enabled nodes, so the
disabled XPCS node in rk3568.dtsi does not trigger a validation warning.
The SerDes link is a board-level design choice (combphy1 on some boards,
combphy2 on others), so phys/phy-names cannot be provided by the SoC
dtsi. Boards that enable the XPCS must supply them at the board level,
as Photonicat does.

> > +
> > +             xpcs_mii0: ethernet-pcs-mii@0 {
> > +                     reg =3D <0>;
> > +                     status =3D "disabled";
> > +             };
>
> [Severity: Low]
> At this commit alone, compatible "rockchip,rk3568-xpcs" matches no driver=
,
> the eee clock, the PD_PIPE power domain and the four MII children have no
> consumer, the two fixed clocks have no user, and dwmac-rk provides no
> pcs_init()/select_pcs().
>
> Checking the rest of the series, all of those do land: pcs-xpcs-rk.c adds
>
>   static const struct of_device_id xpcs_rk_of_ids[] =3D {
>         { .compatible =3D "rockchip,rk3568-xpcs" },
>         { /* sentinel */ },
>   };
>
> xpcs_rk_init_clk() consumes both csr and eee, xpcs_rk_serdes_phy_poweron(=
)
> consumes the power domain, xpcs_rk_create() reads the child reg and calls
> xpcs_create_mdiodev(), dwmac-rk sets pcs_init/pcs_exit/select_pcs with
> rk_pcs_init() parsing pcs-handle, and rk3568-photonicat.dts uses both
> assigned-clock-parents =3D <&clk_gmac0_xpcs_mii> and pcs-handle =3D <&xpc=
s_mii0>.
>
> So this looks like the usual DT-before-driver split, and the disabled nod=
e
> is inert at this commit.  Is that ordering intentional, so that a bisect
> landing here stays functional?

This is the usual DT-before-driver ordering. The driver lands later in
the same series, and the node is disabled until a board enables it.

> > +
> > +     clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
>
> [Severity: Medium]
> These two are not board oscillators.  Per the changelog the 125 MHz
> is the MII reference produced by the XPCS/SerDes block itself, i.e. by
> the very node added above, which lives behind RK3568_PD_PIPE and only
> runs once that domain is up.  Describing it as a root-level fixed-clock
> tells the clock framework something different: of_fixed_clk_setup()
> registers clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii at of_clk_init()
> time, unconditionally (the nodes deliberately carry no status), and
> from then on they always look present, enabled and at rate, with no
> link to the XPCS provider or to its power domain.
>
> Where that bites is the reparenting path this patch exists to serve.
> A board that sets assigned-clock-parents =3D <&clk_gmac0_xpcs_mii> on
> the GMAC has it applied by of_clk_set_defaults(), which platform_probe()
> calls before the GMAC driver's probe() body runs.  So mux_gmac0_rx_tx_p
> in drivers/clk/rockchip/clk-rk3568.c gets parked on the XPCS leg before
> dwmac-rk, and therefore before pcs-xpcs-rk and
> xpcs_rk_serdes_phy_poweron(), has touched PD_PIPE.  Because there is no
> clock provider/consumer relationship to the xpcs node, there is also
> nothing for the driver to defer on: -EPROBE_DEFER is not reachable from
> of_clk_set_defaults(), and the mux is switched regardless of whether
> the XPCS is powered.  At best the GMAC is briefly clocked from a dead
> source; at worst a CRU mux switch to a stopped parent is not something
> I would assume is harmless.
>
> Was the intent to have the xpcs node (or the combphy) be the clock
> provider here, with #clock-cells and an entry in the binding, so the
> framework tracks the PD_PIPE lifecycle and consumers defer until the
> source exists?  If instead you have measured that the RK3568 CRU
> tolerates being parked on the XPCS leg with PD_PIPE gated, could you
> say so explicitly in the changelog and state what keeps the 125 MHz
> alive before pcs-xpcs-rk probes?  Modelling a generated on-SoC clock
> as fixed-clock is the kind of shortcut that tends to be noticed only
> when probe order changes.

The XPCS block is not a clock controller: it has no register interface
to configure or control the 125 MHz output, so there is no way to
implement a proper clock provider for it. fixed-clock is the correct
description of a fixed-rate on-SoC clock.

On the reparenting concern: the GMAC probe is serialized behind the
XPCS probe by the EPROBE_DEFER chain. rk_pcs_init() calls
xpcs_rk_create(), which returns -EPROBE_DEFER until the XPCS device has
probed and its MDIO bus is up. Until then, the GMAC probe never reaches
the point where the clock is used, so there is no window where the GMAC
runs from an unpowered source.

