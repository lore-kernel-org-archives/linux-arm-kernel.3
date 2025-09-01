Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DCDCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orrZV8BgljpRok2XNuKDuddPobJ4kJErV/0v8tbU/Sg=; b=WV7g8bqzIcblEnHCD0nTfoAUla
	3nJfxP0BU8UTfO+yYI2RUuI49K24d+FuluEv462wTlVQfU7P6uPETUnrQKpBeF2/0wGr4CeNxwvDu
	euInjgGSIpCbPfEuuO3Nd+QInhxO1jqO++PtiPfdRS1mQna9OIFUWrX17Khb37ZeYLoVA6dUfkfOe
	cOe3VKmtsBf1Ubc1cOMMRE9ABD808HuQW0JaUzh66LLYsStuMoIKJY5wxiLrxTfiowL5SxW7SE6B0
	AbCB0ICyNiagpEDluQvqQ6vMiCGTKapIdw9K0MElCChzE9bQsbw4zKDtZ2HzD16pVMP5c102xqYpQ
	MOGJnRaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFGF-0000000EYSE-0uo1;
	Tue, 02 Sep 2025 00:52:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB0n-0000000Dlna-14Me
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 20:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=orrZV8BgljpRok2XNuKDuddPobJ4kJErV/0v8tbU/Sg=; b=BYcqV4m/QNxgwb38nYW/BoBaJf
	zsrQbkGlyvFBkmBPzUwcKu4oI5JK6L7H3H7+zpMohZ8GL8qwE6MqrqxEMXFxsJdKFJpO6jtza//4o
	DBrlt7j4rZNn34WMyXzPoqgMLJhRzK0LGVwiMqlFirZJWzF657FNlVo8pMMIEst22RV/VUHZtGoqx
	OUjXIx5qVYHZhYWsODhnmOEcJ38tZ4yd+dVyjSRuYBXYbtvhbTmFD1I6VIq7hfyGsLvOHrYs+3osM
	YW0KpHruD7E9FHqnuWjaxCw2CpgxH6sByjdp5QNNZY1vmXEbKzkK9rfnBWGKS4cLFen4s2PjaJaw7
	4WMbk72g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB0h-00000003rpW-10V1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:20:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B5D6451D0;
	Mon,  1 Sep 2025 20:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AD7C4CEFB;
	Mon,  1 Sep 2025 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758005;
	bh=JTwVCxO7VQKt0pRSCgeHeHvmX5quhsNXXzZV2f26Bs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EHQUaFNi4blbX5PTf7aLd/PFviWGJZSHnriTKZcM4f5aizDg/DZbXpaXL6iuDApof
	 QNpM6udN3UQwiCu/HyvhXSUaOX55V+3SkCyOZmubMBBzBJZb0iJtbBBBPk6xS7flRN
	 JY5pAM/vhJ9JKqTgmkfaYUTnh0e++XI7Ds8kCVPwyE0AMjbqOnhoxfDYWg/mTAIt6i
	 JaW/NRdzgOkpDOmlj4zKTj8dG2MGdbxU5NbFyGk8Z3O2kGAlFymWw2I8HK2CGsIbjZ
	 qlgqW6m3ZsNwGLAIpLghUxEceS+rA8Ha4rNV+DCRZXDyedqOCd58DWdqNXIYtzpnY8
	 xYA+XIk3l3CEA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 6/6] wireguard: kconfig: Simplify crypto kconfig selections
Date: Mon,  1 Sep 2025 13:18:15 -0700
Message-ID: <20250901201815.594177-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901201815.594177-1-ebiggers@kernel.org>
References: <20250901201815.594177-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_212016_025569_F2E3027A 
X-CRM114-Status: GOOD (  11.93  )
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

Simplify the kconfig entry for WIREGUARD:

- Drop the selections of the arch-optimized ChaCha20, Poly1305, BLAKE2s,
  and Curve25519 code.  These options no longer exist, as lib/crypto/
  now enables the arch-optimized code automatically.

- Drop the selection of CRYPTO.  This was needed only to make the
  arch-optimized options visible.  lib/crypto/ now handles these options
  internally, without any dependency on CRYPTO.

- Drop the dependency on !KMSAN.  This was needed only to avoid
  selecting arch-optimized code that isn't compatible with KMSAN.
  lib/crypto/ now handles the !KMSAN dependencies internally.

- Add a selection of CRYPTO_LIB_UTILS, since WireGuard directly calls
  crypto_memneq().  This gets selected indirectly by
  CRYPTO_LIB_CURVE25519 and CRYPTO_LIB_CHACHA20POLY1305 anyway, but it's
  best to make this dependency explicit.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/net/Kconfig | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index b29628d46be9b..ac12eaf11755d 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -74,28 +74,15 @@ config DUMMY
 
 config WIREGUARD
 	tristate "WireGuard secure network tunnel"
 	depends on NET && INET
 	depends on IPV6 || !IPV6
-	depends on !KMSAN # KMSAN doesn't support the crypto configs below
 	select NET_UDP_TUNNEL
 	select DST_CACHE
-	select CRYPTO
 	select CRYPTO_LIB_CURVE25519
 	select CRYPTO_LIB_CHACHA20POLY1305
-	select CRYPTO_CHACHA20_X86_64 if X86 && 64BIT
-	select CRYPTO_POLY1305_X86_64 if X86 && 64BIT
-	select CRYPTO_BLAKE2S_X86 if X86 && 64BIT
-	select CRYPTO_CURVE25519_X86 if X86 && 64BIT
-	select CRYPTO_CHACHA20_NEON if ARM || (ARM64 && KERNEL_MODE_NEON)
-	select CRYPTO_POLY1305_NEON if ARM64 && KERNEL_MODE_NEON
-	select CRYPTO_POLY1305_ARM if ARM
-	select CRYPTO_BLAKE2S_ARM if ARM
-	select CRYPTO_CURVE25519_NEON if ARM && KERNEL_MODE_NEON
-	select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
-	select CRYPTO_POLY1305_MIPS if MIPS
-	select CRYPTO_CHACHA_S390 if S390
+	select CRYPTO_LIB_UTILS
 	help
 	  WireGuard is a secure, fast, and easy to use replacement for IPSec
 	  that uses modern cryptography and clever networking tricks. It's
 	  designed to be fairly general purpose and abstract enough to fit most
 	  use cases, while at the same time remaining extremely simple to
-- 
2.50.1


