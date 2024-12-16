Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26083E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slzMq2uKF9jRRkGUhn2WleIyyRQ8+cdzqcpgL4p7oYI=; b=EU712uLknpXKZcHgZ7W6796MMi
	75MT1biUtqHWR9bm9klkGTGPpMgkCmvqO3wDDGQBy4goGGmuQG5ox68HWSh8fR5kf2MmwQlIKU6SW
	QvGZmOWIYAk0kSGs0LOseBaaWlYZegNhmpth5GOsnOfjTdVzaBOegO5HffHZ4RH6MXlMMH85JRE1r
	F4wwrGNhtJkplVWrJmgSTsenPAAmMyATXf7jbfxHcM02v71RICNSk3GZFuxbK103LypBFv3OGEKpX
	q31s7jCuWVcBRpiZ4OKe5o2OkoSPjnlebV9Y3B4CADZ3iT/ULvKAett7ZMqKrUlMrQYNmiFeeuwKW
	P0OrVWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCvq-0000000AOZp-1Nen;
	Mon, 16 Dec 2024 15:22:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCui-0000000AONu-27Xb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:21:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8F605C60B8;
	Mon, 16 Dec 2024 15:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FC4C4CED0;
	Mon, 16 Dec 2024 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734362499;
	bh=slzMq2uKF9jRRkGUhn2WleIyyRQ8+cdzqcpgL4p7oYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JKa9HMkHgsp+XrMG0sF+EpAXTypgy9rNBBoDLglXsdMOFg29LozcEpM5Dzrwg1ZU6
	 HyZxDYJQS4SrJ8ePxaZYdm+LMFzHiNpCytcS/JzVrvVsKM5rKIjNpAYIEBH3gDVJE0
	 7Lm/N3eWic7K7eUkPQ7NC36/avdT4BC5klsxVZ/XbhUJpM4VwQ8IuVZbwWDzsFgh2D
	 zvwIEVUFyjB7pPh9W5gHXHVAqeRVVeEVvyymw/6eFqVt7sZNjSkJL2+2RyCIDr7348
	 CUKZWWqJEIeI1CvTF05xFrxglP0OIkdvegCWMgZyAn+Qe1K4BnCKheHC+YlTvNaQ+q
	 pXN8IrSJPh+Kg==
Date: Mon, 16 Dec 2024 15:21:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
Message-ID: <4f72a6ec-63e8-4947-9455-fd354d03cadc@sirena.org.uk>
References: <20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org>
 <87a5cysfci.wl-maz@kernel.org>
 <Z2AfOZ82QG_ukWry@J2N7QTR9R3>
 <865xnjsnqo.wl-maz@kernel.org>
 <Z2BCI61c9QWG7mMB@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1CzcJPayw88to6gv"
Content-Disposition: inline
In-Reply-To: <Z2BCI61c9QWG7mMB@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_072140_586863_EEF9E4B7 
X-CRM114-Status: UNSURE (   8.71  )
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


--1CzcJPayw88to6gv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2024 at 03:07:15PM +0000, Mark Rutland wrote:

> Looking again, a revert does look to be the best option.

Since we all seem to agree I'll send a patch doing this.

--1CzcJPayw88to6gv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgRX4ACgkQJNaLcl1U
h9AyKAf+JZiB5GX/WUa5gpdsOOm851W7LTNeG0kD3S0epkj08gyTGU31EDGh51Lh
SK9sTHXqRTB8ao4x1kZsHlXaDQGsfUyChkhyRr6UDshKsujbl0DBbrmPVdTDOPXZ
b4ALBlRN++sWNzKrrk1w2ARRAmxJfwmr4CtVockPd+E+4pMhmK0kGKsEuKNQ+4Dw
J0Hc4pmpcx0RM7kUmqVi4xtcORNJWfViE0bxu600syWj6KpmtedvRiY81vKs7chs
F9DTPHY5vtEjJCxAE/GZHiV7cVi59MpvrexbF0cjps2inWdoXa2C87YYXPxmyXAx
ISPS5WchssIms5WNwe9k5P5LjHyUAw==
=bdtR
-----END PGP SIGNATURE-----

--1CzcJPayw88to6gv--

