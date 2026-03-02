Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2309DEB3642
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMOFeuofWE7qVyR/EwJ2yj6nw8gNs5mhV4j/jowyr5I=; b=j0zTy8Hmih55UHqEcO+vRDF+GH
	KcUIZ42nv+7+IGOaRP0aIWs5Ub0lejXjtkQrWI5+JJie+I/MQU+kujdp0VucpyNtizSKgSqm69Bi3
	rc3apy+jcmtF9plk1OFU4G4nL0R7YPhjT7wt0afMtiaeRT1zXI/EAG9gNiLTR+ycsUrvlNTErMRw2
	kk8++H03c+23veQwQi58IuCwoJmgKaek3TVKGWH4ID/36X9kUzNtwlk9ymdi2M8prT2vsOOSOdvdy
	y1bui92YwYlo0Wp8e39bLGsQhcyrA8xt6wdmiaj9Vely4CoSlikcUR2q7bS2F9O4NDfp5aVbL4BZa
	YAHx05og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEv-0000000EA9V-3qZo;
	Mon, 02 Mar 2026 22:59:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEu-0000000EA7u-0z6e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 22:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9B0B60180;
	Mon,  2 Mar 2026 22:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DC2C2BCAF;
	Mon,  2 Mar 2026 22:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492387;
	bh=/lJ/fehI44WibZOvYodNtIelbVYTdzXsSQx64Pg7wIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bitJPtW3XaXkfxh8HzFIJ+9wFYUPYCzc0GxlPNl5UJnXeIkyZm7QZR1CLId+5QWuC
	 uh1T9uELA5K2i4rlfmJCjNJyVZp4bw7FuYQXiXYBTd7vedEc8pjv+iNQS8S+WuedBz
	 EPX+SpA3P03WwmplXCsFAblyJXXdD0eoyy7srOCGr7MJhK7ZSKB9beTUFmI6D0Jczd
	 m4LhtpKz6u24w7imvgitsKJ/7G64SYIzUiRTRFbJPryjd01v9hG6UAJdGaXFf8z7Yc
	 h56gkBpSKXh9k8XqspUzBv2tkPomXwGVACakgOlxbRdr64LwszVZnr6lGBsOxLMP/t
	 Ovk95MkqJa6ow==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:21 +0000
Subject: [PATCH 6/8] arm64/sysreg: Update ID_AA64SMFR0_EL1 description to
 DDI0601 2025-12
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-6-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=744; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/lJ/fehI44WibZOvYodNtIelbVYTdzXsSQx64Pg7wIg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZS/+s06dtawLD+8AABMWAE3HxCNXtMFOPnG
 tVJRpBgfdGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWUgAKCRAk1otyXVSH
 0A59B/0fe7ZQnlgvilKPjZLS9zvMj/v6kbyBjzEMHarYcE3Yrw+CBp9dAHRQ2egdswvoORI9F+9
 kLdFofxVIdMrMyfmAXoGlRKnqsBJILOCf+9dwIuI1l3LjbGuA+/yHJ+k6KT1DIsgCigAA8UxnX2
 UbfLrxztfNIHaBTMYF62v5IhOW4nRXi3kkbXeqBL1LXHYHsQnsckHQA7aLhQq0y+nItdDx3m3i4
 421mE3exI6N1MP5q9qVk3lv6XeH2obZaUMBFuvXSrPXVmSOn3acS0qiS+9EEp2anER7TTDG2uCN
 Ppb3G9wiHzlhbjQrTG9ThHFYM73EYU7KcbJMAjeaOMyGHviU
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

The 2025 extensions add FEAT_SME2P3, including LUT6.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 75b8644c4753..eded0bee6ce4 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1532,7 +1532,11 @@ UnsignedEnum	63	FA64
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	62:61
+Res0	62
+UnsignedEnum	61	LUT6
+	0b0	NI
+	0b1	IMP
+EndEnum
 UnsignedEnum	60	LUTv2
 	0b0	NI
 	0b1	IMP
@@ -1542,6 +1546,7 @@ UnsignedEnum	59:56	SMEver
 	0b0001	SME2
 	0b0010	SME2p1
 	0b0011	SME2p2
+	0b0100	SME2p3
 EndEnum
 UnsignedEnum	55:52	I16I64
 	0b0000	NI

-- 
2.47.3


