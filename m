Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DFCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyEOdPlTKdbcAtKrg624KtjUsIk2KhUrRxzttUxWj/A=; b=camtM0aqJ/X9PmulsnqnZmy++u
	qzbpfQAR6YfXrn+mOIGiVy/AbX9bBfJHqjeHVtolLev+Nf9hb0gRZSoTvWtOfSltiA351InNq95Vs
	4S5ro+RA9RJSiUoZw39Xl8/7InDVS6Go+RsBjNbtMBcaU9K1EC0u1vf46lVIFXctrEX7q4PwPDE+m
	8oal94kuWZuwErZUcl/ge4MrfmxQs4+mFCnrStZrr4w6Xfd8cJV/hn6JweWrqPTUHg4/0pPq1peBM
	O+vurwrTfxecDPvE16RgaMvEhLSKWdWosQoSBt/grXpacmuwZb2xNDv6Fvc97K43H9U4rv/mLhbnz
	13aCTXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDDh-00000003viy-0MO5;
	Thu, 02 Jul 2026 08:56:29 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDDc-00000003viC-45Iw;
	Thu, 02 Jul 2026 08:56:27 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628HXT71285378;
	Thu, 2 Jul 2026 03:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MyEOdPlTKdbcAtKrg624KtjUsIk2KhUrRxzttUxWj
	/A=; b=hparhK7+IxUlUvp2FPan5V2KItIJRMl8Njk9prmL15F3tpuRltR36qfWA
	JmXayPi2BCxbB9GWybfTmHjs+k5LUZgmqpfQMQF72xtnIAIsR3BtIT1CVrASgS3l
	1LoWj0MzA3E8PkW6W+Ttc0GjcRurV0q6LdyehKNFf8To+STfg2LZLZOu9eYU5/Rf
	fMCB9zUdmUjQLZAirjPK0j56YoHD8PREN6V88PvKbDt697jUYSpHM2vl5M1v3Yq4
	NJ8L/mjV5PIiKhpFKtT8mZofMHmskw57tY/sZE6vVDRJpqb3zIa5RT6ag7uNRBHq
	5pGSEh/I6X/Wtgi8RI1UVBJbN9csw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5fvyhmcm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 03:56:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6N46OZ3EBVmgnLouKJhKd2ofImQxxmWsL8o9b04TnZtxU37hrQ3MheTGQJ7vlGLe5MJj+MpGUyuFR1PCh/UfwdZXBBPK8XbjntE14ooz6IlPDvyREv9mvhxKvHh2DGPn907RhZePMaZpJmFuda4QEOkNS4pVo/lIyD+sZqKfbiYwyiTQZPlUuc3iK2Q/uwV1Syuboe4sjhGvdY2KP/541/QMelDzbSjr9W0e8TQXFkjHJZwUJXTkTCtHlID6erHdN0nh2xXxB8/Ea+wHyJYi2LfylirStimRxdd1ut5BjwXv4tQLRorFZaLgF9GYRGfuPAAGf1kcI3IieeI0a23Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyEOdPlTKdbcAtKrg624KtjUsIk2KhUrRxzttUxWj/A=;
 b=b53jiAWCaoq5Y1FGc26ItYeU4RQ/yx0ru/HH6P4OEQE6H6JG1iTJTDTkVnWp4T7GFMYdejeRVtA6KhpCXHFKsatrUpxPwxPuRVWnFNwHddv1MvryJAZqIIu4I30J7PeLEbcjOnrbA+EzkpSxFpCdABjLAG1l0VVHCV7rXEFlojY5LtMiWmDcRULM3XdvejE7L7NyznO5Lr01Smu5hfam+mEcAMYoc9e0mvwAG7ImZbmKxLudhHI+8DvTZudsNtWxhdCHaXV2JTOaRjX+EfuA65B8vAWAp0ZxRsBW+yCJ9o23xbsSeS/HxL/8ikNOWjS41QGIFoaclecpOg1urIX0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyEOdPlTKdbcAtKrg624KtjUsIk2KhUrRxzttUxWj/A=;
 b=QVzFkj7SbEPTD+CFB0TjERUiXE5/fgBiB3S8+0EjQJrDkGu11cuz5HHK5mVIwwCLu+mU8QoAUBhuTpUXLIh4b0vdmDm/akHyBimYezax9IVBIGVO+X0GfP+Rp3sbBzH0o5rIufITIGQLeQp1D9E5E5RI9PwGVeHFlwLPzj03sGY=
