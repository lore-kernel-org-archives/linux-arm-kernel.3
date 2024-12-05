Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B2CE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 13:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae0PheueVouvrnekb1ECEKr85jS0jvWuLFwK3zh302I=; b=yw3bls8YYvg9DF9wI9jmuAsa4d
	cuGyKSMpNpuZLmXgWR5IZEWOiz4kD+P2DUml5fmzMcBFl81TJ/jzKPE/DCtW6O4/Wq61svRUoryFq
	jq1KuJde45pEikSXTCCBlMCao2Ex3Of11QpJmlp9kqiuIKeDUvaVomSV5l+GS64z1CXFuk+eCxUYB
	eeP6tUWgRm8QjjuNOa6aWejJsCcLRUIMC6ONz6d0zv0WEQQgpBmS6PyLgIo3ONjZt8ehXLxzniFD9
	O0My0YcwNaFtfkXHftv7DIdPdb0lbJGzFOjVELkszTxLm+pnkJPrKZoqL+FrMqINGRLaT+OiSe25K
	EgTPpzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBoS-0000000G6yb-2ntA;
	Thu, 05 Dec 2024 13:22:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBnR-0000000G6Ys-2Wx5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 13:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ae0PheueVouvrnekb1ECEKr85jS0jvWuLFwK3zh302I=; b=QNNeCFAM5NfypL9HX9w0U6xp7i
	h+DnsgBXR3L3UmocmnHi8RIxVXEhpeY4Rfm+3fveRBGWaVqYhL7Ig7A3QEUVpsTVjox/6bxWKgeso
	Iqv42T1dAOtw7VYRaeqzwLl2K/nQ+ASc0GgKeYi3S9hIhk5BnN4RPRV09lj8vOw7L4w/EuXnB+zR6
	stHTNdhsqV6/NKlQ55H9PfFzhjn7Cl1Wkxb6ypfLAPysHjptwmqxpvLKbiUFDpyZdNkk4BkaGjEmy
	ZPjqSgAB5TXI0X/h1eVt/6fDETBv1HTXhucHNibe/yC3Gj7i5IV4oKM0XYXLclUFLRBii40QzqtMn
	DHSky/oQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBnO-00000002u1i-3b1O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E338A5C6483;
	Thu,  5 Dec 2024 13:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE07C4CED1;
	Thu,  5 Dec 2024 13:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733404887;
	bh=xajhtnZLw+gujdBfSJFKI5A1z0+kSc7SfOsMOHloiu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ReXWb5q2axkZb8OL9CaM2Ch/PF5xFCCu7QK9ejfggRkLSIJ/qv6zmfdWWzxiTS5EP
	 7otUi0SQi29yB6dLJRdykJvv4hWQqR9ZypNdVg2QC8TVvTL0CIluCbZRW4eON8D5Ko
	 Nmy/H1zQkJKxf2EpUDr0HFkGUb5iEpbA506rR5c6kSDRLo1KOntrrL6i71GNuMrzBW
	 n+sG/3lZcySJEAwGhjWoaciscujfohebZi+vwuuQ6dUXM017FOK0hwIHR705n9exVr
	 LQ/eQ37xREH2fgdIc127UcMoIizB/X1Ot0xVYXip3WgsRTvySQfFyHWtZRs+pNntzm
	 XuvTiq+INVNfg==
Date: Thu, 5 Dec 2024 13:21:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	joey.gouly@arm.com, will@kernel.org
Subject: Re: [PATCH 0/4] arm64: ptrace: fix handling of partial SETREGSET
 calls
Message-ID: <a2f806dc-c959-454c-bedb-7b76a7416da0@sirena.org.uk>
References: <20241205121655.1824269-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="INN0yxRwBDE7b2Hk"
Content-Disposition: inline
In-Reply-To: <20241205121655.1824269-1-mark.rutland@arm.com>
X-Cookie: System checkpoint complete.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_132131_075963_0A3A9BDA 
X-CRM114-Status: GOOD (  13.32  )
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


--INN0yxRwBDE7b2Hk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2024 at 12:16:51PM +0000, Mark Rutland wrote:
> A few of arm64's regsets forget to handle partial-length SETREGSET
> calls, and copy a small portion of uninitialized kernel stack memory to
> the backing storage of the relevant registers. In all cases the read is
> limited to a specific slot on the stack, and the issue does not provide
> a write mechanism.

It feels like we might want a helpers specifically for the case where
we're mapping a value directly into a data structure, it all feels a bit
open coding.  The shape is a bit awkward though since things aren't
usually stored in the same layout as we expose via ptrace when there's
more than one value.

Reviewed-by: Mark Brown <broonie@kernel.org>

--INN0yxRwBDE7b2Hk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdRqNIACgkQJNaLcl1U
h9Bhfwf/fpCPoWDnUF4eUxKewyInLMKoXXU8pTDFYSpW9WQDLhh9gxXab1xcRbgs
M9S9hTMxqexVYzeyUyYZ26T//yHvRGSxcBjZd4TSa3sOWgfoqKcaKUXAnWV922vi
KxsYiPRt9RFaFygoxQWgJ3W1hONchn/v/CreG0r+TwU3aNxg2B7F2EZaCEbVHO3Y
FDvdkyGiWx/9/8Y2ABmFy+uhaz5SpM7Xrkbl/SoA4T6jiyzQ+Djfghy5yDyuDhAO
umFrsFBDW7vyGNvCVepv91jhS2pKZilRI9k+BkaP+a8ey20BqwzF5/dLqhpCpOjv
4OG0v0WA71iQDrWVIdX3fUlMTKMZUQ==
=E8Bg
-----END PGP SIGNATURE-----

--INN0yxRwBDE7b2Hk--

