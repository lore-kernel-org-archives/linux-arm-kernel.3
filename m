Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BCCD5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BcUR4WgMD71KizwO9zUGlZyjt1hViz8r9BhCnOrocU=; b=OOShEptYqMjb96/lJdu6c3YAF+
	bzjxJebGsInPLrDUqwbU/Guzhno0n8QI+pOYNOzx/m2hATlMVnNQvJ4TzymtbyQjppIlkfY5P/K6g
	xy9+6ISxf5rT01zgsuf+xDDEhGYDKAOYyF7p+RM7Lemzxncr62Em433NVCYiVF9ifMHhqWJQHXofJ
	pzene00/f2Qa8MA8Va6duJ/sS2dPR4NXsSfoAHAXx+nxFOVCtBeFvw9/k8KVursks2eYNN3JgGYe9
	JVUb/EuhI7sPsH4ALiIPuefsCEtL6W3BZ67fYOK+Izruwdh5dpz37mh/UBIFpX6mIyOCozeK/opiR
	lurrbtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WuP-0000000CHaj-1zmr;
	Mon, 28 Oct 2024 21:04:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WK0-0000000C9ZC-1hIO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87B8DA4298D;
	Mon, 28 Oct 2024 20:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE27C4CEC3;
	Mon, 28 Oct 2024 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147199;
	bh=7uuIvssgPmNN0rgvBR2HltfMJC/cwbms6ZSXTgQ7BIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l3uO/ulc3ocueXipIvwxjEj/c0ijlaZ8oAL1cZRXhMGXqldt5LMHpkebFm2iuqR2R
	 7lbwBHsAAPGxe/+dCexr2UqrJ5wc6L7KrxBvFHgyV0XOkcZlXtjctHrvu8u0ZEbKlY
	 9nloLi+6tYnF3gzNGET6LnpXD8jgenT89wgATOkpsP1Ldcn1dn7BCPodS2Ek6RgPO3
	 QK3teelEI8OjQCkABs26+pmK7WK0JlEFuqzYgaA8majnKgc1yDivewwr91jLB6uwYG
	 vFSBMCUjdFAgqJQaowbwDPLjHd3Fa5VhPMUbNvbxbobkjeU9Fl3te0ddMkX+IXm54j
	 /Ow5vr52c7vDg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 28 Oct 2024 20:24:14 +0000
Subject: [PATCH 5/9] arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-arm64-2024-dpisa-v1-5-a38d08b008a8@kernel.org>
References: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
In-Reply-To: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7uuIvssgPmNN0rgvBR2HltfMJC/cwbms6ZSXTgQ7BIU=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhnT5z5mhH1wdu152/fp1M+Nmta6exZnPv89NDVWS8TbbX8uk
 w6XZyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwDcaD/2v+I3dtbv5FOdtKPxtczuko
 mWjM2LjJd7qiRpvo59mu6WXOkiEiF/YtZUx/hDe6V/ylkuOhd7ZPN0jgn2RoLusvUZ/V+YVZ7rteqI
 3ZjnNpfpdEbF8y/M/ifiz3O5MfNz2CuenOaif01OcfJ5eRkxzR7fB8ZnwpW0LFmDWyK/JAst9Tu0fn
 2lzGPbp2sttK4H+Wx5szDvwqF3istZNyReu/C7vu1MjFZKUaytRpO+pU0A//+bUUc0dOxf5W4TZUnz
 9p3qOc0h5vsl+c+BAZuP9e6tcnj01y1dS0rnZT6f8pq0MBG+p+t1So9vju2M+XFcfLGDs1Nlx7/bL4
 KWbWZgVmu17/mo0Bpgc0T8zFkA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132640_533259_03C33B00 
X-CRM114-Status: UNSURE (   8.70  )
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

DDI0601 2024-09 introduces SME 2.2 as well as a few new optional features,
update sysreg to reflect the changes in ID_AA64SMFR0_EL1 enumerating them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index d487c78520b97c8f96c70181e39eccb91d6fe1af..808bbd6d3a40a4cd652ac25d686f11ccafc5acf3 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1105,6 +1105,7 @@ UnsignedEnum	59:56	SMEver
 	0b0000	SME
 	0b0001	SME2
 	0b0010	SME2p1
+	0b0011	SME2p2
 	0b0000	IMP
 EndEnum
 UnsignedEnum	55:52	I16I64
@@ -1169,7 +1170,36 @@ UnsignedEnum	28	SF8DP2
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	27:0
+UnsignedEnum	27	SF8MM8
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	26	SF8MM4
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	25	SBitPerm
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	24	AES
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	23	SFEXPA
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	22:17
+UnsignedEnum	16	STMOP
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	15:1
+UnsignedEnum	0	SMOP4
+	0b0	NI
+	0b1	IMP
+EndEnum
 EndSysreg
 
 Sysreg	ID_AA64FPFR0_EL1	3	0	0	4	7

-- 
2.39.2


