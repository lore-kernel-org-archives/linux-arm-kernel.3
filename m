Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95C9606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xWM1Dq07;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AJW/KLQn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8s7lxnHqJi1GcXJiuKFuBWOm7hq+rICrq+V71CFlrVw=; b=xWM1Dq070pOfwARFn8LZtZaPtH
	R2uENo4pNi1zR92qSr1nd3rTwSufVk2O/xJvGdxmaBI/2WuiqjUT4/Qvycp0g3q/reCBE4UPbphLN
	ETaw+DMFcvCC4SSYa+/sAQsHKjBcFuz5hKrQg78fd8UuX7qpHI20i8YUFH7ojhKyWv0+i5+932pGz
	tIpc6QF9dCK3tLhwM/TTYK7ar0YiEa5XtTi/IHSo5bB5c/3eDBA07i00lWSaHcoHM2RRGDBaTQsuN
	tMiLM6UGdTase6WPxTiBF1fGFFNJzpsDprKOAXA+UG4n4DHtFQJ8O/Mof0Tpt9ED20E4RnaPM3kOP
	cUL4m5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0Jf-0000000F0Gt-235y;
	Thu, 22 Oct 2026 21:27:15 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0Jc-0000000F0GX-3LdX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 21:27:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iax888DLyWdJCrAgACnHpDcaBM+TRjYCL9nat8aOKS/rvDwUwN480P92rST0GFawJppWr5R/YLYT7s8Iu8Dn3vCCuMIEsTn+mm1I/s1xm9B9qmb/a+Pug6MUul+OJpxyRKnRvKrR7vLQrqsqlRQ7NStokRqQKQoKQ1OsmPX9uRJjwJrD9+5VFQzEXIqGjurJb9nkhlbXgQ57SURl+pfkhzjB3I6uxb0j8oJnso8gMg3QIj/iRQs8SN67ssDIoJoO1vnbIK+JKji44Lq6iTomx+vrE+25Jbq0rmo7UfB/szufgJj6IfNAUOCPdSjZspkg8etJ5lf6QU8pcIdjl0s58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8s7lxnHqJi1GcXJiuKFuBWOm7hq+rICrq+V71CFlrVw=;
 b=qTXqGE3DPywIB2wyv999dOwQ+OWL6Ko1EITnVSKRocvtWjrN9IFtrtMd0CRk+6dcgpMc64U4PoOMVOBqSyLxG9yLfY1qExgMHc9/GMRH1SyDHS77/Ea6keN5wEvH4ADJZQxX6GT/ZLrkeC6OhA5DfkjMAZkS86LVfNwsj1W4/QbCnQt5aTLZkZPjNOZipSrzaSDqsxghj/MrnOzO57kZmpLO3KIHac80mEFofE/sG8I2y4a3JDJpxZszhQdY7WVvptwAaqw+Qxh0Yp9UNMfM7+H+mRECAsF5l16GT6AxX+/lTQDjvOT/y3Q/7MTeS3hrYHTCFo206vHNtueHPZpOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s7lxnHqJi1GcXJiuKFuBWOm7hq+rICrq+V71CFlrVw=;
 b=AJW/KLQn6d1h05HI3oUT15jvkc067E3capep9yTZffQGLRyWWIhEMO19aY3xZm6J024NaKJ5YGzPpWtm4Sj7SKGwXRDbJguFzu1cYYNAmnK2X5VwaZVmO9EZU9Jbz2ZIEZr5JIbu6RHupXAzydCbQHZ/wF/+f9zxnGsCnI5y/rOCWvdUd9amBNZRCevIGsMbEeixWzTeplJyyG/rGF20GjNkdrPMe7mjBr9P9YC6bZYD74CIZRlRQ37Yxj/GM+YGSTjimYEDpEyBR1kb2pbEInLk5Ai1zWAUt3rekrLQH8+YVnCvSlVQvP4FTBpe0O1IhluZjsj5Vaw+xv2DQiQODQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB9447.eurprd04.prod.outlook.com (2603:10a6:102:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Thu, 22 Oct
 2026 21:27:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 21:27:06 +0000
From: Frank.Li@oss.nxp.com
To: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: imx: fix typo "interupt" in comment
Date: Thu, 22 Oct 2026 17:26:58 -0400
Message-ID: <179270436166.1370833.7012764860088052875.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006060133.43320-1-hemanth.selam@gmail.com>
References: <20261006060133.43320-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR01CA0002.prod.exchangelabs.com (2603:10b6:5:296::7) To
 MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: aceb45c3-d9f5-40a3-c83a-08df308338f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|19092799006|366016|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: K5xdqglK1pl4BuYt9GUxpCSGre4of893rhyMUKp6xpH9mJwrns+mt9mbxZMxtgCwTsczdsSEooq/JrfonqKAHpM/r9LUWJs5DNfgt7gWZCh3hBSyUfU3T2VcAcXFWrrHHJLM98vYuZ3NYT/d6DNkbrJuGBJzR4ovAg2Ci5Iti9sOothfJhYSAfg8Hi49gYMcGgJH/lGLhYkgtnW2oLBJTq9O5nRjGh5NXhQppySzr5lBVzFApEfeS+zLNwGB0eRDRz3iNZxbEOlSPLB5VCidLygCdNVUXFnmcvNJR74zxJMVPh4te/LgpISP66G4ZHm+rs7KNyGAZ2eugWCSl9EFouTH6EaQmTg9NfYdbA5CnEM/IzGUvKcxJ3kSrfgFGnJCK01Dynm2tE6oFD/mq1OlQ+Ty/twPllqGNiqeyoe5x3o87+bQNLQoShR90S0sMQZ1rEqPnng2YxXm0y6t/2v8utc/len1aS8fEF9hRUXbwrmpKWkOL2Fskuzaj1eXINuU8dcQXq0UsbYGJo0Sbh6yuYb3P2+20DLcW2EYkJUb3dzE4awp5FZaeNALnmpsGHxypsEFgT+Khnhg3jXevnwRkWt5LJYyBABWbK0eTXVDB4NqKJ7rWHbrE+pwkb+VWbloLi3NQiiDviVxUUUndzBwjrYI+pGzf3iJy1kpAJTF4Ls=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1M2SE1qTUFjc0ZicHZLdWtmRWpEbE00NndGTjM1S1gzb3Rqa0xRd2xxNTUz?=
 =?utf-8?B?YzFLSHNRZlB3NW9NZWUwZ1VuZHltOFBKU0k0aFJMTVk3SFNPQnhZT3NGUElL?=
 =?utf-8?B?ZnZzNDJCclN2anlVOWgrK2RucGFaZkZXbDVJSVlkdkFSOTdQdzM2dG1qQkhP?=
 =?utf-8?B?WFM5MVpBMFJvMGRHd2lheDZoQzN6eVJ2YmQ1SUNTbGpLMVc2RTB2VWoyemwx?=
 =?utf-8?B?N2c0SGhRMFEwaHN6N1o0UUxQQWJoZ3lkN2FtL01tN0JaeVlKWW01WEcwalFr?=
 =?utf-8?B?TkFQNmliL1MwMGRaUFlNWWRod1F6YXlFVTZ1Vkg1cUtxOEtSQkVkNEp6OGNL?=
 =?utf-8?B?S0dCTGNtVndyUlNiZzFjNnpQUllMUmRtYkhzam9XVGxPaHlmQW5pbk81K2JV?=
 =?utf-8?B?U2JiSjFobnRQSVZWbkZGcm9WVktUN0Zkc2dDRXdKQWpHcVRNNXVIajFmb3JJ?=
 =?utf-8?B?R2xiLzRmV3p4aElpSXVlQk5tc2FxRXdpNm9WQnd3U2xDZkdUVXlZNFR5ZkN5?=
 =?utf-8?B?bWZObzU1cnBHUjJzSHRKOEpLNXd2SXl2QlJBT0NwMTFQQ0lYb1lvSWNrOGlD?=
 =?utf-8?B?R3lzVVE3YUoyK2d3Z2t5QnpsYUhCZ3NGUkpndTVDR1YwaU8wVEVMZGNQMzlT?=
 =?utf-8?B?ZnBKdXJEdmd5VG56eVkyQXNmeHVXZHRZdVd5OW9najE5V1BZcTFFWm8yWHFC?=
 =?utf-8?B?YnJtZWUzNmRrMUQ4LzNGZHk0QTh1U2JReTBUa2Qxdnk1eEEwZ2E3TFdMS01N?=
 =?utf-8?B?R1Q1QnlqQU5FWWE4cTc4aDV5dDlESW5aZnhSMEhPNzNTMVVpTVpGYWM3Yi9x?=
 =?utf-8?B?UFUrLzFZMGlCdFhZbzZiSmZzSzhzd2VqbGM4dTYzMXZJcGh6YWxrOHViNFFn?=
 =?utf-8?B?MXRnSGlvZGhVWFhUQlI0Z2pqMHgwc0RIcGZSWXR5UFNqRVlzdGN5YzVsTGl2?=
 =?utf-8?B?aUI2K2xkMFJ5TThIQUI1eFNBNHVyaE1kY1E5ajNJQnRtUUFzSzJ5Nk9xRlND?=
 =?utf-8?B?RmlnZEFSVUtkU3RpbldsY0twNlpYZUdBRDBLTEdOMWVVendjSWRTczE3dThn?=
 =?utf-8?B?UDRnTWlqYmRkYzVkdnNKVmNzQXF4VXdDeEluTTJDS2ZJRTdIN3FhdFI3RkVa?=
 =?utf-8?B?QXQ5T3F2SzkxZDVEekFzNElFb3MrWGxZaHdQWWFpb2JkRXJKb3ZFd3ZjNnRX?=
 =?utf-8?B?cmpsOEtKYm9IQXh4SU9KVWdqNnE3dSs1eHNNQjZFUlR1VGRNZk9sdXYyR1pU?=
 =?utf-8?B?M1ZkdTc2blBJaVMwZDdnNTd6Y2pybkRub1dRZkx3cG0yd1Q1K09RK0duYTB1?=
 =?utf-8?B?KzVmQ2Z0YzRYcG9IVmZ4anRtQURTOTFDVnFpQ1VSekhaaUJERVhxVmc5VThj?=
 =?utf-8?B?UXlnMTNWQnBKNFNBY1FZUVlqNUx5YkFxOCtlWi9FYlI2OVdDWUJDdWVXd2Vm?=
 =?utf-8?B?a0I0TjNWUmVhSDBqWE9hcEF4dVZLUWtFSytPcVliMHJHUWZ0VU5FT0dZcitR?=
 =?utf-8?B?Tll1cTlmUXdZUmwvT3lBOXMrVWUrL2FLbGkvU2FGeE9mdkFJQUIyL0NGZTd1?=
 =?utf-8?B?bjZ3TXZvODhRS0ozbGJNRlIrU29STlliR1lvZUpwUzh1Y1BrVy9PMllQdzll?=
 =?utf-8?B?QmR5cmtjVEZYbHQ0RWhqU2xWdW5hYlBHcGVwRnJCQmxCeHRuQUs5dm4vSTlx?=
 =?utf-8?B?a0kzM0U4NVZuRVB4VUhIWGRNMlF5NUk0bkh3VFkzTkF5THdvVmJJVTltaHpn?=
 =?utf-8?B?T21jWXhCSEVkVHpnd1BIWWwxOS9xT2RVZnozUkpteUxOSTg0RzZNWHk5dXZ2?=
 =?utf-8?B?YTBZS1lPdjJTN1pXNEZUK3hGVDdXanUvVEtuWkozcFJzeTlCREV0dFNnd24z?=
 =?utf-8?B?TkxrcG5yRDd0SW80bkFuME5XbDlidXlvLzg0a3FzWlFHR3p2TnNSSXBBM1JS?=
 =?utf-8?B?ZVdkYXlmLzlQdmM0U2dwbEFYbUk0SG5lQ09CV2k2Tzd6a3gwQWFOa1JTNTEr?=
 =?utf-8?B?N0pROHNSMjlYUTdjUzJJN0pOVVpWOFpEMVF2bGpQYU1VUWx1eW43U2tpUUxp?=
 =?utf-8?B?R0Q4bGQ3d2tZNUxVVVFYeFAwaGlBenluMS9UZUs5VndiZVpzUzhsc1NDQ2ov?=
 =?utf-8?B?N2dyWml6L1EwOGl5MnJyUkNqUGphVHNoaDJZMy9ibVUvaWFoSmFPMk9EcUhi?=
 =?utf-8?B?UnUzWld4dE1IbFNLbmFlRExsZWt1OEtOL1ZqV1pmWXYwWTRPWmJ6eGRRRWVJ?=
 =?utf-8?B?YlFMLzV4cVFQK0I5V3FiMkNRbW5JcVQwWUlyZFpXdS9MZ3NGOENPUURHNzNM?=
 =?utf-8?B?V2N3RlgxdXFUNk5BODFGS1VTdE5IeVoxTGNMSG1LeG9nZFVhWFpSK2RxeURO?=
 =?utf-8?Q?fZsOh+JBu6DdSbt5jz1BNL/RNJ4KY5da6oLSG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aceb45c3-d9f5-40a3-c83a-08df308338f4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 21:27:06.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yif0TqD/5j+rumpxTJt32u1XuoVmOyjoOiDLo17KgPvOUx7cLc72hxgDr79z9bbFAv57zfkOHOdlsjJOOvYOx2qW0Nr1W2YmK4F1tt0hieRWikwz8MxC4LFFniGYY4t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_142712_848517_55FE640A 
X-CRM114-Status: UNSURE (   9.02  )
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Tue, 06 Oct 2026 11:31:31 +0530, Hemanth Selam wrote:
> Fix a typo in a comment, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only a comment is touched,
> there is no code change.

Applied to imx/soc-intend, will see in linux-next after v7.4-rc1,
thanks!

[1/1] ARM: imx: fix typo "interupt" in comment
      commit: a395543ce79ad254d2e3ea9012eb659e7031a2c7

Best regards,
--
Frank Li <Frank.Li@nxp.com>

