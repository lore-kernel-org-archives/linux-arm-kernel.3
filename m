Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4781B109E550
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 05:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=il3g8uMgmZyxfuqxE59MMwiS51z8GXa/F/F4aoMlsVI=; b=TTSiOutw5e0nXjq6IBpFCnVUx4
	ouCCqWUs/O69KcWUId3GTsSkP5xHlBYoJ6MkYHKXOWjxas8jLoZXRjtSJbriirpuvyUbD56NZyW6B
	LJ+Kjqym2TsmleJUWemq7Llm8RSlpcc/QKflHQEBK33y43PsekJmxSq2ujBJGP9gwixaekJ8SFnqQ
	wmYcZnZyBuQJt5dZRZPYwpO5Jiyk5m124YpNt6FJNKrHU7MvoTOkUopn+7ryOrnNL4wWpuUWD0ICa
	ERBqEi+KmGazklXJzPFSjpsTigDNOgiykNxX+jxoTm0TLBLrN8Iwh8RT5JXZn0uWxA+/wulx+mzbi
	RRSdRgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dND-00000004kRi-3AzG;
	Thu, 26 Mar 2026 05:35:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dNA-00000004kQ7-3eZd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 05:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774503310;
	bh=il3g8uMgmZyxfuqxE59MMwiS51z8GXa/F/F4aoMlsVI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VTgnUmtoXWYE/vqR1G5jvE2cATbzQoH4Hd2dA7qzwHED0B/nhEVKPMpync81pfwRD
	 YGVzk7eBFgXMKfxap7NLscIG3TqecNGwQT2lPFb3oANLMo5vvooG0/qtkMEfggLU9Q
	 ObR7/76IWqPu8RLy11UNVj6lNpKi60h0AoA036fP98yvsw4SejcHUkngf46h0z7xM7
	 hjJhNMJI7kQU/AmLVhhaR8j3UHxBfYqjkZ1Oe3LaU5LDcs56w/w3R0bGoGdWu2fM+X
	 5gpPBUmv3t4BlxNNCqtzJGLZEgj3NXHuW64Ya+KxthZ8cRsP7jydqXMPwBmzrByRV4
	 O0b98Y6M9glCQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 81DEC6597C;
	Thu, 26 Mar 2026 13:35:09 +0800 (AWST)
Message-ID: <ec13c056cf74b4c7741e6f14cf9c49c159066f36.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite5: Add MP5998 power monitor
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Daniel Hsu <d486250@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Daniel Hsu
	 <Daniel-Hsu@quantatw.com>
Date: Thu, 26 Mar 2026 16:05:09 +1030
In-Reply-To: <20260305084650.24511-1-Daniel-Hsu@quantatw.com>
References: <20260305084650.24511-1-Daniel-Hsu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_223513_112696_D1CBA667 
X-CRM114-Status: GOOD (  15.69  )
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

Hi Daniel,

On Thu, 2026-03-05 at 16:46 +0800, Daniel Hsu wrote:
> Add the MP5998 power monitor device on I2C bus with address 0x46
> for the Yosemite5 platform.

I would rather you describe the purpose of the power monitoring. Why is
this instance of an MP5998 necessary in the system design? The address
of the sensor is evident from the details in the patch and isn't
necessary to describe here.

>=20
> This allows the hwmon driver to probe the device and expose the
> power monitoring telemetry to userspace.

I would prefer you reword or remove this sentence. The purpose of the
devicetree is to describe the hardware. What the firmware/kernel
chooses to do with that information is a separate problem.

Andrew

>=20
> Signed-off-by: Daniel Hsu <Daniel-Hsu@quantatw.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 5 ++++=
+
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-
> yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-
> yosemite5.dts
> index 2486981f3d6b..6287f80d70d9 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -422,6 +422,11 @@ power-sensor@45 {
> =C2=A0		shunt-resistor =3D <1000>;
> =C2=A0	};
> =C2=A0
> +	power-monitor@46 {
> +		compatible =3D "mps,mp5998";
> +		reg =3D <0x46>;
> +	};
> +
> =C2=A0	power-monitor@47 {
> =C2=A0		compatible =3D "ti,tps25990";
> =C2=A0		reg =3D <0x47>;

