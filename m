Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9RaBG58qKf31XXkIaTktGil1kvZpLK5zcp7dPCIBEc=; b=m/YXGqtBd2WfhlncZ6Next+Fjp
	Chl9+6ezsQYnuEO4N9AC6bje8tMzEKB+MhDelSRHwYC1aY05FsRRoebsixZ2pP6XtXKMrlK3e5zEh
	hGEQJsa1PiJgUb0Do+BfHDALCUICRX7lUoCLNsnzV05tLRxIIHAL675po33mhpNVmCNMpdbWwCf5c
	w1qQoDlGlNTTVpEVoQP0ZwXz8kjj7LVO3fysPMTQvxTTOINF+3AtCH4XsrCMCaEG0jcoWlggFZsl7
	RcIyOsMnifWX6++JeOYg7a3QgAsVwSTc1JsNacnT3QwDwJC4DmLxpDQOeIzEafQfueBIZ++aMvLAm
	/Ym6fY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWIT-0000000B0E5-3Gqn;
	Tue, 14 Jul 2026 06:07:13 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWIQ-0000000B0DQ-3ZsA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:07:13 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66E38Eea1117263;
	Tue, 14 Jul 2026 01:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=E9RaBG58qKf31XXkIaTktGil1kvZpLK5zcp7dPCIB
	Ec=; b=RVYHVKFO5lzWCI1fkj6SewYB8fDe45ZORpQYARrTt7igrMJrfFRVSnPxJ
	GxJ8w8KX7+ZKlzqpM/IGylLJwAITmJ72BZCDgHaALAG3m80s94QhOLAkdqkqaY8D
	b6CEOLM87gBCbnoj+vFFaM1BOTyA9/MegaFTScAxdefGzcwQkOcrdB+OfddEZMqw
	qh3dycLw+yKQ4qKJgPJinRJg1da0Tg3UxpFfsCOQoQcWPooL7PpSyAXqh2M6i90o
	CErSpXd9oNvXPeQAnsYkTpkJNdoczBiOHYUsOEQ7CCUkj7IoO8ii51d9N0/zBuor
	LdtBPVrYptYyetzmnfcZfdAKE+ZSg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013027.outbound.protection.outlook.com [40.93.196.27])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fdcw58q5e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 01:07:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjRrRGmTOUeFYDlaESTt+uytiy5/YhPfcy6fgc+BGHGCM2O/IGCDYFB8ml9ZAJkSig76le21+EhACdHOuYArX6fU9RlNCtvOQOln1GZ5G6hDvg+qKtUOFHcea/gu3NA7v3zKZJJ8Vx9g+ucFiJU9upV+98d0ViTRGVUs5SRRuV0+seOqbyr4fJ+4ZHeDLqXLeM7ETC7vE3iG+91w0fnUZLDzqBOlyEARkcfAV/fW0JSdxaqT9i2BV9qCmzW8/vEUDUit6NZY0W3p/YDUQk6EKe+0ABsq24PONH89UePcztHPp/SqXpN46Mg8FZ2IlMzyxvVSOy9gs5vN4uo91t/Bbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9RaBG58qKf31XXkIaTktGil1kvZpLK5zcp7dPCIBEc=;
 b=EMERzBCPZjVSYT31tQqzLOjP0OIvHqbJePbX1U2KqTodv9UekMXLudctXFcHjURoIsc4nRcTPpHZDU2XlCFe8uN6YPAUugYpd9v5XzlFlxbxSuyCN+M+NOTQI5/FzolG1U4IvrRRMrG+pdw9hCNw1nH1P1Zj9hzt9Nc0b/xazaBlVH96y7qVjj1qgldIVJHQIFA/fs4L+azmApJj5a1xXuC3HHteHGcCfJ4xmz0ioy6Ttuw05Hav/Trly6nv7X1roe32WWAd8X5ct05lsIyrc39uFKcs41KHC/0ngafJ4w7WGtMXmi55ca6B211bHqqCv7p3zjr+lhuvKz1HckUAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=variscite.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9RaBG58qKf31XXkIaTktGil1kvZpLK5zcp7dPCIBEc=;
 b=gFLUHHo3ujYJu65u3j1RsKBeCFl9DKmHj0QZv6fe09PyoVC+2hBQ8xSLKVX5ZaJjHKNv+Rlq9SItsibEOx/KKKSUyW6uenoRhpL+Mhll/dQy+0HqkC81Z+hDvAUbHViFu4Cwq8aODFakdFxKtM70k8L871Ve4KFR2KMDo0svNiA=
