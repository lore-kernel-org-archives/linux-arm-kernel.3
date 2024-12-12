Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04079E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfioxShGA4kLgums7mRtR80+gwaH7hUQSCU8aXjp8og=; b=0tulbjVrFJcMlLFS2RggpIbuWy
	mct0WBPHIu/ESyOnEip/BcVTZpeP2PLpGctOq5JP1XZcpyBNgTVMppe6FfI0SJtpwCrZjuP0VBzWc
	z7j/43nQWzixuMrTtDhwjdy/wK21OfY2TClyb+wnLFzrxV749ln9qEn2xtWYkX6AhL8aAlJ63FZkk
	HQ+Di/f9mVK1tMH2K4E6/xJt58ltpV2Zu3GqlssbtEv3sByFRu+RVzoqVac6RbGv7tNdnfNr1E+LT
	vu8ZAXAUFXWfy8sUh/sAwKPB2yeY652uTpay8lP8YEHEPrs0aMQLHlhdJO4qPiRqsvPlA/xW76Zqv
	Kv/zp/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhTH-00000000Coc-48Tl;
	Thu, 12 Dec 2024 11:35:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhRR-00000000CHt-0LNw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 11:33:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EBAAA4276A;
	Thu, 12 Dec 2024 11:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E3BC4CED4;
	Thu, 12 Dec 2024 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734003192;
	bh=bI+wKiXz+sjwrXGi9W8a7W5Mqy1BmYf1t3VdgNU8DeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dk4cN6NTIy2EYGlRKrBLcv8H25jiVzfMj+JOS+5UV3Q6EiSqkPEvqWwc4w7MMOylo
	 o/DH1ZUOM8UkfVfIMd8gN+z5G39uY4kSPbqjN0lMevSrvzs2PdHwguxSMWXz9iotEZ
	 fYn4pz+J2iIQ/1lgydd29BcI5TNCjOmJKnikWAt9Tb+fyCcnrx09XtDBlbChM335dM
	 HrQdGVJx336iJSTYcIjD4CK6/EAgIbf4dbr84Bke5HKdqxBf6+R96Ui1nSMOOZ99y+
	 Iq88KR0ONVsEbL9CB3TywJTtsVQQEYqAaO3jDnvPe+bz34WzQ4fbOIY+mH8/YUVutW
	 48SY8Dk2mTf1w==
Date: Thu, 12 Dec 2024 11:33:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
Message-ID: <248dea18-bfad-4ec9-9a7d-5c87c7f48c84@sirena.org.uk>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
 <20241203-arm64-2024-dpisa-v3-2-a6c78b1aa297@kernel.org>
 <20241210170953.GB16075@willie-the-truck>
 <b859bdcd-7343-4d53-9f3a-f374deca725a@sirena.org.uk>
 <20241211224015.GB17836@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cChPOZNdbKWWH8te"
Content-Disposition: inline
In-Reply-To: <20241211224015.GB17836@willie-the-truck>
X-Cookie: All is fear in love and war.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_033313_187869_1D020459 
X-CRM114-Status: GOOD (  18.63  )
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


--cChPOZNdbKWWH8te
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 11, 2024 at 10:40:15PM +0000, Will Deacon wrote:
> On Tue, Dec 10, 2024 at 06:43:05PM +0000, Mark Brown wrote:

> > Yes, the issues here are not technical ones.  Though there are some
> > complications -  eg, IIRC the XML doesn't encode the signedness of
> > fields like we do and there's areas where we've deliberately diverged.
> > Given the amount of review I end up having to do of sysreg changes your
> > reasoning is especially apparent to me.  I've passed this feedback on
> > (again).

> One thing we _could_ do is have a tool (in-tree) that takes two copies
> of the sysreg file (i.e. before and after applying a diff) along with a
> copy of the XML and, for the the new fields being added, shows how the
> XML represents those compared to the diff. It should then be relatively
> straightforward to flag the use of an unallocated encoding (like we had
> here) and also things like assigning a field name to a RES0 region.

> So this wouldn't be generating the patches from the XML, but more like
> using the XML as an oracle in a linter.

That'd be useful, yes - unfortunately I think that's still something I
can't work on myself at the moment for the above mentioned non-technical
reasons.

--cChPOZNdbKWWH8te
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdayfAACgkQJNaLcl1U
h9Bo9wf8DjHXD65QAeLiB/WQD6MKK2q1vhHifOtaL+lp7nN90YodMEadPyi1bgC0
7kGLdiSnfBrGie39QosDOpgsd8FrzTWBLbvr7eoAWBjuhNZlFmz0S1sMsZ5eESte
qFb6DrYC1LG2RbGC6TUy+CUW8gxKmzVYlbES/17f1lrq3v1yH5QSKhZNu2o1uSIJ
FneGYGH2H23/rX8qM+0QVZlRgiRkUN1AFmlZPOol5YpDCwgppQH4VBMoRgg/kKVs
4tOIqWWuDBnQ0thBa4o7EeoN+qS7iHl7mEzTkbHxse7zMe+mg3Ffs8jgdtxN55In
2Rt9VoKhAE5mbSmIlPhZUM08qgHkBA==
=OGMy
-----END PGP SIGNATURE-----

--cChPOZNdbKWWH8te--

