Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F92606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LR7Xj/8+;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Nts+EciN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XVOmzA8lLdzcCx5tWR9wadAPkDM0/IBbKgkI/08OomY=; b=LR7Xj/8+foiYVH
	guY+ZO50C4DHKA8lauPXLoRzR0kxaVGtEAAl1t+SphSvhCHuOldPaWzqTI29rQJ05Wt3N7Bxk4tnq
	6XyF5nH58qEkSBQYyF38XBDtcKeud97CvkRqmlrTdVxAjoD3Yv5952rO8OIFONxu91IU2EW7t8zJm
	uTmEavxRnPKoL/e9BT6/d6r8Q5yey51EBfbwx4YyjCpZWT4mqZwWB1yTMro9hFBCCdDciC/FEN2Da
	VQ/FZuoXvgKn3MwystVvI7YkdYp52UEao0bR2j3PeEZn028wvILgtko1IZkv7UjPRHdJEuIFxO4JB
	vSllyfowbbq31QEHcInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgR-000000087m6-3ApF;
	Thu, 05 Nov 2026 08:18:55 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgK-000000087hq-11Rf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:18:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpqQTGR3dxGaWorv/DMeaS5l6HWV6Ib00i2HYb6S0ASz6+1Bvsa6wLLV/g3Z4tkBGlu0BZ9F0R/kZu3a9mKCAqrMQ/2YfQP0SfuQ90dnAkD188JCZdg2Gzt8oREwLm1Znkb6NRmELxZxJd4GZjuvVJ8aFJ9tGIuZdccqZv6hSwqFKwqw/X3C5lADt88i9JLMubpyMdBU+nWaiZoVB2rkRNxCnEXydECb4saAnkf+/UzuD9k6AFseun+aGudVD8vioUjLavMj5pUSARde4YsfyNNB0y3qLlvAP1h2ukOdtHzvI1cpjTaRUrrWRXZoBbfGHVCLi9eEaBgffNLy+bMjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVOmzA8lLdzcCx5tWR9wadAPkDM0/IBbKgkI/08OomY=;
 b=Bt19CySFtyvOkRvt5kHkBYXNSymjIfCAjcbM2bvtDS0BWW0DUoW63u+Yua1sxGpLvl1KINdhvbP0qB8KgCpkVaWhJRFfMywZ0z1k9LSA9ITkUybFa9FT8u2eSROfqrQOkpveYlhtpWivZr4CndrXLG8HSYNhI54rVbM1CrI1kfR+tbzvP9nOfTY/ySZ9FmnaGKZCCIHt0k7ANWk4yJvhHG1uL04rvTERYCwaIaiq7TTMtoFf032LTGUh7jYKNPOUbvTktJ8qqmJhuheKsleQP+8NA+SdxI39Y6MHoqe/i2pmKkp1/ba0e6Bpgr6Oaz/sGIi3qKT4PluCgI12MQbAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVOmzA8lLdzcCx5tWR9wadAPkDM0/IBbKgkI/08OomY=;
 b=Nts+EciNcvxSmIpnTHpuviulD7CqADFtfEu5nySTNl6GKyCjDtxEMft3o3MSL0Iw4+tFXoPDVhiCVinwtLX0CXPvfEdAMDqR6t0qT/iDYZKdGMfUVt38taks0ELMIKdlou9FVEnzg5r8jmj0ChYAPepoH4J3GaWAcRtP1+5Ttfu0vC2ax4hJ/pEFqt0SH9I7TI1Rey60lEXkHHTCeWNVd2AhOWDsqdgBneIWSxTnmZWx+PFweFS+sQam2mKRV7RtSWTF2jbyyGe20PSmuyp+GDcfTt+zsCnQlqnaoMql9bsQ4MOMlAFOfk6rsQ1sOMKdXApwU5TRaR9vqQstZP0pQQ==
