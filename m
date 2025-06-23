Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E17CC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKcDIsLtDkJF8WnaZ9J4aPyfYmz76ZwgpoDVX5vadBE=; b=x9t4AEI3c+rpbdX/Ifkm8ZOcH6
	i6r5Xb47Ol9XQ4Y+3HShgm+4DNrBlR18tP/mDdB/u9oBATFTyEHcIdpeS+UGAmd5jEl3cZr0HGzJb
	iXHm5In1tKZRLS8X7FjVEkuI/w6XSmNTVzF5jUgrfyprCcr3kTzO2Br2JD95tcX2j3dqH23s+pIv3
	RqScIqO/EtAOtuGKxD8Ng0zkeYzM9S3gN10CDU2KSKDWbqYq/h4m2W/OW7wVxvIOZwL5UvybYHfVN
	7DxsrmcX85rhifcQLjmnC6vPcqmvqimSgN9yntZa8jQIiGFSHtGbdbMhsbPHntbcW0k1igDnEyW3r
	kBf6h2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgyK-00000002pmq-1b1R;
	Mon, 23 Jun 2025 13:12:28 +0000
Received: from www637.your-server.de ([168.119.26.117])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfRD-00000002W3G-1sx8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 11:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tKcDIsLtDkJF8WnaZ9J4aPyfYmz76ZwgpoDVX5vadBE=; b=MuSaY5n74FI9fcbi6OCoUj2h6L
	HCrKEel8kuCKkMraPu6hSn0aioGtpsMeoANQbEi05Fy14IFgoJxbT7PHgS6iFy7ZJivHtKa4vmOfX
	HDb0aXCeQfAiJYqvkMaOHH9ltryHJpRUusEren5v5dZSFUhDP1ljSp16R4mwckW8/iWrkBrAaoxmm
	Eiub8zq0wzFE0V6X1IHwxYyQvrPlmFgkVxQ6tzL3rrCUdxb6aJp3xgCC8LzbiTmDpF6vRsg7Xcjmw
	LDFkgdZ4J9+rgAiSwtMQ0Il/O0WdaM4Nl4BeAB1cPWbqn33xIxk1SHbfUqSIX5+C1FkqG2JJ2FPF/
	eUNcZ1Uw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uTfR8-000P6I-1o;
	Mon, 23 Jun 2025 13:34:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uTfR7-0002er-0U;
	Mon, 23 Jun 2025 13:34:06 +0200
Message-ID: <46a681a84a7493e2d0a6d3a4eedb6c86ccd9903f.camel@apitzsch.eu>
Subject: Re: [PATCH RESEND v4 0/5] media: i2c: imx214: Add support for more
 clock frequencies
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Ricardo Ribalda
	 <ribalda@chromium.org>, Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 23 Jun 2025 13:34:03 +0200
In-Reply-To: <aFj5QnPBO0We5SBQ@kekkonen.localdomain>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
	 <aFj5QnPBO0We5SBQ@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.7/27678/Mon Jun 23 10:34:34 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_043411_839370_F47C96CB 
X-CRM114-Status: GOOD (  20.46  )
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

Hi Sakari,

Am Montag, dem 23.06.2025 um 06:50 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> On Sat, Jun 21, 2025 at 11:37:24AM +0200, Andr=C3=A9 Apitzsch via B4 Rela=
y
> wrote:
> > The imx214 driver currently supports only a 24 MHz external clock.
> > But
> > there are devices, like Qualcomm-MSM8916-based phones, which cannot
> > provide this frequency. To make the sensor usable by those devices,
> > add
> > support for additional clock frequencies.
> >=20
> > This series supersedes
> > https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-467a4=
c083c35@apitzsch.eu/
>=20
> Is there a difference in this set from the v4 you posted previously?

There is no difference to the v4 posted previously. This is a resend
because there was no activity in the original v4.

Best regards,
Andr=C3=A9
>=20
> >=20
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> > Changes in v4:
> > - Add missing colon to error message
> > - Add A-b, R-b tags
> > - Link to v3:
> > https://lore.kernel.org/r/20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@api=
tzsch.eu
> >=20
> > Changes in v3:
> > - Limit range of pll_ip_clk_freq_hz (Sakari)
> > - Drop unneeded 'ret'
> > - Use pll.pixel_rate_csi for bit rate calculation
> > - Add patch that deprecates the clock-frequency property
> > - Link to v2:
> > https://lore.kernel.org/r/20250505-imx214_ccs_pll-v2-0-f50452061ff1@api=
tzsch.eu
> >=20
> > Changes in v2:
> > - Add A-b tags
> > - Switch to v4l2_ctrl_s_ctrl_int64() to acquire the control handler
> > mutex
> > - Add error handling for v4l2_ctrl_s_ctrl_int64() and
> > =C2=A0 imx214_pll_update()
> > - Replace "read clock frequency from dt" patch by "remove hard-
> > coded
> > =C2=A0 external clock frequency" patch
> > - Link to v1:
> > =C2=A0
> > https://lore.kernel.org/r/20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@api=
tzsch.eu
> >=20
> > ---
> > Andr=C3=A9 Apitzsch (5):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Reorder imx214_parse=
_fwnode call
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Prepare for variable=
 clock frequency
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Make use of CCS PLL =
calculator
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: dt-bindings: sony,imx214: Depreca=
te property clock-
> > frequency
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Remove hard-coded ex=
ternal clock
> > frequency
> >=20
> > =C2=A0.../devicetree/bindings/media/i2c/sony,imx214.yaml |=C2=A0 29 ++-
> > =C2=A0drivers/media/i2c/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/media/i2c/imx214.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 263
> > ++++++++++++++++-----
> > =C2=A03 files changed, 217 insertions(+), 76 deletions(-)
> > ---
> > base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
> > change-id: 20250406-imx214_ccs_pll-e4aed0e9e532
> >=20
> > Best regards,

