Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8308EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2EoYfXgvqL9UKqDvySCZBKhuQLomY7iKBOOSHDmwLrE=; b=GwjEKJwwW+Kyy1lnImUqo5I7Qn
	VAYQVG3Gdmps3UbiflY69eBYYGYaN/R+xtcn71SbayQm5/d2KUf6CbFHHAS31bDcFdAEk7fbRyFSx
	n4j13xpSSwYCLW7uokXjMb/P0XPgRRG4Nf8C2FV4TPdlJA+B0NQE7w3y1tRM+EbI9tRoVPIdCdNiD
	ArZnTEDNaFKOduL7QogOnNod7Gh2zjFd2zCCKb1LdAWqKLlEiVG/kaf3mM1B2UR3NDf8bn2MGM+WR
	hPGE4eb3A0CpVD39zEI4JoMsNSjpb9YoTuBwmV/N7tlZ5qpNsCzdEoC3qpPnSCuIm61WP9DLd7UJl
	gPNH7cMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuzn-0000000CZjP-2ES0;
	Thu, 10 Jul 2025 17:23:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsuS-0000000CD3l-10t5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 15:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Description:In-Reply-To:References;
	bh=2EoYfXgvqL9UKqDvySCZBKhuQLomY7iKBOOSHDmwLrE=; b=Z1nnOX9Cldsc7UDHu6WCLQlbkq
	8J3wLfpu2R4D9IMyPwMMLoI/2aiszoHSsw0m4p0hhOHZjjiNHpPpOl43owPWGIKLBEdRj0L22rOzG
	LT0ze54bIc6fRoVCA/cXrOyA+Dg16hBSmo5hCxw4zKh2+1fwoKXaPxaQY6eMvg+0M09I2HJGYqXPO
	eAzwq0upd2DHg4+9f4mobPUq7XwpyjW3Y6jI7G8uyq766TUNUfzzhlYU2u5vO28MiIDg6fbE+Nc5P
	bV+v6J+p/SNd33OFgd2DUYA+sVdd+S/bleNplxMIqSNpnzLwFAxYzzssgVKO63JShMuiFVG1uuBIG
	mbdVAaVA==;
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsuP-000000093Am-0Gc1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:10:03 +0000
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nbKf5paBfm9gEJpzE3yZbgorFbdq2uvMxq+SQE1x//pXsARUUlnsKxPjlR/cC+7ymdTVBTEurYtqL1jyN5oCH8a/IdLWvoFohtQYqHbU+3/anT9jr97F3lJjxxQPc5tvQ6I9Hvc5lWK6OLnDOUx+CEApAAan1vt98PXVFHLhRywrdifwe58PX34C0JngukMF5IFaSTzr/y47j+ObNfDGrYErxA7swYTx+lfS2lNk0rQHybSsGk0y/Ik9M9WUW5PnToW7/YbGoDxrQTEFGRayW4z+x3DL5AN2AJk/zelMocQEQzeKzkWW0ubPCMPHDVENYabreNftNbcGreu4MnRJQQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EoYfXgvqL9UKqDvySCZBKhuQLomY7iKBOOSHDmwLrE=;
 b=AJmO91rDPSfPplV8QoJG3SAZ7uTgPx7rQiqshS8R4pSouOlGArJYaNk8jO37YQDCeltD0ymljSDzs31CchOJEErbcvkRXcsRzmHNkMMQ621lJWa57yw34omk3rnm8x3FNrXqGFJjxD3eZ/REqf5oUyPzCgWUZcsZFhyenmYoMh0FAXIsBVQS+TeE5aqmHSsyhA7T7yWjgy3V7i0u0Ht7AaLDVsMTKhZWzRqKu3n945nKy51aMx8K0gdoetSEqU6Jf8mEnccih93uVO4fAxAeQhrEqS69we8kknYcDLfN4kgscpTnb3U+3xszvLhJrwKapHtm/6dWpKVclgWO4KStFA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EoYfXgvqL9UKqDvySCZBKhuQLomY7iKBOOSHDmwLrE=;
 b=JSKv+wJwKxyzPbu9gWLyKr78cl41xHyOhnOLrtPHbTNYXWR8Gyc/+9yFl/ZQY2Y6I2sp8yuu/Q02Dn7++kGJescFoMkQlHTRt3vo4c7/nsAYpZ5qMGS4nP0Zt8+ZEg0WTmI+7NdMmZfvYrtRK+jx2lHj2b9p321jF52XShbf4Oo=
