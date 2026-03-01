Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4298BFD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OzOnvSf+c47GyCQjthM/O0b0Nbl1+cPX/Q1HbHy5Htw=; b=BYNwo0TqzL+zbh+z+L2YAn92mv
	HNXmcaBXvk+uIQVi5grUw0sAsoP/YgQsiusmytBJniW/DsEAdpKtMR+uJGnnKf0ziV4oSTHpD7Jku
	3RyzoTT9PC249DTraH4J2QR/RJ0XPSr8RQt6dAC/07Fc/Afpm3zStt8uubVI8r9JYdUnHnZCAdCAP
	sE2qOVU7zFgoaMYA56JefBjeELl88R/r4HAy6jrYYIM4D8xLC3ipSplkBGJt4+lKSlemnN8l9fgNl
	7tQrIm/Krw+YtUVmOlfjvI+BPnj9QvNOtCMBKUdNsz5LPq+84mVZhvMtbmTKGXBM4F9vqu/OLkTzO
	xfxj1fNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVj4-0000000AaGY-49Fb;
	Sun, 01 Mar 2026 01:36:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVj2-0000000AaFD-413Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FD5E40B7F;
	Sun,  1 Mar 2026 01:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F77C19421;
	Sun,  1 Mar 2026 01:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328964;
	bh=o8QrnyXx5YcxW+HWTjGYCHtVrysbfGeXpzhFdGiZZJw=;
	h=From:To:Cc:Subject:Date:From;
	b=TmpEkmVLeRX5EGm3U8/LrfQy6/1E31LEuzhH+2n6CnHLW6h947oah5JgdL1FPLQ1M
	 BEHQL7b7pFouA6gI26X2LhppY8Bfu3BiteIh30JzLMhuObUr66kS9PHEVFd1itKbFS
	 OIUhGbpcZ/ebf8pz/PoRkzEW3BL5Ag6lcGOtJO4UdBD2Yoqx7Ia4vTMBzloHN66H4j
	 SqXCBO9Dk7cqbvbGbKzsZH4u5V2E0Cs2uM7MNwX6cGzet/mlP4hTHcbYrBS3d5Zelm
	 vm9ehSs+fUfV/CP0Br5nsEi9TGbWrNjGa4px/AGgkjAcc7tZGZB1oYsikpUmHKF8zQ
	 99qg4QcYALGLQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	elver@google.com
Cc: Boqun Feng <boqun@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:36:02 -0500
Message-ID: <20260301013602.1695886-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_173605_011419_E071964C 
X-CRM114-Status: GOOD (  15.33  )
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From bb0c99e08ab9aa6d04b40cb63c72db9950d51749 Mon Sep 17 00:00:00 2001
From: Marco Elver <elver@google.com>
Date: Fri, 30 Jan 2026 14:28:24 +0100
Subject: [PATCH] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y

The implementation of __READ_ONCE() under CONFIG_LTO=y incorrectly
qualified the fallback "once" access for types larger than 8 bytes,
which are not atomic but should still happen "once" and suppress common
compiler optimizations.

The cast `volatile typeof(__x)` applied the volatile qualifier to the
pointer type itself rather than the pointee. This created a volatile
pointer to a non-volatile type, which violated __READ_ONCE() semantics.

Fix this by casting to `volatile typeof(*__x) *`.

With a defconfig + LTO + debug options build, we see the following
functions to be affected:

	xen_manage_runstate_time (884 -> 944 bytes)
	xen_steal_clock (248 -> 340 bytes)
	  ^-- use __READ_ONCE() to load vcpu_runstate_info structs

Fixes: e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when CONFIG_LTO=y")
Cc: stable@vger.kernel.org
Reviewed-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
Tested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/rwonce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 78beceec10cda..fc0fb42b0b641 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -58,7 +58,7 @@
 	default:							\
 		atomic = 0;						\
 	}								\
-	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
+	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.51.0





