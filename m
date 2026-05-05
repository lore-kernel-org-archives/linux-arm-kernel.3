Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E260CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7kLP0PQrJtK3Q7u9zO/am+SX6sltmoe9Y/5+xfae7g=; b=k7r7nfw3fdnPPmhrTRt5zkvGsO
	HQT8oHQgzG+pfD19ZhD2baekcQGbka17FSHaoVoN4TMm+3UU7D/BXKmceiL8bfo8ZlL/yEbstiPMg
	p0xqyoXK5NMfXAHL0sI97jHZCxy4ncxshjBxFFnGFVejAoss4FVqgnyEhvyZ8cdCBo7MN838avaVo
	71Z6B9b3ZSmmKlukmVh37raVnX2bLFcrN5I5l6hnxk7Ax8D9zmVKG8quE07M9jtE0JW+JA5gMOGRl
	faG/W3uKV+WZbLOgmuKZDTa3TK3NdzrDD6FtOwNx+4FnnHNXsa3a6WX3jJY+4kyOsLyus26juMT9R
	lr8F18iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKE4i-0000000G4J9-1GY6;
	Tue, 05 May 2026 11:36:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKE4g-0000000G4Im-36li
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 11:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u7kLP0PQrJtK3Q7u9zO/am+SX6sltmoe9Y/5+xfae7g=; b=HVsu2j9ZrGZTGCjBKTNfw3fl2X
	pC4HdP9cxFrA0yyyYBB+P5VKqD5uGpE35rvP/B2p++oQfJPmQz8VmKWNIdE2pPaYoZ1hKtm0AGtMi
	RaQT6xkCOCDsYKzyDDbh9PFrY8VJ1qa2Wg4SxsMpCKAT7OsYidIjAqRW+F0fhQjAAPMEnRF/mEV7C
	fWCe8QsGYm5mmePGDxNUBeerK8Rzr1Uk/ZJyoCjtWkoy+zXZX2NajqTRoFUfqliS5U7RUjvyGNBrk
	mEk9hJbOKetsdv6zXM3WSbEQeGJf2b33I+QQdp1j+eoTs3YWeojP9jWfKo/av58X2q70mal/3gzWB
	8eE80tXQ==;
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKE4d-0000000DOQf-0nco
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sh/azc2OdH7lToebbC/7GqG1WVe5tTYrUNo4zUmP1G/AUOO71PJNVGwCC9VMim91M2PINX5xjDJm4rr1XmSg9ouksCpH128trFPXQXD1Vq9ZPOA3oPlip1lOHFCuxiKdg8iPa7zW+lnI7MW2pA9/MzSUoEXtaFsHAXu5kLMpJZX3yq/Jxa+h3weWn/dcghcrtecqrYTEm/5UMBTEhv59VlqvffkWskVhp13WvSwlZwrKO1cBnYG9XbVxkCxafEIvpkYhDpzyNb2In+12nNdz7XlHibsGT8jrBwLkOSLRdJgorbZTNESMl3/LFUbPlRwojuh6xmkxtuacqAnA1/MrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7kLP0PQrJtK3Q7u9zO/am+SX6sltmoe9Y/5+xfae7g=;
 b=ZwDcvnc/PIXucUXkHU/puWe86vExDCP3BBeG1SZrJB4Oi+E51K5ApwGkkp386f52vzn+vRte8PtBYUdaOjuqKHxBbeB8uyNTG2t+FWqe84HSjlpvvKRHS6wDuLG+XVSEttUJuWdPXIAf5GFsZ5T54WRcoV0W7+ibQv9e3WzB9vZSoOYHqsi2PXNQtycSg92m75ZKJ7i17BfLaLg64XAjxgE78JQnQnFstgnGw3BEpg/KZP7keQIYrmdi7c7m68MUBYfYa7LVgnkqNFajBqs3zJ237gaI5BJl88sWkDlYmRT1fv/e6hpFxsPoYrbCfPOlxhm+c2/plHpctCbP2Zt1ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7kLP0PQrJtK3Q7u9zO/am+SX6sltmoe9Y/5+xfae7g=;
 b=tEcsLW0Fi2iX2ec/IlX3i2NIk5lK5KdBkjj+/LloKVqEE/KTASjpKYO7swjfoGkC3TqMnu4rIxIeE/c3WM9gsAbzhPJ0oiJjAmQPJWVswBZLDRib8v938YX8ljO9ZdmwLixSKN0go2hnRndknUhUXBXDmWB2nNOttpHFYXRA6bE=
Received: from BN1PR14CA0021.namprd14.prod.outlook.com (2603:10b6:408:e3::26)
 by SA1PR10MB6566.namprd10.prod.outlook.com (2603:10b6:806:2bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:36:14 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:e3:cafe::fd) by BN1PR14CA0021.outlook.office365.com
 (2603:10b6:408:e3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:36:11 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:36:11 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:36:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:36:11 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645Ba4Uh2876057;
	Tue, 5 May 2026 06:36:04 -0500
Message-ID: <b828d626-3ff8-48da-8cb1-e151a352351a@ti.com>
Date: Tue, 5 May 2026 17:08:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <josua@solid-run.com>,
	<w.egorov@phytec.de>, <matthias.schiffer@ew.tq-group.com>,
	<d.haller@phytec.de>, <francesco.dolcini@toradex.com>,
	<joao.goncalves@toradex.com>, <emanuele.ghidoli@toradex.com>,
	<ernest.vanhoecke@toradex.com>, <rogerq@kernel.org>, <eballetb@redhat.com>,
	<robertcnelson@gmail.com>, <afd@ti.com>, <u-kumar1@ti.com>,
	<stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH 07/13] arm64: dts: ti: k3-am69-aquila: fix USB clocking
 for compliance
