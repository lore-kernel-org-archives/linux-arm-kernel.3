Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982BEEF070F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ar3F1SrcFnyPVG6bOtSIkfRJ2etxte/LoL65GWVjh94=; b=Lucc+lHrLp8pig6FZjx1PvJBSE
	4tpAA4Kln4U2ql0pJfi1N60xuICA7bbN6bP69l0zx7bLlHvfFtFWczihB1djYe9UsxO4rBgypqaia
	SNo4sxzvWGn/Y2NDIT29WOA+i5PpE78f1p07KuuI6P263obwwsCQ1NXBdnNVkV5v8pi3zu/0j4L0S
	I2BiYhgS+R4hOFIVHwqrBgKo2uuxmsGvwWrdYHoDlAdBFqUZ7G7PsyiZp/a3Zn0QhXKlr5zjwzMBe
	YU25m1OLGqkUrfXlS1Zs9r7ThJ696nXY1CY5rFxYbml4P/Si9/3DILde/XC9fZsuWKlgpVlWnSa3k
	He65FqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpKi1-0000000Eu1Z-3lf4;
	Mon, 09 Feb 2026 06:25:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpKhz-0000000Eu1B-2wRb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 06:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770618317;
	bh=ar3F1SrcFnyPVG6bOtSIkfRJ2etxte/LoL65GWVjh94=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MXWof2kqJdIPkCMc8mZqPulb9S9JC1cV/ocb9l1kp9btkGnEmlD+Nz3gC1ndKB2Cq
	 M2+I/vK2aHNX4mob/8BnKf6AC+joemHdoj8HHO5AKLxfK5VLU2EJIG/r3dSABGfz5/
	 LtvmOuHZeyFrRh963yLUjfbQpVqGqRzot0Ef5UsFAH8mPzNjd2HKspBuL0i/G9N8W6
	 jZjdFGwZU+WQUR/TC2+yjOIwAoMkhWOTTuDNr5q6bMMk6EFZyKSiKUTHWvsxnuvmSg
	 QTrCp50w3hLEf2C84BhnAtrbG84RmY0QREFLKW2OHnP85SDSh9aKikYHTKTfrMEZAj
	 qymy2AyvFNOXQ==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B3A84602DE;
	Mon,  9 Feb 2026 14:25:16 +0800 (AWST)
Message-ID: <963194a5e7e88ae8ae1fe367d34d2fcdc329d814.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 4/7] ARM: dts: aspeed: yosemite5: Add ipmb node for
 OCP debug card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Jackson
 Liu	 <Jackson.Liu@quantatw.com>
Date: Mon, 09 Feb 2026 16:55:16 +1030
In-Reply-To: <20260130-yv5_revise_dts-v4-4-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
	 <20260130-yv5_revise_dts-v4-4-4d924455f3a7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_222519_964625_EF1D6172 
X-CRM114-Status: GOOD (  14.91  )
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

On Fri, 2026-01-30 at 16:20 +0800, Kevin Tung wrote:
> Add the device tree node to enable the IPMB interface used by

Here in the patch description you use (capitalised) "IPMB" but in the
patch subject you've used (uncapitalised) "ipmb". Can you please be
consistent and use capitalisation for acronyms.

I wouldn't normally mind and would just fix it up, but I've other
feedback on this series and have fixed the same problem a few patches
already today, so it's a growing source of irritation :)

Andrew

> the OCP debug card.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 7 ++++=
+++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> index 983aebc394d9159c7e3db2e7c39e963f7b64c855..84d3731b17f7c7c87338672bb=
cc859de2b89b722 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -365,7 +365,14 @@ i2c6mux0ch3: i2c@3 {
> =C2=A0
> =C2=A0/* SCM CPLD I2C */
> =C2=A0&i2c7 {
> +	multi-master;
> =C2=A0	status =3D "okay";
> +
> +	ipmb@10 {
> +		compatible =3D "ipmb-dev";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> =C2=A0};
> =C2=A0
> =C2=A0&i2c8 {

