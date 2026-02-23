Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9432FEEC285
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 21:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zv2z0XGXP7D6d/jafuwzxGpU8lMS+LV4KWAcWbAkizQ=; b=vcluFtcr6BEwTMa2dzClQj7Qfe
	zFkQe5uzYfmOsZ7rRj7tf2mIyWrn9JfTDNlu07u0C09Vj20zDHi3HRdejhSaelQzT5tV01xUB0oKq
	8OgNP7iXCd4uBLQStAVEKcKPGn0WeQj4+zCuhtwtOzaD/EOlYMiY5/QWOcIzpl14a8rgVk3cpIqPI
	eD8Hk/cQ6OqVvl7RiDciZP+T/0Ixpw/0lF+8LJcEEd5gNIguZRkFRL6Soeriv/anD5HRiXK0Bnqjm
	Dty+QjH543I4FjUGMRA1HpkjFStd6WANbfj+xsWCFPmuVAgDm2Bitv4lD3301AoFObUWYOWCFn7ij
	Zc11HVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vudU0-0000000148w-39NV;
	Mon, 23 Feb 2026 21:28:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vudU0-0000000148p-0Zfy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 21:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3178260131;
	Mon, 23 Feb 2026 21:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697D0C116C6;
	Mon, 23 Feb 2026 21:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771882126;
	bh=6BWCpxN467P4dyN5eoO5k0IXEao0FX3AzWwouvG6AzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQTSMin/rySHdNw1qv6QqInzrBz8ugXCsHyGhJzEBHqAJ79ihP31sS9Fh1wTaQf75
	 ktJv7aJ6Z/B306tadSuT1z4nrJD4/AuPh2s0kxtomYtDEHd16vGjEskB14S+sjn0jB
	 2IHv4vsjC+suPCFwtedKZVF0oAeIW/5mtTpwRHCBugAFAwgW1ogJ9ef3IVCAavuJzZ
	 xvXkrheuicxBxL+LLJbvi4nzFJIEEo2Teoe5XTiH2hOwUWQ0ouqZ+lowj3/wFF36s3
	 zm+1gMo+895d78oQljgJJ1zrD8etGyd+Z7wRsp+FbqOA3QR1cBnRxrhwlqdB3D5vPi
	 jivuft6R2UJUQ==
Date: Mon, 23 Feb 2026 13:28:44 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 00/15] AES-CMAC library
Message-ID: <20260223212844.GA2132@quark>
References: <20260218213501.136844-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218213501.136844-1-ebiggers@kernel.org>
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

On Wed, Feb 18, 2026 at 01:34:46PM -0800, Eric Biggers wrote:
> This series can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-cmac-v1
> 
> This series adds support for AES CBC-based MACs to the crypto library,
> specifically AES-CMAC, AES-XCBC-MAC, and AES-CBC-MAC.  The
> implementation is fully optimized with the existing
> architecture-optimized AES code, either single-block AES en/decryption
> or arm64's neon_aes_mac_update() and ce_aes_mac_update().  As usual,
> optimizations are now enabled by default as well.
> 
> AES-CMAC support will be useful for at least the SMB client and server,
> and the bluetooth and mac80211 drivers.  Patches 8-15 convert these
> users to use the crypto library API instead of crypto_shash, though
> these patches will likely go in via subsystem trees later.  They result
> in some significant simplifications and performance improvements.
> 
> As usual, a KUnit test suite, FIPS self-test, and traditional crypto API
> wrapper algorithms are included as well.
> 
> Note that I'm also planning to add additional AES modes to the library.
> This is just an initial set of AES modes to get things started.
> Notably, with the SMB client and server already using the SHA* and MD5
> libraries, "cmac(aes)" was the only remaining use of crypto_shash there.
> So it makes sense to take care of that.
> 
> Eric Biggers (15):
>   lib/crypto: aes: Add support for CBC-based MACs
>   crypto: aes - Add cmac, xcbc, and cbcmac algorithms using library
>   crypto: arm64/aes - Fix 32-bit aes_mac_update() arg treated as 64-bit
>   lib/crypto: arm64/aes: Move assembly code for AES modes into libaes
>   lib/crypto: arm64/aes: Migrate optimized CBC-based MACs into library
>   lib/crypto: tests: Add KUnit tests for CBC-based MACs
>   lib/crypto: aes: Add FIPS self-test for CMAC
>   smb: client: Use AES-CMAC library for SMB3 signature calculation
>   smb: client: Remove obsolete cmac(aes) allocation
>   smb: client: Make generate_key() return void
>   smb: client: Drop 'allocate_crypto' arg from smb*_calc_signature()
>   ksmbd: Use AES-CMAC library for SMB3 signature calculation
>   Bluetooth: SMP: Use AES-CMAC library API
>   wifi: mac80211: Use AES-CMAC library in ieee80211_aes_cmac()
>   wifi: mac80211: Use AES-CMAC library in aes_s2v()

Applied patches 1-7 and 14-15 to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

Patches 8-13 (smb client, smb server, and bluetooth) can go in via
subsystem trees later.

I edited "lib/crypto: arm64/aes: Move assembly code for AES modes into
libaes" to update the file comments to remove the file paths.

- Eric

