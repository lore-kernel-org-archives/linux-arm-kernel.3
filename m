Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE40E606A7BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z7KqolQt;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=j3KVBVgy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hx8W4RZFmKH6fZtDz20opgt9SHdcs3jZGCQUkdD4ASw=; b=Z7KqolQtd/aSb3RUXKgTeSQ6EK
	44lsJqZtl15IyWiDz2a2Zcak/rOjaX9EpEzJHwIA1Ks+vH4lDP+N966ai9bbbtnte8r2tZSYkhu9n
	ZHU5jappVHYdTWqhXFmpWA4FoSaGzbnWOdhC3XDeJeXE06oxmwV33Zz2PZ4UZpcx+/j0KrcXCeoFt
	ZSjuO5CINMYgWXbQb+Fw/OF9JZ0QooMu75sJ6qbepaWmFjBlZebQuxlbOB2BpdqrnF8++VcL608Pk
	EJzQk3rPQRHlF3p+2/DG8ju0gdjxNhkDMXGwfbeo8WJROp7cZkoiFvDkz6/IfuTeTuLTYSL+orA9y
	P/QHTj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGDd-00000002tT1-3DkO;
	Tue, 03 Nov 2026 15:14:37 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGDb-00000002tRA-35tj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNrzDUuKp9/WjilbyKcRBlwQhUFhsgD56aLLhF+wRrUs0yvMou8BdBdax3f5Tfmnp0TITZK+v+Vd1gry9aDYeE0H6ou0MkCGQLDhMluCBya7n0w587DemMvpDr7WRA8BxZ3TeuESxsMLxc4k+/S+OBSp74lr5neb8MVVL3bpOmf88ey2atwteUP1pJD6uLnMPpKTZWBeP5a7La8pL7mpHRrEX0nhCsUh0q2PX1g/uFvjVDfSRsxJuZxocJzj7LC1qo55fVrkOEJrzYMZjulGI18X1zOKPTHpdTvmDHlmuBNORj7DPPDOLQCue9axBnTIXR/00jP72VeMCWX6YsvQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hx8W4RZFmKH6fZtDz20opgt9SHdcs3jZGCQUkdD4ASw=;
 b=omXSlShQIBsStiIBUNqxEwQnjjrOmC8C9Ye1uMht7rjjpV4912qt+CDTuUF2X3CTQaVcAm6Mnx0xziJdujjEEXRvSp8jriIbh1x+YAYP2AxlsWtv8id6SKFQaAqK//ywQ6TzggEhi75Rt3W1FKCADjpgvvGLekF7ktWmpwuVm5lBVxnjfbmVLj63vxgguODlCBherqyZFSQkZ8Hpdjk4ddOGKkp4/+aOiqCj5VWmG3QnXkwdQbLEZTovXF7MZD3aYWAA3rDJ+OvxpkIESw88TebTfGcy3z5uwHW2p1AJ6vdpYX3Sszg59Eqy6whybkPRbRWzhGIgiiQg4T87izUtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx8W4RZFmKH6fZtDz20opgt9SHdcs3jZGCQUkdD4ASw=;
 b=j3KVBVgyiChcSMXbk6aQdsVyC5let/RQW8PKE6P1d5XbE4Nn4zJRq3hgwregrgqR1UHI3tCOojX6KAo1+XOgkwoFUc1WmasJ7bocjI5+umLYOJE3VwPKHXV5yje0PtCC5GcdF0VEFqCO6y6CetslFHrLcb7dHdKHMHmOq7omixAq9zzUpnIzjINFWQuow90vKl6FROEbU9nD43OqbCQdQjolKVupQ7rDBKI0DyDNLDU4rf/9PqEv5JFuEowyAVtgqx30IcVAYoZzqjntk3+Kqpcf+hdFMdb084wIcSPmzeIMi2Zuqm/iQI5Xq2fqAqrFIMeFCmZrKvv7YxJL4N8izQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11760.eurprd04.prod.outlook.com (2603:10a6:150:2d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:14:31 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:14:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 23:18:59 +0800
Subject: [PATCH v4 2/7] dmaengine: add a bus for DMA channel devices
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-edma-iommu-v3-v4-2-470415d418c5@Example.Com>
References: <20261103-edma-iommu-v3-v4-0-470415d418c5@Example.Com>
In-Reply-To: <20261103-edma-iommu-v3-v4-0-470415d418c5@Example.Com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, linux-tegra@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11760:EE_
X-MS-Office365-Filtering-Correlation-Id: 451bb60f-86d2-468f-9cb1-08df39bd2899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|366016|1800799024|6133799003|10067099003|22082099003|18002099003|921020|11063799006|56012099006|261022105027099003|261022075727099003|261028144727099003|261102130727099003|261102123227099003|261102124527099003|261021121427099003|261026121527099003|261026140227099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: TNQ65OLt7K9iP8EzOgU6ESxH4XXjj+zrTjK4+Bt6OouVgjBeh7k8QFcn4+8Ivb/wBgWHNJgOG/JWZKn/EbZN0u5Q6qPp8bMSkIVpwWNmNvyheXU7Fz/jfoajX1I3GMsRlb72iZimjOk9sVejK09QNHdmdkp9b630bQweD+Oc0LuJthkM5G41YXjhhNaloKT+OdX8dgYCSlVNLKJnc1EGK461ZDZFAqSWDhHR2V6JefrVWDqA58oNlO7yHS7IWKPFF0z9QmECAJ2+axvuFCvOlGQUtob3pIGHC1lC/4Rlte3pd08489FJNjbvNYawFMJ4JSP/0bt+cQ1yt65RfZBA8IqYhQPwDMqPR/hpAN0b45b14LFuy9500aCdZUnLZ1fs7HbD4/yYU6uXty1WDLLQ/rS/3lu8s2mY76DqaIwloMoh1hIAlkDkb0tkpWsqYQYMi7LwyMOiFu6GfP8Gby00o99gCWrWrJAW5QCN3QiKAcHYlIOLsuKssj2CtkWTmWzejEHCD/oOiiXPhvK3miDf6T9hMviW58n2PWnMjpXlxRR7B1cw+zGfZX2kGAjyEVtLOUicx+beteq15uM6yRb6Tzys8M5v2ButdOUJgv3MAmZQLMzrB224egZZ/nOHAyTdXjXMolMfbOqLeCXqzh2cSgfORdkFemMtfX7x7IX1ofH0ddYyu126yr0Z1uWwQJDMSZF6gvkwASq5Tlsp7AyQIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(366016)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(921020)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261028144727099003)(261102130727099003)(261102123227099003)(261102124527099003)(261021121427099003)(261026121527099003)(261026140227099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3BxQkpGaVJ3MVpySy94ZUxlTENOT0poYzZsVklzWGFqNjdabXhhdUhYQnc5?=
 =?utf-8?B?Q1N5dExtcEhmMnNWalQyYmNZUGd4d1I2YXNHVm82T3lhcDI1QUYyZTRPTndF?=
 =?utf-8?B?MWVSOEJQN0g2TEtXZGVmanZaNkFCSGtma1JoWDY3cWQvV1lWMHNRb29qd1JB?=
 =?utf-8?B?Ny8wRkZ3TVRrNnlHQ2h3ZWp1VjVWdVAxSU1MZktzN2xJRXNGYnhxQmk2dFpw?=
 =?utf-8?B?N1F5T3JEN0o5djQrVDJFREFnejFzUEFhQUt2U1F5Y0gzQXdTRmkxdU5aUWFS?=
 =?utf-8?B?YjI1UHJTRm5NckRQaFhsQVVqVFNjK1FaVUVaR3BLaWZEbm90NlV6SDYzQ1dN?=
 =?utf-8?B?UzRJdmo0eDR0NHVJMHkzUkdHNmwxUWU1T1FwOVkxYk1kNWg0TnA4QmxQS3la?=
 =?utf-8?B?QlNvWG1INkd1SC93cGMvOEZHOCs1ZkVkTlZlbW0vaVFmblhaR0ZFTmpUell4?=
 =?utf-8?B?eEJwMGFnUmdlNW1HcUpvN1VKZkRJODNZa3ZCY0RtemVzMGZJc3V4Zk5jZW4r?=
 =?utf-8?B?aVNDS1l4R2ozbitWZFFLd0s3MGNZd1RDUE5CRXAycllnVXMreE1EbiswV2pD?=
 =?utf-8?B?dkwzQmtHOWtsTzRPeVY2TGxYcTdXeHU5ZVhtUUQrNkdDQS9RRXhxWTFkcmlG?=
 =?utf-8?B?Q2o2R05iS3VmSGxGVEY5UGZqU3NKbUVEbDlPQkpCa1BLQVdyTUxnU3pIOGw2?=
 =?utf-8?B?SXF6MHhYWi9Da3lwOXoxbXpIMHA1VTNOMGRnV1RxVWZob0R4MVkxSkp6N3pp?=
 =?utf-8?B?aDdjSnJKY2NCcVVlTXo5aVp1ODJTbWEvVHYySUk3cjBySmYzQzE3K2VDcit1?=
 =?utf-8?B?aEJJS1FiRGxjTmFnT255cFdLMGpwKy9QYnlOUTErQm5Ed2FkUU80U1hucWd4?=
 =?utf-8?B?cXVVM0xRaUFXNUtCVXYxRDhHeCtHNFNCM3R0WWNEQXUvVDFXWnQ5Sk13MGYr?=
 =?utf-8?B?RUJvanVZTGJzTDBESFBWNXYwRU5LTFBjbVFsMHVYSXFTQWhUUnZsTkNtQ3BL?=
 =?utf-8?B?ZEt1T0xCQTkreWVOM3JSdkIvV2tnTUNYWE8rbzlnbzlkTkdKaFZHbWUyR3Q5?=
 =?utf-8?B?cWZXRzlEa3BOSzF3VGY1TzU5d01PcXR3R1lYTTRNL2tXcDRjMDJZM1pSNDJu?=
 =?utf-8?B?ZUZ1ZlpuZUNjaW8xOFpwR3FRZ3ZSdmJKOGRjWmphdVpXRGtORjkzcm44NHVV?=
 =?utf-8?B?azlaajRwanBzejhseHRXLzlpSUVtUHp4Uk83NWpMZzVqMFloc0xnQlZzdWhX?=
 =?utf-8?B?NmtuS3dRWHB3K08rOXdlblRXZGNHSHZZeWNpZFgwK3d4UU4rejBnYVgxNThm?=
 =?utf-8?B?bFNueXJ6YW5OL0JiUGxPOUF0MXZHZzAxNUJCRHIybWdPeDFDUEYxdXl0a2JD?=
 =?utf-8?B?UWlyczBhYjRra0JuL0M1R1pUb0Q2YzJQc29zMEhhV0RBUzFCZ09OMVY5Wk1D?=
 =?utf-8?B?Vjl1dEdlaWVMbGk5VG1XeE5YMzJJdkQ1WThaajdrY0tIT0l5SWlqOFJuS2FY?=
 =?utf-8?B?aTI0VkZ4NGxCVk90d2o1c3pPYlN5dEt3d3gwVTMveGI0SGNoaGJxVThrVVdh?=
 =?utf-8?B?aTRVZkxEYy9zamV5ZWdJbnd2WFVMZEZMcW00TThkY3pTZndZY0tpVFNPNzVO?=
 =?utf-8?B?cjFRMEZVbm0zRmFWWDZxRllpV2Z1djdQU242VEhBUG9VaUdzMkVlWXdydzBQ?=
 =?utf-8?B?MDFVL2FXU2ZFVk4xa0lGaGVyZUdBanIvOW1sZkpzZzZteXp0RjNkTEpJV3E3?=
 =?utf-8?B?RzBtRkZ0QTNGOVpCcHhxYTlFMStaeFV5K1Z1bkN6SXUyZGhUcjVGVTNMY2Jz?=
 =?utf-8?B?RzNrZlV5TmZ1MFNSMzlJeXZLUjVSTGdFSUdkQXltWkhkQ3BFemIxSFFXcFQ3?=
 =?utf-8?B?ZXQyYlVJdnUrZmVLRVJTMkMzYTBleVZ5QUJZWXNpMVhjZTNTa1RYQ21BTzFG?=
 =?utf-8?B?Z0ZOeEdEUzdUVS9IWlNvbHQ2WEMyNldqRm1XemFhWUZsOERMUklrQkdFNVN6?=
 =?utf-8?B?NW9nblo2dnpaNHZVWlgyZ3o0MUlYaDZTcWRnb04rS1lyOWs1N1RtTDJFcExz?=
 =?utf-8?B?b0hQUFJpcWR2NXdhZEp0aHFVaER5L09wQnZRNzZJdUxqV2VqTGM3Nzh0Z1R0?=
 =?utf-8?B?Z0M0SVlmQXhyRnpmK2Mwd1pVdzZqYUJEdUdMaXlYY1o3cWJoNVdya2R4enNw?=
 =?utf-8?B?bmdicXhMUisrSThjanFaUDBjOXltREZTWjQ4YzJDSWpVMENOdHQ3ZTkxZ2lG?=
 =?utf-8?B?aVJDcWFOb29YZHpIUDNmb1JSNUZ3SGp6RUZyVGVnY0ozcElOKzRRKy84b2R3?=
 =?utf-8?B?SVRWdGlpQmZXa2xzRGhZRWlBS3BXMUtQV0ppNVVLc3IzYnRrclJXclBjTkhZ?=
 =?utf-8?Q?cBk8qEaf4RXbpMfVdy0eCR3rUNP2DY0jRbkhB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451bb60f-86d2-468f-9cb1-08df39bd2899
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:14:30.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jo8hJQY7yq+1lLqnY4BGIzKzbEJoahwaQwKm5eOmac7SaYiPfDNrMj3Xy1cIfDS4iO0Rl8UzuhxoMLlsEEuNTD21zZg6m7zJtPtGmlzSjgcmgFS4mgtY3BTE7q54aT2B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_071435_794390_F1B07F78 
X-CRM114-Status: GOOD (  17.58  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Peng Fan <peng.fan@nxp.com>

DMA channel devices are currently created as class devices without a bus.
This works for sysfs, but it prevents per-channel DMA/IOMMU configuration:
of_dma_configure() only probes the IOMMU when dev->bus is set, and the
IOMMU core only installs probe/release notifiers for buses listed in
iommu_buses[].

Drivers that need per-channel IOMMU support currently work around this by
assigning dev->bus after device_register(). That leaves the bus subsystem
reference count unbalanced because bus_add_device() already ran with a NULL
bus, and bus_remove_device() will later drop a reference that was never
taken.

Add a dedicated bus for DMA channel devices and register it during
dmaengine initialisation. Use core_initcall so the bus exists before any
IOMMU driver can call iommu_device_register(), which iterates iommu_buses[]
and fails on an unregistered bus. The match callback always reports no
match, so no driver can bind to these devices. A follow-up patch will
register the channel devices on this bus.

Clean up the unmap pools if dmaengine initialisation fails after they have
been allocated.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/dmaengine.c   | 28 +++++++++++++++++++++++++---
 include/linux/dmaengine.h |  4 ++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 34be53487a21d..3a297f2754915 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1643,6 +1643,17 @@ void dma_run_dependencies(struct dma_async_tx_descriptor *tx)
 }
 EXPORT_SYMBOL_GPL(dma_run_dependencies);
 
+static int dma_chan_bus_match(struct device *dev,
+			      const struct device_driver *drv)
+{
+	return 0;
+}
+
+const struct bus_type dma_chan_bus_type = {
+	.name  = "dma",
+	.match = dma_chan_bus_match,
+};
+
 static int __init dma_bus_init(void)
 {
 	int err = dmaengine_init_unmap_pool();
@@ -1650,10 +1661,21 @@ static int __init dma_bus_init(void)
 	if (err)
 		return err;
 
+	err = bus_register(&dma_chan_bus_type);
+	if (err)
+		goto err_destroy_unmap_pool;
+
 	err = class_register(&dma_devclass);
-	if (!err)
-		dmaengine_debugfs_init();
+	if (err)
+		goto err_unregister_bus;
 
+	dmaengine_debugfs_init();
+	return 0;
+
+err_unregister_bus:
+	bus_unregister(&dma_chan_bus_type);
+err_destroy_unmap_pool:
+	dmaengine_destroy_unmap_pool();
 	return err;
 }
-arch_initcall(dma_bus_init);
+core_initcall(dma_bus_init);
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 805668fbe4376..14d8f182c7cb5 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -412,6 +412,10 @@ struct dma_chan_dev {
 	bool chan_dma_dev;
 };
 
+#ifdef CONFIG_DMA_ENGINE
+extern const struct bus_type dma_chan_bus_type;
+#endif
+
 /**
  * enum dma_slave_buswidth - defines bus width of the DMA slave
  * device, source or target buses

-- 
2.34.1


