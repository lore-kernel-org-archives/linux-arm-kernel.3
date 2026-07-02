Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEDCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEWGtOl4AkX0F08s5iRm3LyaZAZjbHEeBzdk77FUi1Y=; b=C6YdHxQO6k9SyyCEVBi5Ki2WBX
	AoQ2m7T7eHGZKGEQMW9SEszW+qOM6ysNFDNxR07VRU9W7fYM1c/O1qlUSBseDE/qqpLmu9BXOETeo
	5zhy0KctCrr3ZhZ8RFE4HN3JQsy41wziUXwUI6GZqpmijjrRbtR/LloehR7OX6salCJWQ5db4zd02
	8xc7fpxA4CWNdZ9SCh+/N6UCP/5UQ7+F1Lu+vlKcRiusZ53Qvz4lJsUfy1Im3DoovFDx0PxSdv50K
	2t/fwt/5jJEXmOiFyvBMOBdbWsjOj7TH81s+MD5pW19rEozl715WOdWtPvdAiEr9jv3hb8lEJQO0U
	PCXBwfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMpL-00000005KqX-0giX;
	Thu, 02 Jul 2026 19:11:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMpI-00000005Kp1-0Af2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:11:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E2E0601F2;
	Thu,  2 Jul 2026 19:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311F31F00A3A;
	Thu,  2 Jul 2026 19:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783019515;
	bh=SEWGtOl4AkX0F08s5iRm3LyaZAZjbHEeBzdk77FUi1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Un74zHhuTAdEh468Rwem99GtKkwC2WYb28kul9P7VuVf65Vxd4kwnVNbgSQgEJa48
	 qJZ5kyy4e1d1jBd0XpMoj3lQ2iMLu5qqs49Cf9WjQEQBIkHS/9vPAAHa28UShFoUfz
	 sT7pRfakCEKHy1JYe5W8BeIHWtCr8SUI7j6RzCJxtIDoTaaDiCyg3BVo9W9dzMCg9X
	 fZSBlIUJLcQkEaMrIuoMyZ5DCrd74OM5ZPDSErSkogEapT3jHsWyrSPnKGVl4M83Ir
	 Ma5BItrNwL6jo8LwTJSCANin32ODAjgkVX2Mu45z4vtyGlvuenaOZeZ4rz4JPxxuTs
	 VM4ZT852it+6w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 02 Jul 2026 20:11:18 +0100
Subject: [PATCH v2 3/4] arm64: Sort registers in cpu-feature-registers.rst
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-arm64-cpu-ftr-regs-v2-3-fe0b78f1bd93@kernel.org>
References: <20260702-arm64-cpu-ftr-regs-v2-0-fe0b78f1bd93@kernel.org>
In-Reply-To: <20260702-arm64-cpu-ftr-regs-v2-0-fe0b78f1bd93@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=18455; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Yeqy56rWeuVyz9G4Zo1e7F4ZejkWvMRVHGKoHYwe8Ok=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqRrfw7fwqI1WQcvLiVSHZyrbHLEHVe12A78rWS
 +IkLbwoigSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaka38AAKCRAk1otyXVSH
 0ELQB/9NoMDgOU0JmAF5j21tHbqwudLMaQS9+HQX+pV5s0PdYRSXeUJU9Hn908fz+jbUXpq4bvv
 thF7byAYwEZAdMWo2nbmiyVshVUPoam2KN1Ty4HvxnJkpYbXBQL9TP8u72KuvwOJrYBtJ3Gi6ls
 rjvbrxGyE5jBJvE+hoStGOEiBPXqMJL5wfbsJnK3AtVlJ5EjvrEvVbYxCi4MhtY8tChE3ARpC9K
 r6MpNOX9qx6iQ9yHL5KiXefNzLScYZfRBMu7LjZvxGzQE6uPDxg00raN17nGUQX0s3g26ltGH1n
 ODSrHevsAbYCzs2BvE8WdrmdG6HUbDHfPAVDxgJliyEqi5rl
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

In order to make it a bit easier to work with sort the list of registers in
cpu-feature-registers.rst lexically. There should be no content changes
resulting from this patch.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/cpu-feature-registers.rst | 223 +++++++++++----------
 1 file changed, 112 insertions(+), 111 deletions(-)

diff --git a/Documentation/arch/arm64/cpu-feature-registers.rst b/Documentation/arch/arm64/cpu-feature-registers.rst
index 4b10980d4a40..683bdd90c705 100644
--- a/Documentation/arch/arm64/cpu-feature-registers.rst
+++ b/Documentation/arch/arm64/cpu-feature-registers.rst
@@ -170,137 +170,161 @@ infrastructure:
      +------------------------------+---------+---------+
 
 
