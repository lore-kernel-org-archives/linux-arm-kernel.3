Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AABCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3zQ3EST5J6Jwoq4e3go3Re87KsFnzCXlaMPneOsi+A=; b=v6We+goFyeG9H10BuwYYSnu+bq
	Btv1ohgJcRcL9TFU1uzjWx+cZz6CkisbrKEkI8FwMD2cBWZ+EKP8gUlrAYwgsT55WthunxjbBxDbT
	5BGEfx61Yly+LSBzbVuU5k6aVYRSNwxnA9m59VI7MqNIbaIyaZEAY0xRRIQlOuj0beg+w+fc6aEA+
	6huIwWvOb0s2lh5EUEAFgPuuxwUUbAbXOEuNORqeTkCSg2TJGvj/+tCBikUHN7HWI1+AAH+PqkfQd
	+2bha9mUekNBnzbJ3OD3DX4CSLZXUdJvfBxIe4QQiHIq/ziJU+N6Wl6qVgFh6PHUGHAz8Vmzgkmgh
	IE5TF+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHig-00000009Mf2-1Ydf;
	Thu, 01 Oct 2026 14:25:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHif-00000009MeM-1XuH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:25:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 653E160A55;
	Thu,  1 Oct 2026 14:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCA01F000FF;
	Thu,  1 Oct 2026 14:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790864708;
	bh=x3zQ3EST5J6Jwoq4e3go3Re87KsFnzCXlaMPneOsi+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fMBR5/LL+PolIe6nLQjT3hXnbDcETLtXOxzf31PRSITSr2MDtxs5VK75f5UhlMXvh
	 UBRsdZ4rd/KHwROIYgT1JIXyn9xAd2sML/sSR78OMGfEHv4cfQX/vcwS723etTc0+o
	 L6OJrLRmXiafpCHiCJBSx9Liv0wgYutzOSPDlHVGJMxA4FGwfE1eIJOl6Rwn0/mmIY
	 TWRBqyoFVK3zEvdz8ODdYko3mu3NYB3nr4GK1+C1LuXayEvYZpjMUTc7zzrNTmQkOk
	 BrjvQQyHvB9eg4796KCC1iRu/Vp6lZHpHTEhQ1mpI1/Tc7kZF1gHSaqsHjkQIJAbS3
	 nxbj5kFJ2rCaQ==
Date: Thu, 1 Oct 2026 15:25:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	stable@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH] arm64/fpsimd: signal: Forbid non-streaming SVE payload
 on SME-only systems
Message-ID: <51351e42-60d1-417d-b61b-6011bfe5d2b5@sirena.org.uk>
References: <20261001130836.1410888-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tjgr7GheXTi+teXB"
Content-Disposition: inline
In-Reply-To: <20261001130836.1410888-1-mark.rutland@arm.com>
X-Cookie: Do not stamp.
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


--tjgr7GheXTi+teXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2026 at 02:08:36PM +0100, Mark Rutland wrote:

> Regardless of this patch, the kselftests themselves are broken for
> SME-only configurations. The signal tests have been broken for at least
> 3 years (since the kernel started creating SVE contexts on SME-only
> systems), so evidently such configurations are not being tested. I have
> some local fixes for the kselftests that I will send out soon.

I do have some coverage set up but it's set up in such a way that it'll
only notice new failures so things that have never worked won't be
visible.

> @@ -443,19 +444,33 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)

>  	} else {
>  		/*
> -		 * A SME only system use SVE for streaming mode so can
> -		 * have a SVE formatted context with a zero VL and no
> -		 * payload data.
> +		 * Non-streaming SVE state may be preserved without an SVE
> +		 * payload, in which case all state is saved in the FPSIMD
> +		 * context.
> +		 *
> +		 * On SME-only systems, non-streaming (FPSIMD-only) state is
> +		 * always preserved without an SVE payload, and with VL==0. On
> +		 * such systems, only accept non-streaming state without an SVE
> +		 * payload.
>  		 */
> -		if (!system_supports_sve() && !system_supports_sme())
> +		if (!system_supports_sve() && !fpsimd_only)
>  			return -EINVAL;

This means that this function will now accept a FPSIMD only SVE context
on systems with neither SVE nor SME, but that check was redundant since
we already reject anything with SVE magic in parse_user_sigframe() on
such systems and should never get here anyway.

Reviewed-by: Mark Brown <broonie@kernel.org>

--tjgr7GheXTi+teXB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+bT8ACgkQJNaLcl1U
h9A8Dgf/bpQ6h/269Fw6oWtU7lRmSPaWBeB9mziw3EfHbp+Mmnk+V/Z0Y5+ls/nz
C4v9qTOP/oklHyg+W3PrwDBoYjxj73wcViCsUgP9xW5VZDKs6K57wi+15mnVgDOX
sGuX7PXTstguS0u9oF+l4PWK2CmajpHgFTx2CeYrsp0kQHppNDwe35bW/i30Oinv
gc1dNeNKELqVgi+By/Dw2ZXIPb2hWRvhWoJ3u0/ZqiXJcho6+zHzPY2yLC4rUBIb
uOf82LB9LLQ2KBvJLBe26ZuXnzU6r1+FZoj1061ZXLUgF+f8mPZbQkQW75PujF3N
pTxxIz3pHiuEAn+h928xct0qaweg1g==
=0L+C
-----END PGP SIGNATURE-----

--tjgr7GheXTi+teXB--

