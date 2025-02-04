Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0EBC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sw8U9kTjkLY6aEnji2ECrHJZ3r/qqqL1tuyXzmBlkqQ=; b=BxPHSQQn+4bRnf8wi1lGN7bt6h
	VeSpwi/LFjOwj362Ffu/1MP7Gq5DEuzWxBCihxvB299zs3YuKNXvRvXNUy+AJjr6M4c4wXaS/l4ss
	h/gBjnZ1QH/qVwIe3+1ddBXn3xam7ZOeCYzPgmo2vq5OAL9ITQCRwbcOZinZElkky33EDKNc7wdYn
	V6cA/v4Bcl6EXV9bY37JKVZUo83asnITJSh69BzYbg0YOKGHJTND1Q3mjGoqaj2IHZKTqsKoNoQbp
	rSBChAfDE8FdlFkCdnupwlzBF+k2FRlJGuL4cSrEr/RLQIbwiSmmnT/k9/mLCpnrDPe4OwOJRct/M
	VZhw7A2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNXh-00000001CQ2-2qQC;
	Tue, 04 Feb 2025 18:21:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNUV-00000001C14-35d4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:17:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0265A42BAC;
	Tue,  4 Feb 2025 18:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D18C4CEDF;
	Tue,  4 Feb 2025 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738693062;
	bh=Sw8U9kTjkLY6aEnji2ECrHJZ3r/qqqL1tuyXzmBlkqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOTiZah/1fWieKswvTMv8qpK6vBxN5vXNT4+ZpHndcpzSXBn2TJ2v0JbMxe8oiRDS
	 3a5/sK48jNgd41BCktAyaG6whT0BmJPe2PKyf6dHBjiB7cpX0wLVRA69dZhp7+s2eo
	 juoWPQGOjr2PKwXivMr/Jxbdmn0P79klUlgHwqBiYSP9QhglT4pQBRARArZ0hP1GNA
	 bCIExgJUaJ/iRlvkY6hcyoWesH1W63R/wBlKo1dNCoUD6mcuFsHN07nU0pTPjQAVch
	 4tT4HTtb6CjhhGTGHZzSKdSFB8fIP5qjbg8vX15IRtKuo/yTC/KJCF2XSgseyfqIht
	 CSRicwMy5muiQ==
Date: Tue, 4 Feb 2025 18:17:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, fweimer@redhat.com, jeremy.linton@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, tabba@google.com, wilco.dijkstra@arm.com,
	will@kernel.org
Subject: Re: [PATCH 7/8] KVM: arm64: Mark some header functions as inline
Message-ID: <ebbb173f-20f5-41ae-888e-3f7e17d95305@sirena.org.uk>
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-8-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b8/wShEAoU0ikRmk"
Content-Disposition: inline
In-Reply-To: <20250204152100.705610-8-mark.rutland@arm.com>
X-Cookie: Spelling is a lossed art.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_101743_837105_B67C10A6 
X-CRM114-Status: UNSURE (   9.86  )
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


--b8/wShEAoU0ikRmk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2025 at 03:20:59PM +0000, Mark Rutland wrote:
> The shared hyp swtich header has a number of static functions which
> might not be used by all files that include the header, and when unused
> they will provoke compiler warnings, e.g.

s/swtich/switch/

Reviewed-by: Mark Brown <broonie@kernel.org>

--b8/wShEAoU0ikRmk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeiWcAACgkQJNaLcl1U
h9ANAgf+Jy3fodyIBVqokO3f/5/eENAYy6sTyjjmuNLlV4r/icm3MyeBCvmrhN+F
szGJ3biAIfeGG/jVM9VnragsR4LZnrMBA+DnMd5zaUoJKlsI5o5ZJekIhLl24g73
cKcjBQxtcFIP1ZttSJqWQhTlLg9BHvFZ+0oL2PiwzwWU/ArW7Igj+ki9BGzT2J7g
+M/TLjM2y7YEn0vO23tzOiKX5WRGiOQPS0cdMBUr83ipvJhAuknBDKIRBPBW4EwL
ZOTo9iaPC0Gf9jl/0W+JLahF12lDL6IpFXn1GIcfxrTF0krA2XINNgQKyU2NpWa2
JmBtijaFZG/+Z1K5KE06RFLXqi66Bw==
=pvgD
-----END PGP SIGNATURE-----

--b8/wShEAoU0ikRmk--

