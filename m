Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48BCD68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 00:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Fr1+23Hh6Yl0sIDoBdGEun+nW5J/zidLNymxT4OIms=; b=opHBTigZsdkTzzCq++WxmUjSdP
	sVueqJx7BL4GZDiWbXMfQ7ugqbdDW+kOhLZ03+50gPedBrVeIhMrW/K5nsgOcQjFkA5s/FpfxTfDf
	WnHVN1uqIW62qo0m4RY4HyO0szpaGSWGc2CNM9eJZOw2ohfqyFonEfkwoHLIi35RyV/vuDGWalSla
	G6smrPHigRIGzRDiTcRuZ+vzB/qak37LsztAhGg2BcibHNOIj0DlWZK/wJKcSvbw8/WUwyMIdmE28
	6v/QeFlIKcG+XAlHl3YTyrKxIjGvrIKJyoW0Bg7ohNRgj/S1pIfcKaByt82VQFX21zk0j+K85Qp8z
	w9jvXNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCTEw-00000006bwB-1zjH;
	Sun, 17 Nov 2024 00:34:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCT55-00000006ZvA-0kev
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 00:24:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8AA195C5704;
	Sun, 17 Nov 2024 00:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B1AC4CED9;
	Sun, 17 Nov 2024 00:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731803038;
	bh=gikOnfBjekSzGf6NqlY+odr2KqKVyYrQvBhQkTK3oqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UH5o4nb3MbDFI7VGAxCOF+o9Q9t+WxRpA1f2cg+TtQFgYl2KFizmYdfMVE/ji0Ho1
	 oqZZH0z849b0GxE15m+X8+SPEyrxdQQ+NKcxPOhPuiwBSda7WTDhym+vaORjmrHnfO
	 M0/I/j1Sisn3Eiu8zI97Pfn3z6gGRPkCAOMzzoz5CtWfG/0uPRqmsIHI1UDBn5NYY/
	 3qdx5aa+nLV0C0hj02e2R2X1zsNkrLUNRxmoiXoZxNPwyDC587XCRjvadQH/swR/gB
	 hoMkyTyVXupR++o8Sy4Ve/gXdMUC8n2JysUjzdX29ZwxeqbCQlkMyFRpRllM+OoO/k
	 9+XdVmWdtGYPg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 11/11] MAINTAINERS: add entry for CRC library
Date: Sat, 16 Nov 2024 16:22:44 -0800
Message-ID: <20241117002244.105200-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
References: <20241117002244.105200-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_162359_296953_F94C4A8D 
X-CRM114-Status: UNSURE (   8.30  )
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

I am volunteering to maintain the kernel's CRC library code.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a27407950242..2bfbdcad0282 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5982,10 +5982,21 @@ CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
 F:	Documentation/filesystems/cramfs.rst
 F:	fs/cramfs/
 
+CRC LIBRARY
+M:	Eric Biggers <ebiggers@kernel.org>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next
+F:	Documentation/staging/crc*
+F:	arch/*/lib/crc*
+F:	include/linux/crc*
+F:	lib/crc*
+F:	scripts/crc/
+
 CREATIVE SB0540
 M:	Bastien Nocera <hadess@hadess.net>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-creative-sb0540.c
-- 
2.47.0


