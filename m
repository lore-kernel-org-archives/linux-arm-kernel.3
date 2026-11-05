Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5798606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 03:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QWEJlBcG;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nebEgUiZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bvHGMFbhjmfRVc+zBGC6n1YZJjr4C4N2A6gQz0K3WvY=; b=QWEJlBcGYot4/d99OAy3AxNC82
	+k8/B7qgxX9mShKBI/FV0tVmcvJ1Dhlec2KjhHcihZxsl1w0E0bfnIdDvHE241Q58FQ4oDXpl5+qL
	J4TD2JXLOaSvxlkVXxNOa2tVO1K9NUwja6zq0TcbsffSK4Z05w48t4dbTF5orEkoaDRqzSc8k1Ehd
	Wm/Z9MlyPJ0BiL2ft7GeUFloNjYad9EQKerg0BqtC1vPtvZnU028hglfoBRgH4QNXuCBJaRGB53NW
	o4KqnO/NawXyAyW4iQYARxy+prowUjGeB33flm3pBF4CT+jBFjm+fImrNja3EI+ldea+u8J+ybyx8
	KFZGkaZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOobA-00000007ibA-38IK;
	Thu, 05 Nov 2026 03:57:12 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOob7-00000007iXa-2WSE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 03:57:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7DXqlz5UrAflJCoIeu7SAYJa6QqkVRUaew6Gi+pyxBAzCJ715xUiJL9k1g19ZCJPUO2YG03qHgUTwAZREGlrxbpgXDnofdfn4CcPjDUsjq6KpUy+yrPmP7Om9tehGOmw8ojTqdL73Q1nLaXoYO2t70UhQkiwjvjh7mr/Wz8d0Dqhs08kjAHoALpXCr0mIDeRTN7wGEl0XREBj71gcsnj1FXNi6nYzch+2HTzqUEs0snO+YJ4TV9ZwT8B0spS/C68J7VRTbF18D7G2SfXRc/RKoletsBZL7shXo3J257uWjUGB52FEqzVUDP3wdT9PVfHrb5ux7IKCZPOQqFJDnx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvHGMFbhjmfRVc+zBGC6n1YZJjr4C4N2A6gQz0K3WvY=;
 b=YCs1hYNhhqJ8n7hDMomn8eROAyri/Rpb1dyJtnOF+Nhhqg09xD7e2guNabqLudfCBHgwzvA/o7j9ctA6iUi/80XhO+qATrr5S3qoHBm18PUzpJKTMT0LZh8r/JVdLz2BLd5E6Hana8KVPGuSibelK3PMrLNcMCWAnsD6rrjyPARiKCeq51PFAoX5ibOFjvBcSzrnTEDcsgZpA9MvGblLaUOgE+sEnQTrnGVjWDz9+mHtMAyqvGsbKSaClpqrJzo7XNqnffxRiIXRxHpCgMmyGt7nAPgukyboZ8mfR08gcfYQo0IK4G1NOZB861ZTNk+QBsChx6crrxTTxC2KUPAYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvHGMFbhjmfRVc+zBGC6n1YZJjr4C4N2A6gQz0K3WvY=;
 b=nebEgUiZNQSf74xDHAfNizdq0yLrZk812pGUpJrvRsW3B0eV026J/CfkxEhTqMI5VEAmA/Q3XfZ1hzY03PzQenVGOFj+wLDpPI8gOL+kN5BVnne4fTtoGjw134S5xEslqMtFq3uowuxJr/3UvRK/k1yI7LQHtnguGdXjDNBI5ntSC5VxCM32D258QoGkIDOqTygNmuCR3FNwBelU26HjD+uYILfTOQbP4v8vMpbtXZtaZrEyMaMxPM+gfRq/OOXDhqW+Nm1+JimwEO+Ksc0Zxx0ZbW/nFIcOdOOaHN96VcWXqvP7PuZrOj45v+ovk5KJemK1c4CxkyfainkeQew1wQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:57:06 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:57:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Nov 2026 11:53:05 +0800
