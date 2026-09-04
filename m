Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D85C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmnJ067+NEy0AACAY87Igzv6teiebLFhkqrw9mf40Lk=; b=klJhjNQsciE8r/ay1tn09mknAF
	8qaFXzyrNR9X79DOWaf0oHrBtmXmkA2LC2ELzAjIBy+wh1AxKQtNLixuC4l4x04f8a0bdxxkketl8
	Kor5X2UYdm1N7Lgv09LukyfBxplW/TSpbyHI+cSLaA/WYZ985zaH9fe+6ZKheSIlvb6kw+VISepn/
	fEIEUCIxG7f3Cofw0rb92F1GPBxsu4IacBKcvzqBRWS4dvqG0CQ2937yf1mUhL7wI5AF9N1M11526
	Ha6E6JwEXP3qJXayzPSveHxLXaeulvKpVbhaFgCoXthsv4hVXluutqdY91xHvismN1LFrO5i7AXIn
	6ASXoIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WPB-00000002fdL-2s8H;
	Fri, 04 Sep 2026 16:04:41 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WP8-00000002fcO-1Vj4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:04:39 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Ftwb33922063;
	Fri, 4 Sep 2026 11:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VmnJ067+NEy0AACAY87Igzv6teiebLFhkqrw9mf40
	Lk=; b=K/t63ogWS4VifijXNNQidraq7/uhWfqaISP98dJfmTboJ1JfBHv3vfRYG
	NO4zHER2hhEfq2uYEfAJ3urOJ3J22eZdh01OllZwQA+IninlDQP7O+KprTPI2kLs
	hUIXfnisWE1nPwDxfiaIk3We4AMhkbsiJVCM/3ea3iAaWSMJKJRJPrYtsKXlw2XS
	6WzWV7XeBHiSVSCxqPdKmLyre3jzVya3OllFkb3iT/+RBG1ZDJANf6xhSwgLlA27
	9HyhovPhM4ok5w9eh39uu9VpQdIiV5H6mCt0sU3RRDNS7KjHe0vpubjpkiw5S6FY
	8IvTIcB4/n8HXS7oB7IOiV0yFzLMg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfyyq0p78-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:04:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmDdIcDMr4PzANG/k6gkC8SFgY7MTFaNT6U9PbBZzfd6l9gy/qN/oPA3O/r2yXdsEDjY0w7TbIOd7pqOgV5BEmt45/WPjoNrhBoCla4di7LkdGqJfx59O4nWVyb+kjIRn7eQM37R/xMHqpxPXUeCEhsM4H+/cxNLhVlB90ncRroqIN4nQ+nuBEny2QEwJyELAcPRI4AtEqqz3HOP5Hrnz9hYtrPiDrhdAavVdLCLqp0uEJGd2E4CRvvnquT+gTckr6FL02NkTGqhwxTU5mifSYL4jFTBorGeB59flRhtiUIWavdbaCxP52/Baudv4Fu5R0lLOIzQ/XyL1HF7AkvubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmnJ067+NEy0AACAY87Igzv6teiebLFhkqrw9mf40Lk=;
 b=O/z4/YPaQ91nWci3w3zc9A/8QcpWuDHWKeRTDtcdX2WbjTnsRfr/E3R6XtrDgElAFyVExrQrqG2EXvF7ognBrBNSTGfj8eRc1QhUIjnaEnriSg2bbxvSbaYh2GGUe+XILIq8B4+kyvyaGEWY7iKrfLEDrovriGsWn3oIDMAKNWOUUURCTUVDkeK/pZ+cp9VVKgge5E7OUKgv2K0nfkCvV/Y+H8WtNhWVhPi2GvEd6h96h8lMp/yLPPqs2BqoGpqlXw35W08tHs7URyPr4CMPTHo77ANp+VJrh2IexzmLLylu22aDZGcpb0AumNZRSablJCUtfdi2IHTi//UIDOh2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmnJ067+NEy0AACAY87Igzv6teiebLFhkqrw9mf40Lk=;
 b=GnrVYN5SnF6ZPrBSMeH8vk92FogdZZaghGsaK7eXK1NC5lUacEp21KdOugYOxzX032IYSE/jf8Hm6IWFprae5PXeXm2p6d1wNkzafjenolr6hPNfI2D0HAsID6sDWqXWxh85h/3y0tPuICTAhyovQffIX8iAzjqGoNNzDpI8pd0=
