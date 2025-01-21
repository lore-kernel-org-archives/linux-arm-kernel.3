Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33DEC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h83ZrXfmZQHa94r0K3tTr99WxDdHtoauNb0mXLSzghY=; b=D36IDs8+4t/tqoUV62M/d97TDc
	N+kBtdoMhtByNbOgvXMtpVELWwztMGIFaSTf593xa6wrYai4NWExOpftPWlex1fWuKk01gHgCMlig
	L4N2T3cN/60mlGdO0H1MXabXUFbWo2jBQPezy4RznsoawxB1OiHuKGjWgcRyvaQ+5yjKyrjDyeKkn
	jH9ySeMtF3qWV/RriS1/nuJNY8tZHXtWOdc1tCL+KUlGUjH3D2fsI2qyDI4yVQLH2+/lvN6e1XPTx
	LSJhsaGL/vyTEpHJG3dI4ZqPqUTOP5LB3GgiV26VgjxNykKZp0YIScoQDdBUi1Hk2wjXtPkbeHczi
	b596bEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taEoc-000000081V6-2gUY;
	Tue, 21 Jan 2025 14:01:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taEnJ-000000081FC-3Bfu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 13:59:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00B98A419BF;
	Tue, 21 Jan 2025 13:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33B8C4CEDF;
	Tue, 21 Jan 2025 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737467992;
	bh=h83ZrXfmZQHa94r0K3tTr99WxDdHtoauNb0mXLSzghY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTbmLs6CV+eOiE/CM2BpgwnWA+yeVqWEW1sZaEWC/AJWTW6lSe3jgJKjbavJ+NGzX
	 90Fe/Xc15dcJ/b/9Ric1dIljzkeR+KeEd41TsxOwFX+YQCxOuROPYTITO8LkgGHBz3
	 aLeKY30qcO0CC4LlwEveMTsmrhanS4TVJ/nk19OfcJHPw+3bdrjYT0z8zvVRuqFi3D
	 c44Ucg3jjaA+ruFBw1dXmC7yNt00fiqzUWtmjdWkTisGbXlWIPCwJmvQo92+Bvb+35
	 5xxX2xPggm9yW1C9EUsvWrDQKuMCnyxv8FaVpt1MZR3zEcktR53nmE6OSfkKNFr4g3
	 oVmhPqsZGkFIw==
Date: Tue, 21 Jan 2025 13:59:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, fweimer@redhat.com, jeremy.linton@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, wilco.dijkstra@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64/sve: Ensure SVE is trapped after guest exit
Message-ID: <662e4584-d8ca-4336-94de-0c0d6c793df0@sirena.org.uk>
References: <20250121100026.3974971-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HxRUYpQcPqd++QH8"
Content-Disposition: inline
In-Reply-To: <20250121100026.3974971-1-mark.rutland@arm.com>
X-Cookie: <Manoj> I *like* the chicken
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_055953_866903_5E7A44BB 
X-CRM114-Status: GOOD (  11.15  )
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


--HxRUYpQcPqd++QH8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2025 at 10:00:26AM +0000, Mark Rutland wrote:
> There is a period of time after returning from a KVM_RUN ioctl where
> userspace may use SVE without trapping, but the kernel can unexpectedly
> discard the live SVE state. Eric Auger has observed this causing QEMU
> crashes where SVE is used by memmove():

Reviewed-by: Mark Brown <broonie@kernel.org>

--HxRUYpQcPqd++QH8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmePqFIACgkQJNaLcl1U
h9BmLwf9FtC83FfPPp02TX7a44DrOhYttGT5PFnE5bQLbvru4wLLjh6LLftDHiy/
sjJJaJfThO6ojrqRr2w+Um0Li9YYJtyi4oVL3cd6qkjpIOFmiTTW1J2KeqMSHhwo
npicPuSGu9kTv71NO9xLsjhBgadcZfy+wJWn6GcbNNX5ND+qIT9BkiPAHOQTAls1
z16OGZiZQgGgDXAPzuV4x8mtjJMsdqrlZKbsc7x+OkPz+fU63VSzeLs5eri5kRlj
qP9nvlDuoZZdve+Fg38LofW0kp0FpjtEGVLhecTucAWAOKYWqMbcZ+znwf7UWUaq
mSyjvmAfk0cIP8PW9rROYu74S09RDA==
=9RjY
-----END PGP SIGNATURE-----

--HxRUYpQcPqd++QH8--

