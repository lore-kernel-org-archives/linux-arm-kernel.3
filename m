Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B53E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLacmmQOff+oT4ZIe+wvYVJYKWjSDhRMK864cvAg1II=; b=GZd4oCOLga94yJPV+Fdqy7EPqi
	qLAfppZmPgo+1JI4YUBS8ZxgrbwBB4zJh07olHHfnmMqjjWpSTD71xhloeI+DXArqatWQCPW8U/4b
	eGj4CJ0tfDC4NkyPwimYTuQCUgWUC/3SL79R7mARA4uhJBtlTp8WIIO82ibUqBEx77mXPNvWe7avH
	WSii+Sj7hq6unpJpKL0ZMdmX7pe1tyG/HQXkgSy1nCZ+avLuPfC884M7bcwXwcwpBJLXkT3zMNCEZ
	y816Kt0i/qpve97ck5B9xJmTe4CiPLxMjzCqDZuRBJxpOR7JyID/NqJzJmzxJuwglshABvheEUkgB
	ZPYBHoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP7Q-0000000FMbu-2sI8;
	Wed, 11 Dec 2024 15:59:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOwj-0000000FK9e-1BkH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:48:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 36621A40C07;
	Wed, 11 Dec 2024 15:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC480C4AF09;
	Wed, 11 Dec 2024 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733932096;
	bh=YLacmmQOff+oT4ZIe+wvYVJYKWjSDhRMK864cvAg1II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pfOojM+cAe7XzR10RosCRkC50GMmSbyW0dbLpej6mH2vmg4uwZVX9ZDpNGnPsOL+o
	 XdeuXZ9KznvEy4yZxxn0/wnA6Up6vIxsSiYm7ri9S8RJlYvKP5wQfAAicfBiV7+wHx
	 zXDm6p8yGY3807+VpDrcLF3vN6wsvoS1IO2K75wkIRaknG3jFOQabXBMo3oeJpN5iz
	 flgkpkAfVyLDtvI0UTf9k64Fi9vV0fWBIciyDkZMmR0Z8hfMEW0MK1o1MPP5nGYz4P
	 +MUa56R9TjQrDPb7xU3fsCxT9n4cUt4sB1UoIW15IpH8dqNR14YPuz9IMDrTqS6d4g
	 UdUjjqSZWvoxA==
Date: Wed, 11 Dec 2024 15:48:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 01/46] arm64/sysreg: Update register fields for
 ID_AA64MMFR0_EL1
Message-ID: <409a5ef5-5237-41d9-9cf6-274c010ab2d8@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2I+DX9YYFLWygnpT"
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-2-anshuman.khandual@arm.com>
X-Cookie: Every path has its puddle.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074817_385880_4B458E83 
X-CRM114-Status: UNSURE (   7.80  )
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


--2I+DX9YYFLWygnpT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 11:22:26AM +0530, Anshuman Khandual wrote:
> This updates ID_AA64MMFR0_EL1.FGT and ID_AA64MMFR0_EL1.PARANGE register
> fields as per the definitions based on DDI0601 2024-09.

Reviewed-by: Mark Brown <broonie@kernel.org>

--2I+DX9YYFLWygnpT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdZtDkACgkQJNaLcl1U
h9B72Af/d+gjIUWdLm18k49dviMnY4a321sGjl9OHJTUhuUbdXMekpz9ytDLvG1u
Nc510KWK2itLqRJxSA/At6y9HgJ7UHCbzx6pdiB6I9EPrw1yR/LKSLPz7ErzR6hY
4meDA9QAX/63Qj0HEOyD8iBXmQq3gIjpIRvQyOmTcm934hit2phWeFRLZ4/u9wWr
2wR4BVWVxM+JpV61uV0h7IkU62WPdzhuI7UcCcdnQhvmZxUhzaJ7a8QtQhHiBZ1t
cAzSst4Ngq1wIbkr3cYdlfXtRsNTdb5G2afCOoJUWeK/jhZ9i52ayCtrtgRWuTus
3JX3K7bRXz9ek3InC7zvffHfagA0uQ==
=p2f7
-----END PGP SIGNATURE-----

--2I+DX9YYFLWygnpT--

