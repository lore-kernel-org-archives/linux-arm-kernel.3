Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E4FC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJkloBJ/tUn97GoNiQR30q/seUGTIeu9CBa8w8jVum4=; b=kJpdVE4U7jkZlGBtYcvOgZrvCc
	Yt09FfKw+0BzEMfVT06LhsNEWK82bMAy37ZCZnIBzoAJZZmfIFweVSjinbJ8VLPG4Rm+xc13a8inE
	+pdX4tmdpovULrzYBfUkUC/kqBAcAL8sArjHS1q9V+InIrF8tYzN0DJZJitrmn8qnO0EVWrvQSJ6A
	AkiAyE9+KBBfx7HNdyRnPoHSIHGPA92JEmahsSgWbxx533Fy79FpcQt9bOnpTZGW4qXRZYoXvUHZ6
	KeYuvhk46j7QKSReq8SktSLCWj2fAe8dDCAYVsv2BSC3msodACUsPg16KpDDnAF1ocM11+dclXV7S
	UET3M82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmAK-0000000E44X-3W76;
	Tue, 11 Aug 2026 13:05:12 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmAI-0000000E448-0nUY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:05:11 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67BCSJZQ1984483;
	Tue, 11 Aug 2026 08:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uJkloBJ/tUn97GoNiQR30q/seUGTIeu9CBa8w8jVu
	m4=; b=nJL9hd2PxLtnf3NZFXc6MhQbzvfPywc99bFSzYll7mXbaj/m2e6rZzX2b
	0bbYj+NN6I3p/e77bVFoRsauxt5OMxgBsOLKPNV75z3pMKihm1vI18jQ01+UPo5H
	Tc9tMWr70BOXFmMOP5zlIqsmt/SzOJl08fKF9T31v10EQg5Svh0qloaObBsImClj
	KlVaAixGbu+L6m7E8uZ0KXFu67A47m9GyVrtG2DrQVvPqL0DZs4d1HzeOmgkYbSl
	DnKyIQ99uVB0YLZA/0dMokr/P5c598houncJ2l68oDhsbiiFiPA9e6IfOCExRa4j
	remJvh34Lk9fpsvemvZky8n7Rt5Ug==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g00wu10jp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:05:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzGyrzAmFg7CMQbNsi4bHvFqA+bQarlas/YofL3e+w/xwg4oXPY4yEEWZYaF+GKfF3E56WAQLQ8XJ/xftM3DVNp49kfpxq8+eSjXlLkLJ8u539yAeGdMIq5i2TDeQ5mPP0M3BG6WD57ncH7Kzd48wGKC8rFZ+uCmIb8KuE63t3oAjOUrcyxL/fJkaNCcwkaAmvwU3EYcHfN81adbYHK2Y1d+RC8IY2KVDj2KOp4xLXznV3tOD4lXNtVuj0w+ma9nZFVylgBdiIkD8fiLRNBj7MuBU/BA8bK5JRghySyeI1KJsk7t06RJdaBupQhvRS0aUgIpxjrBvwFeWwfF/H7YAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJkloBJ/tUn97GoNiQR30q/seUGTIeu9CBa8w8jVum4=;
 b=re668gx/Y7YVfGHZdChaOE7G9Hez+arEebSsHbWM4XtQITGb5KBFlU1zanwcTXaYmpMqpW7PIKAroHbzut+UUNDzFLUkKY5AAy9Oe94dwbuDl6e5WEZDOrp8Jh/b/HgiYi6HE9U+AZNyLicOBENR6v46/8s5ZYCSrMW/xBJQLJGftTbNVNXPK/bBA60MxLiaNAQzVfqd08bQmKuf7SHklxAplVdTsHk/lmawLa4YuQWHKuO0/OcHo1mDYnZ6ky6opfRpZrSX/xGwYLOK6ui2cP7x8Cw1yo7xZVDeDvyXb7sHe+zWybBqqZ8eghxcyKgcZwhebgiuU6c9oICc3jmzIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJkloBJ/tUn97GoNiQR30q/seUGTIeu9CBa8w8jVum4=;
 b=mwXSPDpGcKOk8qeENuy+QyaX+/UhpZI7X+TSWXxEE14SWJ4VFrD22G9Z3j9Bmv8x4OEsmP0x+kHEbN6jOSC6zx9y1JDI5iwns0Y09vOqTDQFCEiBV0r6j5oubq1JblaBb4xxqTqEFMt006VfWvTthnkwQcGGNFGKLahJROgMGLw=