Received: from DU6P191CA0056.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::17)
 by PA4PR10MB5730.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 08:18:42 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::24) by DU6P191CA0056.outlook.office365.com
 (2603:10a6:10:53e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 08:18:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 5 Nov 2026 08:18:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 09:19:26 +0100
Received: from [10.48.86.101] (10.48.86.101) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 09:18:40 +0100
Message-ID: <52ac2ac0-c990-4f78-a1a2-a5f5ecfa3948@foss.st.com>
Date: Thu, 5 Nov 2026 09:18:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: st: use sdmmc2 pins_a on
 stm32mp257f-dk
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>, Ulf Hansson
	<ulfh@kernel.org>, <linux-mmc@vger.kernel.org>
CC: Russell King <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
 <20261104152657.14909-5-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Christophe KERELLO <christophe.kerello@foss.st.com>
In-Reply-To: <20261104152657.14909-5-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|PA4PR10MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bfed186-a32f-4b4d-fa29-08df3b15671c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|3023799007|10067099003|22082099003|18002099003|261022105027099003|4143699003|11063799006|5023799004|261026140227099003|261021121427099003|261021123027099003|56012099006|261009223027099003|261102123227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: Ph2o4Efh/UHCMdcTa8XQz/WFnKO+D+Ev6pUlDXC2agAUMPovjXio0p2Dxb8xg4keEi6XCynbCFt1LDsdgmj7MTz6Wy4HTXTDZVr5PTdbmQ2tzRUzibESU4T8b8cbjQTp23HVWIixqB0PsvRAnMBvOB5jn7L7XUV2TeflyHqI+iNeYjyHiV+QJXwCJlIkMsDy/wjEsrxX80+ePlJt+EtUQA5x+w6RRcrU/he37U31ndVRuNSvF1xW3N9tZnerknTDRH1K+fZPawcYNoXKy5q6naB53eOxUgdK0d2Keu9jjS1wpra2C2jbUZe/7JAaKfaalrjD3D6rj1MhyNzJQIl8NQIurHCehqniqFvNbVpOq0QBxzvJlAiw34HOI/j5UMAHyss5jCHoPEK2E61l1kpWc+gLdHtQ16pKZmAZCP+KAGA+2KJMTmzAi5wzyxs5hX8DaL+vm31NxaozPfJtOXGo6joe0SGRj53Q/fvp6zRTMbCBhQ4I60qG7n/PsVAF3BuDzCUfJt1rIsMB2Cz9Sgeix/1UTocrQaPdX428d6l530RZ+KPI8cxc0n3CkFsfld2H0rIMiI6XvOlUeL/IgG0vmwIverNYWxRrcaEyFsZ7dJtYJtZd2NCIgfSmQOi6Im6t0fULbYqg75iaSCXbI2qLzce92Q5UHzIDmd28xOSRY1FCtOdm7iYO1IVDIoPSzPRiQKvbsPZ0jINLaS1m7t6ZFw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(3023799007)(10067099003)(22082099003)(18002099003)(261022105027099003)(4143699003)(11063799006)(5023799004)(261026140227099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003)(261102123227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jmt4WYB9fg90/aUC3w1IzbtfGcJ9LO7CxZVMV4y6oCzQaUR9DH1piPgoT1ED2ogr86pcidvn4edc/Vm4BcdQ+nSb2bDYaFn+rJ/QhVOWhEQuv4ptGTkMnFpQW5p5njdS2v5qzl1c1ILYeH0E509m6Yup/U3CzEyNcHtK/JJUzQoMKdY0vwrgI9h2/J9aOql7ILKmxPmaDZ0rrF8kq8R5FwfQLq/O+v1Q1IIqJbRGiS8LLy+U7ZMhgQlMWo6qJYJo7264yFnXjCmdyqU8WDVazAoVJopFhFeqeyUlKkctNxbhaMXGO5FHxJ4pGEVuL6DouA0+fpJIvoMl4fHh6jEddyeOdbu22NwQhhrpzI+klEqX/89GW33UH2O6AL9EElY9UTntnxua5jyMZvhwYSm8/1B8Q74yphiyEMCgYcOxkaTpUPqpwOd/zcrC8TXEGks9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:18:41.8996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfed186-a32f-4b4d-fa29-08df3b15671c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001848_464062_380618F2 
X-CRM114-Status: GOOD (  12.72  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Mateusz,

On 11/4/26 16:27, Mateusz Nowicki wrote:
> The eMMC of the STM32MP257F-DK was moved to the faster sdmmc2 pins_b
> groups because HS200 at 100 MHz returned corrupted data with pins_a. The
> cause was the delay block, which was used at 100 MHz, not the slew rate
> of the pins. With "mmc: mmci: stm32: use the delay block above 100 MHz
> on stm32mp25 SoC" HS200 works with pins_a at 100 MHz, and at 150 MHz
> with the delay block.
>
> Use pins_a again. Their slower outputs avoid overshoots on the SDMMC2
> clock, which can disturb other blocks such as USB.
>
> Fixes: 94911ce62b45 ("arm64: dts: st: enable eMMC on stm32mp257f-dk")
> Suggested-by: Christophe Kerello<christophe.kerello@foss.st.com>
> Signed-off-by: Mateusz Nowicki<mateusz.nowicki@posteo.net>
> ---
>
> Notes:
>      This needs patch 3 of the series: without it HS200 at 100 MHz loses writes
>      with pins_a. With it, the eMMC of the DK passed every 832 MiB write and
>      read-back run on pins_a at 100 MHz and at 150 MHz (see the cover letter).
>
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>

Regards,
Christophe Kerello.