Received: from DB6PR0301CA0102.eurprd03.prod.outlook.com (2603:10a6:6:30::49)
 by PAXPR04MB8654.eurprd04.prod.outlook.com (2603:10a6:102:21d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 15:09:52 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::4c) by DB6PR0301CA0102.outlook.office365.com
 (2603:10a6:6:30::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 15:09:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via
 Frontend Transport; Thu, 10 Jul 2025 15:09:52 +0000
Received: from emails-8702488-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-245.eu-west-1.compute.internal [10.20.6.245])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id DDA13805CA;
	Thu, 10 Jul 2025 15:09:51 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1752160191; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=2EoYfXgvqL9UKqDvySCZBKhuQLomY7iKBOOSHDmwLrE=;
 b=Uvuvu4BTuC+kArS8jqHt1BPZp9OMTw+0JhjBK2PjZu/TB53LiRaL6yKDYpLQgtw2IsKl8
 JlgfxVXEbZQg51+RwMfjuwGqooHHtAv9Tk9eMC/0RKHNZOjTJKj2AGle+kMuvlJQNM/nrLm
 BkSYjH/LmqlKYv+EMX6UJs0HIX9Tbks=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1752160191;
 b=hMM0by9N4nMRJGHoLOWdNOjXt98dm2A4Qz/BGLlVe8SO+1dwDsluaYRXguUHFM6Bd/emg
 qgbDPixCRPWjJMIKafasLLfojrepIgji5q1zw/WI6RWJW/2xQjSs/3UxbH4UshV/1pdbZ/w
 zBH6ZnyVdQg+4Xp+wXa+hD11Ug/hQKA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnIOn2as/M9z3ocbskLl9CS5Y7N/bxrmnHE85ajrYn3iTFLynaCw/Jgllr5GxG/7hrP2IkqD2bZVtkQOuxhQsCumNuzUe/NxMaX0HOAFgKsMdmB2gUf28oQfo4NpjHQ2zR8o4YmT3I5tG6PB6zc6VXPl6HBqIj7kDCeaFBYPiMi+zXB4KUBRDQXnf/L6sD/wZmEb5M3w4tRibdO2yS1ogozyjed7bfr/gAbCQ7TYoNjqzErCmDN1XuODgOUaey2xGlauUhLmBunUEyNU8IRapzj2tCE70HacIOqs665EAzpt42K3B7vQYiGhhs1Y3XgsqQ+f2qyI9HxpqAq5PR7o0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EoYfXgvqL9UKqDvySCZBKhuQLomY7iKBOOSHDmwLrE=;
 b=nk4J1TheTBUGTd9igGb3RlO6l0JRr7fuuSX3RoiQmtmJ1IPrkjEM+2E+pe9MVH2gXhtXFj6Lkc8L/UePgP7OhGinbd3CO0v9iqaVEbgXWJsZXoYfmBbKxG9Ex1XN4d+E/z5mR2AKq6MFa+Qpab0YlC/hWCrX/9e+wJsIVd2VJVQOBzaNwKB52MC9RRHc0R1wh9rcw3TmUnPlw3bXVaoF3EVkyqXrMUya6FyOUPYf7JU5YLmW+/5dfUmVlLgkFi+FlmVRVi2fyL88uJyuFLnSgxeaIrtYdADIyFjDZfpb8HWPY90VD3ExUO3+3Z0J3k582iebo7RA6cx0IO2vpkNMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EoYfXgvqL9UKqDvySCZBKhuQLomY7iKBOOSHDmwLrE=;
 b=JSKv+wJwKxyzPbu9gWLyKr78cl41xHyOhnOLrtPHbTNYXWR8Gyc/+9yFl/ZQY2Y6I2sp8yuu/Q02Dn7++kGJescFoMkQlHTRt3vo4c7/nsAYpZ5qMGS4nP0Zt8+ZEg0WTmI+7NdMmZfvYrtRK+jx2lHj2b9p321jF52XShbf4Oo=
Received: from AM6PR04MB4567.eurprd04.prod.outlook.com (2603:10a6:20b:19::11)
 by AS8PR04MB8135.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.23; Thu, 10 Jul
 2025 15:09:40 +0000
Received: from AM6PR04MB4567.eurprd04.prod.outlook.com
 ([fe80::6d60:a27a:fde:6c1f]) by AM6PR04MB4567.eurprd04.prod.outlook.com
 ([fe80::6d60:a27a:fde:6c1f%4]) with mapi id 15.20.8880.021; Thu, 10 Jul 2025
 15:09:40 +0000
From: Josua Mayer <josua@solid-run.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Carlos Song <carlos.song@nxp.com>
CC: Jon Nettleton <jon@solid-run.com>, Rabeeh Khoury <rabeeh@solid-run.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux@ew.tq-group.com"
	<linux@ew.tq-group.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
	Josua Mayer <josua@solid-run.com>
Subject: [PATCH] arm64: dts: fsl-lx2160a: define pinctrl for iic2 sd-cd/-wp
 functions
Thread-Topic: [PATCH] arm64: dts: fsl-lx2160a: define pinctrl for iic2
 sd-cd/-wp functions
