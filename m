Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8C9D39410
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 11:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHd3Frej8BOMPcom8zD7zCOwGTywG+aA8p8YQ0sbL6s=; b=Ge5FmNb2EdQB/15NXLpGZGbpLw
	0zXhNv5Mm69AnynWEilbZpAUVi5dIYMqW+YsvmIDzPhkvaX922w5YE7B5RPA038F5uUpVWlReDzfj
	bzJXLdusne92cQl7YCeI7a63aKSaEgX7o2Xb1BZudZHSDLLUkXF0yoiYIKlthSb6ebtnvBthvm25L
	VxDNsJYRJErz2cgVaDDqsRoKdXK645ln+LefnRGZAlqvql2xnAIQSY6vII9St/Vu1gY51feP5nRqJ
	osqIoxziDQEFskdpXOxgAcc2/3MVet5kQM0qGL5C/CqV4F3d2heo5RW37t5AFg3Rn/U+4q7Vowxka
	ANXuqoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GA9-0000000HVYi-1JGJ;
	Thu, 02 Apr 2026 11:24:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GA8-0000000HVYC-2l9j;
	Thu, 02 Apr 2026 11:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CHd3Frej8BOMPcom8zD7zCOwGTywG+aA8p8YQ0sbL6s=; b=mo1qqAf5o94PD8YwbGfFFKi5kd
	3wFc0VPpJP3C/DDIxzkJPLliMtBgfKGw4ziFrZfwdMRzFeHM/y6duMnUXV5Q0xiLaNu0qZ+CSoRfj
	1G31D4jmgFDfePP1izjxY4xDb9KNRP2ZNqxYYzqLdVgq/7xvtANMj3f+H2GRrLO0xFjdeZRDJalM0
	iWlXF0AX8B3B+kI+ciK5PhPXOFPTL1LhH1trNgf2XIZHnPCIFP1hCXC7EjQFhbSxvpjHGxjPpeyYe
	Uft8FWpg2S/Yw1ARblJNgQvBaGHpARNHFKt3zbVXSrWVILU14c3EtTYuvbo9cEnpOA+48N+X5KONu
	SoDXp6IA==;
Received: from mail-eastusazon11012031.outbound.protection.outlook.com ([52.101.53.31] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GA4-00000002JnS-1jvM;
	Thu, 02 Apr 2026 11:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8L7o1WCMDkTwbCQcS5RKz51M123286PJNjiEZRqY2BORCJm7Je5M8YkFInsvj2pCyG3m07IMiUuTJjmVS2Odr3EhStV0ucIwZsTE1cyUjbldvoHSSOCogf7GNvwXexq/iR1x/4UsT2GHvOSOuzh9cMx0/DQsZJVnt+g3RHwmM57If1e0DU+qCYR2CHegfcgr69P7mJIcl/DjGTXnhL2WOnrxjGSmb41lvNwO9q74Jb55uaDymhB9IciVwufJgZdkZPETMIUKOwiEWNL5jdOBkmOd8XTX/CNiZ0bCjrflUkAsT/DNtbGeJMtE9MXgYK521jOEGAF/6N47j6IAWVOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHd3Frej8BOMPcom8zD7zCOwGTywG+aA8p8YQ0sbL6s=;
 b=IFp8Ma9iLTLh5SSDlr17b9CJ0sCmiyiyQYAPqrdOGDIghTWbTmgnqeRYtmM9f+YZBr/fRRc+VEmomsmrlIkY9LeRhUUpy9AYIzLAWn4aHhAn5zUu3SCrUH+pDLCVywkX4mSy75vgh4pRO9FqQqW7k2tPPr44zJzKSfDBHdJv+Yjl+oN1Jd1imJLcopZuDB0Hr00LfkRi7PVgk/RBybd9fwpcrCu6/RwyV4b+pK2icqu608DJ/oUGXb8YbxxNqW8FZCfMpJ/dk+Yz3OTmemMXQi/OU1m5KKjEXBF1iNkYqcjfmev8W8jAzdp4OxPWFg+4bwvumtwSl+aOMVplC5q7GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHd3Frej8BOMPcom8zD7zCOwGTywG+aA8p8YQ0sbL6s=;
 b=Q9f4ez2jcOw1yY0shB8kiqE+fsOKD0Ful005mwyf9zXRIwceH4pbuAJ2l7499x3LpgSAHn5ec5d5vAngH/BUedohamGeRgtHtQ8u7pBT2jeoTfFiUZK5Wgd2tw63GACIbtx+bZNsUkfhMrnCQ1mTYHG4Kf5Bb/18grpGLcexdVs=
Received: from SN7P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::17)
 by SJ5PPF75EAF8F39.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::999) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 2 Apr
 2026 11:24:25 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::71) by SN7P220CA0012.outlook.office365.com
 (2603:10b6:806:123::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 11:24:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 11:24:24 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 06:24:19 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, David Laight <david.laight.linux@gmail.com>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v3 3/7] arm64/runtime-const: Introduce runtime_const_mask_32()
