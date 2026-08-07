Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD748C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NnpuRQDCdDOGVlqdeDzpC9PqUbFGZjVMtca/xNIveso=; b=N/6DODHkg6Q3xZEa++6z/6fIkR
	HGsW2mL1YBUEaGWAlIo7btFWzKTSJ8xJISYAlLzKR53U3qHUFk02hcb+zLgEKStKesc3bHPZYS/V8
	flDtDp1Q7FW3UalwSwJ7ccyBAy54Xfbz/rkgtn0xQ6JaVwutftGmd2e/H4KjIJX3ulrZ23C9YP7td
	XwU3noXv0v6mhFyeSwdrV/hr3vFwx1rXs/zA3vHiY7E5EBqTAq5OaVKYV7OnFHVDcSNFVwwsgpLWK
	u4pi/ES/LI13Z9Y/o5pXjMxFHHwk0GDIj846cVD0ZshDz01gd4DigOItK63YRwsGkxYm2Psq8epGp
	9cxz0hPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIXH-00000007pHz-18U6;
	Fri, 07 Aug 2026 11:14:47 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIXE-00000007pHI-03pm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 11:14:45 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6777bF6u2372698;
	Fri, 7 Aug 2026 06:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=NnpuRQDCdDOGV
	lqdeDzpC9PqUbFGZjVMtca/xNIveso=; b=OZpJFFqEWyrFXflt0uAf5xjBz+pGv
	VCX5A4yz+AOQThfXJ8UsTU+xMy1q+i1YNQ1c/2VNDCcoe+Zijar7IR2VIFV7tYAB
	DaDx85PgNmiAjCFuPCVuTOLQMsqtZTCmhWWX+3kOydl/QTakpUg+ykfEC/Bve0Hq
	TPfyL2B2BR8FnmPwH9Xm+vJVvFoJS/MaJtg2ECy2vId9S5n6qhiqmzg0q0YzdIF+
	ofoZ6nj9aipkfsREwCBT68ZvWpkOXNpswPfPlCquJ2qnr4jlPgg24kE1dbRMwyXQ
	69Ds0WLiRfdzpXuFSr7lYeeDC3jftgh6J3Fce9divFFad9sFKcVSug0Fg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012042.outbound.protection.outlook.com [52.101.53.42])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fwb4rs166-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 06:14:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTabDyyVsS5NftEUfij5UNYxOglhbKzdC++wVxeaDddU6mD8tcGEX+ax7OAjjhaPSqzEo1xy3aOp/hgaqqcuvl6KxLBSMZy9GSb85NzWeWsEFSS4VC6kuziH/S2gK9xPcaMKEJBwjprA1o+4s7AttfacS/aNv3GritPY5T5dL/ZtGaTExvSUhJjkYhqEN3AQ9z2fmR1BrIYE+4c5Iq6CWDuRElmV8/Kfj1bc7kZUvBP4OIbrh5RgUyVMMWKcOpNmkWiwXRrUPIkJfqWzm/6gGD7gE0h1mVvSvG+VJqfMh5gfsEfsksEEFASg7EenKiZE2YaVw7t+sOZCY9Rew/srmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnpuRQDCdDOGVlqdeDzpC9PqUbFGZjVMtca/xNIveso=;
 b=EKEgw7G4Mi9Gy+UCgZ5nQjr3y2LAvwG6DWdYNs6EqAymNRUmwtms7KzZh9GwHI98xI9lia0eCUonQIiMki/SY4d8sC3lN7HiHC4tbrj3KwQDO0Rq3tPgemF3RvQTNfYViMQ1HV79RDwPoSMKkLVn8E6Y5ySZ3w7D5o1WIc0oXsdEtArJohU6cDu+xXQrfvUqnFKMI/PuxU87zJJN5kbkCmYsegMx7s6MXheWvY0APAs03dbEgmvi/Mb2xY0Ug7xj2bm2fXpvJ6QTHBoqkikQrGzGojr7R19iJZUDXifFKhVu/HNI6QTl1/Gx8FkxqYzsLO8x+07cmY9xnG5MLsXTWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnpuRQDCdDOGVlqdeDzpC9PqUbFGZjVMtca/xNIveso=;
 b=q4jRO8I9G7Y+Mnk2cJJ1ZmE2n7ilhKX3XmpXHRa62YDhRqVrdOr9q+9NqhfC2G7l+tjXdqTzYD59F63pX2ag/uBBa1cryEFZSUQYjWz8nljGVYdLsqZC7aHdUHBgbSp3XDta9SVGPxbX1N3Yx/EdTz6GoMoC6i0jJ0E6Hh91yrE=