Received: from SJ0PR03CA0352.namprd03.prod.outlook.com (2603:10b6:a03:39c::27)
 by SJ0PR10MB5669.namprd10.prod.outlook.com (2603:10b6:a03:3ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 08:56:17 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::77) by SJ0PR03CA0352.outlook.office365.com
 (2603:10b6:a03:39c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 08:56:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 08:56:16 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 03:56:16 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 03:56:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 03:56:15 -0500
Received: from [10.24.50.145] (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6628uAtj3540509;
	Thu, 2 Jul 2026 03:56:11 -0500
Message-ID: <19f71eb8-92ef-49b8-9ca1-580b4b899ab2@ti.com>
Date: Thu, 2 Jul 2026 14:26:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 1/2] dt-bindings: phy: cadence-torrent: Update
 property values to support 3 clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>, Gokul Praveen
	<g-praveen@ti.com>
References: <20260701142457.81874-1-g-praveen@ti.com>
 <20260701142457.81874-2-g-praveen@ti.com>
 <20260702-vigilant-tody-of-inquire-ffbede@quoll>
Content-Language: en-US
From: Gokul Praveen <g-praveen@ti.com>
In-Reply-To: <20260702-vigilant-tody-of-inquire-ffbede@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|SJ0PR10MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5d0c1b-e736-45e8-0511-08ded817c6f8
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|82310400026|36860700016|1800799024|18002099003|56012099006|3023799007|4143699003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: Znrq+hwQofWIGIzNjaFqS7ZKK0WC3KRkzxO+LG8hQQf3xmHlReZCaQrPLjXfB00ni8OCx+WptmGi4doftx/Ks+BX1Df0dNm3GFXfK+xpLAtHoDsWIJ6o3ixKDSvPWjVdKNwGG/8v42eQxkxFCE6B1s77Oq53LTxwqUroqeJqEdWO5JYruVmAUlZlQK4OqVPcY2BGWAXAV/DqeO8I6hKGmIGj83WeVReALp3AjlU6GrnfP2f/rXEjhiKib3MtRzaGp4UJyQlvQFhYtEvPGt0A+fa4qaZvJIPn9SZ9nlnNAUJmTXvrTVVEqOoH/6amEnNA55J95ZRlkLuGREm6p4/la9NJ1b448h2iK3Cy5VZqAlP0lKwkpNd7oKsqDzTD3QGnhJ54Hx0b7Gv1+4Dhc7NXqW7S7QoeA3TvAheVtkQrCYjqfjehZEE/mIacrXgbEoESA4Kb7BUINbM3tC112YDCSbF/yQLp2Xqurr27ohMKLYl+syVxn0MpWFdWzuotnVtw0/sm9Xf0VRqWsygYZzuBYcrBNfFtorH9/eQUqL8Pd5CjXkGnnkV+D1PoMJq6slU2IRT1SeTt1ybmYkzC7xiDPYcO+7xvEsLWsNwXfBDhcQ10Dlw/Um/tpiPxse0m7KCmClP8jdPR9mLXXF8+xUj0EqagjMpScKyZGmHXyDR6RFVcGvzxHJreWee9kuFbWf6wIsbbklAYwcB8Af29ns2gqg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(18002099003)(56012099006)(3023799007)(4143699003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Es5pXb1aG8/+WDYugxSlwZUq5vJwyq2WbwfgqiWTIwRbR/sdmMagJRbmHRYDv4omZq3+AE7Lb6T3vlCVAO6hp6/WzwbWJpgn58dt0yQIfG3hzGraBDgDxP5PyZKVtrQl+UIbWlVZeHo4DOZIxDkT3tSD/diJwFIvI99NGMig8Q9I07Xj6v4nMbI1F0VIqN6TPVt8sp5cgBG2OdBGMog2L+e1Lgkb/Ed7iUEjLMlcJq8q91B2kUWi20obXTziVg+UzL4wy0ynRS2lSfVlklDjwAGhlbQlT5BceJ1BBCRDL/pz9RUjoa0mE2+ENsevwP+wGEVgQvv5LsXJ8BhyBxqiLLDgls5yy/1Rd+1ubort2XQwv710nl2anpAC6stxELAWU8ghf9oO1+BBWUnyux/Cy6IHz+F2ObNoT67pTKmaHQCpheXAvNuxDBn7BkzDqnOM
X-Exchange-RoutingPolicyChecked: QGIHY04Bg2zPXO5eR5uVGi5psX7fWDEGqBYT8SIq6ou7H2/FB2VVV8MrlPZblkYp9F4yYlJp6v1y5XGO8IcsqCjlbsaQu5AVRGufjVjTsYuwGC1hXthzCtqY/wX3r4jF6N0m7dTys56ShYTXU/IR973LAbokqcdnCKEZmXIK7uwZkbm2Hy6VPDa/Q4UUiGnfLXm14RXuHo5RL/9hQuAgAPuppD8U6xBuG41QkM7Dr0PvmblCQxRONQ4e2p/IeEModZYUufCn4FxxR9gSL2zfUZ+k+2eDkltf28DUIZsUh9/9buHAbkMAKKbqkaScaDPJhNB/g++OeNh/JPATVmiMBg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 08:56:16.5801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5d0c1b-e736-45e8-0511-08ded817c6f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5669
X-Proofpoint-ORIG-GUID: 0dqJzqijbtEIC2u2sfPh21gP4UgRTMEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfX6Bwc00w9iXux
 uNxkR6lisabbjNgDIgTKN1FjrMQ2gcvt+q+9BjRW2M5WpO5OSdbltLq8SNx6YZTFea4TsO/j+aO
 g0ApGUieDvYrRe8a0tC+G/Bi9jJX5g/EaQPyX2UoKg28lnZWp0vQXYuUMTdeYq39LHqYk2eHsT9
 dB+K0osOy3dTkXUzGh82ivGcBQGImJOAI9175mOgNug4bj8yx39938UAHuBvNbXIJ9ydF1Wo+34
 RcbULWSPDHndGXu7zWfqLzvtALPAOx3Poi0ErvHOAl+ePxKngT4nQjVRYlDdnRJ+oci6m4fbNfV
 oH7RksMZzSZimoz+ROMMIYvXBTdp3f8nOJm57zJT7rV+h0GIAUx1LJg4p0I/NLalrztBbAwSY+G
 bzBzAeiEr4ucRj/pYUvnb2g40XVYbQslC4c6K3MCdX5ZM4JHpOsmzsfuOCSpAYObCY7M0r5s0ej
 gBFxynsyI7RzF1qdv0A==
X-Proofpoint-GUID: 0dqJzqijbtEIC2u2sfPh21gP4UgRTMEA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfX6zVLzGOEeRqy
 d52urLLEfvqPL5BJCu7lCtTzO3Imv5OXc/Lvol2gLudhj92IAKv0w5TJ1qEusr49S4uEaChl+ox
 kV51ijNtjmpzqUBHk+BrtQ5vrdH1V80=
X-Authority-Analysis: v=2.4 cv=T+q8ifKQ c=1 sm=1 tr=0 ts=6a4627b4 cx=c_pps
 a=3EeCZaq8L1ZepF5DamB/SA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=SV126L7JnvFE97WdaswA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_015626_248222_D1772701 
X-CRM114-Status: GOOD (  22.60  )
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

Hi Krzysztof,

On 02/07/26 11:53, Krzysztof Kozlowski wrote:
> On Wed, Jul 01, 2026 at 07:54:56PM +0530, Gokul Praveen wrote:
>> Update maxItems value of "clocks" property to 3 as description of
>> this parameter already indicates 3 clocks(refclk,pll1_refclk(optional)
>> and phy_en_refclk(optional)).
> But what if description is wrong? You need to provide rationale why you
> are doing it and you cannot use existing code alone as that rationale,
> because as you pointed out - existing code is not fully correct.
>
>> Update the maxItems and items value of "clock-names" property with multiple
>> combination of clock-names possible since pll1_refclk and phy_en_refclk are
>> optional clocks.
> Why? You need to describe why you are doing this, not what you are
> doing.
>
Would the below commit description be good enough ? Please feel free to 
give any suggestions on this:

''

dt-bindings: phy: cadence-torrent: Update property values to support 3 
clocks

     Increase the maxItems value of "clocks" property to 3 to support
     2 input clocks(refclk,pll1_refclk) and 1 output clock(phy_en_refclk).

     For multilink SERDES configurations where the links require 2 
different input clock speeds,
     2 different input reference clocks and 1 output clock is needed so 
as to cater to this requirement.

     For eg: Considering the USXGMII+SGMII multilink SERDES 
configuration usecase ,
     having only 1 input reference clock fails because USXGMII requires 
an input clock speed of 156.25 Mhz and
     SGMII protocol requires an input clock speed of 100 Mhz.

     Since one input reference clock(refclk) alone cannot cater to the 2 
different clock speed requirements
     of these protocols, the second input reference clock(pll1_refclk) 
has to be added.


     Signed-off-by: Gokul Praveen <g-praveen@ti.com>
''

>> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
>> ---
>>   .../bindings/phy/phy-cadence-torrent.yaml        | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>> index 9af39b33646a..96c664d50629 100644
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
>> @@ -45,9 +45,17 @@ properties:
>>   
>>     clock-names:
>>       minItems: 1
>> -    items:
>> -      - const: refclk
>> -      - enum: [ pll1_refclk, phy_en_refclk ]
>> +    maxItems: 3
> Drop
sure krzysztof.
>> +    oneOf:
>> +      - items:
>> +          - const: refclk
>> +      - items:
>> +          - const: refclk
>> +          - enum: [ pll1_refclk, phy_en_refclk ]
> Drop these, pointless. You were supposed to grow existing syntax.
>
Sure Krzysztof
>> +      - items:
>> +          - const: refclk
>> +          - const: pll1_refclk
> So here is the enum.
>
>> +          - const: phy_en_refclk
>>
>> And this stays.

SUre Krzysztof

>>
>> You make changes which do not make the binding better and are not
>> explained in commit msg. Focus on WHY you are doing things and also
>> explain WHY you did such complicated syntax (if you insist on rewriting
>> correct code into something odd we do not expect).
>>
>> Best regards,
>> Krzysztof

Best Regards

Gokul Praveen

>

