Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAF2C531D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rA0O4ClmUVEoh3f94Y+vEhegRimMiCmv23Q9yV4+wRQ=; b=dOlEEjl+WKN7TrnYDgrCLInjtd
	Qz1Z87RfUl9ZW481o9pnkKbIm7mjG+pcBWAszLs/s4J/rPFuWvw8NFn25j83l1QfpcJplWxBh7DoM
	UXzaP2UE29s7RSk4xr0oo0GLbh3Wy5+5w2eBoEK8lqL/+BBaaLnL9qH5Alvn6taSxm/wreZtzw8nd
	pEoKmP9adi26MDN0pbIeMAuSPdZdMQ4WwLQhMDRjKf5H5w7745GZ2YVqIGVunGWnqdI8/V4tOhnvT
	Pzubj8xPVmve4Gsw33namm2FhhXkAdvNS8p/mRh9Vnim+kRmje1iQmqgwGXmua4M603tzyDcnzcOK
	JK4LtbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuIn-0000000EUIA-2dg2;
	Thu, 23 Jul 2026 14:21:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuIl-0000000EUHr-3mu7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:21:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A8C960A6C;
	Thu, 23 Jul 2026 14:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258431F000E9;
	Thu, 23 Jul 2026 14:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784816491;
	bh=rA0O4ClmUVEoh3f94Y+vEhegRimMiCmv23Q9yV4+wRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M8QdiKPKfruE5fG2RaIwODjw+vgzXq2cH/x6I+b/3itmT9HeryfA90xu4Kg5h4Vmh
	 P89TfBY0fRsg4qwOYh83utM7xE6SvZSV+vp7Z52ZkefW5k2nbcO3I+cchvRyt7+jak
	 ium1U2QO9a/IXO4HEWCFOlgggKZjHf9toTKBUMeW9ADzMWhhJrtycpjRJqUY1Iyw2N
	 S/uExPb1dsnq6LQ1G/xEEo0Ywec9fRrzRPq9wS0SUtZL3lsAUuGi+mvrysqq/CR8Jv
	 efzOiz0ygSBuvlm7Xrf46pEynF1T1yHC892P3QmVWR/ayNSI8441jzHol7wTZsr7EN
	 vZ9hBnzWZguNw==
Date: Thu, 23 Jul 2026 15:21:25 +0100
From: Mark Brown <broonie@kernel.org>
To: han.xu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v3 2/3] spi: nxp-xspi: Improve AHB read performance with
 DMA
Message-ID: <5a437693-21a5-4a32-aa17-a1e36fe564d0@sirena.org.uk>
References: <20260722-xspi_dma_upstream-v3-0-6b7ff50cae8e@nxp.com>
 <20260722-xspi_dma_upstream-v3-2-6b7ff50cae8e@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Jg1gxkaRhzjWA0C"
Content-Disposition: inline
In-Reply-To: <20260722-xspi_dma_upstream-v3-2-6b7ff50cae8e@nxp.com>
X-Cookie: (null cookie
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


--9Jg1gxkaRhzjWA0C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2026 at 05:00:43PM -0500, han.xu@oss.nxp.com wrote:

> +	timeout = wait_for_completion_timeout(&xspi->dma_rx_c, NXP_XSPI_DMA_TOUT);
> +	if (!timeout) {

I'll apply this since the issues are getting a bit theoretical but a
fixed timeout will have scaling issues - you can configure a very large
transfer on a slow bus (eg, 1M at 1MHz) and have a bad time.  I'm not
sure that would be a good idea in the first place.

--9Jg1gxkaRhzjWA0C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiI2QACgkQJNaLcl1U
h9ALoQf/eRd5XC9B+m+uk8SVMqVagA9x4UsMBkV4SrRH2mY37diQ5bpB9cr79tFi
wjf794ZOWhcmtsQQZgv2DEtj4wq3WJbRQ32NsvLc+eFp8I/MX+Ljp2C83ajdZ1yG
KIpsaBYlCzBxDlz8Ykzf3002eqavi9rpzUvdMLok/J1S3HX8O0Ovvb94L6IR19No
Z+GqxtJFnURhgx/2IkD3HnT/ZE30O5BcLLhEtiBfRT+D3frfWEG9Ezem0ud/V5yx
TlR0F+Rw7kUs5SlVnR64uQ55C1v/MLzb6zr3gSjE761Yz+D0v5LOHWITDb+22yf0
IVDAmUGHDZw1d0kuWZ4EBaDz8HhzYg==
=DILC
-----END PGP SIGNATURE-----

--9Jg1gxkaRhzjWA0C--

