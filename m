Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CC4E64A8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLI6vhOwnNvJdAJvtkye4Q7akrXhNAKe4MyL2T2Z9hI=; b=uCU3nC8wYmhQ4BDvV4mInVQWth
	QffVTG8CkR2Q37ya/lPDhFpCaU+3X47WR7FMEt16Svuo3u5r7U4Tk6LYBlmMsrfib69cTVjdKLWkE
	p60Y/wW9TMWCh4D9oSYxxNizROMIsry8KsmJYsdYaJaHVCf+V1aUAqiIj7ZjOCx2cRjkm/fH86bfr
	LfqAeK3Q/Njh87YfZr0ssX8BItgYBgBxwEZdbBcNbKsI0xCD3nvLQthzR04O0WptaKuOMscrr0wkB
	zjj0ZcPKTtOkMmgDspimVhB7RJz+RqJqkAWBpvquM/PY/d7kQ3YlBr9In1cgfs+mHVnGUyWyALLQ+
	dqSdyT0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISOL-00000009VNz-0P1q;
	Tue, 03 Dec 2024 12:52:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISFv-00000009T4v-2t9B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA1CBA41575;
	Tue,  3 Dec 2024 12:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B225C4CEDE;
	Tue,  3 Dec 2024 12:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733229834;
	bh=NaojwUVLM21ZDZfygwwfm+o2K56m57qMKMUVUASrExE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LhRL8I++S5auftxIgrszQZbuYIlRHcoh5MJlB69fJ70Xl7bvSKawwwUknuxCXKLM7
	 IkBguPnTKG9CnkUzzDHcrIJUad3DV16YKR+/hVo23j3AWZ8IIDLvE93rFwMiSTOEYQ
	 EyB5peoyvHBy3NQEpf2kidhJtvQmqOi850wlSU7I5qpQ0pfPESrkUspO9PP2/j7Oqp
	 hNzNC3RKwwdRemnLo4Hyuy6SADhbQ6mJktWrz8CuCUBLPAalLvxkyq/0hRLXzEPH82
	 VCMolscJ2nj6nUvj7tA9kXNp4nZ/xrmXNwOtrR4dDdYhLZoLd6J6HchhZKdGg4otnY
	 t+uQfZZc1EjVQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:39:23 +0000
Subject: [PATCH v3 4/9] arm64/sysreg: Update ID_AA64ZFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-2024-dpisa-v3-4-a6c78b1aa297@kernel.org>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
In-Reply-To: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
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
 h=from:subject:message-id; bh=NaojwUVLM21ZDZfygwwfm+o2K56m57qMKMUVUASrExE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTvz2gK8oIx8Fu30RdmRdl5fa5wHYofielI0roi8L
 V0SdG+aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ0789gAKCRAk1otyXVSH0L8mB/
 wI4/N5k/3zPdplG8iWP8owY7F0Shk+4oj2pNAbjMumHTOzO7GoCiP80dRjXbtFSm7BgkMFxP62frlN
 PtbqhN/VML6TU8UZmnYtfwYuSB8M2Ip578Sv/c5P82wmPTgN4KlBVkthL6v/rCUROeKe83ezPw+wml
 580yIdC4xf9JFOPWiBKSgdMSk0f7NegEO0pLSYyqEvKYsReRenq3MsKAfe/S5VgFsGAMqNOgpRbdBx
 qUEU+dja3OvlqjJy3Kh/CRhISwsQu4acKiPIGIpbm1JBR2Qu5fiKANjiuiweRUrmwv20ykVOJP8lin
 XcMLG7CmzgQwtkeSBUk+MxPNi+iQxt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044355_791381_C2B7BE86 
X-CRM114-Status: UNSURE (   8.87  )
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
index b44ab511cf5d9d33efd7dca304d0e2f53ce47810..7e6b204e83270daabd0036c8109b2fdb0e9b700a 100644
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
2.39.5


