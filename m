Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE146C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5OGCFcEpqzuif9wQ2tcu+09Dt7ICSXT7RREEhwMDQ0=; b=4uT8w/EA2Ifevh8NZWXlFBlesv
	KO65xCKeeLqlOfZQkhMONrVvzaI0G1FZLm7003qBnI7rbNOv53ilW8y6s25x7SME51gnHHP81PeUB
	1ntgPYWVslUtLk6NKlaJrnB6CxMsdGU6UB84tsbtsh/afV2nqsHMtF3ZJb4fIhRKguoySVfK1BiZF
	SjOxoVZ1znaiNklP7KXV95SPTz1mxPZpZ5qMITsdErBhKm2aN63xfwZgAPLP8XQUDIgi2n8rhX9pF
	CqWazcHhQocxaylDOfV3JOB+YXTTA8KIcHQf0s+xLvpbLq6Qap2paVBWaTCFV6B9GOw6AyG3wbN+3
	Rn9mOYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MaG-00000009FDb-1FhN;
	Thu, 03 Apr 2025 15:34:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MWs-00000009Ek0-0e7b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 15:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 605E068436;
	Thu,  3 Apr 2025 15:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8BBC4CEE3;
	Thu,  3 Apr 2025 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694253;
	bh=e5OGCFcEpqzuif9wQ2tcu+09Dt7ICSXT7RREEhwMDQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QHniWGy08SM3VzkrCsjO5kDAwmb7zAd17SAv6Szzia9xKmbah9q5IELn2wvRBZZWc
	 c1ifwj8JGA4pV8RMGOUQ+p3SPepp10dBuEuHhP+lvq1w54izU7QhuR2/+Wk7IYKKmA
	 l1on8hmGdGBb2aRhXXyDFmtM2rLRb1Y6SCnsqvPLfSqBerpPBB2CVVyxf9ZW0FkP4s
	 CNrhuhkxYLDBEFms+eEioogMZ20WZUaYfPec+NshjgVWGp69NrCmMogVc9nohkBRLh
	 SrDEN0D52DULSU93RybqKojuLkUdugi4H7jk7IDrSTVSNVau8g6YoJHEclAySyZgx2
	 wn3P5zST5cAlg==
Date: Thu, 3 Apr 2025 16:30:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH 1/3] arm64/feature: add MTE_STORE_ONLY feature
Message-ID: <0a430cca-a473-472b-bb1f-fdf3ed99da47@sirena.org.uk>
References: <20250403142707.26397-1-yeoreum.yun@arm.com>
 <20250403142707.26397-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5U5vDY5w/KdPL0Jc"
Content-Disposition: inline
In-Reply-To: <20250403142707.26397-2-yeoreum.yun@arm.com>
X-Cookie: Logic is the chastity belt of the mind!
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


--5U5vDY5w/KdPL0Jc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 03:27:05PM +0100, Yeoreum Yun wrote:
> add MTE_STORE_ONLY feature and HWCAP.

Please add this to the hwcaps selftest, and to elf_hwcaps.rst.

--5U5vDY5w/KdPL0Jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfuqaQACgkQJNaLcl1U
h9B3kwf+OzHCE0Bl2Rnqj0KGk7Yv4hxlNu6svK81MlbHOecJtzdKFd9Lcu9osYV+
bR8w7wXTxUjMoKLIfl5R2SIQcDuzTuWWQf2kLP0qoeOB4gDMLpBG/GfuJZB/xeyr
1y/JllLinWHdu05f16QsC1s//i+fVrCB3MpoN4X40pcLtwSQrIYn3atD7xztLd2Z
awccwLvmyCx9B8p2Zne3YBpdInixrixwaXBUQRhH3ayCdgRY4dP2y4tjoQnbW3DA
mzmfEV7btEZLOlNU8fqYjDYdufRGMrJr3ffbqpXhFf2EJIYFCrbDkYlAfQxDAhMi
Mro3jXA1TpaSK9ACOE7mUg69RFBqjQ==
=XvZr
-----END PGP SIGNATURE-----

--5U5vDY5w/KdPL0Jc--

