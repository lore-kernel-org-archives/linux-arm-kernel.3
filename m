Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45876E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6zUya9s+jpslx9GY5F9E0ZO6Cz3S1RvPAQFQrp7068=; b=OeFz0xLb2p5bciqDFATQXmqlBh
	5OApKCSmFPr0haAte4VU2xmw9PXa3jzGY/zQMHNI2y3YCXzWhFz8S/gAmAVtt5Nb/7dkD5VJ4S1dl
	S0ncjfHCOgUBoKe77vEVTMR3pDVYAeJhAR4farPKfVA2Knb64BgYll86EtkGJsKacKGWjH6lkyVMb
	137XQgXaEwiIFai9WsX02ShGKkfjBhdGJ1dQUo/kHmko8odCIjsFqZiYChdmJEwXbryV2Okf+woaG
	Yfr8PJK1gPbQa8gu+slf6QQvM7PLF7jG3RU5ptf+/oRSLrYr1pr72NhCs5yXYLpseLAWe3adAqOiO
	D3zIo3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCk6-0000000AMUc-1BeA;
	Mon, 16 Dec 2024 15:10:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCiT-0000000AM8V-1I0H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:09:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C367CA403AC;
	Mon, 16 Dec 2024 15:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174E1C4CED0;
	Mon, 16 Dec 2024 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734361740;
	bh=X6zUya9s+jpslx9GY5F9E0ZO6Cz3S1RvPAQFQrp7068=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NfS4F8tVEJm5MYu2FxSi/SCFs1BhbsRJGqendjItcvBSuUUR9j0i72eVtQ/0zmx3M
	 TANcgSOTpmJy4LyMuxAKwauxmFdr6dYCGcxT9mZYEjcmDBQcM5B9leso7OrM6CV/di
	 YKHvyP8yyUU/F34M3rbuKorepSVIsfRm0gC3mVyyk2AhW8Tm1iSzkM2BC/B4rIRQkN
	 O45Yh59D0AjBJC0AdUjLQir7W8QsDmGxO4NB+7qpNRrNEx1oSSHtjpUKEVpsAJOcid
	 lerPCJUg1WI+hHHBODG7N3wxVTFOWDt1z8DcaQzVa87lH476sKXDtgD7UXIcoNNstL
	 t5aBYzIeEWRlA==
Date: Mon, 16 Dec 2024 15:08:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 03/46] arm64/sysreg: Update register fields for
 ID_AA64PFR0_EL1
Message-ID: <b5d96df1-3c02-40a7-833b-6a42183ec972@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-4-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8v5qYuuiozRiGBYl"
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-4-anshuman.khandual@arm.com>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_070901_404376_6009926A 
X-CRM114-Status: UNSURE (   7.61  )
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


--8v5qYuuiozRiGBYl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 11:22:28AM +0530, Anshuman Khandual wrote:
> This updates ID_AA64PFR0_EL1.RAS and ID_AA64PFR0_EL1.RME register fields as
> per the definitions based on DDI0601 2024-09.

Reviewed-by: Mark Brown <broonie@kernel.org>

--8v5qYuuiozRiGBYl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgQoYACgkQJNaLcl1U
h9DaIQf/XyfoZhpxuUw+kmbgwoAn0Y0Y7YbIWmIoN7+40pdMnDJLoBqtPp8wkjxe
ZxPYVrTbIfJNQqSj+sKpLAi0VWREbvEZgCP9tbTT5kNHJVF9naZ1PrBUsUgrHA5M
vSn0GblRNv5Xu+m0yZc2Pvjup0m5BkF/Oz2EdNbUA+yfWKgPZNEmkR9ZmcJh/eB0
QPmm4qgs8Khabo1QmeBOXegB6uAwp72aC0OBxngrk4ozRcWOw9aU6xWoKwHPIvwL
GVPo0ybKZnJ3sy/Jz1tCwLJnrm3sBGzU0f+CyfJuOdca9LnutLA2X7p0RQJ32PQY
EOlghR1VJAgePl1/tagqqf6JvR25xQ==
=2hzw
-----END PGP SIGNATURE-----

--8v5qYuuiozRiGBYl--

