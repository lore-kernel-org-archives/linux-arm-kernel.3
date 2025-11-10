Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A72CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRboUnYjJ3UtYnWmXwhNRQ5iDRKMIY8Ejv+CAbpIwoQ=; b=aoC7/p6dzOrOg5CZ8Au1yBKe3v
	bBvpeOVkmNGISQx3hr3KwLsMWjpXZvlUh+oBRgIq8NTZgdYpkLRpeLxywDvJ7YRIa7KG3cl8nrUh2
	lMwiThDGmAccaRSsrWMe3vMTR5Co+LN4xXw54/vgBaJwTXs5Sm7zLbD2PefJBpXIkb71J0DMRNhod
	S4uUUzDqvVztDa1XMwEqMQX8/pYb8uzj/mdVJe1wGQfXWWe0oxaJtAiS6ZrnBq392YU6hbpDuTBi2
	RNJbrhyhMt6m6Pa+LcrLicHe3P92JCxd6hD2c14flJFroR5THV/0bpz71mql2fXUUafVh3jW5ZzV1
	0LPWbccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISgA-00000005YqS-2MyH;
	Mon, 10 Nov 2025 14:15:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISg7-00000005Ypr-0e1Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 823DF4060F;
	Mon, 10 Nov 2025 14:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A5AC16AAE;
	Mon, 10 Nov 2025 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762784130;
	bh=Zjtpe0PcMapcWqqZkDdW+4o/kiPNnUphphvNHXelxIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GA42ph7s2s7+Yl7kwe6WfC59VTGLEboLESGwJyU1V1aigA81vgr0GaSEHqSq7Vzou
	 aOjGL/skU+9gr0wuCZMkj+dYY/k99CGv8IbvjRMfgDJMAQcpafQ4rwxR0DskeKbd3c
	 k/bly5tjvA0+25B5Klj3vQzAF4hK2DyU+2f8gFGIOiQSJa4fbeNo8UKuG4+32R8DA5
	 iSkb4zzDc1K0xysjIYCXJNR1NgLDu7br3jUdOPz2AKgTblQFRc9GFLk5pVh9C81U4K
	 6AgVr8+MQWs+dUxApCQXJAdol1IPGOCqnjX1DZb1UwVGbi1l6ib1pncC4w5c1ntAiz
	 4kwn8cI0TPScQ==
Date: Mon, 10 Nov 2025 14:15:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v2 3/3] KVM: arm64: Limit clearing of
 ID_{AA64PFR0,PFR1}_EL1.GIC to userspace irqchip
Message-ID: <aRHzf5wgJg5vSoKo@finisterre.sirena.org.uk>
References: <20251030122707.2033690-1-maz@kernel.org>
 <20251030122707.2033690-4-maz@kernel.org>
 <aRHf6x5umkTYhYJ3@finisterre.sirena.org.uk>
 <865xbiuj6e.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmuVcHVoFc1KSfwu"
Content-Disposition: inline
In-Reply-To: <865xbiuj6e.wl-maz@kernel.org>
X-Cookie: You dialed 5483.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_061531_209262_B5FCA13A 
X-CRM114-Status: GOOD (  15.67  )
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


--nmuVcHVoFc1KSfwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 10, 2025 at 01:11:05PM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > Today's next/pending-fixes is showing regressions on a range of physical
> > arm64 platforms (including at least a bunch of A53 systems, an A55 one
> > and an A72 one) in the steal_time selftest which bisect to this patch.
> > We get asserts in the kernel on ID register sets:

> Please name the platforms this fails on. Here, on a sample of one A72
> box, I don't see the issue:

It looks like it's GICv2 that's affected - I'm seeing this on at least
Raspberry Pi 3B+ and 4, Pine 64 Plus and Libretech Potato, Solitude and
Tritum.  The platforms with GICv3 that I have results for (eg, the
Toradex Verdin i.MX8MP and Mallow AM625) all seem fine.

--nmuVcHVoFc1KSfwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkR834ACgkQJNaLcl1U
h9BOeQf9F0JppM6Dk5c7+DhSmGwO4/k/K/NN2DSDzXyrzdW9KWlMWhKIfk0uvhLD
7Ne8pxY4YiamvsR/BgueeBbMum8BTfEZdT8nIkMdksIEDXrTTNz59bsDyqSw836z
vvrIGpN1rtR8w61ptev/8jF9EDH3QQF+GkoRF6RFOW0rMMNMIN7EHciTVHcE2xBW
T0Cf2fVgdYQAGNIs4j1dO3mmttXmQwNPeUAbasMw2qo8mw4kSqCGBhKO4mqvLBy4
UQcK5zFxuf4S4gQCHTkBUHbiBReMvtgJJOV9wOA9+mK3KOwKC2+cuhVUfNl1s3zd
Fs1H3D7kNPzDwNJl47kxXxHRqeQjHA==
=/URp
-----END PGP SIGNATURE-----

--nmuVcHVoFc1KSfwu--

