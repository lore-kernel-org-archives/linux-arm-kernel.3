Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB8606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=miUUUsqn;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DmSyoy2S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s0AS4RfSL1BCj1Yo7Y5uF/DVJ64mL0b6elqoy0luQ1Q=; b=miUUUsqnX8yakjiwNNMeZKA77h
	UD0WzItwgH6hrsSuoRAoDxSFydEcqNUiu82c2NYwB5IfWXMgWZ21cMVIF+eI6kX7mLD4uN59WftP4
	oICMXhoO5Iqgq9Tk2MNQ9p8yQB1zf5TRLzSCmjHf+6yn1bdYaF4CIP/jr3CpCD/ywWUHmA1lXbzbW
	kqteEU/VjgJPGBMOSZ2L3dHDyq1LFX6t+N3B9TaP6FYtLxYcgBNCpR16U2xyQGY0g1oXom5jJkAct
	O76uhUVh9zc3oz0GBPjRstTjCtrLiaOx/rkDkoRI87nGAYJhrhjsQmv+U3SiLrWUqv10ItdrUi6FR
	MNzBx3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZui-00000005HLH-3uCg;
	Wed, 04 Nov 2026 12:16:24 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZuh-00000005HJS-0BEs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:16:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gE2L8N8iJJD5nvs+DrYllcF0f+PhOcFB9wIt0GShi/u18cRC/gZWwtKxltfImWlJ+aA6g0MNSYlbRjO22ZqTb8ZMcvBCmjeUUcQ0+p5BLayhoP2URhFXat2OIROFJIuiqArtRhDDJnY+YKUIhNc66UFgk27VA3dbhgu5yCwC1doIU43FgQ3EtWR5BisJGVKy69e8eK5NemnT6GyeD7SC07OnZ8Lza2nSJLczHVOOJZLDam7ZSvDmdYShSImDs0MeY9FW1GpmAukju8grd38hxoLfaAFSKor3d63Ff6fSxrh0I2QeAVIGzQXgwcQGU7AHJliutlXg2d3t+zb1BI9LJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0AS4RfSL1BCj1Yo7Y5uF/DVJ64mL0b6elqoy0luQ1Q=;
 b=WeUVHzUNGdztNOuUn56gQfSEDZjsg1+R0fXlBoXjBl3b3TOXVUidH0v+GwIuzaVVq9CCwTs405dxVg6wUJmbwqq6OvC/YEzYWJFVkQlTWWrEmyvaCWNnL3ianr3LphrZvh1OvqpXNtzo7gIlNWr4naFcBUadNuUXtuzlnkdfhaX8dvBqSUDxmEIuTC4bulDi8Gj9K8meSuadim1q/PbFJ9hkHLQj1kmwiIamoFwK5gI0t/dYa5CaBDol3eMYcUzkhZhY8T8QmyplvR7/GjhR1fc2F3h3lFd3gdl+zhEP3g6fn4fbGVRF2VwN+6ZBxaP6mSXsdGFpMjHG1+2XtXcqmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0AS4RfSL1BCj1Yo7Y5uF/DVJ64mL0b6elqoy0luQ1Q=;
 b=DmSyoy2SThJtRkae+mhPiZXibeXfemtgeIr7sWuDm7ygWPxFT3KbLDjHmkvqWOrkcrvqk+JWpIpolqdIMj57MrXjGCn7rjXcUWWC87vRfeXiD3DqN+ALV2iMWvjfjqaLLbFL8D56xjPKBl/UKhb6E86p9azJHy/BB8e+l04WaGOrZGwt3t2POp1FTlgqhcMG44Sp1czeMbuvYqLI142tK+rm+BQ41zaVmh8jg83Dej9/zmW1vV0g8l3Sn5FulJzfmTgdTVVlY6A93H5jHNq6r+C7YJxxdYuieW80nRwsShEdmZeAnBTyR/+HCXtctOfcG15vvdmh6VrakhePWyWCuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV1PR04MB10249.eurprd04.prod.outlook.com (2603:10a6:150:1a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 12:16:12 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 12:16:12 +0000
Message-ID: <477282d9-c927-4409-99e0-ddca9b51aa9d@oss.nxp.com>
Date: Wed, 4 Nov 2026 14:19:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: imx-audmux: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0028.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::16) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV1PR04MB10249:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f510de1-03a8-4416-8674-08df3a6d6a8e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|366016|1800799024|10067099003|18002099003|22082099003|921020|261102123227099003|11063799006|261021121427099003|56012099006|261026121527099003|261022075727099003|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: q7Lwt0Trj4FSDfGD9muoa9O0urdXTXcc0/D5dOgQ12uEd6eBieWfcLplNCRSngTs2C+bJSFnHkynxfPebZwrtdSrNXxokZd4nRF3neI9+p+8EyfncR4ZcLWMiVKTeDbUyHiY+S6QAgogKHDZIX/uGlcKyU9fwcurFpG0XQrZbvbbaj2zUoeQrENdIqEVQ1rcIXkX3nUUVAhmgtv6kmRzaWjRwdfYc2sdWggj9WqDjmfLz7Uf6LlKOMf0rOuBx3u9CI30jkBScuYzOXspBnKwM2YfWqfrWxLUymAZ70yO8QY/QtXh5K9l1LPYEpyKy15Ewl/CyRdcYkjmREO0Nhe6SVrxWkGmRnDpsuxqJmdgMa4wtG9zYx1IaOIDdTUfpjJRd5jCUvDkjCGoEiRkJKF2wQU82kFuq4idSJNlYoEi1ZfZZIBwpnRdH92uX3HKDVsvvnUGkKL8hYnnfXBC93R12fVSWifNPlgzbBMVqicxuPbgarzVj+WicKzNUED2E3802HXn5QMK3qZ6WjCLF+gmYrpEVbAdVzVZg4dYtqBClLP+uI2zkYriz4TRWCJjtfB6hym8AT/vtaKBH8csKzWG47hH0EaLNBHW9+EcmKRujTMNTl7ne3POTG7nidGB2OqmkG5J1h21JGXd2sDP9mJK+rqIZkxUsdDNi9ASj6kxTQkIuNz4HhS/k5mLjDVe1u+NLHaM1nmqdprRrptxhLLNfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(921020)(261102123227099003)(11063799006)(261021121427099003)(56012099006)(261026121527099003)(261022075727099003)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHhhWVJFQnFrd2VTeGdKVHJaSUwvV3Z6ZXh1SUdBZXpyMlgvZTZ4TFRvbUJG?=
 =?utf-8?B?Vkw4OWs5eitZZG5HRVN5eXhqOTZ6TVZabnVFb0QwdW5NTG5Jc1QrKy9kczlG?=
 =?utf-8?B?VEhTbWVEcEROdEJYRXo4TFFyK0dnb2p0dSt0eXhkQzhyTk1FVUJSREFocjla?=
 =?utf-8?B?MlFFSW84cWR0Wm1sWTVFVlFZc2xXRUk4Ujg2RGxpbEYyZHF6TGpOazQ4R00x?=
 =?utf-8?B?QzlnY1dEVHNqODVOdVJscEt6akFMSDJzTEptTTBDbnA4bTJoWm53ZnA4RlJP?=
 =?utf-8?B?YXRFM1RvMDJpUVFncngyV0FiNEswaVN2NXp5cWxpdERQbmxja1dHWnhTRlpS?=
 =?utf-8?B?bU8xN3d5eVN3R0tHMFZwKytQdWlTazZMV215a3FFSXdLV0M5Zm1Uc1VUWHZ2?=
 =?utf-8?B?OEFkaUdyaTlRR0JCZ1pTTkIvbW5JT3VIOWJMRW5wYXIveXJ4cnVtSFFaZHpm?=
 =?utf-8?B?blNhMDFEWmo4NTIzMFJCM0pyOVE5R1lZVVJmeU50SUpDYWc5WkVpYlJ0TlVU?=
 =?utf-8?B?UGk1enlPZmRHenNONmJRcHJyS21USmthZFJudW1IZ2ZkczhLUkFVbm1pTkFj?=
 =?utf-8?B?TnJ2NWk0SVNkc3FDNVBuR2Y4ODhIUFF1dlNpMlB5VUlBT2JTazZQUXVyVXRM?=
 =?utf-8?B?WTdtZ1A5N1M2QzE5TzhDN0crM0lQWDg4QWRjZVg0MTdNejJIcXR0MnM3TUJw?=
 =?utf-8?B?Vnp5eXExaGcrSEdwaWRRcjZMZ3lySnMrSFJsQUpnZmpsUmtyWkVUOXNnK0ZG?=
 =?utf-8?B?Yk8xTUo3NThWbmw2Mk1BOHVGTnR2NVpKbGdzTUFwbW1WdTUzRFQvRksrcXA5?=
 =?utf-8?B?dWtxcEdXeWxRNytlVlo2a0dtZVp6Y2ZYNWp4My9KK1JLb1hNOU1EVWhpU2l3?=
 =?utf-8?B?Y0hZUUVMc2xVbXFSM2M5ZTlpTUVGdEV6WE5ZNG1tV01uUXdaaXFNbllCbUEy?=
 =?utf-8?B?WnVmVGxkRTlDcmMzTzZJM1A4dXBUWWN5KzhQRk43TmJMNmNkbWszRFBFeFF2?=
 =?utf-8?B?Sm82dTNTYVM0d0kwMEc4ZnVrWlNRcDdhUzh4eStpcC9FWGtoR1VtTEZXUnZF?=
 =?utf-8?B?dXJlSWdqYVlnbUtWRUlnSXEvSEVjWWZQQ1dJMnJFNXpJa3haRW1wYmtIZTIy?=
 =?utf-8?B?Q2V2YmxsWFI1K1Z2MHFXVzBieithU3NOOW1wRG5VSGFBNC81UDk3MG11MTBw?=
 =?utf-8?B?WVhndzJKaC8zREVzeWRia1pxYmxzRG4rR3RvdTBsOUhRWG45RFIwbktEVjFY?=
 =?utf-8?B?enE3aEtQSzBSbzBMTmlPQ2RHRnlKdjFPVWtFTUJYT0kyQnZjNGNtQ0Jsa0NP?=
 =?utf-8?B?N1pOZUczT09VTFliMjA4M3VNOS80SGtUTnVMVnEwelpCaEwrMWUvUll3b0xI?=
 =?utf-8?B?M1JGTlpRZWZvcmFnMUYzVTBZd244QnFMSFpibU1UL1VKNThmY0pWZ2s0K3hP?=
 =?utf-8?B?TGRONWdOdjJBVkxVTHZGN3doN1lvRnBBb0JZR2NiUDlUeTlzR3ZxR1FjM3Vm?=
 =?utf-8?B?ZWFvZlJDM3ErcUd2eGxUR001TjE5czFhSGJBL1A5dVREV2RSaTBHVXFlYmFD?=
 =?utf-8?B?MHd6ZldTMHFJbklxeWNqL2dISXlXcGdhOXNCUkt5aHVPbW1CSE5JU3huZDdj?=
 =?utf-8?B?dHVuWVY5Y1d1ZjhodG5TMHJYYnZaTkFHaWtYUUxadk9TVFBDYTlUT2gxc2lF?=
 =?utf-8?B?V3RFOHVTUU9YalpUUC9xeTd3bE5xUG4wbzkxejRrYnpDLzBEQzhsVmlrR3U5?=
 =?utf-8?B?TGdVczF2ZXdnU0pKQzc3eVFJdjB6V2ZGZU1XYTQycCs1RUhleG12dFAxcFpX?=
 =?utf-8?B?dlpMcFRqY2RPbklKWGZhKzFKVHhJWTYrazc1SUhDdHoybFdDL0l1RERNQVd5?=
 =?utf-8?B?eDlJbmg2MkJ0QWFvTHhidFhxcHJJam1LeXlTWG8xenBwL3ljUUpNVXFnWWs2?=
 =?utf-8?B?RGdxY04yTGYvREpBL3NrWUJUZUtnNVdOVTg5WG9sWHBzUFNnbDY0VkJQUkJm?=
 =?utf-8?B?QjVyKzZNeDI4Z2EvYkIvMjZ0UnZTekVBZkkzTEdhbkF0dEx2SThKZ3pnZVFy?=
 =?utf-8?B?QUVnem90ekhrSW1lWW1HWWhEdHYxcDJDVUFBbUxMdk5FOWM2d3JyQ3lreE8x?=
 =?utf-8?B?cmJZaFA4eEtTZ1dFUXJkeHpFOHBFTDZ3bDh6U2l6YWZvZmtrcHJoVTdsZXoz?=
 =?utf-8?B?MzgybmFtUFpiSjlXejNzbDBjOS9nVnBXa0hZM3owM21LVVJmSStwR0I3YXk5?=
 =?utf-8?B?Wm5yQ25DZSt6c2I3eHZBTjZuVURDNStBWlNJQ1c2WTBZblV5NmtsRG9VZ05H?=
 =?utf-8?B?VlhpVzNKc3dLTXpkWHk5RkhVeDZJS1RwWC8wcjZZNUhtT25saktTQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f510de1-03a8-4416-8674-08df3a6d6a8e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:16:12.5529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8U8xXFgkxPbWy6JwAu0C+W9fAkeB7F7Om4+OvdBIviDbRTkSVLnGPIB5WQfe0FoV9nSUes7hFq2Y5rg8XXLHgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_041623_093402_404B7D43 
X-CRM114-Status: GOOD (  15.76  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 13:32, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

sashiko comment doesn't seem to be correct. > ---
>  sound/soc/fsl/imx-audmux.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index f8335a04595a..d46f43ab66cf 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -361,18 +361,7 @@ static struct platform_driver imx_audmux_driver = {
>  		.of_match_table = imx_audmux_dt_ids,
>  	}
>  };
> -
> -static int __init imx_audmux_init(void)
> -{
> -	return platform_driver_register(&imx_audmux_driver);
> -}
> -subsys_initcall(imx_audmux_init);
> -
> -static void __exit imx_audmux_exit(void)
> -{
> -	platform_driver_unregister(&imx_audmux_driver);
> -}
> -module_exit(imx_audmux_exit);
> +subsys_platform_driver(imx_audmux_driver);
>  
>  MODULE_DESCRIPTION("Freescale i.MX AUDMUX driver");
>  MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");


