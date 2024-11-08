Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EAAD64060
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IV9dBjexIF72RxQbA1ITmH7KZ6VeE3Y8ys5k7iURiXA=; b=csrzuVutCaIPwJGm/yyPCgcbR5
	2J10vCqAll+xBf0xWEnfsFXoKdasMnTla+xyTULqHK8ynyqqqbJK7wOZObP0hfmGih941w6vdbQON
	bp2bSdR44MzPSUI4U58hslLsPfCrH4/nDXJH4Sa0BKIeWm7cY/PqJjJ0FGzUdfvkBwO1GYfC1OZZ8
	hbSDhbW0mu1tlH6tGJB2xbUm6TjrVKzCCIL94CesiPkXZSqDwctc6wID7Gx22f0rD5T2OseXwwQrM
	Jnk5HFCVkGcPbhFn/mhYNU8GgoBwfvKGTtRbXrMj1acgSOuYOkNTZpoSWm4UB+xw3MFBEBknKIq4R
	i2MO5t3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rtl-0000000BDGB-3YHw;
	Fri, 08 Nov 2024 16:31:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QiY-0000000AzxN-36sl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:16:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41BBBA441C0;
	Fri,  8 Nov 2024 15:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6302BC4CECD;
	Fri,  8 Nov 2024 15:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731078969;
	bh=boaP+72vGDu2N8mwMvuNKji6ZLGbovIJOVDiOZbKVDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBiZ2qTuqr9S7NXtekxKU0twe+sq9tSEwuybuTSf+SKF/T0HEKL9kxhqIxiD8jGgm
	 c9qtWy0M03r2PhtM+rTP2Y4YalWXGMNVfnjzfObra841MtWDFetrgs6EANcqUP6ebb
	 iJd/GMg50aLBZflBIpuhwNLo1iwf+CIguekcuoqTVO5ibgbzaHQH9xSWxWMT3894rY
	 T7Z3Clo7gHHpR+LiAYlfCw+fkAmwi8Qx+pmm1wLpDAu8sfEBoun5lticTf0/dBs3Yf
	 IclDEHTS1AZid/xsfFJ3BEBCJ5qo99WKEnateU/7P42EwRiGPOthZoduxEsMjcoXpI
	 fYu+eR0fmR/Zg==
Date: Fri, 8 Nov 2024 15:16:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/4] kselftest/arm64: Fix compilation warnings/errors in
 the arm64 tests
Message-ID: <704d17b9-6426-4969-82ad-5b9d71dac7fb@sirena.org.uk>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
 <3f0b7891-7f67-441b-8ba9-ab302ac57792@sirena.org.uk>
 <Zy4oT2w63WGXBASQ@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qW3xC7n+7fxxxnSY"
Content-Disposition: inline
In-Reply-To: <Zy4oT2w63WGXBASQ@arm.com>
X-Cookie: Do not overtax your powers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_071610_867617_5DCFEB69 
X-CRM114-Status: GOOD (  18.37  )
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


--qW3xC7n+7fxxxnSY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 03:03:43PM +0000, Catalin Marinas wrote:
> On Fri, Nov 08, 2024 at 02:58:34PM +0000, Mark Brown wrote:
> > On Fri, Nov 08, 2024 at 01:49:16PM +0000, Catalin Marinas wrote:

> > > It looks like people started ignoring the compiler warnings (or even
> > > errors) when building the arm64-specific kselftests. The first three
> > > patches are printf() arguments adjustment. The last one adds
> > > ".arch_extension sme", otherwise they fail to build (with my toolchain

> > Unfortunately there's a lot of toolchain variance with these warnings so
> > a lot of people simply won't see them, you need a fairly fresh toolchain

> But we should still fix them ;). I tried both gcc-12 and clang-14 that
> come with my Debian stable installation. If we see others, we'll fix
> them in time.

Oh, we should definitely fix them - it's just I'm not sure people have
been seeing them to be ignoring them as you mentioned above.  AFAICT
nobody goes on warning patrol in the selftests with any degree of
frequency like happens in the main kernel, nor tunes the warning set, so
they tend to build up in the older tests that aren't being updated as a
matter of routine.  You do sometimes get someone coming in and doing a
round of cleanups but it's sporadic.

--qW3xC7n+7fxxxnSY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuKzQACgkQJNaLcl1U
h9BvHgf/fd1AfPtGYuLGC1xc4cVPvQgobJiD1KwsSb8268zU9eJ3Ny1iB2T2u/Xv
6uvibBNVqJpnUD05wjkCtfQbFVeu7rWhSrsds4alo3Mc+1xagXENNvOkZzhv+XnJ
Ly2tqvd4H3bfMXrcW+N0Vecn381mBTEVyix4kzLqZfSYVgzeCYu6f4iwa3xOezr2
lQ4TGxy2BL4JSwyBO0FD7GWZY/hzTY5AqGfNPtRaTmxF9MwzUWzgnYZ8REayCcWN
+C8UNfEsbxNKWioGGU9vggbesKGCqE7vUIaeZ1PaIpgXb4715Btm7xtg2UUdabrD
psDKzQnyHA2SYqwnmLc7YoxfRL5fog==
=sgwi
-----END PGP SIGNATURE-----

--qW3xC7n+7fxxxnSY--

