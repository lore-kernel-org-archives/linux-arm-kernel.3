Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EFBD3517D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRvSg2X5oF+wex5OLrs7/ynRUevh5KTOF8iDw5s+bIc=; b=U8aiqXk+UOvippxesAW1wXWuRX
	hhfDpA3WpYZxWMuACduO3XJAMuDeV8YtyVrCkptw9zcQiekGnnQzDqkmUV7Xg/esR0BgKFNOaRHdI
	I1aBqgufmJVCzHaNULkcSdGWZ/ysrgbxST+L96eCWgn9uMvnA5qkwx/FkFZCUuCEuEZVvDcy4rxa0
	RysRihP4Skbq7ekUTDvxRYPQbI2sA45Zfk3C5xB4gC5Vu2YO6L3y4EtcUyofT+4xPWgvC/hWKN9tl
	ycv7EFaPAj0X53qUn5RTSBVdqTrPuNdORXE+/tK9uxkheE4Fo0VT6IkENrKDds9aDpURSvg4d5ZTp
	xloGzmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vP2-0000000FHU5-0QnH;
	Wed, 01 Apr 2026 13:14:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vOy-0000000FHTb-3sum;
	Wed, 01 Apr 2026 13:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iRvSg2X5oF+wex5OLrs7/ynRUevh5KTOF8iDw5s+bIc=; b=p0zhESBGSFccKp7N9cxGesUiTr
	zNTFP7GwV7T8LEl+Joz07VyDR3OJau8ZOVfis+JPlvwkzpmKC4ZBKWu6smFJtGHdAZ2YvOJzZGLDI
	GAf8f7/tkFymYdToWfXWIooCoD5ntQoxVrP9OX1UAfy+S+TPFEYlJvcziVXF/EAI7EDjqX4gT1hF3
	FGquikA03kNfbmnKVzmH10qCK1Ge8HrFmzvxDtrFwE3MOuFeMOxJFpNXAb61XHPGMiQvmL1fi5Oon
	tC8mIC02wIOjl6LVBTYn4xa1bt3fNVt+RkEPhyfvPLjlUJcuaQ0bYpyIhq/q1Wfpjn4++gmCuk76T
	4aalWyfA==;
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vOv-00000000Qnk-39QU;
	Wed, 01 Apr 2026 13:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joBN8NzTHhwAvsKv/6WkFEDO1lS+GSbE4jJc2SvR7BV3Z0yOCbK1pgkEIpzJTDzNicMEsjnaIPFdR4S6S18eGV59JjHh8Oag/ri+NYduOXOHJ737ZkEBjZNxVbLUDJXEPNh60WFt3RqYa+TnrZ7y2Nn8G01iyPy+u75VdaBKU9AX8zPlTz8n6YfWZjkYAPNEZWbZf1HeHzRShr+lhgz5XRSYJUnZ870RhAOKCEfmcti3rK3iyG9BbhDEmdB/4wv9OvSpgrlPH1UZybWK+ngkbDKt99oASyUSyeEeehHu9URU7FnDAcpHFv4WweuI/XZoEdY0aE+bGujBhsFtnW0Snw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRvSg2X5oF+wex5OLrs7/ynRUevh5KTOF8iDw5s+bIc=;
 b=MqObNlCGMWhQ+cc48nSi3DKypHZ58hpbcPcbbN8PciFgXlnRu0KVN1tD8+ny8eezix71h7U3btktNEc0j6tkUfS3aLYCD4AEkMv3OsBHNDbPfBrOEHmURNUbjdar4980PuaUPQTbY/ZZWscW3zBbDcfJrfTYCJPT4FeJROno/eYgokGMV99QrOfMTZFbj0VKuQxdtRfkmSISaklZD1pFsew0GGI9xv6dL9UlmH5dstAmspCVhHR3aupVFkOG+gEuK4RUY1AQHUpKWYvSreWH4A0a95ktZmjSpNT3f0L4rBx8dSGStRZFLxfywojMjVM0fQV72sp7uzjbU+ucWXTFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRvSg2X5oF+wex5OLrs7/ynRUevh5KTOF8iDw5s+bIc=;
 b=Iqmn9va4ePHAQKUQmxcxPxUWVSxpAvrtQwP9oBXjZC5MYyY4TX37DJTv7eLh1oRtMwL9efv6SXnTd2KodVOFD7sdZPrxE6jC1cLqv0RJXq8FVNWkEfRF2Poj03kC9Qfup20vrlRsh5JLEaIR8DnAJbOj2UKLnBimkpWjbpe4REHne0kzv3hWFDK1BGXTr9ynU/7Cu6RA5AVwHD20gmb+JCOQidBi86c4ps8iCfMcohL5XodeVMM34oYZzTthOOUbPklHd8pzpkK8rgsyWSwRBms/Vp700i3YD2k0PICLy9XSV+ywMo/1DjGn4fplVwicBwG09T/6ViW2ade5fTcfpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SN7PR12MB7322.namprd12.prod.outlook.com (2603:10b6:806:299::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 12:58:51 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 12:58:51 +0000
Date: Wed, 1 Apr 2026 09:58:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>,
	virtualization@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Jon Hunter <jonathanh@nvidia.com>, patches@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH] iommu: Always fill in gather when unmapping
