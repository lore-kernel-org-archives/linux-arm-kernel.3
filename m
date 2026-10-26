Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 03:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IL/KMISF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FH12MvDL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qvFzouQF9MYPvoxr1/BdmBibADJU3LaIGGor9Gt6xfo=; b=IL/KMISFAuCLDj
	m2lDHL3K6WpFw3iNQXIfc6ttFCc4FVtdM8hTXEW/aJGAkANparTMaYXDgNGS/hP/5HgH2FBtTsz3O
	abvn4tTpw9S5XWFywCqC0rhrFkXt4nHR9XWVJ/6yIvxkZgm0hzT9sx5LISuxKSnD80erGnc2I5qN4
	YI3nksO/Mtd3ev0vW85OGblT+FcdP0vzVA4ROahpsbxcqIvvtyw/GENMspPMoRqmC6flTbyjJ7HSR
	tsZN/bg1BMq+iSv+vdKcpSb/OGPa5G9MEc66izccjrh9Ctp9jIwLuaZrerAiOO79ZqsPMxMnDjwV/
	+QMs64aFYaoTQR42uoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBUB-00000001fEo-2uuN;
	Mon, 26 Oct 2026 03:34:59 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBU9-00000001fES-1SLt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 03:34:58 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-8b0d91601bdso26992637b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 20:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792985695; cv=none;
        d=google.com; s=arc-20260327;
        b=C7ngslvxknGo+hLOB0EqTf6JkiXhwDN6Oz/6qCUdLy2OG60Ntxb6/2RYS4LklDZlDs
         GkDmow+8WHBdTU6pImQoKaWnEUsK6ikGrQ3etc2X/k8jLil6moyngvLzUIalICt7lXV5
         QcEVrnqDndg1tWbKc/owNoOW/qW0pZEq2BfCaEfemVmrJVEXpee0KNX0qGWvSe5C5GH1
         fDdA/yteX7VEjRyJ/IsOeNUf8s4dWo+F4BmwwVxNM1pCTqX6dI1sg9uemOx10D6eafpK
         JMYOfj+3HI/gaML0YhYL5rVIIG5bHGe/rPjww6QLd2ut2K46w30cM0yIiihXUKqQdt7a
         SvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qvFzouQF9MYPvoxr1/BdmBibADJU3LaIGGor9Gt6xfo=;
        fh=t4/iMhUHisGm0Uba2Tu/TEzpFo2xzFYv6vpoHkv4EqY=;
        b=E0kv+gnlJKmAq0IjBXcslUGrw44EjPbYwv9Q8+AWM2U5gwzTTa0lglGiF2ZrJBmLa2
         51O+42SMB1hYyvdmRONlr/ngslwyxcO+bwuXAceH/OvxMJdTkCxKVCmm6gFEGkyKlOid
         Y+6QccL0mF65I8gq6kJBcZ8KZzoXIdFqck1Q8BUrrKoAAQjP82P6fnhGaYFv5RgGx4Z/
         2RFnom09l5WU04atq4YovMK0Ru5aJONLUrHnmbrUzCwcUYJGZM81qRZRXSyArB4zqxWy
         IVHekIORt4daDPCSSpkgBREEXjpHsNwqkJPHvLuTy3r/AbqlRp5xewKEEztpRqu6tpin
         bE5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985695; x=1793590495; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qvFzouQF9MYPvoxr1/BdmBibADJU3LaIGGor9Gt6xfo=;
        b=FH12MvDLVKXodSQ+ZGpj6VbusNHZziA/28GuLj9Gmd3Yq16cPSHMVu7nRSvhRwaNkt
         eUdWoaLDUpyR7w9yLtUN7X8LyvlV1PYw9KeXGCiPGdFwa1DDSPa1wAJ2BvmjHzgKsJMZ
         YqqwYfpQGqOUM6s1MHSk17xYBSVgswN01bu7bF+zp+nHXJdlBX5kfdJXPhv2VoN3u5mh
         7eClIrZACviRNKQpE4S1ZNyrfRMxPxWABkBzHehTtI8AIx8B3lSiUyMj3YvPAP3zWZjz
         BU7PxX+qLcJxOI9lkxUsCyxxl/WuS1pbZ+GI+ypSYQmf95q+nLuylqOoOXIghL5ecHI0
         x6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985695; x=1793590495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvFzouQF9MYPvoxr1/BdmBibADJU3LaIGGor9Gt6xfo=;
        b=mLjeA+7dpGHXY3vRo3ghqf1UqDfmSb9PI+vfWqYrGTrB7tNB1wOVVfVjiI/SEQP6Pt
         0wJ9xhMibLHgiJLQpzTD7wmOdY5rX5y2nEw0+fKn07cKmIiBkaH7p5prfFiNFU/sHWzc
         z+t+TbWn05wHh2ze56mOPtzeOa+O5t9pnxZbyG0PpjKzFg/AR2mzSx/0DPOUXWfiLvga
         J/7aIwAhvk8ZvdGQIHIDjSL14Ie5iq322h+sI9SuuBtoFMzDrOT2iPWgAlbk2krXJ/fG
         4f/oTAkJHfaIMOXFzIqzugx9G9rm1E24tQ9nF3CRoZYe/H8naDma61P6MLvaWvhvmTvC
         DxAw==
