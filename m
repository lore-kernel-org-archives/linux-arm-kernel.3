Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2819C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uc8l302o;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=c02t5SUD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eAQMuCFqkm5Iw0rXx0pdSKd5pgC3Sd14wvjoDtrNkko=; b=Uc8l302oIHPGc2
	G7E4wQyUmnJjV48Ai/k19m4kSb5gFmCNcUMmFiuM6XTnWZaEh6nn1ZzjgPyaZDnnLmlo2xcgOAziO
	bV1T3+kEQirFa7VTxuOT7K034M31BTnC8l/giv/ngVrury7Baq/DOJcSyZYIiPkA/tAiwrDVq5Qaw
	BeZzPbR7VIEBOBFjdJzHfLzdVmcdQZJKjmQdx2CL3Y1bNGk2wuLiAVsWW9URvMryo2kETUfcSubWw
	CfqePlC8w+JTSrFcqLYFB0i1NJR6DeM8X8i/GxuqLCW0qBwABYcmoxQAh6VCAAToug9xLaH+Dzk3O
	Fitm9E6t9kuInIscKM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6T1-00000009MfX-0Osw;
	Tue, 20 Oct 2026 09:49:11 +0000
Received: from mail-francesouthazon11011033.outbound.protection.outlook.com ([40.107.130.33] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Sx-00000009Mdp-4BZK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUNvR2yEMcjm2YCbkw8455PGdDRJzSmaWlp79oo0lMLW4WxmjEPZHACriNVYdHdFssv5heZJ5ugw8BpnhsL+QR/AzkFkLPINGwkyeDPwV+IW3IZFrJNNi8bhig9GfVdlTbIVsIgcP4sSqGfR/X0eGAEPsrkxJxR560ckJR6qGHMMr5W+yViSl5CoBboxbLs45okfMpKVKlx1/cAUHlnecgzcvWnsvcm1AiajEcsDo0aX3IZwgEGQ8UVNRlm+l/RZ6M1tFRlVZni+/M5/WqkfGBaCVI4IuDHG7yLTumJzh+ZjaWtmzMgzP+wftv5BAFBIp4W6TGq+fX9SdYWeLp24FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAQMuCFqkm5Iw0rXx0pdSKd5pgC3Sd14wvjoDtrNkko=;
 b=KBtnbty0hrv2fCPo7TgP6KjhYzAxEguBufLmVahOVPfE5j7iaymDx1cycYA6y1aQwpvnkK28RTplMrvkoMB/kf2KAVu6cPXGgPgOIIBmVTsFOeFCg3EJ49zr/RrKu+LJ/XpioUuUukKFOFlb4rJQJkM+qZ0QsoKjry3mef0Ll6KRECCio/458NYZSyLZvYi6iZ1Z74++nyOdfkQl/aAtZo37RjLM/b2mp0rIXzqGA74lwtomez0wGSJlozdRKyniypA0WCAxhJLrec3P4gMrh4JwZDnN/Tph0hlRkovXa+z3hbPhWKfpyN9uZf7+Ik1YXM09aHnqS8hJs6T50pO75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=redhat.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAQMuCFqkm5Iw0rXx0pdSKd5pgC3Sd14wvjoDtrNkko=;
 b=c02t5SUDdMAElkoqJMvgszhkqEPjAj/OU2+X6T+tlQ3N97licYtYOMMifSFBftAmurvzfCWP3KOyxeGbHWYROUtnKHUQg8iB1hlW7Jffol7wY5QbUB6S6/FA+2G/IwXIbdKlanJ80GeHx0EyfD0zppX4QRllNkh1BEKCzdUTjAAd3C+MWU3y4ehVd2SLucFZeeQfouuf3CqZ8TTjUK5NxQ6Oxx9EDGE9GS58ewTt9METI6YmsvPap+6avfipIOdw/8uVDnHqaLhIzqtdfFoPi7RZ7IF7hzBArCe09RTQ2m7GbaJbXzFejPQmmZDqXsIt99kL4DPkf9kyuJ4uGmzV/g==
Received: from GV2PEPF0001A32B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::697) by DU0PR10MB6852.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:47f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:48:59 +0000
Received: from CPH1EPF0000052D.eurprd05.prod.outlook.com (2603:10a6:388::188)
 by GV2PEPF0001A32B.outlook.office365.com (2603:10a6:158:401::697) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.406.12 via Frontend Transport; Tue, 20 Oct 2026 09:48:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF0000052D.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 09:48:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:49:13 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 11:48:54 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] clk: stm32mp1: add I2S_CKIN as
 PLL4 source and keep boot-enabled clocks running
