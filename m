Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA211C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HISU6svtypWsc5tSic9ITyRWSdsaMkBnwIDBk3RQ5SA=; b=tsQUlV8+ckFrydyZEEDGmeD421
	aCXZoyHyhfz96bKGHJ7izwEMyhFxUK8oyG3AUWZ/CQ/+qoaxJUo8bHCsh3z0cVS8It806fezbLb4U
	V3LYv6LyFDdDUT/RwvdiC3sa/8uZt6RxZjiYbMaOisiG4cJogrdKFeos5pG/uJ1PoA0/S6JbqJ7bE
	FOdEUD1P5V5Vn/vw7AKvs268vWy0Oxx38TZyWXRTM0HTJEkS6zILZqGk1ItcDdfhf449uWWGg/TvS
	rHZBAubUk5hdLbfOw0Mkwlg4tOWFGCWDTyqX7a17IGwIZD7k2LtBXnl5NzqhxtGdy8g0g8ceWCZWQ
	ljcNkKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiRX-00000007h7v-3r1h;
	Fri, 03 Jul 2026 18:16:51 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiRV-00000007h7P-1oQD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 18:16:51 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hjvop1673272;
	Fri, 3 Jul 2026 13:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HISU6svtypWsc5tSic9ITyRWSdsaMkBnwIDBk3RQ5
	SA=; b=XJVBRN3Ut8BccPot38m54iTTZwqxs1Ls6ndbi8XYKbW1KN31Ct9TfO5v/
	rHnKXc/h+x8Pzu+zH9/FBOxQDD9flsrP0x1hIgBmgumRQkiZIpoLDXM/efedSUnA
	YWsMXWOy4stg3n3HHh1zbaK1owiDJnjE+xxF2SUYxOoZjsYnpwRJ6JL51W/BSHKt
	jJLsBmT0rn3Jyp+sgg4d+6yw9aGMNm2BGQLmOHEayn6vLN0lKAkw55VFByVvcoqG
	7jpfJdrykUXpByd64NGifXfvce67oY9CrbxUpgqyU6d+kk0lMZqkQnyYUNTVXaTN
	FOJRGJENrv3Tc1E9bNKKE/XqxwDIQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f69fwtkwr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 13:16:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzpDac5aE7WWhvn8HIdjeVJpxVGatqoohvG+8TJlkQPcJmachhDT0/yBC3BOF1TLJnWTY/AFkw49aOO9VAdvuwWd8VKuUcoKBcSmb69VYYyvm/QxvKe66CfC9MOF6T6PkSfAsOSNdN9U/DdNAMeddsukoV1B/sUxXGMB2PjczdfqHiso4Cwxa4aV0FxNN3ZigemXcgK6Y7cm1FR8hbJCSsYzmtakWYO6fiSRCS00tOliiOMV0CprmDWLt1VMT+PtNFitV4Sk3peH+/KFw9w7VstIe/7D2DfaqQkMou6UZ07WDm7Xv1wAU1VMk/HBvFwQtWjmdh6gV/yLpsXffXAzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HISU6svtypWsc5tSic9ITyRWSdsaMkBnwIDBk3RQ5SA=;
 b=D6DO+Zg7a7akPj1JmdJa2kQ3Ut61c4X8pehHDRLfggfw27d6oy4S3xI6RfY0k4Zxt1BngWSe4iWs7xSxlrUuJyzcUTM2fy6xZU1IK6Rn/9uHNe+1utvxJBcoYP2SHuxBuQn1H7M+Ywux1thAGh4iQtW4/LptRGoEHjYKbA6r9yBLqMbbmVBY956oEORDjZScFSTTNw4+k0xr2SZCEwP4X4H19Wi5p9/GYWW6HH38ktbvMm/KysO3hummjOGdkY9vVrNppEBJ9tZvtdfYGy4f9oYHxETQCIwdEYh0/5O+RuzJhyT5lYYyGidNGZ6f0Nq2r5qQS/rWsjyQcp/URomLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HISU6svtypWsc5tSic9ITyRWSdsaMkBnwIDBk3RQ5SA=;
 b=QQ7t0qckgLkbPIEZXbViusnkkK62YEzhtWqZpiZ+Wp/7EkvSa4y4mM9DRPelP/pL5p8WTwWmYRm3Suc2Pt6uV0tr8pLmG6F/AqmANxlmv3uuB5fWEspNNFLSanv4C4q2OstIDbs+OfO37a1Twc+gvORGzvU5FLFvLVenDTCGNsE=
