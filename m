Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE1AC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl2ctMzqtsHvs64zMZzQCyjhddvZ9UjDKGXSZy8CF/c=; b=NjdRNQdjvnI+X1uRwbJ03M2DNM
	uUOnzvztpET6BVsM8rsUG1R7bM2RDpTJtanlZYJ1ZLuPM72sqH9pTE1lgvbGe+Dfd//S5fzM4zryb
	GmVYDh/QGJZikHUKAfLDoldwOfyRgjSMRq7qW2m25U9WsXC6o0xGug9wXI5ADgMPeIYzl6H9r1SYO
	5TTHCuvJupqRPciG1YS//BkS1ryaO4LY1QW54QLsgjyCZSZuvqeVvew87DXVFq++8K6dn8x/TaaFV
	lHpuoCqWBNELFTs+tbab7Joj5DIvUh5nwoFz5oo8GiTTY10pYCP7NY18rgwJoiVzenPCdozyCJj+C
	yusZtZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWuM-0000000EDUg-11ey;
	Wed, 07 May 2025 05:01:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCTIE-0000000DpKc-0kNA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 01:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9F4161165;
	Wed,  7 May 2025 01:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8DBC4CEE4;
	Wed,  7 May 2025 01:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746580187;
	bh=Tl2ctMzqtsHvs64zMZzQCyjhddvZ9UjDKGXSZy8CF/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y02GnXYpoSp+T2mFJLgyxNjK7Lw8/g1BepLcVCuM94yinAzi/oCJ3NM4qaew0mW1f
	 045ktr0eLTxqkOxqz4GwuC/TLM8UtGBkQNvnC+oJDHTkrBDxsKfJ4kOPBRqs6Cps1M
	 9E2MEURG3n4QCb5WBNkNKV5lCG/0I03NbJfGeJKBIblJHwV9YgVGb+pfyIzhzbE+Lt
	 u2oHPCQwAq+XXuBAWYzie9TR0c1ThSPhStCFeQVkM1SCSObLSZwpHb7aFu8pnmvXuY
	 GDkxS5N5LI4hgIroVL0/oZOD4lv9eog7nHaurQr+/95GQsNYKepNAMY34nLy3krHrU
	 Hd1Zu0qmWze8A==
Date: Wed, 7 May 2025 10:09:44 +0900
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	daniel.kiss@arm.com, david.spickett@arm.com, luis.machado@arm.com,
	maz@kernel.org, richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	will@kernel.org, yury.khrustalev@arm.com
Subject: Re: [PATCH 18/20] arm64/fpsimd: ptrace: Mandate SVE payload for
 streaming-mode state
Message-ID: <aBqy2F9SGZR1RTx2@finisterre.sirena.org.uk>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-19-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l1uETfcIQRARAOr4"
Content-Disposition: inline
In-Reply-To: <20250506152523.1107431-19-mark.rutland@arm.com>
X-Cookie: Well begun is half done.
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


--l1uETfcIQRARAOr4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 06, 2025 at 04:25:21PM +0100, Mark Rutland wrote:
> When a task has PSTATE.SM==1, reads of NT_ARM_SSVE are required to
> always present a header with SVE_PT_REGS_SVE, and register data in SVE
> format. Reads of NT_ARM_SSVE must never present register data in FPSIMD
> format. Within the kernel, we always expect streaming SVE data to be
> stored in SVE format.

Reviewed-by: Mark Brown <broonie@kernel.org>

--l1uETfcIQRARAOr4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgastUACgkQJNaLcl1U
h9CA1gf+MtMrQLm9VzwkQrVmrQf1jCqWJgZAu2U44xj6zXKVsASAJ5FRW2TXntut
bV/VVxZUGwlzC2PVl7y1iOu6QHs9glUTeZyApVTuhlD7T0koi7xcz/bHwOQCc+2S
AmVNtIT0fcPF4DgAV5Sf9nLi2Z9ouQIvbuE6XtVAGEGnXNQAYox4LmAavP1Vjbwh
wsGiDLgiWBaQQxm93kDunhI+sFdv47K1y7xMM74mTjJo5RTZiDulcr8+QlAFxUbe
3tNQfSZS+ebUAe3yHS/gjWZfJFx+hMiEhfgtY6gc8kAdutsIojnsCbZ/DD963oq+
86uZj8Sf2TnwVfW0MObBqvRRihSTpw==
=oLu3
-----END PGP SIGNATURE-----

--l1uETfcIQRARAOr4--

