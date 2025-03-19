Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C755EC35FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYRfn1th0UJODk6Q3SDeKN8ucu2Aq+kCO/mYannEF5s=; b=Dt0wL/WEqn58VJ/ituRev08R8t
	5ySJ7FLJS4SkkhbcStBFumiuJvw/563OTwvZcZ/M4lFXWqoQa6LKlc3fbDN4g0kVsx4WqnE6D6epU
	EQNoZ514x6TKdDkzOO/L6ig1Wj6N6LNsYMclKQyFJ2liD34Tu+OO2Nmop0IC52JTmR01dLZ5F8Jao
	aR0kzgq3VmUjP0elU1NdTShfAoFBi++wT/OFkL6974YPP5VtAU9D2E3lNHMXqgwNk9xX65OFV0sFW
	cw2QZZVVZ1h6Q541i3PCXlN8SZ2A+TITQjasmI6cckzysfzX3+zS/sQa55ez0XdVBwLtbsWJkJHcz
	dX9a++5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tutRM-000000095Gm-3o8g;
	Wed, 19 Mar 2025 13:26:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tutPE-000000094mx-11Tm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 13:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C10CE5C5A98;
	Wed, 19 Mar 2025 13:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71F8C4CEE9;
	Wed, 19 Mar 2025 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742390663;
	bh=x7BqLBdqa0Pofxy9h5kGhmOuImsx3iazNrFoBrSorSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dY0uhdBn28SH0CjpOoq/FAsOG2uKdYmM1HX81wMJugzVl73UsBe9PEmGw+EsyY039
	 CGFfZbV2Sri5OVqUc8x6VGNTz+girkqdKFB8KuiIKqV7VfEBO6s/kq/vQHKHZa8d8+
	 yoOeQcejJVgrYDV/l1QUyyZ1leb7PXxORwlGJjrY+8wCtqaMm1JsJywG/pJxQPIj6l
	 E4xmnc7cV3HS9O9QMbTkwAV7CvfgLrpdq9EKy6LNZFQrOfGBtcN9KIkjlBYX4E8tcX
	 +p4zFuluOehct4IwB5f9EAVzj58JvyG5pxOvnIwmXIQpR8AU+K3h2F0WuXBCkyhXsp
	 lkTSPI+tUefEw==
Date: Wed, 19 Mar 2025 13:24:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	yury.khrustalev@arm.com, kristina.martsenko@arm.com,
	liaochang1@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: uaccess: Add additional userspace GCS
 accessors
Message-ID: <50a0920d-3e3d-4e96-b68a-a7a0d78c3695@sirena.org.uk>
References: <20250318204841.373116-1-jeremy.linton@arm.com>
 <20250318204841.373116-4-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lrxbu3I30TVdgrcC"
Content-Disposition: inline
In-Reply-To: <20250318204841.373116-4-jeremy.linton@arm.com>
X-Cookie: Chairman of the Bored.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_062424_324287_473EF0DB 
X-CRM114-Status: GOOD (  13.23  )
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


--Lrxbu3I30TVdgrcC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 18, 2025 at 03:48:37PM -0500, Jeremy Linton wrote:

> +static inline u64 load_user_gcs(unsigned long __user *addr, int *err)
> +{
> +	unsigned long ret;
> +	u64 load;
> +
> +	if (!access_ok((char __user *)addr, sizeof(load))) {
> +		*err = -EFAULT;
> +		return 0;
> +	}
> +
> +	gcsb_dsync();
> +	ret = copy_from_user(&load, addr, sizeof(load));
> +	if (ret != 0)
> +		*err = ret;
> +	return load;
> +}

A GCS load done by the hardware will verify that we are loading from GCS
memory (the accesses are marked as AccessType_GCS in the pseudocode
which is then validated in for example S1CheckPermissions()).  Sadly
there's no equivalent of GCSSTR so we'd need to do the permission check
ourselves to match this behaviour.

--Lrxbu3I30TVdgrcC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfaxX4ACgkQJNaLcl1U
h9B6kAf/aWTyBGHINz3SHkUd7B2qgPUiRdB16ns0/PHI44Me7B9WwzgUi4S60ku3
k9adlWzZXOVABsny7iREC/F24FgqxbT1hBSK/TXZPGJvubnkOahLXD7iXkANnMhh
lbnr++1qFc9tXTMuq3sFmGZA8u+RgavrZ1x7WdTkVQ/PkrY1tIOefK9+ut0RydD5
T7inRjdUC1ee6CorJqprrnC/G/VIi/lgg+DlpkDWW1teV49ASSim7nIhlZ4U+JVQ
Di39GgQj5uQyndh4r7fp1YuRBd5SyhjrWTce/XX06ctkUug6aZndsirvSKdQJQQL
0slQcyJA5dGCPUeUuvDRv2ghKhJ/1g==
=QTs9
-----END PGP SIGNATURE-----

--Lrxbu3I30TVdgrcC--