Subject: [PATCH v3 07/11] arm64: dts: imx8ulp: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-vf610-fixes-v3-7-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c95c930-4734-4407-4a64-08df3af0dbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261026121527099003|261022075727099003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 25M/WIEQxzfa2dCxRC15DBpZMXgM1CJ2kmOgPLmFEzBBz7UkLuYaf/etIHr+lLBLm/hl34yL/GFJ0kYvPrv4z6mU+LbcG+h8UBclLz9XQW3qRcV1Yhk1jiWnZVF+l++ygRwcK8sd2JhI+T7hI/axXVm4SEK4mI0TPkaRBs8UzIHMQ8Sya7YSWw53Dt1bMoHcdnO0y4Q/kdXj5ZM/bhbQkTdknySDNHDFmzF7UMUonzsxtc9eCH0pVUoiYMhTSmRQTVJfIpUM6UwyfXbuOP+/9vIA5dSK9cJFlvUkYgaybGNn1yJxeHqQ6T2xsm0uLubHy/A0gZqvlTja2xB2L2F3/JIMplPPC8Dzn+VANG3JqViemfCLTlczH/TJ4xJe+j8LbJ35TA9jSJEl59rW3Es2M4Q5Zeyt5UPVBpDtBTBVMg69AMmc3BDeuUjsfJy7B6ho0FteKCFjhBE3z9wf+Ls306eKj8ahi0gYxYJrLO8ySK7dpJSmGsb45bn4Xg5TjlPNc3FaxBFmLEeHx3LattX/fcSJH75i/1tumIHCHmyobB8MAV8fC6SuiEZxiyjNaQjBmk5H/Pkyu5Bvp9GguRX+e08Or11iX0Oh5YZ9BciJNvuGVc5PehoCkFO5tV9nBp/yx6RiV6IsQ2kwkTUgYf2aIbPBBzUtfpo4N7CYpVETVqQlLHMW2soI5t5N7Z2rxQZhV1eVkUBqZ35U/oI1dxXGrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261022075727099003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2FOQ3ZyT0FoMkFRSzU5K2t0M2QzcDVRNkhrNndtbEhNZU5rQmYvWU1zVFlY?=
 =?utf-8?B?OWMvMDM0NU5TdVQ4bGxlK21LeldRMVBaVVlSQ1gvdThWajBVZE9KUlRyTWVj?=
 =?utf-8?B?R2tZekpEZ1dYUDRrWTJ4SFZNa0N2MStjSVl6NUpuODlaamZReU1YNjYyQmEw?=
 =?utf-8?B?UjYvV2oyRURiTlBJSXF4bnJDb1VnZU9MNzBBb1lmSGJlaGxYVU1KOUJ4TUQ5?=
 =?utf-8?B?OUZtdHByekFjS05HR1dPY0REQU1TNXpMcU1XWU42UHczYzFBUm11S2RpTEs1?=
 =?utf-8?B?aWV2K3kvRUo4dXNWTFhUdFJVYmJoemx6S2ROOElRRzIzeEZadkdtejBSQzNU?=
 =?utf-8?B?NjNkaWhXZkIyRVRaOHNTcmJsMDFOekdpbk1HM1J3UmRGM0J5T3MxN21kem9G?=
 =?utf-8?B?SVBhN3UrUDYxWkJaYTlsajhwWnFPSlFtN2lqTW8yWDJhc2xLRFdScXM3UFZU?=
 =?utf-8?B?YkJxTGNtNHJidmM1SXdOMTJ4bGliSHlGZDMyMFhKUUJXejlnSUl4dnVscmpH?=
 =?utf-8?B?bHl1U2FPMDZ3dys2NkVXd01ya2VlOHBIS3lMaER6dHNJUThMaFlqN3lrUU1m?=
 =?utf-8?B?NStYNkQycGQrTlpCeHAzb252UlRsTUZ4VFFzRUJnV1kzUDEvZjV3TjhIVTNs?=
 =?utf-8?B?eFZFYnRVWGlEa2NDRVN2djl6M01kOHJ3dTYwLzBuOE9hN084L0xXWnkrMkV3?=
 =?utf-8?B?eElYbXZTTlZMSkM0Vy9HVEM0SE9YNWV4cit0ZlhUVS9GU0I4QmVyc1BydWtj?=
 =?utf-8?B?OVhIVyt1SldOdVBPaUZVOTQzK0x3TEtZekJDQmVQNjBtem1jbEdIUjIyMURm?=
 =?utf-8?B?bE5rY1E3TTk3RXRxc3haRlFuNmd4SXpZeUE3b1JjM1kxV3NKVnFvSklCWEl1?=
 =?utf-8?B?bTNZUHdQa2RyTlBHTDJGMzdzL0RjSUVzc0JmQjJ4MHI5M1B1ZlN5Q2Y2U01p?=
 =?utf-8?B?RW1JdUhZU0IyeGg5ZnhlaDF3YTZVRUlUUGgyU1k5NFY4YUhnTi9xRXRKNVFG?=
 =?utf-8?B?d21qMWFTbUo3LzJyU0Vrcng1WmJLT1ZIdnBDdmtPVGxjOFhBa1A4d1hhb2lK?=
 =?utf-8?B?VVBNdDMvdDJlU3dVdk9teXRlMnh2eHlNS2MwZHJkaGtCRnRWRmFpbkR4QXNY?=
 =?utf-8?B?NUFzeHVKc0x1dXUrcjdKR2pmd0FaQkpFRHVDdkIyWmFWa0RpbGNZS3JWaUdG?=
 =?utf-8?B?MXJFUGQ0Qy9lMFZvNjhRVkcvcnR3SytCSm81bmRRcmVuTy9XckdsdngvQnd2?=
 =?utf-8?B?S2VDY1RwTFhlbUREaSsrUXgyVzZpNmxMZ2NaUHpJcUpXUlhmenFEU0l4aStW?=
 =?utf-8?B?dFFpWHduRFlyYTdBUlQvbUJ2b2ZDRjBncGJKcnd6ekRubmRPVEFFaVdObDQw?=
 =?utf-8?B?ZUx5U3NOM2lxVHdmNklMRC96YVB2RWtBcUpMNC84U2VEZlM3TmM0Wk5WaGFK?=
 =?utf-8?B?eTJQVmlsbTFkbG9RcmNocWhHMUwxeXBPUGVLVS93WktWZkl0ZC9qQXNoakNJ?=
 =?utf-8?B?SzNjTDVsUkF5NnJVTUo3NCsvSU9aVlhEelZobWlteVlaSEpMMFQ0Zkg4TlNr?=
 =?utf-8?B?b2x3M1BQSTNmZ0RrVW1nQlNFRk5Bc0JGTnJRYit1Vko5NGgwb1dLRG5MaTVC?=
 =?utf-8?B?cmkyMjVXSTVGenNSUUxaaWNvdTJXVGJ6RFFrU3R6N2t5ZkxLMlkya1J1MC9X?=
 =?utf-8?B?dmZxVkRXVzY1eDFHclhyR0tLVUdPSGd0UlZwMmhCcVZaaUdnWTBHOTNZeGRW?=
 =?utf-8?B?c3JQeUdScFIwQWVHajdmcnFGZTF2U3hCcFJycEdWcFlTLzZBdUFhTjVMZ2ZQ?=
 =?utf-8?B?S2F3ald0WlgrQWhITnVJVFJDY1FpV1JKM043SmV0U3o4a2Fld0VJVG4zUGI4?=
 =?utf-8?B?Yi9YOEd1a1N4UGNpa0VNSXZ4T1ZYTWY1WDJnM1dCM29pQVRWUk5FMTVaUEs3?=
 =?utf-8?B?NldNOTdLL1dXNCt3K0pPSDlsUlYzUGJtYkxuSlZyWGNtOVo2Y0ZlRmRuVTZa?=
 =?utf-8?B?a1dWZnA5ZTNtbWdUSHdwRlNSb2FUQytkYmRZNlRQbCtlbXZ4dkljVWZ3QVV3?=
 =?utf-8?B?ZFJaYVVNNnhET0dIUENFSnZ4SCtBZUVXSzZQR08vZThsbkZLQStxTjQ0YjhH?=
 =?utf-8?B?bmRhaTNvaGlNdzZzb1gwYTVtTWNreDhTZHN2TTBIRHlqT3pjRGJIUUF1S0FT?=
 =?utf-8?B?VkhvN00xcHFQVGZKL3E3clJ2RHo5RkRDK2x1SUpwMzluRldVUEZRbGhTNGgw?=
 =?utf-8?B?cHgyWTVEemRGbEw0dmpvZFBQM1IzR2VQVmVzcHduODFRczI1amZZeFFLaW4w?=
 =?utf-8?B?ZlRXL0x4bmRGa3VzZ0xLOWZ1UklHNGhVUjIzNkZnQUd5YzlTSitySlNwZ1lM?=
 =?utf-8?Q?rCjIEyDTEL7RbmOT/3bSpP3JP4L+18ebyJ9qT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c95c930-4734-4407-4a64-08df3af0dbda
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:57:06.6373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPQbC1M0pD6NL7zD8msOd9bANBqs5iiNvzMfkQ18OCB2KJDOeOUH57+VxfW7lPBemzK4CpUnb7bMy0CvuoaEtf6zO9tkaz6gFLjGX1oZB1WYb350fDSKsZbok2VAHG6+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_195709_653655_E8460F95 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

