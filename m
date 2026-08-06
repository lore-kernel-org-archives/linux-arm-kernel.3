Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82375C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/DrqoPGnJTTEluAS6UhmVq4abVipRw7Pp70OwnA/jg=; b=LyvURa9qIMSvSmQFw22100nCV6
	uOM8rwYcRb4dLTuXK7VKtmBWVfVBZgZ0olNLJnEIS0iyGabD3RwgwmHeM3aPTNXL0mDw0i8f856RR
	7Mok7qhC6ayr4zsOrzvnZSfUPxnTFbwylrX2OdIZrFP+AQ4xvLkHxpOK27shTqgBWnrlwOSLddt3U
	+19U4RJFiygpc+4Wa4qw7Q3POqTHUSoehiUblkAzDzJlx81tjkuhONXLqf3g73nEO/0gyfmep0vZk
	SQMIrZ1gxvsLSM5y5tfMwCO3S6ObOnKsPdOrCmfVcXqzjqAKqLXuzfNKdyr7LO2S0a/9xXJy0VHRG
	LzRad6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0JM-000000068QE-3gAV;
	Thu, 06 Aug 2026 15:47:12 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0JJ-000000068Ps-0kDT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 15:47:11 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676EoYLL529871;
	Thu, 6 Aug 2026 10:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=y/DrqoPGnJTTEluAS6UhmVq4abVipRw7Pp70OwnA/
	jg=; b=M8aBmaPU5zMkrc4Mn//BhwFH5KBtOJTzVXUowrkNlFJnM4vOW8QdxqGCh
	EZIFb6WKgCrZNsjmd2VGOy0fjyu+nh9/Z1ys4FXvATMNEy4RsRDZHpF+U5SP0Wkf
	cKd+eXFuPTkXGwHcAsIgub8X2zkGg9hzU6lfO5XnhIjBze0XbVROcbDqWHMiBGku
	6FJW82Jih5C7+sDq5cFekru1vDwnA+GN6PpPXLeMqmwcN47jHxMtDbzCR7APiY3y
	lJrECbRCfSJnRelhp3AT5H48kh0JZgTw+Gol7c4aDDALq7kUlboP3LkWtdpF3wwy
	/kwljtkDiB+PALqA50o+7rNsnrmow==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvsrf1xmm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 10:47:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOXodDezJIYFBSeohBhWFsfLVP04yUDbWJhUc41uepPuJy3oAyHoaTmtSZQLVqsslkXB+5KqbYeZSNhxhzfdYNvQ14gsquQOh1jChyIuyPyDaHzjjzFloD+xB89sDi0MlzByimK5UzHqnaZGXuiavMM4x5FLRyUp74NDINj296GXfXjHSY4U1Wy+uzaAXdSnSYINSA6yIsEepmMTCWn1o6+lv5EVABlbbtzC21hbuioSBk60WPt9B3vQI9HY21+XfxKVFSLU4FqCxdSyThUKpmXoc4wgsB2wq5erehJ4PDnKF9zgbiZyVBDDqvDgjMemqv+vt3mxaKlwWD+6HBgd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/DrqoPGnJTTEluAS6UhmVq4abVipRw7Pp70OwnA/jg=;
 b=RtAt5/+rRK3oZFUGdKZbsQ34p41pmad+Uh7EgP1p8rwPMiTs9j/9qsZkWfHEZR1/s2EisNlhxDdYlgebWyjhrvofgAGRmPPdheHnN9NGqu7TLj6l3I3frguc1veECZnL1NbqhRVOZcL6eCydSAdMPYoQbl4/oRN/bPtWXt2Ji1+iGyqMpFpGZrYDr5WUVne4ybsKUshT1EDPWnXfcjsLZ22Unkjzl2jLuhaFonkyNqOPLw8SlwIPYrxZwS5CelD6iAkrv0dWnvFNM9d47kjTgejoizZnXGI4qBA46Nt7Nm5FK7nyyrGDmUB2oPGOB7Lz4Qm+3ZyUBUQrE+8fEIc0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/DrqoPGnJTTEluAS6UhmVq4abVipRw7Pp70OwnA/jg=;
 b=ATvJUJQ0PhZIzTDnINkHMvVZszCMjnBQju2tHgh0ekJuWATQefKiQZt7YB57f9LQN4WXxgdUDrugrNnRAz82MUg3aePqZ84Jek48uDre0pYNLU/FIDt0OpkKAueHs2nNHfmVt5Cz3PUaPpP7OngP/fcypyHZA92juSjIRhPlel8=
