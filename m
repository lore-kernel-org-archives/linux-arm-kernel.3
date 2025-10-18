Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE423CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TlDf2DZxhXMl14tO2DW3avtLbr7ZlZMXA7RDEcwpHCg=; b=vfNpeiC76aJY3DaWSw0HdB52jV
	z0EZxpB6wBn7leTFeADxparMUZlWAqlk4bVGgFD87VsKodSjWES8rrj7bpE6lyTdsSQ3XwUiGoUHo
	mZxTxWNCzHlLZEQJzhra5euUCINTfYj/vc5AKIzsuQ0hGLaf0j8Pgj9t5/HZS0OurvgVTuyeIznIu
	dcsRRdb9qIJve/8adGt2EFwbQU0z85yCokSFaRmnyyIDifXyeinTdOTTKbzYz4Jl9CSNjFqy04voq
	FDHZfo6QIFznFM9opBqsJ7G509P0acA4J3aNEOOwPoYOjICo56R2o6S5f+yYPTdxrwdwgaiJ05RZ4
	4omknoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA5yE-00000009uLC-2xrF;
	Sat, 18 Oct 2025 12:23:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA5yC-00000009uKr-3MvW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 12:23:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BA394184D;
	Sat, 18 Oct 2025 12:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56B64C4CEF8;
	Sat, 18 Oct 2025 12:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760790215;
	bh=hjA+KH3Wj1C+zAvItz/eOBEiIkWyOOrmjBXeUhx60V4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=i6+etu4GXlchxqIIf4CNY0BF4g0S+LweWmngpQwuGuTvLgl+Kp2gZAGnBQI1Y76bk
	 lz0+tqkSytI8fxQQDnaaB27LQGchNg5/wy/HhledVge1Vy6Hawo5KSiW+p5OiIgC9i
	 T7WyOGJkDwmeX+TSiaZwL7dtsWGqm9JQu6uCJTEDXAqzmTVaA+BcmRjSeRNGexQQ7h
	 cdOq66P5V97BxfH/oF639P2b3TSZ9pGhxrUEjmNzler70WZqzoLYZI4EzNyTb+LrRB
	 XSZs+doDOgC7dQ4b8sq8S0846L1hUVXHfZGXTDyAfCtURmLRrVzy8CW6XuUUAZglTh
	 vT4djG9eNzW5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43803CCD195;
	Sat, 18 Oct 2025 12:23:35 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 18 Oct 2025 14:22:57 +0200
Subject: [PATCH RESEND v3] ARM: multi_v7_defconfig add /proc/config.gz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-arm-config_gz-v3-1-0de1eaadd902@ixit.cz>
To: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=7w/aD3shZMm8S2nIaaI4q8HkXYxgH0I/7K7GWxdOw78=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo84bFUXDf8xi9WnUPm10TJ71uwk3sxLZfjtFB7
 7FAxgH5IhyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPOGxQAKCRBgAj/E00kg
 cnI2D/0b15ZI37jdYTKlxu1rONqBTQJqsCCYgB4N+sRazVYVxyDoZxqZcZmw2Ls4Z6MUKQFOBRX
 a6BwkeYJTBwlJaDlSCtshtC1A8U9C/EkE/jeSdq4r65VvLyzj+ylhae63OfyxgH3wQrQkSZiWA8
 GEklNbawfl6PkdyfhyyUBFLTyjZgOGhTR1wdUjxbJUAidi0OZ798Blv/wUH0VfbglODF/HU87Cy
 aGHfrMa1GwjNoRNI8gIpl6zxFkipgAVMcu37/0JN45Lfdho3aGHXxls5MZA1G7vqm76LhVDQB4S
 8cc4LAirydGL2R9ivYJg4cup/qhu4LkzZ4tRvcrYk7NSMyIBucNedkkI8oe3l97Sg0QSZDpIOeU
 8ehTx7k/QpesIq/THLaPKzUvc0ZeoBylpCRHek7fnD72JyR0jliygGRqp7mEjBRhjRXPiUzWG8B
 PgLOBEQH75vO8dWS/9Q90s54WhYwoBmWbMuZzREaDYTNpZZ6XqjU6vMG6nrYd/ujI2SCNlRNSXH
 aLFIH6j6OUaYufulfD/V47ISvzjG77ylfMv8ztra4V1jolTNPVfj7B+KKemnIDInheSLYJTmS1x
 SK18W7VppaC3qAvGj85OJtYl+Qvr95Ou/hWcPLlQrcO9NEdbPFeLz/li9E6TAiybwCsMLfAQI6C
 pr9wSSHm7N6tXDQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_052336_899408_0200CCDC 
X-CRM114-Status: UNSURE (   9.48  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

While 32-bit ARM isn't that widespread, multi_v7_defconfig is used for
building more generic images, where having access to config can be handy.

arm64 and x86_64 already bundle config.gz, so this is an effort to provide
the same level of comfort with ARMv7 devices.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- Rebased against next-20250715; otherwise, just a resend.
- Link to v2: https://lore.kernel.org/r/20250329-arm-config_gz-v2-1-f725d331fb5d@ixit.cz

Changes in v2:
- IKCONFIG is now module instead of built-in (Greg).
- Link to v1: https://lore.kernel.org/r/20230612210208.109267-1-david@ixit.cz
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 65df4014c4a60..5180c90cb5da1 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1,6 +1,8 @@
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y

---
base-commit: f2b1f6a9f382564b1d4cf16c45e73ccccb917f1f
change-id: 20250329-arm-config_gz-7d656859ad59

Best regards,
-- 
David Heidelberg <david@ixit.cz>



