Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B051DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SH0aL98N24n6vQT1Lwbq3c8gMWA1kAel8M+rfpN3X8=; b=oKQIMRgoVpUkEyxldV1qOCLheS
	rH6YU8UlMnKHpIQ+z63yeqYYSAPW/gVC/27/pv3eZs8efpZ/KCZ67kP3DcjhWCjxqWWHJ3D5HvHXw
	uIpverohqEu/wKf+x54Z8vEw+6GBNQ5M+nmcAXM/x5EvZpRrSvpoXhMXw0oTGYJw1wJ+DSjWCYgni
	Rx/Vor4kqQE0Gy+MjgWtdeUiEWJaEQ3nTe2rHhgE39ktcBfyMJ1izEM6+EdZ3h8ZvCbZlaElU9B+M
	QBnTZ8G99gq6azz/are67UIND+AKZ/nE2QzlIIVxSPTaJDWqyXUtI1PTA/Mt91hTPWqTKcGWSBgSp
	fG4QWTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlfR-00000001tA7-1O05;
	Thu, 09 Jul 2026 10:07:41 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlfN-00000001t8Q-217W;
	Thu, 09 Jul 2026 10:07:40 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6697cYad3635970;
	Thu, 9 Jul 2026 05:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4SH0aL98N24n6vQT1Lwbq3c8gMWA1kAel8M+rfpN3
	X8=; b=e6cHo6W21/pcjPeK7VMHv6HIIBrSuOLOQE+TWQjwnXf+deXS8XGonuoG0
	DVYIocdyzAzCDSqC48HtpLGUIh/jSjbRY6fBkrGPQTHIlDg/26atTN++TxSqcla0
	EUuFsHIJ1nzDKJILtYLAEwDYCNKCWp1+dIEEVyefrEpVUCBPGBS6TYtOGGGbeILH
	kzYPoUYa2i6seFVULh2L9i/ERmlrV+xgypllDXhckvghEkm7qRmEdYvX/qsGH3fD
	RMHMvTEK+nTbsMfcMHO6ITkwFa0sHJ2+sTTXNOmdnluEQSRWqWk5ndkrHpCMAfww
	MTLsRQEnDyKEEFcBRrzUIuZVJmurw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f9nft7vd2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 05:07:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7j/Al+0pnaYTYDzLNVgkXe7VCfb8DvuJq3OhxRW+14kT5gymerRN47cHNwDA8PByd6d0gJgOlJClC5QMdjLLj/dsKump+9QVtaP1yllGCDioEPXU61tV1G8WdLogHPLd0LcoZLBLl1wMCauWm1reencPz4zUVpAxtS8Xpsol21Rg5KJMauEEWe8/YuUJKaqaA4Vw4XVOuzBFTYEmsBbTnaWjl90a5QAxvi/c7zK2i699Mr5z5sCNrffJjMucpCeTaH+52feauDtxO6JiwxTlnw2l9DVG4sVmSIbZRsQdE5/qPG8zg8e6VUqFm/Ns9W0r5Dppepie39j8Bq+IkQMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SH0aL98N24n6vQT1Lwbq3c8gMWA1kAel8M+rfpN3X8=;
 b=skur07rpMPi3sppI8Ez0LSFK3HGzAfLAoNsSaKdne70bVpUlku+YS8/Q+upw4xgQkpiazKFApGnzvL82iLPKhRRywmq2tfHOgAwI2iP0+X6XbsZHrMU7bI5pua1Wg8mb2jEwgZLNUPhOaHXOT3779eCE6vZiPnhGc4pKUHirC0vJ9Hcb9Rfxw9XdrmzJX3YmDLz6p0LjcZwf1bz7mzERv9AlncRuPEPcQXJOPxKYyeW6e5IL+gsfwPCdkWlZLFAoCc0GjijGXlhyRYahVFKFX7M+sHcy3wrE53/cgbEk+VoAWAJzLhsUxt01U8uWTGon8DKZEi0Wxr785O7nK4zpYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SH0aL98N24n6vQT1Lwbq3c8gMWA1kAel8M+rfpN3X8=;
 b=uTdrJJ2lDFednStZoCJp/oZxj/iKzFhj/H66hZ3MDgkH+Ag/NMa8WWgjZYZtK/LdmHu/MguN9dF2KcYZX5QDQrf0T9BhiU80NlwsVuiD3q6W0TwV5lIVUClJu4vVY7U6V2/IE2Ryyu1wZv7y8ZTgCJ9lnguNS+vWzXqjoTbRU60=
