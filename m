Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9354BCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8nyJ+3o2BZ/4llvv1lr9o+i/XLkw2hdqn7SLBdJJkU=; b=P0fBPBI1DzcEtFTZazsxXOcdAu
	feilBPKt1zm9GtiR+I5TCy5nnKjrHrbtsZ00eg5AXErwAh7WmkDRxsuqzOY3AbbOpMmRjBiPL8561
	IpbN8JFOmkW0RGQQeRwZ9dpTDaqfGQnGjGSvXeLghrtgwtO46F9dpJFh9HNT+yQ72MKSS0e+MoSgB
	NbH91p0S3sbDtSL0XtwJ4hbzqCgm8Y6xogEk2H4xvZGMC0rAoQtBFxF/MGeTRj8vvCENLdDmYyeMl
	8sX3f6VFlpc7ZVwQO0XfADxg/2Iyo24Exc8phe8vSKhi/85p9urjn3kZ7kDahPgCi6+aogiwGhZNW
	Ovaj4xFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ9E-0000000DTzp-1LmL;
	Mon, 27 Oct 2025 09:04:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ9D-0000000DTz4-1cfk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 09:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=m8nyJ+3o2BZ/4llvv1lr9o+i/XLkw2hdqn7SLBdJJkU=; b=cIejH5ZryN5Q9ONz7BV1sACj4K
	C+41/TEQMqLsp/Mu1cuZNgJGbtw1qBs4WCcfE9C3/NCcUTgDfCbcIdE9/eOqvtkHshRgItaYgOSlN
	IB144/dnh/kolOyD9dowRX9uKYJZTa9FkGa36QYuW4x7dbv+82TJ5ThnVQGm5xlTBFIH+1/0Md1Qg
	3xCSYq5fKwOhLCuO41px4bTu/8HvasskYAqRoaHnSA8vcG/q/ogeyRJTdHuRK/SEO8Q6KzyVs8Vuh
	7Th7iB8xvi5+Ra2y6Mr9xbSeFxmo1eazFeiw//k8maTI3qFDX6fc2cg6pPk5tNWk3MHu2RqHqqBYi
	VQGGPqjA==;
