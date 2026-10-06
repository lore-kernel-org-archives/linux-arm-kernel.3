Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8B1CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnBP/HW+HUs1c/9b1ViBv119RNME4VYKXi0TTo+Qf7k=; b=tH0iesRsoBC6mSqVwOjKSTFlxw
	vIUVFT9ZVc/CaGbXq1GogyxNLHieMeikkbDk7TyaLraU7mq6J4h6qainGbdVQSURzR+n87x6WXhFG
	w1Lb6ireHTK2r86XsOWmUPDTamaBjx2y5u4MeDaQetGmXEGDdBFni6zXDk6OoDMHWdN3PQm71Vibp
	h0+Ly6BtxQJn3qHJVOMuykMCkhQCsaLscosasrgGd8cn/g+s/A0Y9OOiqcogncFnfXfhugbuwDkuO
	9/G/qXjvpMtcjl2NsdS0EZPu55GGElqgZvlt0A16t2sY7boKr9QeoKshfp6Qjf3Ey8Ua6oNEf6tvf
	+ovWvGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6sr-000000011Dk-25gM;
	Tue, 06 Oct 2026 15:15:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6sk-000000011Cy-3BBV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:15:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD411602D4;
	Tue,  6 Oct 2026 15:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564701F0089B;
	Tue,  6 Oct 2026 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791299705;
	bh=BnBP/HW+HUs1c/9b1ViBv119RNME4VYKXi0TTo+Qf7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nqfULfyuDoHoQHq538OXt7Jhb10LG2xXPNzGwlBKoKIhClhVpttzTyTmWT4UnrzZl
	 nkrg4MjFfBwMHdOJI7vpiWMq/hMRe+CUP0F5f+vBZifej8237GHiMjP2clxfwQpGsV
	 ecwKBvLy0MRmZZySFAvQvgWp1+HT4cGsGOKCCQWO6SMFUtpawkdZ9PhFt7n+KdM3/J
	 P2V3rSX8S7ICAu0UC/JQhkNzEj1r0VwzBa5OOUnR44ERV1kW43l0WA5FTGITUP+mJg
	 aNarGGSCrcUyRPABxoaHGJU0VA9tP8EBDpYZ3Rt4QW0SpQEamPxaxsGcjmj4CqsA5w
	 XIeAjt5547Ptw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 55BFB172B9E2; Tue, 06 Oct 2026 16:15:01 +0100 (BST)
Date: Tue, 6 Oct 2026 17:15:01 +0200
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Bill Roberts <bill.roberts@foss.arm.com>
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
Message-ID: <asUQdaTtMF1X_Hsa@sirena.org.uk>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <asUIWgHk3hdaLEu5@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0raDfj7qAX9drGKE"
Content-Disposition: inline
In-Reply-To: <asUIWgHk3hdaLEu5@arm.com>
X-Cookie: Use the Force, Luke.
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


--0raDfj7qAX9drGKE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 06, 2026 at 03:40:26PM +0100, Catalin Marinas wrote:
> On Thu, Sep 10, 2026 at 08:00:39PM +0100, Mark Brown wrote:
> > When we refuse to change the GCS configuraiton due to locking we
> > currently return -EBUSY which is an odd choice.  The only userspace I
> > found that relies on this value at present is the kselftest and other
> > architectures are using the more obvious -EPERM here let's switch.

> IIUC, riscv is returning -EINVAL. Should we get an overall consistent
> value? Personally I find -EBUSY quite descriptive but I don't mind
> aligning the architectures (before user space starts making use of the
> return value).

Yes, it's using -EINVAL though it differs in that it's interface for
locking only allows locking a single enable bit in the enabled state
rather than letting you lock unknown bits, or locking things off, so we
need some changes there too.  I guess we could also go with -EPERM which
would also distinguish the "I don't understand" from "This is blocked",
but nobody uses that yet.

I was intending to do something soon to pull more of this code out into
some shared place since especially for RISC-V and arm64 where they're
using the prctl() rather than arch_prctl() interface so there's less
reason for things to be duplicated.

--0raDfj7qAX9drGKE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrFEG4ACgkQJNaLcl1U
h9D0awf/Xe86q6e11p+608ssP4aZxBI78PtAfpwBy8yVgJnLYFHp0KmKvwbBjcMs
gIihJUx6WI+SQz3OGTYSQfuWf3t4bKxojv6RJG3i0NfJc2Me7OUBRSaIADDnVHgL
aQEHX75BZZJZYVGTwaqp0lPHWzOQgaYwCvontiu/NgwzFzeDFwcy8CVNk7rcsUw8
IvSyGad2KWYfb8aInSuFPzXCzKH0pjhjJDX0GC2WQ8ARaybpaNWe4HWd+QGd7oD1
nMbaPhZYZyF2ePLcY3SUOR5Hx2DxLWjXmYn3o8woxdNSlgtsuOoQ0Jh7WXmucerZ
5xxKWjpj6Xh4Wj/6z3X3ZvmaDtwayw==
=TvPT
-----END PGP SIGNATURE-----

--0raDfj7qAX9drGKE--

