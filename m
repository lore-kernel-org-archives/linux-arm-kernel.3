Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8014AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bff821+58d0IihkVCe7FPlGHzlq7ALK5M0mZxwSUlO4=; b=kS+TPWmcfs1zGLRYlAbm+XTVMS
	THunRgV4mYgjOKVzzkSxqOvpL915NGRXF66GQEV/0IOavBW03LvhYcM+q2aX8ASzzRVyAWzGpKhz7
	MHeaz9U7oDzx0HET3e7+5EVlGJXQbc5YtowNz7CG7r99h7o1EWFb0kxQf35jyO5xHs0xA57S5fCrZ
	ligW/u1JEM2VseXepmW7o+8MPh7kukWUfmIC27wNCpG109xtyw/NZfG8sVVWy0o/p+VnMLG8jhbOn
	eDGLPXJkUqA2TkcWaPlSB6FrF5EmnP8LqMxFPW0DT89T01ACV8RQHlPXau/OIh8NKHgZKsfLhSwmF
	bGO0oInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3ph-0000000C3hc-1JiQ;
	Wed, 15 Jan 2025 13:53:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3kJ-0000000C2aw-1FtS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6398DA41DC9;
	Wed, 15 Jan 2025 13:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C99C4CED1;
	Wed, 15 Jan 2025 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736948866;
	bh=Bff821+58d0IihkVCe7FPlGHzlq7ALK5M0mZxwSUlO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ru4aOHwA349jC9tLmdR8GCz4OSh4k7wO9ixiwmHHCNfX+AQ8eCeZSinJ51XVixZab
	 LgZQGyme2zEgSnjzc0xugTtJEjhSdINqEVQsON8GEpQFXchvE4fQZMS+0A0v0o+oUd
	 jh+9YxzxRTsmhngrSgWWDVNb0dzXRtGtVkTVirjMWzsgJK4Z0j/I5Hg94oQl0Hvl56
	 TjDOMKjrTpDjYnFRYwf1EF5bFIrXQgUQbwsbXWIRKvYWFpVdxboxe/RCW7NMGp8xoi
	 GwQcuLUjBtZNju3RptHFZLbagZTBvkJfl0ktFcU7D73M16AUVjTrag9jph0utf/OC7
	 nInTaYxJEsR9Q==
Date: Wed, 15 Jan 2025 13:47:41 +0000
From: Mark Brown <broonie@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org, maz@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64/sysreg: Enforce whole line match for closing
 blocks
Message-ID: <b66f92d0-dfd6-45ba-8a50-69b49e588514@sirena.org.uk>
References: <20250115134259.1864060-1-james.clark@linaro.org>
 <20250115134259.1864060-3-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26++BOMd+gcvTnyP"
Content-Disposition: inline
In-Reply-To: <20250115134259.1864060-3-james.clark@linaro.org>
X-Cookie: Phasers locked on target, Captain.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_054747_399681_5219D41E 
X-CRM114-Status: GOOD (  10.86  )
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


--26++BOMd+gcvTnyP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 15, 2025 at 01:42:54PM +0000, James Clark wrote:
> Match on the whole line to prevent matching on prefixes like "Endsysreg"
> vs "EndsysregFields". This could potentially make the script go wrong
> in weird ways so make it fall through to the fatal unhandled statement
> catcher if it doesn't fully match the current block.

Reviewed-by: Mark Brown <broonie@kernel.org>

--26++BOMd+gcvTnyP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeHvHwACgkQJNaLcl1U
h9Cugwf/TQBZ1NLJdphvcHQX86XL/6PMVi/mcpYZDX8UOcKww/noPoUm6D1zC/CV
4KxFthwaTr5GLgEHPXyI4/rfvcoHXQF1LWXeuZVv5xkOMkCkesB8go6EZbfHa3I5
R4TJdENAzX7ZbnKKoo/B68JXs2lAJIfmzlvNFNKgyUm20o2zuT51m/TYgOWvHy8w
OdS2pk4Vd7DPHg7i3pm+SanCUxkb7hPFScGtm/VzcezKZr7HcKfk5WMLwFFgMEnh
SAg0lwBe1lHifMYSWCgDITHW/DjGPaTkR0zoNPWnMn09tXRxGCVoi2DitYkvX8Vd
ytgEHOO+vmPpnwat38BMoQZb51HE1w==
=eOwj
-----END PGP SIGNATURE-----

--26++BOMd+gcvTnyP--

