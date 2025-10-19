Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D60CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpQPFVXo0vDnxqJ3NWREQWVKa8ZHt4h33t/wR5g/le4=; b=FftM6BLlDivkFFoK6pV97KeCQT
	CNRojcafgk04CJOYf4t5wcd3e+J6SrQ1Dj3vqGbtiYPmqOLM+GfTK+W/mS0fvCDs7EmFnUX6lbZry
	7oI31GNG4qXgiCA5k8bB4Entxr9LxSwdlZaAKPPbTWxwTyYyHjbPWhxgJzLyM1OeNv1dkiKYC3Ax4
	HlJlBsdRbLSwfDyucF5ATSec3W74MtHzIGPHQ65y5t0Lkb6AVTnspoynRiNTII3JlyYIViQaB5Nqd
	F7LZON8tMBYHP846o79Pg9LP8pXqvN7Mspksrq8Rd/p8s4fU3N8CVocgMmLMhSUqjUnRilNYMsVtk
	rgOfi6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAVyA-0000000BBXz-35fS;
	Sun, 19 Oct 2025 16:09:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAVy9-0000000BBXd-1kVl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 16:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DAEF61186;
	Sun, 19 Oct 2025 16:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DBDC4CEE7;
	Sun, 19 Oct 2025 16:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760890142;
	bh=FoS+s2SLs1a/86XBAZ0WcyxTGfRjJzC9vcvuY3cy8s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSzKmNV5nZZpQE35pdj80lOCp8LM4F4tJMzwcpamC1HM52wkXYj5fLUcd+p3kVjBb
	 H9zyohTNWdHko6sau+nG5V8NJVBRbCDuj7QdrTmDmT/+frTTFCH5saLdVwqFxuiG9C
	 5KjqDIXvyu0UR+iaE+j5m/eGaNmZC6Taq/AqPskpLfKM2/SttDYS2ZHb2lIV0DFm8y
	 1Ht+Jp1r0WGLuCUiyOk3Nv/PxFcFdzgBc1O2VEBB7It2bVWAZWksZrEDNNwKw4YziX
	 VsAIr5Xz7HtzOyspCEZY7Gp0FGe/ReIR0/KcDt+VTfW2phqG6uA3/hiOA6EDjOxo5k
	 9jJVKfLjD9mWQ==
Date: Sun, 19 Oct 2025 09:07:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 01/10] lib/crypto: blake2s: Adjust parameter order of
 blake2s()
Message-ID: <20251019160729.GA1604@sol>
References: <20251018043106.375964-1-ebiggers@kernel.org>
 <20251018043106.375964-2-ebiggers@kernel.org>
 <aPT3dImhaI6Dpqs7@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPT3dImhaI6Dpqs7@zx2c4.com>
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

On Sun, Oct 19, 2025 at 04:36:36PM +0200, Jason A. Donenfeld wrote:
> On Fri, Oct 17, 2025 at 09:30:57PM -0700, Eric Biggers wrote:
> > Reorder the parameters of blake2s() from (out, in, key, outlen, inlen,
> > keylen) to (key, keylen, in, inlen, out, outlen).
> 
> No objections to putting the size next to the argument. That makes
> sense. But the order really should be:
> 
>     out, outlen, in, inlen, key, keylen
> 
> in order to match normal APIs that output data. The output argument goes
> first. The input argument goes next. Auxiliary information goes after.

In general, both conventions are common.  But in the other hashing
functions in the kernel, we've been using output last.  I'd like to
prioritize making it consistent with:

    md5()
    sha1()
    sha224()
    sha256()
    sha384()
    sha512()
    hmac_md5()
    hmac_sha1()
    hmac_sha224()
    hmac_sha256()
    hmac_sha384()
    hmac_sha512()
    hmac_md5_usingrawkey()
    hmac_sha1_usingrawkey()
    hmac_sha224_usingrawkey()
    hmac_sha256_usingrawkey()
    hmac_sha384_usingrawkey()
    hmac_sha512_usingrawkey()
    crypto_shash_finup()
    crypto_shash_digest()
    crypto_shash_tfm_digest()
    [and the SHA-3 functions in David's patchset]

- Eric

