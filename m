Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611EB60A260F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MmWru3aj;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=anyJ9zVg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mEVijfwQXMGRpkR4jQ7zecnwR3MLBwPWs3hjBzf1iJk=; b=MmWru3ajzWMlnFNqWmaTk0fz+4
	BBTPVXGr9nDfrg3lNQAvpOH5QivhjmAk3wWyGkCYrV6xdPAPQZZ8PwY1a1I0d/gCWz5YVKIrWGwSs
	HI6s/iAtiE/1xLqWbGrYSOP9pkOmVYfdw6MJ4coysm5T33tze7+Ugdy03dzHc0DHZ46JjW/W6P/rf
	PS3hU4Vd9B3jyqpPpjQcGMSeaQxYyYsaH1VwwUMwX+yvqi0iZM/gFiB+QHmyKv95tRUwzc5jmrQj2
	QWTl6pjpoWDRQSXPOj+Gz0fXZI+14bVy5UTMXt/IAp07Qg0xd3SNgapvIji48QN7NOCBPLYJa0spK
	RLbtg2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2Y-0000000GSOf-1HFw;
	Mon, 02 Nov 2026 12:21:30 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2V-0000000GSNR-2g17
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:21:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0OPO9c8KdJzBZj1cRLR68Jyoudi+hRDlS8hjrqvQd+I73ezi7MNXNsNUVF0YP7H7wbl6xIcGuwrL0lp8V8MqDX2Gy7eg/I3wBHqdZmI4mj/YVW97niUily1nAqSERY6jiyzl1HYF9/FRUFjjY/MpzHzRgRnXnZrK8JwNhawcbTKH9GWT32g1p7MSnA4216HQ22aA9RRmCr0R9lcZ+cAMjCQCWeGAVsQXcCnH0CHbJazSysEIrbbp4dIFNtZonM6xFd8kPdtwx79+6A7W6Ivv7ygmg5xKqF12nqh4dBuWnFV63nT+eVusw/eaagmFRI/Y+bH9wtUlFV775d/CyAJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEVijfwQXMGRpkR4jQ7zecnwR3MLBwPWs3hjBzf1iJk=;
 b=L6j6vIEbz3DCJo+JrhfUrPwWXLJ5f9u2uZry9T73L0QFI3azHlN2UiKbKOK9IYRpsz+8dE2mYyqZFAkzLQtKjANRi4cgWy9/rLNNucYQpDvSmfH1ApCfB6eWv2N49X+wRVVQ4XfH4h8Kjt+cB4/jEN1Q8hfCJYHsOjwm7LGiPnT9n0f6kvnX0vYW8MtYhul6eq5iRkderucUlaR3anLWUM2NNo69BgzPk/NC3fkW0EbAfyqCepIz4IDUw9CWqdJqLNNBcKHW8PgxmyjHbS+sCg0Zf51VwCaGnkKjnEU3xvruQAGdL3ecaJAOSqNedtvP49gs9lI4kSUj8qeIWC4Nzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEVijfwQXMGRpkR4jQ7zecnwR3MLBwPWs3hjBzf1iJk=;
 b=anyJ9zVg5bl/BHq73drqxWudEBZ3H6SiKTzgO6iwk7CD3f50EKPxjE1aJhrlWn93/Diu7RcIC/M2Va00YOj6GtLwDbNqKCBZxTWshtbObkz9PRi2PwGGtUdmXxjVsF6wVb7+fRcCUJ2qS2A6KQisWNXRl5Wp9XZIH1NvuQf8dkw=