Date: Tue, 20 Oct 2026 11:48:52 +0200
Message-ID: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQ512oC/x3MTQqAIBBA4avErBNGwaCuEiGDTTX0J1oRRHdPW
 n6L9x5IHIUTNMUDkS9Jsm8ZuizAT7SNrKTPBoOm0mhQnSG5NWjr/DK7M/R0sLJsa0SPRKQhlyH
 yIPd/bbv3/QB9jnLHZQAAAA==
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792489734; l=1348;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=A1qHQRtKEdraKSwbj8j0VQxnLx3MOwkpUdv/Y8I9eXc=;
 b=BgesUDmeoWS6KmKK9tu6+Ncq5Yyo0VV+WQ72AGK9K9/i9+onsRFJHI+3xU7gX31J71K8Z8mz3
 uv4tIaEiF+oAVQJ0fkGTRShR8Nrfk+2fEYjDmI02t+CzatOULxjkf82
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000052D:EE_|DU0PR10MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f082a3c-8abe-469d-22c0-08df2e8f5c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|3023799007|5023799004|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: kCbPlrzN1iYAFYuGuoQBYj9yZtPOc8hXOLLpyXGrzUtmPNDIF1j4pj4usrkirYN24Hd00o7NxBRFUqpGp+wgkzzhsbFwEgbpDMWqVzjTze+MOqwVnKfELk5UFZhHEhFya9fW1nSa/zyrzJsIrJ1aSqyGnNk2KZ2anDFobaBmcxozvRT6wCfpKjZsWu7OXlXKKuLZNov1c+bWdCG+RnP6Rsd73iO7sqt6iH+q16h9zgeqXwBcy0LY5b8K9SLsjf16WXssbp0EWPXBy5uiVyS8j3mgVDW88HZqTqe58gvsUGRnyRT663LaIB3MdZL/vjox74XuX2/4pLItU2dkdFCqpGnybRRZt6TuuwLHCysFpvDt1jzYpGhadWcip2iozoPasMIrxkCu0TE+9WSQod/KSvmqDJDqoIHH5YnNr0zWr4Bo+kamtP4QH9bCfZBnxLsb13nDDl0D28x9cLSlnNKA+hjXUtouf7YaP5myfK7v+nuOZZOXQ+FsuD/Q8VC4hyqCRPYG2xmWW21sXZrd+f74jrcGXOozDbpY94sM9fOVSNctcUHOdJU5I/6XT2heZdJqYkT5HE9M0YpOAopgG0mMKTxRFDRsJ8iLIU9WF8cZ4BPWI4wcN+aINIbtuvvz+UVAC9aZ3UX587CX+y27cTzmI7sq5jEDF983reTwiGE+D9gQowGCnGARkENKD1Hk8LSd7c7xgnVBm/uCy6Qu0iNzEQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(3023799007)(5023799004)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GkF1S5qkYwPoIQoUCU4NYtiu2+wns8lalOp9lHPOCVuZ+/9L0mtOUhECAx211dU4fIbQ3kCtDc4lURKyOGhs2rwme/JuHM/BQQycUaxum9jmZ35Qhnx2PPO6jVdzdRP3W7Y5xIJ9cBnJepkTUwt/J/DHGcrywOxGCiJn9aGyaLbkzBsuiH8uPTGAWFTaf2jC9kzuwCGntyIDXG5lW7K6pppVsA/MFOEYIA+Hiyp9BP5CMkREankBGc/oXTGzzODg1URnJNhSGjEmC9NSebqVeiBQQLuTlptxYmovR+oD93AdMy/jv0Vl8AYLdmOWtpYdiFVsK/CED+hX9kSq4qGa2dW3pcrY9Q5mkmpWFF/0eXpwg2VApa483kOanNNW2uT7DsG2FlUcupWSc0WVgzeP0+rxAx2w8A5YjskFuQ5QvLzB5nO4LHqTb5fbHVrarFX2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:48:57.2769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f082a3c-8abe-469d-22c0-08df2e8f5c4e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6852
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_024908_535016_257FB705 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series contains three small, independent improvements to the
STM32MP15 clock driver:

 - Patch 1 adds I2S_CKIN to the possible PLL4 reference clocks
   (PLL4SRC = 3).

 - Patch 2 makes pll_disable() keep PLLON set while one of the DIVPEN,
   DIVQEN or DIVREN bits is set. A P/Q/R output enabled by an earlier
   boot stage and not yet claimed by its consumer is unknown to the
   clock framework. Enabling and then disabling another output of the
   same PLL would otherwise switch the PLL off and cut that output.

- Patch 3 adds CLK_IGNORE_UNUSED to ck_trace, as already done for
   ck_sys_dbg, so that a trace session set up by the bootloader or a
   debugger is not stopped at the end of the boot.
   

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Antonio Borneo (1):
      clk: stm32mp1: don't disable the ck_trace clock when unused

Gabriel Fernandez (2):
      clk: stm32mp1: add i2s_ckin as a clock source of PLL4
      clk: stm32mp1: don't disable a PLL while its P/Q/R outputs are enabled

 drivers/clk/stm32/clk-stm32mp1.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261020-ups_mp15_clk_update-5e5900c0aaa1

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>


