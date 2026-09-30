Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD3BCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bQ12n6iK1/inIjyQsmoGzhgOcT7vWlGjUNusmai2DOQ=; b=zg8R/8quU550hA
	28I/kdxLXBQk/EnT1Q0OMUYMASz4Ws7Jv7X6uGNzwANig2l+8gZ4eV4kl/BYVxKShvRjHEyiRcshL
	4N4qWIXlUVyehxJ9HnRm41LRP1AO0OyIPkq2WXj/rQR/wabwtrx+u6OU1IZHvfcPyrQ21Zl7qA+w4
	E0tOmPLqdginlFTzA+JxnpDTFvR0EdzxgeclVwXzSrfEQ7qWdlz8M2L5Yma8+i/As7OMBKbuPIL6G
	fDdNosDH2gnoNj1UaGeivYiKDvgKeveObOmZY4z7m2/k9VS/tsEBID+NwGQPoDze2Cm1AP9Gc74PN
	GimdH9WxSYqSt42LZUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoxI-00000005Inn-2Gs2;
	Wed, 30 Sep 2026 07:42:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBox4-00000005Ijb-22U3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 07:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bQ12n6iK1/inIjyQsmoGzhgOcT7vWlGjUNusmai2DOQ=; b=VPNvgFAVh5+pEVIhVDHLFT3RXC
	mmS8R7L9MYr7LMCyXwtmZs3GRxcJMm8lPv3kFqFH7koOdAQYwpEVGFCZPPmCMq1v6yUOmWL25eGwy
	/LWIrWcQxA74/ixWk+CUkTjTXRfGPv1vrUg9G78JbLwEfk/cEAvoNyA7nnObnEpbogzh5Kv5LpDwI
	4COxDGFt7iNJBE2crUIOE2bqSB48LbdHS5L9oYEulNE7qxor1noPH7LLYc72j1o+a3qBJtkucBSFt
	qES2hoVNGgeMjX+Yncke1iED3MRAG4lZel1sy82YLAM0XqoN0PqjgQx0LIDPflojEldiPKvJzFpIL
	QAMH1cBg==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBowu-00000003U4F-2OI3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EL2nl1lMYMIQQvVj2QJ2wdaSmwEC0gCVl3Zk1RlwO4uTmtT01n5cp9rtf6Y80GS1qXIHtpcromQJsyPqoRBdMo/fyVlza+C0nsqv2EQ3qLVn7XllVX74eRURyLRC4TcQOMmaRga4ZN5XwO5rf1Zb0UaCmHhQd5ex2C0hLNA4pmTbfoD42zb8aFc0RAOp7r55zlyj3I8nj1+Vj2YWQo3XlynEKokcllnEMle7BW7R2Pw269SzPtsNKhxzLUCLS/Z6nmPY2Wgp1S9bNBRpQ4ysITFei740l3zZfO0ZJVmezPpAfvwdnzw7SqM6bBeBEVQfraEsaFFYMB+II9i0yoI29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ12n6iK1/inIjyQsmoGzhgOcT7vWlGjUNusmai2DOQ=;
 b=X0V2QQrt1e1ZzYcW2XphJEwf0nMOc0M58MBQwvIeSWMxoI98xlZYViOKSudClEijzIW0olGZ7k8JAb8fefgj2BnyDkL7fTnxAE+D4KUXCkluKlmrmsfcCOb8nu+nrQqjKGTJnSDHTuRf14jPyCeAsCxV3EBzmgcPekfaWvNlpujwz2AUhQlLS0NTe6+iKMyhwa9WMqRL3Yuqy7VjOyn1J7li0dz35qqV1eAn+EYT4e6ejW5jfaGA1cuUaWIklXbiDSS/ks2jPp4JNHZmFSHOy+5PScujnBRHbtVJMO5g590mTudgNtYVHjxa+9Hrf5NX9rG35tEqc3MWzSwUxuhqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQ12n6iK1/inIjyQsmoGzhgOcT7vWlGjUNusmai2DOQ=;
 b=mcYF27i6v5UuQcWTnZpDYV9JwwEKgJqOZ6NffIWHWxHX/p+BxYd4AYr4sUY1jfblCw0DfDNeAKYthpFDU33zU1BJWCTvdrl8qu7RUJzIDOsqp2iX3VwBHyMEGNHDJZU1m0vMMtvYetHR92GVPs85yTt1/PBaKIlsJb7pRf/5oGZdXIPV1t90nFDGMDodKdFVIBGQKtiYcxvP6m0/bQvRmqF1CUcOuU15LB9/XkEHOcOursD58jHcVT6blRaNNHFTOsfedQVYqp9q6M6joPlNcdIxdrLE8Bpawb8+5XRp3Zw9NFcf+EYAsnKZWIjBi9m4IPBTbGi2dGydxomcX1pXRg==
Received: from AS8PR04CA0183.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::8)
 by GV2PR10MB6982.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 07:41:48 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::ab) by AS8PR04CA0183.outlook.office365.com
 (2603:10a6:20b:2f3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 07:41:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:41:48 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:48:16 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:41:43 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v2 0/3] Add STM32 TAMP nvram driver support
