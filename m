Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0669FE9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 04:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXrvUZQrcqQlGaHQ11Cid7iVmcJJZTJxmPs9kL1e/rs=; b=KXpUv/1CWv0b8QP+eoGsMkGaUH
	ZxxLZWape3ufAzwbgYdI6mp+cz86ZxdbVOFl9jFZ+eNUujGo/PIl98KNfSwZ+YR94ojKCTQ8p+hei
	seh8ONP2gUtURuesRBpI9sqBkhseq2gazGNz1xPz30X255hebRQKmxzH1bxZhgsZ3+aueaxcPrzH0
	DtFeR+CqwIoRJ4yFih8YNvfluHUJkNtBA05P+LW8e8E8hqbWOJmYzTnKxb6XwVqtUMZX3rpjU0tSp
	He9bnjMeg17JITQJhvUj9hL074ZYVs0ic6S7ia24JOigrWYMrE1uo5lCgn8KU2A+hNlsWzuB/luki
	uPyGGfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsvXK-0000000AqlH-3SSM;
	Thu, 19 Feb 2026 04:21:10 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsvXI-0000000Aqkk-0EKA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 04:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1771474857;
	bh=hXrvUZQrcqQlGaHQ11Cid7iVmcJJZTJxmPs9kL1e/rs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Bwojwkghc4xDICaeOQpHCSeB8PghyUnrrJCRmCC47tvOKYdQauZ9ySpiEMgRFHQje
	 W7XQ9bOGmCwzJzAxSgb2kQWMHDnx/ck8uhmj78B3mgYQd5yosqtJWjc/aDRaobYMyG
	 1ievMsTD9NDe9y/4hZJpDuMYcEeSZ3CCfADJ8yASmQo+o5gwgvR8A12pyU8vI6HtjI
	 0IkXNFnda2+4MMi1XQliOtPXfvhNz1fd72yaFBtJxUdN58Lcmj0y9qqNtfYGLK2fin
	 ml2MnBIN3YNT9i2P2sMskWwrRTHdNUV04FscunCJESHRjbT4iScD7f1Zj110Q19EG7
	 2ajMkwQcxDSQw==
Received: from [192.168.68.114] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1839760033;
	Thu, 19 Feb 2026 12:20:55 +0800 (AWST)
Message-ID: <6192440acc150d216de5e074299e579e891fc845.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: dirkchen@amd.com, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Feb 2026 14:50:54 +1030
In-Reply-To: <20260209-b4-anacapa-dts-fix-v2-1-fe446a7038bf@amd.com>
References: <20260209-b4-anacapa-dts-fix-v2-1-fe446a7038bf@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_202108_316256_64E0F365 
X-CRM114-Status: GOOD (  15.17  )
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

Hi Dirk,

On Mon, 2026-02-09 at 15:58 +0800, Dirk Chen via B4 Relay wrote:
> From: Dirk Chen <dirkchen@amd.com>
>=20
> The Anacapa board features Atmel 24C2048 EEPROMs on i2c0 and i2c1, which
> are used to store retimer configurations. Add the corresponding device
> tree nodes to support these components.
>=20
> Signed-off-by: Dirk Chen <dirkchen@amd.com>
> ---
> Changes in v2:
> - Improved commit description to clarify that the change reflects
> =C2=A0 actual hardware as requested by the reviewer.
> - Removed mentions of other platforms to avoid confusion.
> - Link to v1: https://lore.kernel.org/r/20260202-b4-anacapa-dts-fix-v1-1-=
20d4b0114854@amd.com
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 12 +++++=
+++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 221af858cb6b..b8d248d99d7c 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -328,6 +328,12 @@ i2c0mux0ch3: i2c@3 {
> =C2=A0			#size-cells =3D <0>;
> =C2=A0		};
> =C2=A0	};
> +
> +	eeprom@50 {

Please order these nodes by ascending address. The node currently above
this one is i2c-mux@70 - eeprom@50 should go before it.

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-=
nodes

> +		compatible =3D "atmel,24c2048";
> +		reg =3D <0x50>;
> +		pagesize =3D <128>;
> +	};
> =C2=A0};
> =C2=A0
> =C2=A0// R Bridge Board
> @@ -362,6 +368,12 @@ i2c1mux0ch3: i2c@3 {
> =C2=A0			#size-cells =3D <0>;
> =C2=A0		};
> =C2=A0	};
> +
> +	eeprom@50 {

Same for this one.

> +		compatible =3D "atmel,24c2048";
> +		reg =3D <0x50>;
> +		pagesize =3D <128>;
> +	};
> =C2=A0};
> =C2=A0
> =C2=A0// MB - E1.S
>=20
> ---
> base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
> change-id: 20260202-b4-anacapa-dts-fix-207ffe9a3b0c
>=20
> Best regards,

