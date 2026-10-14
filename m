Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941E0CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0LIpQGwCgMAhL0xS3EOoffvzsgaw9HRmkaTqJmA9Mcs=; b=2zcbxSOohfJ5fEXkWp8koB+8gh
	3evAV+BjQ90tWx7aQMwgsSGLjgCEdqfKNJqGoa1vYTjJu48t5fDmRGpW7qFNrWAb37/xzMwA6Gvqr
	35/zg7YF59zQTO/iCWuPpuYzA6PLLX+zi/54lha6d6zR2GQWSik5RzVFCyLPi/lGdsdWD7GB4XyOx
	xYSY4FskumuH1UPDf8S4xCfTF8lODpqN48JqMx6QQRAV/I58+phJLUIQlFhEuHiQ4OP9THfBPqVJX
	LvlPbjtyJ8P60KxvG7+ef4CvuwbipnkR/sWoVwP19Les4TyPvqEG5Cr+ueW7Mha+9DXfHW5t7WoWY
	kHrzxnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyc4-0000000FWHq-3uA3;
	Wed, 14 Oct 2026 13:01:44 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyc1-0000000FWGo-0ZMQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:01:42 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69E98huk2391661;
	Wed, 14 Oct 2026 08:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=0LIpQGwCgMAhL
	0xS3EOoffvzsgaw9HRmkaTqJmA9Mcs=; b=DdZgFmWMe9XwpYoHOJe1/Ws+0uqFP
	9jJn3seH/Yb0+M7NxKUab4xDs4dN/1fUv/ltWKDkCza+6QZm0sSTooxeiTbkPw6m
	645JdrGUWBcpdn5AVG7tUQnP/abU+Qb2p2+UAOqMzqM4NcZx/x8satoSmf49zxT3
	LoY/vKEKZkcGqwWbbEdrW2sUOdO3OOJTUqmce1+WRQNzMTdAaikJFQSnFn67CFV7
	VZRTig7CVwAc6aKnj7tvACD4qnnhjWyfPbLwwT3wp5QKZOhsGjjD0g95q8dJ8uno
	JueVWFWZrRas4l229JHg+/8UJ/O8lXIN2eYz1alnlIs1m6mjOrRjsUtpA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ha6uj92jj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 08:00:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsGBnLZf3Nw1Eprl6pj9pUg4u7HvkmeKJyX1N7e4qU+fugaqcO2IY26Q65Ti2TfVVlVVNC71vIK4YSqM379IHxSvPh5PMZI+mnkYky0uLkLXPdul+MR5EkPw7orBmNNZzidGYhfn7CkaQX0EZ3w02ZQxRbzQ9x0R4VxHsMsABrZfhK259OMSFh5bHjkWNxJP0+IIH6Xa64OQVCWTdb0+V+QokcbPc/oPsb8hZiUkKghJcG/NER6SjmsseM02kGNATucr11AyyTiL7/wdoxupNCgm48X7HpuxoV4ZRYJPsp3IPpMbHJZjHmGeLz/P8U58rkwxr2VTpdpa43n6unzZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LIpQGwCgMAhL0xS3EOoffvzsgaw9HRmkaTqJmA9Mcs=;
 b=YLt2EKdvOV/V2nhFeZbuvmVqYLWpADEqj2T6eMeJs1wVO6EYYhXm7Xfa1Yh5FlOG/AHPPGh1rGIb9OWWpp5GERAxrunU5NgfP/DaNNtHYedWbKKK6SsI9+zxKZ4WWTn4hXi0UL86fbvTdutPmCY0dT2C0db3CxNfcN+2hUiW67DGLos9fqj7Z4ufXD+SuniNp2VtKQQKFWW8/2cV3ck2UF9bTFR8/6akTUAGl3X1bH+ffBmQ44LRdrgHymYgiAds7jv8fFhki3dR/P1SDW9XGp3fB8eh5YRowxL1LFGG00GZSUJzlywyG8PMKaRvEWRTnQWIGmiVAU1nMmcJQAghEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LIpQGwCgMAhL0xS3EOoffvzsgaw9HRmkaTqJmA9Mcs=;
 b=K7gF/Cqlgyj6m9XRRVAnQQWhem9wWXydIj0Ek1/v/4xkQ1AvgDFyCF47N3LGPMRfO2HwaOlYBLpe30EwVYB7+CJyA/YI8xFByvaN156ufqKc5rAvugec1McslFzjVVcfMkVzteo9Nhqd+vjKikEVe3Vy6VKjXnEYfX5AHvoRfbs=
