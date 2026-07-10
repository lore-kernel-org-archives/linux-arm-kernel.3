Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FE1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 09:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bl/9htZJ1EbkmZW8aGRvNq6/zFejH8nQ4yfOPrunsw=; b=x1OQK6lg+Yr/+P4hOevkeJROc9
	tIXn+lsa+3eZANW8GGAos11apiQstbhp9qIIFSjuF/xBqRaMzhEjgBiQ6Vg08wDoO4R1EhdKlqKWG
	U6NifX0DnseUtb5MVtlp1pKXYAV6TZtIo8VHvJjMLnP49qmFXIoBVGkyHGN446SraxV4wSOlvNwK9
	ZxYVyQ9M9IN5LmYQM6cnQug/wC4Cx1kXVA6pckp8AKZ/z+smdKZtw2crV+eW1Ju4gXNlykM6wjzC1
	g4ggJQAE8198mWIbSa/4ZDJBfpr1SkZrbtUdVZzR19MZCWkKLKZfe/+xpy3sGQCAblq1xmOixIaIi
	t0047M3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7ov-00000004cxU-2Dx0;
	Fri, 10 Jul 2026 09:46:57 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7os-00000004cwp-2fsI;
	Fri, 10 Jul 2026 09:46:55 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66A83wwM2275718;
	Fri, 10 Jul 2026 04:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3bl/9htZJ1EbkmZW8aGRvNq6/zFejH8nQ4yfOPrun
	sw=; b=MNpgCAXXNKW5iuh0GYkc68cGnMm/AIVw5VvH5GNUrnNGUPRUbPMTOr31S
	vG36401pIcwEBoWhmGfAR3yncB6sXdpBGgsYjNiZxjofF9vXMgwFu6Tynns4WgTk
	m9is0sMuqsL39nPTSdR5JZlBZJ5URdeBtBBTdulcUGj1EiEVx4hMc3u6m0tCoZVq
	344nKIcYftIbi38nnSv5fXvFhjfj9vysUuO9/b/xEFvd7bCgo7Vx/AniKn0Pu1F0
	D1rfmeowvXDjolZ+K4qiftsbGY8eiDx8jgY0IiIQ+BV9jlwOWma9XYwahHKrJwz0
	sV1NprM7NemMVcAAPkVajwFMGa1zA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fadx0nmp6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 04:46:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBwbsCdM3XpfQOfhK8h2bTFs6M8viVE2grvFlbA0/Zs0P8rAe4xPhzqHiRS55iG80XmyUkwFIwyNadcvmwHXizLXHcYM3/rEKA8Oz+2OpkwEhS7EkfQpZRkBzWnvEE36mtAbpwMAqLgfpGBmqyk5oVTfN5cnW3wlwTcfWczwFLcWEArUt5K4xFZzyTneT4T3y1SIR5y1oel5IChisrB9tf1EHblvyRCG1SudBZr/AI1Ae+iQw28GP+/k1XcMCW1HvDrYqrPMeZsjHyReCrffSJHhQ7RhEU7x9MKFfRz8YKqRsWdzcr36g8sDxBH7sU//mh6VE2eetKfvwqOhzgoatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bl/9htZJ1EbkmZW8aGRvNq6/zFejH8nQ4yfOPrunsw=;
 b=rr0uEOLqmezPRQgI7GGLhsbOuLbnBdAZjxKmgWvphSGKyZTeYNer7UnhBPPTUZX3v3Q0qxJhf9aOBS1xLYiPnJ15WC5XztlWtrhelJ5Zt8hS0hESq8Gh2OQbm4RDr2911DvTiejwtS2vxWs8ogMMXytvZZEHdgYYLeHZgDNHyhqqc6xL3N/8ud5Ohw0VKN5KntiXpB7H1KBR52MJFtui2JXixXUYAz090QtAjb088LxLiIFikZaOkgE2X/bWoqWa73Puh98f28FEnxn8uTleD4MKJimF/D+TK0rKEthopdDeFl3mKOiTybDMqVIlr9B/l5OtCu5UT1R+05YdYgvbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bl/9htZJ1EbkmZW8aGRvNq6/zFejH8nQ4yfOPrunsw=;
 b=bCc+vtVbyoASdATisMdyc/2EFifEMuTobA42avJZrHttFlK5kJkX3kSn7bBtAg4ltfMhGfjvdUQounPvdbhv0hAjPvIw2e7AJp6lmxioqZCHdrHWcFRN8nA7HW2dnbnZ8XQz9+u1G5G7WHXu/jNCVuYBAGHms/MAU+x/AQMk+NE=
