Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FFFC44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vEqMz4ROu/F3jnAa4Y0DHGqjdBFFALlbrjWyNbS7IvU=; b=lUWndyDGwXY0rugW7JBK7RCkTL
	BCVcS7CABcoZm4PXqqGWNQ7CsFFdWUQu+JbYqrErKWG9kcBWYKLVHDJ8O0EldIwqCsiHlVeQWQ6Yn
	9zVQaQyNA50Cl+wwnBMXUWD3lvnsdINhe3Z/FUrQit+eBMEneQSIkrAGB1iNma1B8KT86I+V75GgJ
	PTF0Ah0GXxzcnuoPPId+HDhhcnjPnfLDrBoMdV6UO/t+9p7ncrv/2KV8BV2ExANnVqSvLSKhhOtXW
	VB6tRTEm8ha/hh2eqTfJTjM2c1lZfi1+bpEOPfa4I8Lj+hn3/yRXLM6gCRE2Ho8u3z+WaI+YamBTQ
	ohcaq+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnwb-0000000Df7Z-3sus;
	Thu, 23 Jul 2026 07:34:13 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnwT-0000000Df6R-3mnl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:34:12 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66N4vnUw3575764;
	Thu, 23 Jul 2026 02:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=vEqMz4ROu/F3j
	nAa4Y0DHGqjdBFFALlbrjWyNbS7IvU=; b=OHrtkc8g2ewWfOd9ZtBpyUwk1qZwH
	Mil9/whcphLHNQVZ97TU9ZFB/hg3olZdn8EHTeOK5tFhMXBDetilelruLvVEcUOy
	xj5U0MuATgrSqDPbGPszGJ8wBLw6cFq8etk+jkZCx+3sbJfIvYAp9EYKwD28vofz
	4EJEU8uBKFWnTZ5CZL1+gH6nvxI8tQIJhciS6/+VNyV+oHoGb+aUsUBOq/PX8Fb3
	xTynY/4sWVZcUnWDZFDG7LK4RhMva7B+sncCs0SVpKTmTDOJWNyXOdhws7H4TVRc
	RfEph+tNP/Fo91inNz0Qvuh1z5uCrS6yIxFfdr9tGjibVwqx8vdyCxRig==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fjw4jp17c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 02:33:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FD2yXcpVhkXeVks4LJxeQvVnYMxhR8gVx19hZGlHQDokW/YQv0XjCPLB14zytDj5klBCa2/LYIzLxoci3DRaaAH+wsNhLfLfh1HEZv4KXw9PfAXpaiNDKtN9GapgPyAjdpqv6ac3Jaej//cKfrUJPC4ueaqX9wZTMT4JlQCyi7K/v2DOiKIQcH881qg4b1Qn72lx43G19nLq+gioszRkEjHLgXmOgb9N2eJEo90NV3YTNeBXxccP0XSj4ezXeCMvENt/4l8e6XuF7MBVxQUZDQ76r8ZU13Zj+0/38PDM7On8C2VAsscVUdShSXMS0RHEbUmoawRB57aO/0STkvJ/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEqMz4ROu/F3jnAa4Y0DHGqjdBFFALlbrjWyNbS7IvU=;
 b=d17tunNocYEp/7r3oJfdfjfOacZ9MiYZAU5PWaZckXT9r03mJiNJFpnuCJ4R4LR5/KoJT6nD7dxWDlwrWZhOFIW2a/hNrv/4wdZ614qqw7UnhLFah5zeB/Rn4C6D1r+V1FWk9L+6lvot/2scx5ziM5RsOJEMvU+LlvVbe0Ztcj2eWnm0SJ1707Nn2l9/toYdEoWGF8MfBIxo6VsiWCqRV9iHTzpUt2vaGvRAuOCV1GPo+3DGwKrd5FNesY4p9moUq3Bj5Pmnrvh8FQgQfqeUHQptP47IXnOWOOJjpE6YHRRr7We0Obcd6JTYktVFG2KWpFv5TQ2HoSLd5w220Nn1Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEqMz4ROu/F3jnAa4Y0DHGqjdBFFALlbrjWyNbS7IvU=;
 b=cmLOag/8OmKjTaUuPXMO8pcDO+d3Tks8YvYFhc6BWdP1Jj/MYqr3M5JbmefEN3a6Mb8CkaY+irLturrKOI6heWprjzpwifdc5NsL4LNZ9gRESvTLzHIbi28//W9M8PeqHO4lU0MMCDRrZ5M8AZpu4bhM/2m9jqBlfO8ySCc4x/8=
Received: from SJ0PR03CA0109.namprd03.prod.outlook.com (2603:10b6:a03:333::24)
 by SA1PR10MB6365.namprd10.prod.outlook.com (2603:10b6:806:255::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 07:33:52 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::15) by SJ0PR03CA0109.outlook.office365.com
 (2603:10b6:a03:333::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 07:33:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 07:33:52 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 02:33:46 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 02:33:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 02:33:46 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66N7XfMP629330;
	Thu, 23 Jul 2026 02:33:42 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH] arm64: dts: ti: Add Microtips OLDI SK-LCD1 Overlay for AM625-SK
