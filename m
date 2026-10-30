Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FBD606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lo0xZxwO;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZPnN3P9L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JnC8CdhEKNtRrFiMA0XoktNzZiMaLY+/DBl0rnM5I1c=; b=Lo0xZxwOb1v/Dy0TZlZZ5iHAUd
	eW9jM+osKGi4qXGWg8zNCtJwqrRAAUFfWVi3i1sc9YBT4x/4TbPWYto7fNAuOvl1MaiGLg1269Zvx
	IV33wPXORbohfrctwECLym45Fjc4p+txFIjOnw0nvuwoTBZvFmsV+t+gcNDaXtHJG0qZU5f2Zx1bM
	yeJKdsoHn1DEa5eEedSfFNrqzgwnEH0uIbSqis5VBIWIw71ML1dh+S0dZe4IEzIdOT3WXjwPLq4HM
	YPBaLIShwmDehjV7hg8O6uG+z+Y+hf+WQA2jiwwsjc8LkXpZNL7/y4Rt4xnY+D6lCjr0O3IuS62/8
	e/yCuauQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlMQ-0000000BdRl-43hn;
	Fri, 30 Oct 2026 12:05:30 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlMN-0000000BdOw-2619
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 12:05:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRUr4zEZaHVrEiAh6cfrYn1CbIGp+AM16wnclX8NMx3BmEjBGGxLY4+1uoxKfBahCjIHQ5SMlFsctKpgmV8XNI2sImBulhPdHtnk1+MQ+QoY4IihELuLpJYiERD5q93B/XpKigQVia3cgOwu+WRhWJrxi6BmTtbrRswJ28dJamQJPdRSgUw0OOlE1GQlixoFU2TnaOPiUNTGmGrHfc9vZgBCmmvT/nd4y1h9N/vrkEDpTEU2DDhvQXv0Skhd+LaPp8DmRNKtvzZ28xTmhJfrK6PAGi6qm9WK/4lKaB5HX/vqdemHqRBrDQEBeSWX1ZO9UR7GsD6Cqqy3J/2PUGs0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnC8CdhEKNtRrFiMA0XoktNzZiMaLY+/DBl0rnM5I1c=;
 b=XFRCo51O2OZ8v1ABx+KY+lrc9Sz2BRdiXBuUW0fc566LqQLW6DqRcbARA8PaVNo/NsqSzQ+MOR2O3VHToyFpKfBFQv4Ic0IJcOQNtW1vbVDAUQRp0/rv4VHN/jKlgcmrbFoUfeYspZyx585fSh7zixhcnAmniKUt9EYEX8nenK/5tUScBKJnm3luCJHrwsIuEtiGHR6cmxYbMU7Mtj6GE5ZwpSyfRsH0VSG9Tlx6MeQgQSbIR+QSlxpEWnO0nrvzZs8A/LGZyhhPlUTThXtXkUrq62M+RHdrIN53ELFqDE/s5rWTP64D7A6/68QDtri7ASUOab7lzBYpERkYbf2Ibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnC8CdhEKNtRrFiMA0XoktNzZiMaLY+/DBl0rnM5I1c=;
 b=ZPnN3P9L4p7/mvVvHHag6iH3QFNdcv1dLlnyFKNzy69wmrAAvzwdlLlqbwSSPv6Fvud0EG08OPqv4/EveAihuRHrV3fDr+ZIriRymFZr7Tl9RfCKEhFIfZ4dSPBU/Tqt7M2Q0Xy6QMKd7KZR4aKMLrAatGxwsbwwzRv/w/N4CUEBpJzvPkysrPU9OXaD4txOFqmymlhGSiEVqaQBEkJOe9dR2EptIFAYOLHxYL+XRGkx9vs/t5s7r3A5kn98h68kF6y0BncNWQXt+steKNrWVytFyTa3uXABYyHFPeIXfBoam4EuYjsZZrP7vovxkBTikVgEOuvxcuyV0fMM42VaTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU7PR04MB11162.eurprd04.prod.outlook.com (2603:10a6:10:5b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 12:05:22 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 12:05:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 30 Oct 2026 20:09:37 +0800
Subject: [PATCH RFC v7 5/7] iommu/arm-smmu-v3: Support shared SIDs in
 insert/remove_master
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-smmu-shared-sid-ver7-2026-10-26-v7-5-961726ebd6ab@Example.Com>
References: <20261030-smmu-shared-sid-ver7-2026-10-26-v7-0-961726ebd6ab@Example.Com>
In-Reply-To: <20261030-smmu-shared-sid-ver7-2026-10-26-v7-0-961726ebd6ab@Example.Com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Krishna Reddy <vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU7PR04MB11162:EE_
X-MS-Office365-Filtering-Correlation-Id: 13dd1a52-93e0-4ea8-0d88-08df367e128e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|1800799024|376014|366016|6133799003|22082099003|18002099003|56012099006|11063799006|5023799004|261026121527099003|261028144727099003|10067099003|261021121427099003|261026140227099003|261022075727099003|261022113327099003|261021123027099003|261022105027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 5PY3AqLGCBVeHXH1szTGAjLYX64/akUy9gA0sAoefkxdm1kdt/vHRMl9yTVc7g9i4qfcc2WQ7oibH7AYMgHLYHGIc7ZdAw+dmK9qRN0sEOTACmgR3T9zmu3yrgDEbFc5erw9yRB3miOpodhnSD/a65HtrL9xMbP+cgJl16mda60cdtk32nl7r6dBb6oacCLT0D/CcPiqB+/gH6taBFMhKN4RvM52XxoegnZ3i4RaXaeHvapUAFzCpACFjWg3rjA4TEJ6hQ3bRT/gJmpHBKxDtyGvXtAYYc8U4hcSvMtIKk1sHYG7sP9+qO/nuQePrh//KYy++vSyb43N/xwydJQ8WwiLQn0RbK/ygHAcmMCX/Z/bNiZ3jXYwssOo2ZbpWTTdPzCAjQEMzq17OPVKafbvubOiXCfbYZJsYsvYqtPF+GnM9naFBJp9bbcBGucpg3oCIShAKgl46U+pDQVvMSzYq9Haee8q7vQ132WSuxwllRz6FMbG61lL2cJbuJ9RZeDCur9YYjHy4ZEBuKkbaOdtKxwjy8yNnJvRsL5sBPYgBsx7HLiTKNO534HrbMtuaLUx6ttD5Ud6C75WVWyaFxlIX8YyV0eCpHv4tXuRyzMLrTeOnWtZFSVoe/ADpPddf2Zp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(261026121527099003)(261028144727099003)(10067099003)(261021121427099003)(261026140227099003)(261022075727099003)(261022113327099003)(261021123027099003)(261022105027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGtocVN6NUQ2V2Z1Uk5hUUZCekF2Z3hLd3ltdHlWZk0weGlWS1EwWWJLNU9M?=
 =?utf-8?B?cDZnbTk3cUgwWXh0aWhsZnJoOUIwRUtZOE9uS2lMKzBqOWQ0c1VLSXM5WXJB?=
 =?utf-8?B?ZkcySEp4NWNWaGJoUHZGRk5VTFJGNklWdkZjL2w2VkV6ZmwwYjlxV0E5NTJn?=
 =?utf-8?B?QlVtbHhwTFQ1bFlzaTVFTXFJM0NQZ1VyOTJrazNxa2N1SVV0S01uNlpOUXV3?=
 =?utf-8?B?M2hZV2xXOW91V0tMV01NMGluOXFqVlNONmNIeSt5Y0dUVWtFSlVzaUUwSysy?=
 =?utf-8?B?dERPK1BOdDNLQVMyeVBJak02Zml3TXVjR0kyWG1MbTVwN2cybmZrU2hsWFJm?=
 =?utf-8?B?ang3bmpUOWFHTVBVb2xGNUY5alE0L0JQdThPcEhsZnU5TWhueExVZ3NJS2RC?=
 =?utf-8?B?a2x6L1g0cEt6NFpXY0JIUGhsTmFwYmlvak53UHNBdFF2TzdjUTh0dTFhY1BG?=
 =?utf-8?B?eDZNaWpSTndEaXVPSHRaNTgvQjd0aTgyNUVzTFc5SThjNk5INHlaLzYxSll6?=
 =?utf-8?B?UnRHYjd2RVZObkdrS0RQelZqdlVJcVN4OHFLOUxLa1pTc0R0VnNWTjBCcW01?=
 =?utf-8?B?ZytKa1Jhc1hYVktxTTA2M0M1RW1BY1ZTTDA5eGRlTmthR0dyOHhwTTJBYTAv?=
 =?utf-8?B?RWtGbEluOTBJWElGUWtvejFrZml4bC9DR1NIbGUycCtKcVNmSytJNkUvazBz?=
 =?utf-8?B?NWdpWHJqMWJRaitVSGtoc2IwQ0djYTdjWlQzcVlvc2hwcWZmaHNlOFRrdjd2?=
 =?utf-8?B?dlBiWVhIQ3NuUW1rSUNvV2dDc2M1RFJTa1dwcWtmTlNsaGZiUEtBbExMMTg1?=
 =?utf-8?B?ZTBEenZFdC9KSHFtSTdFL1p2S0pxc0dBU3N4cFh5cGh4N3lTL3llVUZzdWw0?=
 =?utf-8?B?aUg5RjgyV2FPNEJTRUVPNmRnN3hFRm9MWHMrOWJLZllzemF5UnE1M3JoSy9w?=
 =?utf-8?B?VXlkeG5sMGNTV2xSWjNXWExHeXN4bk8zdVltS3E3bDVLWFJNOStUWHR0WnBl?=
 =?utf-8?B?MXlJWU02cldBVUVtOVJwTFZkejJlSzBzZHdhaGZEaDU0MDNuNWhLYnF0MlZx?=
 =?utf-8?B?MnUyVkt1ejkzREpTc05DOENZV29ua0lrSEVpT1E4UzR4am1FeTlnS3Rad2Na?=
 =?utf-8?B?Vm02bUhiR2VscHFVZ1l4N2lpUmZXS2szUkRWYnplRVF2NmY2OG9lT1dubmt0?=
 =?utf-8?B?SHBBVStONjQvOXBlbGxib2o3NDl3aXcxVnJzTFQ0dVdOeUlFSFZOYjVIWWdJ?=
 =?utf-8?B?Zkh0VjhrUTBqQ3VoelpUSVJZQWdVUmZhRlBoYTdCbnJzb2dQS2ZBWmZ4Vm5F?=
 =?utf-8?B?Q2x0WW1sNU1OZGt5dXVzSjQ2dVhqTCtkc3dYMmJOWE5JZEh3ZmhCSXZLMnNr?=
 =?utf-8?B?di9VbnlyN2FKS2doOEtzR1d6VkJoY0dQU2xtL0RjRWZyUXFwMGFnZDYwVnBh?=
 =?utf-8?B?VExpUkZHMXRMRnp2NksvVzJlaytFZ0pqMkY2WmVTSWRvaGFYdHZHTFg3UXpu?=
 =?utf-8?B?OUlRVmVhWVdwOGpneHRNanN6NFJsZUN3QktJOStvT1RDdzRpK3NIRXczYldO?=
 =?utf-8?B?SURSVjdrZnZSNkt2QkZTRDV0VkRpa2pYNVRQNWp5aTNwcytDWWZFWDNGaWxk?=
 =?utf-8?B?NFVNQWRFL3hPaVhUU2FoTEhON0VWRGhjN3MzSzFNSXYxekpvRmpFQVpCc2R3?=
 =?utf-8?B?dmJGL2FWTUNnaExYRHNHWWVHZGp3WjJrVGx3RTJTYitwMkFVQ29Da2Nlby9P?=
 =?utf-8?B?Y2o2cUhvVy9wNWc4eTVCL2NpT3VaRlFRNitCeXF4TXY2bXgvUVVYVC9MQTg3?=
 =?utf-8?B?K01keGFwNXZMWVNxbXg2eFora0hCNEQ5NTJ1elVzM2Q5TjBCZDRLREZ2RzJQ?=
 =?utf-8?B?NWwvMXFQenhhM0EyM0VxdGNibEg2b1V2ZnU4VlhSL1FJWngzSGtyelZKR2Zv?=
 =?utf-8?B?UDIzcU83TEd1WnFSZkFyWnJ5ejBYSXh3aG5ZbWhielBBSjJjWEJYQmdCVy9x?=
 =?utf-8?B?aVM3RzM2S3FKSWZTeGJXMEhrcmZFVTZsOURHYlUwMnBmMGgrYk0zdjQ3M0NT?=
 =?utf-8?B?OWdPc2lla3VmaTZZdlZhVTZManlRUHlqRnRlK21RckhKYkx2WTVCbDc2ZTlZ?=
 =?utf-8?B?OFdlcjlNcUFpdi9mcVFkVnF4QnczcXFqQkQ5MllJaGdRcGlTT2dKNmxDc05h?=
 =?utf-8?B?VHlJVjlyOHRiSm5KOHcwWTNTbTRKKytXbDA1Q2tJNFBoeDdUQWE3V0R5eW5X?=
 =?utf-8?B?RVV1YmZydVgwMFk5TE1lQnB5Ky92SmwrZkc3bFN0VVcvOWJIcGkySmhIbkRj?=
 =?utf-8?B?S2h6TWNsamlPanFicjlESUhhVUgvK3pjMzl2RnBZcmU0M2MxWC93akoyRlpP?=
 =?utf-8?Q?5OQgs/z6SL2NcMMlQdTm8xV+dNr9+9R2RRIba?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13dd1a52-93e0-4ea8-0d88-08df367e128e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 12:05:21.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXOiLCU7Q91dM5XVJ1Wyr8UXUUekyvadh6s688x0Lli+hF5hLLLDkug82lZyh3AF1nnpXlgR02J38X5QcpJMZ5ICOgR4CAP3Yg66QJ5j6hMmb8KWuLkNz0wMd1yTO8BG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_050527_695785_E011C249 
X-CRM114-Status: GOOD (  19.44  )
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

On SoCs like NXP i.MX95 where the SMMU has a limited number of Stream
IDs (e.g. 6-bit bus = 64 SIDs), multiple DMA-capable devices are
assigned the same Stream ID by SCU configuration.

When a second master attempts to use a SID that is already claimed,
link the masters together via the stream's shared_masters list instead
of rejecting the probe. The stream object is shared directly between
masters - no duplication.

Sharing is restricted to single-SID masters (num_streams == 1) to keep
the STE lifecycle simple. Multi-SID sharing is explicitly rejected.
Sharing is also rejected if the existing master has stall enabled, since
dynamically clearing stall_enabled without reprogramming the hardware
STE would leave the stall bit active and risk an unrecoverable bus
lockup when CMD_RESUME cannot be issued.

On removal, arm_smmu_free_master_streams() handles both the shared and
non-shared cases: a shared master detaches from the shared_masters list
and ownership transfers to the next sharer if the departing master was
the stream owner; the stream and its RB tree entry are kept alive until
the last master using that SID is removed.

Since fault events on shared SIDs cannot be attributed to a specific
master, arm_smmu_find_master() returns NULL when the stream's
shared_masters list is non-empty.

Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
Link: https://lore.kernel.org/linux-iommu/Z3r-cBm00tVE4eKe@Asurada-Nvidia/
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 55 ++++++++++++++++++++++++-----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 ++
 2 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 510c9028fa19f..605d4179caaa9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2124,6 +2124,8 @@ arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
 	stream = arm_smmu_find_stream(smmu, sid);
 	if (!stream)
 		return NULL;
+	if (!list_empty(&stream->shared_masters))
+		return NULL;
 	return stream->master;
 }
 
