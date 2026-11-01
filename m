Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A238606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XmP5U1v7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ai4+ibZ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=; b=XmP5U1v7Qqi/Kj
	Ns6+hzhH72/R9EWcJra0EtkVnHadaTFKL5CE+CPZj0j2BtJLdoRa+IN3/ty3zz2XrqDbbs8R3VZba
	AkzrXqVnzo/DlDQmvKa9CKync3TC4F2tssI+Fehbu4TFBLKYb9zS6cARnHJ3Zaq66dVEx2dea9TPn
	0t59UIgodTn6yd78AqS7kbvhQPeeNG0pyFUM6osfoC9VDSf317LtLrwXhxw2B5pI+WmVMx/2SY3M2
	zQDigy41f9rXx/G9TBXmbpbaTB/K6Qs8y86+seQkmHNPnivrp1WNIw5QQyoo+YqkNaYb5LARBc1aa
	+T9m20jxpgHy7zHnQU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbuZ-0000000ErdI-0AVV;
	Sun, 01 Nov 2026 20:12:15 +0000
Received: from mail-ed2-x07.google.com ([2a00:1450:4864:33::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbuV-0000000ErcB-1e18
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 20:12:12 +0000
Received: by mail-ed2-x07.google.com with SMTP id 4fb4d7f45d1cf-6acbccc0fa4so1838514a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 12:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793563929; cv=none;
        d=google.com; s=arc-20260327;
        b=KURjfSMFdMuIMtfkh0eMWF7W1zJ1vR117SfVALiiC2khwcAenkFTlGo5C/lhI+zmpM
         mAXz+UXJJgiF/dKHBfDI515I1HJeSllu1ae6ckh5B2m8zJ/umquupsN4Uei2yP5NcTmy
         gy8OR9oaFvhG+7i230G1X1/JWbrM53hyr6xErgpFyeJBdLt1Lx/zPlaKAGufUx7eWpFh
         i6G/iaPZFCWkGwp/8cAjAtv6HVSIgNpWqQQb7VU0EU3rItSTISfcMRdb5iKNLd/U2Q3j
         y7syhVXjDtU+r4/ww/L5uKebQN1yyHAQj+rnil8yvPeIOdExvky7BOrQFDmNBC1S77sM
         6W8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
        fh=w9ihraTcDXAVqD5NSPlN0gdcqOXAs/ShzeTxfEL45/w=;
        b=GFrQuckPaRD0l8A/KRlLEoJrEoW5Qkc/rk4aZuuMcgZQZStFbfyog38hP8WgqYvZOZ
         EwQ0rCSVxWIndct2++F8n5tQQqrqMgh/bt6+tvqNJZ2mW6ZFbhCcFLhEZmp3FoZHD3uy
         8g5Ynf58ptlOiWRwbTob1StWXMA4Z5I7Aa6i4SLQqLAtSqm5+MBE1POySBiLaX/lUjDf
         ardnHvqKOxQ1WdCYx+zVAKDVT+FHLuZDn499HWJ/IakkJeSXMGpR5nnSI3SVIRaodQZN
         E5aiI93lKwBzrgsY00IrDwtmiJC2prnPlrxTdmGsPAGX6H0Zv6zLK5RLzqCoVrUe1grs
         R6LQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793563929; x=1794168729; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
        b=Ai4+ibZ8SNBiI9xUFWF1MuyZbEl/YIMHs5ta17HvOVNKjOgSrUwqVFxC53ts5t3G+6
         ALluax9q1YTAX2k25A/0usyUTE/I7DjVEDOC2udeam0zz2OQVhw6OXT/yZlW2NNyTT8E
         NFueiXi3d0G47xVl+c56abde3FGUD8/FLPrGjyPhwmu2nDYli8vsNwIISs/xB2DUkxTE
         e9P85tDKgrLxMTgu7q3CftQH0t/VDGSdlatDxW7d5Z7O3hXKLCsVWBAl19CmbRuK885v
         u36pK3cYJHaV2DGGcoWF+9X05ExIur9XrzxzhcFCWZ35i2t/N8b5RTf5C6TgZru1VDRs
         BydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563929; x=1794168729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAEhnewbdseHCyOO8rtnZ+ccqV7eT1Rq136MpuhqgwQ=;
        b=dm4+aY0+E9VqohHB7nPl+qBGv6/d99AcGklgP4W5ucIyVi3mpcVThhYoyWtphu0ZAf
         u+HZn2iQtbjlQ5PKZdIulFXxpNsm+SkVBXL0iRB2LD+sFCRWpz9F71wqBV9xBhn/CgD8
         +88Ogb7CH1rx1DOROt0wn7It3yvRUzzkG13CBlMXZ7aPbw7bFnDAf1yjzLRwUfmespNt
         e9njpoFrjehC2M3w1rbtpoCOj8WdhglU6iKED+vbRrYR5cxKYvkchMV6AqRiPg1Ftqau
         79O9oyo6dMQFAwHsd1Z5vEJ2RaEALK3HwFhvVEvM/28aU+HT3XnKbN2zT/lVWbPGxqof
         b8iQ==
X-Forwarded-Encrypted: i=1; AKwUvByKXIT6Gd8dFelTN/0LeNbmMmfPmYoeXodjdcti59bksokWOVGvDn0s2nbPXT/DSB2JWsispXnkn37CIWCn1jbM@lists.infradead.org
X-Gm-Message-State: AFq9FYKlKC5nlHMdVnG7usnox1dhLoOhMCTLyeMuR0OmkwzRIfSeQIKX
	Nifl/87lCdcqXt3CDJWUHSo4O/MzE42O0pZBeE6MyK1ishZ5NunJ9JYb9cjcMFzm1t0JNfZDTzA
	G3IbvnJuSqkeKW+1PyUtGC9OprPt7bfA=
X-Gm-Gg: AYBFou2ZmfFGCFnN6tK++t0vEkQm0mfnenrCm/cEsrFDUgv4vlQBwTMjsaAWJNH4abo
	bM8BNzpcJSo7c7wqx5aSegPeEmRkRLKU610pSjx91VJxZ8yDeZbz74MwjaWCz3sd+EU/Aj9+S4R
	0LkDLjVkv+ftwlg3GfFbSt4q/qX6S/6LQg5Epi67vn5jdND07MLaSKWXaU47RCG2byFQjiC2TUb
	5sfhZUljQkmhw16gJOzDO9Pn6UJdWlc86rEEY5BeIiEAn5MsNLuq1UE4XHPD+4LThr0+tLFsAfb
	8RIUUanB8oDxr6zEcEp7YM0hvW/76VoM1yIDK+FKmDhXWS8ofnKFZsl17Jxe7UaZukL30tVl1om
	LHliaBIzF8o46XIefjBO5kkg3iNuM68hUYS8s2KaS
X-Received: by 2002:a17:906:c14d:b0:c40:4f39:22e8 with SMTP id
 a640c23a62f3a-c4ca7acfb41mr639189266b.44.1793563928992; Sun, 01 Nov 2026
 12:12:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023053548.1595033-1-coiaprant@gmail.com> <20261023053548.1595033-2-coiaprant@gmail.com>
 <2977688.AiC22s8V5E@phil>
In-Reply-To: <2977688.AiC22s8V5E@phil>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 2 Nov 2026 04:11:56 +0800
X-Gm-Features: AclHuK9JsP_sappSiOI-OzoOwsqicY7ddXohMyF8cGA-5NNfJ9GwpFb4-3V7qU0
Message-ID: <CALj3r0g5twZNEiO5b1hHpxy3kAVBxLZNt55E2dxSSeZ5GgXisA@mail.gmail.com>
Subject: Re: [PATCH v12 1/3] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_121211_453126_32B7C8C6 
X-CRM114-Status: GOOD (  28.32  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2026=E5=B9=B411=E6=9C=881=E6=97=
=A5=E5=91=A8=E6=97=A5 22:06=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> Am Freitag, 23. Oktober 2026, 07:35:46 Mitteleurop=C3=A4ische Normalzeit =
schrieb Coia Prant:
> > The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
> > the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
> > interfaces via its four MII ports.  Add the XPCS device node to the
> > SoC device tree.
> >
> > The XPCS device is accessed via the APB3 bus at 0xfda00000 and
> > requires the CSR clock (PCLK_XPCS) for register access and the EEE
> > clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
> > PD_PIPE power domain must be enabled before any register access.
> >
> > Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
> > labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
> > 125 MHz reference clock for the GMACs when operating with XPCS.  Their
> > clock-output-names match the CRU mux parent names in clk-rk3568.c, so
> > boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
> > assigned-clock-parents.
> >
> > The XPCS node is disabled by default and must be enabled at the board
> > level when 1000BASE-X/SGMII/QSGMII is in use.  The fixed-clock nodes
> > are always present and do not have a status property, as they are
> > static clock sources.
> >
> > The XPCS node requires a reference to the appropriate Naneng Combo PHY
> > via the phys property.  dtbs_check only validates required properties
> > for enabled nodes, so the SoC dtsi does not provide phys: boards that
> > enable the XPCS must supply it, since the SerDes link is a board-level
> > design choice (combphy1 on some boards, combphy2 on others).
> >
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3568.dtsi
> > index 3bc653f027f1f..20a72785adbc2 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > @@ -8,6 +8,20 @@
> >  / {
> >       compatible =3D "rockchip,rk3568";
> >
> > +     clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
> > +     clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
>
> these clocks don't belong here.
>
> When you place these nodes in the main, they seem to come out of
> thin air, while that might be true for some boards, that they
> have dedicated oscillators for that, this will likely not be true
> for all.
>
> So these should be defined in the board dts, to match the actual
> hardware.
>
>
> Heiko
>

Hi Heiko,

Okay, these are board-level clock sources, not something the SoC
provides. Moving both fixed-clock nodes to the Photonicat DTS and
leaving only the xpcs node in rk3568.dtsi.

I'll respin.

Coia

