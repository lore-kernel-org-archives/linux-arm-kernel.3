Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B84D58D5F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jb/Nq2waVTH1amIlog0YhIHHgr3jAVLm6cbL0GKgILo=; b=2z7IPWKv8SfsfVPKoWTvUvpo+w
	Hjo3DXJXs9Y1hYsb0px/GvEkCZpNFormb177DtACI3FiDRG+9bX+qVos18++WZ76n9663hZiMB57d
	2TtKIFQR2AvzLNr6B582svSD7cLvxdhsod82X6prEaSUaZBhRWxfxR9HfR1bQKWjndiHrIT0L7qAR
	pkc5xg3HI5elEPz/Tqcuuh49bE8JRn+Xa8YECU4+VSiRVEgxXBSgZqmWTNLI4G+jgwiXGkSsXWm9E
	qzEzgJDCKM6tz0FzA+hRZnrQTP9mDhIAM10egn666d2yHUrpWggVJqnq0cKdJlbiNDtf/7Qbzha4/
	KSpz+DhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbLS-00000008Yl1-2fSR;
	Mon, 25 Nov 2024 15:49:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbKV-00000008YfJ-1zhZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:48:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 89573A41826;
	Mon, 25 Nov 2024 15:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F35AC4CECE;
	Mon, 25 Nov 2024 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732549730;
	bh=Jb/Nq2waVTH1amIlog0YhIHHgr3jAVLm6cbL0GKgILo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHgeyn6yO0S1PnqKQRn16ps0yWms0cpUjYN40YLAltVL66O1BhyMVRH/Z+Xeaz1D6
	 QrfSFpFUE2jVsCZrCbCrF92geoGZsj8300zP7uCrT2rx4JY7QFddTvQb/VAHUYO7cA
	 0iwKBJFxyoyau2gHgm2eYSFx3LnqCWDgX2iExLw+3Upt0diTG0C0VfZ5WKg5iCSw6C
	 SuaxL6I/dyoZuZe8zFBn1gFdLdv+K7jRszuq8JMKJov+ABtX5U+zdORh8Rm8Ra/ZDQ
	 nl6V8Nn9j/CdzIMgg3msaCGSQGJlcmSkJ6gh9zg00Mz8aTImwMvAMjRjk3fj5p1Wkl
	 cteX+Ng594+AA==
Date: Mon, 25 Nov 2024 15:48:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com,
	guohanjun@huawei.com, gshan@redhat.com, prarit@redhat.com,
	Jonathan.Cameron@huawei.com, dwmw@amazon.co.uk, ardb@kernel.org,
	hagarhem@amazon.com, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH 1/2] arm64/acpi: panic when failed to init acpi table
 with acpi=force option
Message-ID: <4c8e92ac-1e16-4d0f-8710-96a167d75d97@sirena.org.uk>
References: <20241125145848.506347-1-yeoreum.yun@arm.com>
 <20241125145848.506347-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nrxKW/jgHeBrIHYk"
Content-Disposition: inline
In-Reply-To: <20241125145848.506347-2-yeoreum.yun@arm.com>
X-Cookie: This bag is recyclable.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_074851_581703_5F7D69BD 
X-CRM114-Status: GOOD (  13.10  )
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


--nrxKW/jgHeBrIHYk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 25, 2024 at 02:58:47PM +0000, Yeoreum Yun wrote:

> when the acpi=force option is used,
> the system does not fall back to the device tree (DT).
> If it fails to initialize the ACPI table, it cannot proceed further.
> In such cases, the system should invoke panic() to avoid contradicting
> the user's explicit intent, as failing or
> proceeding with unintended behavior would violate their wishes.

This makes sense to me:

Reviewed-by: Mark Brown <broonie@kernel.org>

--nrxKW/jgHeBrIHYk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdEnFsACgkQJNaLcl1U
h9BoiQf9E4P/46IN4hopKj75eay7kahmNncSYrOyfwgfTPR/lXVrTdqs3+yA0AQM
NXmioMTbFo07sWI6RLLZP32VPcTGS/Q7pJS6KThRhsOgqKc9FOfU6DDTcSDmceXq
mhbIz3MDvFuzXJc56oBcpEtD6ZkpZIfihSsdrXDXS8G/GTW6dnoglQoaFEoJuPY6
Hn78P46ynaz0Q8C10qldRrcfBi/EcfiLNmAhn7KX4ZwBdyLLX5Mw8y5LwpITtTHb
Q3ISd1I0ltakdhUZ44AHH3h7kPXZIMkCK7rPnuWLzJKC85YTcqNDrIpo/nTcJzX9
hu9gHBBtLO0iRyYYLjZnCrlsEnSAoQ==
=N3Jw
-----END PGP SIGNATURE-----

--nrxKW/jgHeBrIHYk--

