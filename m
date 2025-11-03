Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511E6CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOS9K/T4OLoTksj7BPlV7AerumR059uRf1SvkTLAQ2U=; b=i++JWI+QbKwlTrUB8YjqbX+kiK
	16UN6fNCgArEEdNHjljtrc/TPE1VF1BZPDksfJSaw04Q6GUm9rJm1bAwdmVG4JC1sZcVUi4geQfcI
	YVIRcOdk4nGcI2O6gbglS6mWMrsjkIXwq+AoXyVwlL7mNQj8yzX5K245YTlDgAy9i6pV4dV2U3CBL
	XNPpMMhlCuBxIiuBKCrzxrDO7LxEBGnxoz8tB3kXRJkctqxthJ9O2p/vr3kpxlNEuku+JxKj8YOHL
	gi5nrWc9/J4WCpySs9Om07nVZGDjX6sqQOG5J7tPifObttxK2YehZ7gfmEdGjmHhr3EB2q/ATcrGj
	BerN0KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyT5-0000000AQme-3MXR;
	Mon, 03 Nov 2025 17:35:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyT4-0000000AQmX-0lkE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:35:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F366600B0;
	Mon,  3 Nov 2025 17:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F89C4CEE7;
	Mon,  3 Nov 2025 17:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762191345;
	bh=7SPiUWAHLoxBhCTDibws7Yl4LQL2kpjtzkmha3GEf84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZPIoRglX4r3pT8cy8dscMTi86qawbrv3MJa+fb2vPFIqdcgbS1tLJRIY0AflmhIe
	 Sy2Pm2FF/x/IZnPOn1bXPQyYe1k5v1BRw7F/W6dX++MljtAEo7lvhMs0vdVj2GV7po
	 goOqZC/HJOxabG0vh3zp/lMH56AqB52EELzsh75JG/6QuusS1hV5KuhoiZcQdlZrOg
	 j5tkVOnLbNgAT8YOfYuQqpqMk494FTnyzlKO5HyvjEQ3k7M5VzyTh2dbMv/cI5GiTO
	 AoWVkPt5orwzPuPe+WabxZJ5IxTyMqQbzDeGHgmimWW8LJGZHfuybSjBahPPHkyHam
	 OeLhW9nAhB8Kg==
Date: Mon, 3 Nov 2025 09:34:04 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/15] SHA-3 library
Message-ID: <20251103173404.GE1735@sol>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026055032.1413733-1-ebiggers@kernel.org>
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

On Sat, Oct 25, 2025 at 10:50:17PM -0700, Eric Biggers wrote:
> This series is targeting libcrypto-next.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha3-lib-v2
> 
> This series adds SHA-3 support to lib/crypto/.  This includes support
> for the digest algorithms SHA3-224, SHA3-256, SHA3-384, and SHA3-512,
> and also support for the extendable-output functions SHAKE128 and
> SHAKE256.  The SHAKE128 and SHAKE256 support will be needed by ML-DSA.
> 
> The architecture-optimized SHA-3 code for arm64 and s390 is migrated
> into lib/crypto/.  (The existing s390 code couldn't really be reused, so
> really I rewrote it from scratch.)  This makes the SHA-3 library
> functions be accelerated on these architectures.
> 
> Finally, the sha3-224, sha3-256, sha3-384, and sha3-512 crypto_shash
> algorithms are reimplemented on top of the library API.

I've applied this series to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next,
excluding the following 2 patches which are waiting on benchmark results
from the s390 folks:

    lib/crypto: sha3: Support arch overrides of one-shot digest functions
    lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest functions

I'd be glad to apply those too if they're shown to be worthwhile.

Note: I also reordered the commits in libcrypto-next to put the new
KUnit test suites (blake2b and sha3) last, and to put the AES-GCM
improvements on a separate branch that's merged in.  This will allow
making separate pull requests for the tests and the AES-GCM
improvements, which I think aligns with what Linus had requested before
(https://lore.kernel.org/linux-crypto/CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com/).

- Eric

