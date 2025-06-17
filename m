Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50535C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 21:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxjjjHrtAQnHI5BFkgc87LjWdlMiW2XFmZbt0j/xFEU=; b=xDSrEX4AIb/d1WJx5NJZW44rJJ
	VdDSxN0OepozfRCIJWXjV0yD13ElzOidGv/0hBGVg+gqnsHmUCsURmbDUseNX0cijzPzBHcjZafYF
	zUZLHKUc4/nkuz7orQNElVUcrq84HY2NpGdLZXbLg7sGikOIpB1SxjXx/PnzhqQcSTxk18mWoml1B
	sobpb/3SlNWGz9Li1p9BZ+tbxkbG2IjmcgR/P67a/FM3IfSzX5CEcS7eHUfFBsS0lYAXCL2dK7j2N
	FxyfUau1IrEb4u8cbp39wB9BUftdNuhELjjDISVVKVgtxptRu894YAM0z3JXe9nb3UxaZ6Dtbezoh
	zqOoE2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdoO-00000008Qf8-0GIC;
	Tue, 17 Jun 2025 21:25:44 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdmA-00000008QVQ-2O2y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 21:23:27 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bMKbp4Yrtz9tCC;
	Tue, 17 Jun 2025 23:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1750195398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jxjjjHrtAQnHI5BFkgc87LjWdlMiW2XFmZbt0j/xFEU=;
	b=bDMvtzXXN0C5GyxFNxDNKnKtCdazj0QBrA/xYV+Okhn/iH7OirejIg6aVXsW1sndZQ8xQe
	i28xlx/rort7RxGZJh4KIEqdt6NqKxevSxOwnxBLRwYL8KOsLbaV41k5mSN2+bb5HexxoO
	x/YItNXqORLYyb6HzAeN2q8q9A/O4GMltao5nbl8isTlTPqJmS6saeHUco9ZgaLWZZQOps
	B0NSMFrfeapixsNnRcoQpNg2LZMDAC1LEOwysWbtCdOV/1Mc2HzuqztIfwjQdlHOKtFHcc
	5arLkohBt4aCBhK2Xcw7pP8RF33hpgolbv/sDnh6RfIGsxiZRa8v2mAdaQtH7w==
Date: Wed, 18 Jun 2025 02:53:08 +0530
From: Brahmajit Das <listout@listout.xyz>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk, arnd@arndb.de, 
	akpm@linux-foundation.org
Subject: Failing to build mainline kernel for arm
Message-ID: <s6pt2qblbwmw5uz7u27ypyyercpm4fbd7qt7qaabceasxdtd3x@jucvfmzzcueg>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_142326_796672_A00F25A1 
X-CRM114-Status: UNSURE (   9.43  )
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

Hello developers,

I was trying to build the mainline kernel (top commit
4663747812d1a272312d1b95cbd128f0cdb329f2) and came across a build
failure with allyesconfig.

$ make ARCH=arm CROSS_COMPILE=arm-none-eabi-
...
  CC      kernel/fork.o
In file included from kernel/fork.c:93:
./include/linux/kcov.h:113:6: error: mismatch in argument 1 type of built-in function ‘__sanitizer_cov_trace_cmp4’; expected ‘long unsigned int’ [-Werror=builtin-declaration-mismatch]
  113 | void __sanitizer_cov_trace_cmp4(u32 arg1, u32 arg2);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/kcov.h:117:6: error: mismatch in argument 1 type of built-in function ‘__sanitizer_cov_trace_const_cmp4’; expected ‘long unsigned int’ [-Werror=builtin-declaration-misma
tch]
  117 | void __sanitizer_cov_trace_const_cmp4(u32 arg1, u32 arg2);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [scripts/Makefile.build:287: kernel/fork.o] Error 1
make[2]: *** [scripts/Makefile.build:554: kernel] Error 2
make[1]: *** [/home/bdas/linux/Makefile:2003: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

I bisected it to commit e0ddec73fd4822d2ffe914d5ce3e2718f985276a
"kcov: add prototypes for helper functions"

While reverting the commit does help, but that would not be the correct
approach I guess.

Part of the commit modifies include/linux/kcov.h

	#ifdef CONFIG_64BIT
	+typedef unsigned long kcov_u64;
	+#else
	+typedef unsigned long long kcov_u64;
	+#endif
	+
	+void __sanitizer_cov_trace_pc(void);
	+void __sanitizer_cov_trace_cmp1(u8 arg1, u8 arg2);
	+void __sanitizer_cov_trace_cmp2(u16 arg1, u16 arg2);
	+void __sanitizer_cov_trace_cmp4(u32 arg1, u32 arg2);
	+void __sanitizer_cov_trace_cmp8(kcov_u64 arg1, kcov_u64 arg2);
	+void __sanitizer_cov_trace_const_cmp1(u8 arg1, u8 arg2);
	+void __sanitizer_cov_trace_const_cmp2(u16 arg1, u16 arg2);
	+void __sanitizer_cov_trace_const_cmp4(u32 arg1, u32 arg2);
	+void __sanitizer_cov_trace_const_cmp8(kcov_u64 arg1, kcov_u64 arg2);
	+void __sanitizer_cov_trace_switch(kcov_u64 val, void *cases);

Maybe we can do something similar to kcov_u64, like kcov_u32? But I'm
not sure.
-- 
Regards,
listout