To: Francesco Dolcini <francesco@dolcini.it>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
 <20260505110631.1144200-8-s-vadapalli@ti.com>
 <20260505110825.GA69476@francesco-nb>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <20260505110825.GA69476@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|SA1PR10MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d00c8e-f9e9-4243-1277-08deaa9a8248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: JsaNa+hUsbnbKaj5Vk+fUukARGQ0azREWSrfceMCEgnjhuajOb9dc6brRh8Imk3DxhRmOV9zPmQj5q9GkF/WWLW0RRDYWxgeNEEkFINP9+mWp5aISnvDamA/rJ/bBfIyjnaKc75/wPhxDn25d3boX6gq+8/lCMfQ1THGTj3w9a7Mb2i4SfUdUVzEfXSolrwgqle0MuhexR+WQq92ch+ncejuBc/so59bqPe/tpImYM/sPHBfcSY4LZMFYG74zVlEHaOiYxUVBi3iHHIIA/Nq169WTUa/0C7DPAKT4G8y0zQ8smbJN3El8VlfkW5YoVOI86jj7x6flZ7iEyElY2swsoFUMkw0l7MA0Fk8Ls+sy8fFxAvelf1FjcZgKoGiItZmvy/LDu76C1+Ux3oCpFt5OxrIJVzOKTkEreHSGNwzR0VdH/CB1gc+F2s33ApwYUxdR/KWfFL5PDHoPtHt68jFZMSdPeKNdsSJdKQ6kPnpQR0iRVtc9+8TdNLRAmdJm5bUzpaSui/wfWOWPPecW1feLjf2V4JqhHzQ2BZZnwH2X76veteKdAcJysWPepX0lWEQnFZjwIdyH3d0WRo920UxY+4VE1y1dHdjw0guSoe22RnOecUBYCKoJa2+cLlDhPbhYZuH5BQxaq7IgYMC3Yms0TIAwCfvxTZ9n8J953MbRXwxkA52uE5zxZZUbw/uEM4Ca0W7vcoOxsdvaO5sMskvJqE9YD3i5S5hlHu8AU3DGn8=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w0yNh7RL2zzUD+zguI3SrscPpGpefHqnBV2ryt980etvcE43XkutmMFC1Ke7Ukz2zHmmZ0OX5l0d6yAnSK/cfjWiT9LrMAGy8/CBueLfEszq+IgGYUgIUaVphqtuv53E40pdw3cfF/71E0Fe4b0P3K3tfcXPwYLhaeI0ZoMQvInvCM0eaGvdR4qVjiM9/Gi6udFNEM7Hmhj9/eccth5sKPPCwUJXD5W/jfVZDu5ApT+3PXYEtD6822/Z+eFG4yf2OujIFEVsSiBP11OHup1eDLLvkJ5IZKWLSZMKkfh3FCsOGCxVckXpIftZFMYS+v6+u+ti+8Thk7MnL3cnrP1kCZyHqxlAbd1NM4hlQ9wtxNhcD0TQ5L+KaX8SvGwcYa/WNWs3efrMYAboChO6RfBRftlMDinBV1hSSJ9eNbDGBbwbGaKC1NKCS+sO4ywc7Rdf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:36:11.9436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d00c8e-f9e9-4243-1277-08deaa9a8248
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_123623_540132_71506A7C 
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

On 05/05/26 16:38, Francesco Dolcini wrote:
> Hi Siddharth,
> 
> On Tue, May 05, 2026 at 04:36:08PM +0530, Siddharth Vadapalli wrote:
>> According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
>> the USB 3.2 Specification, SSC should be enabled by default. This protects
>> against EMI violations. Hence, enable internal SSC for USB SuperSpeed.
>>
>> Fixes: 39ac6623b1d8 ("arm64: dts: ti: Add Aquila AM69 Support")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
>> index 5119baf62a4c..7c98ee81ccb5 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
>> @@ -1423,6 +1423,7 @@ serdes0_usb0_ss_link: phy@3 {
>>   		resets = <&serdes_wiz0 4>;
>>   		cdns,num-lanes = <1>;
>>   		cdns,phy-type = <PHY_TYPE_USB3>;
>> +		cdns,ssc-mode = <2>; /* 2 for internal SSC */
>>   	};
>>   };
>>   
>> @@ -1502,6 +1503,11 @@ &serdes_ln_ctrl {
>>   
>>   &serdes_wiz0 {
>>   	status = "okay";
>> +	ti,core-clk-sel = <1>;  /* Select internal reference clock */
>> +	ti,ssc-enable; /* Enable SSC */
>> +	ti,ssc-type = <1>; /* 1 for Downspread */
>> +	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
>> +	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
> 
> These properties must go before status. Please see the coding guideline.
Thank you for pointing it out. I will fix this in all relevant patches of 
this series and post the v2 series in a day (to allow others to review as 
well).

As indicated in the cover letter, I was able to test this series on all TI 
Boards (EVMs / SKs). It will help if you could test this series on Toradex 
boards.

Regards,
Siddharth.

