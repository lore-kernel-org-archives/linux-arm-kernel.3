Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD8DFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JisPYYQgf5XYS6EwaE6wrVLU2G06yMemARwURYYVaJw=; b=HYwJPqyf+iymqy+LiqZzy5+QSm
	ab8hMEx8tR0MBDfw2Mgox42b9pX/HWa3A+PHc6HtIBVONCWzsoQzcnrLgEZCtX3H2xSMRnw7H7UPK
	TJ5SGcpRzir12bsb0LkX7GpxFSP/D/h1bo0C0K5QMUEqxZRvL3ZwhZE5zbY/IsV2EMRsNrM0Z0jWJ
	KIVsLpE+kF5bd03G6SrcODuANdLHtHJW6AaK4nNerDeWFtHLSSrkX/yQTvwJR1NkkgRL9afv51grs
	CKV2dTnEq9h1m0/bVYFNAv79tebusdl4M5JzJFhZ4sVX6SC5zuMejjO+90+XFAL8Xw72Mp+ankye8
	6UUVGmyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO1l-000000057m9-0BXN;
	Thu, 30 Apr 2026 09:49:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO1j-000000057kk-2Wb9;
	Thu, 30 Apr 2026 09:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JisPYYQgf5XYS6EwaE6wrVLU2G06yMemARwURYYVaJw=; b=ceiH0ef0xlWtpQemvXQaF7/GXm
	lmvWRr7lXkMMYZiDIB1syF8zp5FcEhL8+GZ1DBkLBnQgEsCGOvK0P0WJ0kzvH3Ipc4IQRXazljP7b
	p0PQ7WOOjchba3N7bc1QZXg94taNY0e9vUsFdngW64BbhgIf1xoMBNA00UbVkMRV/rUQAmA641Hyo
	bvAuJ9skTeGh4ddyA96xBy194ttd7oih01tWBZ2E1A8VqgLCP+sJ3Sxvp8ZfaDfKcrIrDEnaKf6Nt
	VTtelESgz1U8e0VsixtfMTQ6D+3wnU1e5NmQ7NgaKCjAf4uUc5yuJemrqCLAXSVvajMnAOPTkMUoX
	6jL3FR0w==;
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO1e-000000071zA-25UT;
	Thu, 30 Apr 2026 09:49:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtCCX2WdBqMowhb//xoAqb2opfBcB+f5YcN6xmPaDg9leh+ffcWrr7+S534gtx1KpWfTnts4pYf9wGpvwpsJ+zrWNdr31L6a6WPrFD6Rp0mcPiknnKWGvhudhcj9DoVjhZpZPkYX+qWxm20B2bOpGhcnO3FwzwymwyMVbb3OQUjQAXGAqPhGxQ23LQ2sZQI7fbmr8FgMBtkfD45niz0RULjK+68SO/XQw8x1U0PkSvsSlUQhv7xxYbE1XEFBcsOCuwKxaRrSo2J6JanqlimjefbQ37VeMr9Stou4d1QvdZet0f8c+DuLY7x9c6SLNjR4qC3T/LZSjR370xgunYP74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JisPYYQgf5XYS6EwaE6wrVLU2G06yMemARwURYYVaJw=;
 b=nj1vUHIRdDbwt1QDeYNbaEYQn5n54ECa32JbI0v6T83BGJtteMjgpdWrvw0Csc6QppL7xSqZPLucf+2XDtpoX1YLAtvhXLjcDFOckgS8j5a+WyoizSv9yKkpyjCcslyKhMs+pwlMwqs1lSwogVL+zBJjTzdQQ3yf6F8xB+7WgcdQgmvTUhgFbe2HlaUnh/+gzGAtD4z3j3RG9CNjIQciywigfw7aGu4YFDKrfkqxfdZnEL1vfa7eLRaHPfGTqaYcyS8WXNuVAWlB1N4E33JCiNRmg3H08d4q+dmusVnWWMytyfLFm8V417EOAYjAQ/tcCaMFIKrGz2dqhse9uR1VtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JisPYYQgf5XYS6EwaE6wrVLU2G06yMemARwURYYVaJw=;
 b=hHUyt0A2GNxYinvqbzyAZcNoJA7mVbk+/gmgL1eeny0fEqdVKoM68IpUvwC6Pi1LltUJxOWIIMdDaUeLiQyYZHHaMqpShKoDQpcy42Htz/XRLcooN5twYT0wVdoe7/bYBrenSvGjRtaWBo3OjHFhi9P4bIvC5oylBQToseTAla4=
