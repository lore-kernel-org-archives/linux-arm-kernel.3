Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D40BCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 02:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poWku8GBcMrVVryGNnq7eBjf2oAEJl/55bElpxFMyA8=; b=kpNTAxaLyzqyQfyYTcVicl6up6
	K85OEhZoscGT34SH38COiNejCY63MX3oOS7HAI8gSnLh7eVtDJna2v7kE1POT9q4j2AN5NG/7q5zD
	kfA5rpGF4mTVbDTn9eTO14tRm794xLPZwDHEZAXVNE98Kvi+UKltrh3lWgNsEI4QcSxrjS69zt7wz
	NXp2CbsEQWusV+VrLX9XJx9WgiwQtxlWNBwwOn2I4Dzwz34ES1rryyuXQuem0zmV/masixdDshD/L
	Qy//p2pwdYYauSHIFYJ2fZmurO/JIytyroGcDVkPAaLxYoxVGtE0QlWO+yerCX/jmRxYZV4Y/LZea
	SmITloAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sQx-0000000C5Ml-307P;
	Tue, 23 Sep 2025 02:07:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sQw-0000000C5LU-1GZV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Sep 2025 02:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=poWku8GBcMrVVryGNnq7eBjf2oAEJl/55bElpxFMyA8=; b=TDdsrF0JU5Mha4wQzYsxbBbg5u
	d8K3bLMkgp8FBIeXGHMjUPg/fknPxV3Rb7JJ0fSCYnUeAGPyGcsPe2MRHA4xVJNplFnCk9Fxt0ryQ
	rzjJPT9Ne6Zx87oXsGohhUHc8F2bTV01r9kvnfWav6v5oXrJq3scOfUdf71rmIY6dWbhcJ0IIVLaN
	OwpnxvXZG4I+Qbss3SVSuQ8P7FjeiRWl5VbKJ363DNX+Y5uMhZjuG2cVswKChVN+VDcFjU1aLoPk2
	N4B0eyJB4n3PxT8GR8590MRa9iyZGjX/UvK2mbShJ1LAK2oWR68AtVvRd4Ng5Wj2b9ju7l17khNng
	nqAF46NQ==;
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sQr-00000008RHe-0gWM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 02:07:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjtFo1Yp+Dmguk76Z/h00Il7ZT4Lw52ruJQVTU+3z19dxekH801FHSj4v0awAfS1hz1WJN5ff4RZ8GNlzBP8BaqkJmf57MDcRbF39/e9ahjU/TuP2H5riaEpr8Geaw3VYNKTZY8xF12zL7KkTRHqsevfnlkwgXBdF2/UtpDoJ/CKzFsEcxcUlX4RopmGPTvmixmhBu3ggK0LLvwfboqGl9p0vyFW8hnCduEn17UpD15MTEGUCWkoH0mGDUgsqFDxAjX6NSkU8APc/FMf2Hk+vZGe+qnU9PLuSgW9c1KUXwDI07BRBOyU0FdWvtp+wMT5YxdE2F4RNcGGSsDdDUQ12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poWku8GBcMrVVryGNnq7eBjf2oAEJl/55bElpxFMyA8=;
 b=cvzPAG7sCEv+RaV+wVj+42L+QgWZEFgNAsUHYD56t5S/ll/FM3d4v657SntER+V2GQ/RdB7vtWUHkZZuA6bN4EFTg8iDu9Srj1bLfPxydSJbn7sBhm3AkJDU92Ql4L0DteaoMx/cr5iKYpTVLoXl4oCUczyHxHuSN4bW698iHj3PVoWwwIYp6weo9F2O51o/IH5hPcu6dx5PDZ22TYCgMsKNCZAojIxiyFXNhtbgi/jNY9LQjWJpJHX8A7CoQPSM2YU5z1OvPmcm8d1vk49l4V4LqFX5rTUlQhKwbSLYexqiEHesf7LvBFMelui27J2cF5Cxy7RPaio9Lp91IXup+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poWku8GBcMrVVryGNnq7eBjf2oAEJl/55bElpxFMyA8=;
 b=f8imEJhlKzGkxk2LYCnCSdECiVTs3s2WmPC4NP/HNZxKQRroSQDG2H5RHa8KmqiyuFdRWVkVnbRF3KJoj+uskEKRqlQPiyI9XlNqK8olm0mfPmgcSGt+G5HOOELeNOZaUGAYTyXF0PZRRahZ5p1Au3/KdTx1Zlw4joy8vbBgZdBhJo29jTT8VK3aItzOC/FiAM007uwIBUz0wJ0DGl7+zWo+1bfP4xBdmNs4c+TVVLYCxuVdjcIj1BZ7ayC+664jI1rMRyGzaeP6+QUhoWT2XFE7jslnyPAqd82w5jFfAZzYrt6hcDyNIcBZkv95oTgcwKv1nFO/Jn2JxAxiejn2+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10854.eurprd04.prod.outlook.com (2603:10a6:800:25f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:06:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:06:57 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:07:52 +0800
Subject: [PATCH v2 02/14] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-2-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10854:EE_
X-MS-Office365-Filtering-Correlation-Id: f7bd0ed0-0202-4c13-4554-08ddfa45dfa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3lkQkh5Nk9ZcGZOKy93Vncxc0RxZTBxMkdPNlBINEpuTnZJbnE2em9iSThu?=
 =?utf-8?B?Yi8wNmhzT3ZtTDZzUUVlczlqa3VZQnFyM1hOQytqb282NnF1cFZaSDJBOEpG?=
 =?utf-8?B?eStuT3lzOWxuWUwrT3BRdVVRUkdvdUU2Q0ZRUitTUzNZclNCblJWbHZLTm1Z?=
 =?utf-8?B?eG1nNTJmeThmOG5NcThkU3JyWHRaMGpyelY2SkloZ3RIWk9KUEtWY21yZ3BT?=
 =?utf-8?B?Sk8rNEMyNTJSRng1VFJJaXBUUE5wa0NyRjZGK2lPbkswU21vQ2JNQ2V0YmJX?=
 =?utf-8?B?SEdKQVVyU2d0QVAxbVZLSkZSSUx6eGJBZ1g3bVJZMEpxdXErUkx6ZUV6bExa?=
 =?utf-8?B?YkdpZWdYS0pJeFVkNEpFQVcvNkhaZHNvN2RSb3ZZN2xKdTF6WEZJb21BQ2cv?=
 =?utf-8?B?WjhZUU13Q2xNd2xyM3JIajliUmpyVXY4TklNUWZVZ0d2Q2tnYmZMcUxDOU5S?=
 =?utf-8?B?TWdibVlSM2wrZWhFTElmYmRSM2ZQQ2J0OUhUR2g5UitQQjY3SEpkT2d1ditz?=
 =?utf-8?B?OThaaDlKUUN4QXBiazZXcVdWQlRNNDRRK2w2czVWaWxvRGI4VDkrRFNZeEJ1?=
 =?utf-8?B?dGdwcWJsQm1pLzl6UkhKQ1p0Y3hQOXFmWlBPeFpDcHlEQ0d1NzFqdkdQUDFo?=
 =?utf-8?B?aGw2N2VSc3l6TWdLSklna2RJczlSb1FzYVhYTk4weE13aklxQm9kKy9GRVZu?=
 =?utf-8?B?NVBzK3Vtd0p4M250cGpzeWM4M0tWL3NuMUNldDJyZVN4TE9rSW1PaTBTV3ZQ?=
 =?utf-8?B?YWJ5QlZIcmxXYXc0ekRvS1A5YmpYWmxOWkZJZ0krSnpmNnRCYTFlWVBNeXVQ?=
 =?utf-8?B?aWhMVVQycFpLcEJKOGN3d3VtYzhmRTgza29hbkFyZ3VDRHlBUkNrdUozVlpI?=
 =?utf-8?B?bFErSk14SDZUVHZITHlvUVdMZHQzUW9vUmhsd1pObnlod2xqbGhDUjZIOVdV?=
 =?utf-8?B?K3EwRjR1b242K0t4VmdlMXEwUFdFaHk5TW0yKzl5OXJ5TStXNURBTDhDOEIz?=
 =?utf-8?B?Ly9KWC85ckdONmx2YlExMEE2b0VuQlN1d240QStickZKcEFaalgvRSsrRlh5?=
 =?utf-8?B?eFNPTHg1K2ZlU1VJTmhlMisrWHFWdmpZcGxPVGx5Q3pnQXhOcG9pWmo0blh2?=
 =?utf-8?B?Y3VydEtWSVFGaHhneEZ3Z0lFRWpXSEtLUWR2bVh6VXpwcWhEckcxYWFlYlBQ?=
 =?utf-8?B?RkducGprUzBkdnk4Qk5iTHhnRnhPQXIrVXNvZUVDaCtqU3RkbkNSbjZ6SC8z?=
 =?utf-8?B?UnZtbkxCWXhMeTkrWXhhVmkydjhrdEQwZEwxcjV1bXEzbldDNTRDKytLbHBY?=
 =?utf-8?B?WFdVRExtYkJoSDlFNG9RbmhnYzhSZGRvdVhTNGtoaXVUSWRXWW15cUYvWCtR?=
 =?utf-8?B?amNTaEw5ekFIOEhhSmNsZzlheURzbHBFZFR3ZnJNSlB6UHA0MTRRWnp4WUxx?=
 =?utf-8?B?SmJ3V05XM0tXdkJsajVPZWlzRVROb2RNVHRUM2NHaDR4ODNHQ2dRYnVJckpm?=
 =?utf-8?B?Yng0enJTQ1htaXIzczZaT1VEajNDMldzVmM4UFMwWUpUOGt6a0RGZnRnWnBZ?=
 =?utf-8?B?RSs0UUxsSi9RTnp1aXVIa1pjaDh6ZFp6NjNVRmJROGZ3b1lPQWtxTVh4aXNY?=
 =?utf-8?B?NU9PK3pxTUVaR2lPL3k3dmxYVWQ4UStuMGYwR05nTzQ3OEJkUmZhQTc1QjRK?=
 =?utf-8?B?dUt0ZlVLMjVoQTZPQUlpcm9MZDAyTEF0RzcxZkVXZEpRRWNDQ2dPcUFsQ3Jo?=
 =?utf-8?B?Y0lDeDNnU0J6ZHgwTWFoNG9ldWxGVmJ3VGZpUUtSem0yZzlKUnV0Ymc2NVR5?=
 =?utf-8?B?NURBbC9jcUxjdFp3R1dlN0J1d0NlUk9VL051Z3RIbDRqVlZwMFN5ZUh2VUc1?=
 =?utf-8?B?ZWlycUhWTU5IU2NHREtCNk9UVlNaN1Nhb29xekdrZGMvZGlncXNPb1o0Rkht?=
 =?utf-8?Q?tqE/TuF+ode7qnpOY4cRBLWMWRziDT3U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THU4b2RnVDlXOVN6UUtyVXpHVVYxM0pORGhVSTBaWmlBRFdMZTZuR2RWeVBq?=
 =?utf-8?B?NmhRU1ppVHd2L2pIenBYWHhkZ1FlMGJMbStWcDlWaTRFTDNKbENjbkxFWWV1?=
 =?utf-8?B?QXR5aE5wdndwSUJOaDd6d3Y1TG41RDZ2aEJqZWFjUDRIUGxuL2tnU0o4YWhi?=
 =?utf-8?B?d0l4b3BwRDN4U0NwTm56K3NoQjZ6U1AwcjlabEUxUEZuNXYrSTJ4NWhObHFp?=
 =?utf-8?B?ZVlUeWhTekxjUVUvbUZCSW9LbTJHY0R2Ukp2Z2daaUtpU2VtTnNHcFdHMEls?=
 =?utf-8?B?MXgydDVJRmhuSkNMSWJwcmlYUVpCUE5nYWJoUmMyOFBxQURmOWp4WjBrUC80?=
 =?utf-8?B?elNSZVZwNVFYMVFuQVRJOFZ3UXFTeU5JcjF4Ym5iTW1ocDkxK0tyMVZxdTdV?=
 =?utf-8?B?Ykx2aU0vUzhXQzNlVVQ1b1RXSW1RZW9yZXlKZDd2OVU2ZlBxTTBKbFdQZldY?=
 =?utf-8?B?Wi8wNFV2TUJxVTNpNnBieWJWRmdSc1FmTUpta2lmMXdML0tIV1N6WCtYc2li?=
 =?utf-8?B?MHRRdUtFVi9KRFRIMGgvOThFY1pManVhSWlKUDBCUGUvbjhDclJyaldZWlhu?=
 =?utf-8?B?NTBwaDFRWWluNzI5WVQ0eVhDQkgyTzVWTFlYQks3U2hQQ1JGMU9yWVh1UTRU?=
 =?utf-8?B?b2RoZTFXMFNUcFMxenZDQkd2bnNDZ24zSDlEalRGNHU2ckZUb0NNU1ZpV2pL?=
 =?utf-8?B?aDRiK0hwRjNZRVkyYjZhblQrM2RWeHZCSGE4MUFKY05ORzNBMVVlRklERXRi?=
 =?utf-8?B?bmNQTm9YY3RXTXBlMTVYR1RnYjg2WHZRWEcrTVJNS3JYeElCZ284TDNIcno1?=
 =?utf-8?B?UVk0ZVBtZHdzTjNQbmhJVDNFcjh0VkdMUmVqV3lJRnhFQW9ZYmMzSXVKaUxQ?=
 =?utf-8?B?cXo5SVlmd3M1NTM4MXBCbUdJRTkvSWRmTjN5WTVFaGdQemp5U2wyM0xvM3gw?=
 =?utf-8?B?TFp2NlhqaWFMRUJQWUpTMnR3VWZqNGRDT3V4dEorbFhtOUhBVjhhNnN1dmFw?=
 =?utf-8?B?NUZCMDZrVTBlMkJUbnJORzhuS0hBQjJtT0YwM0QvRW1Lc0x5bUk3blhvZEF6?=
 =?utf-8?B?aGF1SXJrWWl3enZkd1pRbzhSTzk4U3FuNGNHWFV5c1R5OERnRU9QTjk1Nms0?=
 =?utf-8?B?T1plSGpYcUVDNWJMYlhQN0pFWkVxMzRKcGRyeUh6U3NqWTBuaGQ1aXlHbjV3?=
 =?utf-8?B?a2VkRDBnWitjbzNwZFNCUW9kdEgrdXpOZDRTeGxueUhLNW11ZldHNjdiS0Va?=
 =?utf-8?B?Wk5VZFhGSTJwU2dqUWxWSXhHMnRocW4yZlM3VUJKUUJ0R3ExbFB6SHZYZ2xH?=
 =?utf-8?B?TkZHWjhOTnY0bUVnNnVXWENmZE0xODhuK2dZdjhpL0ZmbzQwNGVWQjhBc1BQ?=
 =?utf-8?B?OXVBaGxCYjJDTnRab0h3UWdYakxGM2E4R3IwbzE4ZVFFSEVsZWRLWU5RZnlm?=
 =?utf-8?B?SFQrZjJXNUNXdTJRVE9lUFBvczhSOWJTeHFqbWhrdTJ6YXYwcitTR0g0YmFj?=
 =?utf-8?B?a1Q0VDl0M3pXazEvcGRDT0JiUHIrQy9xNlJNaW5pNmZnWDExWFlWSE9TclJH?=
 =?utf-8?B?UURMMW5FM3BTalRSUFpMc093bHI5dzdTcVlZeGNzdmt2ZlhJWHc4eDd1WHlr?=
 =?utf-8?B?MVZjQm5EeXUvWnVUd0J2bkxNaXZZaGw3QUtDdVUzVDgxZkg3NGdDWFdZYU82?=
 =?utf-8?B?RVdERjkvcnRZbjFmQU1tdkFXL25vTEFyUVdFNmtzV0VOMEN4amxrTnVybkpO?=
 =?utf-8?B?V2N4OEZjRXgxR200dEFVUkRjSlhGTU8rVnErc1owSnB0cXdzNXBEaXdrUDJY?=
 =?utf-8?B?dUIxMk9tL2g2ODJIZTRIUDN1Rk5CZm0vY1BQT3NzbmNHYnl0cG5NSzlQNkRL?=
 =?utf-8?B?MzA2VVVwS3kwL1Y5S3l6bUhpYXZ2VGY1ODh6RUhHejFaWlJRK3p3OXRlMGZZ?=
 =?utf-8?B?enM0TTE3d3N6Q2dRa3QwU0dTYkRpNGpzZ0hHR0F4enVsYzBieUl6UG91MkZI?=
 =?utf-8?B?L1VScXlDZkZubmJQY1RmRFJzWFQwK1I5M2V5Yk5SbE9RSnZoZUptc1lJMjFZ?=
 =?utf-8?B?ZjIrMVUrcm9pYWlUSzB2eDlXM3ZpMFNENHYxcWxvSkI2bzFGNzhCWkFDNGp2?=
 =?utf-8?Q?KngmPkOpW87cYkakaW4yLwKey?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bd0ed0-0202-4c13-4554-08ddfa45dfa9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:06:56.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /P7WS7E47/bvI6WbGfBTEMOk4ewYt0LYMXLVM298a8kXEEcvX8a6jPUfhPWSy5hCuRgIRCTUifXP3I3d144y0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_030706_253357_C72B8810 
X-CRM114-Status: GOOD (  15.05  )
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

Add bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changed commit message to use imperative mood.
---
 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bd94254c1288d75f81662ef12b7f79209efb45f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dprc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Channel
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Display Prefetch Resolve Channel(DPRC) is an engine which
+  fetches display data before the display pipeline needs the data to drive
+  pixels in the active display region.  This data is transformed, or resolved,
+  from a variety of tiled buffer formats into linear format, if needed.
+  The DPR works with a double bank memory structure.  This memory structure is
+  implemented in the Resolve Tile Memory(RTRAM) and the banks are referred to
+  as A and B.  Each bank is either 4 or 8 lines high depending on the source
+  frame buffer format.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpr-channel
+      - fsl,imx8qm-dpr-channel
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    items:
+      - description: DPR wrap interrupt
+      - description: |
+          'r_rtram_stall' interrupt which indicates relevant i.MX8qm/qxp
+          Prefetch Resolve Gasket(PRG) or PRGs are forcing an underflow
+          condition in the RTRAM.
+
+  interrupt-names:
+    items:
+      - const: dpr_wrap
+      - const: r_rtram_stall
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: b clock
+      - description: rtram clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: b
+      - const: rtram
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this DPRC instance.
+
+  fsl,prgs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to PRG or PRGs associated with
+      this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
+  - clocks
+  - clock-names
+  - fsl,sc-resource
+  - fsl,prgs
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dpr-channel@56100000 {
+        compatible = "fsl,imx8qxp-dpr-channel";
+        reg = <0x56100000 0x10000>;
+        interrupts-extended = <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+                              <&dc0_irqsteer 324>;
+        interrupt-names = "dpr_wrap", "r_rtram_stall";
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };

-- 
2.34.1


