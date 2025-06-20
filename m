Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E0CC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhZVNzE39teXO2z0Tf9J/5pThBFXx8DumWYYAEGei7g=; b=hXSgfRDaHp9X7ALyavG3qC2hd/
	PapuhTGzXkScPxg3/bBnX79OVflb3icI90OrEsMJoP900Xz5obWDNnEV7dsBn6HzrtB8SZHJfPgJu
	fdwHmUnuLx1KFtQWOchWIDSsqfSqueMF9iPiDPdhSeg4CFAtS0XlKYx5e8lwjPe4Nsca0mBzrx4dR
	AIm3aaPjqKOIdSwNwKkM44rF79GtuwXSV0DdeX5CGcLSE3Wgh7RLxt64WlctUEiTFsqffEeiJv+Lv
	24ZWqZxIYADUMxTYM/uBXTfVudNofBMG0BLCh547jgOPP7atWgJ83bYrNO5Prhu+BVj2J1UwvyFRE
	ttai+/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjrr-0000000GgES-1dVi;
	Fri, 20 Jun 2025 22:05:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjH1-0000000GcFZ-1n9e;
	Fri, 20 Jun 2025 21:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2A426155F;
	Fri, 20 Jun 2025 21:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BFEC4CEE3;
	Fri, 20 Jun 2025 21:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750454864;
	bh=p+s2U0fmyhm9d55BemGKbD2X2i9CJZsBrPbvF4f3HF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ds5LwgI/bYZ6UOF1Y/q/iX9FiABAyMDbuJLEnx5x38j/VZwT3Ng9Z3m65OW2qs2fM
	 JucWLQfkRXHRF/k4xkXgc07zo5nqDSEsaGDhRAW2uKqEJ0Ya22MmmxFlNewsXkBIGl
	 G+FrikxHSQuYMlAzbqYH+w0a5m65Yj5TmMy8Wu6+YllIXCPIU1jTnIceE5RS4SchJa
	 oBIu6H2ACmQVFniDwWpxpEctn78VfYHZ2rcoLF9+LAON4EWnajq8hfdkbyH/1wWxLc
	 ATqrJrOS8V2VAvOYGKlyvJN5Nwm3eIMmt0692knVIoBUkOSjluJwa2mKRrsTgnI61b
	 ysFwAcUy8QOXw==
Date: Fri, 20 Jun 2025 14:27:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
Message-ID: <20250620212742.GB5460@quark>
References: <20250616014019.415791-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616014019.415791-1-ebiggers@kernel.org>
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

On Sun, Jun 15, 2025 at 06:40:02PM -0700, Eric Biggers wrote:
> This series applies to v6.16-rc1 and is targeting the libcrypto-next
> tree.  It is also available at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha512-lib-v2
> 
> This series adds support for SHA-384, SHA-512, HMAC-SHA384, and
> HMAC-SHA512 to lib/crypto/.  The new functions take advantage of the
> kernel's existing architecture-optimized implementations of the SHA-512
> compression function.  The new functions are fully tested using KUnit.

FYI, applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

Additional reviews and acks would be greatly appreciated, though!

As per Linus's request, I reordered the KUnit tests (patches 4-5) to be last.
I'll try to keep them last as additional non-test patches get applied.

I also adjusted commit titles slightly to match what I'm planning to use for
lib/crypto and lib/crc going forwards:
    
        lib/(crypto|crc): ((algorithm|arch|arch/algorithm):)? Subject

    e.g.

        lib/crypto: sha512: Add KUnit tests for SHA-384 and SHA-512
        lib/crypto: x86: Move arch/x86/lib/crypto/ into lib/crypto/
        lib/crypto: x86/sha512: Migrate optimized SHA-512 code to library
        lib/crypto: Explicitly include <linux/export.h>

- Eric

