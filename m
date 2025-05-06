Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A746C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnsMB6oXDTL83dZ5GGXgMLoaKxr/HvwUPrxb2FLg/nk=; b=oAUWyNm7k9mt75GlpDzq/CcexV
	AeQ8mryYXcQQ0NzV+r1D1USc0Phnj4Cn+KegGejpuvOrIt71rWNjE/HpejEYP6I18xquOvXsoN8Aw
	1J362/QOMA6gAEDU6VrbetPUSsyqhohWsPQP5Rnvtcb/CEkOlmhZ2+oRthlStj3zv4Wi6bMt6uWi/
	p4UVrsjhsFffBdFHAi8WBKXUjXPUDkuSRh2/UXnSGwTG6yVG21WCP5Ko7Rwj65iGY220WmuMR223q
	xxLQCru5eT0fXoR+Exn7L0xYmPakM4WTVxCDT16W1xzA2wVWmSXD/pRqo1nsev1kotc9fmZHnrPU7
	Wx040YAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMKq-0000000CsvT-1Hlp;
	Tue, 06 May 2025 17:44:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIXQ-0000000CAcQ-17Pp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 461AE5C4B7E;
	Tue,  6 May 2025 13:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FCAC4CEE4;
	Tue,  6 May 2025 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746538847;
	bh=TnsMB6oXDTL83dZ5GGXgMLoaKxr/HvwUPrxb2FLg/nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CA/BBRABGSCouOyN2s3DHXWxIxY8k8K6lcCeP/Bp6YFHEubJsj4q+Ki9edUoAXCWZ
	 zr1IX+FZJgWOfUse3y1JyM5uCIRKbEB8FMrpZd3qX/WEyfo9aYc2fA0QpPom8A2/hX
	 Hjdhjx7Z1lrRpTvQXnokDcwF1QxPyMCNBF8Y1jd4OV5u1i6o/CHZDyJuX7Hoe2i6Vl
	 f25johlq2LtiUN49ATle/TkFnWqP0PtEgxE7lDsBlqf/6//yxZHX9LHcG+StQonmjh
	 H9WvZDxG7uIY2cU+51vrXsqkbGDhMkaQSxMoEndxI1wGaAkaf/r2X+rcYb/JPP5OJG
	 PjeRWevC2sVYQ==
Date: Tue, 6 May 2025 22:40:41 +0900
From: Mark Brown <broonie@kernel.org>
To: Florent Revest <revest@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, thiago.bauermann@linaro.org,
	jackmanb@google.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/4] mm: fix VM_UFFD_MINOR == VM_SHADOW_STACK on
 USERFAULTFD=y && ARM64_GCS=y
Message-ID: <aBoRWZr3oGh94_qr@finisterre.sirena.org.uk>
References: <20250506095224.176085-1-revest@chromium.org>
 <20250506095224.176085-2-revest@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x2jWddA5IH0klT0O"
Content-Disposition: inline
In-Reply-To: <20250506095224.176085-2-revest@chromium.org>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_064048_350931_6DFF0A68 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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


--x2jWddA5IH0klT0O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 06, 2025 at 11:52:21AM +0200, Florent Revest wrote:
> On configs with CONFIG_ARM64_GCS=y, VM_SHADOW_STACK is bit 38.
> On configs with CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y (selected by
> CONFIG_ARM64 when CONFIG_USERFAULTFD=y), VM_UFFD_MINOR is _also_ bit 38.

Reviewed-by: Mark Brown <broonie@kernel.org>

--x2jWddA5IH0klT0O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgaEVkACgkQJNaLcl1U
h9DNhQf+Od2vOQsm8ZSTF5BxQFaQvck4UfZc2SRgJP4yUv++XNZmdwyXQ3L5+JiS
EQiK3uPOGueSO5nt3GBaP4Jmh6Ii1a2kLENKY5dpGf1Gp7cwvyJbVD6wSeoBX3Q8
rHZvWoaDzvHS6xsmGpLfNKN6CcS9w8HR4t0g4em1pDeJCyo0CgF46fZE3ljtarcU
VPrWEPGWqeccT5PfP5EexnEhR5ChJXLS9Gx8q36mIJivayq3mbwkvCTnPOKnNXxy
l04gz3JAWDhZ9hvw+64iVK/FtcO7c4BGKfDyij1RZ8W15RJpRwHcy9aCNcQ0oRqd
UyYKkkjph35w5vBvN4Cg49RoFXNGnA==
=f8rh
-----END PGP SIGNATURE-----

--x2jWddA5IH0klT0O--

