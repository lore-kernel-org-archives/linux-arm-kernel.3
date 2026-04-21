Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3488F8FA8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY4ZcYeKT1ZmWpHrs72wtBIW2jKai2+yD2DksELsrlI=; b=vuSa08bw9jEFkeQIDdScNYzDXp
	pru0dGCycYlpO0OGyldYvgYSN8qAcEqBzeN3ySY6yKhTXpnvhKFTOrNewRv6yoI4Poz0ET4DzGDiF
	MeGy4zgzGsSiJ1L8WALFszbBnV12aGroVmIEiIzwKgU4Ha1e1T2Pmz7tLyWYWOc/cRbwWW1hRJ327
	mm91KWaZ/rR4XtcQqDDUpO8Q9U3hXgpUJIFmlsO/JLWFKrSmjgreidHtZl/G+IZq5ZlumXlO/P6mP
	Vkk5XgP2zF8Vw+lWqY5QQt5WCd17/wJjt8olwxwR8m3Q5NpUKQzkfonr38zuN13fpDwG4HzAa42hG
	6CJoDx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCah-00000008o6v-3RLL;
	Tue, 21 Apr 2026 15:00:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCaf-00000008o68-2T64
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADBB043AFF;
	Tue, 21 Apr 2026 15:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CA3C2BCB3;
	Tue, 21 Apr 2026 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776783640;
	bh=BY4ZcYeKT1ZmWpHrs72wtBIW2jKai2+yD2DksELsrlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERt1o4lL3QHb0fVTF8vh9a3mUdbO0p5VO/YRBwmuIRL94sD/tyTyP6aeWj006xAvS
	 +ZJ2z29sOxThUErLS3YqW5ZC7mMN2cYxlUKDe6iRNssdIwKiVucWSIKTHqTChO+wO1
	 6CqYw2cL2JvDiMCUNRoou6+klBt5InVISxO+3wgFXBi2bL1mNZH+AWXj/f/BUyeqBG
	 k6xCiw795YyRG2oP8xekQFwA8SwlxXMXbDVzBny9FwaDUvcUWlodQbIhsIThk5uTLG
	 z9Lu81IAUEbeaG6g4Xh08/OxKCPw0OzvFouIoPqjPaCChTFrkEc1Lq7b8BjDlj2Z2k
	 5Hi/TnF7VsFCg==
Date: Tue, 21 Apr 2026 16:00:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/4] kselftest/arm64: Add POE helpers to
 test_signals_utils.h
Message-ID: <2d02b94d-c52c-45f2-9109-b026ee180364@sirena.org.uk>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
 <20260421144252.1440365-4-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knx1Nj6YYBbldjdt"
Content-Disposition: inline
In-Reply-To: <20260421144252.1440365-4-kevin.brodsky@arm.com>
X-Cookie: Jenkinson's Law:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_080041_648374_81D8CC9F 
X-CRM114-Status: GOOD (  10.83  )
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


--knx1Nj6YYBbldjdt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 03:42:51PM +0100, Kevin Brodsky wrote:

> In preparation to adding further POE signal tests, move
> get_por_el0() to test_signals_utils.h and add set_por_el0().

Subject line should probably also say move if there's a v2 but otherwise

Reviewed-by: Mark Brown <broonie@kernel.org>

--knx1Nj6YYBbldjdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnkRMACgkQJNaLcl1U
h9Azogf/SQqDAwRupQHxGlne5yRQN/rE6ll2wslCxDlxuUPdO+ZLDluxI0/NJnrf
QrfU4Qx17GUnsB0kS7gCpXwmFqYXoQyhBJa9abKmLrD4nw/4snua/MSDiZ9Hut/Q
jucnIBt4D5KAidScivrMfdpH9iUNadvtJj/0KeYSKznpbL6dcUvA5cNMeGFFn9Bd
Po/nmHgB+gXVnX5FVlP/wur0u1Ak5Y9IhV6tAnTEizZdmPTB6CV6dntecXhljOFb
obyaKqIsWAlb28Ts69R2nb+HtHqfJzEHLXelnY9LoShEPrCy7r7Rhy7quVIvu46p
PaeSUZmZdyessufDP6qeTnEaUsSzZA==
=PI4t
-----END PGP SIGNATURE-----

--knx1Nj6YYBbldjdt--