Received: from CH0PR03CA0070.namprd03.prod.outlook.com (2603:10b6:610:cc::15)
 by SA1PR12MB9470.namprd12.prod.outlook.com (2603:10b6:806:459::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Thu, 30 Apr
 2026 09:49:35 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::71) by CH0PR03CA0070.outlook.office365.com
 (2603:10b6:610:cc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 09:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 09:49:35 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 04:49:28 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
	<guoren@kernel.org>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins
	<charlie@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Charles Mirabile
	<cmirabil@redhat.com>
Subject: [PATCH v4 5/8] riscv/runtime-const: Introduce runtime_const_mask_32()
Date: Thu, 30 Apr 2026 09:47:27 +0000
Message-ID: <20260430094730.31624-6-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430094730.31624-1-kprateek.nayak@amd.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|SA1PR12MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1fc142-143a-45d9-56e5-08dea69dc96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yLGlxJEX9K6sL+df1tjnrqey795aVxmMIvgX+jSOmwItNaFVUeYwp9bHQi9d76ALlFS85a3PnOBI6SLQsYvfto0BMpz+GX2bG9EFGMuh6o+EGmW6M6OV/W54gG7T30OCb168ZPuYFJlAAi+JHk9Tm7u78vTI6kV5nOylk46A5G//BahnjIKCO0QlEgLqnOwE9D+Gc9ByLO9+RximaMVr/lcGF8T8nFjo/unY1EyhxF+1nE5IivJt8JmtOChV6bqA0lBL4hN0fYKMl9noneH+780veJY3fKqWk/pyxs5MReRKQbUV/JHZMYp92+aZiKPWkK6YP4MZ1H7cuIfrJ0xReTkvpnZ3nRD4uRC64y0O/cfowf9ZXsshEtGIIPtQmLApMPN1pzYlVpBF1kROcKybtv9sa1I/w9pseiFCrJQ5zp+hWtqKGdnMBI0Hkws9QI3zFr6s46Oks8Yd7lcgAOOvKOrc0+yaKA1+SUUK+RCptpOcO/nsvDKYkkCH5Ud8EyJ62W/QiUgRg1HxeUhsfnYfciNlNgRSw8osKqjZDBh34LApKosQbu1kJ8Az8x0zcv3DO8CML/MLFyNP9JoRUZMRvhMRUvOtQSVCMw1yO57O+DhquRlngBHoWQxBEoN2FLsYHpeyZWHN5A1Zfw8RADxv0/N9diGdxRgFbA+smvI35or6Vg3AuxLmnE+JxvAsyzaRz1vJd4Y1Hg1CFWZCWn4l7sxuiBNjs9xfc2wLkuVyM3+BA7YQ5pQknmVkVo+7anWAqkyXPU2UGxzLD/tBS5P2EQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /qD8qY+l0A/YXTiI+KV9iIAdyy0HbICx6N04dKD9CsdX24Ocag2lVF822qfvN5EyJwoBKWACmuCpZiFTHnGIvxBYB3FGAR0JtHemUABfkfrNac+NYeK8nQA82NcYSNLDIEV0ZgQAjICYkWTdryjWMpEf0WFf1iY9jPExHlNrWsATTv2eJ6h17fnz9Tk+Uw/313KS/Uqxgb+jgEkGpG6L7eUkz5jbJckjt6F9uTUbknSoLwSIMw7lNyqXDiD4OhyC/GNCmC0A4fdf6XVUkoD1102xzBbpr5dSoCrfg3Yb21Ckm9klG8lwtcBdxe/HX31hVVCQGN2t09j6GYsjGRdG8Pj+C91KQvB+7dr6U6Um7s33p97wjJV82DmdJy6kY3ZQOMGQIoXVn4dgVHSEO6ZOJwGQHeE7cwaPsl7zWXmjanHxdPdgBH2uZOpbIJ82DgH2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:49:35.1959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1fc142-143a-45d9-56e5-08dea69dc96b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_104942_669055_5CFD65C3 
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

  lui   a0, 0x12346       # upper; +0x800 then >>12 for correct rounding
  addi  a0, a0, 0x678     # lower 12 bits
  and   a1, a1, a0        # a1 = a1 & a0

pattern to tackle arbitrary 32-bit masks and the same was also suggested
by Claude which is implemented here. The final (__ret & val) operation
is intentionally placed outside of asm block to allow compilers to
further optimize it if possible.

__runtime_fixup_ptr() already patches a "lui + addi" sequence which has
been reused to patch the same sequence for __runtime_fixup_mask().

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
changelog v3..v4:

o Reverted back to using __ret as the macro variable to prevent
  collision with local varaibles at callsite. (Sashiko)

o Separated out the & operation to prevent any confusion with operator
  precedence id "val" is an expression. (Sashiko)
---
 arch/riscv/include/asm/runtime-const.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index 1ce02605d2e43..684641cb0fe82 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -159,6 +159,23 @@
 	__ret;							\
 })
 
+#define runtime_const_mask_32(val, sym)					\
+({									\
+	u32 __ret;							\
+	asm_inline(".option push\n\t"					\
+		".option norvc\n\t"					\
+		"1:\t"							\
+		"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
+		"addi	%[__ret],%[__ret], %%lo(" RUNTIME_MAGIC ")\n\t"	\
+		".option pop\n\t"					\
+		".pushsection runtime_mask_" #sym ",\"a\"\n\t"		\
+		".long 1b - .\n\t"					\
+		".popsection"						\
+		: [__ret] "=r" (__ret));				\
+	__ret &= val; /* Allow compiler to optimize & operation. */	\
+	__ret;								\
+})
+
 #define runtime_const_init(type, sym) do {			\
 	extern s32 __start_runtime_##type##_##sym[];		\
 	extern s32 __stop_runtime_##type##_##sym[];		\
@@ -262,6 +279,12 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
 	mutex_unlock(&text_mutex);
 }
 
+static inline void __runtime_fixup_mask(void *where, unsigned long val)
+{
+	__runtime_fixup_32(where, where + 4, val);
+	__runtime_fixup_caches(where, 2);
+}
+
 static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
 				       unsigned long val, s32 *start, s32 *end)
 {
-- 
2.34.1


