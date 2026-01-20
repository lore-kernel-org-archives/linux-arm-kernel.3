Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D394CA5FA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ks3sfk0TExIgxTb/VNtaV199SksPVbGzSefz7h8jAs=; b=2am0xwF7u6J+XSFiW0Xqrhh3ZW
	MXO6aJ9/upmohPjGBA7Eh+iLZ+M97fpE8ibiFjrbRrHxolpq8wiPvYHVom2SKh6oEncgkDWujy8T2
	ngMEO6OkvLVA6sO3Z1M387uPiwBCmzTyy1oJwdPAVL59ZwgWoU2joosS2hBa1VU5DT4JeW1lOO2ch
	QekdDjRPdJo1AFHz1vkxYLTHDzz58wreTr/LPvrnZgMX7KfU2yAduD5oyKG41xLptcAWJ2Lq1pFWJ
	WQdALAFCuibc+rNSb+1H15bXZip7Q3AjC550i0DXp8yRWcE0mUHeE7DReCH4DjhvCBJaGNiCCsuHN
	NIcImwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEOd-000000048vn-1OyO;
	Tue, 20 Jan 2026 16:15:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEOb-000000048vd-2pi7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:15:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A90F860008;
	Tue, 20 Jan 2026 16:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CACC19422;
	Tue, 20 Jan 2026 16:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925726;
	bh=6Ks3sfk0TExIgxTb/VNtaV199SksPVbGzSefz7h8jAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oBobrGGq5yHyqJsvT4Raxr9MQl/s8Pr9m9AyaCDQCy1/sBGlYZIITpNO+siv9+T7I
	 BiVglFjaJkWHZ/JJ/5yG2jT5BiRD1nMq4czPGV1W6UUgT59cpL38ikR9oC4sjxRFoe
	 yIkUtl+L5nxgb2m8/oMuFGjVCjZFJQc2HPRoAmf8wlpADpJYKVL0mvo2m7rModsl7O
	 cW0qwcpfgiourOzbxHeVTFfOP4uBQVVMZ+kr0GK3D1uWk+HDOfYxpOpF1zw6DySeqQ
	 8HC3N0yDdOaNSJtO5yRBw7X7KRQ8DjTUgePohpWcAh4yysnErkmbjQiRS12TsejAqp
	 BSBDeRU8pURkQ==
Date: Tue, 20 Jan 2026 16:15:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com,
	will@kernel.org
Subject: Re: [PATCH 3/3] arm64/fpsimd: signal: Fix restoration of SVE context
Message-ID: <7cf4b4d4-f03d-4207-9b54-da8c044460f6@sirena.org.uk>
References: <20260120145107.1278972-1-mark.rutland@arm.com>
 <20260120145107.1278972-4-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m6/rz0mDjyMNtBoc"
Content-Disposition: inline
In-Reply-To: <20260120145107.1278972-4-mark.rutland@arm.com>
X-Cookie: Slippery when wet.
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


--m6/rz0mDjyMNtBoc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 02:51:07PM +0000, Mark Rutland wrote:

> For consistency, I've pulled the manipulation of SVCR, TIF_SVE, TIF_SME,
> and fp_type earlier, immediately after the allocation of
> sve_state/sme_state, before the restore of the actual register state.
> This makes it easier to ensure that these are always modified
> consistently, even if a fault is taken while reading the register data
> from the signal context. I do not expect any software to depend on the
> exact state restored when a fault is taken while reading the context.

It'd be astonishing if that were an issue:

Reviewed-by: Mark Brown <broonie@kernel.org>

--m6/rz0mDjyMNtBoc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvqhkACgkQJNaLcl1U
h9Bumgf/X1TkrYftLWrD9NS1NPK780LN626ExiR0LsWtSQLvhqmRm5T3a0gGb6Fj
58k8Bm/XlaM98l10E+dmqOLmQVtvxRuBE1Eti7pDNgqX0dBSfEgCGw2Wz+xotRT+
bkmIQSxOwmxG63njuyacjAfuzNd8GvNPZrveaHA2fsetA+piwbexfbzjDc1qoV/m
mM8/FIk6/wTH2IYnTN6zXddUZyLi2XXswdmLpIc1uBcvQK/3RlNHB8EDaHo1UsLe
FAgakklieTpFcVgKUwKIXhkP++rr+xi+CMl0JiYhj3BrnHmywBN3Kg0fyOM7HVVK
8pcKgeddFmod00tkx5LdQuK9F2mNlA==
=9uy5
-----END PGP SIGNATURE-----

--m6/rz0mDjyMNtBoc--

