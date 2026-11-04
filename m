Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1563B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4MT/IH32;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=iG7svQMA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5IH6dYVev4RYn7aCEz8B7Eh35JbiGfSg7f3KmIA1wP0=; b=4MT/IH32CtKq3YCLswXFCFsb36
	tMk/l5fHzKT6RJaunExsBTxQIh2D6a9s+cw93hwJ6ggUizhGS51uNgFENQ63GpByYoEP5lPaAdrnI
	U2A4VUOTvZg/Im2pmomLo33ETB6VMYoVY4YE0yzl6Hnlo+ig0m+pJoMN2QHsi20pgr3uMiYitcDKm
	oZsWC7bf7/+AjGwHKGN/3J2ZUQ+fnlcU35TtU/81KUfFH5WGggyPIqoX0lBYOMxSVcbo4IzO8EcOk
	q0F+xyoV4PVxWvsHI9aYdYVQrj0Igcp//G5rh/6AaX5pwNN/2MAEyuSyLMoPICPQZaKzGOCsf/PzR
	A63zR9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObZQ-00000005XjI-07m1;
	Wed, 04 Nov 2026 14:02:32 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObZN-00000005Xh1-2uh1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:02:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdcS0nsqoYWbOX4gfrV04NzKu1kbpcps+7268lmodZpbDjk8314fML9T4sdUos/p3qEsRrStFoDXChMb1Ta4qKMvAN7YSg7iNTNzSo4FF657cAAEMIrbPp4oe/dptST5Wnfhw2ihC/wKQBZhRLcjjZQA07iNzMlILaedpD9m/ZEzNlwP+dqtPvMlczCXwcMLplhMO+caIgXAJye6H0Qf+UghlQ1uewGznSoehQbTmMcCnuMObJ6gdM1nCyCdO1zym5EZ2esnXXYhC7atLAwpKxdDolQH+LzGKVQfVR4wRai2vwoZdAKgqP1Zq38FO/Y2LnAS+Gq2IeGJ9RGG7fGUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IH6dYVev4RYn7aCEz8B7Eh35JbiGfSg7f3KmIA1wP0=;
 b=rh140jh9MOf55RuDn8Fc+RML3pFFsaifpgX6CLXRx2T6hwoB046mK2zNr5kz5xlzBF/uPzeefjesIJMwrU5/MkYxOc6GjN29M4PevRcYy+LRepZNB+PPDzNF5rAx0mWQYkLZy7yTr4kHdX3H7sbZdJrVKvp382tnFbkNJytffuwktACqJqJhcVP1ontSYgScXiQTawKrDoYksY18eMQx8d78Xr6YxKPErdS3u++al7Ayg8B1r3uaF15UWAyN78IDEg2aBjIAYZtuE7ngUXfp9E/K+K8/RfSZnWXz9SoegsJ3OSAnYV19h23PyVqxluWM3+M/fbNAYV/ofmEjjPJ5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IH6dYVev4RYn7aCEz8B7Eh35JbiGfSg7f3KmIA1wP0=;
 b=iG7svQMANy1ortm1zHu3oknC3JzkJheC7rSU+TNZYsu/873EecwqTPkioAEyTCpSF+WFwVicRyK2Gq9tPipf2Z9mS409KJtH8QkkpzPozaXVB9v+AEpw42kr7wuCycegk29/Q7qD8dLq7kY5ZppGUtowVCuQJsht4W1fUjHkjcZbdhNVoLsuvZrXXm9Fax/97bgOerm2HHA1AfjS+cc2fkH/2KftFiSy+AilayZO4ztbDlSUNhLsV0m5A0mx7rjupocdVzqrtIBK6t86OIQJHkwFzsDmnaL1dWR39md3N0GO6BaEjfTDCRdLuLIGThKVE3iiiLDqmrexH+OVXRnixw==
Received: from MI1P293CA0024.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::6) by
 BESPR10MB992274.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:10a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 14:02:24 +0000