@@ -4415,10 +4417,26 @@ static void arm_smmu_free_master_streams(struct arm_smmu_master *master)
 	lockdep_assert_held(&smmu->streams_mutex);
 
 	for (i = 0; i < master->num_streams; i++) {
-		if (!master->streams[i])
+		struct arm_smmu_stream *stream = master->streams[i];
+
+		if (!stream)
+			continue;
+
+		if (!list_empty(&stream->shared_masters)) {
+			struct arm_smmu_master *next;
+
+			list_del_init(&master->shared_masters_elm);
+			next = list_first_entry(&stream->shared_masters,
+						struct arm_smmu_master,
+						shared_masters_elm);
+			if (stream->master == master)
+				stream->master = next;
+			if (list_is_singular(&stream->shared_masters))
+				list_del_init(&next->shared_masters_elm);
 			continue;
-		rb_erase(&master->streams[i]->node, &smmu->streams);
-		kfree(master->streams[i]);
+		}
+		rb_erase(&stream->node, &smmu->streams);
+		kfree(stream);
 	}
 }
 
@@ -4446,6 +4464,7 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 		kfree(master->streams);
 		return -ENOMEM;
 	}
+	INIT_LIST_HEAD(&master->shared_masters_elm);
 
 	mutex_lock(&smmu->streams_mutex);
 	for (i = 0, n = 0; i < fwspec->num_ids; i++) {
@@ -4462,11 +4481,30 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 			if (stream->master == master)
 				continue;
 
-			dev_warn(master->dev,
-				 "Aliasing StreamID 0x%x (from %s) unsupported, expect DMA to be broken\n",
-				 sid, dev_name(stream->master->dev));
-			ret = -ENODEV;
-			break;
+			if (fwspec->num_ids != 1 ||
+			    stream->master->num_streams != 1) {
+				dev_warn(master->dev,
+					 "Shared StreamID 0x%x not supported for multi-SID masters\n",
+					 sid);
+				ret = -ENODEV;
+				break;
+			}
+
+			if (stream->master->stall_enabled) {
+				dev_warn(master->dev,
+					 "Shared StreamID 0x%x rejected: existing master has stall enabled\n",
+					 sid);
+				ret = -EBUSY;
+				break;
+			}
+
+			if (list_empty(&stream->shared_masters))
+				list_add_tail(&stream->master->shared_masters_elm,
+					      &stream->shared_masters);
+			list_add_tail(&master->shared_masters_elm,
+				      &stream->shared_masters);
+			master->streams[n++] = stream;
+			continue;
 		}
 
 		stream = kzalloc_obj(*stream, GFP_KERNEL);
@@ -4476,6 +4514,7 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 		}
 		stream->id = sid;
 		stream->master = master;
+		INIT_LIST_HEAD(&stream->shared_masters);
 
 		rb_find_add(&stream->node, &smmu->streams,
 			    arm_smmu_streams_cmp_node);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index a45a5a1580e0c..c57221b311245 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1021,6 +1021,7 @@ struct arm_smmu_stream {
 	u32				id;
 	struct arm_smmu_master		*master;
 	struct rb_node			node;
+	struct list_head		shared_masters;
 };
 
 struct arm_smmu_vmaster {
@@ -1069,6 +1070,7 @@ struct arm_smmu_master {
 	bool				ste_ats_enabled : 1;
 	bool				stall_enabled;
 	bool				ats_always_on;
+	struct list_head		shared_masters_elm;
 	unsigned int			ssid_bits;
 	unsigned int			iopf_refcount;
 };

-- 
2.34.1