Date: Wed, 30 Sep 2026 09:41:41 +0200
Message-ID: <20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADW9vGoC/3WNyw6CMBREf4V0bUlbebryPwwxUC5SDZTcW6qG8
 O8WdOtmkpPMzFkYARogdooWhuANGTsGUIeI6b4eb8BNG5gpoTJRipLPEzmEeriOHkMiPC0+oOV
 dkdRJc8wLmWsW1hNCZ17786X6Ms3NHbTb7rZGb8hZfO9qL7fezyLFX4uXXPBUSS0zmacaunNni
 WJysbYDq9Z1/QCIIBP50gAAAA==
X-Change-ID: 20260909-upstream_nvram_reworked-f84a4b37817c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|GV2PR10MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: b083a76f-4ce7-49d8-ab3d-08df1ec648e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: cWt7LYJeVLUSEJRoR21g/CINvkRhp6yDWcHbRRmVnN8WVUcnBLxhvmgGAvi7xEh1CrpBphR0DGR90Ya49kD3Qn+JmXjwGwXW+GZe4fFE5OKAbc7Cpz/Dfg+d7pu7kRKVa8cHa2F8QyjS5lODLcOdhaP8rR4XHWfAl24XeujrV80WfcdoKTGPrIQkDhpLA+RIQB9DiPZVKnHKo0KBB9Tld0mCPmDeot615rH2zf9goAFeguBm9DzkjEWwj/D9jwIkWaSMAvj95Z2V5CApcYp0NaH8865ImAR+nsKLiQiKhV+94s6QidplCVzgbj6Pk0/ldnqmm8STlOaJN/YwTmO1oVIvXdgoAMAGhnrcbXmKfnvH07uBsSnaKWPlxtJWjf9yWo9rAPwven4XriNW9Q+mW483yWPWjG0tptye3wKD330ow7zNXVf7fNCMSx6cblSWahHLqATZhI8MCzJKHKvfAwyTuKJRhQkoHPmvPJBSSdRAEJoopJvcHH3xF2H9e2E5MUuqR6mvGv+J4sTwCqzCg+jQZMexVl9XDiCoPaDZPZWRPISGZq01Q/ID0qWaiAhA1L2zqPLhl/3vxKvnlZsDPqKYKpOqS9EAcFA74Izu5D0bia+RHtrolHFQdX59l+Sq93PVT6oQRlDJ3lKBe0cwjg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LDMqA0MiJGRpF2aV0iaO3xCGJ3xAsgPrhiYweuoCZ0RccZOWmj1SH0eGef4+xXw5XH2DvwaPW+iFdogN/JLuUtWoWVPVXrCQN/TOTrUrTnzI6r21tFB5jC92rLp9CtiElC/7nMSCJ8ZQmkn2M99sq2r8QF2W/l0lsvH3buhtSUgCSCKv0iKI6cjQDpNEX0h/6uNPPO5TYpay+AqgVXJT/X9Mj/QSXM2y4j/B9ZE3l+Fo+HNDcg7nszb+hIMat1SWpevU/9tX3/0/cXpApiXOO2GzT1xlCRFhXDy92LXFGq8iU5uTUpjvaWE5vEmHURs3KOtKu8UoU9muWQQ45Gfhjnbs51H0zOLKPLkhEZwfV0sY+YPN9p7Shf/FMib5O3Ip8spYtu5a7F99mIkneh9udQRMvTHcj7nZ8RCOwc3evfezgWEscj0hTB9LrkJ8RI3M
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:41:48.4199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b083a76f-4ce7-49d8-ab3d-08df1ec648e7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_084201_958276_4CABAB59 
X-CRM114-Status: GOOD (  11.88  )
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

Propose bindings and driver to enable TAMP nvram driver
support for STM32MP SoC's family.
It allows to expose TAMP backup registers as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v2:
- Update commit title of nvmem dt-bindings's patch.
- Add required compatible for patternProperties in stm32/st,stm32-syscon.yaml.
- Fix issue found by sashiko-bot:
  - Add freeing compartment_owner.
  - Replace regmap_read/regmap_write by regmap_update_bits in stm32_tamp_nvram_write_byte().
  - Update error return in stm32_tamp_nvram_read_byte(), stm32_tamp_nvram_write_byte(),
    stm32_tamp_nvram_read() and stm32_tamp_nvram_write() to return the actual regmap_read() /
    regmap_write() error instead of -EIO.
 - Add freeing field and update error return values for stm32_tamp_nvram_get_backup_zones().
 - Update error return for stm32_tamp_nvram_probe().
- Link to v1: https://patch.msgid.link/20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com

To: Simeon Marijon <simeon.marijon@foss.st.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
To: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Patrice Chotard (1):
      dt-bindings: arm: stm32: allow TAMP nvram child node for syscon

Simeon Marijon (2):
      dt-bindings: nvmem: add STM32MPX TAMP backup registers
      nvmem: stm32: add TAMP nvmem driver

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  30 +
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        |  57 ++
 MAINTAINERS                                        |   8 +
 drivers/nvmem/Kconfig                              |  10 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/stm32-tamp-nvram.c                   | 742 +++++++++++++++++++++
 6 files changed, 849 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260909-upstream_nvram_reworked-f84a4b37817c

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>


