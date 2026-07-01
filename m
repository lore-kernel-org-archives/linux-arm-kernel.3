Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7090C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 06:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6NgkiqYW14FOwqhkXNmTprHgSRfjW/UUP2Yq9KXCijQ=; b=jHhZkZspm2krGkvZOR+y1pfKq6
	pD1MHNNI25dTNJm6/fZMsxTY62CwF9rMLuuhRBM8ZKLwldRF5Xez/f0SEwUi2thxb1iQ7CHMintk0
	IANCJmTCIVSjp+JiwUm+3HT3bmMaokonT8UhVUYNmmS/cwKpmUsFoelXZvxHltJ7DFlF3ES/izyhW
	Vc6LZc198K6W4nTSQK6VkNHYDy8yE5jS8Ph9U56SfSok6Y+zJOo/Da6iXi2W7iqxq5rxaHuf9Ydfc
	dRUl9eHk9+iE9AVjFZUKNAEyZ+e91Mph9aLMSUyrj6dqYYVgxpoDjCZnT0C5IB7H0yuGHKXPn4fL+
	WfBqgtmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoNx-00000000nHI-1mQt;
	Wed, 01 Jul 2026 06:25:25 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoNu-00000000nGr-397D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 06:25:24 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6612uNTI2538124;
	Wed, 1 Jul 2026 01:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=6NgkiqYW14FOw
	qhkXNmTprHgSRfjW/UUP2Yq9KXCijQ=; b=BvJEaB1syR4XRTxCGz7f7PdhlQQuW
	lgUB8O9SBWK0UGIEOwb8IIDZxnqgyrsIr9UlBUPvsNjzZbGsFXtmzwxLpg3668cw
	Vhg4Wwg+iykURNrPm43wl/NFx5COtaAKpra0mRimFDFwWdvbRYZjlgyy7qeI/ipm
	L8ta/BSWAo3qHsDUU0tpnpU7NtsZACP+ZKxlmb4153/XJO5qjR1MYNbXGfZaruep
	EVeCaUKMDRkF4m3AjQCCVuQVCzznM9cDWRVCfFdPkTZMCRyvoHu+mxhlJBJQrOhK
	TbIKooLMIvtTvMo2ZxwUsMFn9jaK3tAnFe/cy8f7fQYEY1mAfYQRcwACg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013036.outbound.protection.outlook.com [40.93.196.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f4nva2frc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 01:25:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnRo+pNNzMq8tNXb7wEI08GwnEaFNOpCcHDBWSeh6OH9DSeFmJtlSYNGPq/w3yntLSL5xTX1bbZTWsZ2bjmb4dsGRNfh1LMqoO1BDrftrzwkyVfQl/pmnswmW0nft3ElEUzNe8Env2Kaa5J5S1Bki0YG7o+4JXX0C9ZrO4LKYtLslj2NrFGm+P21fN4vwDd5mG6Zp3xNvbZhxL8QWrav2vjDwBFh/U2EtCpCigI/YWpI7NzH2u8B5FynMS8yxXA0dVOEl9kCCmcJK420ZwDBAOT7G9BJrJM+SM0OIUXWujnQXtuBMB94PY6WR1ZpHLXuiY4uDED3az89FJ36QRn9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NgkiqYW14FOwqhkXNmTprHgSRfjW/UUP2Yq9KXCijQ=;
 b=ENpcsgxY6GH/phoVaSayq0khYvNv206a05N91KU2FJjGjX0mvqQqK7gmd+Y+0UYcMDOK8eczEcMb+K7W245asHGI52vS28r7yBknfi8vbFTFZY/4rLE7i4ftmmtC7yRGqrkXS1dBXUTbl3w8q46QjExunZGl/ItJXlF/Jmc/zCINPj8Pq5eeSIcaLlBOLEN66mKe5yRITlWlnvJ45MVOdToEzP5WhEQm1Rk/wE1QIPRrZUMKyeZeM7g5w8swJyOf2XA49/vt7RMhtCQ9gn0Bs+LbGa3jUOuFpvaOBupTP0scdKWEwPWH30dN6U7duh8AogbchMYOIpaA+X1QTKt3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NgkiqYW14FOwqhkXNmTprHgSRfjW/UUP2Yq9KXCijQ=;
 b=mIP5cqVl4BlYSqwovSVkXUGICt9su7XstzLcNQF87TAqRxV/QmRZFy69dfpq+4Z0DtCKhvSJNzPZ0pvZZtaZaW0CTPuK2ixpe0bIEWzs/7yCyGfOqSt7S7rOo0RbsH0/6LQOpqLpKV11sjuD6p73rUNoLamSDzd7VbuIEoXf69c=
Received: from SN7PR04CA0057.namprd04.prod.outlook.com (2603:10b6:806:120::32)
 by SJ0PR10MB5599.namprd10.prod.outlook.com (2603:10b6:a03:3dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 06:25:15 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:120:cafe::91) by SN7PR04CA0057.outlook.office365.com
 (2603:10b6:806:120::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 06:25:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 06:25:14 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 01:25:14 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 01:25:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 01:25:14 -0500
Received: from a1257480.dhcp.ti.com (a1257480.dhcp.ti.com [172.24.231.175])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6616PA6L710280;
	Wed, 1 Jul 2026 01:25:11 -0500
From: Jaspinder Budhal <j-budhal@ti.com>
To: <ogabbay@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-budhal@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [RFC PATCH 0/2] Add NPAC driver to accel subsystem
Date: Wed, 1 Jul 2026 11:55:03 +0530
Message-ID: <20260701062505.1091840-1-j-budhal@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|SJ0PR10MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d62f0a-445f-4e7f-3923-08ded7398337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 0pa2vM6zl3xGmfCenAx2VPaAmBc9bRbLHvlM+v7mKunqvO5Cu04awwswFEB/ZZbXk/O6mhW0QwUC7krfsica/9F8WXgBGQm0ukWkcDVFutA9S8PK13wleOu8SKLmZPvHXB5pNAf7lRLTEyovDHGqxgtkCFu1+mVG940b0rHhoHhc/Bi0wBb+v3P+SNbsYpEkABbXECBYW/kUrIYYh1kE1yXnT1YzZSz3PimkFmQB+tCHi8AiKuMlRFe7XVWtkzm2bCXlskAi7072qPTVrg2+FGn9luyTr3HAyA7HpyxP53AoDgiIu341/3HYsBiKSQFjdOpD+EXoMzBFqSXdFRJLonSdl3Fzfr+03sEpr2yrQ6CTIUWIbHmnsPss1zfar3kSpN3XItUhmgCLwO26nzcWyTgoPYCfVRZJz4tV6zzq6+lmOJrNQkSz0JKky/5157IIo6ECBn4cpv89mmuwKG1TelcMhbwDputoqi/fQpJ39uh8M86BCcL/MQRKG0Ry+zEwyIaGIno/KYNXroQ4TV9J0f35G05tOvtT4GvXhu6HRhUXjkj8b5LYZY5USRW4goAlo12t7FPLdq3mSz4olPl/UQ/LKwi7L6bJ6M65ZgjyQ8z/iKSrqPlgp5Uq7WPMoHgQLbQWP+nXo1swt6jFiBfTJubWzGuXN+zKXLQupKCSnZ2CmiEvDMG+iyDvy22c8MFwpHcjLDZIn6jjyJhVFnfaUQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3VivNmAFDfJUGihKN9cNtCL2IfSsnYl5kVYVmOUqOMSkpkONQheC9/8l5/r8411dCjTQCUl1ifhsWuz6/n+qLPNYDvTyGQTQfdMfNHpHAoNDGd+zg+CMIAuiNkHTBl3BxJvKiNWmr+VFuy3CK6eDVrT5CqTSc9HNP68pxFoil0qtVTJeZtwbn/megVYGg083pXdTZv9k5CIgoOh7SJjH5iXuNbu3jIXi2WzY/5h6xLfgTH0vWmx58ULidB2raJUEZcVt3LOyK1cFzrX1GaeObIxSXykdvKl2hXFbEPUC42c9U3Qr7s0OhduzJOjVHFVIgIp78hZyyu7uYUURa3oo6fhKDaC1XeVm4gqL6gxdFFNnH76PJJwStxSwrUHPucAEhybAoPX6i7eza08fkvQ9icmvjcwJUT4GWeKbOZi9nG1Ob6OZT9693LJGU203tbcb
X-Exchange-RoutingPolicyChecked: P+/ixGF/hEWcR73ULdEh2Oqt34auSdpoUKBv9fhAPw3nHO7iZKDYmhn/lNCnQkwWTeI6oQahFpP6Y9cpb9tzh133hyj1hj4NeajL547wHkIZLeV8JBCAvHnN8ovPiYPYSG8JbrxYirSytQftINOVXkC9giQUN6En8XXlSByaFYiPlTdJWaLylaKmwN0s9BR/HBEG3aTN9Hy4TX9ATRt9OymL6pxhxPSR9Bs+AlGO/xYl14l59HH+R8hSGeDvd5bPWRFnDpiGaAJDa3PMmcW6zRUYgn9CMKOXvLGrdXwCszd4R2omPDzA98UpQpxm2w9e2kRdLl4vofMOISrXd7htgw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:25:14.6904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d62f0a-445f-4e7f-3923-08ded7398337
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5599
X-Proofpoint-GUID: Ah2-jxWVBD0qreKFr3yXQW-hR24trSZv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2NCBTYWx0ZWRfXy1D52P8a3F68
 j/8FNBqpS5sTVqMglpEtktQqstR+77HkUZwsz8bvdEZXdWne01qOkOgO5q1Es2RNqzHeluVgyDv
 ZsNuhwJsNwi0fGVmObKegCVmcAt3Ya1Ccax6C5x+LIRBRrpPHK4VssHJkixrKxaarQyr42XDSa1
 3Q0wHyfJW3FsoRjXyyZE7smpIk3AVZtWoDmzlFKv7xmOxjZGHpWMRtSb3zK8jpgtZToHfIciBY/
 M2EL5W55JBrS175og0SI9pc7cHmEB0C/62Hd2huIOJmUXE4tCDQa/PriLhHiHQtMxp9kngQBRck
 wf/KUdIZuOZpi/Svzku9PWuLrvp2DuJ0yDLPJm4yeOY0yZr1KqfCC9Xw/UhAt6UkeG6TcHnkKr0
 etsog3E4E1jMEHo8WXnVAnwQiIH7kZG6/6V88Ttttbe5IRP7G3jJO0/GHi3QQcJISRaf7pZYq6p
 0TWqE0G70BepxKBiEZA==
X-Authority-Analysis: v=2.4 cv=FqA1OWrq c=1 sm=1 tr=0 ts=6a44b2cd cx=c_pps
 a=vqIpJ22NDJOYTIB/W/KhXg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=pWp4BQoXP78_820YwuEA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2NCBTYWx0ZWRfX6ojiWr7McIB4
 U/Ui65IROlghDWkt8oju/toOHeyd76OvgnE3l4dNCBgpSvGdY96P3v0fTawnNDXdgeKQIKKKzeZ
 qBgFWTbyyttnIkZns+aa+IOEQwPfqMw=
X-Proofpoint-ORIG-GUID: Ah2-jxWVBD0qreKFr3yXQW-hR24trSZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1011
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_232523_107353_36A694DD 
X-CRM114-Status: GOOD (  14.51  )
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

This series adds support for the Network Packet ACcelerator (NPAC)
client driver. NPAC is a hardware accelerator for offloading
packet processing tasks from the various hosts on TI's TDA5 family
of SoCs.

This is a minimal reference implementation to establish the framework
for NPAC acceleration support in the Linux kernel. Further details
are in patch 1 which adds documentation for the driver and describes
the system architecture, driver interface, and execution flows.

This RFC is submitted for getting feedback on the initial implementation.

Jaspinder Budhal (2):
  Documentation: accel: Add NPAC client driver documentation
  accel/npac: Add NPAC client driver

 Documentation/accel/npac.rst  | 142 ++++++++++++++++++++++
 drivers/accel/Kconfig         |   1 +
 drivers/accel/Makefile        |   1 +
 drivers/accel/npac/Kconfig    |  13 ++
 drivers/accel/npac/Makefile   |   3 +
 drivers/accel/npac/npac_drv.c | 218 ++++++++++++++++++++++++++++++++++
 6 files changed, 378 insertions(+)
 create mode 100644 Documentation/accel/npac.rst
 create mode 100644 drivers/accel/npac/Kconfig
 create mode 100644 drivers/accel/npac/Makefile
 create mode 100644 drivers/accel/npac/npac_drv.c

-- 
2.34.1


