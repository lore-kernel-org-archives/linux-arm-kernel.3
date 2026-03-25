Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174D9109C048
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 17:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQEoIHtx8+7UJ53RmXBYIC1fpC1iM6PZtTw4jv5AuKM=; b=AmPVvpN13mx099oiYoDqCXZhgm
	aALMUrTCZHQMEPB9ebOkB0BuzddTy4a39WyML/yLhPqke1NQHVuGCZivWWlL0hN7NRRtQfS1rnbxU
	fDOSjKhiP6zHq63p0o8DzTOOXpsfIlPp9JPRaVhpbnaVzuHLJ66d/S+Ibc9auz+uqUkOsmeFfAriC
	4oLmcoZLOVeTyr8ByzmuZa2p1/uDYuwig7sUa18KREod7d7XXkDE0ZVIwrS5cSfNnL1B2WkHzxOgP
	7gQbWKWepS605jsH0ne+0uvjuzoIeXzEduGk2uYMvzjyGPzYOkpOxOfUYXSRtTRzMYKhWFuvVd1jH
	mstGJ6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RdN-00000003xUU-012N;
	Wed, 25 Mar 2026 17:03:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RdM-00000003xUO-0Qoz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Mar 2026 17:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gQEoIHtx8+7UJ53RmXBYIC1fpC1iM6PZtTw4jv5AuKM=; b=ZpCSxLZJbngD3dysADPF0N2/at
	rHzT/IL2Lx7dytFr9ocT2SFHb4nGxr3FO3rUDmL8PmHQM+1WQXQ37POcEMxe4lbaXPAax6vl5N1A5
	L2ghcpSbeGSOxDQ60njlPVx0ZzgUOC4pAkLTs80Krug1A2R+3U4OkaUPy8rtFeVW2GOs5ZjztE3R0
	xs6PMJ7kr2D34Uw7w1p82G/57ZH0CRcpdfoexSLPWTU3n7y4Our/GzgC1DpUQpQRhIHnuSYRaOhCv
	FVlMZKJN5/eJNvQwRjII+y6N/eixxiRVHwq65ACsa4N2ViecBhzmy+ac7LzkdKSshrX/1+6mKdQLR
	0u83U3Cg==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RdJ-00000006hhW-0LMM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 17:03:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GITA61kVeUqyBp4my35Zg/cnIVztPVBvWAKWwKudg1kEnm6AByiI2u/qTiyxgPw+d5SE80bKA4xuz4nLG1DrSDaatgvddilbFkhXVZJpJ2Vb/lfXVOtUgm8czgQwlQeOEZA4jziHNpzC+b+k/zATjUkNxsQTyDACUUwEe69vzQCKAo43Y+XOfVDSHnTIwtsNOJ2zVMNOH4RIpUPtwvBtj/s7YUxvNzVjtA2Q4/0FIwgSD1mQmPEAVAHb0IYDHSfXeclxY6hfmS7O0ySjIs0mxhIru3ALEUZ0g9M53o7WLrwU8ZHorH/QhUV/7HYFE9gMCq952uamlrF0t+4/07GhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQEoIHtx8+7UJ53RmXBYIC1fpC1iM6PZtTw4jv5AuKM=;
 b=iZe6vF6UB8CAcsT/x4d6+WYNtPbSxofcG6if98uJ540YOwsZIIeJ59Cb0YfKt0MzR62KwuYFk01p+EOHAO6c0BmRFBnXB3TvtRCxFtMtR8PouKdfORgig8nrXUtHzV+HZjKzTjcYeSAx84lbEzFLL+saOHpojlaS4c6bopJn1OnVKXp1v6+ZREIXXgetsN3I/r9e3Gs+nMJafgkY3ETHJG19LkURDA2R+MJL3yOYBGrWdhiOuVgPa9jOD18F8QRbngfHLMBG4u95fd6LJQX+onNgX8Z782IDrOHdNLuWU1ebKpIiFuFTTWJhitmHuOhJGIiJ/dq8pVyZtn5apmRvIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQEoIHtx8+7UJ53RmXBYIC1fpC1iM6PZtTw4jv5AuKM=;
 b=VJ6eedAZOJNgNNTntP07asH3IamLH6/Xj6VPVqzzi9PLC1GHH5eCSr8ic/sj+uWaVFwxtLBJ1BYQLOWwvKlG75gJ8kCtQzl6o4NfU5X3K3ganyTaE4HHXZtOTf1nMtcQxK+/Qa0LNhmHnrjp29/xn1DNPc7abqUfCKvftMIFZan/xlVfCNYKLUDhErqOS4LPcNqVPiN/KiJ4WYIISRJWYUfeJFo2AcHVZXrDuDkcneXMsJvPL4kWzk872ZQwfi+HXzpFaD6GVFKFEPaTtsZrzQrKjSLkD23UAaQitHFdT4SM++DMYKiFc8PnqTyfbtwfS8B0Hj/TkwRHxt+H0rNR8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB11978.eurprd04.prod.outlook.com (2603:10a6:150:2f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 17:02:58 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 17:02:58 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM and boards
Date: Wed, 25 Mar 2026 13:02:41 -0400
Message-ID: <177445812467.3166164.12331582849141825679.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324190356.74293-1-marex@nabladev.com>
References: <20260324190356.74293-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR12CA0019.namprd12.prod.outlook.com
 (2603:10b6:806:6f::24) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB11978:EE_
X-MS-Office365-Filtering-Correlation-Id: 8668b545-727b-4a1e-ddb6-08de8a905d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|366016|1800799024|7416014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: lHN4sZs52IgKLL8z84k2zBX/EhLR5YO8UMPvSeaCFi8WMNj9Nft92I+VK/6rnXnDt912xtT7xMC9pX4APTJZ3n/dvhTtA/GzxudHSYo08ITkNF/M5IM0pVPMAQsII7g6Q3yYtq0HDCQ13LlJs/PoCHcdxUekh2QnrZdu2NboE+A0NmwaNRN7kQdYIBMcusAZd57NuI/CC7W/suxJSDj0J4F9e88cv6tpg68JLDSjwr30XEzg16G7UvNj2KoPKOrLUvukMf1C70mCDalrMMNxLtAxWLeZVk0EGIugUmaqTpgaJBd6hjiCY6bHh5frv6mE9dg3vmE1bPr0j2wqOR6UrH6yegKIOwwM63MR1ikKonyWHEm3Jxvu26VRI7rDv/sIpUVw16usEuQHqKBf+/mya40pA8BJAZEL2Ug/+EJ7JZBVNi/yeRc+sloPrGG2+oj4lsF1pirEq5qPn/8wurgsdUTVZm8X4KY4+CzMGGILGzKsnD3YeUm84VLdsLYCsR2epRUa43G/6SoYCVJmH/pbYIpAjUrI0CREupaxIswwguFn71HgbYxQGp+FXQs5JmXsso6KKkHlcjgeaIn6DPE45+VPaMpY7KszqgFjtyELVX9Hur1yGG4JT3CLB91Ya7LBAUeHtYHlPfGG2/bfn7VzYokCMbXaRBkgbfFHZqOI9RY0PU6ezSDqovT6S4TlGwwMmv9JMU6u/KdttbrbWi+yB2kyk0iNQCNVOkserH4FCqqO+8yvdr99wyWXMjfmgTglApXKjNTRIUsAfFJTOKlFASuyf9hRWqrq7NqBELtRUpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(1800799024)(7416014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cStaSjdqb09iTTRCY1pDR3hDczJpcHAxQ1kwNElGQUdHUExaald6bnF4ZHBS?=
 =?utf-8?B?S25kMkg4Nmx4ZGFvRUJ0NGtsSndSKzZ1SmErbTR1eWNTNUZBalYzaStYU1RZ?=
 =?utf-8?B?dm5kTU9RWDAreEYyN0Rya0s4TlBSUDlaemlUMnNYUW42cmIrS1JEaFFZVktl?=
 =?utf-8?B?ejgvcnJkUnRJVW5jQ05SNUMzVk5rT0l2TnRQaUhQUC8wKy9lMG1WYU5Dekdh?=
 =?utf-8?B?emFQaXNnZDhtaG5FTUxjQlVVK1dLQWd5c2w1QjgxOVVFSHhxY3dSSFVMZG5s?=
 =?utf-8?B?MWlwZjIxTXRLcDBoOHQramMwL2ZqTllXRkQyVUJtNmhmLzdTWDVEZmE3ZFZS?=
 =?utf-8?B?a2FzZWdPMnhISXpQV0RvVG9VcG5XUE00czNNV1F1a3hTeUpqMnR6Unl4aVJQ?=
 =?utf-8?B?emFBUUMvZ2NTblhPZDNMRC84d2JDUFUvSFV6eGw0YTRFVW5yejFiUmkvNXpP?=
 =?utf-8?B?Ukx0VUxJTDhjLy9SVTdnbzh4emJjVHM4ZXZrY0NoSTFtU2hSL3RCNXYrQ0lz?=
 =?utf-8?B?YmtEMXdhOGFEV21EZzdnVWRaNEJoNjdHMncxU2NTNnlQeVJhbS80N2Z0dVRW?=
 =?utf-8?B?VHAyWXVxeWtGU2JGTnNoQVJybWE1VVJLMmpaUUJoblp6M253bFZicFRRWDZX?=
 =?utf-8?B?OGZhaTl1akxlYXNHMjRHRnNJNVVENHJLRXJQS2l5aTdDM3ZIc1Fqa3hJNm9y?=
 =?utf-8?B?WHhtMWtRU0wzMmZ1Ri84N1pkVVd0eG1zY2J4bTZscy96WFVMb1NkM3YxM0JZ?=
 =?utf-8?B?enJ1YzNMc1RlbmxBWFNrZndlK3pHOGJreldZTmNnR1lRblArWmhXZFg4OXRk?=
 =?utf-8?B?dW1sakhPOFc2b0VRUUZlekRIL3B3L1d3S3Y1N1ltQTRzNHhCQm8zV3NYUS9u?=
 =?utf-8?B?NWJHTWswVDlDMzQ4TlRzdWFhUXJoSGNTcm10ZS94QTl0bzRIaEQ0WVJrTXlI?=
 =?utf-8?B?eWEvSFYxWm5zMmZvb0RsaEdMVWhaSDlrSnF2T2hSaEFYb0pVVTVITUVrdlNo?=
 =?utf-8?B?eU43Q1ZFdjdLQi9XZUozRDlNSzQwVmpVT0FwbThnYnF3V08wZ2VFSWErRWVJ?=
 =?utf-8?B?VFJWelhEY0R5RmJIclVyTXA0NFEwUzN1OUZxZGgwcy8xdFZIbTN6SHpIS1BC?=
 =?utf-8?B?M0d2MW1JNHJlMHRIK0kzeUFjeDBaWW9uZmJaZldKQTNnQkhKV3d4TmYwMVJX?=
 =?utf-8?B?NEVQbjhBaUxSQnZrNjlKbnV6bVdHd0E2aE1vU1d1R2FPckN2Um1kcU9NRWIy?=
 =?utf-8?B?cWRSSWpXZ2s5dk42cDJ6aDZIVkRkQjdLL3lHVW13YmJxL3M4bDNrR1pLT1Vr?=
 =?utf-8?B?M2dsOUdzd1ZtRUVFZEwzOXlQVHR2eSszWVM4V0ViWWpzS0FvUEFncHhralYz?=
 =?utf-8?B?dGZIeVFJd3B4dGU3eFB0NllSMVJiM1NNckM5M0dxdVZEYzNkT00xK211UXJ2?=
 =?utf-8?B?RDJSb250QlA4N1pDSCtTRm5UQmJwVmMrd2E3U2JNT0hudHR3a2pQMEd0WFBY?=
 =?utf-8?B?Yk9FcWVuLzI5M0t5b2VNZVMxWFozaHBqTUlkYXVxRUlNZHZ3Uk9CNzc4c1BL?=
 =?utf-8?B?MGVWdDgxT2crQjZuc3NaeDlyZGNRUjZ0L1dlSUJLUWRLeHZRc1A2SEdBZTA2?=
 =?utf-8?B?OFdjMUFlWkpSTW9PUmN3Uk1jbGFuSGpDbnZkdWxsQzZ0ZENpN0ljb0NYcVN3?=
 =?utf-8?B?S0lreU5hNk9JRUF0NTQ5czRHSENKdDgvV3ZKb1lXUFpzSGFub3pJWTRCS1lx?=
 =?utf-8?B?dkxYUXFpVzdxaFdiTUkxVnhOb0pzSHIyMEpiUEtoV2xPcFYvKzA2WU4yWHZG?=
 =?utf-8?B?NFlFTnlZK0gyVTRINm5Hc2ZRMlVEcWZHbGwvcGFLenF6Y01hSVZNYjBxN1Bo?=
 =?utf-8?B?RHZWRXJ4UjBSYnFnSmkvT3BMSEVNUy9IeXhJTTBSK0xLZTFZMG1ucW9WajBH?=
 =?utf-8?B?VVN4cW1CYVpUWURGUEF3eVZId09xa2dIWklGK2UvZnNlSjZXT2FIdmtFZTUv?=
 =?utf-8?B?ekdXOFNjcXJRdFlBeVZzVlZMYitFZjQzaU9zRDRSUGh4NHNuMGZ6aUp0bnd3?=
 =?utf-8?B?WDFxSkhzSU8vZk93U1FYWC9MZkVlbTFYTFVRQVI0S3VVeDMrVHVnUVdwT24z?=
 =?utf-8?B?VkFzNzE3MWRSb3lFOGFKMVVjVVlFVEVwQ0lac0pWdE4xaE5XY0JmYW1hdFlR?=
 =?utf-8?B?aElnWEJWb3ZyN1JyOFFzZ1hma0h5cVRnVk02NjgvNC9YUnpJRjVYU2VCbFpr?=
 =?utf-8?B?dVlKL2wvc29iM2MwSVNLaXBuM3F4bVJJWVdnNzMybzYxK0VvRTFJY3hDQ1JP?=
 =?utf-8?B?ZXFxZ0dkRnBrNjM2QXdvUUNMUER4S3FuQVViUEFhOXplNkN0R012QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8668b545-727b-4a1e-ddb6-08de8a905d31
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:02:57.9971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVV/0gcfvlIgFIRusP1lKbZYCddT+cUW04744E9lYhb7Q17aGSnym5z1kp5QexbHzMITBoSAtPxVcF7U2Ue7Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11978
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_170305_265889_E01BC29B 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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


On Tue, 24 Mar 2026 20:03:11 +0100, Marek Vasut wrote:
> Add DT overlays to support DH i.MX6 DHCOM SoM carrier board expansion
> modules. The following DT overlays are implemented:
> - PDK2:
>   - DH 497-200 Display board in edge connector X12
>   - DH 505-200 Display board in edge connector X12
>   - DH 531-100 SPI/I2C board in header X21
>   - DH 531-200 SPI/I2C board in header X22
>   - DH 560-200 Display board in edge connector X12
> - PicoITX:
>   - DH 626-100 Display board in edge connector X2
>
> [...]

Applied, thanks!

[1/1] ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM and boards
      commit: 7bc76d413dbe6631a207b38aa67b2d00fdc27b2c

move status = "okay" to last property.

Best regards,
--
Frank Li <Frank.Li@nxp.com>