Received: from MN2PR18CA0030.namprd18.prod.outlook.com (2603:10b6:208:23c::35)
 by SA1PR10MB997736.namprd10.prod.outlook.com (2603:10b6:806:4bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 15:47:01 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:23c:cafe::5) by MN2PR18CA0030.outlook.office365.com
 (2603:10b6:208:23c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 15:47:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 15:46:59 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 10:46:24 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 10:46:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 10:46:23 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676FkKtX3579364;
	Thu, 6 Aug 2026 10:46:21 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: (subset) [PATCH v3 1/2] arm64: dts: ti: Correct white-space style
Date: Thu, 6 Aug 2026 21:16:14 +0530
Message-ID: <178603111912.1343475.8851690576034393360.b4-ty@b4>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260806070245.40219-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260806070245.40219-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SA1PR10MB997736:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e9fe43-c042-4bcb-06a6-08def3d1f400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|13003099007|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zvw84qZwdSyMmIubzjo1YIXx9jKZGt6AkWP3sHb7ehB0MKWxzEiE5L07wUDxjU4uod192bOJWqVIi+p5MM4n+66Lbvj362b5ETAHR/N1/d/QetScnsLwZVjlpR8MJZ/IEnvWlaMFYJqo+YBLUe7hqhfAtrbBLct0WjBtOzlJB1U4SFgn8xXb4gYL7HIFbrgLkMb8JGnWEsf6u8FEx9+dfEXxk963vsmXbsp0Kn771Gd6S5nCCUzzHMhRiQw88Edm/AgDQzn/hYKXB2R3MvsS1Ebd1/1AKtcPpzrRLsWb3sOTlw9auufZhDtlQNU9Hn75ka/5lbpPoXK4EZGyTT/qKOpO82/41NN1czCKlP7QtdV2ROMw/H8nlzKUQ4ThqvSXfxKECJJNtZLlNjUC7z4MT1iQkC/d/TcWZxb0fTCjke2F0ZwhrN1eSVmQPYbYhENWNxjITtxy3VmVsGv2St05N25Ae4dFdNnpOYT4e8COo4GShyObvqXXxNpw4DYydP850P7D5B5ybpwnb2rBh2XgyKP5BQSWF2oGHbzhKI5qrASoHJl5mlBx4Thn2yrHIlaZ9b8ovULlyXOehbTfwHR4dOZ3x2YyaC2iZguTRhm04r674GbChYmTBXrD/DQSqrm1QCAKojzkE4hRaq4KSiEQMCdQKhLm+NG5KOV6mBr0SA7oMSsB5P3k7S6ebF3T8Q3+kpUbxeRZQM90j/pCCT0fH/PSrZwF9xEH3cdFrny2mN/2qNizNlx1Cj8g40C16sbX
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(13003099007)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9smJ/Ys136pr71fyJ58wiojY7sgVEWH2WDyJojQ5PxTy4YQchThSoIqqIbxJHPII/CZ3oBfYdlVS3AlCWicifWEI3bZSXYyqoRWZyRK8+ED0to3opcs4XCo8IJYNGEz1qvfmnDxAwgXAVw1ADOGVxZhB4O6sxP6H5ZF6r0C6K/ugjo725ZJ7vWegqkco3BInHOs0CIzxBNxuKZ0yjP2pgvInf0Srqtv6b7Y5bw3TPJl2+YGGNAO+xaJVilIN9UuUirBLiTX3NK9LC2DsTEHNQkvnc4Ayg9TXqY2FB0g9knnq/3tAlAk9Sx1ZzpiOQ/LJVQO69MsFVDW3WOJEsftWli0biTvEZL2rnCFkJPovunJA1ORbjoAg1xJnsFxmGb1RUkOCL9+cw/tBqn136ZrCoUsNQA3tvYVfHpCwne3K0g+tUASwWkOs/ZCTednUuc6t
X-Exchange-RoutingPolicyChecked: UssMs3U+fU20R95dt7O72FwJilYPxw/8LwdaWFB9GLSx808oSiRpiX5SJ95L2dFD4Bmvg0QY8JHm0sUaEnnRy6JyS8XnoH0GaEggN1slGpddGEtn0rtQGdM6jzvUh6piOKVMeMWXaYLAaqA3yqkit3cSxZeYo819U/Eiwq7YxZUfRXEKSIQuXxFYc+o+UL2hmNjiDJUrw6UgwbBANRKCn3FrSY1dgQMth4zDUw8gWFWWwo5K0XFt3kAtRLOQmMQlCwx5pQTvHNMcovVdtIgss2rtm+6ptifdLcse/K42QJDr4RE+OWx1RsAVSvIzK6UVNwCni1w+nfGR0zD9rMhZdQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 15:46:59.9387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e9fe43-c042-4bcb-06a6-08def3d1f400
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997736
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyMiBTYWx0ZWRfX2OMpmyvFNm3d
 pLf2iLBVIzol3b6UrX82FiTZscLf5VHpCGXA7nj0nNlSFq3pQKszwGIQS5Pyauuj36g25jzcoFb
 BDgZEYSgUpByPbgnRSVNdkm53TFyt3RG/dTsn2Rbue9FIidAWwK0j/LqkCgubntAMU8+OPZIZHF
 YsJhhLuXeqmt4O47ZHTSjMWB8Y+ScsQU8k3E4A7go1kzwXR4R3JSaefo1hVUiZmD+pvCFb9qAxn
 br6IxDXSIVtU2Rwa7IGqfVttSLHkEowGwjOO1yxGvcT3LXW5899dkOJshH+nBxXm15JiSbHW/TS
 AyiKqWvMPRG/lgWLXQOjdt69JwGeiX8Z3Sv+RdQStR+9+0HDxYag9a7TfUd7qRK8bFR87z3PWSt
 AnTmVwW9lPUoVmEXERy8+G3oM9plpsdRmHr0uWuSEnJrj/0piD3CCS64mj4MlVwr8Ig3DV+H/B9
 ucA+HhBA6O0Y4lreHTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyMiBTYWx0ZWRfX/5KKzjAig7fD
 HvTDMPPzL8VH39W5gF4aTLwznXNW7ZcC6ch+oeQ6/omQYm4bSMPlTg+jloMiT3moQJE6OYx7GaN
 jXb7oMgkUs0+y6Dcj2HxYQiVVi+O4Bk=
X-Proofpoint-GUID: YjHdSJXCjdUVFtcFgVPA14gyPEezbI0S
X-Proofpoint-ORIG-GUID: YjHdSJXCjdUVFtcFgVPA14gyPEezbI0S
X-Authority-Analysis: v=2.4 cv=C+rZDwP+ c=1 sm=1 tr=0 ts=6a74ac78 cx=c_pps
 a=9fgoEbmtC9fw8tSBsklw+g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_084709_509324_0DB1F8F4 
X-CRM114-Status: GOOD (  12.20  )
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

Hi Krzysztof Kozlowski,

On Thu, 06 Aug 2026 09:02:46 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

I have applied the following to branch ti-next on [1].
Thank you!

[1/2] arm64: dts: ti: Correct white-space style
      commit: c8c3575e3952c85cfd47f6b8080de6f4edc1462d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


