Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F3E606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oblh4y+s;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cIGtOA+H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FfK+EaLlfdX1tscNQzDj2eCu9z9s7fCeCB8RqVMbzfc=; b=Oblh4y+sOTIi50q7WQQMiHHmvz
	m3O0RRZGn1e9QsSnLmqYFyGT1CXqa7+kQl7dSGCqxwZAHb8bGRYHn7vQlGWnJvLo9Wr47Kak6U95w
	mUtXGSqYl8o1V/Ze6VsFd9D+7Si8ocSrviUndmTqT2cCS83BsLdukGivgg/dXGZFfTRJ9yIZQAKzd
	+oNfUSLuzF90+nTjNgBlqtytRjUOjKUK+j/+C4tet70Fm4u/IXH7rStkbOXAec9f6J+AoLaytiVJ9
	GNIfuHE9yQuphdrbCp85M54G+lDzW52sdyErM/Me0owz2W5ps9VX/NTv2tRLPm+Fga6aol2fb3NhB
	eBKKwdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj87-000000077gI-1HIm;
	Wed, 04 Nov 2026 22:06:53 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj85-000000077f2-0HAe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:06:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+4Re47ci36M3yJAhubapE3o1UeK09P8hrdqKS8ou9udAjDdNfnJ+kOqI4c3WVyHwCffvdjTxgHH+O/zrSOrpUjqq8toSOAG9nQD20j4S+/LLuw7KOv5e6wc1CRBdSY/fDFWfigGaexraT2qzVZaNnRc3SUgU2MUVTt2FIG/PIGFLGGuIEmUapE48MnQD9G3ULUcXcVZcrkJGUG8tqnspgVjgPv/CGceVXZDZFv7ZuhDuMgyolNFZElqy38AwhDg7vQJRmtAMLovhMsd+69ltib5HS19elSfUk2tGua5lCbr+nldvWw2TSPJ/od7Q5BQjeEBcw9diRSNqxozB9AYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfK+EaLlfdX1tscNQzDj2eCu9z9s7fCeCB8RqVMbzfc=;
 b=RQ3crpEn0TAABzJ83Ny0i7Dxn1t1uj1+tn2d7X3+Jew1ihJ0AMuuHlct/wY8qmIGwSRCZYFNhHHrAS9EqmVEa+AWj35aXuYNOU/DRFMwabHHjhPvvtpPP41nBdyr/8oiwjutHBbwW5FXRAt1Inc2tcG1FB0+v7f8XYSoK/R0k7hSPXFYZQVlFFNyvCMAybCMQE3rqR6yNWlXSpcbraDyJmR+kXMUyaTFPo/XrxO5ZhbQx72dV4S8b9VR8xanuamw4GbkhNLBkF8pwyjBe9nm86/OXz3lPaBNaQSzRaKpXW9nHLyx5+mIbZblL2Y2uUj3vuGaDHziVy6/FPHamPDIJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfK+EaLlfdX1tscNQzDj2eCu9z9s7fCeCB8RqVMbzfc=;
 b=cIGtOA+HN7I4HmT0Oupd6YTTK5L6qG2YSScSlpjxSZLLBvGYFbMq0EW+y11rmeeeIWBtx6eYsgFiGfFsYi80o5Y7CSXBVhHecMRNvThmKcW2YlZeeeCf2Trhmj5fk1i5haCK4cgsKtOaRP73VV4kgYrui4g0PvDIyjsxvBNnVMlLIZpCMsDZVH2I6CjT5spGZyokEYJvsWcuGthkudeEcKkht3wovu7a4sO3ptTagDoEYqeOP1cXavvuISO+542OVWMQ30Oy/K/cOXa+sGVCJ9DjrzQN7Csa8esND0PFy1bEVyqNbV6Cli0lRr9PBAPgeXD2ClIDvGkPOfLnJqI8UQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10776.eurprd04.prod.outlook.com (2603:10a6:150:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 22:06:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 22:06:41 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kaszubski <sympthicode@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Date: Wed,  4 Nov 2026 17:06:32 -0500
Message-ID: <179382998972.3912318.16272070383640645687.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021150403.71569-1-sympthicode@gmail.com>
References: <20261021150403.71569-1-sympthicode@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::6)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10776:EE_
X-MS-Office365-Filtering-Correlation-Id: 6611ccc4-562e-462f-5419-08df3abfe799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|22082099003|10067099003|18002099003|11063799006|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: Z8vvNaByXuyZbOsZWVegO68U7PSBpqp1U3GMcmpYwmgwuHxaoJSh0zyMci5urVCGIGlt8nKi0SA0EB9FvI+honB4KckMaAZh3wErLwkhzd88FO4Ts9XwKSlWfni7ONY3veLB/c/xWyUVmJ6sZC8peIUAD/+61qJ4DaeDyhh2deeAXxPkWc99gkflCsFOlUe8rgWqYhtz56PkEeVeSURr0Dxmloce2CeR8XW9zPT473Njic4U/Q2qtQgtdPdYkwTW0OhUeuyrDxeS427ADT5R4g2zta0rXsH0S7gluE8Ma9C+QKtsZ676xTMqMbprPm42QDbJXqwxbFHQdAqkWYT/KvVbxHcLb3Yl+JbF2i1z+Yv5yNOQr/bhVRw3Gvf2pO3jWKi4Rtuur5YrmE2RGnKHhbi3D8fosjfK2Zmd9iyL+VOtLj3Fg/hvm5anNLb6tqPW3+jreakxu/+Khr96wO/EIuZKbOwc8jHhaYOpyRx43X8fiv32VFv8Aam53Aj6LA+zeplCRfVCpg708EAbJ4gl1sEaS6xAFy94EAn1ABkcDNBYx49LRaCSvLSe8XK70a0oMIYu4n8I1E3Mp4AZ3gWi902FEpNmtKeqXoJqhYXv0AEe8ahxSUZ+oFHKf56zHlF/FQXAp6QDhRfDH35SOMheS4PrfgodujE4L3OaC3CPOQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(22082099003)(10067099003)(18002099003)(11063799006)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXIyWUUxNjQ1cFZaVEJobDRjS1dxVDFvU1FvQldXY2xWTTdZREQ3eFZnK1pi?=
 =?utf-8?B?SVQ2cWZmOXZUbEljMno3blRtNHVQNmlWUVc4d21xOG9RbWpWNEVqVFc2K2hu?=
 =?utf-8?B?TzJpbkdIeEs1eS9xR2luTHNNUlE0L2orSk0zSUJUUUYwMmxMYUFpVC9FNUZH?=
 =?utf-8?B?eEZiNmF4KzBsWGViQytJaGhoeSt2U3RCM3l2YkVkTHNoN0VWT2I2TitSM1dL?=
 =?utf-8?B?bXBROHVVUWVJL2pKQVhLdnF5WHFlVjd4YzJwSEVrNWNnZkZxdW5ERGk4NDlm?=
 =?utf-8?B?dm5KQlJVSkRnUXZLY0VtV0VNVFkyMlJMQUtiZFFFa1RLUW9kMFRudXNOVWth?=
 =?utf-8?B?Q0RZaWFDTTBwYXBNa0lUTUxOaHlOc0ljUmZGU3RmT0hpODdBU0xSUVNYdld5?=
 =?utf-8?B?aHZlVjdQYXRRdHRPUVl2L0dyZVlweXBRRDFyeCttbU1XUHNJQjl0alZ6RlpZ?=
 =?utf-8?B?U2NHZEFUejhtM3ZhWXFEMjY0SU5UaXJkcjBLQWNnS3l4Z2tIaWRMYVYzK2oy?=
 =?utf-8?B?T3NKVTJ3T2hlRGdXdDR3bVBxVDQyZkFTTURhNWNkL2JlODliZW9xaUJaZkc3?=
 =?utf-8?B?REhnNDU5Y2Zvd3gzTG5MTjM1VUhSRnQ1cndNZVRnOTRQUUR3MlIzdnFzbVVS?=
 =?utf-8?B?NVJ6ZndaaDlyNUgwMFdEZEFTd21GSHp1OEc0T3h3ZW9Ga2pXaCtpUGtxczlL?=
 =?utf-8?B?eUFWc1FjR2NPR1FSbUI5dHhRYXBKTmVRWUpYai9GQlZvUnBoTk1CbXBDT1FS?=
 =?utf-8?B?S0NvMDB4akRhWWo5TWxheXRjSlhvbFJqUWJNWk5aZTN4WGFJeVVWeVFDVFQ5?=
 =?utf-8?B?RWRjQnhsMk5mOHFYRTNxUmZrL2FuL3V1MGNRK1BoQkMxT0hkZnpZOVFhOXRP?=
 =?utf-8?B?MXk2Vml6aExsYlozRW5XcFNZY0NuNVRFSnNaRUhMSGxxVUZwL1l2TmVpdmxV?=
 =?utf-8?B?QjlranZUMjFxNTIvMHZzL1VpWTlURk8yajV4T1I4cUJvanNXUC9Dd1FwN0l4?=
 =?utf-8?B?UEp3cXh5YXFFSThhVjhlbTJncW5xeDJibTQ0OE85S2M5dnUvMGYwVDJ3UTlr?=
 =?utf-8?B?Sm0wc2xNMFMyY0Y2NmdsUjdLb1ljV2lHRmRRalN3UWk4YTgvcmdSNUFvK2Vp?=
 =?utf-8?B?bmdqL3hkTGpuSllaTWYwSEVqZmt3aWJjKzU4NldURjBkclN1VzB1ZFRHRzFG?=
 =?utf-8?B?Rm9YdTJXSHlURGlabFJyQlVNL1dpNUZZN1BFUUdZeUNPUitNMnAwa2tzbERr?=
 =?utf-8?B?dHpLc3YzdHpDY093NWFjYnRnY1VOMU1uUndnVnoxNGFNTFl3KzU0azdGb2Na?=
 =?utf-8?B?QUFOWkJKYlRCVXVGdHByTys0OUFJL0tZYzZxdWhqU3dFRmpXcWhNeEplNDBw?=
 =?utf-8?B?QUx6OEtnbTdGd24yb0dHdmZzaFF5M2VtRmFBMGxXaEtvR1dld3JTQWlaa09v?=
 =?utf-8?B?QUsrUFd3eEJpNVZDUStITHVpT0t3UmRhc0sxSzVZcjJlKzlFNXFPc1J2VHN2?=
 =?utf-8?B?dHp0Y05MSDJsdmY4bGJwLzNoN1dYS2o4WXlHclZoUmR0VzdiMzA3NnhZQmtX?=
 =?utf-8?B?Vy84WmJGbGJ4ZHhOUm42ZmdFTEdBMHJwK1JkUjFHK0RpUktrQlI2dExjZmht?=
 =?utf-8?B?am1Wa09IY0lPSEJmVXFtRG5zZ09lUXBRZHdBd3JJOTdib3pzLzhFb25VdW1V?=
 =?utf-8?B?S0s4MWo0SExnUklHbGVUaDJ2dXVNRHJUS05rbnlDcVg4dXEvMTRpaFRraFNE?=
 =?utf-8?B?VThmUS9HbHdndGI4RWtxYXI4UUVBVExWTk1sTWl6cktDdGVPZFpsdjdsb3dk?=
 =?utf-8?B?M1ZWY21YRVE5WU56ZlVyVWNvVU5sVmRxeW9QSGVRYWtxTjRyZUJvbEdtbHg4?=
 =?utf-8?B?b01FUk9iWTVpbzhmUlJCVTY2NUZIZG8vTEFpZWY5enVGZi9YdmdGNkdFeXFa?=
 =?utf-8?B?OWpyWUpaMlNQSER6dEhZU0tWMU9RVXRBeHhjb25BVks2Z1YramZPTmhOVXEz?=
 =?utf-8?B?cEZQR3g4cE95QXl0VjBqNkZiNVo2ZVYvTVN4SDgraXVPcnZ0SE13NjZOdGRu?=
 =?utf-8?B?SjVrTFVYMUlvbGJ5ZHRhN2xLWTRUclhQYlFjK0JCSHZKZVB6aUpMMWNqTTdR?=
 =?utf-8?B?NlpiWHZRTWJzMGRCbjBLZFZpWXVhSXFESnJyS2R2TlBnU2FyU25nRUZoWTBa?=
 =?utf-8?B?cGxFa2dubDFBMkVzcHlLRitOWTdJelA4T1VQalBxbGhEZTEvRUlzL2VvbzFR?=
 =?utf-8?B?YlpBUFZYN3JySWp5QXhZOVRvbDAvM3o1bmJKL3JYL2dQS0xpeEdHcGZTaitV?=
 =?utf-8?B?YUxJaE1yTVVhalFCb1QrMjYyVEdib0p3bk9QZWNhSnRzaUNjTTZCY1RzMm9h?=
 =?utf-8?Q?vBnGG6hXNLgicKkKn7DGJz+lbLXQuCzbXkmbd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6611ccc4-562e-462f-5419-08df3abfe799
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 22:06:40.9299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsCHaIAdspylxRKZjR9A1mVW00T+yS6Txmf9I2drKFlIsicy61bvSUhx1Xt89awnxNL2EiJJrh4AGIVyaVKkhWHDovkohfBOhk5qmHkkl9mw7rSCyeHRmfwkuAPJgliS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_140649_107170_98BAB481 
X-CRM114-Status: GOOD (  10.79  )
X-Spam-Score: -1.0 (-)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Wed, 21 Oct 2026 17:03:31 +0200, Krzysztof Kaszubski wrote:
> Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
> node to the i.MX 7ULP device tree.
> 
> TPM6 is located in the Application Domain (Cortex-A7) at base
> address 0x40a10000. This enables PWM and timer support for
> peripherals connected to this domain, such as display backlight
> controllers.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
      commit: d00ea6ec73f6288cc05dcd9b66d35b078c2149b1

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

