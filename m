Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17C4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p879Q6Ni3yNNbSed/rsS32uHkX3sL/ZjKqiW3AXeLzM=; b=CJX+k0e1uoouR4K6KwqsB8DUj9
	KePfya6qhM3m9l8Cf3SAX6WmIb53cLTfWMmd0dMi3jZLFIplQXZqCdxeCq+DGb6ecUtZysg5ICSel
	GPdvvjxOwMiREYvbh57w1aJdocPL+t5VmbDNMN5sPtu75zHO3suexs4yjW6up4l9UkzlHu1xmvMxU
	E19cPd5J5Yr4c57OjznhpAxhSOO8XrwAh+mrGAFLTPyV2vqbno3E8wYf+TMv0gFUqEGmZkQ7COinP
	N/5s1VIouDIhQDNTCFzlwgQNLrrdxFr4cLhkolNbsG/Saj3+MMgLtzAN/gMIr9lTO8Vm1NlDKEGKg
	1xFQBycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgB-0000000C0et-2VN5;
	Tue, 14 Jul 2026 12:56:07 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcg5-0000000C0cY-2S2D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:56:02 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66EBhrCN2165582;
	Tue, 14 Jul 2026 07:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=p879Q6Ni3yNNb
	Sed/rsS32uHkX3sL/ZjKqiW3AXeLzM=; b=lJFFhRvagRAUgPL0hlChiewaxp2po
	kW1uPgc3i1+7MF5Pkt/k+f8pyz0UvbbDxgZGnMfkAXGQr9EZgsQ+sLV9d69x4hDv
	3iIbRPx8kEPlHPbsxJ9obCDCg3cdsGUn9efzJq5IykSFo6pOxGK3mL54karh7lYY
	e9PtYydHjw/5GCdkDzx+p/2MCZ1gXmXprZC/4rL446nLQTKSAPgXvlphKAzDTmGh
	CuoVaRX9j/XniNjn2wd3wTtThgyVcCvPJ4Rm4FK3sFakHcoJlxykFyYeXFgKb94q
	dXqEGN08Lf5LHBOYQbyqV+sgN0Zf415hlGnBqQENzHhWBe/8y/ZxzBcYA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fdmgcgbe5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:55:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pskypwVhFgWU9SFlOJsk6WoSEF86b58iFPg5J6LAvTYROiPochTlMWCy4A1867KQUaI+9HDPYEkfKtP2RezB64ghEaf75Exxrdx1R86ErIStRFbuIfkQmADQU5/y48IUVYxEuCQq170Rpe1lpaN8UKuwucu7MRfY02Aa26T09Eqh7GCfMgadFW+FlmgtXRSLSB+eurhPO0GqTb8MHWgzj6b3wljEqu0HvUmzsvUbMCrIKwTdkbWeVR8+9JS8gL1CtrusHsbhHB44NeDNr3dUvLKAhOTu4GHrKkzc3SRVH/eo2nXEHEvOYH4UkSORsE/aDUz/Q4cMDQOegJvzQ3rreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p879Q6Ni3yNNbSed/rsS32uHkX3sL/ZjKqiW3AXeLzM=;
 b=R5pIR03Xr3nxxGwY0iSD68gjW+H4wsyxVQra9aY08e7tlAbbBY/lavFoSXqbPpAv6lKB2FTiIeAuJcSXw4AHSFA5HB8UjixrTvTesLMuEGr2MSsSKAVY0E8uBDut4KxVwv9dUHV0fjdFPOd6xipmGkt7t7pgtDTtrg5GRCP9dEQ89XkPoNyjBI74GM0h3FFHQxbnLgdwefF+0IDPpjLgnthyH/Ai3dKZvesBNj3YDz5P3y4RQWfLsjjxud8pp/Pm2hgqEWUcCe5OXb5YQ/2FoDGQ29K/4BUEXijJurDGRMyavjri/cyU98f7DOPEA5lhRorCBdY5xc8i9r2h1sJZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p879Q6Ni3yNNbSed/rsS32uHkX3sL/ZjKqiW3AXeLzM=;
 b=kuQM/9VWpqChoSXADtvCgfUXS4v7LWEEP5y2s/buWDv9gtRdTR/XwhuIcPMPzPgHvtFXJM6YkwzfzcnW0Shx6TkLrL6MfxJ8HcVWQImXsm3O/ULiU1vvX3Fp+/WIs6a7gb/Ir3tt9ZZTPewx1ySPaYm68S2iS+jHhDfEQ9/4dzU=