IMX8ULP_CLK_PCTL[E,F] clocks are actually clocks for PAD digital fiter,
not for GPIO. And per Reference mannual[1], 26.3.5 Clocking:
The GPIO module receives a single clock, which is used for register
access and synchronize external pin inputs.

So only drop the 'port' clock.

[1] https://www.nxp.com/docs/en/reference-manual/IMX8ULPRM.pdf

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 777b89ed6849..cd8be753611b 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -731,9 +731,8 @@ gpioe: gpio@2d000000 {
 					     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				clocks = <&pcc4 IMX8ULP_CLK_RGPIOE>,
-					 <&pcc4 IMX8ULP_CLK_PCTLE>;
-				clock-names = "gpio", "port";
+				clocks = <&pcc4 IMX8ULP_CLK_RGPIOE>;
+				clock-names = "gpio";
 				gpio-ranges = <&iomuxc1 0 32 24>;
 				ngpios = <24>;
 		};
@@ -747,9 +746,8 @@ gpiof: gpio@2d010000 {
 					     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				clocks = <&pcc4 IMX8ULP_CLK_RGPIOF>,
-					 <&pcc4 IMX8ULP_CLK_PCTLF>;
-				clock-names = "gpio", "port";
+				clocks = <&pcc4 IMX8ULP_CLK_RGPIOF>;
+				clock-names = "gpio";
 				gpio-ranges = <&iomuxc1 0 64 32>;
 				ngpios = <32>;
 		};
@@ -986,9 +984,8 @@ gpiod: gpio@2e200000 {
 				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&pcc5 IMX8ULP_CLK_RGPIOD>,
-				 <&pcc5 IMX8ULP_CLK_RGPIOD>;
-			clock-names = "gpio", "port";
+			clocks = <&pcc5 IMX8ULP_CLK_RGPIOD>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc1 0 0 24>;
 			ngpios = <24>;
 		};

-- 
2.51.0