X-Forwarded-Encrypted: i=1; AKwUvBwFHYzvO/DcBZbMEP5KWl2+KNyU/u6bAEyczgimn/PJs9SpTj2/lvc7wEZ7xl9tIFTIkS9eB/I8KRIrD4Ecz+I/@lists.infradead.org
X-Gm-Message-State: AFq9FYKCX0AmGywBprNo5r/4esf1N8au4DAksQWOAVJxVZeGFcXSG3Q5
	EmUGy5/VDjkTS2cEUFFd7oz21+JDE/dCTeU+oN9cwQ/s31bb5aMuFXVJjhiwXgZDRCHolhtJN8Y
	b1f7fO5JdUv/rSX7ZjuczhGIn8koNiuFyu8mX
X-Gm-Gg: AYBFou0YOyMsOlXLB9XXsSyuo0jgd88OB7cUhdnIrMBE54dp1Q5tXrV5YLGFQFTF9cC
	Iz+q1T1NjUSgMTvLxLs04NOqctDTm7ohr49MKbPQgeYUYQGV48QZe6M0dV+D+Oln4wjtZSEr4KX
	mRMk9Bg83aNmj+4kJreyw/BwEKiV28FBjHfQpz5X2lqfnxCqzid+PdtMqwTBIwDePfeKjVs8igF
	a9F5bVVf2vg08WudaN6ctT44x/buKTnSgYLdTE7jq8uZAdfzyoQ1EM4x5WuI3YULF/MHFtEH8CF
	i8y2xtW/SoOctkYncAixYygDIJCo4YTxprPsZ6Vct8U6jFHUUqtmI6AZo3HIxwetKpRPG4r5ekB
	aZumMgnAf3fvN10Gnrt4aqLkXyMoyOcF8rhzP
X-Received: by 2002:a05:690c:e3cc:b0:8b0:56e6:54ff with SMTP id
 00721157ae682-8b1671e0cb1mr39578197b3.6.1792985695228; Sun, 25 Oct 2026
 20:34:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261002062933.26497-1-prasanth.padarthi10@gmail.com> <20261002062933.26497-3-prasanth.padarthi10@gmail.com>
In-Reply-To: <20261002062933.26497-3-prasanth.padarthi10@gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 26 Oct 2026 09:04:44 +0530
X-Gm-Features: AclHuK9g2QPyjNGvOYOKw3ICZuN5ZkwaHqbNNAHIXI0yRtldeEML3mZWQVHrKk0
Message-ID: <CAMFFDGjmJTRR8GOX=S+kKnMA-bG+gbZP0sS8dG_d+taDPPRDZQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_203457_412962_E9FF54B1 
X-CRM114-Status: GOOD (  20.69  )
X-Spam-Score: -1.8 (-)
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

A gentle follow-up on the B650D4U BMC device-tree series posted on October =
2.

Could you please let me know whether any further changes or validation
are needed before this series can be picked up?

Thanks,
Prasanth

