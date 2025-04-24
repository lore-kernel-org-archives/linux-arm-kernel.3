Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125CDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgFGM4UrAHc8l5P7MSQ6zM9EO/qM9t/Uhdc7+dyiwLQ=; b=uIwX7n40qp+1YxR2rT8puFVaJX
	isX6x++trJydrXq/sTmDVQdPe1a6GQMIa3X041P1ZiI/EKcHIc8s8OOVUmkT/KjP7Z3tvSmfR0KHy
	MsJT03aTdSvaaQyZGbvMYyZZu1UzyZRi9hdATeEsQsYcaTDEqUj3i8dlqyLkTGCsDiJInlqmVOxGn
	5T6Q0ImhtKGM6Csx6+zvnj3sDc9a9txb9TwGa2Xq5mhPxRuiMDCB04id5uqIw51TcsGoQdfRMiuV+
	BDiMzataUwuF8b5YR8SSIcecms3rXsBmgINyMMCgCvlLo372WitgeLkV94p/nyMKN3jDB+Torh3eF
	4MC6h05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vyn-0000000E4nQ-3AOa;
	Thu, 24 Apr 2025 12:47:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tn6-0000000Dfpm-1TIx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KgFGM4UrAHc8l5P7MSQ6zM9EO/qM9t/Uhdc7+dyiwLQ=; b=RBhd/oX3QpBYUs437LPpAuZ+A0
	8hXTDPRvlp7qd5DAGm3P0ZuEK3U/hdVpZNcrmhEc22x+FEIVUm+FYui3BB+ysqzpcLrmm8e7UTajb
	HA+OT6cwpWdNf2GS0i/bOt6JyWiSimcR7qiJhKOZPI+5hCfPsFasDzvOLI7rqIVjZqlk+XWOyEynv
	I8h5JUpHBdrpCdNZGhXdykXgn0Nh0W6xsR57QNliZkNh7n8akFiTYga5zQ+lLcCqy/p/u1y2qJ/NZ
	sgDgnjmGtBlyn2yiUtj3obyp6TVYiGSIC4HzWdVjAiDf7PXwMlpb5JUVBe5SyAeKX8Nk/s/5Ez3C1
	ypgX8sXw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tn3-0000000BjZO-2VFA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F6AEA4BFF3;
	Thu, 24 Apr 2025 10:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE98EC4CEE3;
	Thu, 24 Apr 2025 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490403;
	bh=Dk78WkgkowYSPPndroB+3TTj6jQAcxwQp1XS8EQ5gtg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PZrHJuOyOr+DjlEgWYw8lklQLm4mI8ftUNQPhpx6Y4rdrvD0oftIfPXYf48Hbd1hO
	 QMP7tzqYuFKcpKmpkYezNFR1C4l6jryEgzXCWrWAoh1QDCmh1CiuS4B0U2nEQOLEiS
	 HmaTbaCxh8HPByAvi13Pptu+caSAYGBCm69iUBXDAWzhMSaagjRwE4zn/cGg/uiUos
	 nxbhajYZKhBaUpFEK8JJYgSVC3VEJui9KQqmbdfF0WC2Pcn0G8K6T0d1Lz70+qDmGy
	 9bi/PUoGKLM/SFcgqMxuunSZiOG2H2IbS/Fhu413+NlJsGeByNrgUuzk8e2RfvjF4B
	 7uUm412twV8gA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:22 +0200
Subject: [PATCH v2 11/22] arm64/sysreg: Add ICC_IDR0_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-11-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112645_833379_7EC54125 
X-CRM114-Status: UNSURE (   7.84  )
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

Add ICC_IDR0_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9a2ddab8661c85586b0e91f7eaabd5a6b3409c67..1ec8113df713dfea6d38e39c42eba1e3dca5eea5 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2399,6 +2399,22 @@ Sysreg	ICC_PPI_HMR1_EL1	3	0	12	10	1
 Fields ICC_PPI_HMRx_EL1
 EndSysreg
 
+Sysreg	ICC_IDR0_EL1	3	0	12	10	2
+Res0	63:12
+UnsignedEnum	11:8	GCIE_LEGACY
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	7:4	PRI_BITS
+	0b0011	4BITS
+	0b0100	5BITS
+EndEnum
+UnsignedEnum	3:0	ID_BITS
+	0b0000	16BITS
+	0b0001	24BITS
+EndEnum
+EndSysreg
+
 SysregFields	ICC_PPI_ENABLERx_EL1
 Field	63	EN63
 Field	62	EN62

-- 
2.48.0


