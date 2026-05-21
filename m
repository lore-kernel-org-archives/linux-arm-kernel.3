Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAC5CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdPSMqplxokFnI6BOtK6gRL8vbCdTn2h+eaPI1K/I8c=; b=pYJQ2MEcN7Xzpa6NGrLF6IGkkL
	CJpi61rycY8vMi3PTMefGfCUT8hhnlZKh+HZ0cQzpz2Y2D1a3lgKGhDdZPOXneT+EoO84qqTbNfpD
	TG4OmZ/VhcBM3KrJOvukkn8qFRSfXsuIvVkNC5iLho+Sq0c2iABJjBMTmB1SqH3vnWChozftTpH7r
	l0Abz5iwmJo3BgqIVy66J+eD3qLqSgzL1dUfw1kDGqR+Nprx3mNPTFe0/Rj7h/h8k+Pe9a9s03klq
	TQAVejEzIXUXkyzMANSYWnhZ9R6sfHwXWIYAGvTfHkvo2t+/pZ/WUJWmTWcV0+a9G6bTw68xhguyr
	E03oXbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Aq-00000007gX0-1iIK;
	Thu, 21 May 2026 12:06:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Ao-00000007gWC-2Hpw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:06:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D72EB442B3;
	Thu, 21 May 2026 12:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5721F00A3B;
	Thu, 21 May 2026 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779365205;
	bh=DdPSMqplxokFnI6BOtK6gRL8vbCdTn2h+eaPI1K/I8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LPKz2fOgRpN7SmzEI+Q/lEAb5AJepMtwdqvrAhd8tU5MDe2UFcWE1dGEr35MKA3MT
	 DasgHPG4RdYWBiekLwO4JX9RUvR0zZ/OYKnfbCQNgnjqhv7em/9Ja9dobQgQw2EhGx
	 6K8VahFi3ciOltwV+QtN1O3Il7kqdBRh4d95AcXgzItAIcAawWM06/oKmKJfeJoXE0
	 Q4FQcDGxW8jAhdH4+VQImjIzx2CHjhSR/OlrXL9DIrTHN8jGa/EB406iDrKHiT6Z4M
	 m+JbUAaIVFB9qBLRCYNT3XO/OcxxZ4D8HjASxH6Fpy3zUrfoFRRScxijvMlyrcBhLt
	 7VZNmvagiNy8A==
Date: Thu, 21 May 2026 13:06:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/arm64: Add test for atomic futex uaccess
 with POE
Message-ID: <eeb367a8-23f8-45ba-ac20-624d83ddcf43@sirena.org.uk>
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
 <20260521-poe_futex-v1-2-1da286b8f9b2@arm.com>
 <8fc7713d-6451-4f05-86cd-df833cedd94b@sirena.org.uk>
 <c140c0da-4ad7-48ed-ad83-663ada282b14@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uts9jJP3d9TWK+YD"
Content-Disposition: inline
In-Reply-To: <c140c0da-4ad7-48ed-ad83-663ada282b14@arm.com>
X-Cookie: No shirt, no shoes, no service.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_050646_600802_94B28857 
X-CRM114-Status: GOOD (  14.47  )
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


--Uts9jJP3d9TWK+YD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:01:17PM +0200, Kevin Brodsky wrote:
> On 21/05/2026 13:22, Mark Brown wrote:

> > Doesn't matter while there's only one test but we should probably
> > munmap() this when we're done.

> Fair enough, I was being lazy :) A pkey_free() is also in order to be
> comprehensive, another wrapper to add. I considered using
> ../../mm/pkey-helpers.h but helpers there aren't implemented inline...
> Maybe refactoring for later.

There was another thread librifying the GUP helpers which might be a
good model:

   https://lore.kernel.org/linux-mm/20260521111801.173019-1-sarthak.sharma@arm.com/T/#t

I'm always a bit nervous about peering inside other selftest
directories, it can work well but some instances of it are relatively
frequent sources of regressions as people working in the main directory
don't think about users in other directories when doing updates.

--Uts9jJP3d9TWK+YD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO9VAACgkQJNaLcl1U
h9DVSAf/VAEkyQTsz/fLRx3YtFCj2VfHVAXIHbu+ljIHKMHbozKj/jWZQkPp4Lc1
4q/Xbn27fq0GMD6GKlJybosoVFijN3S4tb+9VJ7b2d07bmLtnIkx68Wer4xAAt7C
Jw9ksVjgrDJUbPYrQcPF+Qv58VYdd9xu3j+lS4ihKPs3IiK9/77cWVORHm7+ldMx
XqtStOA8JNatXwm/skkV+5BOhMuVo5aFmd0HnVEV1FjyScujJMtS5jqlLoX1Cxqo
KwcpZby0wuFoSM3tub2e+uhm6KVBiL4Dhiz1eS20tSAQhgjSLwGbdo6cbigEp1X/
rz/RyJwqG3CoS2ixyAhqGOgZFjH5uA==
=0VOZ
-----END PGP SIGNATURE-----

--Uts9jJP3d9TWK+YD--