Received: from MN2PR01CA0062.prod.exchangelabs.com (2603:10b6:208:23f::31) by
 CH3PR10MB7413.namprd10.prod.outlook.com (2603:10b6:610:154::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 06:06:57 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::3b) by MN2PR01CA0062.outlook.office365.com
 (2603:10b6:208:23f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Tue,
 14 Jul 2026 06:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 06:06:55 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 01:06:45 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 01:06:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 01:06:44 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66E66UPE4011585;
	Tue, 14 Jul 2026 01:06:41 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY
 configuration
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <pierluigi.p@variscite.com>, <matthias.p@variscite.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <alTo0KGWAixkK0i8@Lord-Beerus.station>
References: <cover.1782680023.git.stefano.r@variscite.com>
 <4d1ba0d1b9bd4957224213cf17dca93392788e03.1782680023.git.stefano.r@variscite.com>
 <531d7396-c581-4b5d-8008-db5e9ee5e7d6@ti.com>
 <alTo0KGWAixkK0i8@Lord-Beerus.station>
Date: Tue, 14 Jul 2026 11:36:29 +0530
Message-ID: <178400918994.3109814.1083731005888044586.b4-reply@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=oxffNQmo9YsVlpPM0jBsaCuya+CjmEo2EaPuL6sIuY0=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhqzQi89uF5RymPzVM5KOvvX9ZmjBkaXSjNuO7dbW+NEWx
 C+TrpHWUcrCIMbBICumyBLAtmuWVYrF44iKxK0wc1iZQIYwcHEKwEQ2FjMyfAlz4ZGKzL72eo3a
 rocXJSomXX4d4rWoPSzXa/Vpjq3/BBkZdi55I1WwdFpi7zpbsRbppVZhcQnrt+wq2Ooj1sA3mVe
 BEQA=
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|CH3PR10MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc39479-dcfc-4c6a-6db4-08dee16e1bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|7416014|36860700016|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UWrRhnS5wEMMYmyTA14HShKNF8Aw2RZLS0URS51AN/ayUn5Ih0r7iTWFc/rYG9Ok3k+/SMDEe44rnle1Md0UBMBWNcZzVBXsnf4YFFtHVx/eT0W6Ntd5+hzBBbrWN+Qmg8BM3iFH5yVyBunxV+Yoybz/6JVCkbhOnOuG0LUjij3Ds0kfEfz7EYGhqqp86kIp7TDkMKmn6fDaSA2unB4U4g8Qjb4LoXVkWVZgPYklR2XrYCuVm9BTPCAKtNK62gGD9ZKMgd2hoLgFRIftpEqQphn9kYJ0TMd+LIt8uKWELdqiXbo5v6TJUpe5CVLyMASs1opao67rzg21lFnQh40frdRtvAubw2f4uveuJHp58jFxZH/kGIqhJ7s1Xr3lqXDvPthDD2YotTcRR2798qtpmOi3yPifcSQkq6M92cM3aVB/UE5MtZgcOluKqK42LFCIV33x7cR2v4jACFWlbcSD8VSkaBvXe/dX80scOu3zKtFDJyqOwRJd9K4f4goiFo5MoQPR0uOXaNyJJGUfKmmGatB9H+hTlfaQUyys+ZVmAnpxwQ/yN0RHz6QvueTjOCRkc+7zdpiLWjMuA7SqLDjzCIDn7R/UVhJEGQi+dwe8QyQ2ApVsqllAIgpLub5mblGkn9ANxSllQ7RVvTO8dcvfj5GUjAwBwVx4yrn8CbMx8unicsV0SxRn9szBx2aV3AWQ67sk0nNGOPoRhTun4pf5gQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(7416014)(36860700016)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oX4imgu0kIeq3Ru7xfjrt+YT+mGhUQohDHIyjlB4cMCWQ8PbPHyG0/5u6ZdV8iqvugAiliO0riqQy+LCcEA+nFmtpqWti8ZAQPMP51Z98SFXj1DcLEhYaNEOBwga4Mo1m41ErSUziRqQMYQjgqzL8UkuLM/wlnHuejFobaJT5DEb1xu9TMLv7yg/qIU+yTni+/LjDdOndvNfzLgj+9PDfrmdkvW6/2SwVZtovELRLlRn7rSV44yOdxLemBCRprgkk4vIkY10L6B31MoYtLCp3IqeCLbCJ5cRaFpAK2USPTMppqE4Jw/I6u3NdMaSJtgeIBAtmiL4WFN+0h4A0O4Jv9Ix8zuI9vb8J7fcr+j4IiFABGy2nZ0YtMKQAyycZ3VUJgQSor5Vy2q9+wRRCg38zDYrTbLDVV/A3MLWaKnxPbXZbVn8t5+i/GgVAbizxSFV
X-Exchange-RoutingPolicyChecked: lvs3BEmZdGmCskMXSggRWtNZVcKb5DAUbFwDYeL1DUcLvNEms/5j7Xvn4kOTZ0es3FmQsWKsnaM/qtYLyu2X4tqwS0q46S/JAgZH/5hCXzxnjjbCgDPLELdonSU9ryGh/oTX4nL9TvCoKeigZMwYhtShmAymStTftivJvVbJsn0aI48xcrICjp4XafyyAZUOmPkOGdMo/OTigvia/8RB+U3cYqRgDDnSnRzDSdduQ6EkVdtb7W7tGBP+cFwuiH5G+5wjsbq1VssVTCQjcPOuJItKfzsPeuefBLgrxBVelHvdsLllfwsldJwsXOcMkoQrgJhhDVjjEVshFH49pXL5Lg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 06:06:55.9551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc39479-dcfc-4c6a-6db4-08dee16e1bb5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7413
X-Proofpoint-GUID: SFcrUts_sF87GsQY1NQAcXidmtPOufma
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfX5PKBcsA00EzS
 qTeVNdINVgK6QtuC+HUPyX5oth5Ys10VIfvSFT8ylhLy5nEczr0ltqF6P1f4DfcQK+N86Eg2o45
 hYanZdeGwDwIQbeit5mSlq6c33U9fcM=
X-Proofpoint-ORIG-GUID: SFcrUts_sF87GsQY1NQAcXidmtPOufma
X-Authority-Analysis: v=2.4 cv=Ir8utr/g c=1 sm=1 tr=0 ts=6a55d206 cx=c_pps
 a=Fmy/MLZGwmeCELFTjYB8og==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=cMDUSdu-AAAA:8
 a=yfMW7F5MfwU5o_UpJy0A:9 a=QEXdDO2ut3YA:10 a=QRaI_VI5Kbc4sAalow4w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfX2WUcfFF/+654
 zyYC3EyZoZSZK7kriJVIufCIVHWaUdkWgizUEfoVdf6DN8KemM3N7gv4d9C2TgzeaHFHTrQPh/n
 N1yBMoINR18NKtsJtt5TmpW5+NCy8fkNzpr//4IjcpUnyZ1iD6FBgYvSrdr8LGN5Qw/Ou2K05R8
 TBD7n8L/XobOWn53YjL3GL2Y90eZRTlywR4s6IhwIe0T0EQVzLMP0ibZdNngw7ydBQzIlrQKGhC
 TTPHbZ7dvJ2v9GnbY5Vv0fL2U7oQDMbGAtEwon/5H5vS0qvAFWxgL8xssEhzfiJ5D5iRadg2fuN
 XQnXm/vC66JSVoyXMHotHknYvgxqU5vNYIn+0NYPrrU+GV/C0Yl9Cosu6jSzlcybM4O/W+TpQ3q
 jX2hcOzjUMjuRcL0OmHvDatvG2vwXBGK+KckO3iTXaawahmxbaY58E1mS0Xg0Hqy0GOQNgqmQVt
 iD/fnvL+Y8NXwxb2RIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_230711_035272_71C97839 
X-CRM114-Status: GOOD (  14.11  )
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

On 2026-07-13 15:32:00+02:00, Stefano Radaelli wrote:
> On Mon, Jul 13, 2026 at 04:02:34PM +0530, Vignesh Raghavendra wrote:
> 
> > >  
> > 
> > So are the reset delays no longer required? Or they taken care of
> > somewhere else?
> > 
> > 
> 
> Hi Vignesh,
> 
> No, because this GPIO actually is not used as a PHY reset.
> 
> After reviewing the hardware, it turned out that this signal is a
> board-level enable signal required for the PHY to operate, rather than
> a reset line.
> The previous reset-assert-us and reset-deassert-us values were
> associated with the incorrect modelling of this GPIO as a reset, and
> are not longer needed.
> 

Along the same lines does [0] need update to how the cpsw3g_phy0 is
described then as its seems very similar to what this patch is addressing?

[0] https://lore.kernel.org/linux-arm-kernel/0a7bdfda80309eaa207b5b369d72f4bcb16e0604.1783864932.git.stefano.r@variscite.com/

> 
> Best Regards,
> Stefano