Date: Thu, 2 Apr 2026 11:22:46 +0000
Message-ID: <20260402112250.2138-4-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402112250.2138-1-kprateek.nayak@amd.com>
References: <20260402112250.2138-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SJ5PPF75EAF8F39:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1d557e-a307-45bd-5eb3-08de90aa6535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Kw2yM0yYJQ9vgG08dRfEmXoipSrlJilbZ14XgvbNb5CjtDqwJ5Tpsz0xsjaeco8eYlwVhw0fd5FCPrtYSrhRD4wOFR8ujrIIx8thDdfs67dSifP7GrwliJM9XHU2cATewPTXaPwtjgmTf8rR9itRV5X5VpjpC/gjSZyE5QRV532NYCbXYvbAexaLHsOr4Z6zKUO5ihXIYdZK8IKv4zlUgEhyYWUsTQRD7O7A4Jl1UDqeTGGzo/Xu5k1k/x7OitJQhtQLJwH70DghZ3mcfG3Wp/XtXyw5ysyGaqFeXs6XeNgukcDUh7+pS9+MhzGX8tpwhcGdb7U1WTyB3TPpT1LaEiA3BPcc+Lo1oyyT95DnlzVFZ4outTDMSfqc10784Ad/W3ZghYkkWIQdo7QOuzkR1vbpz9aLJVU/6JMZN1vTj25bb8HWJwzpxeiH3thPC6eGFgMJvmpyqWUO7USMz1Ka2ixrcdpvjmkzwY+BSzRd9Mi+BTpe3D4hebbUs3OKTTcr9ef5/zsUNxhfl5Jl38vObV5PgoSufci8cNQgNBxv3zopofI+6xXdT3QkUB/1IFjICqlrjc6euGsmjiArEL2QlDA99NUho5er4Fd0V7FJHXWQYqaKU6A4FT8QbPZgWTZVQ8R5oRb7W3D+5nMZHRheDhI8LLOx9+Pl/py8sv51iPjDYIRk3NIjIy5NGFFlHKaAMbQT42KH5z3ttQY8GdvWWLvCJ43xP+8P2cidMstbdZ+gDpYVUDhDTLnLlsTg+iOdKyDXNEiAivvPehlNMtBS4Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gVWg1bqVn/dD/eufo+YLxaD1YoTJzBtlrunYUkkWXw4M3h6KiY8fhCm2qFX6mSBagElEUPsNNk9XD0HoQtqCcZvE9so1dF9KHgbQFo4ZDLIaI4UiaWCcD4R2dcxBVzIINuLtugpk0SAtzYz9FS2CUG/l9ZXByJObZ9x6NTqRXBPuFDiAU+rYSOKsLSe8Sad4kMclVI0Ii+uBP3lkAIYelM99Ae/aZFibT7WwfZPxOmoT4tNxz4yiMutdsOhr8bj3WNFdtmEhCx03rNgKW9ClEZ0kuliC58WFXIuWWcQE+6FTVebl3G/YqaY7Wamb8QmMBBJdWDx/jY3IJJK1CfvOZ34oNWtRvtQgRQqrLjiIgDc/gvOlkDz2ZxDhOk23mOVx1IR1WORj9Fq0W07pjStbV2sQmJ5mDj86rjbkzYg4gbJcnZIJ+CRczc/X32Paqh3L
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 11:24:24.9355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1d557e-a307-45bd-5eb3-08de90aa6535
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75EAF8F39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_122432_735935_60A56A96 
X-CRM114-Status: GOOD (  11.26  )
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

Futex hash computation requires a mask operation with read-only after
init data that will be converted to a runtime constant in the subsequent
commit.

Introduce runtime_const_mask_32 to further optimize the mask operation
in the futex hash computation hot path. GCC generates a:

  movz  w1, #lo16, lsl #0     // w1 = bits [15:0]
  movk  w1, #hi16, lsl #16    // w1 = full 32-bit value
  and   w0, w0, w1	      // w0 = w0 & w1

pattern to tackle arbitrary 32-bit masks and the same was also suggested
by Claude which is implemented here. The (__mask & value) operation is
intentiaonally placed outside of asm block to allow compilers to further
optimize it if possible.

__runtime_fixup_ptr() already patches a "movz, + movk lsl #16" sequence
which has been reused to patch the same sequence for
__runtime_fixup_mask().

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
Changelog v2..v3:

o Reordered this to come after the text patching fixes for ARM64.
  (David)

o Moved the "&" operation outside the inline asm block to allow for
  compilers to further optimize it if possible. (David)
---
 arch/arm64/include/asm/runtime-const.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
index a3106f80912b..21f817eb5951 100644
--- a/arch/arm64/include/asm/runtime-const.h
+++ b/arch/arm64/include/asm/runtime-const.h
@@ -36,6 +36,17 @@
 		:"r" (0u+(val)));				\
 	__ret; })
 
+#define runtime_const_mask_32(val, sym) ({			\
+	unsigned long __mask;					\
+	asm_inline("1:\t"					\
+		"movz %w0, #0xcdef\n\t"				\
+		"movk %w0, #0x89ab, lsl #16\n\t"		\
+		".pushsection runtime_mask_" #sym ",\"a\"\n\t"	\
+		".long 1b - .\n\t"				\
+		".popsection"					\
+		:"=r" (__mask));				\
+	(__mask & val); })
+
 #define runtime_const_init(type, sym) do {		\
 	extern s32 __start_runtime_##type##_##sym[];	\
 	extern s32 __stop_runtime_##type##_##sym[];	\
@@ -73,6 +84,14 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
 	aarch64_insn_patch_text_nosync(p, insn);
 }
 
+/* Immediate value is 6 bits starting at bit #16 */
+static inline void __runtime_fixup_mask(void *where, unsigned long val)
+{
+	__le32 *p = lm_alias(where);
+	__runtime_fixup_16(p, val);
+	__runtime_fixup_16(p+1, val >> 16);
+}
+
 static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
 	unsigned long val, s32 *start, s32 *end)
 {
-- 
2.34.1