-  ID_AA64PFR0_EL1 - Processor Feature Register 0
+  ID_AA64ISAR1_EL1 - Instruction set attribute register 1
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | DIT                          | [51-48] |    y    |
+     | LS64                         | [63-60] |    y    |
      +------------------------------+---------+---------+
-     | MPAM                         | [43-40] |    n    |
+     | I8MM                         | [55-52] |    y    |
      +------------------------------+---------+---------+
-     | SVE                          | [35-32] |    y    |
+     | DGH                          | [51-48] |    y    |
      +------------------------------+---------+---------+
-     | GIC                          | [27-24] |    n    |
+     | BF16                         | [47-44] |    y    |
      +------------------------------+---------+---------+
-     | AdvSIMD                      | [23-20] |    y    |
+     | SB                           | [39-36] |    y    |
      +------------------------------+---------+---------+
-     | FP                           | [19-16] |    y    |
+     | FRINTTS                      | [35-32] |    y    |
      +------------------------------+---------+---------+
-     | EL3                          | [15-12] |    n    |
+     | GPI                          | [31-28] |    y    |
      +------------------------------+---------+---------+
-     | EL2                          | [11-8]  |    n    |
+     | GPA                          | [27-24] |    y    |
      +------------------------------+---------+---------+
-     | EL1                          | [7-4]   |    n    |
+     | LRCPC                        | [23-20] |    y    |
      +------------------------------+---------+---------+
-     | EL0                          | [3-0]   |    n    |
+     | FCMA                         | [19-16] |    y    |
+     +------------------------------+---------+---------+
+     | JSCVT                        | [15-12] |    y    |
+     +------------------------------+---------+---------+
+     | API                          | [11-8]  |    y    |
+     +------------------------------+---------+---------+
+     | APA                          | [7-4]   |    y    |
+     +------------------------------+---------+---------+
+     | DPB                          | [3-0]   |    y    |
      +------------------------------+---------+---------+
 
-
-  ID_AA64PFR1_EL1 - Processor Feature Register 1
+  ID_AA64ISAR2_EL1 - Instruction set attribute register 2
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | GCS                          | [47-44] |    y    |
+     | LUT                          | [59-56] |    y    |
      +------------------------------+---------+---------+
-     | SME                          | [27-24] |    y    |
+     | CSSC                         | [55-52] |    y    |
      +------------------------------+---------+---------+
-     | MTE                          | [11-8]  |    y    |
+     | RPRFM                        | [51-48] |    y    |
      +------------------------------+---------+---------+
-     | SSBS                         | [7-4]   |    y    |
+     | BC                           | [23-20] |    y    |
      +------------------------------+---------+---------+
-     | BT                           | [3-0]   |    y    |
+     | MOPS                         | [19-16] |    y    |
+     +------------------------------+---------+---------+
+     | APA3                         | [15-12] |    y    |
+     +------------------------------+---------+---------+
+     | GPA3                         | [11-8]  |    y    |
+     +------------------------------+---------+---------+
+     | RPRES                        | [7-4]   |    y    |
+     +------------------------------+---------+---------+
+     | WFXT                         | [3-0]   |    y    |
      +------------------------------+---------+---------+
 
-  ID_AA64PFR2_EL1 - Processor Feature Register 2
+  ID_AA64ISAR3_EL1 - Instruction set attribute register 3
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | FPMR                         | [35-32] |    y    |
+     | FPRCVT                       | [31-28] |    y    |
      +------------------------------+---------+---------+
-     | MTEFAR                       | [11-8]  |    y    |
+     | LSFE                         | [19-16] |    y    |
      +------------------------------+---------+---------+
-     | MTESTOREONLY                 | [7-4]   |    y    |
+     | FAMINMAX                     | [7-4]   |    y    |
      +------------------------------+---------+---------+
 
-  MIDR_EL1 - Main ID Register
+  ID_AA64MMFR0_EL1 - Memory model feature register 0
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | Implementer                  | [31-24] |    y    |
-     +------------------------------+---------+---------+
-     | Variant                      | [23-20] |    y    |
+     | ECV                          | [63-60] |    y    |
      +------------------------------+---------+---------+
-     | Architecture                 | [19-16] |    y    |
+
+  ID_AA64MMFR1_EL1 - Memory model feature register 1
+
      +------------------------------+---------+---------+
