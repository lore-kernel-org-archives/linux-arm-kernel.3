Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2B5CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdh9ATGPmBKDE+pw4pjoKC+Xh39XzO7Ie2DmLfAIpmw=; b=3/vw3u+C7RZHsDZhQRyWK2LjNq
	xOdJNTbSMk78Gp3PWO7P3uPbLBGQxd17cHVKOyqEEv9OSAH0YB0vHWyv4iU6Y62pBlq7mmQfwsIII
	0XhppF8RWTVKHvU4+tzIQ8t2n/PdO6jo6h02n0+RFBUf/+qLjaXFYevTPIijVdmqFcOaPZe9yfK0k
	zv0d3WHV5adDkDW9Gv9nelq+YaDLuQKUXChechvI+868fz7xdj8GHjxQ64PFGlSxSzNCb3TZKm6Wq
	TM3u7fTh4Kppoc9wYSXk9eLcNgqdmhI7DCO8Kzcc5WmYXfUQTsTSVD8jA2cMgHbj9Gny1fQCFpKkE
	dJsUoAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzM1Y-00000001EmH-2E7V;
	Thu, 18 Sep 2025 21:18:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzM0q-00000001Dwc-09WI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:18:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 591E3405CD;
	Thu, 18 Sep 2025 21:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899B9C4CEE7;
	Thu, 18 Sep 2025 21:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758230272;
	bh=fc6zzd2NFbc4n0qZ3WrDFi+otpxyFwSPEnO3pb1g+o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PY+bDWTr3DHO8nXieZf7iFs+OlX+1OdO/LjogJt2uyongtZKaWYKtvMf37vFbv6jO
	 ONZG9F1bL4q2lmipxPt0jzliKbOuqqt1Y7ThT+p97VIYyv1h0gbb3xLfC/8tf3nhuY
	 7rUKlSQhxSoYz+2/auX1e/Ubhwzi8/AXoR4D1u8OutCN9vQwd4wz1ab9TaSj5euXXA
	 /sge3cSgDJbOmtUDy1HERQwSefZ4qH0p01fvFyQKNhta5HriRc1pI8F9mxRWbvZby0
	 N0R6f+iEI4LfrbBV7BxwUOkr2m3N1lvRkfYo9HVh9hKW8WXBSOuD6CfLBdGgQWZkac
	 BdVuDEq5NmjaA==
Date: Thu, 18 Sep 2025 22:17:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 1/2] KVM: arm64: Expose FEAT_LSFE to guests
Message-ID: <19b5816d-2720-4535-becd-18a3468051d6@sirena.org.uk>
References: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org>
 <20250918-arm64-lsfe-v4-1-0abc712101c7@kernel.org>
 <aMxyKbnVjS35YuQi@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="16gKMbNZJBY0LNnH"
Content-Disposition: inline
In-Reply-To: <aMxyKbnVjS35YuQi@linux.dev>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141756_367200_60DC68AE 
X-CRM114-Status: GOOD (  10.70  )
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


--16gKMbNZJBY0LNnH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2025 at 01:57:13PM -0700, Oliver Upton wrote:

> We also need a test in set_id_regs.c selftest for the writability of
> this new feature field.

Sure.  We seem to be missing some existing fields from that register
too.

--16gKMbNZJBY0LNnH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjMdvoACgkQJNaLcl1U
h9Be6Af/TBs9wrBxy+VeK23RJ2+hMChN440Xk5kJc9GEu2ERR6D0ResdZGBMfhkP
2vHJxdn6RhX32+PhTi0WsUkRirE6+K79mrVjcWu2EWpl7QYcTSTs80pKORPTwe2t
6amYPm7ZUWuPf3Wk8yWex2ZFqeq+CEFQDBc3jJy3f9pyXRe2e8wNU72uE6eXiALm
jicbhS7kKd4AosMPjWwjlNjHgNxpJGS2lOF/ikcGc5Ayx5OQGRh+DzplmZsvexeN
yprP0TiVzHciGa5Xqm/7Wo7/ussYeXilx3O+mpSDs0jePKAHkidDAafz78dIKcsK
yMXMy2stYabVPmm6DTdh48Dz/t/7MA==
=/Bpf
-----END PGP SIGNATURE-----

--16gKMbNZJBY0LNnH--

