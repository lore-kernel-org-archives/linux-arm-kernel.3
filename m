Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49204E64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XabbIzTS7t2W+MUpgYNGjGQTP70pxk9UklOENbHOjq0=; b=pOI2/zu2XRh6t1tVFn9wedOk/X
	avop8Pw31P26TtjSi00pLtG3km/rnRgFydjNmY+nxIg+t1D++5KyqoP+BN7qGc0etOQdJXFUzpEi3
	4+8AUcOYx0pwNO3UuwBCt0tlxLtMu/+fXFVqnPCv/c/VDKwM6v0ifSl4oNfSdKareJn2hmi8bd7F5
	oyID2Vvmthn57q+q9vkGkTyc43TlFCeWFumXjBt+rpOBbxgoXTm5C967D+nyWykMjQT0Rx4Go6znO
	af5ysoozTLUDcY+vvzRZMgmzraRrhgZda9rXYEHeagipt66DQDv23CwnzW13AH9F2XLIrWtMn0RvP
	Jnaj/2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISNM-00000009V7o-1jSM;
	Tue, 03 Dec 2024 12:51:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISFt-00000009T33-0G4L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:43:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A02DA41511;
	Tue,  3 Dec 2024 12:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3859C4CEDA;
	Tue,  3 Dec 2024 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733229831;
	bh=uWX3RIr6IQi+pDKEUyAenvXadJW9Jtk5jhp6Bdht4QU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Lr/eNEEZ8RzvLuBBcRpNMfL1WVYXY/Z5TeDzLd811eyo8/2gMn23GvnwHSy8h/SG1
	 X6wz6zCspnpQYZfMJ4/PP4WUnOTrwQrugYdR9zzyAj+m32RipEgCdLQ8zkDsJFwm8i
	 mM2txXoarNGvIHF6VUokt73M90WeBACepd0Thx7MaPuORDD+0dc/06/ccFNEHCto3n
	 racFfVOfMBq2qHM8ilshzxP/aJmp6Woa//hmXmOkOvEuhsMHQ9puXxsjpWFJNZERn8
	 2zVYgZvflkx3x9wVS7hiIy1gm672N3eAJAriSVBrBaoX2DEobodegjDrbFKHZWNFgE
	 3zlEqJ5VlStPA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:39:22 +0000
Subject: [PATCH v3 3/9] arm64/sysreg: Update ID_AA64FPFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-2024-dpisa-v3-3-a6c78b1aa297@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=766; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uWX3RIr6IQi+pDKEUyAenvXadJW9Jtk5jhp6Bdht4QU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTvz2gRLCtzF4XIZSmmeQcCIHiNRFexIqDKpZifux
 pB7AeEuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ0789gAKCRAk1otyXVSH0M3fB/
 sH6cvO82k2eOFyg506a/t8gX3BSf8pOcklH7n1ZvG7rieJW1oohWr+Fw77uB2RClnrFO06Dc6cTkpL
 QqEc2w/eYk/5XbSnOcXoowEX47j23DQR8N3RsrgLOuNkyvtc8nlJ2kjhYkhlKv1jpTy0Zrpc3EA93w
 66kHWJgPDS+oSyqgFiz9FAynRjiKmLarT5c+g3P7SgbLiEibNx1cZtu672tU7fa+ZgX0aPMl+gOlQK
 UeZXgonlixyZFNn7AWjhkJ+xjFscYcxpF5JDLR9k0IWjqxhLJiV+seKuKf8JeX4liEV1qOmCFYsAWo
 A5CkclbsMnxLAsmEL1kaIrY2GwfT4v
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044353_173685_6AE464C2 
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

DDI0601 2024-09 defines two new feature flags in ID_AA64FPFR0_EL1
describing new FP8 operations, describe them in sysreg.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index c5af604eda6a721cedf5c9c68d6f7038156de651..b44ab511cf5d9d33efd7dca304d0e2f53ce47810 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1180,7 +1180,15 @@ UnsignedEnum	28	F8DP2
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	27:2
+UnsignedEnum	27	F8MM8
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	26	F8MM4
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	25:2
 UnsignedEnum	1	F8E4M3
 	0b0	NI
 	0b1	IMP

-- 
2.39.5


