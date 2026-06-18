Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71090CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 20:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSIb+Xnhtkh4603gGlMIYyjgq7gUwu78nAHoewAyslE=; b=j7Y0kX7Q8AZMcsEOwhLKhL5moP
	rC2pMt0AJzshgVx8G+eM2PU9GFxUDcr7wolr2B2zpmMgS/6wU/0Xg2FoqRobF6uoX08CToJydfeP2
	+ui0gGKZONTbn5xKEBPc7GoO37rndo4safqxl5MDXXWzqlKqaMsqa6Xct2FsQyyUBbjpuiJz27+5Z
	y91MSYCfTk0Es5rMXmjmXiEEF+kLx4SAzcHyW+GssXmcUcOPdWkwx6UOvz8CaqUrDmkLZ3DQkC8KS
	skvDFXTgBfhapM6+W4yZlhpKtUD21WBYx3jsP/81k63W6oMaN1/iwwOwuiFVj5gWhB0ck6L6RPNFD
	CtXRqHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIzr-00000001lNZ-3UjY;
	Thu, 18 Jun 2026 20:05:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIzq-00000001lNN-0g1Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 20:05:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27480601E2;
	Thu, 18 Jun 2026 20:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647281F000E9;
	Thu, 18 Jun 2026 20:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781813152;
	bh=iSIb+Xnhtkh4603gGlMIYyjgq7gUwu78nAHoewAyslE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J2vhPadKpAycrCWyQ4VoIP0RnhoBUVb5CokPhYoGcHyMRVnKVYzuzsff/lA5O6tiw
	 JPEbNxYeAmQk3+hnfD7ClJ64gGyrmapE5Hkhf3H31Jo26QAQHMSK2mFbQfTNS4eKcb
	 12E3Ph5ZP31mqde5wMDysHCn3LUTtgY3ZigiAhRSDTF/iL5QyAC/k/D8ndDLaWuiHT
	 o4UyYQBBUA1rXAfbzjobbc0llbl1mgsb+tnn4IibEmVCwqVnIlR/Isg9Q/FrTCUBRz
	 g85oMpqZOL3DRb8/wmA9V97Tjl7PdXUeryUIeNTDGsqJQXthf9tqYdtnnq0lwCddYB
	 SMVrLhXreABVg==
Date: Thu, 18 Jun 2026 21:05:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: spi: st,stm32-qspi: Add power-domains
 property
Message-ID: <2389579c-cde4-420e-8755-44cf4de10bd2@sirena.org.uk>
References: <20260618-add_power_domain_for_qpsi-v1-1-4d7e57bcfb9a@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hafQDUbp9k6UCBdI"
Content-Disposition: inline
In-Reply-To: <20260618-add_power_domain_for_qpsi-v1-1-4d7e57bcfb9a@foss.st.com>
X-Cookie: This unit... must... survive.
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


--hafQDUbp9k6UCBdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2026 at 08:46:35AM +0200, Patrice Chotard wrote:
> STM32 QSPI may be in a power domain. Allow a single 'power-domains'
> entry for STM32 QSPI.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--hafQDUbp9k6UCBdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo0T5sACgkQJNaLcl1U
h9A/pwf/SgEVdnoxmkZ3v4Lyil4/JLjj62RdAJuYela8TOThYKaczHP/cCRFLOa2
VM6Ff64DIyUiv+VIdyPVSXlXKZ2GwkN9bUd4pIYMeiP9CP2Te6CpPweUwWqv4TKT
vykhSMZ5f3B4vksMlzzsGxX7778ffQjhXUal/yAyPcPwFEaXv2ybKHRFKt+y3Cfg
qd3MY51PLoIu2Chxrg3X1lQSGDlQ9zblJeKnrj00jxVsOO0kWqVNZBZEdr1jCZtf
MFbY+41CDZtsKRZC3aHMseSePvIuSnBnBXm4c1AwYfbbDOcKNWj+4sy8p585PDX1
O7HG+47vGWB5sXxWe2C42ESsdb3yfw==
=8xSh
-----END PGP SIGNATURE-----

--hafQDUbp9k6UCBdI--

