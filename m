Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12DFC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/K/aJEmgPJGOnvaRiugHVJ0JoKIYJGgQjimElrup2o=; b=sGE9dz3qRRSUGv7iW4DUu0c2dQ
	sCpBugLSIdGWZpHS3NQb0K5P1TZzPhXrBC35ihxcZLgrrwjfGAM5Wb7LKYiRTYSEy+HLQ+jX+MmUW
	kYPvlPDEeEHrpPvL8zS58ni4Ds70RDNXZkpfR9jD0t5F3ETmqG4BtGVtCSdzQ8zyfZpQPlSwnjyr1
	l/lg9BHrM/p449IHL47RAk+Ymif8zFGR1xiwSLfiSajQzDGa7sQV1IcmTgDN3+0BGsRryu01Py2ft
	Awl7TYkNLJpzKxy0lD/qAX+K1vFJU1KmSPNNaG91Se4yqbF5AO7K9FdpQP9kLd5ShGPy7tHgUyNBw
	kNypLGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vib55-00000005nZK-0zlk;
	Wed, 21 Jan 2026 16:29:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vib53-00000005nYy-0f9e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:29:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D3E260130;
	Wed, 21 Jan 2026 16:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DCCC4CEF1;
	Wed, 21 Jan 2026 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012955;
	bh=9/K/aJEmgPJGOnvaRiugHVJ0JoKIYJGgQjimElrup2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSYv3pcmkv4IodDz3ykBqIJq3ipKUJzWqIIh9dNrym05nqYkFNJ5mhe26qViiJJyx
	 5R/WdkvTTj1G3jAg4n23p7yWw0GUX2xqJJo7l98TTHQxuWK1Kbneo/HJVLJH8FECFZ
	 GwH04jBKR1aUjBoBTcekbL1+rG8BONufky4EMDwMwXwHJdWyBeWFtmbu5WoRZzA+p1
	 Xto+0dUN+SKGjOlQqUMvqzLF/1K5fmZcY+z+J2Fo3N9M/8KiS/5JnkPR6FIjGRSllg
	 1hVFwbSDu3jFBxnWSRxy/EO16R1vlG56DrbkNHIEU8wanTguataVzdHN1yGwSuwYDg
	 N5b6iQS932bCg==
Date: Wed, 21 Jan 2026 16:29:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com,
	will@kernel.org
Subject: Re: [PATCH 1/3] arm64/fpsimd: ptrace: Fix SVE writes on !SME systems
Message-ID: <352993d8-f312-435a-93a5-cbf6b9eb492c@sirena.org.uk>
References: <20260120145107.1278972-1-mark.rutland@arm.com>
 <20260120145107.1278972-2-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r+YvTdLF0bhprNv6"
Content-Disposition: inline
In-Reply-To: <20260120145107.1278972-2-mark.rutland@arm.com>
X-Cookie: Eschew obfuscation.
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


--r+YvTdLF0bhprNv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 02:51:05PM +0000, Mark Rutland wrote:

> Fix this by removing the system_supports_sme() check. This ensures that
> TIF_SVE is set for (SVE-formatted) writes to NT_ARM_SVE, at the cost of
> unconditionally manipulating the tracee's saved svcr value. The
> manipulation of svcr is benign and inexpensive, and we already do
> similar elsewhere (e.g. during signal handling), so I don't think it's
> worth guarding this with system_supports_sme() checks.

This is much more sensible, IIRC this switch statement was doing
something more expensive in some older out of tree version but now
there's no need for the guard:

Reviewed-by: Mark Brown <broonie@kernel.org>

--r+YvTdLF0bhprNv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlw/tcACgkQJNaLcl1U
h9B7kAf+Ibbyt4/qlvwi1qmBjp8PgyHyxi2aIXXoTNkaynTBSXbfJXUPCV9lExHP
laXAOuCBq/rUp/Qg1SIS9DsAMIieg08Dz4M+pqMvwIkSnZ/MFho4Gidom0557jYZ
1iBUglFHHee/sPjxFtDwEiaWpSLeO0w84v+MIEbu3h8jjd9x0Z2Ybqmgwr1MsNM+
ERng40Eaed0n+FPEQiAfoHu2q3yTCLTQ4A2Y0UUJFAGw7xt6XJ7RcNKHzXz0gUjd
x7ejBmzepHa+Sqs5Cbajw/qkVRN+zb2zHrJtehcwuXFVmItZPMkUMig+icTG1kD2
bBGfiOBcJD1DPQOG/Qtx3BmLN3U7JA==
=TlzV
-----END PGP SIGNATURE-----

--r+YvTdLF0bhprNv6--