Received: from BN9PR03CA0725.namprd03.prod.outlook.com (2603:10b6:408:110::10)
 by LV9PR12MB9783.namprd12.prod.outlook.com (2603:10b6:408:2e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:21:20 +0000
Received: from BN3PEPF00022BC2.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::67) by BN9PR03CA0725.outlook.office365.com
 (2603:10b6:408:110::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 2
 Nov 2026 12:21:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BC2.mail.protection.outlook.com (10.167.248.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:21:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 06:21:20 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 06:21:19 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 2 Nov 2026 06:21:16 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH 0/6] iio: adc: versal-sysmon: Add OT alarm, shutdown and thermal zone support
Date: Mon, 2 Nov 2026 17:51:06 +0530
Message-ID: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.44.4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC2:EE_|LV9PR12MB9783:EE_
X-MS-Office365-Filtering-Correlation-Id: 832816ca-70a8-46a4-15fd-08df38dbcd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|7416014|1800799024|10067099003|18002099003|56012099006|11063799006|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261009221227099003|261009223027099003|261021123027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: /3vGhk4e1M7K5VZgDgpX/DpWE86Dr039o1Yf7p+nGn6Gd6K7X53mUCYR+v2Uh/VTHA+NHvvnemG+b0zPlWIYU+gLzUEbpVzErRhzE4OjXeW6XB7wDMN+PO3Z7PF1IL9N4lM7w9PSRtgncfADJrZiPx9NO7VLsawn6wzvRUTYEr3B1xTlWnKNyZguLZa8k+wg4ZhOVl58kDwjSFiXU5IqsEF8gdqH6I0MOFG7g4W4A/3zPvOV7XQuBzIdIpC9KPuk8gk8RrOCUyG0HQoHkousR1kjWfxh+L1GPa2YPAHM8AfWMH4w/i69kC5RpEo9gpXE646R+CB3kZjA7mYIW62820Wz0Zigydsw5IYt4Ps+1gwSDgQ2XbEMO7AHOza0yQx8eenQu5Ptym7OFC5N1f6yKRNlbmqbzXqONEmraNM7kOYcEZJ8Y6URHAbA+LCTXq8IXfKfhFeQhMumO5GMd04WN7bcKSXsoYcj9oO2+AAlPe7wfGjSYXRmA5/z1NAXBtmzhQYX4RMVirS3a99UjrTx2gowuk3vU1OC/oQalZZnEUOXXObHK7mzpS28ZOmk5xX3Ycl6RhamtiCV5kS3IAjaYnJRsvC3+/4mHo4UODvb68WiMLwsR2JfORVZHNkesVz2wxpafonILxW889yzesPHlhUF+XfYVzV85g6s6QKQB6GgPCZGkDoytpyMDQTatigXiHAOq5ckt8c0lsU5c24C2g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(7416014)(1800799024)(10067099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261009221227099003)(261009223027099003)(261021123027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eKMEUzSFcTMKtFR8x7JXZvye4TnWJWGAE9rTlMjb3945+4S00eBfi1RlQ+UbahOV+5KXyFoRb74/WJGSJaO/YIfaf82/tF55bl9OxcuhGOJW9jeJMnXtdFf1m4v2f18J+/2j3FfA/2a7HK3kikdeIijF2xBD04Lq2LQsjvOsyBcokWkihv1oVbLPo2SNfDElZfFxVb1zwSKF50aAYviY8639nrjG9ml4tglW5UWS5OfxlHEVf0i2F7OyJcjSjvgKzK3DhnmotkgkyNB6z6JUTq9tQCWQa/2Sh75s6B9RZM8ChRnV1zYGr91OBKnVKOFQk2QSFW9GLlCJBSmHDxQPlAmNRss9F93KSCpUpNoAX+tXMBwf6fNUyeaw7Z7/gRgsCYJhM+idtge4Fx5sOEhBDMDu9fonIHDlNBsV/nLDFV1NQR6uPMnHR7nREKlI0WKJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:21:20.5860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 832816ca-70a8-46a4-15fd-08df38dbcd7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BC2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9783
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_042127_677349_649C69AC 
X-CRM114-Status: GOOD (  11.08  )
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

This patch series:
- Fixes a race between the interrupt teardown and the interrupt handler
- Validates the temperature hysteresis written by userspace and read
  from hardware at probe
- Adds a .shutdown callback so the SysMon alarm interrupts are disabled
  when the system shuts down or kexecs into another kernel
- Adds the over-temperature (OT) alarm as an event-only channel labelled
  "ot", alongside the existing device temperature event
- Updates the Versal SysMon maintainers: removes Salih Erim, who is no
  longer with AMD, and adds myself
- Describes the SysMon in the Versal NET device tree, with a thermal
  zone on its device temperature
- Adds thermal zone support for the SysMon using the existing
  generic-adc-thermal driver

Amit Kumar Mahapatra (6):
  iio: adc: versal-sysmon: fix race in interrupt teardown
  iio: adc: versal-sysmon: validate temperature hysteresis
  iio: adc: versal-sysmon: disable interrupts on shutdown
  iio: adc: versal-sysmon: add over-temperature alarm events
  arm64: versal-net: Add SysMon and thermal zone
  MAINTAINERS: update Versal SysMon maintainers

 MAINTAINERS                                |   2 +-
 arch/arm64/boot/dts/xilinx/versal-net.dtsi |  29 ++++
 drivers/iio/adc/versal-sysmon-core.c       | 158 +++++++++++++++++----
 drivers/iio/adc/versal-sysmon.c            |   6 +
 drivers/iio/adc/versal-sysmon.h            |  15 +-
 5 files changed, 182 insertions(+), 28 deletions(-)


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.34.1