Received: from PH8PR05CA0024.namprd05.prod.outlook.com (2603:10b6:510:2cc::12)
 by BN0PR10MB4952.namprd10.prod.outlook.com (2603:10b6:408:122::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 14 Jul
 2026 12:55:56 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::43) by PH8PR05CA0024.outlook.office365.com
 (2603:10b6:510:2cc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 12:55:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:55:53 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:55:41 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:55:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:55:41 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECtciS4164266;
	Tue, 14 Jul 2026 07:55:38 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <n-francis@ti.com>, <s-k6@ti.com>,
        <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 01/22] dt-bindings: memory: cdns,k3-ddr: Add Cadence K3 DDR controller binding
Date: Tue, 14 Jul 2026 18:25:35 +0530
Message-ID: <20260714125537.3304217-1-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|BN0PR10MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0b2d9d-89ac-4aa6-fe86-08dee1a73d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|13003099007|3023799007|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: KaxdzQIOzhVga2mKxg0aSNQtdg131QNfh6hH20WF1Eyi3Zq0euPH+HmcJItyCGXO1EkcQfHTy46l92uxZqhU9OSLAsKFso+JZU1OQtiZZZPcPTp9fzp8opgxyGPDxk3JVw3960sjP1bRbjOYEqE9+Fg0yXly4o0OQiHJV5rwMespIiEv0R+upnSkf7nyi1GYMycHtvrIKnrniZOCSZXN4AiqmQmJiV9QhHplEaTTkZAYnw/JkldoaWq0vOkMDib3mzySln5xp6wzMupO97bb6MymokEDO8qAvALJIEDvFJx8jGb8CmgPVx/uM3BjTdJO7aqY8IvdsTp1fapbJnl6x2pAU6wwoAMKyfXgsQCj5Y0P6tjD/2yQKIB8Bph4gbT+WRQx2ebyflbMqtMiq+C1Cv3eDUwsqfPXL+itgFeQMVRUMDLJwJQZdzIiogo51NP4YY77LcuCMtOW4dCDtFZxIbjxiKVFc3Rs5BNmGzfFzUpM1rGPin+/+Ho6xqTn1PBTb/yCeT60BpWEzEJ37PN3rdJeDsqXyQ8WyPT1GH7C7Owk1+RvnFx4YiyxAai7BTR4iP/uz84emtgpsEJaGMAlZUzM4prQF4hv+05czJOeReNT8HoNx0en4AdhpIAvdqZ7ekHsqC5R6MDJsdGlkfQr5Q==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(3023799007)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 85NzMxLQtnAz9Hz6WTku09WHVU5vf//RaFYR1tIdTAOZ2nwJKTzWbQq/gJBTk86TUvtD18tKvHQTY7xaA5rtyV3YkPUuovh0LXGwrI+4o94vl4lk+0bszzCS07wbnFI2syGnhgRcSA/eqRyveVtlE5bU4rZNFwFcRJFqZEMvdJCS9PKbgn3rWKfaW5XIJPzL7dDCmzBtNQ+dmGF5EG7LR2o65OGJcrnSWnPRhtBnG3bFjK9MGyNB9uo8r9RZqet7Pt9BkFhfF7SSINj6ce3D+OEqc6JCaC1GyXiAG4tnK4UsLTMAPQf2At/kcVrOK9qT7j5m870PjQ9GEciRhKpLsejFnbFd7L0674wjZF+8T9+g9cbrOFtmiUwE9QJwRgyPTWf2DRiE/JvMyLQFa6Q6t5PiCbkV4AcFxkAJ+2RiackRV4k+evA2V1PaODfKKtsK
X-Exchange-RoutingPolicyChecked: nfKKmmIViTFOF/o3FurAMxtKxFC7G04xK/VFBMfCuJCQfh6t9run/YXCT9wJYTcnD5sr+wqQhLEqxCJ/0gbHGwhPsAOMk5XMwOVtMLQl3K9N73hWkk7VmnKRXxYF5oujv6FtzMkM+mZLjCO9cZJZlDS7GDVN1n7VvFs6GApJDWVNK9HPOYgjI3eyDSUxYpF9zxE+XprtlarnCM1XEHzvLD10vnNlVMWTr4Oso5AAOSAxJvVn4oBefuXSnGzFXGu2EsnCYTeU5plRka6XA81tHz1F9J4s8LHBB5NlKPIrakYpvFDF1ScwX+GCkUgVVhdFz9A5aAkaOnbxd0nLXn4faw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:55:53.8825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0b2d9d-89ac-4aa6-fe86-08dee1a73d6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4952
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX/KdeFRkoCGnT
 Zq0n4Kru1LzWTnmbKSuTjViEYTWR8INumH+Q6JdM1VS6auC8+qaNVJgYha7Zzc+DTr/fgS7P/rq
 +WPMG10bsiBwiJvDqkQbRqQMJIvce0o=
