Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C650AC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nopQg6glBYBF33hbfwau4+1pYX3nxBZHENZSs6upCnw=; b=FgAFd80EURM3GmnaktDOgfwpZv
	CTsA0ePrj7Iu8+bNyjsDj8CiBFwYXKqQYKJK6JSbj6Ou4upu73X23ReSxRNez1arTzlQTgunfOV6x
	pnaUdV/wY/LifR6bm2NABPXr/NZbnk31Oy0MGkQf2hHvrM9lYhsAXimt44J12QjRRZ4lVPzY0Hc6U
	vU87sfuGfA76eVMIebGGUItsYl7bQGgUvIwxR+Ryrh1K7s9e6ByqZzAMgcrxX3CbgYef7YnJj7zSG
	TbS+hnXqBBa+5hRSmJbeaJ/B5Sr5GNVDUV/5Hp/ObOs56oU0D+Eplel4ARUf1eB6PAqL+pwgrNNq/
	8brucf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thq8L-00000003vB1-3uQO;
	Tue, 11 Feb 2025 13:17:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpqA-00000003rLn-3VjS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 12:58:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B97075C1095;
	Tue, 11 Feb 2025 12:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E10C4CEDD;
	Tue, 11 Feb 2025 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739278694;
	bh=+towMT1nCuVs7DFgHgZTIfGgiiKqozkce+4klGi0s9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMUZ3WZj6egUmoREWZ/i5BecZ/SF//YWj68XqzGu1zV+XnFL5IV5tfvKBJR2h8fIG
	 kleJ/Oddvmj1TDVbAFCb/eUl7+QgprOX2NQsNDecwBHjUTJL7QG1LynoofzU4fWRcl
	 rhaqVrGBzAy3BA2tzGYOkabptSUcxl7qneA7RCbIwYZhyS47ZVh9ER25wHEZeB2gu3
	 mgnyKlv9XPn3btcLrlGNuy9ivTzXc5i+rrNqI4g4UJ22Cpuvtk7u3EA1OUWO26+Eg2
	 mxK9OT+OJxs0c3UKdgrfGSGahhZOIqFdTEOO8RHMG5f34YkBYGxxIr/IgmVFlTYFVD
	 ZlffazOPxk9Sw==
Date: Tue, 11 Feb 2025 12:58:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <bec2a37a-1797-41d2-a44a-a34a54a96f89@sirena.org.uk>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
 <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
 <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
 <Z6s2iMP1LbdsYX12@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rD0p0luEF5BMl3yP"
Content-Disposition: inline
In-Reply-To: <Z6s2iMP1LbdsYX12@J2N7QTR9R3>
X-Cookie: Printed on recycled paper.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_045814_916662_FBCD8CA9 
X-CRM114-Status: GOOD (  12.92  )
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


--rD0p0luEF5BMl3yP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 11, 2025 at 11:37:44AM +0000, Mark Rutland wrote:
> On Mon, Feb 10, 2025 at 07:14:58PM +0000, Mark Brown wrote:
> > On Mon, Feb 10, 2025 at 06:41:09PM +0000, Mark Rutland wrote:

> > > Looking again, it looks like KERNEL_HWCAP_FPRCVT also isn't wired up?

> > Indeed.  I'll add that separately.

> Given that KERNEL_HWCAP_FPRCVT was also added by commit 819935464cb2,
> I assume you mean you'll send a v2 of this patch doing that.

Well, I was actually intending to send a separate patch given that
otherwise it ends up looking like two different changelogs in the same
patch and the diffs shouldn't overlap.

--rD0p0luEF5BMl3yP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmerSWEACgkQJNaLcl1U
h9BKtwf/XoPWbuG6MzQSQ1e31PolrljHwu4itDeKvhdyeP8GcDCDRi33tSf+K2ja
KauZo++0ZKaq1Ja+MFAToO/len+b3BgCOzm0rCuiFhhtTV0ClkFun8hZ1B0FbHbC
53X8vn00Agvf7SEmOPtsmTM/FJTOMn421x9FYgM7xunf1YKj9wGnt/V7/VrBZTAm
LEPUDKO6uPEQk4xl4m3LRBMHrqignAXy4ScZ9YgaIyT84cks0zI+m4UcLtIpnHsC
wZ2o6Zfx0wu/DMUvESijSvUjiLeIhbk5YINhitBmKUYHV9ECgkBOonZ5XDmrrZmc
c+8oJAemdZYCU0ngIvowVZ/ecC9EVg==
=/UnQ
-----END PGP SIGNATURE-----

--rD0p0luEF5BMl3yP--

