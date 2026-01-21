Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470D4C44521
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onRfVIo26coNR0KbGuDYa+ySg0gGvvb027KvCsEMKiU=; b=CJPPD7fLpY2SxLLwPaZ8wIsvM1
	cVDRuzydKsGmkZSHIgn8ud9zWIp/2zSonUadv35nofQTpWQRf9QDNKcTd0n9xvclZnyIVnh2ORGFt
	TgbGvWWwzGPTte8R1kOMirJ1poenRQfzS3xUQAaJbFtDK0EpmmcxMkrwlwHsGhD6UMewag4Q2OrXn
	4siS/TANKAWU35gh3eJw2xRuwBJedCckgjc/Vq6jyfbP9uULFX83JH2TiC9NRRpnzwxSuTZhW00kO
	k4M6k5Dy1IuPrBk7dOyVYAA3dwpFlsmsXZSGApldagRokTdcQSrBNGcJrhgXdTw/jIwOWxp/vtQeS
	dserALBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXRo-00000005QuC-39U7;
	Wed, 21 Jan 2026 12:36:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXRn-00000005QtN-3Q81
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 12:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0BAA6011E;
	Wed, 21 Jan 2026 12:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E53C19421;
	Wed, 21 Jan 2026 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768998960;
	bh=pOlVtUxzIp/e/GzsuBlUxisWdeDDFC48fUu+Lg12zzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vOF2SfuEGaCaDo5+NXEOld6HywY5neFaj5CdZzDl/MevmrZFp+VcB8fXAaLp+ibZN
	 KMsmqi0LZxbbzWTBnDu91ZgYjNMUrRjLxaubqzj5aS+OlELGAdZ7PbouoXwOHaabwk
	 on/fDTz04c9pEsVadaRa2lkUFiM/v35GBY3hcJr2TC97UEYYz13BwP+/BXJ6O/vHd1
	 Ur/k+QLaVl954DG/PYawnrtPNracK4WP5pZSDk+P1PTHzWdxWcwq32XjUO2PldnM7Y
	 izciOT3nK92jCOO1fDWUqFrTx+bkg133XtmUPvcN1arzuO3wfRdkA56qQxCN1iTsOC
	 v8jpOb1+PAu2g==
Date: Wed, 21 Jan 2026 12:35:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] spi: xilinx: switch to device properties
 and make IRQs optional
Message-ID: <aff8daa3-61e4-4808-8be9-45349c2f5de9@sirena.org.uk>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <176893698361.778248.6867023245726406177.b4-ty@kernel.org>
 <c0288962-6a11-4274-9e93-91bd5a6997c5@amd.com>
 <83b93899-8f48-47cb-a74a-b4e838cc463b@sirena.org.uk>
 <8270c11f-7244-478e-b341-2ae7f6e1e416@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SiPyTjI69BrnJyTx"
Content-Disposition: inline
In-Reply-To: <8270c11f-7244-478e-b341-2ae7f6e1e416@amd.com>
X-Cookie: Eschew obfuscation.
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


--SiPyTjI69BrnJyTx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2026 at 01:26:04PM +0100, Michal Simek wrote:
> On 1/21/26 12:39, Mark Brown wrote:

> > My understanding was that the hardware doesn't require physically wiring
> > up the interrupt signal and can work in a polling only mode.  That's not
> > unknown for SPI controllers.  If the interrupt is actually a strong
> > requirement for the hardware (and especially if it is actually wired up
> > on this system) then we should drop these patches.

> Keep in mind one thing. This is soft IP in fpga. If you connect in design
> IRQ you will have it. If you don't connect it, you don't have it.
> From HW perspective both of them are valid options.

Yes, that's what I thought was happening - this means that it's valid to
not describe an interrupt for the device.  It's not like a primary clock
where the device simply won't function without it being wired up.

> Then the question is if DT binding in Linux are targeting HW capability and
> configurations or describing Linux driver. I was said multiple times that it
> should describe HW not actually what Linux driver implements.

Right, so if the hardware has an optional interrupt then the binding
should too.

--SiPyTjI69BrnJyTx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlwyCsACgkQJNaLcl1U
h9DyUQf+LVD7Gc+SgfXEykBnXJw2If/wRiChKN7PF68eddjGAjq41ajszudHSiHd
eS2tiOFhYAu7cPqFfbAAVS6RC/AWxkFmnW1lrtthmFxBxP/u5BreSU0klfgnJLt6
cLWBclxBiT0gWRIl1FrwtBjqGxpogSvbVaitqj2zxMHKcr+oK8lSAphqCrZeb2wj
g1tdDCP29kqYVhyJQQy/wChqj4qObcw1cgtd+T/9MTjJ9iFJJVo9LlXGyLB1yQKR
4jXb8fkoa7lPmOvCVof8dmucHkZLKQgUFdGCM/qU04U2ToBRF2gjzkLUUJH7dWD0
pXdS9uySGCyR+5tnfPIgoLcf17sf0A==
=srkY
-----END PGP SIGNATURE-----

--SiPyTjI69BrnJyTx--

