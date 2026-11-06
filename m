Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32215606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 04:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kbWSZJql;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VdVV4V5Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kxFpMtQbzKIRxEyj/jc+g0b9VDx9hp1+9az4E+nbn3U=; b=kbWSZJqla7c7LaLAn2SJwAN+qM
	/BogMx3xrDouU8PqVWyIrM0J7Nl6LA2Zgz8BEbRvrw7Nai4Mboa+JiqbwXMD3Pzdzge0E4ZKeevdF
	pwq+MmXi8C8RxAL9DtiusOlltOjUsQwCxtq6sPuF75SfCzc7T6TVd8aEvw20Pd1GM0mAvLqflD2Km
	OIFOJe8NvdZouQzKFCPtrXq1Jy7/OO11riLG7FNRpKTyLyrvnQD3//WraDMLvB9o9AmpJrlIe+JT/
	dzUinKETJr//ZoJfXaW3qj+QY/N1dh8sykFPBPfbX/+KfPgceILR0ceRSUyNJFjA8r7hb10dJ8ke2
	43JDl7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPBuc-0000000BEXP-2eFY;
	Fri, 06 Nov 2026 04:50:50 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPBuZ-0000000BEX0-43eY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 04:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793940645;
	bh=kxFpMtQbzKIRxEyj/jc+g0b9VDx9hp1+9az4E+nbn3U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VdVV4V5YyBeklNYMLlTDcpWHCtmgoy7lcLNQr36qF84kCLsoNnb/nc/Hd9v1lTf/W
	 o7qbp9x44oun7kbQvUe1AOhr/28CoD/9ZLPqBuhRng+BHIx/JHeb6ciGFQoJxTeeJ5
	 6uIXhQua2Lqsdmq12APk08T5vkuCOZib9/0JV6nZ0DSnQMto9gc1Wu0T8aXW2IVjyD
	 4vXyYoPEoBWLrCr9l6ecnygTl2IFeqaZfamMw5da2cGnJiDGnq7Jc5yqLvuq7W4oRs
	 RsM0t4sks6ZqXJ8i6dPi0oTJP+hNR7qCT98HzKgUy21OVHfLmENgNSWZsQUDj3efHO
	 AmDX4/IYAwGBw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1C32964952;
	Fri,  6 Nov 2026 12:50:45 +0800 (AWST)
Message-ID: <7eda59ffde46142602c6d8e425fd4097872ee8c4.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/3] ARM: dts: aspeed: add Intel JNCRP BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com, Andrew Lunn <andrew@lunn.ch>
Date: Fri, 06 Nov 2026 15:20:44 +1030
In-Reply-To: <ffb7b028f317a3a2cd1a98b8f454b46a706cee42.1792749922.git.dawid.glazik@linux.intel.com>
References: <cover.1792749922.git.dawid.glazik@linux.intel.com>
	 <ffb7b028f317a3a2cd1a98b8f454b46a706cee42.1792749922.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_205048_209902_D7FDA8D6 
X-CRM114-Status: GOOD (  14.18  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-10-26 at 17:40 +0100, Dawid Glazik wrote:
> Add the initial AST2600 device tree for the Intel JNCRP BMC platform.

Can you please provide more information about the platform design and
its purpose?
>=20
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> v4:
> =C2=A0 - Rebased onto aspeed/arm/dt of bmc/linux.git, no other changes
> v3:
> =C2=A0 - Sorted nodes alphabetically
> =C2=A0 - Sorted properties per dts-coding-style
> =C2=A0 - Removed lpc-snoop label
> =C2=A0 - Removed &i3c_global since it's enabled by default
> =C2=A0 - Added &kcs3 and replaced flash layout with 128MB one
> =C2=A0 - Restored Reviewed-by from Andrew Lunn, dropped by mistake in v2
> v2:
> =C2=A0 - Reviewed-by: Andrew Lunn for nodes: &mdio1, &mac1
> =C2=A0 - Replace bootargs console=3DttyS4,115200n8 with stdout-path =3D &=
uart5
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../dts/aspeed/aspeed-bmc-intel-jncrp.dts=C2=A0=C2=A0=C2=A0=C2=A0 |=
 276 ++++++++++++++++++
> =C2=A02 files changed, 277 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.=
dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 1e4154f12228..5e685a625883 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -58,6 +58,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-ibm-sbp1.dtb \
> =C2=A0	aspeed-bmc-ibm-system1.dtb \
> =C2=A0	aspeed-bmc-intel-avcrp.dtb \
> +	aspeed-bmc-intel-jncrp.dtb \
> =C2=A0	aspeed-bmc-intel-s2600wf.dtb \
> =C2=A0	aspeed-bmc-inspur-fp5280g2.dtb \
> =C2=A0	aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts
> new file mode 100644
> index 000000000000..e66ea7f00fed
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2025 Intel Corporation
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	compatible =3D "intel,jncrp-bmc", "aspeed,ast2600";
> +	model =3D "Intel JNCRP BMC";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		bootargs =3D "earlycon";

Please remove bootargs here, earlycon is for debugging.

Andrew

