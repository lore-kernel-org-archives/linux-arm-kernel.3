Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB74CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ilThKkB9WvCKq5FZp5MfmjxtGvtaKq8BAl5toqC3268=; b=PlUtXWou7Ls8csPc9IawKWQZM+
	Co2rr49fYFVgciZwtMidHpu+WV2BogdcHaA60df8VTSDCoub6gltXOvTev9vdOUasQ+1wH7cJy/Y3
	14WojoDEBhoe//PBY7T8KxrEJ9nTDHos3rPOjvJhaXKJfwMb0+v5JJoJqyZ+7IX2RJ7UxQYJKqnHu
	UExMunqaoGHOKTer6DRjgjF1XJ+acb53xqX0H44Nzlc5h3wtUsIsKmkH26BWEpxv9/GFqXfCN1qs+
	lkLQJoXI2nh/rpSIkv0iGuaz6a/8QV5TaLQ59fmj//9/9md5aHpLAQsQCCxBwAMpSpGj2xnhU/efe
	MthlgOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTLtG-00000008tXr-3s9t;
	Sat, 30 May 2026 15:46:22 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTLtD-00000008tXU-0LNs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 15:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1780155972;
	bh=ilThKkB9WvCKq5FZp5MfmjxtGvtaKq8BAl5toqC3268=;
	h=From:To:Cc:Subject:Date;
	b=wIty/s2rPe8/MPWtYYUIP9eXzk6OrHz1kRu+aqNpsXRJofHgssoosZ7zdmjWrv5i8
	 AmxjVgf2L4OosLWjmIRh6WzJZcNk2SoRezw2opVWF7N+znceUQwGS/bp3eqYwMo6DS
	 GZQMBmZDtVr0HHvICOxdCzSADRstSbDYiC+iypY8=
Received: from LAPTOP-JJ91J38E.localdomain ([222.125.130.99])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id B89BCE76; Sat, 30 May 2026 23:46:09 +0800
X-QQ-mid: xmsmtpt1780155969tp6b9r6cb
Message-ID: <tencent_08845B64E5F38EB7FA1779982A071AB4A607@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XIq5n+/XvMRMRIkQ5/XvU5XffPlcu+zegeLaEElrr7GQKhI1EMN
	 ua7TU82ORW2Bc11eRPHjdJZ7+hjyIlUGSmvLfJzhnB9BwkF9lHH6v6TtJ62pMVBT98JzWrk7Kcpq
	 0Z/JXUdRosiYyOio1u/OIXTwJ9CQCBYygFZGkHS4Xthd/iX1AuMjeslWfayBnoZkJ9wLzUctWO7A
	 U2NMIAcc0YL1xG4DmB97nH7/1e4/OKhDhRNG37SZ8blcsWSCpUoKgG+X3JvGtgCGnr5pL1qK60Uz
	 hFDZ0azg8cLJrTqSs5JIeSgc7nsZLDyqeGzKPIAuhjRHfGe9KEnEmtzpNKiAvvF25NHmDI9iCn1p
	 IYul+DNYeqPEpH2udXdHw+dM5MSg+2JYKrDgNUu3ERKXh+8sG75sEPqiEW8uXT3ZO75zCtPy8amW
	 blTsnLkBwMRybXHe8GJGp3e4IlZvM0Vrhya1sTl7XeaqQxEzfT5dI6hZDT1EmAFBuHiu2Y1tiu1a
	 vtwGp/mgnqJT0CM2RftLD3FplFdVUCb9rn0XiDjdoC7xsN0IU4KtMzGYT7AzizUU9fKWTIRei9F7
	 hrBZLMiitibD+a8i36UHeTY0u6U/1oUXxtb7t7I3wTV1PeHJdotUcKoY3Ajp9d6FoXYlie77RZp0
	 9KOCRBtdZOwS2jvspvs0Zcbk3jo6MmOtdggbLO5cp+X/YTeCjnPIn5DDFf+5GLZ14ui6nVDRUB5W
	 LarKPeD694U/DokZKcB0ST5SfXj1NxeTiPwf1QhZ3Shpen1ElU0qzsP5OyvA4k++BIGdl+SU719/
	 UqFZDt8oUwofCGoN3OupfDQpfuORItp5/Vy9mgYok5NyiXvoMpadAXdowZYmTCkwO1f/sBnU6Sg+
	 v6YgJ/Yqoec8mMtrNtqo4eQvq6vqM4EnOKaqpyR8oI7q/PzqjpkwDIBHOUQyFmegGHxX1FpE9/v7
	 RsLAuSuvETZYRk+M6tsv+tSgw0E77BcpBwyWO5ybHB6bjPBsmd5KMHQ3WbLEieE8K2GT+7QsRt7C
	 DOYmiHqsWfz3TyjB9W5z0G/hITwmq1uBCs1HmBmMRx9AhQ0gJ4AIcCTPbjS8w44j35DQm3sULJ7k
	 4sag9EoZN9XdTkFYo=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Egg12138 <egg12138@foxmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiao Junzhe <egg12138@foxmail.com>
Subject: [PATCH v3] ARM: module.lds: fix unwind metadata for merged .text sections
Date: Sat, 30 May 2026 23:46:01 +0800
X-OQ-MSGID: <20260530154601.2409511-1-egg12138@foxmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_084620_172325_E3B3543E 
X-CRM114-Status: GOOD (  10.40  )
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

From: Xiao Junzhe <egg12138@foxmail.com>

Commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN,
and related macros") made scripts/module.lds.S merge module input
.text.* sections into the output .text section.

On ARM, the paired unwind input sections keep their original names.  A
module can therefore contain .ARM.exidx.text.unlikely with sh_link
pointing at .text, while .text.unlikely no longer exists.

This is a valid ELF relationship, but ARM module_finalize() does not use
sh_link when registering module unwind tables.  It derives the target
text section from the exidx section name instead:

  .ARM.exidx.text.unlikely -> .text.unlikely

The lookup fails and the unwind table is not registered for the actual
.text range.  This can make module stack unwinding fail with:

  unwind: Index not found

Keep the ARM module unwind output names in sync with the text sections
that scripts/module.lds.S now produces.  Coalesce the .ARM.exidx/.ARM.extab
section associated with .text.*, into the
stable output names expected by the existing ARM module unwind code.

Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
Signed-off-by: Xiao Junzhe <egg12138@foxmail.com>
---
Changes in v3:
  - Apply the ARM unwind section coalescing under CONFIG_ARM_UNWIND.
  - Remove quotes around linker-script wildcard patterns so GNU ld expands
    them correctly.
  - Use conventional linker-script wildcard syntax, i.e. *(...) without a
    space after the wildcard.

 arch/arm/include/asm/module.lds.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/include/asm/module.lds.h b/arch/arm/include/asm/module.lds.h
index 0e7cb4e314b4..1d56c0375c18 100644
--- a/arch/arm/include/asm/module.lds.h
+++ b/arch/arm/include/asm/module.lds.h
@@ -1,4 +1,16 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#ifdef CONFIG_ARM_UNWIND
+SECTIONS {
+	.ARM.extab		0 : {
+		*(.ARM.extab .ARM.extab.text .ARM.extab.text.[0-9a-zA-Z_]*)
+	}
+	.ARM.exidx		0 : {
+		*(.ARM.exidx .ARM.exidx.text .ARM.exidx.text.[0-9a-zA-Z_]*)
+	}
+}
+#endif
+
 #ifdef CONFIG_ARM_MODULE_PLTS
 SECTIONS {
 	.plt : { BYTE(0) }
-- 
2.43.0