-     | PartNum                      | [15-4]  |    y    |
+     | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | Revision                     | [3-0]   |    y    |
+     | AFP                          | [47-44] |    y    |
      +------------------------------+---------+---------+
 
-   NOTE: The 'visible' fields of MIDR_EL1 will contain the value
-   as available on the CPU where it is fetched and is not a system
-   wide safe value.
-
-  ID_AA64ISAR1_EL1 - Instruction set attribute register 1
+  ID_AA64MMFR2_EL1 - Memory model feature register 2
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | LS64                         | [63-60] |    y    |
+     | AT                           | [35-32] |    y    |
      +------------------------------+---------+---------+
-     | I8MM                         | [55-52] |    y    |
+
+  ID_AA64MMFR3_EL1 - Memory model feature register 3
+
      +------------------------------+---------+---------+
-     | DGH                          | [51-48] |    y    |
+     | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | BF16                         | [47-44] |    y    |
+     | S1POE                        | [19-16] |    y    |
      +------------------------------+---------+---------+
-     | SB                           | [39-36] |    y    |
+
+  ID_AA64PFR0_EL1 - Processor Feature Register 0
+
      +------------------------------+---------+---------+
-     | FRINTTS                      | [35-32] |    y    |
+     | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | GPI                          | [31-28] |    y    |
+     | DIT                          | [51-48] |    y    |
      +------------------------------+---------+---------+
-     | GPA                          | [27-24] |    y    |
+     | MPAM                         | [43-40] |    n    |
      +------------------------------+---------+---------+
-     | LRCPC                        | [23-20] |    y    |
+     | SVE                          | [35-32] |    y    |
      +------------------------------+---------+---------+
-     | FCMA                         | [19-16] |    y    |
+     | GIC                          | [27-24] |    n    |
      +------------------------------+---------+---------+
-     | JSCVT                        | [15-12] |    y    |
+     | AdvSIMD                      | [23-20] |    y    |
      +------------------------------+---------+---------+
-     | API                          | [11-8]  |    y    |
+     | FP                           | [19-16] |    y    |
      +------------------------------+---------+---------+
-     | APA                          | [7-4]   |    y    |
+     | EL3                          | [15-12] |    n    |
      +------------------------------+---------+---------+
-     | DPB                          | [3-0]   |    y    |
+     | EL2                          | [11-8]  |    n    |
+     +------------------------------+---------+---------+
+     | EL1                          | [7-4]   |    n    |
+     +------------------------------+---------+---------+
+     | EL0                          | [3-0]   |    n    |
      +------------------------------+---------+---------+
 
-  ID_AA64MMFR0_EL1 - Memory model feature register 0
+
+  ID_AA64PFR1_EL1 - Processor Feature Register 1
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | ECV                          | [63-60] |    y    |
+     | GCS                          | [47-44] |    y    |
      +------------------------------+---------+---------+
-
-  ID_AA64MMFR2_EL1 - Memory model feature register 2
-
+     | SME                          | [27-24] |    y    |
      +------------------------------+---------+---------+
-     | Name                         |  bits   | visible |
+     | MTE                          | [11-8]  |    y    |
      +------------------------------+---------+---------+
-     | AT                           | [35-32] |    y    |
+     | SSBS                         | [7-4]   |    y    |
+     +------------------------------+---------+---------+
+     | BT                           | [3-0]   |    y    |
      +------------------------------+---------+---------+
 
-  ID_AA64MMFR3_EL1 - Memory model feature register 3
+  ID_AA64PFR2_EL1 - Processor Feature Register 2
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | S1POE                        | [19-16] |    y    |
+     | FPMR                         | [35-32] |    y    |
+     +------------------------------+---------+---------+
+     | MTEFAR                       | [11-8]  |    y    |
+     +------------------------------+---------+---------+
+     | MTESTOREONLY                 | [7-4]   |    y    |
      +------------------------------+---------+---------+
 
   ID_AA64SMFR0_EL1 - SME feature ID register 0
@@ -387,50 +411,64 @@ infrastructure:
      | SVEVer                       | [3-0]   |    y    |
      +------------------------------+---------+---------+
 
-  ID_AA64MMFR1_EL1 - Memory model feature register 1
+  ID_ISAR5_EL1 - AArch32 Instruction Set Attribute Register 5
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | AFP                          | [47-44] |    y    |
+     | CRC32                        | [19-16] |    y    |
+     +------------------------------+---------+---------+
+     | SHA2                         | [15-12] |    y    |
+     +------------------------------+---------+---------+
+     | SHA1                         | [11-8]  |    y    |
+     +------------------------------+---------+---------+
+     | AES                          | [7-4]   |    y    |
      +------------------------------+---------+---------+
 
