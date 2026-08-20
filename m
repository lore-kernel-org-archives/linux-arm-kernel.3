Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BCAC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVwoskEgcxBf411/NZgWXA9GOoo43Ki2I8HbXDxGxAI=; b=XJlQ+sEDL1mCaBrXEyi7ktRdxe
	3UMZRsRErDayKpE8ojdJ48bZVusq8U9ln3YMW5uRF41C8M34QX0WeoyLdnkb7IPdsh/l23T8mXamj
	jvSMWmCSMIbKOMofbhWHG5aX3e6Q4M+jgOv98og5hkI09TVYGZuA5Ghhv6Rrjny/NqL/PrrjioP3p
	eLr5uNo6urEEPyvx9fxSxOeYfdXY3jFAcD2Tx+7iWN9u0oqUt/d4ireYA1lrvkhGTQ2KpTmq0CMyD
	fKEr5p+K+FtvIikQF1t+MCnShccv6jsIOfJIA2cLkxWeYoOzpJPs70G+oTSzdngjtPNveOCo7/TFy
	vWtlxusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8Rh-0000000C79n-06gh;
	Thu, 20 Aug 2026 19:29:01 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8Re-0000000C799-0zVM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:28:59 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67KIKGtD1218049;
	Thu, 20 Aug 2026 14:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VVwoskEgcxBf411/NZgWXA9GOoo43Ki2I8HbXDxGx
	AI=; b=WpMRZjxqSE50Wxe+LT/T4G8D9mKFwULb66cNmWeFHSrJEAivz92HhjHI5
	JkUoHQPcSqshmdfHRZNGDB6sNuUq3Q6tOKTpRovnjTnTMmOXiM9qL/6sNTI6YhbX
	1roFUQut+ZwO3ifQ3Srgthbc/adzbv848IbHkiXpHrL4CKCU58pNKZtokp9AEE9N
	Cn/5/PQv0TNJp/+4Y0yIrsuVJn5WqA3BGWcyOp7GQLNQtYL2pY0Wn2sj8IlXO3eI
	vjCYW0CtEiKP3ifXh/BmxYkE1kFhZnJ90Zh+KJeIC0H9X/BuKX5NTiiaZfp4W8zv
	D2vdFBeUhXL/q3bSHtbzFwpepzQ/g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011068.outbound.protection.outlook.com [52.101.57.68])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g5rtrwg1c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 14:28:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwPgKAAfiXelGVWWOIqQFSCNvlKNhAowV9tjbBO7OS7cMJYAmxSzrIQ2D1D0zkpItt5yCnCOfcecdp9KXUg2osEKoAWpOarSiE+8g8Bql0Yv+C/hzuxWx41gsHDDP+SEzdQqNCbpjuFIa5H+Q6js8HdGtv1BekNj1mJSNub2HPh4Yv7no/sNYQ+wzAoW561qAmvdH9ecfjqiUuJnFZfWVSdcxHydMnbt1hFny1sUJuJfjCBg5wtk0h6LidPkrndMR7uQldFOSkQaI3oQHPP9/KcNP3fs8QafZaKbVacxuFwrz0+GxreJ1F3fWue14KbE9woUwkU//61vhkfJMX/VMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVwoskEgcxBf411/NZgWXA9GOoo43Ki2I8HbXDxGxAI=;
 b=TwNacJuUAZX3PXdpUsaqDn2PRbjQ41xABl1B7fvZ8PI2CNRobKM5apLscJke175nGDkYpAvv9wBMQ5O8FmpFpu5ir6gO1o0qm4LEpJGocCAnsuRVvCKSLFYz7MvsdRDGNdMTWys3wGH74jqznjfi65RTfGWTu1hpjuF43DD/OycV755MJW7LjkWIKLrzVhGcdhTUdXDmPzeA5vWzLcxWi+vBcxR9FeVOumoyzigqiikszHhgJepkoZMms2B7v5bB/2oOzYn+pCNJ7YRG4emZWBRAdf5OWmrrjWy4tL3PsmS22xmc86k6eAMonlQhGFADfR4fGF5XDs6u1rSSC5I98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVwoskEgcxBf411/NZgWXA9GOoo43Ki2I8HbXDxGxAI=;
 b=mAPg3+NwmaYOqQRjCSfUp6kdBDbi0lX3vAo5hgbP8zmdR7CQN2DUDLjSf1YxyR6JboW52aqBCzUntfnQ9ZY4ZKk22dVLd6CM3LBawnXwwKqiA/T5ftpEN7wYydzVOv5tkel3qEELsoDqhMlhewHH03h6dl9alyoJuiuQLZhbs54=
