Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F75FC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtAvNQxfZW26Yah6zEAm9bL8Su++Y6XUEYcAUfHI6hg=; b=SAYuBERHikZa7s7JuRbsj9jwm1
	3TgWo2WEyNoEth5WxW5VKx3gVHs4SQkTEtWmz9irfvTDk7gtQADoEtbwDBOs5AN+vXZszPy9Af1RK
	lwRL1Cv0XTz9ICXLE14+qy9GaMQF8y015e9ywQv3lUrfF8Cla0W7DZUEKeBLxNODLg79xOmCRvewD
	AbF2fPrDgwYl+YDrolvoHAFtwChXDeImQHtdZuaDsLmRA/+a22SaZ9Efp9x+Usl2NNN1mwoYsSGdE
	dCU/CvGSwnhys96geZo0LWEUl2PhdPNtJrat0LvGUnFXEhYyiGjx/f/IP0Qtw0qyh/hIE2tEIbHhE
	SVXQYTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRf8F-00000008Ym0-3UHx;
	Tue, 17 Jun 2025 22:50:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReoc-00000008Vs4-1f9d;
	Tue, 17 Jun 2025 22:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 264994A821;
	Tue, 17 Jun 2025 22:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF370C4CEF8;
	Tue, 17 Jun 2025 22:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199402;
	bh=oGJq6YZzLbO82TcEMZLZBS9E98OIIOd5KDDOCIIYowQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SovLzznFPfIAEgcoGd3wa7ftl9jecC4+XnxcYbmljKPn6KsHB6owxneOsiWiHlnab
	 muiKIw9awT6KzPqUeNlzqPMNRQ6FYy7/UhXGHPM/wLDCfc1FPzhQZtrSQX6W5VQKa4
	 50B2rUTWfZHWORPDSaKSt4nf8HFzuFx1dUcky6sSdjuVTg5jP3l3Ie8z4zoxN0BeIB
	 5vJahEvic3FD72FGGK9qwYIGiNTNyNAnjg9FNwA98XjMM+3bCyH7NImzGI7tl4fW1C
	 By1EilFtNRcoK8uUYNAou3W+ESJ441BuamWF8ppNnSTp3K+Rnnx3FCX2Vt8euhkRiM
	 JB91sT3DxJ9UQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 9/9] MAINTAINERS: drop arch/*/lib/crypto/ pattern
Date: Tue, 17 Jun 2025 15:27:26 -0700
Message-ID: <20250617222726.365148-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617222726.365148-1-ebiggers@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_153002_460158_494A29AA 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

arch/*/lib/crypto/ will no longer be used, and its contents have been
moved to lib/crypto/.  (Well, except for a few .gitignore files which
are intentionally being kept for a while.)  Therefore, remove the
arch/*/lib/crypto/ pattern from MAINTAINERS.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..8ca374b24a806 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6408,11 +6408,10 @@ M:	Jason A. Donenfeld <Jason@zx2c4.com>
 M:	Ard Biesheuvel <ardb@kernel.org>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
-F:	arch/*/lib/crypto/
 F:	lib/crypto/
 
 CRYPTO SPEED TEST COMPARE
 M:	Wang Jinchao <wangjinchao@xfusion.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.49.0


