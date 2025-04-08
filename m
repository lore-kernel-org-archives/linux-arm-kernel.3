Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB07C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VpPTyMpob64bmtSPLdeOS323Vzlu6TUyDVXKvCV4Ks=; b=rA0m6QPaZEsqXYc3dJwV97g9Eq
	SOOC+yLsArifeMokC+1nrtGAeyMfCZif6Uwzmtc6xRO+vGdrUmbNNCELi38dqKdaNuQseokzubMwC
	fKn031t9EyAoHN6sc35YONDtatMkc1Foq92UYi1fprnRYe/dCv+xDSNu6olrfbMy6eGbRxyfagriN
	ghaP+QnaUXqZZ1uY29dmuVRosR5dPZHIQaMiygHPS56FVTzaeHZ4pacgIRyIThmpYZJbrMGvQC0Lp
	I20QXd3lUNwD/yuSQTGHD17HTifz5Wfk0YjHTZkCH8k9rgA/EG0GCd1I/rcmxn++4TklJJ3Ar5pz5
	5WCxm+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u274r-00000003py3-21Jw;
	Tue, 08 Apr 2025 11:25:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Xw-00000003kC4-2Pzp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 10:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5VpPTyMpob64bmtSPLdeOS323Vzlu6TUyDVXKvCV4Ks=; b=mqeE8O4wI8/pBhq+26lU+uzwy5
	kN9ACiz4d88TWUPyG0vdv0K3pIlkfKro82TtIvFoxoCqSU7HO2S6rKXUFAcIeFOzmHSOyqf+0xl1s
	7f1+v3L0x+2zZ1c8IgYWf1WPB5bGbzQw5gSb3oKdyCbKqwF2GpJ51rzjGBj5fpKlLDMnxOSWT13jB
	ZtCfI+Pnoc2t+ffD0o7DG7kTH5kfq20b40vuV+Ou7/toxEuifR12ET4hJ2rW/oqV2JKpvyk6VMCfo
	8aKBOYGL6dKwbgBpGsvsDtwh34vtTwbm3vS0x22DJ66WEuH40mRnS56g2FaM/K62dByDCDwldNcLO
	xChZ/ADQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Xt-00000008GKu-3cMr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24756A43FAA;
	Tue,  8 Apr 2025 10:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73267C4CEE7;
	Tue,  8 Apr 2025 10:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109468;
	bh=OznnXe4nZQZT5vM8HP2AP0cBLVxiMADjBCE9cYkRzRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mLVfkvzJ2DMGQmfGN6IE3+UNqU0hXa2ZtoXJjYp9hs7CfIYOw/zMNtryebjBkt0pe
	 fH9dTJxPR1aV2lP48Ldw+MsTLjqy3rILIwr9mY1tkSBxt0uybRzIUMVtIypgYceEky
	 cwRXlMAiQhfQCspSJzcRNZwxWH1TcXgEwCOviDwF0M/wE1yawZXMD0ccXtiz8WKMEP
	 4oJw72rlUFBQsiUjHfWIjv47US+ciUytYeZapY6RA/HCvlLKcKjC/5LxBu9M1Eh8ek
	 n64KTb9py/uo9AcU8shsOqoyp1HGrKkMxR1zNmbWoliVgXz7WDZl7zf0YKnu71qMpk
	 tl+PpFtNYYwWg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:04 +0200
Subject: [PATCH 05/24] arm64/sysreg: Add ICC_PPI_HMR<n>_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-5-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_115110_090722_2B321A23 
X-CRM114-Status: UNSURE (   7.81  )
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

Add ICC_PPI_HMR<n>_EL1 registers sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 985f2cdb67cfec6df335a3951ecb63f128f6da55..d046d719d4f69801aeef51b5b9437a0eaa04134e 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2324,6 +2324,81 @@ Field	1	Enabled
 Field	0	F
 EndSysreg
 
+SysregFields	ICC_PPI_HMRx_EL1
+Field	63	HM63
+Field	62	HM62
+Field	61	HM61
+Field	60	HM60
+Field	59	HM59
+Field	58	HM58
+Field	57	HM57
+Field	56	HM56
+Field	55	HM55
+Field	54	HM54
+Field	53	HM53
+Field	52	HM52
+Field	51	HM51
+Field	50	HM50
+Field	49	HM49
+Field	48	HM48
+Field	47	HM47
+Field	46	HM46
+Field	45	HM45
+Field	44	HM44
+Field	43	HM43
+Field	42	HM42
+Field	41	HM41
+Field	40	HM40
+Field	39	HM39
+Field	38	HM38
+Field	37	HM37
+Field	36	HM36
+Field	35	HM35
+Field	34	HM34
+Field	33	HM33
+Field	32	HM32
+Field	31	HM31
+Field	30	HM30
+Field	29	HM29
+Field	28	HM28
+Field	27	HM27
+Field	26	HM26
+Field	25	HM25
+Field	24	HM24
+Field	23	HM23
+Field	22	HM22
+Field	21	HM21
+Field	20	HM20
+Field	19	HM19
+Field	18	HM18
+Field	17	HM17
+Field	16	HM16
+Field	15	HM15
+Field	14	HM14
+Field	13	HM13
+Field	12	HM12
+Field	11	HM11
+Field	10	HM10
+Field	9	HM9
+Field	8	HM8
+Field	7	HM7
+Field	6	HM6
+Field	5	HM5
+Field	4	HM4
+Field	3	HM3
+Field	2	HM2
+Field	1	HM1
+Field	0	HM0
+EndSysregFields
+
+Sysreg	ICC_PPI_HMR0_EL1	3	0	12	10	0
+Fields ICC_PPI_HMRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_HMR1_EL1	3	0	12	10	1
+Fields ICC_PPI_HMRx_EL1
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0