-  ID_AA64ISAR2_EL1 - Instruction set attribute register 2
+  ID_ISAR6_EL1 - AArch32 Instruction Set Attribute Register 6
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | LUT                          | [59-56] |    y    |
-     +------------------------------+---------+---------+
-     | CSSC                         | [55-52] |    y    |
+     | I8MM                         | [27-24] |    y    |
      +------------------------------+---------+---------+
-     | RPRFM                        | [51-48] |    y    |
+     | BF16                         | [23-20] |    y    |
      +------------------------------+---------+---------+
-     | BC                           | [23-20] |    y    |
+     | SB                           | [15-12] |    y    |
      +------------------------------+---------+---------+
-     | MOPS                         | [19-16] |    y    |
+     | FHM                          | [11-8]  |    y    |
      +------------------------------+---------+---------+
-     | APA3                         | [15-12] |    y    |
+     | DP                           | [7-4]   |    y    |
      +------------------------------+---------+---------+
-     | GPA3                         | [11-8]  |    y    |
+
+  ID_PFR2_EL1 - AArch32 Processor Feature Register 2
+
      +------------------------------+---------+---------+
-     | RPRES                        | [7-4]   |    y    |
+     | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | WFXT                         | [3-0]   |    y    |
+     | SSBS                         | [7-4]   |    y    |
      +------------------------------+---------+---------+
 
-  ID_AA64ISAR3_EL1 - Instruction set attribute register 3
+  MIDR_EL1 - Main ID Register
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
-     | FPRCVT                       | [31-28] |    y    |
+     | Implementer                  | [31-24] |    y    |
      +------------------------------+---------+---------+
-     | LSFE                         | [19-16] |    y    |
+     | Variant                      | [23-20] |    y    |
      +------------------------------+---------+---------+
-     | FAMINMAX                     | [7-4]   |    y    |
+     | Architecture                 | [19-16] |    y    |
+     +------------------------------+---------+---------+
+     | PartNum                      | [15-4]  |    y    |
+     +------------------------------+---------+---------+
+     | Revision                     | [3-0]   |    y    |
      +------------------------------+---------+---------+
 
+   NOTE: The 'visible' fields of MIDR_EL1 will contain the value
+   as available on the CPU where it is fetched and is not a system
+   wide safe value.
+
   MVFR0_EL1 - AArch32 Media and VFP Feature Register 0
 
      +------------------------------+---------+---------+
@@ -457,43 +495,6 @@ infrastructure:
      | SIMDLS                       | [11-8]  |    y    |
      +------------------------------+---------+---------+
 
-  ID_ISAR5_EL1 - AArch32 Instruction Set Attribute Register 5
-
-     +------------------------------+---------+---------+
-     | Name                         |  bits   | visible |
-     +------------------------------+---------+---------+
-     | CRC32                        | [19-16] |    y    |
-     +------------------------------+---------+---------+
-     | SHA2                         | [15-12] |    y    |
-     +------------------------------+---------+---------+
-     | SHA1                         | [11-8]  |    y    |
-     +------------------------------+---------+---------+
-     | AES                          | [7-4]   |    y    |
-     +------------------------------+---------+---------+
-
-  ID_ISAR6_EL1 - AArch32 Instruction Set Attribute Register 6
-
-     +------------------------------+---------+---------+
-     | Name                         |  bits   | visible |
-     +------------------------------+---------+---------+
-     | I8MM                         | [27-24] |    y    |
-     +------------------------------+---------+---------+
-     | BF16                         | [23-20] |    y    |
-     +------------------------------+---------+---------+
-     | SB                           | [15-12] |    y    |
-     +------------------------------+---------+---------+
-     | FHM                          | [11-8]  |    y    |
-     +------------------------------+---------+---------+
-     | DP                           | [7-4]   |    y    |
-     +------------------------------+---------+---------+
-
-  ID_PFR2_EL1 - AArch32 Processor Feature Register 2
-
-     +------------------------------+---------+---------+
-     | Name                         |  bits   | visible |
-     +------------------------------+---------+---------+
-     | SSBS                         | [7-4]   |    y    |
-     +------------------------------+---------+---------+
 
 Appendix I: Example
 -------------------

-- 
2.47.3


