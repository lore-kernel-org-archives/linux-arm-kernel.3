Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C7CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niuP99foet4I342cbmg1ad+24zmVWlrRXskx/PKgMeA=; b=rdkdf8BEBUipxEdYEhCBg8kYvo
	0Oyt/LbXHN3YX2Um/DKr+XHJ2TMplnFBXabLlbjDakgobdk04x5Qq2/uc67Fs2hO0glSJxhBFwqiI
	Mbb3CLhk1wqDCavO16Jge5w2IOdeJQa3ha2bQ9Cud4z6OyHZDj3RHWIfhiqM4oFxIRGHXc9dhsqQC
	HGQKiTh9Plt7dBBLSuAffXWnEXUhTT6q1mMWb306ZKpj0fbULH+epex8SYk4GtGm7UouTxRKwhHBa
	Qo5jBy7HgsdaCy6X5kaUJ0qnaoCe/R0OCQ5E3bhDs+nuzNw2DJXapRp9wrdQJwJtU5cchqldCmQKe
	IqvT/34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCuc-0000000AOLN-1E2p;
	Mon, 16 Dec 2024 15:21:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCtW-0000000AO5Q-08SK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:20:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D1755C271D;
	Mon, 16 Dec 2024 15:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD1CC4CED0;
	Mon, 16 Dec 2024 15:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734362425;
	bh=niuP99foet4I342cbmg1ad+24zmVWlrRXskx/PKgMeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZ6by4yZy5p8vmJWprcWcSzejs0HD301qf7H6WGL/P6uFexO/i9/4THiOROKKjpTp
	 p3lnXZsO3Ls16sah2Fl6o7xN+KkkINT5geZugNL2AyxnQXoGRA3f1PYnqdw3nEuUBH
	 A4xbs63Q6+6yfgaTtYomCnJ+Z0lEmm4Ylnlrjw6T5o3HkJWcOvk8u+3fVkmQSiTMpw
	 sHgOFR4GQdICKtqjuAuasMCZvCT+a6wjiuccd9G+hR9T2pIro+v8Ik7Kwd88rGsIgL
	 rb9WtkeQJBDgFk5SjIpmu86iRrWrFzyJaZp7FcjmvK/HhV1bDdAlLNJ2EWb/s8KNnM
	 /5ARr9FnqUtXg==
Date: Mon, 16 Dec 2024 15:20:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 08/46] arm64/sysreg: Add register fields for
 HFGRTR2_EL2
Message-ID: <4830a422-9acc-4d2e-86e7-7e75af340dea@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-9-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gbV1zyZYu1Z/82Fp"
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-9-anshuman.khandual@arm.com>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_072026_109410_55729250 
X-CRM114-Status: UNSURE (   7.78  )
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


--gbV1zyZYu1Z/82Fp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 11:22:33AM +0530, Anshuman Khandual wrote:
> This adds register fields for HFGRTR2_EL2 as per the definitions based
> on DDI0601 2024-09.

Reviewed-by: Mark Brown <broonie@kernel.org>

--gbV1zyZYu1Z/82Fp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgRTMACgkQJNaLcl1U
h9Cr+Af/be1pfnGEb8Mpa6M3rCI0zQapxUu/nCyhxYEhFwSgpJKVWvmG8wKwfN5r
ecIGCKLibBIafWvty9jw5oEbM+FYxc5Joqop8XlJ0MxphUH1wiu8Qgui1hcvDzCI
p3src1DgDTlRMnrWCaukPFpVXz6Cp99JpV1OzbfrLFcqLemdEaeuUB7bt8qWFktY
kE8BC3XoDUq5GzU17ZmfEIEBlNmzY27YBUA+5tx9RF58jC4WJ4Sluznfm9kGQlgc
SrwdZ/TmsVm+qSbY9yNl/Y5eeLG3J9dNr8+zEJtzUU0GbBG5jVf4KkjpyFkLOLjx
ih6XgEVmGbb+L2n2jishqNTXwKJ+ow==
=9/v5
-----END PGP SIGNATURE-----

--gbV1zyZYu1Z/82Fp--

