Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661D2CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6dhvhvt0XbgvJ4MiXah8HcXTJRguTuta/3Cu0D1xfk=; b=HIfCq5aIQJ653qOI8zHPlSFxex
	HDAtPk73Fw9MmgUCamqhAiGhVSxerGTZy5AB7LzZLOeCf6n5a24CD/5ZTx8v/6mdjzUMQlPtDHN8f
	KVkC37gLhYvmDRuLW/LQU8abCZ7UTe0ZhDoyMrYe7A/K6SVRHNNFnZKNZFCsdNasUG3RMSld4f9yG
	QgCFAw51a4LlCvoKYo4Cvim5iE2ImihImVcPXMap0nVLUMIWPMLYjf7hjSHaEEHnAgzXMXOwhLi+X
	9isAna6xKlx6CrAom3qV1MzqVw4ltqB+xjX/ZI0pVI20hpg8x87gDaI0Y/MJ0rXm/6R/TyytkmAHL
	NVOmVy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwNN-0000000ATfP-0nYD;
	Fri, 12 Jun 2026 07:32:25 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwNK-0000000ATem-07TX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781249539;
	bh=M6dhvhvt0XbgvJ4MiXah8HcXTJRguTuta/3Cu0D1xfk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SB/fmF/UtpDABvxWo6CkMbOQiVJgrTCJ+PgUHfhT9n2Q6wdkGrGmoPR41KZYXVcmK
	 5GleojLO+whw8ZTjaCgkn+t3/2tdalhZaqEoDZZLkzLYFoBv1B8+0w3mkF7DjIxF84
	 4Djxk5Vm6hqpANJ1Z2ApD6AKiqk8/THeCsPJc3BTJAQDPu+sE/Y4wblmGap3TNvjlj
	 oO2mIhH7qlMCz+jIKB//L+bxPABiE50Erw7flw+qqD9pjHEaExY2qSY6HEe/q5nER3
	 3ZCpWszBKUH9wvaxqdNYD/paemGjIcsZZiQaZWRhFkJ6LD/C+YB7jVednY98G+MM84
	 EuhRD1Ycjov+A==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6FA2860931;
	Fri, 12 Jun 2026 15:32:19 +0800 (AWST)
Message-ID: <e865e2e71a39c86a8afb6af49d9ebcf6839a9a2a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: g6: Add AST2600 pwm tacho
 controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Fri, 12 Jun 2026 17:02:19 +0930
In-Reply-To: <20260612072341.278591-1-gregoire.layet@9elements.com>
References: <20260612072341.278591-1-gregoire.layet@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_003222_290284_58CC8EB6 
X-CRM114-Status: GOOD (  11.75  )
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

Hi Gr=C3=A9goire,

On Fri, 2026-06-12 at 07:23 +0000, Gr=C3=A9goire Layet wrote:
> It use the existing ast2600-pwm-tach driver.
> Placed according to bus adresses ordering.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 189bc3bbb47c..818d486b94ac 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -102,6 +102,15 @@ ahbc: bus@1e600000 {
> =C2=A0			reg =3D <0x1e600000 0x100>;
> =C2=A0		};
> =C2=A0
> +		pwm_tach: pwm-tach-controller@1e610000 {
> +			compatible =3D "aspeed,ast2600-pwm-tach";
> +			reg =3D <0x1e610000 0x100>;
> +			clocks =3D <&syscon ASPEED_CLK_AHB>;
> +			resets =3D <&syscon ASPEED_RESET_PWM>;
> +			#pwm-cells =3D <3>;
> +			status =3D "disabled";
> +		};
> +
> =C2=A0		fmc: spi@1e620000 {
> =C2=A0			reg =3D <0x1e620000 0xc4>, <0x20000000 0x10000000>;
> =C2=A0			#address-cells =3D <1>;

Thanks for the patch, however:

https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git/commit/?h=3Da=
speed/arm/dt&id=3D6cf976b2728f2494215c51c7339dd50b154125ce

You can also find the commit in linux-next.git master and soc.git
soc/dt, queued for v7.2.

Andrew

