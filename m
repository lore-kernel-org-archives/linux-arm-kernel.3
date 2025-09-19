Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9150CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULo+s/2ODXQFh/JQvlxtb4DFX6XMnuyriiEG79m9GJM=; b=RYW2wB8P4a6Uq4zJVq7jlTovkN
	lrAjOqurURAR6XnmI8asqRxZfxy19l5+rAxRLE4PnpROZqHsMb2tM1bkeXatxQjZMdbMGXzCRrK0t
	mPBggI77gfEEMZhc7cjoDN9o1DMRHEh1XW2N5VZDnjz9afxpURd4MlTnBU1h7p4102FPAaKxAdDax
	fr86/c24zNbIVYRttcHNZhXNLVuE0/AAQ6A/WjQwjqXTkOy9vbyhYOrarG9tNd/JnPUmSQQvY8j0c
	/FyLzQnLuBlESSqerUcu6CZnwPbW4NN0/3oJzjdZebfn8rVytroCw9JWqtPlNN8Fxs0nfGK4vTpYF
	KQrebtnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVZ7-000000023jC-0e9D;
	Fri, 19 Sep 2025 07:29:57 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVZ4-000000023hq-3WhY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:29:56 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 589C62C3;
	Fri, 19 Sep 2025 09:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1758266984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=ULo+s/2ODXQFh/JQvlxtb4DFX6XMnuyriiEG79m9GJM=;
	b=1Q9K6MmjLYc1p1dVzCDV4PHncM13bZWTFhk4daeNOWiPoXjjhd9ESBhalgFcxuEInIY6jC
	9eMChdRfikcN9Dov8RMurKm+GInrpv2tc9dDNVFX7oAPP1O+JhM29nlnqhNjTIe5mDEMI+
	l0Xx7v8TaU8/PKN8ifMpRAQ5QwOqk0h2xzRTcjmnIZKynFShuVr+x6YIf1yt9DcaPVdxKu
	ek9GWZDMEBBf6Y9cUou4dvGkcggtqs3/IGuWhqULNzjfrcuk/rkBY2tEfATz7VS1D6x2FU
	rHv8bt1W36WznlTp06ksR5jMwxx0bHYqvSESRi67PtMBjgEuVj4ar06+2n5RuA==
Content-Type: multipart/signed;
 boundary=607f87c26e3858208822f511b1a3d85f1caa719f1409f1ec0c9a12bd8be4;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 19 Sep 2025 09:29:41 +0200
Message-Id: <DCWLMKKUEALZ.CX4XNGWG80B8@walle.cc>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Peng Fan" <peng.fan@nxp.com>, "Frank Li"
 <frank.li@nxp.com>, "Marco Felsch" <m.felsch@pengutronix.de>, "Han Xu"
 <han.xu@nxp.com>, <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: "Peng Fan" <peng.fan@oss.nxp.com>, "Haibo Chen" <haibo.chen@nxp.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: imx8mm-evk: limit the max frequency
 of spi nor chip
X-Mailer: aerc 0.16.0
References: <20250917-flexspi-dts-v2-0-7e2a95e3cf4d@nxp.com>
 <20250917-flexspi-dts-v2-3-7e2a95e3cf4d@nxp.com>
 <20250918090151.GB23028@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250918090151.GB23028@nxa18884-linux.ap.freescale.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_002955_016562_6943D71F 
X-CRM114-Status: GOOD (  19.74  )
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

--607f87c26e3858208822f511b1a3d85f1caa719f1409f1ec0c9a12bd8be4
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Sep 18, 2025 at 11:01 AM CEST, Peng Fan wrote:
> On Wed, Sep 17, 2025 at 04:42:29PM +0800, Haibo Chen wrote:
> >The spi nor on imx8mm evk board works under SDR mode, and
> >driver use FlexSPIn_MCR0[RXCLKSRC] =3D 0x0 for SDR mode.
> >According to the datasheet, there is IO limitation on this chip,
> >the max frequency of such case is 66MHz, so add the limitation
> >here to align with datasheet.
> >
> >Refer to 3.9.10 FlexSPI timing parameters on page 59.
> >https://www.nxp.com/docs/en/data-sheet/IMX8MMIEC.pdf
>
> The SoC SDR mode max supports 66MHz, 133MHz. DDR mode max supports 33MHz =
and
> 66MHz. Saying the driver now only use RXCLKSRC 0 to restrict the
> device tree to 66MHz is not that correct.
>
> The SoC max frequency could be coded in driver per my understanding.

Yes that is correct. The spi-max-frequency property is for the
device, not the capabilities of the controller. I.e. the flash chip
on the board.

> For the QSPI-NOR chip, the spi-max-frequency should represent the NOR chi=
p
> frequency. But that chip supports SDR/DDR, so a new property
> spi-ddr-max-frequency, if we take spi-max-frequency as the max NOR
> CHIP SDR mode frequency?

Which chip is it? I'm not sure that this is required because the
supported modes might be in the SFDP data and we just support the
8d8d8d mode backed by the JEDEC standard.

-michael

> So if spi-max-frequency is the maximum NOR chip SDR frequency, the driver
> should also be update dthat DDR mode is not supported as of now.
>
> Just my thoughts.
>
> Regards
> Peng.


--607f87c26e3858208822f511b1a3d85f1caa719f1409f1ec0c9a12bd8be4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaM0GZhEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+KPsAYDD0piVNNV1rVcmBba2vIiBIGQxNaJUhr2q
lYJGIGcAQlr/mGzZGwhSKi3yd0EIsf0BfjT4Yw6BoYAIc+6qpYnJ19d0UyQMSjTj
1WEXBgDHozBpOEaD/ghy6y614JlE15ewtQ==
=Zu8u
-----END PGP SIGNATURE-----

--607f87c26e3858208822f511b1a3d85f1caa719f1409f1ec0c9a12bd8be4--

