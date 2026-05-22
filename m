Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21056CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAcnzs7CI4odaI29OdW5gRVKD8KnKU5khRHBWADis3c=; b=EyPsC4qAglc1mIUtddGEPa9/lO
	VIBPNKfCrT/+uxe5dWBfn6CyWUcukxkDl5ZhgMlAEsxLy5HqwGQyRo+jeDfz0L/20lRRDcSWVSrrs
	XfndE11mOg964heS1ZEtgVzRtBLjtVqMO6c7eV3cuJEckKJzA41947SQIn0l/A4QMLNX6RpCYZtqm
	rincfxKWI6zjuNfzTt1/wP+RHqDI+vZbJhb0lMpWr4A+u/p4RD8qvlJwBXunDXqx+dGQIXQbvaMKV
	/42DoOqc+iTzC8UiXFm70rXj7/1KJPDayYQGv9rt/j4+ZObCsEjgFr3Qnd4W6tVhz7ihEToE9pi0O
	9VqXR8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQU9Y-0000000BcfV-3u0z;
	Fri, 22 May 2026 17:59:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQU9N-0000000BcZe-0eGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 17:59:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A52F342DE6;
	Fri, 22 May 2026 17:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FDF1F00A3E;
	Fri, 22 May 2026 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779472748;
	bh=AAcnzs7CI4odaI29OdW5gRVKD8KnKU5khRHBWADis3c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q3h9SapvwuYmx6+PRTRCX85IWJxf72YhczM7KUol+ItHt/ajLIy8Iqz7b9Yk/gx5i
	 iknnxjJf88BACO+fWQKNfHDTH/xBj1PgFP9046zrz5Y03jsy3puHzX5MXZvVr5ZVwo
	 D0HC9CS+VzMvj1SDNik72sRx1+DiqBZXQOfHzXRZLduwm6LFIoMkWbBZwoJldOym6Y
	 lmEoNjbWQFFz/b1zfBbsyEfPEIE4INi+Tug+iYp+HfD/aBlssylX7t1w0T41jlxiKB
	 IafDsO9RkVCjoQZD9uhGBP9zxrzmFH4t+HnoFSKClms87FBPagusuWICG8Kdurcdtm
	 XuifOxzzNJ42w==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 May 2026 18:58:39 +0100
Subject: [PATCH 3/3] arm64: Sort registers in cpu-feature-registers.rst
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-arm64-cpu-ftr-regs-v1-3-19775b40faf0@kernel.org>
References: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
In-Reply-To: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=18454; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cx+KF/6nrqSAu4vLW0c/WsDbTzGJ4mLnp/FbDrX0pEg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJliUL54VF4fiT/FStBUaptC+buEsFiUXBnMg
 Wpo552EeQeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCZYgAKCRAk1otyXVSH
 0IouB/wLNnbin9WAFQnGwNUvyb6ps58Yldlu10vRqOq5Bos0/QIIRuNeRSSj6GVKUE9A3Zk+urV
 agy8PrbCTv0gEEkzrrHPDJGhHjBlYUZPFtTu2hzduapoRnibc1NKpxJVS+q3mirupgy6Wb0Of/S
 4VoNMUYTOvM1VSq9/vfCabcPR5fA8ClkbTLoV4z9F1TsoIiM5p28LAWnVqvnmmF6clZLqbYmvYS
 Q9cpbD1fuoeBHPCuR/cHYaWU6SijxnNKKOJn8Mj0nyqcfsE7kjPWmOM/FUI1VC9aqY9xqg8vroC
 s00c/JL9BcnMTiJVFSBixKr0vmvb0d+TGZdpLuTYwUN8nu/7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_105909_246592_6817D1BF 
X-CRM114-Status: GOOD (  10.68  )
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
index 02815db0c780..0ea294c56984 100644
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
 
   ID_AA6SMFR0_EL1 - SME feature ID register 0
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


