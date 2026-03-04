Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6E2EF8FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfx+MSjVxPFosW3PhgfKPcE0JyCotNrKDWB8TxDQAQU=; b=YAmXzbDDl+6SY3Ag/3kUUiUfCt
	nHvfSkavgWVO8iASqtBxu1bxKqy0jJbhTXlcy+CpY7ZrxmHivlJJzmZ7xPyQUrTNA2Lo3Sw+K9P1N
	TBd72/+HP5gHovQwWCfs8fzCkZ13XIBn27YIHjyL+nZgkRqzSJD1Fq1ciguRDtFrNbm7G+hJ8AarG
	t6CJ2dHl7kI+tR3wuWOCk3DM6kO7Yw3tUpRkbvGt4JvK2g6NcKTR1r8eOgDmFXhRatvmFB9V5/ZD7
	iI0C34kcY3yLB2HW5yELGkXlUP+d99MuF6U5ezdkjrBzMNePAU6P5P60gnxsSxAJVx9G/Vc7ruzhe
	V5gPiMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoDt-0000000HZ85-1wgH;
	Wed, 04 Mar 2026 15:33:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoDs-0000000HZ7J-03Zn
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 15:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nfx+MSjVxPFosW3PhgfKPcE0JyCotNrKDWB8TxDQAQU=; b=Vecgipbc9b1tNPO83u3nH2vyBG
	AQIm3eD4aTBzCPDxmPdK2mtso9gJBt4HJi3ew+mZyU8sZNqbWSOiPVt7+JJN4bZWivH6NlIyqz7bO
	D97QfdEtz8LBmqkHtFbNsd2CAPztrf/+JEJmdvpIKet+vRnkEX9FrPZGg6bB5THjgWxbTly2CO6sQ
	WtuUITa7+3B7ttnT67e0hyONLZg41JAqrrUzClPBw4fQRIcSwPTAWIDDSflDrTdssyjYnmh94mtpt
	Q6c1E3PVyLEcbYIKVj/pGM8t/evGC3hROgPBEdbTuBtqRlG2olVGOFrcwapGusT5ShDpDPDmEKpvo
	n6Gguy4w==;
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxoDn-00000004x96-0uqw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 15:33:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNqOXx/5WxeebwUHPWdRcYdczNX7uUqUeRfN1ubI4eUxZ0hwB6+v3H6r2IU/Yf7FcTTNmTKF0SYVwoiaHGpqAzvwfb1kMrFjnGQReiAY5o0vYL5eYeH+8WgCk8qg/mpo5EXXESFIv7MfFdKIpzoXzrDCrRVNphLG8YWx49oQDc0zLRZ3tVrhPNaHDJUFOm6WNv9bcILSzlLi+xfkOMXSZ3eI1VmwhxvAxhsAiAtexbNiarkg3xbxFkLKfLWweoPnFbXzltS5UPkmOdqRXvkT/XmZWMFlVTOFCwQYpDytreHg4oQ46jpNiTKJfvU07KyJxF4Zmd8+A1MNf0okRi/Hpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfx+MSjVxPFosW3PhgfKPcE0JyCotNrKDWB8TxDQAQU=;
 b=Dwun/KTPodNFQ7XVMDmqxrw+tZWoTbstJ1CZ5WOul1/OWv1zwunISgym7YysNP2VEaM7B3B1FATYldcufbG6FUjGnjRGvON68YN6i/v+yPPopC1WnFRDRxHEfnNA2SYBTq8PKACJrSgMrSfywaEqseZywx5TUSsq+eCEtphJSkZMeaL3mzuNcNoZZBzoC8DXTTodvwPZnIYCu/i3BM+5smZxUDSXXJ3YvuoKfU2rEaJefQPpzcaK7/BYqbE9hFc1jY98Ual5Z8hvyyNJlNk5+alG4wA31DNI2wDCYFqfGT+IgB9mTk0hPdSQOOHnvdEsX6B9Vb5+YAbv+kiaSmKg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfx+MSjVxPFosW3PhgfKPcE0JyCotNrKDWB8TxDQAQU=;
 b=fRE7AH3St0gnsxXVLFJb4R/QrXRsYyt5XjSk4JzJpR4yPMPSvRSYQj6FTBfqsl47V1zFjDh1/69iHK4n7mTH6LEuT+xU+RxN/M4Yp1jtTBMTARji+y58wiCTrVNaSX9vYpMjOz/15rBKDBFdUvLniFRsRxRKQnlsgaiOhSPDh4o=
