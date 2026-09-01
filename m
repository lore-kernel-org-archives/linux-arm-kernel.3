Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E52EC624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQ1J7ENqs9S0oSd211AYGOjI8j7Dn3LWfbBOW11bjXc=; b=J2E9drSsEOdNCATtIumjoOdC+M
	O+cDKc/SSvYXDOGNEonRkwpyga/LhT+CloE3w2GiYVP4XA/CAQcuPqiAXmcuWS9teJEGr3xUmCYlB
	VlQOnZ1ejtIRBXiQ32oMukHJ6px7lFZRuVlh1OHnIdRDp1JH7Fm815GMmtcxZzMi2hyrrCC9OgvJ9
	IfLD8t4kjPDyTKP6dXy6vidCcQLceBAh2VwQpRpND6dSqBa+AFcm3ITwDrYi5xQZbGj3DqDnSLgX+
	cnYPKeal2OAHTjjMY+C3GuHrCJGdu9+jn/w4d4OPqklygXL8hrTghWAhthNLCn0Nu/u4re5VZGY5Y
	U+fOls1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Kfh-0000000BPFf-1GHK;
	Tue, 01 Sep 2026 09:20:49 +0000
Received: from [38.71.22.102] (helo=spam.axera-tech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Kfb-0000000BPAb-3Jsw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:20:45 +0000
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 6819JbJo047673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 17:19:37 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Sep 2026
 17:19:36 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Tue, 1 Sep 2026 17:19:30 +0800
Subject: [PATCH v2 3/6] arm64: Kconfig.platforms: add ARCH_AXERA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-ax650-v1-v2-3-993bea305476@axera-tech.com>
References: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
In-Reply-To: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>, <hlleng233@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254374; l=759;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=ZwHs0S0btepTACuCuCb4VlyK6Zr59+wGS6ik+6j6IFw=;
 b=iBYMfgOq0yyso3QDB2sGEFVsgHzpq0sydRDMll7jVrKtuNYyBUFPDLO552fFtXBidyfOvsHjj
 DqJKjxrTEk7DWzXhzDOD/4dOugkV0h1XVLfdTRgxdp/PbL64BF5PFdT
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-Originating-IP: [10.126.103.103]
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-MAIL: spam.axera-tech.com 6819JbJo047673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_022044_151549_A593D808 
X-CRM114-Status: GOOD (  10.64  )
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

Enable the ARCH_AXERA platform option for Axera arm64 platforms.

Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 arch/arm64/Kconfig.platforms | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..a6f2f009461e 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -54,6 +54,11 @@ config ARCH_ASPEED
 	  This enables support for ASPEED's SoC family, such as the
 	  ast27XX 8th generation Baseboard Management Controller (BMC).
 
+config ARCH_AXERA
+	bool "Axera SoC family"
+	help
+	  This enables support for the Axera SoC family.
+
 config ARCH_AXIADO
 	bool "Axiado SoC Family"
 	select GPIOLIB

-- 
2.34.1