Received: from PH1PEPF00013303.namprd07.prod.outlook.com (2603:10b6:518:1::12)
 by PH8PR10MB6527.namprd10.prod.outlook.com (2603:10b6:510:229::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:05:02 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2a01:111:f403:f910::2) by PH1PEPF00013303.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 13:05:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 13:05:02 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 08:05:02 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 08:05:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 08:05:01 -0500
Received: from [10.24.52.205] (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BD4vb31224791;
	Tue, 11 Aug 2026 08:04:58 -0500
Message-ID: <733e7cdb-bcdb-4e9e-a9e4-a9d364533ceb@ti.com>
Date: Tue, 11 Aug 2026 18:34:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260723102519.3581762-1-s-jain1@ti.com>
 <20260723102519.3581762-3-s-jain1@ti.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20260723102519.3581762-3-s-jain1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH8PR10MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e7786c-bdc1-47b7-4747-08def7a927f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|22082099003|18002099003|4143699003|3023799007|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: aWzjyXmXKTX+ZNKSaA7Jl/neQQsfjIggWP57Mgzyoy8VMLdbeHMPR21/JNK6CampiONnNFlTp3472qK54Xbzyh8Gft1n9Rg1UAFTeHVLB0m/PkcyjKjlJK+fNpMwx81RmsJysnOhtSHfPUtDWjp6OvAZSKPxaNIB/IbBe4jnD6sysysAFB4DC9zch9fpv3plvRf6RJI75iKB0V8fCggxmH9O7VLiT3tvcUNu2TggYsbRYe3ekg7vajzHGz+OkvPrKd9g+KPxrr2SBkpYt9qSlRhnHu654BW1y/yiezQwk2nFwzgVRlQTETVgZwsGSj0pG5EWDfpGHEdYrzqyw95lHkWZBkpAEFyJRAhDIkIAMHu6w/J4p2evnzSuAOAkr7z6Vx9i/9fTcvHZF5y66Jyy0DQNFyDrfC1l8zeU9o7JdH9T19RbK/1hK4F8aynxSl8/qmllSP6lyANLA8sKszpBsAYumATk2jJIukF0Z2UZB6vbfcSg+poZQPMSaSbur4S2lYFe6EKMQIgpXPhNNekXC0IitkkV3NWDXUfHBMhM2yI2jQkw/LIAKVYmKIDpaq5VZOP4WQW543NIWY35fL4fgfu+cXB0xwrAtUGzWLbhZvjoFc3HIAF55R80fNPYam2TTdEcWVX4stiWJ7UGDnD5qzkNipaP1C5kSlKXXmohGvQKs/ClPdeLtvhzjVM7+om1Y2x2KDjggNJDUN62trmxzg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(4143699003)(3023799007)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NPV/oAG3rRtGDIbSRSN7z9bVPsZ6aDrYUzfDoWa+/SsOR2O+v2kPjUsukEHYpT1OoGSuQTTb0QV0j+cT3qfX7ACp8dom70XlIHr6e4uYceEm5QwAWDsQ6QQvGY3yryZxAb3oQR5Zl6w5lCp24VR6A+gGLieMjHWx3U/JwVXvn+Jz53LeUYy4Cyplt9mSvMQa3Dsz5HUAnAkFQ40hInmQTuqDH7M2h8EZrf3y+yct+sGQYy+OBhVxtLizgrUMCyKhHTo4DStUF/i5WSzfWetrjrkJArNqMHexzsIiswRN9/r/tJ6u4HSnWdCjbf2dskBk1XVP8JIsGFHvbvUgYbnu8xA+U57CM20hYSId1GTGuVTzIDbRqscrJupVEt8fIBNWy8Uza8o0DWbsds+CUyAdPU4oUtFTd52JLHrjncJz0bs/+Y3KaX0i2a4bAct+kiKo
X-Exchange-RoutingPolicyChecked: ZboqQcsVB5lOuWptSp+Pl5HM0TfrDhhXGw4ur0k0O8XQXt/iARGxwVKu/zUqH0AhhL5m4SqvPy4Z1pMF8t5ht5VdEG6FnlDQ1CjY38TNu+SxsT0oPmg173cApWcH+i0QI6m8Xudf2/+eXQC5N0NfGfyXXJC0gQ+7MDmNR//tl61oWQIDghDzde7V+nCTLN+KgMfuKtN0ZPJvR31vyiYBAxefK9bnH/CBgv6UaKo2I6jqUlVmxDXiEe6XzBi6ArvPNsa6A57knIrBBgMteJETABqo0XKKDUdNythP4HA0hRnBtXGuk8VF2ro3JwLhtnj4TKumOUr6cyfruBIVo6tTyg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:05:02.4493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e7786c-bdc1-47b7-4747-08def7a927f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6527
X-Authority-Analysis: v=2.4 cv=M+V97Sws c=1 sm=1 tr=0 ts=6a7b1e00 cx=c_pps
 a=QjrP5IPIVlaYm/X31SuGbg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=RJTEjO2CYE0iKJSmHzUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: bFZ1gc21rOvxnjVKzOz-K4MRTUPChhTN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwOSBTYWx0ZWRfX2LE7jYK/x5sP
 CBXjO4qSSueQL7mXuBub86kryfykAxkY1lZrk5CLLFBEXyra+hpd30yhWYNpY6/Uky0tAVkBoRN
 kU7GqMjOGPNL/oYo8ctru6f+kfOaX34=
X-Proofpoint-GUID: bFZ1gc21rOvxnjVKzOz-K4MRTUPChhTN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwOSBTYWx0ZWRfX0zhA+RbXNacS
 nIbu7eEyIKCZwWoWNtJCkZzLXNMR+zAAQSF91Rxlk15joCO0FX674i003tMKC3om8qxmb3lmLSv
 VNW35kuQTWuFsoWn3Qhl1dJ08W0tOtUbj1uP3d0X/QV23U5BeKMC44bxHDHyMmhMMTtO4AYuD57
 zwrxyldcuL2EyfSp171g5tpq81qPxKUZtI9MxDIjUi8OXqDyQNCHCwua1MP+9j0yZ46Yp2DY1ng
 LSg8yH6DGSNsCbUynQAb+PF4T16rMiZEJ7hBBjR0aI+r5qH+N+DwCMgC7vqo1f0yasrfEHYEOIq
 uSQu4oF/hIZQus+3QBK7lQkdDfhuGPd1onUlus4hbGDiiTQnghouaHwrbCBaLw2RG4Yj+UnUKKp
 UxpRUC1K8cQ00/LCPI4enlJk/zRK7Mei01jMjzwGTPBOMrFcXHxQ7lyyzWhw2U8KVRkIdZJ/Twp
 Rw5XKD65NsZpvMGX+rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_060510_384702_01F14CAC 
X-CRM114-Status: GOOD (  17.31  )
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



On 7/23/26 15:55, Swamil Jain wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
> DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
> and hook up its DPI output port to the SII9022 bridge input, and the
> bridge output to the HDMI connector.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 95 ++++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> index 84a0cfaaf196..2982a05f6082 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -44,6 +44,18 @@ usr: button-usr {
>   		};
>   	};
>   
> +	hdmi0: connector-hdmi {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&sii9022_out>;
> +			};
> +		};
> +	};
> +
>   	leds {
>   		compatible = "gpio-leds";
>   		pinctrl-names = "default";
> @@ -192,6 +204,38 @@ exp2: gpio@23 {
>   		bootph-all;
>   	};
>   
> +	sii9022: bridge-hdmi@3b {
> +		compatible = "sil,sii9022";
> +		reg = <0x3b>;
> +		interrupt-parent = <&exp1>;
> +		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
> +		#sound-dai-cells = <0>;
> +		sil,i2s-data-lanes = < 0 >;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dpi_pins_default>;
> +		bootph-all;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				sii9022_in: endpoint {
> +					remote-endpoint = <&dpi_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				sii9022_out: endpoint {
> +					remote-endpoint = <&hdmi_connector_in>;
> +				};
> +			};
> +		};
> +	};
>   };
>   
>   &i2c2 {
> @@ -221,6 +265,41 @@ usb_con_hs: endpoint {
>   };
>   
>   &pmx0 {
> +	dpi_pins_default: dpi-default-pins {
> +		pinctrl-single,pins = <
> +			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 1) /* (L20) GPMC0_CSn0.VOUT0_VSYNC */
> +			AM62LX_IOPAD(0x00dc, PIN_OUTPUT, 1) /* (N21) GPMC0_WPn.VOUT0_HSYNC */
> +			AM62LX_IOPAD(0x00e8, PIN_OUTPUT, 1) /* (L19) GPMC0_CSn1.VOUT0_PCLK */
> +			AM62LX_IOPAD(0x00e0, PIN_OUTPUT, 1) /* (M21) GPMC0_DIR.VOUT0_DE */
> +			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 1) /* (L22) GPMC0_AD0.VOUT0_DATA0 */
> +			AM62LX_IOPAD(0x007c, PIN_OUTPUT, 1) /* (L23) GPMC0_AD1.VOUT0_DATA1 */
> +			AM62LX_IOPAD(0x0080, PIN_OUTPUT, 1) /* (K22) GPMC0_AD2.VOUT0_DATA2 */
> +			AM62LX_IOPAD(0x0084, PIN_OUTPUT, 1) /* (J23) GPMC0_AD3.VOUT0_DATA3 */
> +			AM62LX_IOPAD(0x0088, PIN_OUTPUT, 1) /* (K23) GPMC0_AD4.VOUT0_DATA4 */
> +			AM62LX_IOPAD(0x008c, PIN_OUTPUT, 1) /* (H22) GPMC0_AD5.VOUT0_DATA5 */
> +			AM62LX_IOPAD(0x0090, PIN_OUTPUT, 1) /* (H23) GPMC0_AD6.VOUT0_DATA6 */
> +			AM62LX_IOPAD(0x0094, PIN_OUTPUT, 1) /* (J22) GPMC0_AD7.VOUT0_DATA7 */
> +			AM62LX_IOPAD(0x0098, PIN_OUTPUT, 1) /* (H19) GPMC0_AD8.VOUT0_DATA8 */
> +			AM62LX_IOPAD(0x009c, PIN_OUTPUT, 1) /* (H20) GPMC0_AD9.VOUT0_DATA9 */
> +			AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (H21) GPMC0_AD10.VOUT0_DATA10 */
> +			AM62LX_IOPAD(0x00a4, PIN_OUTPUT, 1) /* (H18) GPMC0_AD11.VOUT0_DATA11 */
> +			AM62LX_IOPAD(0x00a8, PIN_OUTPUT, 1) /* (G23) GPMC0_AD12.VOUT0_DATA12 */
> +			AM62LX_IOPAD(0x00ac, PIN_OUTPUT, 1) /* (G22) GPMC0_AD13.VOUT0_DATA13 */
> +			AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 1) /* (F22) GPMC0_AD14.VOUT0_DATA14 */
> +			AM62LX_IOPAD(0x00b4, PIN_OUTPUT, 1) /* (F23) GPMC0_AD15.VOUT0_DATA15 */
> +			AM62LX_IOPAD(0x00b8, PIN_OUTPUT, 1) /* (L21) GPMC0_CLK.VOUT0_DATA16 */
> +			AM62LX_IOPAD(0x00c0, PIN_OUTPUT, 1) /* (N19) GPMC0_ADVn_ALE.VOUT0_DATA17 */
> +			AM62LX_IOPAD(0x00c4, PIN_OUTPUT, 1) /* (N20) GPMC0_OEn_REn.VOUT0_DATA18 */
> +			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 1) /* (M19) GPMC0_WEn.VOUT0_DATA19 */
> +			AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 1) /* (P23) GPMC0_BE0n_CLE.VOUT0_DATA20 */
> +			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 1) /* (P22) GPMC0_BE1n.VOUT0_DATA21 */
> +			AM62LX_IOPAD(0x00d4, PIN_OUTPUT, 1) /* (N23) GPMC0_WAIT0.VOUT0_DATA22 */
> +			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 1) /* (N22) GPMC0_WAIT1.VOUT0_DATA23 */

> +			AM62LX_IOPAD(0x00ec, PIN_OUTPUT, 5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLKIN */

NACK. Will respin the patch, as "VOUT0_EXTPCLKIN" should be configured 
as PIN_INPUT.

Regards,
Swamil.

> +		>;
> +		bootph-all;
> +	};
> +
>   	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
>   		pinctrl-single,pins = <
>   			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
> @@ -321,6 +400,22 @@ AM62LX_IOPAD(0x0004, PIN_OUTPUT, 0) /* (AA23) WKUP_UART0_TXD */
>   	};
>   };
>   
> +&dss {
> +	status = "okay";
> +	bootph-all;
> +};
> +
> +&dss_ports {
> +	/* VP1: DPI Output */
> +	port@0 {
> +		reg = <0>;
> +
> +		dpi_out: endpoint {
> +			remote-endpoint = <&sii9022_in>;
> +		};
> +	};
> +};
> +
>   &sdhci0 {
>   	/* eMMC */
>   	pinctrl-names = "default";


