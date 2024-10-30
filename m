Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DB7D5CCB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUzm3iOgGmyjFGkOgYhiwc8Vi6QzfsnUah2xeQSmRA8=; b=nvLep4OlGfl9ngjBZGmGt+FSB5
	3kEqP6mzr8XL9U4Ri1kGX616fFjas5jGHB0VC1jl4fhOJP9dFw+D7+GgF0R3RokfAClcj1OpuALVi
	BVFlxv698znzv7XVvPs8DQlGFyF9Z/Qm/83EnXKbFmWVLIV4Xzdh52ynqgsotwGJvHNRLpSVoPpXE
	P9tvunEC0q+JACXbgaK+jiqJa0/KII1QFwcunhnfvlJsMfd1biJM0VeSjA/P7OzYRubLYZlu9uiZB
	phnDdx6KA8C51Etkr/QsxCGd5TNoXZ/RBR/oufATHYC+Po6OPSIygaSOgWcoZOFVRhuALs7jplslU
	yPcetlKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AwL-00000000wTx-2UL3;
	Wed, 30 Oct 2024 15:48:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AoL-00000000uSc-3Ss6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:40:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4AC83A414D1;
	Wed, 30 Oct 2024 15:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28559C4CECE;
	Wed, 30 Oct 2024 15:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730302840;
	bh=FN01wAAM5D8ZMfrYQkBkqRMg6r+p3qmFRREh7tSlgYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dmaP/4CBao90I3Fpz3A6RkeO3fqUrBc0oqdXmCYtUTHBPGt2x8hh2co1r/v0XiwIT
	 rVBpFI1RevLqZXLsQEgY6fTb0F1agHMt8knWCz9qaPOU7oVIPj9cDU1LOMvw1sc+e4
	 UCXaIRmq42a8RNk9HAs7EG54w3cFAv8HsgjWjSqutuFLa3wKmsFEKq1Z9thVHwkDUy
	 VBKkW1J4cJSs8t51Jlx8EHLgVM1mj0y1UPRb2epv2wJo9nXdgJPJTtxCVUueQhsNTD
	 GSV+KPRvJv2vVPXNeMNC21BtmxA1KzG/+lyNhQfWy+45zyPDF5EDE4iTd3sJZvYweL
	 kQyJEIUGjz7/g==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 15:34:49 +0000
Subject: [PATCH v2 4/9] arm64/sysreg: Update ID_AA64ZFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-2024-dpisa-v2-4-b6601a15d2a5@kernel.org>
References: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
In-Reply-To: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FN01wAAM5D8ZMfrYQkBkqRMg6r+p3qmFRREh7tSlgYo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIlNkn1v+3TMugRaozhq/4idLPqH9dYXDmZSSjXgF
 mvI8qvGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyJTZAAKCRAk1otyXVSH0HUYB/
 97EFuVEk+UlGSqdYuXJbRyWltmlzHR9eqszm9kMl95KEEbUNMB3WO0Tktucy03Ciw4VrvbWon6ttDa
 OS1t4TgB7uvEu3FCtBwBcg6ywrIKyj11U8S+ybag36mTSf24aobg9cf4xhE5O9snXvFaM6/h+tWMrb
 0bYARjvx/n7F20LSfLOppiglAfHrQ6GAf+jPYKUyvgvAse1XKSqLNSlj4GJSYxxp16LHZZDDQDtdi8
 9HnoqZvlg+Z48oMaNEPVyFFlcUryQbbB8HG/GV8NXD9qSBA3eqOdB3PMIF9TGFwVyDc3tRVAuxbw2w
 aYfCCt0yyy8EzvUpJRYSp2S7JZ5UyT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_084041_958924_A7CE7129 
X-CRM114-Status: UNSURE (   8.39  )
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

DDI0601 2024-09 introduces SVE 2.2 as well as a few new optional features,
update sysreg to reflect the changes in ID_AA64ZFR0_EL1 enumerating them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 26f1350c9d2e3baf39ac3bdcc96fc1e6deb5a5c6..d487c78520b97c8f96c70181e39eccb91d6fe1af 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1040,7 +1040,10 @@ UnsignedEnum	55:52	F32MM
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	51:48
+UnsignedEnum	51:48	F16MM
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	47:44	I8MM
 	0b0000	NI
 	0b0001	IMP
@@ -1058,6 +1061,7 @@ Res0	31:28
 UnsignedEnum	27:24	B16B16
 	0b0000	NI
 	0b0001	IMP
+	0b0010	BFSCALE
 EndEnum
 UnsignedEnum	23:20	BF16
 	0b0000	NI
@@ -1068,16 +1072,22 @@ UnsignedEnum	19:16	BitPerm
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	15:8
+UnsignedEnum	15:12	EltPerm
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	11:8
 UnsignedEnum	7:4	AES
 	0b0000	NI
 	0b0001	IMP
 	0b0010	PMULL128
+	0b0011	AES2
 EndEnum
 UnsignedEnum	3:0	SVEver
 	0b0000	IMP
 	0b0001	SVE2
 	0b0010	SVE2p1
+	0b0011	SVE2p2
 EndEnum
 EndSysreg
 

-- 
2.39.2