Message-ID: <20260401125850.GZ310919@nvidia.com>
References: <0-v1-664d3acaabb9+78b-iommu_gather_always_jgg@nvidia.com>
 <ac0AKyvHMYHlqL5i@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac0AKyvHMYHlqL5i@google.com>
X-ClientProxiedBy: BN9PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:408:fc::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SN7PR12MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 72902b0a-31dc-414d-a8a1-08de8fee6c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4UJx0E8KWXxHEMICwrNdAVkp7OhhenLehH8KTzh8t3iQRG/tWO1nlu9J3SRNRLZ2A7NjVBobHuZbnwSaS7nTbw9EcGUj/PmUG6ZI9EvKOYkreohgt1GJ8+W65G8MZeJ5pOHARfPgUkKIyT4DLp4hymC9k0ycY0LN5uI+uXoWZFidLBXRdSjERD6/ww8DfDf1Wu8vloxs7B2cst/QR5lzcHSPmNR4bPZ8bBfUfHggjHwV0vL2EupyNjQXesXUXQlk0otCsXnWQx2CLvPr6LkjkBnzv0pSwbbU18W+/zvT/KPTi9V34zAoFrTagoCLyAb2YVNwcP6iBBPbJBtj6orijRT0bjG+tAYwn5OKSTKahLbRts4NkAepxVvxQURv5UHSFLczGYTc5SDokMYdz6nx/x0EAoELXahIdSjGQ+F6+cHDQSgIdUE+INFxOcaMUsJZll7e6YGxmmhRhVusOqkjiyfE+AhD2o48LE7s4SlccUn0lWzyLFMHcwVZljfK6hTgLM2DCm/8vamVKqaXeGq4FkU/aNbK9OSJAvrJq6ajuNyhY0fL4vj+QGKBPgW5gKLCEiw3sFFdNBzTU4jUAS3aIrr84YjE4Qovnz9C6kwaymFwaGc0A9UxrctuT/RUDGs393ZMRsWG8Gb+R/WVZfQrpYqyy8EOxhx1FRyhobwwAVJB9Vu4A2xM2+igY52IiEp8mojRcvXIt0lAiLgKBaltj0FwI1y7QPsg/2Z1dxwMUDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3wbNsyZlG8XYPWHQx9nS9eGLdJD980HE2+h3I70baHz8agh2DJoXgjKQRaG?=
 =?us-ascii?Q?lOsAH8d07sLCQgP+yFBBn8453tQCUJ7Yvt1OGC/0wMWkCq6S7eGi6MRIu1vg?=
 =?us-ascii?Q?mAOCAEDyNfgvqTttEZT0sRxP3h17aIkxVl5giSKfqkhCM1PCtnbw57lz2Jw8?=
 =?us-ascii?Q?ZUrvTZJqLQr+y1SJTS3y27/v4g90o9SDkxFdyLBLoSXRL7MbgaHY0IvKx1zZ?=
 =?us-ascii?Q?p8BG3+NY0TN2Zj3hePBnM2qlchWD/HWsgRoiTs73VXqyMbtIRnwtdMY2Yj96?=
 =?us-ascii?Q?xYTK5zbCl/T7LcUX7S3Rx3bC40jP1R8m9IfMpA7kb2MVTzoyiBQZ6vFSgRC4?=
 =?us-ascii?Q?QflEMutZMWvmXTfaZ2ZQn5ycluCLibrtlGKdZnV1SiGKs4G+QCUdmXOmgltH?=
 =?us-ascii?Q?Ms2uuez/BftatZMsizsNfJW6vu/e5GHAUXjJE9mOTcgYdq4rMVQE3EdBz+fw?=
 =?us-ascii?Q?hWeynXyMJZ93+s931SP7hkcB7U0Yz17UmaMXJ25u4s1QTY4FcaUUp9KtQcFP?=
 =?us-ascii?Q?xmoM5VNwJ7fAZ2TEHOGq/xsghsvka5Acov+OhZHaBZn52nwXs+obCUrk3nsT?=
 =?us-ascii?Q?jksm4etXBwuzKEGRUMjrPH8uvrKT17plpQlhveAsnv4UVDDkTHu2306rUW8D?=
 =?us-ascii?Q?lbeVB6fkqVDc0HY6QlIYGNGI8GHBrzG+DOYjnbejqWvrIvdbwy6CmJycY3cH?=
 =?us-ascii?Q?Yei+0bH2fPLkb3e/A8ctkRtgX6mcwvpGwGyml5bCJlS9p5AxTLfG1EY/kw+5?=
 =?us-ascii?Q?pkUWRm5EsI/leVbLzAC0qlXp3qsqhtCCwes0dJ0JJAVofyCHjrQOc/x3wV8c?=
 =?us-ascii?Q?iZ6GsGzx5VaU3EOZlKYTvkowA4pFUvpsTIYb8czXSsrFevrPs63HeCj4pb6g?=
 =?us-ascii?Q?4BnaWt/2mz0yK7ZkrZ1GqUHwxv6+sMWTpOVpgGgWkCXSKzOgHIgt+4/xEUxY?=
 =?us-ascii?Q?z0Z/9/nHQpEdudvXV0M7CLYkTdVyhnrBYckmuxL7ZY+Yc0V4Eep7fEsnIWMP?=
 =?us-ascii?Q?jgvA/tJdpU2+LR/9mJf3O83sa64LUunv2W8AICcuxlad+pylx7SDmaXJgRwo?=
 =?us-ascii?Q?YnwCg7kwwI64K5uwvMvN/0WqJMGhC1D5MCf7+u+pOWX95GhYbLfAdH9y9Bom?=
 =?us-ascii?Q?ZSAutN/dMST3sESGjZ5Uf7pm/Y/idR/oAlnHS+znlQoixQBFP9KTw/GGTmgB?=
 =?us-ascii?Q?3CKSiP1mbnWsAt4wq+WPA3LCgqgFtaXLsyNAmL04HzRQBkIOBwazlxSunNNa?=
 =?us-ascii?Q?RLwxHyl6kbI95p/YTsmZfZOO/aeTFR3dts2BGoa4XccJOmA9wganzIP08jlD?=
 =?us-ascii?Q?o9bkqEc0l6HgeUSf7Un28bsrvthnB8g0rEWHZli1bhAyLxoHhVXO/XyilZEd?=
 =?us-ascii?Q?RXR2eEws0ybUxsQTge6LnRedaChu1qw+RuisK0HZAEE8RZx5DGOHPGgPw2OQ?=
 =?us-ascii?Q?wLHRTZ8Eh/En6usoxHe/NzcMGf+uiTVCtkt8woDU5rKk1tQBYsujuVG2xhAR?=
 =?us-ascii?Q?gQ3yzIYXa3qNnkWzCSS86qAN1vowhc31PE5JvwjZu7yiJBfVF64JOASB3Jos?=
 =?us-ascii?Q?IXxUlW1F2NYrskmkQUofVr5/toVTuHuUCyGwnCvZWcNOelO58n3JVit+c9MB?=
 =?us-ascii?Q?VT8pTsRTboSKMWuwYIEXfg8tkVHftxs7j5Xa6ThJIT10j8WBPkZIRwH88/BL?=
 =?us-ascii?Q?bfyc75GzKqtD2CwsiwBWhJhC60fo4i1JhZT47dmLLj1HGFUU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72902b0a-31dc-414d-a8a1-08de8fee6c47
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 12:58:51.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G34U7eBhHK8zZIUrrohGinMZLSJr2Ti8+0M0ATW6PziKkhNm31/1szIUFRH74VMQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_141430_096783_DB6A32A3 
X-CRM114-Status: GOOD (  10.87  )
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

On Wed, Apr 01, 2026 at 11:23:23AM +0000, Pranjal Shrivastava wrote:

> I was wondering if, as a longer-term direction, having an explicit flag
> for these drivers to indicate they always require a sync would be a
> cleaner way to handle this than the trivial population?

My first thought was to just set the gather to start=0,end=ULONG_MAX
but it turned out to be trivial to just set the right gather parameters
and it looks like it is basically the same cost..

Adding a flag would mean we have to test the flag on the other case
where we don't use this flow, which doesn't seem good either.

Jason