Date: Thu, 23 Jul 2026 13:03:41 +0530
Message-ID: <20260723073341.3229436-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|SA1PR10MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b7008e-6a12-42e4-e74a-08dee88cbe85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|13003099007|6133799003|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: GJOognFfgTyXHtC7Ab20ZqbojHJdJEIKDClRioUq9IySZ+R6nlZkUyP87FdebyfN/3e9g6PSqQpb8VSbPW6XJbUQv4APhVBQoT7CZv8GzrrcuADmz1MsuKvNklb1c+GCMOmFjFXpIIjzYBnxcfo6B562gAmSBLN3ppE5ipzEw4b2mMhrw8Qqi4l7B2smPFUAfbZpTjZQDTPPjoKVUqxZA7krRCTgOF2iC1CwpmQjJoEBx1JvaU4iIZvvbWzhtFuRYRG9VobvUp0WjG/SCpGsyTff3GCC1MOOqMK181HF7P64BIc2uLFN8wufT7G0Gh2tyTGFXLBi/bbjjCO/jsYLEaaEJibbSBlzZ4o761HEsXgYYfYzHTckHVzf0/gJoHT30RWUQ6LYVu/2/u9tANTqNfqfnlbaiExnfPwPRUqymx3xzJjIjNyIyUWijCFbvCX9vrQo1aLtuYjnpwjjNAfzPSgeBn6C0rov5k74cPtOxGMVwiEJxZWgeJ9vZ4+Tpo9GjjG0FsDiQnft8sE3tcT5NVLHsXjtkMkzkiDNBxb2e3enTJgxLxykpWRA2X2AONCghGJpmTxK4vnMV2vn+PxXc9ZGNJN0rRDHQAA2/9zlCVvT8CzQjT0wGsOO0PI6SRQdFGvt9qEx3oz29HYY4t+Vpw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(13003099007)(6133799003)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3WA5G+S4mDH7b8x7+BiqtKxicHb2MLY6R0Btt6mSPI39yVaAf6U+QWZmm8T8fPAD+208TAlalXoJTj8GRIWxZH6YYXVgnCMlT9UX5lMjqwh6U5izv1nX+7PJn1wRh2qbK+19fkaQroq2E/yvXMyspiJgtfWMuxg71diBoQJRUnd3y8hAcl+KQjRBRxJTgb7/+M/P48XweUxnwee7cetbdtFnQfyOE1YuIoN0dtyLpAe4t91bnJGaC8CSLmbYnmS/eQ2lzAz9FfxJngyjAn8bmokM8VN1X8T9Jh+Sw7DyofUjHxhjwOmWa4gSvmD/xIZybM8S1C9o0rBfEpySPvcBnN7leNNoEH44+G62Vii+DY386n+zjZJAY0rAfBBPgN2IRrsuSevkoH2eb4G9qwoN6g2y9gydzH8KVr2bi1xP6ziWKHWswYQk9lTW5bmymNiN
X-Exchange-RoutingPolicyChecked: EBVu3Ceqm5HEfU4ss+NqGJAR9litqsz4rK5Kxpu+fg7+G6xpE7gBwDPtKso3xS+WwLjwC/5sg4z8U/M82RffykHaE9wZAvJCQPWXFxAzBdBDbSyytHPhUp+14L7+JG6tURqSazWIwK66aeNHFGrOvCDOUbfMauHb2ijfUC7eCWc+ZsZLJ2CsgbiriRogEXkZKM3bNUFYGbuE10q4LvQWpMD5YnZtumYqtdrzL70w0tvUZV0UTjQ4pQDwrgpSNOeszEDWgsgRSc1aEHYI47/nHq8aVoGtExq9Z+tImazrNNj+e2fIXQZjJhmaP17vpuzJsjU37KMcdasOnvstuNbkrw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:33:52.1336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b7008e-6a12-42e4-e74a-08dee88cbe85
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6365
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NCBTYWx0ZWRfX/AsP/j1XZnu+
 n2boTrMTtyOApbWMi+67m2QkFkf0dR8+fQ27pHwnAMK5z78ucjjCuFd2FRImWPmKLMXhAJQ+gtN
 t5l5Rih2kXPqziXpemAW9OH+y4nVNDA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NCBTYWx0ZWRfX6/iKm3KHvJM7
 6abLTwznKsjVO15DwmXPRFohyyxs3V6f4bzrXzv/5TaQhf/AmAcxrfPI3S4OiYyOUftgn3FO9r9
 9p1s8n9Qpng090L7as1djlgsNkShY4ndnoKlujuaXMg2wB0KkzTr3AmSqcbe4fW53Feddlv38j/
 FT8YqKR0vxxg8hID9xB2TAcFf5f7qWAMOwxFcifxK0cVAm/qjOcb+VafqRsw7EVzxAp7mqQucG2
 9CWs2n5kLuc4E1sdRrfxfk2KuvKms87wQjePIeaVkLnwinCwaXKJ6FkZ4iCAfNYl1ClKGmXbPG7
 2FhXuPDBqO6jVbVh+d45HPm1R/SeBovWpde2S3eVTRL/qfhS//3auzAhkgYuDaxGCtQ98Jx7CFX
 aVswrm/pErW3vVK3f3Vt/emXBHeLMtD3fRMZnGBnO5ZiBMob3aMjn1GcAmqgnCt5x9MQPhmUFGJ
 pJbyUcnzApxh4Mc+9oA==