Received: from MI3PEPF0000848B.eurprd02.prod.outlook.com
 (2603:10a6:290:3:cafe::51) by MI1P293CA0024.outlook.office365.com
 (2603:10a6:290:3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 14:02:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000848B.mail.protection.outlook.com (10.167.240.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 14:02:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:03:02 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:02:17 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Alexandre Torgue" <alexandre.torgue@foss.st.com>, Ulf Hansson
	<ulfh@kernel.org>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: [PATCH 0/7] arm64: dts: st: add STM32MP2 power domains
Date: Wed, 4 Nov 2026 14:55:03 +0100
Message-ID: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848B:EE_|BESPR10MB992274:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0d658a-0e0f-4143-b110-08df3a7c404a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|261022075727099003|261022105027099003|11063799006|56012099006|261021123027099003|261009223027099003|261028144727099003|261026140227099003|261021121427099003|261026121527099003|261102123227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: gvzrh6nfqJnO4+wplDXV6b5sF6hwpArmYp/InKDtOz/72iSMrJ0+6rW6FokAsim9f15gQTRfP+P9H6YURbJmMPizfm+2iq5ACmUPTTv5vBnfmdJsofgVCMKijpndYyb8tbnzRBSUkcZhOl3vXhLS3R5q0qKzVpmzUJDJPDnFNEE/Ph0Oaz1N2iyaEkp5RCo3v8fP2aoKw2XPAXARO8X9S/INjVA9Wugx27au5wdd4olwAWLQM4YMz9RLEqAPG6oBQgHqcLWq24qhXO4jMxjik7Vy+3E0N3410on+9aK4wHH3nkHObAFeZSG6LAf2Ibr3M9Iz3Q4EAZ39GNzCZ1+q+9WztA0+U0kW/RtknDIML6bPQueLNcExsWlFFwfmTy/zfw/TM+08vbvFyTMaC5x7iJ1ns5A9rqa+XVWSOHGGy33UcrZmg9DiqJfuGZWKjoftUeernyko09rhsyIbHymVXN0tEAtyn9HH0uX2tPFFbwhZQQEDe3eA/BC1qHU5gdeaxgVyAorvjCxlwJosz3mkrjcvLvi2ks5Cp6L7mHQlnvkqSUH0Te+fyTI76Zjx9eKmu6xQgcx8BC1cBRoBpzixrqk7Zvx7/lvSvLgy6X2fLbYPrUmALGKBokkY8gRAxEs1eqfLVYm7jYOD9DdJ6aVzrrBEH9+huqrQODJy1EZnvOtI3whqHAG6H8mzstHhKtY6B62pDMB1EDjXXaHmLOPhmQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(261022075727099003)(261022105027099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261028144727099003)(261026140227099003)(261021121427099003)(261026121527099003)(261102123227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jt/0Ihw35Pyf+mF3PpS0Z00KEGKQWEQ69yzB0eo7CFWEmmvKKqUhJQyB+y0BPabUupcx+3qFCPuQ8ZJrgN94hvgKU7SwQjmVadN+cyf1Vd9N+hE1NlBxFQnBd+O+XuqlhGzC68q53T4+1zbAOFM4mLFoJoxeaSb/M1K3rpgE07WRkbJ09UL6Tmw+tV7v3BMJjjvv20y2BPwqGBumlvcChEeNhWlhiIZVfHddK0P6jA3ll52Dr7pbfXzm5dTUIa5ZRLCcRbcm4Z4O2Fyq+iatNtsPcIhp/0vca2S3CtjI7JoDk2TiQ54NwxV2R3abn8qWMaibTCHXq+El3PFuw8ZiPlXilKRZgJ45gTh5eMMQLOAq4iyrHEJIVeLi6oAmF+9pk2sMX+cIfHQ18Aj6nxLuHJkcwQt5yPyhREM2/lrL7gnTcQfsbOOV3gHiB88mYUKR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:02:23.8494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0d658a-0e0f-4143-b110-08df3a7c404a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000848B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB992274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060229_756526_2772E100 
X-CRM114-Status: GOOD (  14.62  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hello,

This series adds support for the D1 power domain used by the STM32MP2
families.

The new power-domain driver uses runtime PM and the clock framework to
keep the Cortex-A35 cluster in Run1 for devices that require it, while
S2Idle wake-up is handled through EXTI1 and retention PSCI power domain
(RET_PD).

The power sub-domain D1 without GENPD_FLAG_ACTIVE_WAKEUP is required
because PSCI domains manage the wake-up path since the commit
bfd5859709ee ("cpuidle: psci: Activate GENPD_FLAG_ACTIVE_WAKEUP with
OSI").

This patch is a preliminary step to support PSCI OSI in STM32MP2
platform and the same power domain will be used also in STM32MP1
series.

The first 3 patches introduce the new power domain drivers.

The next patches add this power domain in device tree for each STM32MP2
SoCs: STM32MP25, STM32MP23 and STM32MP21.

Regards,
Patrick


Patrick Delaunay (7):
  dt-bindings: power: st: add STM32MP PM domain binding
  pmdomain: st: add STM32MP power domain
  MAINTAINERS: add entry for ST STM32 power domain driver
  arm64: dts: st: add D1 domain for STM32MP25 family
  arm64: dts: st: fix power-domain labels DT coding style in STM32MP25
  arm64: dts: st: add D1 domain for STM32MP23 family
  arm64: dts: st: add power domains for STM32MP21 family

 .../bindings/power/st,stm32mp-pm-domain.yaml  |  46 +++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/st/stm32mp211.dtsi        |  37 +++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |  54 +++++---
 arch/arm64/boot/dts/st/stm32mp233.dtsi        |   1 +
 arch/arm64/boot/dts/st/stm32mp235.dtsi        |   2 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 126 ++++++++++-------
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |   9 +-
 arch/arm64/boot/dts/st/stm32mp255.dtsi        |   2 +-
 drivers/pmdomain/st/Kconfig                   |  14 ++
 drivers/pmdomain/st/Makefile                  |   1 +
 drivers/pmdomain/st/stm32mp-pm-domain.c       | 128 ++++++++++++++++++
 12 files changed, 353 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/st,stm32mp-pm-domain.yaml
 create mode 100644 drivers/pmdomain/st/stm32mp-pm-domain.c

---
base-commit: 7b3f3e772d5107c3a59b9f2278e9aeab227b26db
branch: master

-- 
2.43.0