Received: from SA1PR04CA0009.namprd04.prod.outlook.com (2603:10b6:806:2ce::25)
 by IA1PR10MB7166.namprd10.prod.outlook.com (2603:10b6:208:3f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 11:14:15 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:2ce:cafe::15) by SA1PR04CA0009.outlook.office365.com
 (2603:10b6:806:2ce::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 11:14:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 11:14:14 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 06:14:12 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 06:14:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 06:14:11 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 677BE63j954749;
	Fri, 7 Aug 2026 06:14:06 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <c-vankar@ti.com>,
        <horms@kernel.org>, <vadim.fedorenko@linux.dev>, <v-singh1@ti.com>,
        <nm@ti.com>, <daniel.zahka@gmail.com>, <nora.schiffer@ew.tq-group.com>,
        <oss@vassilevski.com>, <grygorii.strashko@ti.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH net] net: ethernet: ti: am65-cpsw-nuss: Fix port_id extraction from SRC TAG
Date: Fri, 7 Aug 2026 16:47:37 +0530
Message-ID: <20260807111738.2055900-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|IA1PR10MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: d37a12e4-4676-43e6-a527-08def475041a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|1800799024|82310400026|921020|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: bJmsWp4ndvdyMAiCV89PaDF37bA1eekDszsGTuGr+KmktEpjhPzqfmPqNCfaCkV7Bjy8DiuMrHggJenW1dV5mRpq/wRc6/aH0FRlVUrMAvIeKDaHVgeXpuyEDLsa5jVDzthiarpFlWfxfVe6TeT7Jxsq4ucCv+A7G9hRIyEHqZFfxm+AsQU+HpYptCSf+A7WAgpN7NBpcHPz8HqsCHLmWVGhr66WqfrHLefB5q8E59P/uZGsFENlC90dBu7BYFlszTPCv/VjIKr3AsTzu40bImPPRVGFC+coaYoZcGv704Z6wBSXecLHyBom2FZhYVB+VOxfu67cJb4VEk0vffVvqwltctWSQFDXFIA9m7yqJ5DkrtZp74o8Oxyubze0iB/igCLJw9mYEigAQFWy7pko61LU9mv946JkTfuJacBcfCMFfzoXcAaQG9XNmmZmWDhKsi2u4pG6JWdudpO86Ihw/Tc7FAwsXnTrrVasM2kTSHNN1IYkJbx2pA6hfrp+4x+ZaX5bT9Bwf+pvhhlWVHzzWYwkL07OQtl5QA0vupIzRo4n7sF5cu1I1OA1WrfKJgIgdard+/U2avIfCazZgWZccjr94Hr5JPKp0JUlz4zTeZ7WnuNCNA7GjSj5KquDtbP1vZwddayllrNah/yz9xvQZtBGYUyMFIXJazCoiTz80Rrx+60WdmUGLlPweKnvOAC8k+q+hiIOD6u7dqkhfkx8FWnQr+1FvVrKOD9d7ZRN4+llg0T/i1vvAQuXR4kWxbnp
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(921020)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +3hEdjdsBICeRQHBckpxCiF2a7D0JT03Rh5yxV47yhTyAwC6CcXc1eWlsWUhwmPmbp/K2RE55pmEyCAo6tWhvsWfWk6EAPPc2QWl8qBzxZL4Mh3HE2uJwB9fuwZRSS7PhLsIDEbmwsGbZ7wjjtQklQwLplcO2JoySet2MDAgfT5YVxkpUsVxSDJ9P7+0pNHwz9Ncu4jCiXBdR9+/9aMe5xpDYrCjZw0JQH6o98sjPtsSeXI73hh268RW1hcIsplMcfIbheeFgzlt7oUAnxwWkDEfzi4WF+7aFC7mDboQc9bkIFTOzKts7VnTZdo544o4wXY4xZ7G1gy0d3xvto9T1qN0I8rs7/1nz2IDB1wKOgMsCK/9qQTUuZfNphV5SNwUO/qxnZ28oPZJXkT/K46mK4nkf1K07i1AI/rxdZYY/NziqBZY19SYAIFPzRiwv1j/
X-Exchange-RoutingPolicyChecked: lOyd5SZK6/eOl7HSYNOyiVnilBKw/V1nKK2HAnVL9zkfzp7JYdDPDqPNkWh9xezhNPo8MO/N7M55yVBKTkEsSM+ZZhHyI8JCzUsPQsHGudcQ8YtDJAz0DrmaaAZw6ML7zX6EGVnJ/4JryM6yH5XzTqB7HeSPtMSPMceimINYOwEdIp1MjhXEjtrTmtdfyFJmSissU02O3QsANqbCMS+YRVmBtOvBCW+HQBhuBknMCiygKmG2/Dt5n795P3wiHIAO2MNT4C7OhTwzJM7ZIVhkkmikoanoORbPHZSCRIaNnJdUWfwilPd0Rv3+pa601dYLTlOpMhjUFAcykpd524P4qA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 11:14:14.9642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d37a12e4-4676-43e6-a527-08def475041a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7166
X-Authority-Analysis: v=2.4 cv=LI9WhpW9 c=1 sm=1 tr=0 ts=6a75be0a cx=c_pps
 a=FJ4pSz/mJ8rARZfoadKCzg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=l4dLpGQH5__w4KLj-owA:9