X-Proofpoint-GUID: l0y8y_cJpsxevRKT6tVo17e1srv89sxS
X-Authority-Analysis: v=2.4 cv=ONwXGyaB c=1 sm=1 tr=0 ts=6a61c3e6 cx=c_pps
 a=zclsoE7mv10+eI8hWvbpiQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=NFUEwmjP61wPHLW1lN4A:9
X-Proofpoint-ORIG-GUID: l0y8y_cJpsxevRKT6tVo17e1srv89sxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_003407_796971_D50C9E8D 
X-CRM114-Status: GOOD (  18.45  )
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

The panel is Microtips Technology USA MF-101HIEBCAF0[1]. It is a
Dual-Link LVDS panel and supports WUXGA resolution (1920x1200).
Furthermore, it has an i2c based touch controller: Ilitek-ILI2511.

Add DT overlay for the OLDI Panel.

[1]: https://www.ti.com/tool/SK-LCD1

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
Note:
This patch is previously posted with "Add SK-LCD1 support for AM62X"[1].

[1]: https://lore.kernel.org/all/20251017115325.1942591-1-s-jain1@ti.com/

Respinning as a separate patch.

Changelog:
- Change Copyright year from 2024 to 2026
- Rebase on top of linux-next
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../k3-am625-sk-microtips-mf101hie-panel.dtso | 121 ++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f4d109ef6798..dba641193144 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -28,6 +28,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-sk-microtips-mf101hie-panel.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
@@ -255,6 +256,8 @@ k3-am625-sk-csi2-ov5640-dtbs := k3-am625-sk.dtb \
 k3-am625-sk-csi2-tevi-ov5640-dtbs := k3-am625-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
+k3-am625-sk-microtips-mf101hie-panel-dtbs := k3-am625-sk.dtb \
+	k3-am625-sk-microtips-mf101hie-panel.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -418,6 +421,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
+	k3-am625-sk-microtips-mf101hie-panel.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-can.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtso b/arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtso
new file mode 100644
index 000000000000..ce7b31c5b9a6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtso
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/**
+ * Microtips integrated OLDI panel (MF-101HIEBCAF0) and touch DT overlay for AM625 - SK
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "k3-pinctrl.h"
+
+&{/} {
+	display {
+		compatible = "microtips,mf-101hiebcaf0";
+		/*
+		* Note that the OLDI TX 0 transmits the odd set of pixels
+		* while the OLDI TX 1 transmits the even set. This is a
+		* fixed configuration in the IP integration and is not
+		* changeable. The properties, "dual-lvds-odd-pixels" and
+		* "dual-lvds-even-pixels" have been used to merely
+		* identify if a Dual Link configuration is required.
+		* Swapping them will cause an error in the dss oldi driver.
+		*/
+		power-supply = <&vcc_3v3_sys>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				lcd_in0: endpoint {
+					remote-endpoint = <&oldi_0_out>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				lcd_in1: endpoint {
+					remote-endpoint = <&oldi_1_out>;
+				};
+			};
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&oldi0 {
+	status = "okay";
+	ti,companion-oldi = <&oldi1>;
+};
+
+&oldi1 {
+	status = "okay";
+	ti,secondary-oldi;
+	ti,companion-oldi = <&oldi0>;
+};
+
+&oldi0_port0 {
+	oldi_0_in: endpoint {
+		remote-endpoint = <&dpi0_out0>;
+	};
+};
+
+&oldi0_port1 {
+	oldi_0_out: endpoint {
+		remote-endpoint = <&lcd_in0>;
+	};
+};
+
+&oldi1_port0 {
+	oldi_1_in: endpoint {
+		remote-endpoint = <&dpi0_out1>;
+	};
+};
+
+&oldi1_port1 {
+	oldi_1_out: endpoint {
+		remote-endpoint = <&lcd_in1>;
+	};
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* VP1: Output to OLDI */
+	port@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpi0_out0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&oldi_0_in>;
+		};
+		dpi0_out1: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&oldi_1_in>;
+		};
+	};
+};
+
+&main_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		interrupt-parent = <&exp1>;
+		interrupts = <22 IRQ_TYPE_EDGE_FALLING>;
+	};
+};

