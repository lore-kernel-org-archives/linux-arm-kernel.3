Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100CED5C0EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GtWP8s1H5yuCjJ7iApCzWEGb6NjIifbIiaQZVF1NCo=; b=BdNXHuTDu8SIThErmUxdXaKLtS
	7EPlDAoOOs4CbHC2hkL/8bearc+UqH13X1U8GojWmR/mJgoJvc7ZdG4VFreWtNfyS1/YxXOoEP36H
	wWRHGNjovXCsA9zJtbGu+EuC118Bz4jBUv4F1HDN25QBJngqQIX35YKRKMk8khEWSnRogyg14Yd3u
	PoTBKt4aaEEC+F4eo9rDTE6ZG9sJVObuJnwkhOMbGK4kbsp5tyq3v/Lx4HB9oSa7x3rrnOzsFMTYY
	7SyYuic7mk49K5ABK4uMxssheGmdiN46EsnTl1WIGWrADXzwaEeY8GhOLQd49N2bTeISHr7elf8m5
	OsnHepDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9R9U-0000000B51F-3WUO;
	Fri, 08 Nov 2024 15:44:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QUG-0000000Awcg-3HK3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49C4EA42E4F;
	Fri,  8 Nov 2024 14:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1B2C4CECD;
	Fri,  8 Nov 2024 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731078083;
	bh=+GtWP8s1H5yuCjJ7iApCzWEGb6NjIifbIiaQZVF1NCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPTMClMLXm5Gwd3XSKD4vHlV38lSfghRD6k6lpJCbMCXkcofblUuuq/GMog12pigZ
	 YUEn+DkaVvQyZ0yvH+VOpy+w0BCh8689Y/RlaY+r4gYEntoAL7IjpaGS/P9SUN77Rv
	 dURQx9nUwcykIFcpuMDtzhZ/Ud9+fG0fqxUVg9lmEvHGMxkXotY120eZjUJiidewTQ
	 t/hmuEqCE9nt6Qa3Id4bXS0gY2uBDNTyYUTmJSSTJ9nqWiKqxsfIBJJZiQPl4QwGVR
	 xFEPbhvX7ArtIqsYJl2lpV7TIBxXjLoTXNOtIvp+jr7+BsRkUEczHxGMZwhTF+SP5z
	 a/847l5LqOdGw==
Date: Fri, 8 Nov 2024 15:01:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/4] kselftest/arm64: Fix printf() compiler warnings in
 the arm64 fp tests
Message-ID: <a5ef2d73-04ad-4b66-bdb4-e17161d9eb89@sirena.org.uk>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
 <20241108134920.1233992-2-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HMGxNV9GQjk2SStd"
Content-Disposition: inline
In-Reply-To: <20241108134920.1233992-2-catalin.marinas@arm.com>
X-Cookie: Do not overtax your powers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_070124_909542_E79831DC 
X-CRM114-Status: UNSURE (   8.07  )
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


--HMGxNV9GQjk2SStd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 01:49:17PM +0000, Catalin Marinas wrote:
> Lots of incorrect length modifiers, missing arguments or conversion
> specifiers. Fix them.

Reviewed-by: Mark Brown <broonie@kernel.org>

--HMGxNV9GQjk2SStd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuJ78ACgkQJNaLcl1U
h9CZDwf9HlAUKB9LCyBi3ZVkP9Z7lD2zuMWbfwXq1yJVEquBQCdXI4zS20j1KHt3
1pbyG0gB5HYN72zj90BdYA6QSjtWPFaMcWBMTO5ogTuP0blwizeu66VbcCm1EaWy
fNHNtV+h/8fp0R49KidMygqEPK8SOdmtWwYjHVPIc5kD9qQRhTTibanpl56diShW
NSPWn7932e8UEJN1v5ZkOywQksJHLPTdCJJQeh85NeyKc3LI9BEvGsUU5hM8INbM
pD7r3igLNnn7iL5raYZDPYIKIk4vD/Cg9PbK+T9yZaAghc/dadIBlSGdBoJTrWo1
2L/nh4OTHk0+SIuWqEoHTFWDUmITYQ==
=w5ZO
-----END PGP SIGNATURE-----

--HMGxNV9GQjk2SStd--

