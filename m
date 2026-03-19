Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32B0107527E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 09:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zja6CKgPFr1tv4fGkJ8V474qxMoHubJKfs7sdAecSmg=; b=HYx4zUPQREBI7HG9VrLf5UHBmS
	WcRgxQMHaUhM6Z6zhlCCt9T7xCO2O6a/sJoRVp/xjBPlyH0GbaTIZNVVTK0/UHRRqyBkg4cejuqLE
	c/nPOrBiYEdykqp7WEdNuDkVODX0AIbf+HotJWbFpl11+Nw0DMhVo6fekiMfwhqFznY+0JZHItggl
	+8gBM2Jb03eOG2XwdzA5OYjpAmAIv308ReIoiDGTUlxhzvebx90j/cz+21N2rVIBNRxkvoZ7HjM45
	DKWEjMVtEgc7v4wdf4FIsGQQHuI+oG1pT4GbP0LmCADY0o6TrwcBXQIFymzDke4pnz0EgUnSb8jTZ
	ublSLbAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39Lv-0000000AIMq-0fVS;
	Thu, 19 Mar 2026 09:07:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39Lt-0000000AIMB-11Qp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 09:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Zja6CKgPFr1tv4fGkJ8V474qxMoHubJKfs7sdAecSmg=; b=FPl2vhXF48Xldl+MAP1JIdbeBi
	dR85k68x84A2HSO2/xiUuvXw4mQjtBy6wwiXnrhHAkCzapFXEC7LmWLHWRM6VVRxfubblBy85O9ZY
	GJWOdDBsrM0jsabPX1VwcqYE9kAJUioKHgHBdrCWPxdSxBuNPbxfQ8M9iVet/tHJbsWwLSCLfYAYU
	msbPpIH0TmY0XF4MMoSVnRgxLumZkPwD5TqsSMmpdpBvmUgPQyKElNs4++w6Gl06dQo2IIKmF7wMq
	OroRFcKtolfkWm665Uw4vJQiL75/wxJHkzzjlv0HjfjaHuetBn8hdsTSFOPFUH86aRHPsgdSM40i7
	jh1CAEYA==;