Received: from BN9PR03CA0359.namprd03.prod.outlook.com (2603:10b6:408:f6::34)
 by BN0PR10MB4821.namprd10.prod.outlook.com (2603:10b6:408:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 10:07:22 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:f6:cafe::10) by BN9PR03CA0359.outlook.office365.com
 (2603:10b6:408:f6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 10:07:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 10:07:22 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 05:07:21 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 05:07:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 9 Jul 2026 05:07:21 -0500
Received: from [172.24.21.78] (ltpw0bk3wp.dhcp.ti.com [172.24.21.78])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 669A7FPk385552;
	Thu, 9 Jul 2026 05:07:16 -0500
Message-ID: <18b1c832-d0ba-4465-90c8-09e7c48becde@ti.com>
Date: Thu, 9 Jul 2026 15:37:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 1/2] dt-bindings: phy: cadence-torrent: Update
 property values to support multilink SERDES configuration
To: Conor Dooley <conor@kernel.org>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>, <g-praveen@ti.com>
References: <20260708083725.66777-1-g-praveen@ti.com>
 <20260708083725.66777-2-g-praveen@ti.com>
 <20260708-purifier-subside-667f32244c09@spud>
Content-Language: en-US
From: "Praveen, Gokul" <g-praveen@ti.com>
In-Reply-To: <20260708-purifier-subside-667f32244c09@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|BN0PR10MB4821:EE_
X-MS-Office365-Filtering-Correlation-Id: 41161f3b-af35-4528-08a1-08dedda1de81
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|56012099006|18002099003|22082099003|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: S+5/eX71ES115MB9w8f0CO0EMUx/OGHVjQTkB+5GlcjKLRqyT8yTZXton+WwmycnSB4LtKYv923xYen6mmdfqIbEgukqp5yn8thljxfD+L2YiRPa9hu4H7nqsGMgzIDCtbe6Dkjg9re1OZf4cl6SDnoLAr7O17c08aIHFkM80Vhyu8pCjS6Ic2PDot8IlZqyVp4Pyrv9GqjOdE5K980xyBOnjLCjYqH3v9yFLGBQNTNyyH0vd7tk0kZdPKcLi7SlGXkj7iimla8/beLg0bbpW+p3p+P+9JQsFJYItyuVaXWkJZSDk5cRhpZy1k9si3eWYllUSo4gHGJpVR62NL74oMUBBaqTlD7nev5MqqeA/U5JnFyQOBEkA4NYcd6p4Fa1lwaywPNJmYTqslgAHvWpJ8nfInjHeXjzjpyZTQp8UTu049TLkFXK2oYo0dmRBrmC20FUvWioB4UfMQhSpeEKWM8saiEU66iX+bUzTxEaz7EGgjGcIaT67KItAf6KNytpXWDGagcRWC4cj6LmvhS1ZoAbcNOoKRHa91SasyssxngxIGfYDlF/wTYm+3eb3TcwiBpbvmAWyYTWL9jAoh2nssGUwm3Js+3cbR9weMaPz3fzDBmIO/ZZE0Zumr6eCF1ivIABy/A9Ox+FgF7G19o4neMze2cH3U61NbJXMPOvnTysVR2fZ2fkOQo5QG/nanF5z8i7kwCTNa6u6WhAeQwHAw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(56012099006)(18002099003)(22082099003)(4143699003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: n7pJSdUdn3AKCcr6S1tLaPEYdVBsPomcABDuoHRBGjaq3eR76y+FlkJUqILhCryFePReT3qCGDFxx2NIJ+pSGeC0taU69deCUGUBv81dSWtMwyLHoolStjDHDPSZE3ZrQNTypdxA1FSmg8qNqQjTma4XL4jjP0Tc1qphV/mQDx2ncXNmmf4Be73Z1RXo5KH9lzFft4Lo70vLY1uduJYQkHLLOO9DPRaMAXwsviMSGMHX/IfGOxi77vfOnXrIHjcsPFCkkDD5xK+8gtGVGarrNFRnGl0DtHzNxdlCjcDUt+xtgCMJL0KLqEpZXrov8xh/BpFIWorKGkmY81rctuWLXBd1O5yp+W1waZvQ3TknYymy/xNtLQokdayVtAjHXu+jxA1BEQOsliXnHncmiFifyX57im6HOg/CLgizHmDLzcWAIr2zs+3cylzswh09iEUf
X-Exchange-RoutingPolicyChecked: kBLd85Jbr3bRC3+FEpA7zyHXyNjvWiHgWMSXWQUKhB/Crb8RMA942OnsF2I6SvouobotXy0GU48fcpXY7fsxwxxKrVGZ1nII1IKrHdErOzrA+lUpsN93L11DzU5LJANZpaKf2qp1skvAcn6DDLle1GCnlNHoyg1V2y7ELxoFaDu9iGdQ3vT54JENk+EbL+RvgmA9MO4tfIClI4o3yTau47encInr/D3ktTCm/KK01qyEK9nEfawLalZyWRMI5LDcnQ9X1MygG60Y4PqCg7R2M6/T3E3PGltBF+Z3pn0am/Ogf17pXtGnx1MmP7+O0Dmw0scJaTmqPFmGCYhfqdniug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 10:07:22.4448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41161f3b-af35-4528-08a1-08dedda1de81
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4821
X-Authority-Analysis: v=2.4 cv=AaOB2XXG c=1 sm=1 tr=0 ts=6a4f72dd cx=c_pps
 a=91GdPAjHHMbPGBWG17ie4w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=5Hw9ayjz3OrUeUeecOwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: z1DpeiL1NA01FedaYr70aqxuhAdaIu8_
X-Proofpoint-ORIG-GUID: z1DpeiL1NA01FedaYr70aqxuhAdaIu8_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5NyBTYWx0ZWRfXx6x7QVYlqNxd
 1hvYfoD5tTCrVQS8r9iHhQRX47tikqHxaPwC6ClE6E6Y7C2suO6sMCDhNPUrphGj55uFjOkuDeS
 zWT4FRYGzQMB91FGdnq9cl3LN6Bup/8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5NyBTYWx0ZWRfX8Eeb8+aF4uyZ
 4iuVeYr+LawzCiTpKyK3hjnp5FGpLbMnIu8hD7ULIdzNH2mcNHE3LOnNJnL33zCGw2fXJ2h4pMs
 ztsr+Vl3SXWMObpWZiGqQh7LmrbNUR2Ha3R0/SrGH4qdl9f+Qlc/DoytyStgWmUVayE2s34lxwE
 InMYs8ADvGqg/Il1+TRbi3a7kLgY3+tEU1YQekB0eHlnakRgQywEqM1Ghp94Y0BpaUlcgQhKOxs
 7ZNj77r83n9WSKIQNLx8ogoFw/DBdKO4ZfvLnXg9j8xIDSw964AMB6jJcdsxB+Gov+eX0zqEeRN
 +v+GjmYa8n+ZjkZi7+nswkJnxQFjH6j3F2hTprj0BZF+caFnryfXOA+A5pQ2VrepGWeDCEFyjuc
 bb4DFKLEihub/8xYE4w4bkmoOyubQgAeiF9H2DxQyRTExzUbN5v8uXgkf3biV/yQ3U3mwqxvTSs
 iyH3FlUv3WHG1oSCGJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_030737_665685_CCFC3FFF 
X-CRM114-Status: GOOD (  21.02  )
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

Hi Conor,

On 08-07-2026 22:09, Conor Dooley wrote:
> On Wed, Jul 08, 2026 at 02:07:24PM +0530, Gokul Praveen wrote:
>> Update the maxItems value of clocks parameter as 3 clocks
>> (refclk,pll1_refclk,phy_en_refclk) are supported.
>>
>> Update the clock-names parameter to support mutilink SERDES configuration
>> as the existing enum configuration of the clock-names parameter does not
>> allow both pll1_refclk and phy_en_refclk to be used at the same time,
>> hence preventing the support for the configuration  (refclk,pll1_refclk,
>> phy_en_refclk), which is neeed for multilink SERDES usecases.
>>
>> For multilink SERDES configurations where the links require different
>> clock speeds, all 3 clocks(refclk, pll1_refclk and phy_en_refclk)
>> are needed.
>>
>> For example,considering the USXGMII+SGMII multilink SERDES configuration
>> usecase, having only 1 reference clock(refclk) fails because USXGMII
>> requires a clock speed of 156.25 Mhz and SGMII protocol requires an
>> clock speed of 100 Mhz.
>>
>> Since one reference clock(refclk) alone cannot cater to the 2
>> different clock speed requirements of these protocols, the second
>> input reference clock(pll1_refclk) along with phy_en_refclk
>> is also needed.
> This binding supports 2 devices and the generic compatible. Do all these
> devices have the new refclk?

Not all of these devices have the new refclk(pll1_refclk), Conor, which 
is is why the enum was kept as it is and in these devices multilink 
serdes configuration will not be possible due to the limitation of not 
having the new refclk(pll1_refclk).

However, The intent of this patch is to add multilink serdes support for 
the devices which have the new refclk because the

earlier clock-names configuration could not support having all the 3 
clocks(refclk, pll1_refclk, phy_en_refclk) in the clock-names, which is 
needed for mutlilink serdes configuration configuration.

Also, Please feel free to ask if you have any other queries, Conor and 
thank you for this query .

Thanks and Best Regards

Gokul Praveen

> Thanks,
> Conor.
>
>> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
>> ---
>>   Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>> index 9af39b33646a..ac0f625cd76d 100644
>> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>> @@ -34,7 +34,7 @@ properties:
>>   
>>     clocks:
>>       minItems: 1
>> -    maxItems: 2
>> +    maxItems: 3
>>       description:
>>         PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for PLL1).
>>         pll1_refclk is optional and used for multi-protocol configurations requiring
>> @@ -48,6 +48,7 @@ properties:
>>       items:
>>         - const: refclk
>>         - enum: [ pll1_refclk, phy_en_refclk ]
>> +      - const: phy_en_refclk
>>   
>>     reg:
>>       minItems: 1
>> -- 
>> 2.34.1
>>

