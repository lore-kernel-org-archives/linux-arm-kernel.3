Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707CBC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2XfgsN5yWILPDI4TodvdihDI0fyXMzry6P2dPKhycw=; b=lHTmHmAPbDIE0Q+15KLfxmfG3E
	L7UEgfrV6/m4iNXQ72JJe4Y6M+j974LxB6PuJOCArn7swJLhMwAbfl0H5vXU3HyxvqSscZo5PxVw9
	SxI8p1mvCPca1D3W2As1SguasuPsqHFLpcHQtNkeRTc5qHR6BEjnsPCO1G668udfkNJjPP+oAF0on
	fx+QouvOQ6KSw4KfhWEj8I06U50k9M7+tOMMxXezoGz+eqtgpNYAhZ4Q7P7vrGYkr4gE9mFCHIMx/
	9tcEdwL1len8Bvotw0t7OuDbnCkd6R6zQZB+gNd7rdhsE7BpwVpKBKrMX73M1JaVkeX3pRGeitWcR
	WiNVDQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzzC-00000007VDq-3Xkq;
	Wed, 16 Jul 2025 11:07:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzVc-00000007RYU-276n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 10:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D95B446E1;
	Wed, 16 Jul 2025 10:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C7DC4CEF1;
	Wed, 16 Jul 2025 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752662228;
	bh=j8kv5dfLRfwnaSS0W2qeEJ+Bh2ETTIYU9oxV9ZBlXjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzhtJfg0CmGUiIWofiXXu/5QgT+f/nYyONOSNO1X0ZK7XeQiTNBxxOJ+oalSp/gtX
	 xEP6GO8GyCF+EYhBvive4tkJSwqSqLsUxB2yTl+oRhtybtKZkSu4wekrmtwZpaZVD8
	 M8JQoSRD42Z//5lsUfqTS+trx99mUhnl48zr2F1C77LguPJu9rqqcY9LWfin9TWyRm
	 FxHQgp9/2jIa0tvjDRFDm+Wg1cUGhEsng02abmQxsl4dkaMF+9AFhAm6/gYtWyTFnH
	 5OsFfkNxSG3EmIOt7wboOgvpM3ROM/mMRkLaJewPHYvTcdJlfLboIobj5VMKQ91S80
	 oZ4bXwkfum7zA==
Date: Wed, 16 Jul 2025 11:37:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm4: Provide local defines for AT_HWCAP3
Message-ID: <d8755ea7-cbec-4669-b3cb-2652d5e1fbd0@sirena.org.uk>
References: <20250715-arm64-selftest-bodge-hwcap3-v1-1-541b54bc43bb@kernel.org>
 <a717d6ee-3b24-47de-a1fc-90a4ad0a020d@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5kCLaUznQgiWpTag"
Content-Disposition: inline
In-Reply-To: <a717d6ee-3b24-47de-a1fc-90a4ad0a020d@arm.com>
X-Cookie: osteopornosis:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_033708_563428_EB7F57DA 
X-CRM114-Status: GOOD (  13.05  )
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


--5kCLaUznQgiWpTag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 16, 2025 at 08:04:54AM +0530, Anshuman Khandual wrote:
> On 16/07/25 2:41 AM, Mark Brown wrote:

> >  #define TESTS_PER_HWCAP 3

> > +#ifndef AT_HWCAP3
> > +#define AT_HWCAP3 29

> Just wondering - would it be better to add a comment that this is a
> temporary construct till libc headers pick up AT_HWCAP3 definitions.

Possibly?  We tend to be against comments for this stuff in the tests
though.  We don't 100% need people's libcs updating, if we can work out
how to get the kernel header picked up in favour of the libc one
robustly that'd be fine too.

--5kCLaUznQgiWpTag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh3gM8ACgkQJNaLcl1U
h9BdhQf/fXXinBuS1YPKnswjW+xhZEzJ4w71pBnxGflHRm2ENLBmsYG+8cavaq2V
+xjYo6AtBUlYxXMCRTTBYjzomp/8fdoorOgUL+U7BgqNSlByQyA4H5gwo4geWveo
jn/DE6zpOXxm3d/vsWFmL9i+61AoXr71YioCzO3PAB8+EBQ8bcCN/dNmX5e1ZF/z
Kk7EbZ3JWwbgquPPGQyo5PK69J6s/lsRwm8giklYJEnZ9CRh4KbLU+Fd6zhy/dlA
JneKgR66XIzLlo0WMr8z6R2yROHE/aQCNi02L+uCyGMES5So6n8+n0osoAFBlqka
x7DjDbr97QU3jsw6iVfsX5YKvzY19Q==
=7P+i
-----END PGP SIGNATURE-----

--5kCLaUznQgiWpTag--