Thread-Index: AQHb8ayo5S34wuk9IUWriiv4NxSFDA==
Date: Thu, 10 Jul 2025 15:09:40 +0000
Message-ID: <f32c5525-3162-4acd-880c-99fc46d3a63d@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: AM6PR04MB4567:EE_|AS8PR04MB8135:EE_|DU6PEPF0000A7E2:EE_|PAXPR04MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: 649dffa6-e6ce-461f-39fa-08ddbfc3d217
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?RU55aHZJc3MxQ212eURhQk95ZXRXakYreTcvSmNBcklMMjJiL1FVR3VjTkNG?=
 =?utf-8?B?dzcwNXlqd2FGbTdOclRiQjNObFk3U09sc2JnTVVRVzZzYUxLdzE4TFYrWWJy?=
 =?utf-8?B?VmNUcGhqRUtRN2lJZmMxWTNCdGt2Tm5nQndVV3VSRnlvbjBDZ0RCSXJzRWRS?=
 =?utf-8?B?RnkrOGVpeXVodnVKQXJEeldKNFhVcXhseGt4eWZmVThmQVNhaERFNjJHS3ov?=
 =?utf-8?B?U2U4aDM3SjNrVnVLRkdEUVBLTXNyclBtZ0FscmhUNnZZalM3WUV1cHBkTGlO?=
 =?utf-8?B?dDhiRzFRV2Y5c1ZXdWNtQ1JYM0c4VW8xMVM1VVR5a2VGWVhvV2ZmQmxiQW5M?=
 =?utf-8?B?dTFrd3N6R21qaVhlSlR3Uk95T3dLODRhZXIybkY3T2krUnZTLzRaNG1iZHJT?=
 =?utf-8?B?SGF3OHVIQ3gxUjhvTVpvZUZxOUtLbHdkTFVJMUE2bHlzQzI4SFZaN0JJQUE4?=
 =?utf-8?B?bE0rYTVLSU5HdXV6aUVrbm5KczBPNmFUOVlYZkdGVGp0Ulh6dy9yVHVweGtZ?=
 =?utf-8?B?Z3Nza3NHVm84TzdackZzOFNJV1NYeWI4Sm5nbnp5d0lZM1lhMnAxSEFNQjJH?=
 =?utf-8?B?L08wZi9BYkpQRWtWUVBvd2M5djB1OXBBdGxUUUd4M2FrcE1uYXdsSWF2aFFm?=
 =?utf-8?B?UXZoSmlOdStXY213ZGQzV3FTTUQwc3FrQTR2UlEwbUcvaHY1L1M1L2luQzZ3?=
 =?utf-8?B?Nk9vSjRVaDVYaUtoNjNUblFSSkZIR0VwdzVxQjhMSEJ1Mm9rSXVxYjhJaE5W?=
 =?utf-8?B?UEVkazI4N3h1YnpzRi96UGZUaXdTUjJVOGtFSHZCR1puSWd0UFNCODhwcEM1?=
 =?utf-8?B?QnVMUk9BejZ6TFpSOHBuR3ZCNW40MFVsWDE3SlYwcmE3eFFsRVNudXVVMXlo?=
 =?utf-8?B?MFdJSy9KSkNnN3htNkxHYTZsZzB4U3pZeFBFZERxanRubjVIWGEyTkF0ZHF3?=
 =?utf-8?B?dkN4SXJlQUdJRSt0c3piZGNLVkhGbjZqajdsK05kSmVqalJHQlBiSEQ0eURm?=
 =?utf-8?B?RXhYRDFBc2czdGpHcm5EK2N1c1FKSS9xYVN2ZCt5WUlBM0dCakM3M0l6ZWVk?=
 =?utf-8?B?cVdHS3c5SHRFN3YzbGpRTFpTQVZiQkJ6Q1N2ZkQzRDJYSmZiWTlqaEltZDc2?=
 =?utf-8?B?QTMzcTlvR2hNU0tlcGRRQkZ1VFp2aERjTk5kYitEa0l5Tk0yU2FaSThpdmh4?=
 =?utf-8?B?bDRETjlRZldLNGhDZ3E3L2d5T200SEExZlF6TmlxMndJMjNxeTRpVThuY25x?=
 =?utf-8?B?enlIWmYrLy9Wd0tITUJoMmUwNTNLb2RwMEE3Q2s2cW54WURyVVZHbmRHRHZP?=
 =?utf-8?B?UFk3SlBOKzRFU3dDTGxVOENHVWs1N0FTWWhBdmw0enlhMEpIZVZNYmZLYm4x?=
 =?utf-8?B?Zk9sSGJnejVIc3BKdFJpZmxEYXhkVi9kTVJoZkE5ak12OGhXVWxTTmVsblFB?=
 =?utf-8?B?SHdPMTBid1c2S2c3VlJXSURDenR5dlRoN1QreFl4L1hzVEo4eDlFeDk5Z09W?=
 =?utf-8?B?SkRiMFl2alFZYThwS2Jzai8wN3RvL2F4VUhwbTY1VVhSTytqT2Q2ZmYwL1hw?=
 =?utf-8?B?Zm1KNWN0QVB4RWFQUklzWG9SUlA1bWVqLzZyR2FiSStLenp4NmZSYno4dzBD?=
 =?utf-8?B?ZWdJUndacENWZzd4bS9MUnRRL25aWHAxdFJuV3BvaWl3eGpjQjU1aE9TVnE5?=
 =?utf-8?B?d1dRbkdqZmx2T2psOEtBN2dJZnRERnlVQUs2aVdRZzBlMjVickVzU2IzRnpS?=
 =?utf-8?B?YTR1SGNBRXVZUVJqcU1DSWFybmRzT2RCRXptQmZBdzZiUG9JdHdwS0gvd2J3?=
 =?utf-8?B?MkczQVk5czlOMTBPUnhCcDdXYzIrQnNCenI5eS85RDVEbG5zVmEvRkhFS0hO?=
 =?utf-8?B?R091aUJ3OGtLY2VHamVLUi9jeFRCcFEzRXJpSkNqNVBsSUZWOFZObFNLdzB1?=
 =?utf-8?B?dXlkZlB6VXJtLzRhdG1FcEFXbjAvc2w0ZDRMREJDQ1Q0OUxOY2FONVBqU2hO?=
 =?utf-8?B?WXo5ZzNCK253PT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CB2A3DB3EC3B345A2BA714F680AFD17@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8135
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1228f02bab5948368c7ec61a19d6e426:solidrun,office365_emails,sent,inline:d6c33a5310794ba3b3665c4f73f75572
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 56f65047-1a51-4e1a-9270-08ddbfc3cb22
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|35042699022|36860700013|376014|7416014|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmxNdnNOZXBhWFIzc3cyK21rSkh2ZnFxcHBZU1JLYVhGQ2s5YzB4eEgzTjdR?=
 =?utf-8?B?NlVOUXhvM3VIcktqd2wwck5DelYvV0ZHSGhYcEx3YXIzV1dTcUszWFNsd2du?=
 =?utf-8?B?aHZvMS9vWHhDdFRLOXdQVzBTN2ZKOXBLMFc5STdEcVRpb0FuUkFNN0xaeW1E?=
 =?utf-8?B?VzUzYml3YzV5WmdwOXM3MFczdGFaaHBuUDdHRUI1djVYNDVEZVpoeUd5WlN3?=
 =?utf-8?B?SmhTaVhXbzZsamFJY2JIQVJjdWRxcWJEWXZDZ3ZEenRNVkFNRWxITGR0bkZW?=
 =?utf-8?B?bEJva0dnVzFoYUtZcEVvSTgybzFyY3lNbHEram8vejNRRERsVXpPWGdsY2Qv?=
 =?utf-8?B?SDhIcmorZDlMeGxGbWxnelR1MDNYSVZoeGRGeVIxVkF2NzBDakhSSEY2Z1Ay?=
 =?utf-8?B?eVN6NHhQZUZLYUNML2R4K0NLZGVLaHl1Nk11SFFqNU5samNUZkR5d290aHZI?=
 =?utf-8?B?NitiM2dWYXlENmFVWmtyZmZGRTVHVnBsMnRTelJDK0tFN3FCa3hKS0o5K01p?=
 =?utf-8?B?bmt4MWo2RlVMR3RPZVNHeXg4elNlZlc0Z2dQeFo1Zzc1RTFscktwbFA2UlFH?=
 =?utf-8?B?MnhLUXVxeEJMcjVJeWdKV25sYXFUanJWQ2xlZHpUS3RJNERGLzRUa0tUd20w?=
 =?utf-8?B?Rk81L0cweUR2VzlmSDJhU2pidFE5bHRJNGZ5S25RN01abzl0RmhBNjVPcTZi?=
 =?utf-8?B?Y1dUckRSaVJrY3VnN3c1UDZVVllKM1ByOTdMaDI0RUZab1A5aHF2bGZNS1di?=
 =?utf-8?B?UEpHZUYwU2lPQ1Rsd0hOdmRidStzUzVUTjBabzdVell1OTY1TU85bENVQXZY?=
 =?utf-8?B?TEJLQllvUzRZNkxwS2lwVUtPUUl0dVZVbURoVW15WHlUWDdoZkxkRzlWdDlH?=
 =?utf-8?B?RlowM3Boc1lmUnV1cDkrek5zNENxNEpLNTNSdCswRTExTTczM3FWdlo0Ujc3?=
 =?utf-8?B?eCtEL3h6Sy9iMnhJaGcrcnFpY1RnSjRRbmVCT3ZrRnViUFU2VWlQeC9LK3Rn?=
 =?utf-8?B?eHBHK3V3a3dUNm45TTNXVCtQdUhCS3dMdHJ2SzEvMDBOZmhwbVo3aFkzK1NN?=
 =?utf-8?B?VWFlaVd3NDdWMDRqcUttWHpRSElLcVZ4Q0hVOEcvMHZmRHlMQ29lZmkveU1F?=
 =?utf-8?B?blRwOXcrUk1VUEVrUXRWMUZjTW0xbmM1TjhnNWRmRUV4S0dHcjJGT015NWZW?=
 =?utf-8?B?RHRJQzdYWUU1djZHcklKQUMzalVRSGV3aWE0RTRhSkNBRjJkalJKbEx1SkN5?=
 =?utf-8?B?RkhaWTd0K1E2VENwRXdRUExkcm02RGEvaTFVcEVQZWswY2NWaUNHVHNqaldv?=
 =?utf-8?B?T01URm5pcWpqbVFjbzY0U0pqQjdmazBxV2wrVFJHRjBWclZqSzMwcCs0V29i?=
 =?utf-8?B?T2h5S3c5c1J2WGdCdWdHM1ZHZ2xLTHVjRVI1R0lORjBhTGZsR0hVODg2b3NG?=
 =?utf-8?B?QjdxU08wM2QxcDFJVktZNGxBVkRXckd5Sk5YTE1mZU1hbC85UnVLWWtOMlFu?=
 =?utf-8?B?MUttOVJKZ0tUZzRsVXRpcUQxR0ZHRUMrbHFsOTE1ZHNBQnNlS3I4dCt0TmxX?=
 =?utf-8?B?c1o5UEtCbHppQ3NNZHNvaHFoT3BCVG9nUm9uM04waWQveDhORlNReTZ5Z1h3?=
 =?utf-8?B?a0xKWUd0dnd4Y0tBd1dzWnFvemRZVEhsWXFTTy9tdGdOc1E4NklUMmdFRjg2?=
 =?utf-8?B?QkdkdjhZbmQ1cU5ZU1gvOE9STisyQ29DNVJkVFlQSjVsdzhHdEI5OUsxNTFW?=
 =?utf-8?B?ZGovNXZiOVhSMHE5OEpxSDg1bjZ1K3FTeHJ3aFNYOW5uZVhpTU9QR3FnZWFL?=
 =?utf-8?B?WjI2VzhzU2s0YTd6QnBSUDJ1RzRUKzFrZFpOc3FSUSs4dndBSWtTRE0ya1VK?=
 =?utf-8?B?VFo3bTBiWUpVMEQ5TitTU1BiQjgxU24wTGlvMnNueWZzdEZhb2kzdnNPZ1Fs?=
 =?utf-8?B?OWVWNkp5cWw2R3FkWS9SMk1UZEw4WXdhc2pxUHAxdTd6VFNnYlBKTVI5c3lY?=
 =?utf-8?B?VGJkdFlJWWdWdlhSaElOS3hSYnF3a0tyZDdoWk5iQVNPVjZJaGp1Nkd1dzdu?=
 =?utf-8?Q?8jMdcx?=
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(36860700013)(376014)(7416014)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:09:52.0340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 649dffa6-e6ce-461f-39fa-08ddbfc3d217
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8654
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_161001_244196_ED655547 
X-CRM114-Status: UNSURE (   9.72  )
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