Received: from BN0PR04CA0203.namprd04.prod.outlook.com (2603:10b6:408:e9::28)
 by IA6PR10MB997608.namprd10.prod.outlook.com (2603:10b6:208:5dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 15:33:04 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::2c) by BN0PR04CA0203.outlook.office365.com
 (2603:10b6:408:e9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 15:33:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 15:33:04 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 09:32:43 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 09:32:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 09:32:43 -0600
Received: from [128.247.77.204] (a0500327ws.dhcp.ti.com [128.247.77.204])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624FWhco605514;
	Wed, 4 Mar 2026 09:32:43 -0600
Message-ID: <811312d5-a48a-4ce9-80a2-7c04d0b34a67@ti.com>
Date: Wed, 4 Mar 2026 09:32:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add ICSSG0 dual EMAC support for AM642 EVM
To: Meghana Malladi <m-malladi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
	<kristo@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>, <srk@ti.com>, Roger Quadros <rogerq@kernel.org>,
	<danishanwar@ti.com>, <d-qiu@ti.com>
References: <20260228113203.498839-1-m-malladi@ti.com>
Content-Language: en-US
From: Daolin Qiu <d-qiu@ti.com>
In-Reply-To: <20260228113203.498839-1-m-malladi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|IA6PR10MB997608:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d8e225-ac7e-4e9e-c84c-08de7a0353dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|82310400026|36860700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: iA8bmWxDXcbYoHm+XrI0xARvoIkV1z+tMGhlFylWxCdCqVHqJEP4RAqVOVkG1KwarLRQsRUgndQC8TiNvVHDsEPB8chvSgu8u17MMJtEhqwKiOL+4SnxqcRVhfpQvMb5z9lOwykEAf39sQ6j5xSwkp9JVVSGux9xyqMxeRPNGlIZI2yf5mO//YqFNR26gG7FTm0Qa9Uu+zUriCu8yyDKvI1Nfhfa2Nu8kpeNKjDq/K4DSyFVoUSfNSWoymJrWeDxhx8CxkLJpNkshCUeMaNR6kQ+H5V1Vyb2skYtow+so2csUsxk6kYq/dzPRwWiT0maC3YHWdJNknhWqgQmQy+JCosLDdBf7JAHQCoBARBOAq1IHmV+3BAStry8wC4h/KyojatJTRU+pFhkkUd/V/t+I8X9sv8QAnwhuDV8HnnNbN6sG6ECjVmX8YbWPBC4LlP2RvgV6zdOACjxXMpcTnXRiRKwnARMo9r61mL790UoEJQMqpJ/wYllRhOLbCYKFesv8SZeu1vnPu/TYt3wmM971ARnMkKs2CgBLn1CamdrYj4DIAqwmyDqidTl/jup6Hl/KgkOxuwDDtqv63F6fD/p0lnlIJ9BUY51KbOVpietCytweEpTVMDIaAWoZ0AsgQXMe8op3jiu7psJAuhk5eRx/8ndHy3iVwLuiuCb6+rnvPDz0A3ViPP37rL+mNOQChwV8rtvsjWSaQW38GFCLrieWseML8NVTJmlRK4s4BrJIcKAvlJEnwsgRwVHfMqcYnIn4QIZ22Sb1svpCzVhIJFTBubCJ/oa9IVCHbehU1IItaE=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZmgmmnFPKmrU4R6weLLj74t7QXlmz0mrOxGILwmUUrcsxMz+mX/KGy7+bqjDRfDRfdPHVocAqIGf4RWmmxNj1A2GPglsxAedhDluivgsLScxy2eW5bKuxgSG4su4Fo0dkz+65UvVvPfi3NlAiGknUPL1Xk7acj0GQrepWO/fY75luqFpFSeGCL0CnByGdixYX6EqymC4uyWoj1ndL2uaDXSZNjeIA98PMK8Yh6rEknniu1fRpsRasaHIikD2zrz9K0D1sP3IlBqDt7OSkcoxpU/723AJAE1wsDM6N6R9TW+zLPUP1fKzgo5eV/vTMl2lFNvFBKYmeWBnCdDVRBbkqNIZFv/TTBGOmQqSnAnmbz+2Mipd60apfIikqfwKOx0+Ctpfoi+QXvIycdrv9hTxgIRtozCYDvsYKbbg1HyJM7wMnVWR1BNIqarvvJ36+ay7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:33:04.2542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d8e225-ac7e-4e9e-c84c-08de7a0353dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_153311_357082_0BD06EC5 
X-CRM114-Status: GOOD (  13.93  )
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


On 2/28/26 05:32, Meghana Malladi wrote:
> This series adds device tree overlay support for enabling ICSSG0 dual EMAC
> on the AM642 EVM, along with the necessary PHY driver configuration.
>
> The overlay enables both ICSSG0 Ethernet interfaces (port0 and port1) in
> dual EMAC mode and can be combined with the existing ICSSG1 overlay to
> enable all four ICSSG interfaces if needed.
>
> The series also enables the DP83TG720 PHY driver required for the
> DP83TG720-IND-SPE-EVM daughter card used with the ICSSG0 interface.
>
> Meghana Malladi (2):
>    arm64: dts: ti: k3-am642-evm: Add ICSSG0 overlay for dual EMAC support
>    arm64: defconfig: Enable DP83TG720 PHY driver
>
>   arch/arm64/boot/dts/ti/Makefile               |   4 +
>   .../boot/dts/ti/k3-am642-evm-icssg0.dtso      | 203 ++++++++++++++++++
>   arch/arm64/configs/defconfig                  |   1 +
>   3 files changed, 208 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso
>
>
> base-commit: 4916f2e2f3fc9aef289fcd07949301e5c29094c2

Tested both ipv6 and ipv4 ping to be functional with the following 
topology.

DUT 1 eth3 <---> eth2 DUT2

DUT1 log: https://gist.github.com/dao-qiu/f261147110b6b05d1fb989ee74e1d694

DUT2 log: https://gist.github.com/dao-qiu/3add536e2370d6afe36145f46df784e6

Tested-by: Daolin Qiu <d-qiu@ti.com>