X-Proofpoint-GUID: JoCLD6sM1ndx4EqsPn7uflgN-AEl_6iE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA4NiBTYWx0ZWRfXyDq5PbuFP9DT
 PHR7+o77AlJCzH+rjfVlxvP3sZYTRkwXMxK4GwgNtfQ0aC7OnTSY0MIwUJc83wUN3gshpRBWvXx
 DxJlO1ERVq+jNG6HvGQvDTlQdDk7PxUGVYmBnYXX9/HMf5JvKRix+wktROQjgfPZx6NRxMYYQvQ
 8bUa6RPRkwWjH56uMMgM+HZMVul7ECC3gDXK4/kKzq4ukbm7zpK8bDm7aueA7f//1gJPdabVvjQ
 SyBZAZTipRgJ0VnBIYXhfchylxpSZurHuZ4Cat3KbIJ8Q2B3di0RNytHeaZ2T5wDpOXYUPv0b6I
 5Fugh7X2CHBAkrh4qhR28E0KIRlQqTyJ07Xrra7MHMJno5j6G/Jh17TNWzrIQjPtxaMY6glwAif
 k2echp75Ewxs+c715ECaGbVOXF1tJtde4OwpA6POJb0QENlib2+niWwrQ2XnneqEtoE1oniM1cI
 h5YDWlCBiZcXT1iXk3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA4NiBTYWx0ZWRfX3WJt1PhZ3g5z
 KJUXhBtC0K1sETYnTbTcof0V+VY2GuMA8+5pw7Ht6FnMLN56V+Eb6Ree954f5Ox/CGNpLg13lG5
 jWc5Pr6N2F1BXTTYHDoKKdY6BU4Ap24=
X-Proofpoint-ORIG-GUID: JoCLD6sM1ndx4EqsPn7uflgN-AEl_6iE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_041444_055854_1B43A39E 
X-CRM114-Status: GOOD (  14.89  )
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

On the packet reception path, the ID of the MAC Port on which the packet
was received, is embedded in the RX DMA Descriptor's metadata. The ID is
extracted using the helper function cppi5_desc_get_tags_ids() which fills
in the 16-bit Source Tag into the 'port_id' variable. However, it is only
the lower 8-bits of the 16-bit Source Tag that represent the MAC Port ID,
while the upper 8-bits are Hardware-Reserved and carry an arbitrary value.
With the existing logic, sporadic kernel crash is observed due to the
subsequent driver code accessing out-of-bound memory because of an invalid
port_id.

Hence, fix the port_id extraction logic to use only the lower 8-bits of the
Source Tag as the MAC Port ID.

Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
f9a2394a2348 Merge tag 'mm-hotfixes-stable-2026-08-06-18-44' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
of Mainline Linux.

I have observed it in practice that the RESERVED field contains non-zero
value (such as 0xFF on one instance) causing port_id to be set to an
invalid value (such as 0xFF01 in that instance) resulting in the subsequent
driver code accessing out-of-bound / incorrect memory and corrupting it and
causing a kernel crash. To summarize, this patch is fixing a real issue and
not a hypothetical one.

Regards,
Siddharth.

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 434a31080855..6330540979d7 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1310,6 +1310,8 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow,
 	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
 	pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
 	cppi5_desc_get_tags_ids(&desc_rx->hdr, &port_id, NULL);
+	/* Port ID is contained in the lower 8-bits of the 16-bit Source Tag */
+	port_id &= 0xFF;
 	dev_dbg(dev, "%s rx port_id:%d\n", __func__, port_id);
 	port = am65_common_get_port(common, port_id);
 	ndev = port->ndev;
-- 
2.51.1