Received: from MN0P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::32)
 by CH2PR10MB4344.namprd10.prod.outlook.com (2603:10b6:610:af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 09:46:45 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::6d) by MN0P220CA0003.outlook.office365.com
 (2603:10b6:208:52e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 09:46:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 09:46:44 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 04:46:43 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 04:46:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 10 Jul 2026 04:46:43 -0500
Received: from [10.24.50.145] (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66A9kc0m3402433;
	Fri, 10 Jul 2026 04:46:38 -0500
Message-ID: <7a129061-2df6-4297-a312-4f079f7dbd3d@ti.com>
Date: Fri, 10 Jul 2026 15:16:37 +0530
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
        <yamonkar@cadence.com>, Gokul Praveen
	<g-praveen@ti.com>
References: <20260708083725.66777-1-g-praveen@ti.com>
 <20260708083725.66777-2-g-praveen@ti.com>
 <20260708-purifier-subside-667f32244c09@spud>
 <18b1c832-d0ba-4465-90c8-09e7c48becde@ti.com>
 <20260709-unvalued-washtub-d024d21f5624@spud>
Content-Language: en-US
From: Gokul Praveen <g-praveen@ti.com>
In-Reply-To: <20260709-unvalued-washtub-d024d21f5624@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|CH2PR10MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: b2dc1533-4122-4370-6307-08dede6826c3
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|23010399003|1800799024|6133799003|56012099006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: yBCLQp2nxW1dY7tc9Mz87ytvXpIIQEA8diZ7ViEAIH0Dd/0Nl79Cz8DVOAAI7s6T+SaShSFArbsF8oaPKJHmIB31ps2rAq/6FBysdF9LT6jBEeXtB/ZZb+KCWJmCRxGdQH1wBCIAIgeUa7cfkBPyUs0IdpaWKoiDxI1lHAobIAIUJV1kT/t6DT3nJBhMfQdr/CdDrMpkuCnz2RJZMb3sCvfL4q8zl6xOoPQkPzJ3fAht02n2uoHT0o1b+6xOxu4M9y4+gUgYC2DOMUF7mCTgyXQnf+PmpzLijamyFrBUBIH8dMtWE0zvOtW63M7Plil7+4bm8FdsdMDkwsuA+kyBnDfSsPSt2nDhu3DbFT9n2bHNd9MfGEQBwpZW7tpiWleYPavMvOtlyI0zWEaQLnW0wQ/BBCfZjzlZ5aPMUNo1TD+74DwHVMS5H1M3g7z8CQHwb08IV8hLgqTpzKjQGFyDJKR4NtEzxGzkm6oEKoQkPF8YXidVnegyLj/qhTvQYzh+wBLRkdv+hTtOIq1qr8tpp1cgt3tDtqQdtO3BaGDS0FypczhUKf9kVFnDEQ5lw4MHgtqTA6V+MTrygkXla1C0x3Sq0G3wek8GtWZNWU1Mh5rth55WF/dYkeRodLqSnJyixGcdKOTI5/QK9LAEIzuEsqmwv+jxZ5kXBINCsUprklSnNUy4upQwkmHbEb1vgBy1IIBXS1i5JIHbUv3Y4IohTA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(23010399003)(1800799024)(6133799003)(56012099006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IqhvCYuTNlCf6/etfoGRbkD+R6iSmFJ327SDBi0zX5/pgd871ZNhQH6YmAg74Fdsje9CNbrCU+9SOwp+JfQ0LzwwrwM8aqHeE9uce9NJFbVmv1fJglaWL7FRAMyhQIy3155jyeizY5U+E5pv5GQm4Wk2NClmjpsyLM1fh8phdqk9+VSkH3tclpRSPp2FMTKx6Iye3obAd7yPXPxAxaBQ5AfpM0C+WSvZGgAVZx/0iujz3ebnIlcieVYcDcM4Qt4kfQUwJXwCrkK6SDuC4aZUxz/rEGBQ0UCVRLzWlidgLT/4ADAWDvYG9zX0dYw5NpFAN9MsR+Y1cF0a8VfSeoWvrsxC98qodWoNdIK0QES0JnCFnGLBurHENSFWly69DiYFd4SUgdoePOs3j+FqqkGFDDw+VP+iZGDhWWV1nOmjscFbRDqKrqFiWq99pgufCme0
X-Exchange-RoutingPolicyChecked: IBEZHE1n/BX6bZEnrbC/fo8/XHmfC6vMWdIY0tREJRC9wq259aQT4wqHQDSq/bUJcxn4iwczlRsIezadwi9+7322rSib3wpfxEFZ70kn41eB0Nw+EG3pwt+xnv9AoicGQFOpDbLHgZmwWaKT7dWr3u5AY1vKNH8z0E6WTynRItHPD5X5n1RmSq+5tvVjqzfbL5XuppTMHwxMUeqJfUn4ubw3tAZNb79AHUCLkB2JcQNZOqOs1ivQAGaGEnkYblImfnUzKQdwZ2+D6g7ySYjIpgNdabLSJQpr4o6CkYpBFRSPT5yyoy7FrYWnDmCLtgfAbqJSQD6OBvttOr8TButX5Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 09:46:44.0266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2dc1533-4122-4370-6307-08dede6826c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4344
X-Proofpoint-GUID: RimCi4CYVIGXXwwxxGmHY23EqkdGJbnC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NCBTYWx0ZWRfX3TGp6WskOeSe
 6qlgyRIoQ8vRfgoWvi9D4w7kFPoGBftRu9TrEu13AmMC9Qqd7wXIziblpX/8P/lcecktRaPgzpn
 oVDa4XKAMITKK4dydrs+tEXaqdiY4VigKxVpovPn77DHZN3vbK1oYFDGdo/E/qAtqSdIJwzNZHm
 aqPiawHgjvmA2oQMjZkmo+5YCEhts0bhzMFQNojy+JKlRT74SxOb4fF4bU7sJ0XYfREISFtrb0o
 oKVdIBZv8aLzgcMFFVqO+dk9vGbQ9AXJ+mMseOaaEqQb/Na9V2YkFeMK/w0910bp8A+DuK9pBSl
 uv0Py9cO/J1fUwDOnEn8qj2b7ndUJ6tyyfmUxRQVLPAYWWWbEW19lBIq5IKX8tvZvAc6bz7lcQL
 38z+h4OmM69/3T5KiNSG4NELWmtqg+ELqKEuqsPDtwwe78eA/Td8kCHs8qDou1v+VlerbGjKSet
 ZfGnTLCryRC7/m28x9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NCBTYWx0ZWRfXwKILMlKJAUTj
 56231+SnLLDu+l8AhxOzgyOESREwtVgD+k6/qzQf/jtI7I3plSVdgrwLreeFq+svbgqJYZ7lEQe
 Vgl14eRDZ8TfQ4YKNq+qp2IokJ2V7iY=
X-Proofpoint-ORIG-GUID: RimCi4CYVIGXXwwxxGmHY23EqkdGJbnC
X-Authority-Analysis: v=2.4 cv=A+pc+aWG c=1 sm=1 tr=0 ts=6a50bf8a cx=c_pps
 a=ul7AMzggcqKAecwK2qVOCw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=-TvEWuknRv-ZBbInuocA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_024654_688773_5866A98E 
X-CRM114-Status: GOOD (  22.87  )
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

On 09/07/26 21:21, Conor Dooley wrote:
> On Thu, Jul 09, 2026 at 03:37:15PM +0530, Praveen, Gokul wrote:
>> Hi Conor,
>>
>> On 08-07-2026 22:09, Conor Dooley wrote:
>>> On Wed, Jul 08, 2026 at 02:07:24PM +0530, Gokul Praveen wrote:
>>>> Update the maxItems value of clocks parameter as 3 clocks
>>>> (refclk,pll1_refclk,phy_en_refclk) are supported.
>>>>
>>>> Update the clock-names parameter to support mutilink SERDES configuration
>>>> as the existing enum configuration of the clock-names parameter does not
>>>> allow both pll1_refclk and phy_en_refclk to be used at the same time,
>>>> hence preventing the support for the configuration  (refclk,pll1_refclk,
>>>> phy_en_refclk), which is neeed for multilink SERDES usecases.
>>>>
>>>> For multilink SERDES configurations where the links require different
>>>> clock speeds, all 3 clocks(refclk, pll1_refclk and phy_en_refclk)
>>>> are needed.
>>>>
>>>> For example,considering the USXGMII+SGMII multilink SERDES configuration
>>>> usecase, having only 1 reference clock(refclk) fails because USXGMII
>>>> requires a clock speed of 156.25 Mhz and SGMII protocol requires an
>>>> clock speed of 100 Mhz.
>>>>
>>>> Since one reference clock(refclk) alone cannot cater to the 2
>>>> different clock speed requirements of these protocols, the second
>>>> input reference clock(pll1_refclk) along with phy_en_refclk
>>>> is also needed.
>>> This binding supports 2 devices and the generic compatible. Do all these
>>> devices have the new refclk?
>> Not all of these devices have the new refclk(pll1_refclk), Conor, which is
>> is why the enum was kept as it is and in these devices multilink serdes
>> configuration will not be possible due to the limitation of not having the
>> new refclk(pll1_refclk).
> In that case, please restrict 3 clocks to only the devices which have
> them.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
Apologies for my earlier message.

I confirmed that all of these devices(ie:2 devices and the generic 
compatible) support the 3 clocks.

It was a misinformation earlier from my side.Apologies for that.

Thanking you

Yours respectfully

Gokul Praveen

>> However, The intent of this patch is to add multilink serdes support for the
>> devices which have the new refclk because the
>>
>> earlier clock-names configuration could not support having all the 3
>> clocks(refclk, pll1_refclk, phy_en_refclk) in the clock-names, which is
>> needed for mutlilink serdes configuration configuration.
>>
>> Also, Please feel free to ask if you have any other queries, Conor and thank
>> you for this query .
>>
>> Thanks and Best Regards
>>
>> Gokul Praveen
>>
>>> Thanks,
>>> Conor.
>>>
>>>> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>>>> index 9af39b33646a..ac0f625cd76d 100644
>>>> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>>>> @@ -34,7 +34,7 @@ properties:
>>>>      clocks:
>>>>        minItems: 1
>>>> -    maxItems: 2
>>>> +    maxItems: 3
>>>>        description:
>>>>          PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for PLL1).
>>>>          pll1_refclk is optional and used for multi-protocol configurations requiring
>>>> @@ -48,6 +48,7 @@ properties:
>>>>        items:
>>>>          - const: refclk
>>>>          - enum: [ pll1_refclk, phy_en_refclk ]
>>>> +      - const: phy_en_refclk
>>>>      reg:
>>>>        minItems: 1
>>>> -- 
>>>> 2.34.1
>>>>

