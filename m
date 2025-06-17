Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966BEC71155
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=030eCz8jBig573BuwdGCPTqL/6INxvqyrxLRfIdAfKE=; b=3fHdyIxeWkRunGOcolYvQqq0YH
	Lsv6ayauIAy9Xdi4SWjYGetjlJA/RtJHPIeK1gEoAQyo++kfwCX/a2twDxqDX645EurL/ekkgjqGO
	WGwERRaHl7WCrlX448EG7o41zrz+I+aqJiQglSrE1qiRZPB4woobjrKyS4tby1e/4dGK+6H4a0KGf
	EEyd5f2PRaX5C3aT/CcdDTD7yR0wIwrvBa/OB3HzkNUgJdPLK1Cpr4zc8B2dr9M7vWvjhTIg6Pj9c
	NLhH4OLVKJURGq7TdC6jK9bPvNfjH6f0WS1ZmBRQSsEJjrQMKzuzygMImfKQJ+kRYUGuqxgxo6Goy
	9ohcvV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPX3-00000006K7k-24EL;
	Tue, 17 Jun 2025 06:10:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPSE-00000006JhK-3IyN;
	Tue, 17 Jun 2025 06:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EED45C5E48;
	Tue, 17 Jun 2025 06:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48056C4CEE7;
	Tue, 17 Jun 2025 06:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750140353;
	bh=NdEJIIDfmHJ1ATQaLMe0WV6YWvExdcsSuFGjNOOoGIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3BZtawfFfNAxwNgYqwerTEy2C2JB63EFa3FCEVVyQ9GQhcoMPbEk90oxtVULSrjZ
	 L4eNUIVXoeP7+sgk9qm9fL/7N9lrcvz3wrDkQhBN4eirAG/nDTfxJx7xOqAMZ1VgS6
	 5fqwCEiW77gZ6yz6TlaZ0GnyCwpW++sVv659hwnTUhwaoZBHhcd+8PrRm1Nv/m2V1O
	 KABwq8oVHcxJ9HzYIb7Cawz4eu+RTNeVyNL2Rw3pncUGQC7rpFerSeUw6hnMMa/snk
	 9Cv2iWNRtYVIqDXdtVY605IgZBeq+T8VN/Q6zLMjOxWF1C3ScW6/2SHncDPDBjKk2u
	 fK3nx+USjN5CQ==
Date: Mon, 16 Jun 2025 23:05:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
Message-ID: <20250617060523.GH8289@sol>
References: <20250616014019.415791-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616014019.415791-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_230554_882182_12A49535 
X-CRM114-Status: GOOD (  11.62  )
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
> - Tests are KUnit tests, and they are fairly thorough (more thorough
>   than crypto/testmgr.c) and also optionally include benchmarks.

An additional note on testing: I have scripts that build the kernel for all the
arches that have arch-specific code in lib/crc/ or lib/crypto/, launch them in
QEMU with various -cpu options, and gather the results of the tests and any
other issues like warns or panics.

I'll get it into a sharable form at some point.

As far as the coverage of the arch-specific code in this specific patchset goes,
I've verified that my testing strategy covers all sha512_blocks() code paths,
including fallbacks, on arm, arm64, s390, riscv, and x86.

The two incomplete ones are mips and sparc, where I cannot test their optimized
code paths in sha512_blocks() because QEMU does not support it.

Still, I don't expect any issues.  That code is ultimately doing the same thing
as it was before for SHA-512 block processing, just integrated in a simpler way.

FWIW, my policy going forward is that any new arch-specific code in lib/crc/ or
lib/crypto/ *MUST* come with QEMU support so that it can be tested.  It's only
migration of existing code (usually from arch/*/crypto/) like this where I may
tolerate not being able to test it; that code gets "grandfathered in"...

- Eric