Received: from MN0P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::11)
 by SJ0PR10MB4574.namprd10.prod.outlook.com (2603:10b6:a03:2dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.26; Wed, 14 Oct
 2026 13:00:22 +0000
Received: from IA0PEPF00000042.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::9f) by MN0P220CA0021.outlook.office365.com
 (2603:10b6:208:52e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 13:00:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 IA0PEPF00000042.mail.protection.outlook.com (10.167.249.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 13:00:19 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 07:59:51 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 07:59:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 14 Oct 2026 07:59:50 -0500
Received: from localhost (akira.dhcp.ti.com [10.24.72.253])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69ECxnqc1395131;
	Wed, 14 Oct 2026 07:59:50 -0500
From: Rishi Kumar <r-kumar12@ti.com>
To: <netdev@vger.kernel.org>
CC: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jacob Keller
	<jacob.e.keller@intel.com>,
        Meghana Malladi <m-malladi@ti.com>,
        "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>,
        Kevin Hao <haokexin@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <j-rameshbabu@ti.com>,
        <aaron.richard@ti.com>, <l-chinnannavar@ti.com>,
        <m-santhoshkadavan@ti.com>, <k-tiwari1@ti.com>, <a-dev@ti.com>,
        <r-kumar12@ti.com>, <pratheesh@ti.com>
Subject: [PATCH net 0/2] net: ti: icssg-prueth: fix port config and rx_mode drops
Date: Wed, 14 Oct 2026 18:29:46 +0530
Message-ID: <20261014125948.230571-1-r-kumar12@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000042:EE_|SJ0PR10MB4574:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3e23fc-c255-465b-9f7e-08df29f319da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|56012099006|261009223027099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: n/iHWkFEZBOPB05NXtsaGq+MwtSyaqLQb5rxnur6BMubkUmpV4RwSR66DAbeD31de2emW50M0AUNjF0g0wrYEnU3mG9PRyAEDjJaOI2j7sSzY5gU9+KwsN8gPFoKOfBrldqVPBi07gj5jl8c6GA79O5YOxB97aw8P5LATXrXBjeYvYihLo3Dyz3Y/ebyBnpaD8lpuBQfBXESm7EmLy+OIv9z7fT8SNotVs+HxOv/fww0H115gWZSNlHhxORitJ6piwKXzBlOZ/ZBSAS/Py2HNgnIPIBS753Dib61Uv1x87Js4oTWuXCmCowsRjBpjd9TLSmQP35t4J3upAd2kYUJRKKDYca06CWCijPCC+KKWuamchEvz3EsiYAaqt98Z8CC7LakDqqNI6m5YXAx7OmyW3TmoogbcQa+58TJ2YXYnnEFlZ4UydLC/mNchRH4d8XbqCCs2SNSbFnZQcG7QH7RTmFvKkc8YfzChalQrvKn3IXv1slnt89yr5mDcxrPBucIElxSg9rXs25B427BXqleuxwfMZX5749QGSMGmvBJP4Ua8DErTxte17TzvGacokiNjb3BpHrSlgPRCNXsi5eQ2xCfxC368Es+iEJEae5uBzmWL5gu5zfHkKBWlST22dC4AlFYFNh8/drNV+diSRFsZ6enw8saRK9jumLsKx6tmIA9kRLNcnsFguE4tnNFQUS+hOG5UOfBl6WBQLqM5GlMXw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(261009223027099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4PK5COij3qe1aFg4qvsDHGxLoCAb2M0gynq6NBlbcbb+ibUn8NenSl7iY4FE6rtb6UeQ34UF1mDYsMx+BuoSitOZO5p4L6sTY2/7Hzw1Niyd0xJQwFIm3r+yb7K0S/GvxhJ8KN/9KH+3Dfuy0afQFpFLIVTudvvhoa4kSSErfGfQqeMU1yazFEz+z/mhrzfr3cPA+nUZtm5gkodFoWN3bPRHoIagb6duaUmvMyBGh4W5PZdQybGLQw1bsnUTcVUh+ldc4kVwXMhhXGTX/pd6gjfilk550FHwvEV/H+73MZBpuPWBBgtdGvik+s2Kc9xLa88Ww7gUeA82ZOmeKsfk1j1ixbqm8MnCsusH0H+Evvgu0mhaJDMw1FD5bZWOHuLRJmeEC0ocR/GWP+FZZHm2VFhroSYJyozkdSl50SKUg9is21wzcqA/hoUV5JESZmpz
X-Exchange-RoutingPolicyChecked: INA1dUSHffTLG1FQkQyUHRaVCD9SyyOYqvYkActQkEPsC3EsExv31GpDP01jYmPzHJ3UlgD8B2duAHMJ70ZwKZz81qWYL3pBP2B77o62YxDYWjfsuR4oHhWTYN6VL5AKVNORA4sns8J7Si+gHljnwxsDHGRx9s07WSWF6+4BPxJeopVMDIdlX1MpO52grd/X2UEWP7pRJ9rQ0HN7Y3Hpo0hfp6IOxpn7SrCJfq+KLttjZI/lbDPBgoik5alwkBpU7G3sEWhyElAoqtTil+VX5qV2OMVBOP0iO3DqYCiO8m0GfZraH5/gDqPeJuemFIwzAQ/2RsXpe/fyGfuQZjYrww==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:00:19.5372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3e23fc-c255-465b-9f7e-08df29f319da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000042.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4574
X-Proofpoint-ORIG-GUID: LxaskLRJxs8Piz4hpX_dB4hTDU_YIKlA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX9gOpUvvBX8Pt
 QcCJOwpGyIDVDAfHjC2VuoOP2cU6Y9K9WbSWsuJA9JxyqaQuyf2np3txwHXyL153K8cVsVtqmVY
 rA8flwqDkAd3txzvkv8q4yvlTYo7AKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX6HDLDt3wJY1L
 ONzdDkD5g4kBeEqFScKr7ZGX8mwXvS9pAs+Mm7I896da4eBIZRbRuItbgU9Tv5Wa8oVHUQ5xiu6
 96+fuphYPC6zhuBN31+tEFooyCi54QU0iBQkQL2wmID86dGTEqpzpM1vQZ0cZC0CXCTdkmG8ZAy
 05X/jG5lMZXpcfrzjmdtQzw+zFInqvIbAxLCAwXgsn8wLgmK6OcCnDkGmZlckEN9mRFS1jM6SqA
 9alPbEY+uTkXhY9p3I/sh/hXXHnvWaeRB2jEgjFbCv4bHVi247zTw25ZyeaQ5ezIRtehCHBTwZ9
 V627RDzyO3kDTub2tmq4pjgbSdqpWAOPyJfOmXCRr1rKrVnCtfO20CADU6Lb0waIRiBDjUU0k6K
 XhDLCfAk9ZHYhPvIhAE7ktfT/Vi1+JeZBPgiQd5X4jpsBVE/eZT1bbqoYxISBFdAgMNqq0t7byh
 C3n/F6MNILVsMLXlw6w==
X-Authority-Analysis: v=2.4 cv=U/cHnuru c=1 sm=1 tr=0 ts=6acf7cec cx=c_pps
 a=klJJBKWT8dzIbr5yswcz1A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=BfKdQRLeMNHqh7fS9LAA:9
X-Proofpoint-GUID: LxaskLRJxs8Piz4hpX_dB4hTDU_YIKlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_060141_182703_CE3B0098 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

Two independent fixes for the ICSSG PRUETH driver, both hit during
switch offload testing with ports opened/closed in varying order.


Patch 1 fixes icssg_enable_fw_offload() running only once, on the
first port to open (gated by !emacs_initialized), so a sibling port
that opens later never gets its FDB/VLAN table/PVID configured. Each
port now configures itself at open time.

Patch 2 fixes icssg_set_port_state() commands (e.g. promisc/allmulti
flood enable from rx_mode_work) being silently dropped when they race
a PRU/RTU/txPRU firmware reboot, by re-queuing rx_mode_work for all
running ports once the firmware is confirmed back up.

Rishi Kumar (2):
  net: ti: icssg-prueth: fix missing port config on second interface
    open
  net: ti: icssg-prueth: re-apply rx_mode state after firmware reboot

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 89 ++++++++++++++------
 1 file changed, 61 insertions(+), 28 deletions(-)

-- 
2.53.0


