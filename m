Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B63E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWlpy6ozgPlZnYAEZVNeyHvDlI/fue0Dps5SnvTNOzQ=; b=Ai99Z765UBm0i83eI2TZRqKeDf
	EYBuVClpBhJCmvNUyUj16z9oxrNwRDT4+pDIsmktdX2cpG6U1FhNzqztzTNYDTow3RGh8bCEXjBEC
	aIAC105AE8SQk57o3Mz2dJmiW3qeW4xdRcLse/v3iLbVuaiF3z5NMHYgNlAqPgKde2S2sofaWJxeN
	iJ1G+WaTNPw/IfrDoeajjUqRY7hsU91wLAmgQiQZuIwSVfXmBD0BV8k1XH4C8Y5D8r4HN+wDvXsuw
	+rVuSuHS/GxOde9i4VTJnUbWWjbyUg5E/ZLGfcZ5vB4DF7lx+to+hPFbsPZi03YARiaLDRyajN8ej
	ej6+LNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNB5w-0000000A5lv-3R6I;
	Mon, 16 Dec 2024 13:25:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNB4r-0000000A5ZJ-0nZj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 13:24:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AA205C562A;
	Mon, 16 Dec 2024 13:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16B7C4CED0;
	Mon, 16 Dec 2024 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734355440;
	bh=GJputwvqPFp8XHDoVt2MCbWbXO/bSXIWyKEjo2h5cdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdHnvuBM6bPFioPn2l9M8vNgNFewmnsOzAxSf3q89sHLdZ3C5rynChVOyHucUewmM
	 0mYDwV6FUv1676hrEYMT55QYQNcx165VWZt5SP7JteoTiEwqJX+2BWfVrILfikwbxs
	 xAGCYOt485Z6SE33E3RAzSB4IgSlBAP+LZrCciaVNccqV+Ms84wNDZ+ZqFmfHOsl+L
	 t7Qowf3T6dJrFHlW0oGQ6UqzgKRtHnvJPk+ybesAZr/nl8Zkn0pIU7osMoheC8E61H
	 BsMMiYBr77sZfG7Mvhxv8WbHu0gvQ3/zRePQE5nRMXCiD4zBx+NSOg51uHLSwd37dC
	 sJPlWoH/3/l2Q==
Date: Mon, 16 Dec 2024 13:23:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
Message-ID: <855dbb91-db37-4178-bd0b-511994d3aef7@sirena.org.uk>
References: <20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org>
 <87a5cysfci.wl-maz@kernel.org>
 <709a0e75-0d0c-4bff-b9fd-3bbb55c97bd5@sirena.org.uk>
 <Z2Agntn52mY5bSTp@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tQvdM+9sz/vOFjes"
Content-Disposition: inline
In-Reply-To: <Z2Agntn52mY5bSTp@J2N7QTR9R3>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_052401_273769_C3F9C294 
X-CRM114-Status: GOOD (  17.07  )
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


--tQvdM+9sz/vOFjes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2024 at 12:44:14PM +0000, Mark Rutland wrote:

> ... didn't matter either way, and using '&boot_cpu_data' was intended to
> make it clear that the features were based on the boot CPU's info, even
> if you just grepped for that and didn't see the surrounding context.

Right, that was my best guess as to what was supposed to be going on
but it wasn't super clear.  The code could use some more comments.

> I think the real fix here is to move the reading back into
> __cpuinfo_store_cpu(), but to have an explicit check that SME has been
> disabled on the commandline, with a comment explaining that this is a
> bodge for broken FW which traps the SME ID regs.

That should be doable.

There's a few other similar ID registers (eg, we already read GMID_EL1
and MPAMIDR_EL1) make me a bit nervous that we might need to generalise
it a bit, but we can deal with that if it comes up.  Even for SME the
disable was added speculatively, the factors that made this come up for
SVE are less likely to be an issue with SME.

--tQvdM+9sz/vOFjes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgKesACgkQJNaLcl1U
h9Dn1Af6Aoi1kYEJgEpP9SuLVKjtDdtspvPJ1Zxcn5F9yCCeGy6jEdCF64uMyukR
zRDEveJcHwLSdXwWI3vuogbEugswRQGaCZkqXq6GIYcqkL4bK0rZuO9MbsEY/evo
lSuvJTX77/lHZnIpFYVL6kMuDGgTanmm+moofxK6ae8y9edKYGpsNqiJsyIUQ44G
t0QqBHLFQzaEzjZV39B89oSIDWmilLJr6Hzw3Ht7S33xCa4IPICjfYxFSapua2Lg
nyqGOLkIVafK7Ob8Bs1ZnZdt84rL24d72f4cM+Frb7X7yNlWUstqJVRGjjVwxPhU
+UEB5595YufyuCdHMCBKWu8T64mNPQ==
=b0ul
-----END PGP SIGNATURE-----

--tQvdM+9sz/vOFjes--

