Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFD7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNdS8C7T+jc6Z+1WXA06O4uZglTbKaiGuklo+JyL5uE=; b=sY3euhpQLiCzHw/k9E6UCFB+lr
	CxZLTYBa2YmuHc7/EosVTEwiCQbjrN2JEGGq+Mckby1nlj0MSaIrVXOlaHAGJ7GNjz5deEfRyB6Ec
	rdx0+NXl65CQc90+1M3sLuDEBEdRG71LzAxHf8OTaaNtFZbUg+qsNa8Al/bzdmBORP3xK+KLjCt14
	OA9srtAcplOxvvhOWKYehOEpmL22Iayv21HYlb89MvIsZCWDup8QmP2mMi00bEjdK3qtvJf4woLOg
	BL+0/+DUTI2j0Fsvobu0wHJTonRtjIdPA3ywCx+LauVfci9yabR1a8laIM1JYztL0knKLOAOPc1+J
	lqwVwBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZeJ-0000000DzHE-33Ec;
	Tue, 17 Dec 2024 15:38:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZYP-0000000Dy5k-1D30
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:32:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 578C1A41A03;
	Tue, 17 Dec 2024 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44013C4CED3;
	Tue, 17 Dec 2024 15:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734449527;
	bh=VNdS8C7T+jc6Z+1WXA06O4uZglTbKaiGuklo+JyL5uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTFUHCE00yur8UAgdzHnNcwi/0X9XdKxFt0CHqCDLlGsCUng1eFvyOunlxGAlCQ+A
	 NqA7RB5N7CnRA7Xu/QQk/PnexrM+HWhdogWRI1lJw5bW/qZ82Dsu1FTjbLCwRb7ywx
	 3iQWpCHD6vBoXcrL4gfLmQ3+lhmtlvlx8x6MNTBDTy3OEiumGsN48mrLL4PhhTgk+9
	 mrKZNK0bGKGn+nBN0EYqOwHkVF8iZ3HmtckIijEee3rkL7LdbCcHyGvLdjsJa9+bRd
	 l7PkxUXwHK7NQDg59GlClsKFcHjpzs3TlHJn8rGowBvq3ZhoxSLfIr+St0qwtvEBD+
	 /AX+ZifMZoC5A==
Date: Tue, 17 Dec 2024 15:32:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, ryan.roberts@arm.com,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 18/46] arm64/sysreg: Add register fields for PMUACR_EL1
Message-ID: <88f15900-03d2-49f0-bc44-7ded076d9a42@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-19-anshuman.khandual@arm.com>
 <20241216231505.GA601635-robh@kernel.org>
 <0b8a055f-eab9-4b44-baac-ad25756dbbfd@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yu3fCeulO66Lix3+"
Content-Disposition: inline
In-Reply-To: <0b8a055f-eab9-4b44-baac-ad25756dbbfd@arm.com>
X-Cookie: The sum of the Universe is zero.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_073209_398443_0E63AA43 
X-CRM114-Status: UNSURE (   8.21  )
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


--Yu3fCeulO66Lix3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2024 at 10:03:10AM +0530, Anshuman Khandual wrote:

> I am wondering how this did not cause any re-definition warning ?

If the redefinition is identical to the one that was already there then
the compiler will usually not warn.

--Yu3fCeulO66Lix3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdhmXEACgkQJNaLcl1U
h9A0MAf/QvtVkjC9zldXDgdlYsDu0STRvGbwDmC7CqmD860xMuOC+z7Gm0jDpIpV
Zg9WpeVaK51NOo7hzNkN3v00mH2sIZI5+S5h+uPERrS7nxOQO1PhQNBlERxzM93m
5umg9GSVRm++4ginwxk6BrD70VeNTXXGSMoeVpG/JodFCd1E5vqm+pK2sVM+40HG
+W0vMnWTDgot0LTwo2382Zq/9Rc+O9zYdgAe0qmB6ZDB0Dw3fZVdD9mHmBGk0TVr
0X5xc1/NBR4KaP/dRO2sDI4REicFM9gqT5CB/79gNnp0Hm2nXK9B+gIA2DLCR95J
eGIKCA31D2t52hR1hdN0ghEa7ckxYg==
=nc2H
-----END PGP SIGNATURE-----

--Yu3fCeulO66Lix3+--

