Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54A8C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 04:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mxtOTKYXM9++EznKJFw0LH+ZQbbA0koCKCRQD8Qu+g=; b=nHQ1oiZi0S9eCjIjltYo88UFRV
	i27596Rg2OMsRjqAdzkOEAIN3A1ZrCP0L/wWa7EGAoPWeCWIB3Y1F32aDZdueF8QdX/mDEX7a0zsW
	BwIEz9YMTXgh4NSzSXHEXFDKB1K8CGXh7uPNo4b58VgMUiR4lGUrj5zQsllYWHsLuPnYfYF+PRLT+
	yBGcDKNc1+kh7gMLeRqt9ZYxLg15m4fG+Rxmj++rr3xf8XEb0d9DDk9jsKaMII5ZKtJJarW0Wh3Mh
	iNavnJNt9/35N/gH7jSt416fEz5WIovyRBaQ0toHYNhA/JC3GkDKieUY+aSACo/3lwN1kMinJKk2X
	JkMOVXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjskB-00000003EU5-2l2G;
	Mon, 17 Feb 2025 04:28:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsea-00000003DFg-1Ihh;
	Mon, 17 Feb 2025 04:22:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40B401CE2;
	Sun, 16 Feb 2025 20:23:03 -0800 (PST)
Received: from a077893.blr.arm.com (unknown [10.162.16.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4192C3F59E;
	Sun, 16 Feb 2025 20:22:39 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: steven.price@arm.com,
	christophe.leroy@csgroup.eu,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 3/5] docs: arm64: Drop PTDUMP config options from ptdump.rst
Date: Mon, 17 Feb 2025 09:52:18 +0530
Message-Id: <20250217042220.32920-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217042220.32920-1-anshuman.khandual@arm.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_202244_397950_7B29CEF6 
X-CRM114-Status: UNSURE (   8.25  )
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

Both GENERIC_PTDUMP and PTDUMP_CORE are not user selectable config options.
Just drop these from documentation.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Suggested-by: Steven Price <steven.price@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 Documentation/arch/arm64/ptdump.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/arch/arm64/ptdump.rst b/Documentation/arch/arm64/ptdump.rst
index 5dcfc5d7cddf..51eb902ba41a 100644
--- a/Documentation/arch/arm64/ptdump.rst
+++ b/Documentation/arch/arm64/ptdump.rst
@@ -22,8 +22,6 @@ offlining of memory being accessed by the ptdump code.
 In order to dump the kernel page tables, enable the following
 configurations and mount debugfs::
 
- CONFIG_GENERIC_PTDUMP=y
- CONFIG_PTDUMP_CORE=y
  CONFIG_PTDUMP_DEBUGFS=y
 
  mount -t debugfs nodev /sys/kernel/debug
-- 
2.25.1


