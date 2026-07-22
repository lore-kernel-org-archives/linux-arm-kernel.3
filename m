Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1870BC44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTfIheDloNnyvS/07ptSkTa3ttkId0J9LRZYffRoniY=; b=EUOmj2W7gNIqZ6ZcUQRIb+XOVE
	27zHESKg+O1tBkf4G51EuW3qFgRwnrYIR4m57Ziq/RU6bUBcfq3zb1TEpU44Hw13sogdh1J1q27d+
	MBA8D7Oag1EU+srIWjQc8LlI+6TVT+MKCw2txtKEebVZjmbXRBpVCf76NR7ID1F/8imxjk1Z9AIhv
	g+i6R/Pgtgd1Qi+DN1n1xxGiH+bpdtczjNVtF2hs2hX7ijeBFAqDrdAshbeG2SB5aZbi7OjsgbA3h
	nYdCjNPa5cmt48GdSe25xvZ7IQnYsN6SkL4iwx8+6rGrmPIzfetKwkaweSzGSoRlAQverLzFT3q76
	eLL0H2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUrH-0000000Bcdj-0Aa8;
	Wed, 22 Jul 2026 11:11:27 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUrD-0000000Bcbd-40Ln
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dTfIheDloNnyvS/07ptSkTa3ttkId0J9LRZYffRoniY=; b=I7Eu4Mj00fcEEwtilBdFXLATzc
	HGvVi1aRIu9gF405VHJS/J/977VV08+LQp5HWAsIYeuRgz+ogez6HTGpe0WLt1hXG2ozrgTy2Rr+o
	YjpZhiwznBJIBljz0BCeZ9WWSxfr9Ke7tHQs+hefezEYNaJKbckgq/ywtDbrDhbA+Q4cFkub6zqmM
	R6wfN2VvwFGflfeKTlFOXg6hM8WCvfQHGWhYMvMhvU2xIHuy22IZ12kS1jIGPN+XHJkQfJWID3AM3
	QIymGSmu91N2clLXbSGNXo/cQfzFJxswCqZPWhBp6C/TZM9aRI6gUK9T7y6i6Ddp2Rc9mLv4u4BOE
	MEr65I4w==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmUr1-000JLh-2p;
	Wed, 22 Jul 2026 13:11:11 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmUr0-000K96-3A;
	Wed, 22 Jul 2026 13:11:11 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8qm-ss-dma: add LPUART4
Date: Wed, 22 Jul 2026 13:11:10 +0200
Message-ID: <3426538.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260722104200.17729-1-stefano.r@variscite.com>
References: <20260722104200.17729-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28068/Wed Jul 22 08:24:50 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_041124_111647_869D3AEC 
X-CRM114-Status: GOOD (  13.40  )
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

Hi Stefano,

Am Mittwoch, 22. Juli 2026, 12:42:00 CEST schrieb Stefano Radaelli:
> From: Stefano Radaelli <stefano.r@variscite.com>
>=20
> Add the missing LPUART4 node to the i.MX8QM DMA subsystem description.
>=20
> The peripheral is present in the SoC and its LPCG clock controller is
> already described, but the UART device node is currently missing.
> Describe its registers, interrupt, clocks, power domain and eDMA
> channels based on the NXP downstream device tree.
>=20
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Commit d879cc948e6f7 ("arm64: dts: imx8qm-ss-dma: add lpuart4 node") landed
in next-20260721, which is essentially the same patch.

Best regards,
Alexander

> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8qm-ss-dma.dtsi
> index 974e193f8dcb..25c5e4423163 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> @@ -8,6 +8,22 @@
>  /delete-node/ &adma_pwm_lpcg;
> =20
>  &dma_subsys {
> +	lpuart4: serial@5a0a0000 {
> +		compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> +		reg =3D <0x5a0a0000 0x1000>;
> +		interrupts =3D <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent =3D <&gic>;
> +		clocks =3D <&uart4_lpcg 1>, <&uart4_lpcg 0>;
> +		clock-names =3D "ipg", "baud";
> +		assigned-clocks =3D <&clk IMX_SC_R_UART_4 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates =3D <80000000>;
> +		power-domains =3D <&pd IMX_SC_R_UART_4>;
> +		dma-names =3D "rx","tx";
> +		dmas =3D <&edma2 20 0 1>,
> +		       <&edma2 21 0 0>;
> +		status =3D "disabled";
> +	};
> +
>  	uart4_lpcg: clock-controller@5a4a0000 {
>  		compatible =3D "fsl,imx8qxp-lpcg";
>  		reg =3D <0x5a4a0000 0x10000>;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