Received: from SJ0PR05CA0073.namprd05.prod.outlook.com (2603:10b6:a03:332::18)
 by PH7PR10MB7009.namprd10.prod.outlook.com (2603:10b6:510:270::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 4 Sep 2026
 16:04:27 +0000
Received: from BY1PEPF00026956.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::97) by SJ0PR05CA0073.outlook.office365.com
 (2603:10b6:a03:332::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Fri, 4
 Sep 2026 16:04:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF00026956.mail.protection.outlook.com (10.167.244.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 16:04:27 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 11:04:01 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 11:04:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 11:04:01 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684G41vF3789105;
	Fri, 4 Sep 2026 11:04:01 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] Fix MCU watchdog comments
Date: Fri, 4 Sep 2026 11:04:00 -0500
Message-ID: <178853782510.2998109.9992613787980495222.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260806195242.669491-1-jm@ti.com>
References: <20260806195242.669491-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026956:EE_|PH7PR10MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c4132b-5820-450d-aec8-08df0a9e327a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CQKOYR5kta65AF57BOUZePz3D9yb9+7QlU9CADFJQyXMJ1qOfX0YvO4agcqvlErDNT6LbuAd+hXK7HdeIU29jSx72Ryh9MPz9l+CeRfHTBLSdizPneirWEKr8J/8V/dlEcHHuI8cJyxRJfWUXKT4/tWLs0Cdlm48B9ufth7O+1/yPZqnNnyUTBpCx2I1/yuvh0TP2OiFnnhyZJf0nFX1eS3CP7PMqHwnvoO4oDLUTi1FCmXLgiBIjEX7mOdBZSHTj2paR0QlYLdn7ZvOtBzlaQ17IbJuZcvGrY9g5tJEjY9d+LhzWNf2pRdLi91SFDwDfcWgItI04S5yCxq95EF8oh76qHNNyCEwGFWj+0slxptquZ4kma98KSUu75T2yWP5sKCi9Q0w4/urr6AsPg6Nt1FQT+syBU9rBp4Hr8LD4BIm1FtuK/5akAsOon3+Ag25sVu5a8pjPXoxbASMVDvwuRCaJ3xUPRCQGtbxIRRdKMn4ZEXwgDGJAe3PzPRr2OMotqgNZ+HTWGytDtlB2axmHTv6v8ncywUrYzKR3qngCa3FTTpkUoajmx5lV3ORkYi/qU0pNqdtdjPkrso762nTvReQqkTjUjVSzb4igSI/BeEBnHobuGjtNhYFgvuDVhMaO5ninnnwUzCBjxbX5VDhe82giSwSRJ111KhFxMktWoa69i9xhawfVLE8TLPpnGwUZq1g7lc84S9BVY7Bt5PunQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VWI2wqUl0cOTSjEAasjG0lZZavhQzWpEOE+vHhJfAjHOtbbp/H71voTV7GDTat2xYuRXuvQafllmLkdHAGobpbLHHULxNSL6tzJiwzYm1G08+kmtLcWG9odlLdvs4m1DfyfsAY49Zk7t50/6TP82hFGbFiElURy1HhwKY0EaWF+kmuH7vjsVhlLDhx5gbiABK3pkNVI903vGQ4pVt+TKGfcW544KuhaKk8Tkre5OnJ5aof4FuftovYtrgLdArab6ZRG77MMKdzd4Y6wgzD3CTvuA0tnW1zV4+oJiK6hWonGMRlUszLF7bXOJfsbOEbKqYUAt0KmQR0cZh8sgoMFZMgMFzRHFWa1fgW1v3iuLbxpxd6w/LFkyM2aYKVYrXX+S/o99LbH37/ecXQA62d4grQymn3RXvyPLAVx6yHNjrWnzmZwHbrdTD8j27nsQ9E8r
X-Exchange-RoutingPolicyChecked: OW4gDPf2+xSt1rpc1nJ/4PxvSL6qryXbM4lWJWK7ufOnziJnaJLWkPZ8pRLCkPPSXrJ6yDjdkCqdS98MS1aBK+S2MW3OrXJvvSfmLJ2rEciFNumjJsHC0OYJWYL4OJdnnSuQz0sGDE3eztv/ynfaLUYdSjdW0Gsulgg1RM8wYg6lMwdQXo/5b/3hEnhc7+25aNnYSIOcP6kBfVqd0qb7A4pqAHKBq3iwAuNI39Wjtvo6HA2WEAqBHsiOcMwweGRJVFZokjGiUZgTOfBNay+8nX2EknQEGuP1vu5cm0kMOyxTJfZ9rTzH9PJpuMhG+KVbvVH/OHOo6A9rK9BZRR815g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 16:04:27.6554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c4132b-5820-450d-aec8-08df0a9e327a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026956.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7009
X-Authority-Analysis: v=2.4 cv=AfqB2XXG c=1 sm=1 tr=0 ts=6a9aec13 cx=c_pps
 a=GRGg88i0IYp+MSRJKvRoYg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: MSGMS2Ag5kIsl61lA6HOpgBz1cSaBrvl
X-Proofpoint-GUID: MSGMS2Ag5kIsl61lA6HOpgBz1cSaBrvl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfXxvpXZlqi7C1L
 4DbXAza5rfTMcpD/ieU8AyUzwcAbCniacdjnxN+lajIqQNajkceWZbbkHzCDc75qf/OjCBciuMT
 Wr15RbdQ557hs0U3fTryEVN6SCZ3mrTuOM7+XGwRYIE/OohIU+z1jTthiUPkpRKlzu9APTlUygm
 M5vMNPSWjsFZ2W37XilznzNGSxes3bl+w0QHCH6r14A28jnkbdgIX1ahX9su33VAqXUmITVn/Ns
 wU2NIygXregasF3xlQe3vjiy/GqkHL3F70Kt6pn2efXqENBE0yZ1T1kbeRUjeGOUDCI7Gmov5b0
 6zFjMJ+KxQmMqyEMFOZte/GdmXaA1572sulgztuZhe4XRIzZrdhEDmoC05tmimV8W08eGAy11R5
 06RnD8QJA1N0jJjHYnSkGzkJH/JwyYiyU3qeTHlEpmsfv1EigMZ3qnRdLIX8R42axrMVLbcWrGq
 U6kDFGV5raUxn4Hqc0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfX5LaidPiUuQ+h
 Y+xnOStg0VVn+OMQjQiijsDSwAuCLVFd4qo0fZopIm+711DrDQmlrjUgP9XWU+XqdHdDqCr738w
 H0kSbbdXSgvqYfXzmGzJYm7z8ofvA+I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_090438_513305_AB9C442B 
X-CRM114-Status: GOOD (  15.96  )
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

Hi Judith Mendez,

On Thu, 06 Aug 2026 14:52:40 -0500, Judith Mendez wrote:
> The MCU watchdog nodes have incorrect comments about being tightly
> coupled with M4 cores. There are no M4 cores in the MCU domains for
> AM62PX and AM62Ax devices so fix the comment accordingly.
> 
> This is a non-functional fix purely, for documentation purposes.
> 
> Judith Mendez (2):
>   arm64: dts: ti: k3-am62a-mcu: Fix watchdog comment
>   arm64: dts: ti: k3-am62p-j722s-mcu: Fix watchdog comment
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62a-mcu: Fix watchdog comment
      commit: 2be05265a197b915d113ed6cddcee31c5c6e3397
[2/2] arm64: dts: ti: k3-am62p-j722s-mcu: Fix watchdog comment
      commit: c22cb4aa8bb01d8be2501e2640f79f66e1c4754b

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


