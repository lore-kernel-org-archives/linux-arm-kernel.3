Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90400C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rWVDv20WN9muLvJk6P1Ogiad9qsyKKahGu1NwwsiL6E=; b=Ab22zda2eMzbRnjPOcj3pka3Ad
	Br+8jW3hrGsWI1u4BQS3bBtiGLKvBJ17rg/z7zaxZSOVHxqP5ZeWitxeOspgzzF8H1iF+s3huJ1m6
	mzsj+ZO9l9gWWgTG2IYMRWIEPHP2tn7YDTy2YddJmDZEc604Hik92aFhcJ7POiLRO/cpf0V+/2U21
	pMRmKHybtRqXi46OKOLcsOZ6YEXYjcZwGosnUWpe78eFDcbMVYu7/INtUirQpMBmg/ZF8gxX+q+AF
	UyE5xhbvYJ1cW7Miz5Hrwe9k++meqJkJ9Z+Jl9Q6zB5bgm7DnKqG0rBTqHLbvgEZhIes/E5aw1Mr0
	2BVa0AwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Npl-00000002ylT-1QZ8;
	Mon, 14 Apr 2025 17:43:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Nns-00000002yGg-11YM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 17:41:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1F416116E;
	Mon, 14 Apr 2025 17:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905B8C4CEE2;
	Mon, 14 Apr 2025 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744652463;
	bh=JGtuDrAIZbqWDfcYpvFO724uSw25Op9JJywY8Ih08pQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QDKMhpd2GMCOX6pmZd5WG5+sNI8cSFZlUwiTOyQTghliWIWnz1LTl7DUDAd3Ja1+j
	 dS/IVSK5DX1qAUp3FKnScd6WXDWbNME0S7g6cD2qqoDzxOmHgyPB7s8KNUBxUqBf27
	 /+nWgkX5EUubaQshiKQFGIFOJhzaeD1EzatCirxvBpEgJ7fJx41uyq+FqQaM7dM36W
	 vQp1DBWopHfvXybzUG3n+lr/dKCfqgCouN7rCNCbIl+8yyr66QuY5Ir5+YErPuVjud
	 ODFG1sR8NjKVzlqXT1k7Zd3/Rpkh4aQXrZRx7z01GDFmtfN/x+HLXknS5yXPF7mkBM
	 gumiLvCNeUwBw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] arm64: Kconfig: remove unnecessary selection of CRC32
Date: Mon, 14 Apr 2025 10:40:18 -0700
Message-ID: <20250414174018.6359-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Eric Biggers <ebiggers@google.com>

The selection of CRC32 by ARM64 was added by commit 7481cddf29ed
("arm64/lib: add accelerated crc32 routines") as a workaround for the
fact that, at the time, the CRC32 library functions used weak symbols to
allow architecture-specific overrides.  That only worked when CRC32 was
built-in, and thus ARM64 was made to just force CRC32 to built-in.

Now that the CRC32 library no longer uses weak symbols, that no longer
applies.  And the selection does not fulfill a user dependency either;
those all have their own selections from other options.  Therefore, the
selection of CRC32 by ARM64 is no longer necessary.  Remove it.

Note that this does not necessarily result in CRC32 no longer being set
to y, as it still tends to get selected by something else anyway.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

Please consider taking this through the arm64 tree.  But if it doesn't
get picked up there, I'll take it through the crc tree.

 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08..14073b0094c1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -132,11 +132,10 @@ config ARM64
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select CPU_PM if (SUSPEND || CPU_IDLE)
 	select CPUMASK_OFFSTACK if NR_CPUS > 256
-	select CRC32
 	select DCACHE_WORD_ACCESS
 	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select DMA_BOUNCE_UNALIGNED_KMALLOC
 	select DMA_DIRECT_REMAP
 	select EDAC_SUPPORT

base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
-- 
2.49.0


