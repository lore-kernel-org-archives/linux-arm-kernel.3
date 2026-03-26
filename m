Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4AA109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyl2tRm9hwQuxiJfS+7z0mBBb4tN3hi0dNEI5cPRQeU=; b=zdKTRoI3Dj5DnnnOhTl0i1KU32
	C0uPDYUDJs79KT1clyx1aDWpjMVUEIoHMFHx5yAY4KLmDmz4EDGoISUdkx/6grU+/JsFsYXd4KATi
	YayF9e3+QzEeIWpLaOOHcuhMj1IUqbPQjIpUfD3H9ld1fWGJ2vFV2DLsD4MJALbnxZ/LGMVrKH29L
	6XE6YG4nX0eaDmgbSiQMGylJNsNFis8rGNrMfd5+xWNYS7RPt4L9i2r0AxKjrtAPq8UlRhvdd/vyI
	AfS0V7H9yPGB6p7GcMGoLwEz8Pw9A8WLfe6pS0djzEAj6VTqFnoKh1CX0donjm92Jr61lK8BbUyJh
	+SaKtn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eA0-00000004oYQ-3Fxk;
	Thu, 26 Mar 2026 06:25:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5e9x-00000004oY3-3IeU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774506335;
	bh=qyl2tRm9hwQuxiJfS+7z0mBBb4tN3hi0dNEI5cPRQeU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m2F1VRLu/z3h8YIiv7trbgAiAAm6P5Qmqlm2K8m0WMAkklBjdOHKK2qH+3jKOg808
	 87SnMIqU08U0frdGWu0lwmFPUhoe/efmKqSOtLbUtzQkqL3r8jrjZv1lPf+wLPqoFl
	 l+7v57m9JyoPSY8k0pua4Gz3vbWGjN92YBBw7Y8V6jqjNilu/9b5AJsLFetf3X3qqq
	 ABSANVeY/39ywVNSZb/QZxqE8zKty2pJ7Kxb03mXUy9sDhCND2xX8nw6cmQZgesXBz
	 zstN6KwZaLRvPieyfHtF7oQvWXP+3exgqvkPZAXUKgGuUVdMkQ21H2VoxdXfukWxqA
	 KunTFnm1d75WQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1AF006597C;
	Thu, 26 Mar 2026 14:25:35 +0800 (AWST)
Message-ID: <eacfdc8637a7e59457c3c7d29e1044426d5c7f75.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: carl.lee@amd.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org,
 peter.shen@amd.com, colin.huang2@amd.com
Date: Thu, 26 Mar 2026 16:55:34 +1030
In-Reply-To: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v2-1-91c7dde4b79d@amd.com>
References: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v2-1-91c7dde4b79d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_232538_021076_A369674E 
X-CRM114-Status: GOOD (  14.53  )
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

Hi Carl,

Sorry for the delayed in review.

On Mon, 2026-03-09 at 11:46 +0800, Carl Lee via B4 Relay wrote:
> From: Carl Lee <carl.lee@amd.com>
>=20
> Add eeprom device node for NFC adaptor board FRU.
>=20
> Signed-off-by: Carl Lee <carl.lee@amd.com>
> ---
> Add eeprom device nodes used to store FRU data for the PRoT
> module and NFC adapter board on Anacapa platform.

This patch note seems inaccurate for the purpose of v2?

Doesn't matter too much in this instance, but should be fixed for any
subsequent revision. Which, speaking of ...

> ---
> Changes in v2:
> - Remove PRoT module eeprom commit since it is already included in anothe=
r series under review.
> - Only include NFC adapter board eeprom node.
> - Link to v1: https://lore.kernel.org/r/20260309-arm-dts-aspeed-anacapa-a=
dd-eeprom-device-v1-0-45092310e0e6@amd.com
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 2cb7bd128d24..69c41532fdfb 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -815,6 +815,11 @@ i2c13mux0ch7: i2c@7 {
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> =C2=A0
> +			eeprom@50 {
> +				compatible =3D "atmel,24c128";
> +				reg =3D <0x50>;
> +			};
> +
> =C2=A0			nfc@28 {

... these nodes are out of order.

Can you please order them by ascending unit address, as per the DTS
coding style?

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-=
nodes

Andrew

> =C2=A0				compatible =3D "nxp,nxp-nci-i2c";
> =C2=A0				reg =3D <0x28>;
>=20
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260309-arm-dts-aspeed-anacapa-add-eeprom-device-a1aabe06a35b
>=20
> Best regards,

