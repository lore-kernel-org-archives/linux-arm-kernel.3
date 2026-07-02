Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lU56bt1IafO6c2cPEFE7TVbu9D4WgkcyF0ebQRClug0=; b=PHvNdt0mbwZrfuGNXUlUWrcKM7
	DMftvDp18HnIjJwBbX/y39I6JVqGhihcwEfyBbUolFFXUQ3tZZkMqa6yzhBfDVTNTloqxqwRu0kKj
	K9s+0wdCuZs07A27TVHOy0s1fkDD+E2nuQ8dQvAiDgcU0/hTw/WQihKbqGtrkhpZ47x/D/AzBLMSc
	3I03a/IQTCIfb0Tqs/go2KDRo2ujVSyxwDA0E74rT2v+IiWwBz7+e7mNmFEftenPULsVnJSoDS+pv
	IO7dgcXFtwsWBXBvwIN/gParVly4kUHLqa1bnEtY+WWGoUuhoguMa2rwNFVcDus0Sfo9oG3CQAUcs
	53Ddko7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDnG-0000000420p-18uv;
	Thu, 02 Jul 2026 09:33:14 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDnB-000000041yO-2Vg7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:33:13 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628T23R1285542;
	Thu, 2 Jul 2026 04:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lU56bt1IafO6c2cPEFE7TVbu9D4WgkcyF0ebQRClu
	g0=; b=GNciXtZyqnhL7B/3dcAgXC4zDLV93M0a2Ny063qHx4tqc4H6EAiLnG+2Z
	AygiEYwYlrqJhfuP6olSE+gLlyEAEhn7LukaYv4dbVJIGRQNxLm0aKHTDUunyG00
	VbCBIvaLl+CyabrwsZJpiDced5qZ2MPwJ9ScEB1O6EgF1VhHYZX2cV/rY31nv3QE
	L2sOhxqrEPx7RibJDPpc935nRhn/pD3DbzDUZPp/m0M5FZFdnBJDrJhpSzm5HekB
	yyf2x/4/DHi71rvnPOVjyUe82Tce80ckdDl5mVUWciF9gy92y6Yj04N3LPmaWVMG
	nzPEy9Luztd0unLmUetQW/syf3DQA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011031.outbound.protection.outlook.com [40.93.194.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5fvyhtbh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:33:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSyZqr78flvO5KVxzFgqnt78lQjylzWBHTRKPtgqaHziAy34v26E3jsRqMc23vJxOTBOThygmCqDA2gTu+W1OReB1ehzVIDo2ogxwmVrdhoShk+ftCLUpSYkc5DHTlWp6ng8FG/HLJPXY+08asekiWdKG/f+C1bVZmXf5o5SrtiOL4aDZ9h0f0yYECkH3u/Rv8waH2xpl8WMdlEIhavH2eMfLoQJezNC/6P6j+4qI3WFnzpM0W+z4gnubhsKdDZ4batShaqBy8Wgo+Q/AbpANAQvH+CpBjIHCoyBNKuVKci71BByboXvIxKmGgBjqfYT8ZGvXDGMvnH9Y6HgmSd1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lU56bt1IafO6c2cPEFE7TVbu9D4WgkcyF0ebQRClug0=;
 b=saBFTioH8RQnT2QcHWa3OzdghE5CQbz6mQzoaxuo2WcdyCtkItgvgOzwYMk+ZmmhZRFjM2CSAdxgSpTcALTsjWhEENPp9+cbb4Gqu00XMvxeWuBubrqEprHLDX7IdUUn3pz8zRoDjsmjTVpTujVMBnX+iwYjN9oOZNSpeFAxvUICq+TpnuRRBYN2uEvCfPCoTFMc3WEk1y9NcDNj+ASH3RojCzXton4xRQUpzN8FjtZmpWHCwsXgmSs8MnqyxWDfeqJcObBsp0V3BkZqXlxfwmUH3Txc7rF5GezuCuxB95qV/SNaId8Uw8+5w1Ns/gQ1zM+EutmdfAU2mMSEu/iA6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lU56bt1IafO6c2cPEFE7TVbu9D4WgkcyF0ebQRClug0=;
 b=m1FYYSqGOvYioLNBWcjruOzFAtXH9lKVEO4b5QVVKHyAgOkDX1R4tWrNFgCY/RR7CSCYVJJSsxtFvgL9Zeid6fMztncro8CV7YMxl3hu+gQiRMIAzY/YGc0W6J+3c0aQ5WjfOeKMCXhaxXuFEwUrPtdHK1d8u0r96T4g2W6F6gI=
Received: from PH8PR05CA0009.namprd05.prod.outlook.com (2603:10b6:510:2cc::26)
 by CY5PR10MB6023.namprd10.prod.outlook.com (2603:10b6:930:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 09:32:58 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:510:2cc:cafe::e) by PH8PR05CA0009.outlook.office365.com
 (2603:10b6:510:2cc::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.3 via Frontend Transport; Thu, 2
 Jul 2026 09:32:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:32:57 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:56 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:32:55 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYb23611021;
	Thu, 2 Jul 2026 04:32:48 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 09/18] arm64: dts: ti: k3-j721e-sk: Add overlay for fusion application daughter board
Date: Thu, 2 Jul 2026 15:01:14 +0530
Message-ID: <20260702093123.1048575-10-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|CY5PR10MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: abe897b0-55eb-411f-37a0-08ded81ce6ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|13003099007|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bdy93a13MedK3gI2hqdmC98U3/cVldssC6NvTVqR0pdEbsnlEuLgQpaJjBdPl8vnP0H8cnt+ftwqK0Sumh2uOTBqSFh0hKuc1xnKeb3mP6ccgg6lWBIPj08dnKuMN1THAPd1+MQQz9uCRjOYp7/vXgLC+uW2Eg/E2+ypG4xUQuYEvJFxV+sC92KK5QpjT44wHZlgfflEEHOJTsjGiIopv312jLmtn334lapaWSjQp3g0BmtBeP1dEG1ibtwuG/CkGII0vMSG57lpE1QRt4S5b0QAPP4xi1WnmgwWWxM9Z9PklX02E3LejNrvbQIdeTROOr32fsgB2gUc35mA/tEiaCqR1qyBrnLNovdNxNX7L2WllV8sutr/1BQgCBI1S9AId7Yk2zwfdVm8pLy9xpNrgSjP9A8dIgWz2TCP/t3HCxK/+8VF9q9Fyfaf4Z26kMKHp1hpRJZsJRB9P7gOCVVMy69j10D6haYESkK0/ulkI+hOxkJ0noYqd3EFGmNXn28JsLEFMPgBaSc1Sx4QDF+oIcI1ZxP9fSm6oVG5Gta2o5C7NLJP3NntQKUofosowhy7jFlgCCd8ytmLxy8AcPWuyZ2t5m+8Hf1sGfLsZpOhYDlzKqN8i7po5O/gV0dIULBYGFwgbM5BHqnzQ2BV7eB7ug==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(13003099007)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NQaH1Ygk+b6RDuqkodOKbvyd8E21UMn5jGLq2T3Ry23XJ63A7KzN3U/5zL0GUremx1SDloZkcUqM0oOFgJWq1uC6NJBSGdw7SjzYrX4vhlCOa8/MbYB0yqeCDO131h4Rg8qcyA2HkBi72tf7RFHZE4mZ3kwSNGdr9YxJL2ahITwZCx2BjebrxhKw6x65SIQ5nUMNte7ExANHG96RpWBOQnGMvnqn59B88ysRxKRkGmmCMxur9U0CZvsOLt4u2fNeOdgI+niOJNEqOChRXQAk7fkZXhXVSePCNhQupB8aAu4hd2jL5QkQ/IZ3JLwOMrsT6RQhH6Zaw8F0hdHsmHI99AXRmo994s4jDhQbEwLrUuLrQKkjrvE86IvpJ+kfJ9k68DJzzmr8VBwCdetBgx5P3a7rnnsiRJxmQ+CrYWYR6bG5DBOAjKL478ai+pAN/bm1
X-Exchange-RoutingPolicyChecked: nQKhnGrcHHgYL053KCDWHsQqeQ0ZMKZAGnCtp1Z0kF/G5BKw4G99AHSzbgLrmvRdP+yQFEdBxQp7tM5DRrB2SwAHvaUKd2kEhf3/4CAGiKPCv2PIYLTX4IvGazZtGkLEprDpmcnXWi14bZr5mmsJmmT9Y/V+bKKUjSbrInQZvLPIug1+eRU2dP0PPcMGXFNfE5aOSXNYmBMzRYmSD+7CMI2nzaUD4ndVGVgpjwoekRXBnsei/teEW72lDxtNLuBtmg6S3YsviHMtQBqOOngiHBxvDjCtZZMqTWerrzQOib/H/4bmpf7eDnLE/SS1NuwAfuKtOsmeGo3j9YLTi9nFjA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:32:57.7461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abe897b0-55eb-411f-37a0-08ded81ce6ed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6023
X-Proofpoint-ORIG-GUID: Qii04GQQvCh6cf6ZIzT2SXmxS0tuVa7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX1xqykJYsF2GH
 HE8euSS/TIYXbDfHS9ZNvvGZFLHo+jkWeLIcHR3oC563gVQ9hFGZkvrfwBMKmTJXgZ+ZdJHfy95
 cPXIBppeVGV9oC7YJZDMVDGvqSkWQosUoPD8XBBnIwUMs6jLwebBSBLMDakllsHKXadiJrcOxTH
 OoI4v7HDa0LUozO1Lft/FI5fRJFb1hjeNcViMjWlN7txRmRCm1SXBncA/kZbsR274ITHlHDOhTG
 QnUaN1BnWc5AXzxavF6ZJdyqIl0qUvdwn4hQIUwMEToD5Z/JTZOQmJyU+KPEp7RWewZYNVGchU7
 gKO8HpcH2TtP2Wbn0yVTxdgPzUcq9EY99cX+nzvpVxb3SIe+0de+uWjL/jmgQ8NsVTMxhzuUHtJ
 O+Rvj6DUSVIYz1XR9JtvN44YZ//j/u5Gs/ODWPG8QwrY7JSoTJntTUsRi0dbi+9tXCvSIzAN+wD
 bsK+dzYSqy7PKARioog==
X-Proofpoint-GUID: Qii04GQQvCh6cf6ZIzT2SXmxS0tuVa7B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX17fxUJJHnxLz
 KVoxlN1lTAsXfpWMfZCDrC2/mfPu75+SL9X/Xazr2crJXcjk64I2qjBotlIYq1CihjSlTJnFSpf
 kHx4Ln/mwCmIqNnxEFj06O2VmfjEhqs=
X-Authority-Analysis: v=2.4 cv=T+q8ifKQ c=1 sm=1 tr=0 ts=6a46304e cx=c_pps
 a=Kwamffe9LshCGz4O85X6AQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8
 a=6Gx5YW5ajZytYw55i70A:9 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_023309_754956_26963543 
X-CRM114-Status: GOOD (  16.67  )
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

From: Vaishnav Achath <vaishnav.a@ti.com>

Fusion application daughter board [1] can be used to connect multiple
FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
deserializers, each of which aggregates input from up to 4x FPDLink-III
sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
ports on J721E SK.

CSI2RX connectivity on AM68-SK and AM69-SK is the same as that of J721E-SK,
hence the same overlay can be reused.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  10 +
 .../dts/ti/k3-j721e-sk-fpdlink-fusion.dtso    | 191 ++++++++++++++++++
 2 files changed, 201 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 79ce2ff38cc3..b31bf2f305aa 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -148,6 +148,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-fpdlink-fusion.dtbo
 
 # Boards with J721s2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
@@ -268,8 +269,12 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am68-sk-fpdlink-fusion-dtbs := k3-am68-sk-base-board.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-am69-sk-fpdlink-fusion-dtbs := k3-am69-sk.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
 	k3-am69-sk-pcie0-ep.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
@@ -284,6 +289,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -348,7 +355,9 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am68-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
+	k3-am69-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
@@ -356,6 +365,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
new file mode 100644
index 000000000000..dd82ec3accfe
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J721E SK,
+ * AM68 SK or AM69 SK.
+ * https://svtronics.com/portfolio/evm577pfusion-v1-0-fusion/
+ *
+ * Copyright (C) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_fusion_25M_fixed: fixed-clock-25M {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+
+&cam0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	deser@3d {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x3d>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0{
+				reg= <0>;
+				status = "disabled";
+			};
+
+			port@1{
+				reg= <1>;
+				status = "disabled";
+			};
+
+			port@2{
+				reg= <2>;
+				status = "disabled";
+			};
+
+			port@3{
+				reg= <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX*/
+			port@4 {
+				reg = <4>;
+				ds90ub960_0_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+
+			port@5{
+				reg= <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	deser@36 {
+		compatible = "ti,ds90ub960-q1";
+		reg       = <0x36>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+		deserializer_1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0{
+				reg= <0>;
+				status = "disabled";
+			};
+
+			port@1{
+				reg= <1>;
+				status = "disabled";
+			};
+
+			port@2{
+				reg= <2>;
+				status = "disabled";
+			};
+
+			port@3{
+				reg= <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX*/
+			port@4 {
+				reg = <4>;
+				ds90ub960_1_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy1>;
+				};
+			};
+
+			port@5{
+				reg= <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_1_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&cdns_csi2rx0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi0_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2_phy0: endpoint {
+				remote-endpoint = <&ds90ub960_0_csi_out>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+
+			};
+		};
+	};
+};
+
+&cdns_csi2rx1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi1_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2_phy1: endpoint {
+				remote-endpoint = <&ds90ub960_1_csi_out>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
-- 
2.34.1