Received: from mail-eastusazon11012057.outbound.protection.outlook.com ([52.101.53.57] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIHP-00000001gr1-3Dlw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:08:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdxKaC3+WErxQwqLX6r6Ah9h8AazZnBw4yz6Uby2KbRJ9+ewEj9s4FQfXzWCl6QdqEB6h37/QK3OK4XSD56snojVvRRvSZg+TlReOC7rIfn0CeOXLzT+PmDvKwlGHisA1x7th3YFkTtDCf7IaKfAybCBeboGPFO+sUHJj+B+VQLaIFQcEfrql9t2mfnaAVHL8qh9afWt+sAi6n9KV4d2E86ISeOeLYa+O6xoIpFyrB2bae1K3eIvpWGUHpX7Vhugccs7u9BypUaiCVWFjVuOhxcBrKf0Ki87jMHDikQ/tguaXLQ9v+eBrlujdxSEe9/REcKjElMkY+OprZccSUF/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8nyJ+3o2BZ/4llvv1lr9o+i/XLkw2hdqn7SLBdJJkU=;
 b=s++wQDnT5gCJPAuj1bBTvoelHP8ImcoPSyXzIrihBZKZ5lcbTU57bxf5SyIWywzGnEG84d8DyCx1YKrQClnuSEiLvEYTP2BVub+y/WNDbF4/HQAZWRf7O0xwGmnPBLhkqQ/KPsErOn7Qa12fxgegVNFs2wlByRmRqaIvnFfyO3RdzujKzL1U4xlmQG57yaUAuMBzddm16lWUEtNBVbIf28KLB7gmW1pw1F4d4FkwS2DG2rzEkrk4sEEAX0ZrpVppHgxu/VfgJuzszwy4QjV5ec0l7hk/fU8Iza7Ey6Q5vAlJn7fi6ZXsRjdioqvwsHhKbQWb/G8UU53LZ0/GsHZWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8nyJ+3o2BZ/4llvv1lr9o+i/XLkw2hdqn7SLBdJJkU=;
 b=KPkvJtUUY5mgRKu0R0rXCiI3p+TzdkleMmfsQJT/KlrroZfpF0uQlqUuQqOEFQLH79qjQAsTwM2Kf2wrDaaYneyDgfsaFeie15/mFlJ6v2qsWziK6wUr1rA+/RyUD3g1DyX9/4QrxBBjltZkMbxe3v0PDH3pKOgJu/vmdHhkGcIXiaU8lWM9k2kqGKB1jbcq9wTjDebSGBx5FyBKPywyF88tz2ckPJWcH0s01QVZdZioT7BZu85csF7ASkKWXf8WTuKGJVTS43c4O/8nXO+GMssJzbk6IlF8FK6ItvL/LiRlz8Ez1oCboSElZ6e10iI4PKHrwfIHSQ5/ROcsHBMxpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by LV8PR03MB7352.namprd03.prod.outlook.com (2603:10b6:408:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 09:04:04 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%4]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 09:04:04 +0000
Message-ID: <16d25a4e-e678-407f-8ee3-59986bcbbc28@altera.com>
Date: Mon, 27 Oct 2025 14:33:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthew Gerlach <matthew.gerlach@altera.com>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|LV8PR03MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 015fa3f7-c235-4709-afe0-08de1537c738
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWRMNnB1bWRyVWJpS3pHQ0U4S1dwWFNWNVpTQWh0SjlBdjJPWXVPdjVlaGYy?=
 =?utf-8?B?dHNrNC9lTjlJWlNIL28yald3OW1VWm01VHczSlJadEV6dktXNHJmakVleWNp?=
 =?utf-8?B?QU1WTlpFV0NQWG5sTWdQUzNhUmZCNXZQVmFEY1dhM25UK1dmNWZSWDF2T3Bt?=
 =?utf-8?B?NFE0cDVUNjVsYjdDREVudHcwQytORUkrYml6L2JoL1pJd2FjSTluRk4rQjN4?=
 =?utf-8?B?dGd1ZnhlamJiVG80eENaK0lNemRnbmVQdU5BQ0Yvdm5tM0h2UnlkaVdWaGRM?=
 =?utf-8?B?aVd2MWYrUTdNNUJadXU1Yk1HZVBackpDTHpBRC9iSE82bURITjNuVDdwZzVK?=
 =?utf-8?B?NzlhRkFKU05USEZ1NzhPMXEvNlU3YzhDV1p4SnVocnNKK2pkUHdJTmxwTEtp?=
 =?utf-8?B?aDYzSk1zeVkzRit2ZHoxaHlmZHNUV1o0empodVg1azVydDAzYVVhSUVlU1U5?=
 =?utf-8?B?RXdmYkJSVU81bDk0anNzRjJFM1FFSFZ4K0lRcFM0V3VZNmdTcVVtdjRpVWFz?=
 =?utf-8?B?dkNnM3NpRW9xQzlwYTJoZ1p6YWlPdE1tcEFoOWI5a2VISlA3dGo4OW1nZmVp?=
 =?utf-8?B?NmhQQVVDR2JOaEFST2JjdHdEWmlFaWhGY1pYdS9JeTd2cTcvK3dWcnIrWFpp?=
 =?utf-8?B?ejhhRU56R0dySEMzSm9oS2hJbTNKQkMxRkVUSzdHelllM1ZlL1V3dmROUEQx?=
 =?utf-8?B?cWZENGRPaXU1SFRxcFZjNTVjRm9KcHU4SVFPcllvVFNsQndJamd2dTZ3cWtE?=
 =?utf-8?B?MGxEMExmSVgzbXNqMEkwbWkyMlU0ZklJRXVaY1V5LzJ4c3Zpbjdobm9qTkRh?=
 =?utf-8?B?YmsxOVI3cSt5Uk9NeWhLY2kybFRZYUFYc2ptUzdqaDVuSHEzZDZnREswUFpO?=
 =?utf-8?B?Kzl4MFVjMmd6VGVIeGIxVGlVSForMmxFcDBYZVhjVm1TekhtZWxuR2o1a1Za?=
 =?utf-8?B?ZmxJTW8veENiZUlaUGRuanNLSkMrWnhzN1M1S0JlTHlhbkh2VkhSM0IxcGtL?=
 =?utf-8?B?aTgrZk5DTTJya3BSdm9FTTZWM1FwTXVFeUx0VStrRS9aelpyY0NlVndOWWVi?=
 =?utf-8?B?Q2Q0VlNuNE1mcXR2c3BOcExvQkN1YWxRYzhXVHRzaDJMNGR2a2pOQ0o4OUJt?=
 =?utf-8?B?YmI1TEUwenUyV0NlcnFpL1dYZ21ncUNMSHl3N2hkbDlyWHppTktwK2tCTEh4?=
 =?utf-8?B?eE14R1JoSnNKT0kzWHhkRlp1ck5ldy9WVWpYNHZMTldXZWlUaHQ0djh3T2FO?=
 =?utf-8?B?N1NUWE9QQ0dHL0N4dGRURG55aDRkeVhxQzZGNFBUM21rSzFFUzY0b1JDc28x?=
 =?utf-8?B?ay8yUFE5MGpJMjJPaU12K0VTVmhjalZxMnZPR2ZTa0o3Uk5LVGR0MGFPRzlH?=
 =?utf-8?B?YW5rWEcvS3pUWlk0Y2Rvd0dGSndLVTZORndkU3NFWWhFN1lZVFQ4azlwQnBR?=
 =?utf-8?B?MllWQ21BbWZiRlhRK1NkTWhKSG5GZ29ncXg2UndkbUxoaDNZdG1vSURvSks1?=
 =?utf-8?B?OW9YQVlZSmRhWTc2dFJzdlV4eTZWZVdOMkk4b1l5ejEwT1gvdnMrZWY2a2hr?=
 =?utf-8?B?Y2JIWXVCTTVhWXhVMkxUVUNNWFZMQnRnMzB1MHduZTdKN3JDMVlCeWJ6ZGwy?=
 =?utf-8?B?MEtmejJiRktVdjlQdGRIeWlmM2R0SjhGMFBVZzJ6aVc5UGFrbGJWaWdUYjNi?=
 =?utf-8?B?UjJBaFRGLzZETDhRdWVpR2M5dFJtMlppSzdnZi9MVGdkN3RBL0xZMW9qR1lU?=
 =?utf-8?B?Z1VYbTlsenAxd2Q0eTBEWlNtdkRJL1ZzWkZJQlBDS0NPNW5FYUI5YUpGY05z?=
 =?utf-8?B?aVNmR0VVVUE4d0loV3dQQWVDT1pWSFRQSnhRNW5FVVNtQXVKbFNTMDNxVFhN?=
 =?utf-8?B?aVhsMldFeVUwREtlQ2V0U0VEM05QeTl6S09CMWVnTzV1K1RGNkV5UklEbFJu?=
 =?utf-8?B?bEgxYVhacjBKQUxoeDBCWFBSZDlzeDJRanpadzBLL3lyWnIrOTh6Zm5GOWVw?=
 =?utf-8?Q?6+LkcSlKXvStvbpQ5++WW2y/sNbi0I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5371.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1pVMVhiR0tRb0N1L0llSUJPVTJCZlhIRmduSGhENmxwemEvSmlrRExRYlFr?=
 =?utf-8?B?N3NMV2ZYMngxK1U5TjBTSk9SS1h5RlVzK1oxcEFoNlVjZEtrNjVza25OWnFH?=
 =?utf-8?B?d3VMMlRITEJqRDh1b1JiT2N6eEF5NUdhVDc0U0RhemZDVjNrMUtjdTJlb0xr?=
 =?utf-8?B?SlMrdTVab2VkcWkxSlFXYkplSHB5eHRXVkRyOEJyclU0KzF0RmhGYk5XUXBE?=
 =?utf-8?B?KysvUUxlTGw0TURTOXdNS2tOSGdFZ2hadkNKUTZia0FsZ29uVENNay82RUtk?=
 =?utf-8?B?U3BoTmlLZTN3QWRtYlVZMFhIa2ZCZkQrOUJLU2NCdkxodEJpUFJHNFowV1d4?=
 =?utf-8?B?bHFYT0JtN3RDTlZWaTVvYWVXdjRDdTZtR0tESjYwdUlPbDNxeS9jT2xMK3VY?=
 =?utf-8?B?RmpiSm1FVXFHZnFaR0NOenlHRitzQTg2Wk0xcWVITlNYT3V3WnVoNTNwMlVa?=
 =?utf-8?B?ZFN5SVYzWmZhajZ4MTc5NjJHMGprSDlCZUdTMythMHB5YmU5TGVLVGdHTDYy?=
 =?utf-8?B?emxNdmcwcGd6cUFXaGxNdGxUOEJLV1hxN2xMN0FHQjVJMWVmeVpVQzkwc0RL?=
 =?utf-8?B?UHdMbGtkcElGdG5RQ1lUdkRuQVFRODlqZHBKcWtYRWkrMzRwY2F4dlJaY3JP?=
 =?utf-8?B?SXlMR083NXZiOXF3R3hWRHArMU93SnRMelhiS2tNYzJnNnlleDI4M3A2Sy9a?=
 =?utf-8?B?VE56c0RGd3R5Vmt5bEJXS1VOT2ZyVUFRQ1MxYnpTWHhpOEpxWGJ6YzJLQ1Vz?=
 =?utf-8?B?UmpKWktxd0o3a3JuVHFPNlRYRitDOThmY21ueGNNcnlkMnFWamdUS2YyNzdw?=
 =?utf-8?B?REFwbktJRy9DcTNSMEhIbWxnemp5ZG1FcGE4aE9rWUhieTVjWlVWYmpGMWQ3?=
 =?utf-8?B?OURXMUpDRUJ1N0hRUWR3OWZpRnp1RnhCMmlxL2Z1YkNYQTZwMlVSd09hNHZy?=
 =?utf-8?B?NzIrTkQyTTIyNE9zV1pSQ1dLU0VjTTVDczlLdk5YOVBVZld2d0lCSWsxZzVr?=
 =?utf-8?B?bWRoWjlVdmc5NWF1ZmFwUUluMTBkdzJwSGZwTm5nZitkMFBtbWZZSE44b1hz?=
 =?utf-8?B?REkxSkxNZmdKbHVSeFdQWjBVOE1vTGp1WnU3blhzUDdUbmkzY3R1TzNPWDR3?=
 =?utf-8?B?ZDNENGtrK0I0SldRdzVYZmpsSk1TSElkTjhCVjhraUpmcUhhV3hiL1laUE5z?=
 =?utf-8?B?UVYzVmM2ZUh6ZUh6bG80a0tVbHpoYmRkNHM5VHdCcFlGcWMxU3ZPRC9uTXVK?=
 =?utf-8?B?NHRqUkJYWFN1ZWpUZm5rMEhXZndDejlxclNtbGdiblQ0VVR0eWRQc2xUa0RE?=
 =?utf-8?B?ZGNYcFBCT1BTUERmcXl5dW84SFlTVVdqVUl3aXNqL0tGOWpmVHB2Skl1ZWdx?=
 =?utf-8?B?aUtDbDliUEJGWG80dDlaeFA5WFVyUVg3U1BrMW5RNHRTYzlyeFkzUEE2K3NX?=
 =?utf-8?B?TTRYZlU2Nmx6VlVad1FQWkNRcmN6NDY2QWJTYzFQZXVpUzJCRjJYd01KSk1a?=
 =?utf-8?B?K0x0ZnZKMy84SjJLVk1rZXVNQXY4Um80eGxWVzBNRXNDQlYvSkNlMWFNYUdL?=
 =?utf-8?B?OEx4aTF2VFo1eDZDMnIrUlhxK0I1eGQxYStvQkhlNUNpU2twTUptUGp0RjJD?=
 =?utf-8?B?M01ub3FobnhMeWV3Ni9FSS9IOHdpVXkwT0xLajRWYURJWlFNYmJtMmc4RzAx?=
 =?utf-8?B?dU0wMnFxQ2YrTVJGbXVsbVF3WVBvNHdlazZtenhYNjBhbVVnVGd2eE4xVnJx?=
 =?utf-8?B?OXY2TktQY1cvTjJuZFhQaEVoQW9kZzFRU25mYkdSZ3ZsOCsrd3hncjB0SFM5?=
 =?utf-8?B?a2FHcVppaUtBbDZtWHBRUWRkUUFwc3JvNnBLdklpYndBdFdYMytNdXlObTZM?=
 =?utf-8?B?dmhnK0FjUmJJTVREa2lYTExMYS9QeGpObitkbHFwamJqV3p2MWlsMDRXTlhp?=
 =?utf-8?B?RWF6cCtPVFBlcTZ5Ymt0SzlJQWRBN2NDUHYrNVJ0Rk5qdE5HcHh1YTZOOGtp?=
 =?utf-8?B?MjcvS0M4cUVYQytycDhQWEp5U2NvTnRyVEN4Zjd4K3h5bmlqMFlwQzViaXhS?=
 =?utf-8?B?MW55cGkzYVY4R1lxQW8veDRick1JZE55dW9pYUExaHpOOGtHSXN1SDFZT2dw?=
 =?utf-8?B?b09CV3lXSnVDcEV5S2phWkFCa0Y1cXVVWEY3aCtiSVZBSU1EN3VLK1NweDJm?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 015fa3f7-c235-4709-afe0-08de1537c738
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 09:04:04.7869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpMTqMpJQj4gLkfqh+jXube+RsPbNhqMgzuWh4hzytr0UtvKVfHh7hyElTk4+Yl0uOk76LaH1vcbKR2f39tTteGb/6QO+LrvLI49JKpApyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_080839_936359_4FD0C0EB 
X-CRM114-Status: GOOD (  18.45  )
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

Hi All,

I've noticed one more issue with this commit. Need to drop the packet
before inserting the context descriptor with VLAN. So I think I have to
keep the max_sdu check in the original place itself, but add VLAN length 
if priv->dma_cap.vlins && skb_vlan_tag_present(skb) are true. Will 
change it accordingly in the next version.

Apologies for the oversight in the initial patch.

On 10/17/2025 11:41 AM, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> On hardware with Tx VLAN offload enabled, add the VLAN tag length to
> the skb length before checking the Qbv maxSDU if Tx VLAN offload is
> requested for the packet. Add 4 bytes for 802.1Q tag.
> 
> Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index dedaaef3208bfadc105961029f79d0d26c3289d8..23bf4a3d324b7f8e8c3067ed4d47b436a89c97d3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4500,6 +4500,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>   	bool has_vlan, set_ic;
>   	int entry, first_tx;
>   	dma_addr_t des;
> +	u32 sdu_len;
>   
>   	tx_q = &priv->dma_conf.tx_queue[queue];
>   	txq_stats = &priv->xstats.txq_stats[queue];
> @@ -4516,13 +4517,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>   			return stmmac_tso_xmit(skb, dev);
>   	}
>   
> -	if (priv->est && priv->est->enable &&
> -	    priv->est->max_sdu[queue] &&
> -	    skb->len > priv->est->max_sdu[queue]){
> -		priv->xstats.max_sdu_txq_drop[queue]++;
> -		goto max_sdu_err;
> -	}
> -
>   	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
>   		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
>   			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
> @@ -4535,8 +4529,18 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>   		return NETDEV_TX_BUSY;
>   	}
>   
> +	sdu_len = skb->len;
>   	/* Check if VLAN can be inserted by HW */
>   	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
> +	if (has_vlan)
> +		sdu_len += VLAN_HLEN;
> +
> +	if (priv->est && priv->est->enable &&
> +	    priv->est->max_sdu[queue] &&
> +	    skb->len > priv->est->max_sdu[queue]){
> +		priv->xstats.max_sdu_txq_drop[queue]++;
> +		goto max_sdu_err;
> +	}
>   
>   	entry = tx_q->cur_tx;
>   	first_entry = entry;
> 

Best Regards,
Rohan

