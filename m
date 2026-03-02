Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B025EB3641
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wLVwlx9UWwB91yM76CpiXHFeudnfwUhaqKnlDuVSSs=; b=su46mBXxN5nJzIFLu9LR06rih1
	ARhZVWk3e92qOZ7nIHlN9GJkVll+EN6qa8BLrsk1gDluUyHT8yNxx9c31jvw+HCDgKCLmL77kjY/2
	Q+FxcKfptQu6Zfa//uGNIN9TTT71DM8/h0GpO4I5bpQUGNyLhmBXcpFGGAnycf6sDXti+oWL4f+5E
	ZJZmWvPUntdX0FkNqhP0JYZW7MpM3UEYoUw7elfH+C22BcBr1sVF9oy7Cb/HrKfrOd1RAGl1cyDm5
	KPvCdeOgef2YAEtxfUToQhzohqEbObzqlet6KYnSTUVlSsMj0X/1DhYeBtuK7d7Lxwt4okSZbQ7Ir
	Wn1eHUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEr-0000000EA5o-3KwD;
	Mon, 02 Mar 2026 22:59:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEq-0000000EA4o-0Q1j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 22:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CE096111A;
	Mon,  2 Mar 2026 22:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5149C2BCB0;
	Mon,  2 Mar 2026 22:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492383;
	bh=3cDEmPbM/ZrYkcKE8GG467rShtzE9T3OP7Nd6C9sgls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NGIk0XOfImvJ63+ydhkZUIWm95xFTrUYfrTRezcqS5Zu1U7j0YfoWNW9hIrsSJNDR
	 UUx7vpuhIbMOhniyftthpM4ccHZq1XQK638LFy8RSrbKDqpUZoHxphngrSjdrWp10s
	 cMwFW/VvDhZMSr8UlCg9uoBhk00XEXIPH3lpM1MWZp13JXWsWx1yHMJQpUt6kWA0Cp
	 i6/xrPfy30vxjT1hiXu2M65ZrV8uFmxuWuzF2dd/SbwLVsf01N8LsJkiZVVyKyTH2N
	 muSZkE22I5nT7tjDM6iJ4wx+J14xttw1kjwzTFA7dR8YsxaLX3Hfg67MNx6hbrw/6f
	 tqwEXeJexxv2Q==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:19 +0000
Subject: [PATCH 4/8] arm64/sysreg: Update ID_AA64FPFR0_EL1 description to
 DDI0601 2025-12
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-4-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=680; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3cDEmPbM/ZrYkcKE8GG467rShtzE9T3OP7Nd6C9sgls=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZRWfQt6vizNrWnnVqMTnzPDEZkuz/frnUdr
 UY98RUo1+KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWUQAKCRAk1otyXVSH
 0Gp7B/wJu4xpUwsMSjlE4mku4Dmg5Mpyc/Zuh4NBayp2zw79vd9mqLm1M5HWOtELGEifFm5YFD7
 CE9JGeuiqf9M7W2T6Yo0W2Tz263tQ+CbeVFX10tmzVF1TMQ0F0vOAv5aKkyaqNPWgzdYUZeqCsm
 3d1qmGqBcTcWESKDSf3gqgim9XtqmPFz+An7dA6Gx1Ayf4xcAJZVN4c+rfn6UCRpzSmbgQekrAH
 wRicgSMJcrBf7vYLZFKyHTNy7B2k2spJwCfUEqZElc/PP57gnp5FlaXMXHIScM6tXt8/pYqQscM
 wAKOwSQZysQSjukS6tkL1YjJGfPnDHLpQR4kUrp2/tWJQFcs
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

The 2025 extensions add FEAT_F16MM and adjust some of the RES0 bits to be
RAZ instead as a placeholder for future extensions.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 0d619c173c87..451ad312dc78 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1654,7 +1654,13 @@ UnsignedEnum	26	F8MM4
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	25:2
+Res0	25:16
+UnsignedEnum	15	F16MM2
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	14:8
+Raz	7:2
 UnsignedEnum	1	F8E4M3
 	0b0	NI
 	0b1	IMP

-- 
2.47.3