On Fri, Oct 2, 2026 at 11:59=E2=80=AFAM Prasanth Kumar Padarthi
<prasanth.padarthi10@gmail.com> wrote:
>
> Add the device tree for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
>
> Describe the BMC memory, SPI NOR flash layout, UART console,
> GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> connected to an RTL8211F Ethernet PHY.
>
> Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
>
> Configure MAC0 to use the RTL8211F in RGMII-ID mode.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
>  2 files changed, 136 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dt=
s
>
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 6b68671f9379..b109491d5c8f 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         aspeed-bmc-ampere-mtmitchell.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>         aspeed-bmc-asrock-altrad8.dtb \
> +       aspeed-bmc-asrock-b650d4u.dtb \
>         aspeed-bmc-asrock-e3c246d4i.dtb \
>         aspeed-bmc-asrock-e3c256d4i.dtb \
>         aspeed-bmc-asrock-paul-ipmi-card.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000000..a4e384588a54
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +       compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> +       model =3D "ASRock Rack B650D4U BMC";
> +
> +       aliases {
> +               serial0 =3D &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               ranges;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +
> +               gfx_memory: framebuffer {
> +                       compatible =3D "shared-dma-pool";
> +                       alignment =3D <0x01000000>;
> +                       reusable;
> +                       size =3D <0x01000000>;
> +               };
> +       };
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +
> +       flash@0 {
> +               compatible =3D "jedec,spi-nor";
> +               reg =3D <0>;
> +               label =3D "bmc";
> +               spi-max-frequency =3D <50000000>;
> +               spi-rx-bus-width =3D <4>;
> +               m25p,fast-read;
> +
> +               status =3D "okay";
> +
> +#include "openbmc-flash-layout-64.dtsi"
> +       };
> +};
> +
> +&gfx {
> +       memory-region =3D <&gfx_memory>;
> +
> +       status =3D "okay";
> +};
> +
> +&gpio0 {
> +       gpio-line-names =3D
> +               /* A0-A7 */     "","","","","","","","",
> +               /* B0-B7 */     "","","","","","","","",
> +               /* C0-C7 */     "","","","","","","","",
> +               /* D0-D7 */     "","","","","","","","",
> +               /* E0-E7 */     "","","","","","","","",
> +               /* F0-F7 */     "","","","","","","","",
> +               /* G0-G7 */     "","","","","","","","",
> +               /* H0-H7 */     "","","","","","","","",
> +               /* I0-I7 */     "","","","","","","","",
> +               /* J0-J7 */     "","","","","","","","",
> +               /* K0-K7 */     "","","","","","","","",
> +               /* L0-L7 */     "","","","","","","","",
> +               /* M0-M7 */     "","","","","","","","",
> +               /* N0-N7 */     "","","","","","","","",
> +               /* O0-O7 */     "","","","","","","","",
> +               /* P0-P7 */     "button-reset-n","control-reset-n",
> +               "button-power-n","control-power-n",
> +               "button-nmi-n","control-nmi-n",
> +               "","",
> +               /* Q0-Q7 */     "","","","","","","","",
> +               /* R0-R7 */     "","","","","","","","",
> +               /* S0-S7 */     "","","","","","","","",
> +               /* T0-T7 */     "","","","","","","","",
> +               /* U0-U7 */     "","","","","","","","",
> +               /* V0-V7 */     "","","","","","","","",
> +               /* W0-W7 */     "","","","","","","","",
> +               /* X0-X7 */     "","","","","","","","",
> +               /* Y0-Y7 */     "","","","","","","","",
> +               /* Z0-Z7 */     "","","","","","","","";
> +};
> +
> +&i2c7 {
> +       status =3D "okay";
> +
> +       eeprom@57 {
> +               compatible =3D "atmel,24c128";
> +               reg =3D <0x57>;
> +               pagesize =3D <16>;
> +
> +               nvmem-layout {
> +                       compatible =3D "fixed-layout";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +
> +                       eth0_macaddress: macaddress@3f80 {
> +                               reg =3D <0x3f80 6>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mac0 {
> +       nvmem-cells =3D <&eth0_macaddress>;
> +       nvmem-cell-names =3D "mac-address";
> +       phy-handle =3D <&ethphy0>;
> +       phy-mode =3D "rgmii-id";
> +       pinctrl-0 =3D <&pinctrl_rgmii1_default>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +};
> +
> +&mdio0 {
> +       status =3D "okay";
> +
> +       ethphy0: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <0>;
> +       };
> +};
> +
> +&uart5 {
> +       status =3D "okay";
> +};
> --
> 2.47.3
>