Received: from MN2PR18CA0004.namprd18.prod.outlook.com (2603:10b6:208:23c::9)
 by BN0PR10MB5015.namprd10.prod.outlook.com (2603:10b6:408:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 18:16:41 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::89) by MN2PR18CA0004.outlook.office365.com
 (2603:10b6:208:23c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 18:16:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 18:16:41 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 3 Jul
 2026 13:16:41 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 3 Jul
 2026 13:16:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 3 Jul 2026 13:16:41 -0500
Received: from [10.24.52.241] (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 663IGahg2779493;
	Fri, 3 Jul 2026 13:16:37 -0500
Message-ID: <024b1d16-12a8-4d8a-9bc1-5061291a12f0@ti.com>
Date: Fri, 3 Jul 2026 23:46:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: Rename DM firmware reserved memory nodes
To: Markus Schneider-Pargmann <msp@baylibre.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <praneeth@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <v-singh1@ti.com>, <bb@ti.com>,
        <u-kumar1@ti.com>, <anshuld@ti.com>
References: <20260630150919.457160-1-p-bhagat@ti.com>
 <DJN8XK5EIKU1.3FAVGBD6W2L2B@baylibre.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <DJN8XK5EIKU1.3FAVGBD6W2L2B@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|BN0PR10MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1b4e27-8eba-4681-b91f-08ded92f3b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|56012099006|4143699003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: c87ncS7dTh1QIqPn0wkL/srRBRLKonSs9XHQNUMU8uzGQXckNQYwJbc6/NrazCVU2fyM3VuAfhbBauK8xpdReuoR9HnNCb+g2SuJew/QfvgvfAo2fKqtSDWWlW4DxtZEWYsjTb4yBqxGhSRwRskOL7f3unhs82shWvillQlMHR3MsfMY7kXOWV1cc5/5sIA8RD1ufgnk5gozCSAO0uhOsCnDTSVZaRFaxDxEqAlwMBwU8L3f7ppaV/hj0H+n7EWsWVdrTP8OAfLBJdqIR48zhTc0J+UhYLMcfhwGcGQLjHeGKkga0lV0WRN8k5YDQQWGw/nnFTaytTjpFkUB5vO/rTEbMxlrogMylV8kSW9nKbY/k13VDogDIp1eglmRhugXINbvXboQfZy7ZYRh6OWr7KtDsSU+8CvtHUr2dGpjisoOoLir5yK1U1GULWwJbbwEeCOQ104lN9N4lVbDSaPoc+fIKuiAFDDmY/buKmEOnoTz2M5TY85G+WF6EpODD2yJaucPjfFNFKNsctc4bUGxVHSE2FPrd3l3TD0LdGRAQWDkfAbD9c0r/x57fHGaXSiscxKPB3Zrs+7CGQYVkSBOf7HS/MC+VjCF4ZchgT/vyixLvqYSOKkgq76nZiuQYQUPTnKY57OtZSsN3LaGdQs/bzBvVmifwCROrkW1Tt/7JZ4tHUesz3ZBWH0B6Igk6NfWopKo+Tqr2LCYvzDH0CuoKg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(56012099006)(4143699003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bNlltjKMxY2Kjnq85zBEF6lai31Ckenik/dYdxP6FSNJ59PsfiGRD3/CZkObTQOmcoI6hJpC44Hsw/y3yZpcqh8JEWTnY+7AnqJoGM031JQR6+4ylRR5VdiLBsHlpt03fnz9WlhkqngXmUkFMHinZywRmvBozVx2Ixar5fW2vNnCCvgBRS1jgBnMoHHiNhND9Hvyu7yTthgU21BEkZxKFIbUTetuMJr1WXyYYDDVcdIqUhLYF+iAGajqjzn2OiIw5P2QWo4KGeXIdo5lYOR1dlm5Fp+EhqTQFq0NCdxSmEin+lD765iut/5jnFYypfm8IOee/W2VXZDo2X41SqWpXdicACl6PnsrX0DfhrOMkp5scFsncfcm5C55Nj9t5GhnwtWtfrjfHPhHo6DFmQe4l3795g8zx0qN35YjOzI6njg0xumcl6rlB69jq0k5o3Qy
X-Exchange-RoutingPolicyChecked: e/jnJaLVB/2R7Oqk5TUrrgw+iW4ygtB7Z/abodpnvEPOFhAHPUiTw4Fqre8TCWnHbAEpMsuxovejGg8Eiy7MYmS9omhQlQxSIyYFZC9LArLZCkXBU+NuBd6TVKyqgR/olfajaihixzX8xH1Ic7RWTt4P6hUg0hMBRf5Tt5dQDuB021UbdOaWK7wCoyFfgSqM1LzpJnCMkKd5LmK32j+48PFNfunqPojg5XdkRMJtk6imLVjEgAVKm9Jz+lcnzTEOEPpaIvzt27an7qOcamWCmaj9/dXY8cPFEd12LdmRUkNaqZ4HIua5iUEB+UzkS6p4L7jh46gz1rbhI3ykEh7LNQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 18:16:41.7801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1b4e27-8eba-4681-b91f-08ded92f3b8c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5015
X-Authority-Analysis: v=2.4 cv=ZNbnX37b c=1 sm=1 tr=0 ts=6a47fc8d cx=c_pps
 a=5+LGht9gDMVyy/gYI/Qwww==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=IpJZQVW2AAAA:8 a=AOInmPtmV_HLWMnQ-A4A:9 a=QEXdDO2ut3YA:10
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: iHE6anYyhUWzBX9qweoyQ5X-lxSObQzi
X-Proofpoint-ORIG-GUID: iHE6anYyhUWzBX9qweoyQ5X-lxSObQzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MyBTYWx0ZWRfX34Vs+8vVx+ha
 iLr8iGDwV9zFcNTZccT2T1JPbODiugxJaYcApnfins+KqRHOirdwG3Ohxm1WVm8w2EkDN2GOD7o
 z3oIlSqba5oos77D6+hWxkQjb/b1Og82YuzHeEq7B/3lPxtXc03CHx9/J/bgLFpNn9ZW4A8yawR
 F6qsLP7MVxkGBkYSj3Vw7RommIhskLya/0SLUQEBy1xlBm7IAbHLUSGOwJsnoi3RCBSscNW3M8P
 pTW7swnooFucTjb9E3sVXwXCBg5mQ64/4C/icYK38F8cM5bEkWv6SiUVkTFdiF/uSPnGnIEYrsP
 pME5ybE0mf19kE2G+1PapzqCtOda80+WN6VLTieYlP1Stj1b3Cl1Ewd9XbtPAAo22FeocKO+ibj
 JTWkaCi+wdnyS0NO3pqRPLYVQLZR2jlN2On5PYkN/myyQhvPg75gVqrU2oTh8DABfhtKriOCYmO
 A4+u+zg57cwREy6k3VA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MyBTYWx0ZWRfX0/yrXR1FXKIY
 BDELCg12WYJmYbDgm1YjxRkONvNjiq1rn9RFVfAsE+X9+hgq4KCMDY3pvMgHvN+qWd0FmyiCneD
 XUQIJEk2yv4Wzali7rtn/YcpCIaoTB4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111649_725428_3F950517 
X-CRM114-Status: GOOD (  15.12  )
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

Hi Markus,


On 01/07/26 18:20, Markus Schneider-Pargmann wrote:
> Hi Paresh,
>
> On Tue Jun 30, 2026 at 5:09 PM CEST, Paresh Bhagat wrote:
>> Rename DM reserved memory nodes for K3 devices.
>>
>> Example:
>> memory@xxxxxxxx -> to dm@xxxxxxxx
>>
>> This allows U-Boot to identify and resize these regions using
>> fdt_fixup_reserved_memory() as done for TFA and optee.
> How will this work for the updated detailed layout bindings that got
> merged here:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=91ddd97e1bb26937a5c15fb51ec8f6b65dbe94b8


Thanks for pointing me to the binding update. Should have checked it 
earlier.


>
> This splits up your one memory region into several memory regions. Here
> is one patch that uses that new memory region:
>
>    https://lore.kernel.org/all/20260701-topic-am62a-ioddr-dt-v6-19-v7-9-e9db8b16821a@baylibre.com/
>
> This basically breaks up the one memory region into several regions.
> Wouldn't this break the fdt_fixup_reserved_memory() that you are trying
> to merge into u-boot and make this patch unnecessary?


Given that you are consolidating the memory regions and implementing the 
new layout, I will wait for your series to be merged first.


>
> Best
> Markus

