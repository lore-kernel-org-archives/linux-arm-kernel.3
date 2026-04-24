Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBFDFED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 17:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgDUC+a18hY1qJbTl0Ow07f99fugS8GWyc5w2OTuH6M=; b=ai3dpZkbHZQx04NkuLwaRhmKmF
	B7ALxYVZyug68VAKfZxTsoFMMigpy2ZFHFPGQjJqLEVPQeuEwX76X3hsqK5CAnS6jvWJbm+DMsIjT
	FELErDaahC66GGJfrEude4RC3phmdXNM+illeuDEUQo7BQ4IHDfZjTa6y1PzQnmDNvMSXYD4+KF1m
	Hj4QquGP6BypRiSmLp1PpoI8KtdSZAPg/x2ToPeDKWmAZStr4WcEc4vuWXwGPPLMtiC1UucgyTH+W
	R1YCr5MC7nC+D4Ui+Yr07iOeAl5Si5IlBQOhWiS9oe4RDSApxSbJaRrJAf17GZoJzbGBG3Uvu2J7q
	8+fnzPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJx6-0000000DZKt-0mPq;
	Fri, 24 Apr 2026 17:04:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJx3-0000000DZJT-3rL0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 17:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F45A41679;
	Fri, 24 Apr 2026 17:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5A1C19425;
	Fri, 24 Apr 2026 17:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050265;
	bh=fgDUC+a18hY1qJbTl0Ow07f99fugS8GWyc5w2OTuH6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3ttbWSVSBRruP5aod7T5/0aJTlIipUtHXg8nH86dDFW8AvCzG3Pa9nWqQUCInyl1
	 6aUKNmK4DmauNS+7pyGdQehssKKnx1mvHinLp6M6Wx8dxD1JlA5inbls25jFaHxYSZ
	 KJUzotqWzJPxPShlaE2DBVFKNqW0ZwBM16xJUKbK0PDc0g7sGV62gZx26E6v9pdwlQ
	 A22WXlah2xkEx9FUWNsQVqSV5buynp5lsrKcCi1XG+1IWjoBEq5ZqPvpu0tj1MxIHW
	 ZTF/UL3mSYbHyHfqccfAvzrDiVJtUftfrXs/geNdANgIbCFu24KcQjj6jL7XkUlJud
	 NJ4ZNtmG+Cd4w==
Date: Fri, 24 Apr 2026 18:04:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v12 1/2] media: dt-bindings: nxp,imx8-isi: Drop
 fsl,blk-ctrl requirement for i.MX8ULP
Message-ID: <20260424-crushing-synthesis-46c5c423fa9d@spud>
References: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
 <20260424-csi2_imx8ulp-v12-1-da148eabc035@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cz7yp52ESwv+fNtV"
Content-Disposition: inline
In-Reply-To: <20260424-csi2_imx8ulp-v12-1-da148eabc035@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_100425_978522_20F51BB2 
X-CRM114-Status: GOOD (  10.25  )
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


--Cz7yp52ESwv+fNtV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 02:49:50PM +0800, Guoniu Zhou wrote:
> The i.MX8ULP variant does not require the fsl,blk-ctrl property. Add
> fsl,imx8ulp-isi to the exception list alongside fsl,imx91-isi.
>=20
> Fixes: 288517a3c6c9 ("dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI =
compatible string")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Cz7yp52ESwv+fNtV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeuikwAKCRB4tDGHoIJi
0ls9AQC6Gvq6+BRlx+Okq2Qt/M1Gp1lBdnB7GKqtHiJVu6E5sgD+NW0d7/6n4ySn
ApgOHeb+OcQPSagNXpd6UIKjKXMuQAo=
=GRqU
-----END PGP SIGNATURE-----

--Cz7yp52ESwv+fNtV--