X-Proofpoint-GUID: 4Ik_0kN7ZaAeDgoz-esxfVAV-0QFy5_T
X-Proofpoint-ORIG-GUID: 4Ik_0kN7ZaAeDgoz-esxfVAV-0QFy5_T
X-Authority-Analysis: v=2.4 cv=GLo41ONK c=1 sm=1 tr=0 ts=6a5631df cx=c_pps
 a=WWBLjRe7FI6dQUFhva+Khw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=80RN8Rq2F7w2I7kDcSgA:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX46SMit8efEpL
 D1foeN+Lyfw49XxtCCq+4TICq1DpK9v+WaNrauyBc2/KNh1uKFx2j4sS7D8eM0N922Ny4CYlEiB
 MICN1ah7EMVY5H3HovNrBiEjwT+Fbx9nvaeX0eGHKZX7C1RNdBszjbz63G5qNYjUxqXpETtIgsw
 SqEiQ6CuL4znhe6Dk3nJtz6JQPBXlWDk3Ng87fqe/T8YbHlJlxQnOrH6w87tBQNaewin2WEbOBx
 StWykY+dghrQwDLuqarCFiDCVLXkDOHyCvcWj3s5zR6S0bUAxhSASpCKOy+apnLauCIwWpFDhUb
 c7QTnnkg1mqPiOFwL07p+RT8N+fI/sT9rFXzMn4DZjG+MnaQGCSVtdSHyzRxEPg1uGhyfUbw8F7
 OPgm53TdGGMqljFi79WOxmMwM54aLz5dO71EygkokepumjAIpwbyoKyLaAWJo0qlvu+Luqu4qhv
 cSW0SymK2EFzdJRNB3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055601_642188_90B43D95 
X-CRM114-Status: GOOD (  12.41  )
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

Add device tree binding for the Cadence DDR controller used in TI K3 SoCs.

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: Gandhar Deshpande <g-deshpande@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 .../memory-controllers/ti/cdns,k3-ddr.yaml    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti/cdns,k3-ddr.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti/cdns,k3-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/ti/cdns,k3-ddr.yaml
new file mode 100644
index 0000000000000..89caeb111627a
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ti/cdns,k3-ddr.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ti/cdns,k3-ddr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence DDR controller for K3 devices
+
+maintainers:
+  - Santhosh Kumar K <s-k6@ti.com>
+  - Neha Malcom Francis <n-francis@ti.com>
+
+properties:
+  compatible:
+    const: cdns,k3-ddr
+
+  reg:
+    minItems: 3
+    maxItems: 3
+    description: |
+      Address ranges for the different register regions of the DDRSS controller.
+      - ctl_cfg: Controller configuration registers
+      - ctl_cfg_pi: PHY Interface configuration registers
+      - ctl_cfg_phy: PHY configuration registers
+
+  reg-names:
+    items:
+      - const: ctl_cfg
+      - const: ctl_cfg_pi
+      - const: ctl_cfg_phy
+
+  bootph-pre-ram: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    cbass_main {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      memorycontroller: memorycontroller@2980000 {
+        compatible = "ti,j721e-ddrss";
+        reg = <0x0 0x02990000 0x0 0x4000>,
+              <0x0 0x0114000 0x0 0x100>;
+        reg-names = "cfg", "ctrl_mmr_lp4";
+        power-domains = <&k3_pds 47 TI_SCI_PD_SHARED>,
+                        <&k3_pds 90 TI_SCI_PD_SHARED>;
+        interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges = <0x00 0x0000 0x00 0x02990000 0x00 0x4000>;
+        ti,ddr-freq1 = <0>;
+        ti,ddr-freq2 = <0>;
+        ti,ddr-fhs-cnt = <0>;
+        clocks = <&k3_clks 47 2>, <&k3_clks 30 9>;
+        bootph-pre-ram;
+
+        ddr: ddr@0 {
+          compatible = "cdns,k3-ddr";
+          reg = <0x00 0x0000 0x00 0x72c>,
+                <0x00 0x2000 0x00 0x4b0>,
+                <0x00 0x4000 0x00 0x163c>;
+          reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+          bootph-pre-ram;
+        };
+
+        ddr_pmu0: ddr-pmu@100 {
+          compatible = "ti,k3-ddr-pmu";
+          reg = <0x00 0x100 0x00 0x14>;
+        };
+      };
+    };
-- 
2.34.1