Received: from CH2PR15CA0014.namprd15.prod.outlook.com (2603:10b6:610:51::24)
 by CO1PR10MB4532.namprd10.prod.outlook.com (2603:10b6:303:6d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 19:28:52 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::8e) by CH2PR15CA0014.outlook.office365.com
 (2603:10b6:610:51::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 19:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 19:28:51 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:28:51 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:28:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 14:28:51 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KJSpvG1779937;
	Thu, 20 Aug 2026 14:28:51 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 20 Aug 2026 14:28:45 -0500
Subject: [PATCH 2/3] arm64: dts: ti: k3-am62a7: add standby cpu idle state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-upstream-standby-v1-2-6a0553b9713d@ti.com>
References: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
In-Reply-To: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787254131; l=1737;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=U0zj583K7JAtQbII9EQMxtyrWEWLf6vKNuROEipRbAY=;
 b=2FZrQT1h4JTh+CCldkFfsu0w15oadWSoCkJvr7DjPyYZjyuFC1sAnrV6c4FEKM2M7MUfd8AuV
 Qg5d5cfquxEAc9ZvagUl/RtaXyF2XrDmbmSaQoJWgOCAOYgMp+PuAWA
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|CO1PR10MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ded4333-a096-42f6-b355-08defef14440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WGcb0+vaoz7mEXZnv3riZLRCDWM6bQlFtptwny8ZGSULlGDNW/HS4uJOmUT95Xdp5OsX5LOSwndwKCoL2GDP8e+X/cP9Wkd62oEmLQSSd79EtZIbuW/FgFBs4g11sAPALu4XzPNgB+lxkaaXFUC2Z0bxsCfwsOy6SUQQ+sswSwZzhi9X8zIEFvIuze2ymfXLrT4DXa0ydedBwoxoKm6gwDsY5LCeA2CepXpIAUDCpw4XE7J49g8o3pGVusS/AQpfYWwPYEibFseXNNybN1bfNFfX/PcLoVEna3F37sCX264TSa3WUW+OTmrsZLKHvtUw68FlnloMiWyR09Ot7GDEkzml3uRJBRPHiy3V+ltAfEg5TQF1N2E8u9LCbSnxzCgYXfqQwKb6Y/G2p+MMuFhhKKWPZYqtUOCT74bBale0mf11L+cWeYvmcknWten/iXAl6bK9niPWT+qi6lchkipC8H18X6Xgj1xsBeehhDqMjy6NehgyG1VUL0X7HtmYUY+8D9UErrRrBUpRxEJKFai8YeAkxBO/ZCniq5ALNQoaHyHA+DOAXSBIRVpj2gpdO0ODKX5EQf5tHIaJ1lE932M+WDHd96TrKw6irofkNVedyYoqwWcdsCOaTYLL1+jzjf/+41BvFsbnB0NlbUpRNRuEm4CQRKahyq8L8i7gxpYmP1CFiHXCMNgs5CU0tX70H1jeDRCoxKeBIQ9PggKb+n1xjg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Zx26CZopQrZjAqTYSBpys+fkXqneSFjFzQ9AKqMcJU5sKSlSRpTv+7fGQEs4gitSSdoyCCpVEMz3kI1+ezhuukN8gtbA4p2T+T9oLxv9Vx3h5RsHXLtY3L1KhEsIuEnw7pbqS+NcL9rDCvlHs+O3PIWJw0bIcBxi3fEH2U01DpNfD4Bvc/xRoFb88H8RD2C1wxkyAenvj1oSUmVG7qIVIPejK3KW4e0hb3NtLx2gV5jQlNJI7U++yj1nxrQ7SgKfFV1/odjUBVCBzsSyF1P3Lyjfq2MGR5tQXDz+QemRyN5tiudDFhuzdP/4X1FSEQQDSDx3zX5sYsJNvlepYYrjvRB++DI8MAz9D44GttNXqGXcqdSQXRkbNvpFFs2aS7lMRuA/syJCkbnw5OoTu7MgUSvPigJZxApP62yS01TfrtmKf9Qt0GIGDk/Bz9ffHbM3
X-Exchange-RoutingPolicyChecked: i1b4OIWqLEbGaX+aezWS/15l5TAprRzY+O6MiVg0ON9UFBIUBC8fjcoud284grdiuj7VtxxKcxGrc6hUtVSvyUHLKBUrIhAy3VkpJqf8j9eANV5bU5fIW5b2WV5XrsnDpl/M6jQe0lDPCX9E18sMJxReu+YUla3G0QruM2jbb24OR7wj1m4htgS3nqxJFhld75CoiU347gExRFP6fMfFWlOjO2xbuV3AtKTWIVx7Yi7Bmrt0NnQvc1OljO++v5ywt8rSl/HWc94nE01gX3yWvsKRUW/BEuGGWkSYf1QYYYtqDZp28oBY/TpfIAaWyCvcbBnU+8eI/qoWw608AEAJHQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 19:28:51.7791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ded4333-a096-42f6-b355-08defef14440
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4532
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0NiBTYWx0ZWRfX+J+TAczaoYZN
 y77fXYGAyzc4HDDwmJh6W7mujTz777wu1GU/0OqhV/rpRzFKtp2ShNRvv8pWYGPAPlWFpt8UUou
 oCrAjnOnlipkx22sB2DZ8WpdfrxnjM4=
X-Proofpoint-GUID: G15R3DpCztTl1VlW1RE3otKA8BaoJlTy
X-Authority-Analysis: v=2.4 cv=KO5qylFo c=1 sm=1 tr=0 ts=6a875577 cx=c_pps
 a=lgH93Z6fMBj3OFKE3BLqTA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=JCvaDCtmhQKSdEqCcTAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0NiBTYWx0ZWRfX8Csh2U2gVCKY
 WTwDgHhqIlqy8y5YL5v1HJxisyLAJOVe6mpm787ZDBD/IG58BMGTEYU3Bqzn2qoXrnlSp46mt+L
 YEHu7oBJca2HvpuD3jjtEsnhEhWsosK+HbxhU8o8uuHMJkkA6PF0+GhVJlnjcP/N9JF+cxz8sYm
 j+Zd96Y8UKqwWwjudsJoqWjdc/jSVGMRba2s9UIgDZCbugpjJUjssolwlWLjgeWtp52WoNpg9g+
 Qpr12N4ZuT1lLHO1jQDXZlHIDz43Avsk96PxIy6lZF/hx7qthnQiBbbNWpJF6+xlXZgJ3kprcmJ
 yCW2DXPJ5BjNE2B1GkrxECxzvGNGn2UAsj6UHyQYeLRGLR4Eqxymxr6tSaV7pxLEKJG2h6xE2yk
 mewwcF8Bo0q1VizjekMHN3qIWsuNGFAwj9MqtpjoXtKDZiysUReiuvfS6PIg514mIfZp3cnSCP7
 JvmX0NgkKM2gsLceVeA==
X-Proofpoint-ORIG-GUID: G15R3DpCztTl1VlW1RE3otKA8BaoJlTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1011 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_122858_425776_59E28C08 
X-CRM114-Status: GOOD (  10.52  )
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

Allow the A53 cores to enter standby mode on the AM62AX SoC.
The standby idle state enables the CPU cores to enter WFI through the
CPUIdle framework.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7.dtsi b/arch/arm64/boot/dts/ti/k3-am62a7.dtsi
index b6e5eee993706d6e868ead810202c90e69cd0394..c3adb7027560b4269927517ac4788e354ae2027e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a7.dtsi
@@ -51,6 +51,7 @@ cpu0: cpu@0 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 135 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
 		};
 
 		cpu1: cpu@1 {
@@ -68,6 +69,7 @@ cpu1: cpu@1 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 136 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
 		};
 
 		cpu2: cpu@2 {
@@ -85,6 +87,7 @@ cpu2: cpu@2 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 137 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
 		};
 
 		cpu3: cpu@3 {
@@ -102,6 +105,20 @@ cpu3: cpu@3 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 138 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
+		};
+
+		cpu_idle_states: idle-states {
+			entry-method = "psci";
+
+			CPU_STANDBY: cpu-standby {
+				compatible = "arm,idle-state";
+				entry-latency-us = <100>;
+				exit-latency-us = <50>;
+				idle-state-name = "standby";
+				min-residency-us = <500>;
+				arm,psci-suspend-param = <0x00000001>;
+			};
 		};
 	};
 

-- 
2.34.1