Received: from mail-norwayeastazon11013018.outbound.protection.outlook.com ([40.107.159.18] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39Lp-0000000D5zy-4ASd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 09:07:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/UBOATHUgI1D+mqkXfaV1QywM35i4R1BVKEYjSBpG2EjT6L5aVAWiE6I62GCV42SkZiaUmO1Z/pcTiXD1bkR/mBokIWDne2SlhEnF+mbtiaBRr6ZVswJonLRppPYC7yTWrOeMPRTxMtUbwti0HZL/GOzI/v7/EpTKMB2v+mGmVzJ8Pkniu7Ou1RCquwlzKRzskq3riU5iDK4Qe4JVfMeDxBqbVul+C1OzqlVYSfHe9JEa+nA9K4nDBXDaJDqdZCvF7nAUyn9DDpGhgsPsBfyltVGVA2X5BWiLQwMHByWDTwLuzsI/3VIohKMaZXWTB6IhYZJZQJvrQFWsor+xy9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zja6CKgPFr1tv4fGkJ8V474qxMoHubJKfs7sdAecSmg=;
 b=gkuLneTE6o8FNsbxUWpKk/sbJhJWHO5RZpaCLsAuArLP8CzV654Zr5Xfxug4N8tveWM49ire8Ki0qrSVERltuPIVfzwBh2Y3dOZrgNZHYk26S59+RhmVtJEx5t0zA6nW3kkcAuJnQDPO3LhcvC8oe4sHH5YRmJ1iZNYTUydB7QrURkf9doR2ymCR2D4ycY5VHWOM3lPFrYFPjKqJ54leETVrTTotREuxv9tbRkKvTacPjrcghlDT7x5sMDMVShC08j8uzuUQEjETs0oZTThHdbZLKO+9KPhMCm9aCR2NJrE5E/9JX40RDWuxinKh/nusvOSiLhHRcvZrw9EdQoTVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zja6CKgPFr1tv4fGkJ8V474qxMoHubJKfs7sdAecSmg=;
 b=Hy94lBADYkRYjGlZwMQhEigDxhG0h6HtjFEAV8bNbAjFyxbAoptya0M2GdAokdm/gkifd/d4iC4B0G9tINJjTSH3kZ6b4EboXsStPW9ILgnPxZBsBqQR7e3GYqWWITyJbVLYqSNqvfbHHZ++SgzorHQovlNc3oGcb5GMLIhBEy27cVUkxb7I65i4L1dx7fGT3bcmG1OY8EHHHUrKIN5iaF9edPNmcgKgPRh1NoRY73d1dx0ek3U7n3148Q6xrsZ2VNIubuSC1W1bbQ9e9YKZ9r7bScIbzyuK+Hpm2PspE1ghIXLB+2Zg3c73S5kAb0GEiRWOqPyo5QEz5RPvE403/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU4PR04MB12062.eurprd04.prod.outlook.com (2603:10a6:10:640::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 09:07:27 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 09:07:27 +0000
Message-ID: <9a7979de-1977-46df-b2fe-66b81dc935e9@oss.nxp.com>
Date: Thu, 19 Mar 2026 11:10:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com
References: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
 <20260318-imx95_frdm_pro-v1-2-8c00e59f0b1b@nxp.com>
 <a6ae1423-9ddf-4d15-b83c-569333abaf5e@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <a6ae1423-9ddf-4d15-b83c-569333abaf5e@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::14) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU4PR04MB12062:EE_
X-MS-Office365-Filtering-Correlation-Id: 479c1696-4eeb-46f8-b371-08de8596f10a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: lez8q99BjwCHuSuKXM5usC/j8hhbM7BRNIeVMbyp5zHfMzlb8y+dHVsvke8UgzsxlAUvtZFMAq4yh7FLP2BSLURdkz6k0ZYSc5wyi9eE1rVolbGzrKyrM2R3mrWFdEaG1eEaYfWkMdVMSFB6UJ3vJnejNds+U6PFFuFMkIox4DUlHyxaLR0BHLnoOj76fxFHz9pBfahoSEYAzOmhAJdnd6zlynk/TzxALePJv5kyUGQ8/Lqdz1yNA/O3mxBYZifcVbhsrOS3ISr20c+guApahWP5RQnXhRjSuVsNFlAzPVZUZvDswV/bsWV1jzeLgyrgnsiLzursTquwAIkQGFG0yl96uxAI+mYPPNXCaFYgaxHEOIBB26pYIrwfxnM89c/09Zfv1ewjtk4cxNE+aOakt22vFWAWxc/i6h/kwgDN69qCuJTYa8KWBpthSETjwgIOPTpLFX5FHbkTMXdZQSrMP/ku7Ql9GXHyyVJgyV7y+g2UPPq1/WjefIwE6fBYplOLRrP1rp1n+nRAsr0OAChr0lJ7aBAqTRFSq0SD+vJFV9ANEZBArJX+B8cMqUZz52+PYTz76KES9VQVXWp5kdUyBGAMYOrvtbTKwJQmy+SwTe/rjnQoUH3m0XzfcJg/w1oxxuyOqiOkfn7NudRlbVRmb1IkI3jmtMlPDQ6TX4vFtcT6aH0jAvMD2Xh8FcPU7gU1OsTe4JpPhvDu7O58o68XftccdTNdvJTlyNh+iCKXozY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmhZR2NPZ0FCYVI1TkpxdGFqbWZsM1FXcjEvUG9KQjhPV3BmeGtrZzE4VGdr?=
 =?utf-8?B?NUlKK1o0NnNjNmUzdlFjaDBBSXJoSWdyd1pIYTJlZ2w2VzU0cmZYYVNYSGpz?=
 =?utf-8?B?OFdsd0hZK1kxd0xZdHBKS0c5c2RtTXJTRE50NFRkdzJlUkQxWjRkWXJLV2VV?=
 =?utf-8?B?dk5MOUdTeDNpTlZLa0Q1SzBmS2pVMDlhSmNya2t1SFVVTGFkVzgvZTVpODdk?=
 =?utf-8?B?ZGJWTGVGcWNQeGQvWGRKbWhJTGdKVEFJQkdqZ2hmMk9xb2NIRVZLb1RlWTM3?=
 =?utf-8?B?SUJ1d1E2bVlEbHpRNlR3cW5LcmUwUmFYVUtyMEFReXhUK0EyUUlraVh0aHk5?=
 =?utf-8?B?M1paMmRGVXJPSlRpTkVQK0VWYnpoQUpFa2haTTJMVGxNUlBJOCtHdDRiYVNj?=
 =?utf-8?B?Q21OSnYxVFRtOEJIbjhCazVLeEwvL3FqQjVSMG1weW0wRGp2QWNSUWZpaDM5?=
 =?utf-8?B?Y2x0OHlobUZldEtCTThmNUZINE0wM2JWWGpBZDM3RmsrVFVtdTlzL2EvbEdC?=
 =?utf-8?B?UVpWb0ZrOCs1UUQxQlcvV0hFb3ZGemhyUFhIemZNMUZNcnY1UjFxZUp0bUcr?=
 =?utf-8?B?Y0gySDdDeHNXOTdXd2NlUnRjUjc5Qm55NTU5RnVaTmZwdGVlKzY0ZDJzSDlz?=
 =?utf-8?B?YkFTM1hLS0R4bXJIbVhIV2JwNWxQRnlRdmtvK3hIZUd0M2hRWXM4NjErTXJh?=
 =?utf-8?B?anQzQWNkYXVqbGFrang3WVB6MXRoRzYxd0hUbU1zSkZrUCtTK0N5U3dYQnRo?=
 =?utf-8?B?N2VRYWN3dHZneW5LakxkcnJnd0pJaTNENVhpbUY2bkF5bDlQbHlhYmttbnIv?=
 =?utf-8?B?N0pBa0hFaDhucEZmSWgvNFZqL0lQZ2FWSlJ2K0pDZS9yNlRLZEhWM3hBa0ZK?=
 =?utf-8?B?VGpoYWtGYllFZWY4amMxWHFMQS9BbzljZEhFdTgvb3llSVN5QlUybGg1MFl0?=
 =?utf-8?B?L2lPZyswMklFclc5MENMY1hHOWxuTnZjZjFac0FNRmVFUHo4THVwL3ROWnVp?=
 =?utf-8?B?SHFybkNNclBpOFNqeGtuZmJWNWpQZENPQk91akhybEljNkMvZ0JQVTltcmZp?=
 =?utf-8?B?WFQreXJPbk13RnZJY0I1L1BVUldHT2RpWkFiaDA3aWVhMk1YQThqNjRhLzFa?=
 =?utf-8?B?aVgzNllXQUZ1ZXMvY1JNN0grNmxONjN5SjFBeHVxQ0MvbGxYWTlHMHVvckEr?=
 =?utf-8?B?R2V5MlNDcEIzU2F2aGc1UExZbzBxbW9vbTJqYkNLS1dWMFRHNTRKelNQUU9O?=
 =?utf-8?B?N0FZZGZKVTV4VElNdncrcjh4MVV1NE0ydEhzaXh2TVZuc0lHc2Z6d0FzQi84?=
 =?utf-8?B?QUZpcitNOFcvTnlIK1ZaZkZ4bVhCV0VFbFN2TkpsUXVjT2tYR1RoejNQaGtY?=
 =?utf-8?B?SzlPeFRhQmFLejJKamR0KzF0MmR0eko0c0ViTTlhenErQjFHOFBudXU0OFlY?=
 =?utf-8?B?WmVpdHZaNWZZdVJQVnpnY09vNkJDWWVNZGxRM1RaamkrSTNXOVkrSmRlR25q?=
 =?utf-8?B?WHdVdnh2ZURQd1VncVRqYkNYRFFhWVJZRUhrV2JmSjluS1BXZVAwck1jNWVo?=
 =?utf-8?B?aXY5elMwQnN1WDl3Z3VtVVZmRGVhNG1hbWpqbXBHZXFzdTRHNkpYYnhDMHNV?=
 =?utf-8?B?Ym9vSFpaSThCQ2ZLaVd1RzRYU3RKYzdWN3p5Z2lVbTMyUHNaRlR5bUpELzJr?=
 =?utf-8?B?T2ZMem1rVjdiRE1Eei9VUHBXU1greW41aHR6U2RaV0g3WmdNREJFU2NMWndr?=
 =?utf-8?B?ZUhJM0hoZHFpQUJ0L1BvaEp5YmFHdit6bjVSTVpTVGlzaCtURk5zVXNHcXBU?=
 =?utf-8?B?WWFCK3Z6NmcwQmQ2UlJ0NVg2YVloakI1WEdPYVQyanVBdWIrMkloRyt2M1lz?=
 =?utf-8?B?WXFZcW5uNDlRcHpvbVo4N245U0svVlc1VEE4eDRVa3ljMWU2SjNVMkZ6K1Fk?=
 =?utf-8?B?VHdLVU1BUTk4S3A3SW90NE8zcFh6NjMrRHBRR0d4NE41aVBDOCtvMy9WVEZS?=
 =?utf-8?B?YlFUUXFGekRPSGhiNEhkWkdDR0c4SytueTQ0UERVUnBhL09EYXBTbVA4ZU5j?=
 =?utf-8?B?MStablI4NXhqUUM1eVFQSk03Q2lnVGRDc2hselVUOVhSeFlZWEIyemZVN1ph?=
 =?utf-8?B?U2JhWG9oMisyR0crMElSUkxYdFlMc21HM3pxcHJEKzBPOURraWYvaUJSdUIr?=
 =?utf-8?B?dHlCdUlyQlgzK2d0VWt6VFVKWVFEQWdubE5zMC9LL2VNV0FLaTJKUlAwc2VT?=
 =?utf-8?B?UkFxZmZPZno0aVRjZFRYZzFZZ0xMbG9LcTlNRlFQNVFraWFkT29EeVdrd3Vh?=
 =?utf-8?B?Y2VSTm1sNUZsc1lmZU1JeUwweWFxdlZpTGxRaWdqV2tzdE0zWWxjdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479c1696-4eeb-46f8-b371-08de8596f10a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:07:27.0585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJsYBy0pm5gqmxUR527pDaAs25p2x5sKx4NjTn8FT4ruT+yHpBf4EWGHTxgyX/gBmFURGNBMQey995cDapHFsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_090734_091075_64835062 
X-CRM114-Status: GOOD (  12.58  )
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

On 3/19/26 11:02, Daniel Baluta wrote:
> On 3/18/26 10:04, Joseph Guo wrote:
>> [You don't often get email from qijian.guo@nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> NXP i.MX95 19x19 FRDM PRO is cost-effective with extensive
>> expansion capabilities based on the i.MX95 19x19 SoC.
>>
>> Add device tree for this board. Including:
>> - LPUART1 and LPUART5
>> - NETC
>> - USB
>> - 2 M-Key M.2 PCIe
>> - uSDHC1, uSDHC2 and uSDHC3
>> - FlexCAN1 and FlexCAN3
>> - LPI2C3, LPI2C4 and their child nodes
>> - Watchdog3
>> - SAI, MQS, MICFIL
>>
>> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
>>
> [..]
>
>> +
>> +       sound-bt-sco {
>> +               compatible = "simple-audio-card";
>> +               simple-audio-card,name = "bt-sco-audio";
>> +               simple-audio-card,format = "dsp_a";
>> +               simple-audio-card,bitclock-inversion;
>> +               simple-audio-card,frame-master = <&btcpu>;
>> +               simple-audio-card,bitclock-master = <&btcpu>;
>> +
>> +               btcpu: simple-audio-card,cpu {
>> +                       sound-dai = <&sai5>;
>> +                       dai-tdm-slot-num = <2>;
>> +                       dai-tdm-slot-width = <16>;
>> +               };
>> +
>> +               simple-audio-card,codec {
>> +                       sound-dai = <&bt_sco_codec 1>;
>> +               };
>> +       };
>> +
>> +       sound-micfil {
>> +               compatible = "fsl,imx-audio-card";
> At least for this node we would want to use audio-graph-card2. So you either leave this
>
> out in the next version or switch to audio-graph-card2 as we did for imx95-15x15-frdm.dts
>
Sorry, the node I was aiming the comment above for is this one:

+       sound-mqs {
+               compatible = "fsl,imx-audio-mqs";
+               model = "mqs-audio";
+               audio-cpu = <&sai1>;
+               audio-codec = <&mqs1>;
+       };