TFgyMTYwIFNvQyB1c2VzIGEgZGVuc2VseSBwYWNrZWQgY29uZmlndXJhdGlvbiBhcmVhIGluIG1l
bW9yeSBmb3IgcGluDQptdXhpbmcgLSBjb25maWd1cmluZyBhIHZhcmlhYmxlIG51bWJlciBvZiBJ
T3MgYXQgYSB0aW1lLg0KDQpTaW5jZSBwaW5jdHJsIG5vZGVzIHdlcmUgYWRkZWQgZm9yIHRoZSBp
MmMgc2lnbmFscyBvZiBMWDIxNjAgU29DLCBib290DQplcnJvcnMgaGF2ZSBiZWVuIG9ic2VydmVk
IG9uIFNvbGlkUnVuIExYMjE2MkEgQ2xlYXJmb2cgYm9hcmQgd2hlbiByb290ZnMNCmlzIGxvY2F0
ZWQgb24gU0QtQ2FyZCAoZXNkaGMwKToNCg0KWyAgICAxLjk2MTAzNV0gbW1jMDogbmV3IHVsdHJh
IGhpZ2ggc3BlZWQgU0RSMTA0IFNESEMgY2FyZCBhdCBhZGRyZXNzIGFhYWENCi4uLg0KWyAgICA1
LjIyMDY1NV0gaTJjIGkyYy0xOiB1c2luZyBwaW5jdHJsIHN0YXRlcyBmb3IgR1BJTyByZWNvdmVy
eQ0KWyAgICA1LjIyNjQyNV0gaTJjIGkyYy0xOiB1c2luZyBnZW5lcmljIEdQSU9zIGZvciByZWNv
dmVyeQ0KLi4uDQpbICAgIDUuNDQwNDcxXSBtbWMwOiBjYXJkIGFhYWEgcmVtb3ZlZA0KDQpUaGUg
Y2FyZC1kZXRlY3QgYW5kIHdyaXRlLXByb3RlY3Qgc2lnbmFscyBvZiBlc2RoYzAgYXJlIGFuIGFs
dGVybmF0ZQ0KZnVuY3Rpb24gb2YgSUlDMiAoaW4gZHRzIGkyYzEgLSBvbiBseDIxNjIgY2xlYXJm
b2cgc3RhdHVzIGRpc2FibGVkKS4NCg0KQnkgdXNlIG9mIHUtYm9vdCAibWQiLCBhbmQgbGludXgg
ImRldm1lbSIgY29tbWFuZCBpdCB3YXMgY29uZmlybWVkIHRoYXQNClJDV1NSMTIgKGF0IDB4MDFl
MDAxMmMpIHdpdGggSUlDMl9QTVVYIChhdCBiaXRzIDAtMikgY2hhbmdlcyBmcm9tDQoweDA4MDAw
MDA2IHRvIDB4MDAwMDAwMCBhZnRlciBzdGFydGluZyBMaW51eC4NClRoaXMgbWVhbnMgdGhhdCB0
aGUgY2FyZC1kZXRlY3QgcGluIGZ1bmN0aW9uIGhhcyBjaGFuZ2VkIHRvIGkyYyBmdW5jdGlvbg0K
LSB3aGljaCB3aWxsIGNhdXNlIHRoZSBjb250cm9sbGVyIHRvIGRldGVjdCBjYXJkIHJlbW92YWwu
DQoNClRoZSByZXNwZWN0aXZlIGkyYzEtc2NsLXBpbnMgbm9kZSBpcyBvbmx5IGxpbmtlZCB0byBp
MmMxIG5vZGUgdGhhdCBoYXMNCnN0YXR1cyBkaXNhYmxlZCBpbiBkZXZpY2UtdHJlZSBmb3IgdGhl
IHNvbGlkcnVuIGJvYXJkcy4NCkhvdyB0aGUgbWVtb3J5IGlzIGNoYW5nZWQgaGFzIG5vdCBiZWVu
IGludmVzdGlnYXRlZC4NCg0KQXMgYSB3b3JrYXJvdW5kIGFkZCBhIG5ldyBwaW5jdHJsIGRlZmlu
aXRpb24gZm9yIHRoZQ0KY2FyZC1kZXRlY3Qvd3JpdGUtcHJvdGVjdCBmdW5jdGlvbiBvZiBJSUMy
IHBpbnMuDQpJdCBzZWVtcyB1bndpc2UgdG8gbGluayB0aGlzIGRpcmVjdGx5IGZyb20gdGhlIFNv
QyBkdHNpIGFzIGJvYXJkcyBtYXkNCnJlbHkgb24gb3RoZXIgZnVuY3Rpb25zIHN1Y2ggYXMgZmxl
eHRpbWVyLg0KDQpJbnN0ZWFkIGFkZCB0aGUgcGluY3RybCB0byBlYWNoIGJvYXJkJ3MgZXNkaGMw
IG5vZGUgaWYgaXQgaXMga25vd24gdG8NCnJlbHkgb24gbmF0aXZlIGNhcmQtZGV0ZWN0IGZ1bmN0
aW9uLiBUaGVzZSBib2FyZHMgaGF2ZSBlc2RoYzAgbm9kZQ0KZW5hYmxlZCBhbmQgZG8gbm90IGRl
ZmluZSBicm9rZW4tY2QgcHJvcGVydHk6DQoNCi0gZnNsLWx4MjE2MGEtYmx1ZWJveDMuZHRzDQot
IGZzbC1seDIxNjBhLWNsZWFyZm9nLWl0eC5kdHNpDQotIGZzbC1seDIxNjBhLXFkcy5kdHMNCi0g
ZnNsLWx4MjE2MGEtcmRiLmR0cw0KLSBmc2wtbHgyMTYwYS10cW1seDIxNjBhLW1ibHgyMTYwYS5k
dHMNCi0gZnNsLWx4MjE2MmEtY2xlYXJmb2cuZHRzDQotIGZzbC1seDIxNjJhLXFkcy5kdHMNCg0K
VGhpcyB3YXMgdGVzdGVkIG9uIHRoZSBTb2xpZFJ1biBMWDIxNjIgQ2xlYXJmb2cgd2l0aCBMaW51
eCB2Ni4xMi4zMy4NCg0KRml4ZXM6IDhhMTM2NWM3YmJjMSAoImFybTY0OiBkdHM6IGx4MjE2MGE6
IGFkZCBwaW5tdXggYW5kIGkyYyBncGlvIHRvIA0Kc3VwcG9ydCBidXMgcmVjb3ZlcnkiKQ0KQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNClNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1
YUBzb2xpZC1ydW4uY29tPg0KLS0tDQogIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2Zz
bC1seDIxNjBhLWJsdWVib3gzLmR0cyAgICAgICAgICAgICB8IDIgKysNCiAgYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtY2xlYXJmb2ctaXR4LmR0c2kgICAgICAgIHwg
MiArKw0KICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS1xZHMuZHRz
ICAgICAgICAgICAgICAgICAgfCAyICsrDQogIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2ZzbC1seDIxNjBhLXJkYi5kdHMgICAgICAgICAgICAgICAgICB8IDIgKysNCiAgYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtdHFtbHgyMTYwYS1tYmx4MjE2MGEuZHRz
IHwgMiArKw0KICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNp
ICAgICAgICAgICAgICAgICAgICAgfCA0IA0KKysrKw0KICBhcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHgyMTYyYS1jbGVhcmZvZy5kdHMgICAgICAgICAgICAgfCAyICsrDQogIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjJhLXFkcy5kdHMgICAgICAgICAg
ICAgICAgICB8IDIgKysNCiAgOCBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQoNCmRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS1ibHVl
Ym94My5kdHMgDQpiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLWJs
dWVib3gzLmR0cw0KaW5kZXggMDQyYzQ4NmJkZGEyLi4yOThmY2RjZTZjNmIgMTAwNjQ0DQotLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS1ibHVlYm94My5kdHMN
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLWJsdWVib3gz
LmR0cw0KQEAgLTE1Miw2ICsxNTIsOCBAQCAmZXNkaGMwIHsNCiAgCXNkLXVocy1zZHI1MDsNCiAg
CXNkLXVocy1zZHIyNTsNCiAgCXNkLXVocy1zZHIxMjsNCisJcGluY3RybC0wID0gPCZpMmMxX3Nk
aGNfY2R3cD47DQorCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQogIAlzdGF0dXMgPSAib2th
eSI7DQogIH07DQogIGRpZmYgLS1naXQgDQphL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2ZzbC1seDIxNjBhLWNsZWFyZm9nLWl0eC5kdHNpIA0KYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHgyMTYwYS1jbGVhcmZvZy1pdHguZHRzaQ0KaW5kZXggYTdkY2JlY2MxZjQx
Li42N2ZmZTJlMWIwYmMgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9mc2wtbHgyMTYwYS1jbGVhcmZvZy1pdHguZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtY2xlYXJmb2ctaXR4LmR0c2kNCkBAIC05Myw2ICs5Myw4
IEBAICZlc2RoYzAgew0KICAJc2QtdWhzLXNkcjUwOw0KICAJc2QtdWhzLXNkcjI1Ow0KICAJc2Qt
dWhzLXNkcjEyOw0KKwlwaW5jdHJsLTAgPSA8JmkyYzFfc2RoY19jZHdwPjsNCisJcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IjsNCiAgCXN0YXR1cyA9ICJva2F5IjsNCiAgfTsNCiAgZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLXFkcy5kdHMgDQpi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLXFkcy5kdHMNCmluZGV4
IDRkNzIxMTk3ZDgzNy4uMTdmZTRhOGZkMzVlIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtcWRzLmR0cw0KKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtcWRzLmR0cw0KQEAgLTIxNCw2ICsyMTQsOCBAQCAm
ZW1kaW8yIHsNCiAgfTsNCiAgICZlc2RoYzAgew0KKwlwaW5jdHJsLTAgPSA8JmkyYzFfc2RoY19j
ZHdwPjsNCisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCiAgCXN0YXR1cyA9ICJva2F5IjsN
CiAgfTsNCiAgZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1s
eDIxNjBhLXJkYi5kdHMgDQpiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIx
NjBhLXJkYi5kdHMNCmluZGV4IDBjNDRiM2NiZWY3Ny4uZmFhNDg2ZDZhNWIxIDEwMDY0NA0KLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtcmRiLmR0cw0KKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtcmRiLmR0cw0KQEAg
LTEzMSw2ICsxMzEsOCBAQCAmZXNkaGMwIHsNCiAgCXNkLXVocy1zZHI1MDsNCiAgCXNkLXVocy1z
ZHIyNTsNCiAgCXNkLXVocy1zZHIxMjsNCisJcGluY3RybC0wID0gPCZpMmMxX3NkaGNfY2R3cD47
DQorCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQogIAlzdGF0dXMgPSAib2theSI7DQogIH07
DQogIGRpZmYgLS1naXQgDQphL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIx
NjBhLXRxbWx4MjE2MGEtbWJseDIxNjBhLmR0cyANCmIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvZnNsLWx4MjE2MGEtdHFtbHgyMTYwYS1tYmx4MjE2MGEuZHRzDQppbmRleCBmNmE0Zjhk
NTQzMDEuLjRiYTU1ZmViMThiMiAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2ZzbC1seDIxNjBhLXRxbWx4MjE2MGEtbWJseDIxNjBhLmR0cw0KKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtdHFtbHgyMTYwYS1tYmx4MjE2MGEu
ZHRzDQpAQCAtMTc3LDYgKzE3Nyw4IEBAICZlc2RoYzAgew0KICAJbm8tc2RpbzsNCiAgCXdwLWdw
aW9zID0gPCZncGlvMCAzMCBHUElPX0FDVElWRV9MT1c+Ow0KICAJY2QtZ3Bpb3MgPSA8JmdwaW8w
IDMxIEdQSU9fQUNUSVZFX0xPVz47DQorCXBpbmN0cmwtMCA9IDwmaTJjMV9zY2xfZ3Bpbz47DQor
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQogIAlzdGF0dXMgPSAib2theSI7DQogIH07DQog
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS5k
dHNpIA0KYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNpDQpp
bmRleCBjOTU0MTQwM2JjZDguLjU1NWExOTFiMGJiNCAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLmR0c2kNCisrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLmR0c2kNCkBAIC0xNzE3LDYgKzE3MTcsMTAgQEAg
aTJjMV9zY2xfZ3BpbzogaTJjMS1zY2wtZ3Bpby1waW5zIHsNCiAgCQkJCXBpbmN0cmwtc2luZ2xl
LGJpdHMgPSA8MHgwIDB4MSAweDc+Ow0KICAJCQl9Ow0KICArCQkJaTJjMV9zZGhjX2Nkd3A6IGky
YzEtZXNkaGMwLWNkLXdwLXBpbnMgew0KKwkJCQlwaW5jdHJsLXNpbmdsZSxiaXRzID0gPDB4MCAw
eDYgMHg3PjsNCisJCQl9Ow0KKw0KICAJCQlpMmMyX3NjbDogaTJjMi1zY2wtcGlucyB7DQogIAkJ
CQlwaW5jdHJsLXNpbmdsZSxiaXRzID0gPDB4MCAwICgweDcgPDwgMyk+Ow0KICAJCQl9Ow0KZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjJhLWNsZWFy
Zm9nLmR0cyANCmIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MmEtY2xl
YXJmb2cuZHRzDQppbmRleCBlYWZlZjg3MThhMGYuLjRiNTgxMDVjM2ZmYSAxMDA2NDQNCi0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjJhLWNsZWFyZm9nLmR0cw0K
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MmEtY2xlYXJmb2cu
ZHRzDQpAQCAtMjI3LDYgKzIyNyw4IEBAICZlc2RoYzAgew0KICAJc2QtdWhzLXNkcjUwOw0KICAJ
c2QtdWhzLXNkcjI1Ow0KICAJc2QtdWhzLXNkcjEyOw0KKwlwaW5jdHJsLTAgPSA8JmkyYzFfc2Ro
Y19jZHdwPjsNCisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCiAgCXN0YXR1cyA9ICJva2F5
IjsNCiAgfTsNCiAgZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2Zz
bC1seDIxNjJhLXFkcy5kdHMgDQpiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1s
eDIxNjJhLXFkcy5kdHMNCmluZGV4IDlmNWZmMWZmZTdkNS4uY2FhMDc5ZGYzNWY2IDEwMDY0NA0K
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MmEtcWRzLmR0cw0K
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MmEtcWRzLmR0cw0K
QEAgLTIzOCw2ICsyMzgsOCBAQCAmZXNkaGMwIHsNCiAgCXNkLXVocy1zZHI1MDsNCiAgCXNkLXVo
cy1zZHIyNTsNCiAgCXNkLXVocy1zZHIxMjsNCisJcGluY3RybC0wID0gPCZpMmMxX3NkaGNfY2R3
cD47DQorCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQogIAlzdGF0dXMgPSAib2theSI7DQog
IH07DQoNCi0tLQ0KYmFzZS1jb21taXQ6IDE5MjcyYjM3YWE0ZjgzY2E1MmJkZjljMTZkNWQ4MWJk
ZDEzNTQ0OTQNCmNoYW5nZS1pZDogMjAyNTA3MTAtbHgyMTYwLXNkLWNkLTAwYmYzOGFlMTY5ZQ0K
DQpCZXN0IHJlZ2FyZHMsDQotLSANCkpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0K
DQo=

