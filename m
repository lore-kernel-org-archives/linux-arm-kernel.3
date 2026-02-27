Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF8BFEFB5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upaeCo1lSw/KGzVgygw/U91HhesB2rMbvJy/dCxyubY=; b=y5IalLin7PNzMHVYqtBpQdiBee
	LTiENGVtg1jsikm+ED0a2mO4bReiZYjLQvHU6ABwuQX94UTwn895PsTOp3Gkdd5xircX2E3BWe3Rd
	F3tQPx9R+6kdeYJ/W/H+GnxdB90rwhMg7WPYxbITGyzoShdRx+vWEBRm27NRHEej6sZP6nn3Xmo3o
	B+GSy1zDFxjryjQsKYrfjKDUtpJMLp8PtyadZEznNz6t+DQCc8kum6mQyA/f9bWNFCxqhHP0fOcZk
	l+Yu57meM2tXIdMKOsly9Y2gZ5AXhCiZYWYJ3C5FKxy/UEKZpUSyxpBDudiF4R2Gd3fVqcpJsl4Yv
	OoNnYTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzph-00000008dho-2NNx;
	Fri, 27 Feb 2026 15:32:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzpf-00000008dhY-2qlF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=upaeCo1lSw/KGzVgygw/U91HhesB2rMbvJy/dCxyubY=; b=N6k4FC+4I4g4uI4mNaCKK8Yzou
	Tbi/Rh8GZcZf+GGKe7OOvBxjkzV0Ws4IYvgZrFARgrh2bisR0GhtF4EMU2LAlYBRcuTl7n9GStjnJ
	8gLqtEGr98CfiktCxxsdS0TTTC0KLEhrBPKARTIObDj+HxjGVIF7JXzDa2LCtFH/0C9xIRO3kmXsd
	m1Wb/NtIJSwMJ929RZ4DnSyaz5lY4c5KkFv53Ys0p9BcgN4WNOTtvlVncd8rmyQYm0wB4/ufXeNEj
	jr9AlFuYMxp1q5yU8sZaYpub6QbryXppjNaZItQsNMXl7WU1ud5jChWC1iKRtOfgMblkA33uQv42C
	IAliH0Rw==;
Received: from mail-swedencentralazon11013005.outbound.protection.outlook.com ([52.101.83.5] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzpa-0000000DNdd-397x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR6hPwJvNdsLGLQeQ+4w4KW4YqOggWuo1cOz+6YwdgjQ+AmKk1o1wlUBou+2dzuWJ81TbhuxfgeTkwkRbWQp4vQzeCLhcW9cl+UtxQ0NoGX2wVZanucg5uXvMcC5kXvxdxT/mFThzmrEAbvmoqVzluJKDWDL4dfmPEZYZHYaZqv0PaidQsBdNF3WFf+eNFNeOUdxc6Mi+G9Ovn37iLClom4jWZFzAiSBpTPP8CpoanHNE1Pgl1vpYEmsBqMZCZ1w0p/bql6PD7yx77aJQFtEcCrMrIRpt/ezamJX5zXkUi6S7Ce7RI+gir4ct4nDMNnqUiBI3X0/a1SliH07R/B6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upaeCo1lSw/KGzVgygw/U91HhesB2rMbvJy/dCxyubY=;
 b=wgsuSSz2R27QS7BkGOxRZpJsoiX2WQrAO0bHhpduVlBfIHfeSXVlYUEIQJhSlXRwFWAF2O+9qkmyACsv/qs1S4M9+NhXOoLRX/J4tUiJoLD9eY+DOZt3NTTmdWGjjPD58+xL5JPN7MPBymui8iZ3UI+Fc5rKljh/CeXKvV8j7fIt3XLqB5bZ5WufpFJd244afP92F25G8yYEsi6+PjVKSnuvmcsJtq08NkffUIssXze2LOu1IsYHoaOy0gu2XpvOxMr9VhOMVNdVPnlnXHtCnkHEG9HbMT2xDcY4MOij33+itRSAIjodfMF2zcZrPrhhYJMGUhTvEq9NhUV8KMn7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upaeCo1lSw/KGzVgygw/U91HhesB2rMbvJy/dCxyubY=;
 b=jS86pNldN+s6FnGlSMA6ukVuGHIqE115aCQq3YXtcpc7kSEicPn8D/GqwJP7kIu3irFPItG6mO5W5o4lWufAXXixjEjlpF1Wcre8hUVUgrrY7VPO75Gr6i9Syb23fm+/VEer4JH7qgKEeC2EkHz3gcm7b9n/Rn1udm1ctCu+k8ZxXq7JMvhFDGlaeQb3FkRkgj9QTQSgkd7Vo1YVKheKGZLKGHhoIXxvKd3NcV1neOa6C8e9JiZ87Glc8pWHll7tFklDwSjrBao1S4d7R1PjT+8MtVTq2KYzNY0anuxXSx6htGYLp8w/YT+s+QczJMC4AEcKMcaG3oek2U2BCXjn3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DB8PR04MB6923.eurprd04.prod.outlook.com (2603:10a6:10:114::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 15:32:38 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:32:38 +0000
Date: Fri, 27 Feb 2026 10:32:30 -0500
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v2 3/6] pinctrl: add optional .release_mux() callback
Message-ID: <aaG5DpyET-vri-Vj@lizhi-Precision-Tower-5810>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-3-1436a25fa454@nxp.com>
 <CAD++jLkhH566rqkkQfWnOiAokxB8mLXw=eqrVN_pgs+dd8TkxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkhH566rqkkQfWnOiAokxB8mLXw=eqrVN_pgs+dd8TkxQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DB8PR04MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 88181ba0-0bae-4bc0-ad40-08de76157068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: c7uaySS86uB2f5JhjmspK+dD+G5rgZDq/iMJQH7MFlCHNTjucpF/CjvE1SlbKi9FhKkUkUfMPxmrY8qpLpES+3Oq8hqpcFibAV56ZeZzvLYrLwJ81YNkA06uuN1FYf5Nm+bfBFVF7UeIjRpl6O1TA9W4tqXFHJdK50uDQQ5yhxcUBIbTXKOYG6cDm1NerTaBNGyqNq18dYtXYuK9j8VOBrt/h5PhWGmeVAnr99ogpmL163P843osaC5Nv2nsHkQnHS6vvYJD5JQZo+8+DH0yi2Ly8V/S3K9hxYXLJKjZXoCpKCdJBZt5CiMn33N+Wj2DG+7cTxgA/X0jWqCjDf6Fcr1QrKfovkp+sQ1Bg/eNtCdKo7zWMtjL5NjA9G/9UOwOmv306OLwWuQTeO+yppgDeq/4R0AKlAmVwVCVHKjkfQK+wHXCYeX2fkoL+D3ARfdAvE6hpP/urv7pSkYYcG7gsfeIgs89aI9+ZZfwiRirHeOqG1KVTZ9SNN7u8YSpv9A67jjA79CcV66AexnBQGHzazBSXJ5fGHaNQVsmHd6KPtXpY6dv/GGZCgZBfsOWlOhSbUQTXm7hWYACe/sIEjgKMm5RQZEOuobn0fo1IM3qbTeS9ZtNIgycB972zYC6Q50P1SfypzePRzVbCUQjVmPyHvnMh7TNSXgK4Arig2qQkoM2CnaITCOVoPH977uOTRl88C9gik0q4wGrW39A6WudcO3WOqBq1hdECrm7ssywwjydvJFqyllPA1jHvzvvs4Hu1Qio8fu86E40QVa4XU1er/0FDONeFvqf+BtgqyP3Ex4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVl1TWUzY3ZPWmpqYnBHRm1rTmh1QnJlRTI2S0xvQkNJRm8xZEYrbjF2WDVn?=
 =?utf-8?B?bE5SVFlqZmN6ZGlmR252dk54ZXZrdFVsd245b2xCTlBSVmVBZnQzN0NGekNX?=
 =?utf-8?B?bEhNUUlVdnJQL0VybXdoTm5YeHQ1MlFrNlFZMTkzcEFJYkdwY25ESlZobVlr?=
 =?utf-8?B?aXV6bVV4SXJaS2pIM0JvNFU2dUluRXFPanF4NGtnVjVwM0svc3pPRWFHUEJD?=
 =?utf-8?B?bGxGangrcm5KajVCSUgwMThNS0xhN3NROHc3bXhMcnRxZFVJOXU1NEwwbzVP?=
 =?utf-8?B?VDFoM2ZsSlVXVm9sN3ZoeFp0b2FRelo2VEt0aVFUckdFbkFRbkhVbmZhSTVj?=
 =?utf-8?B?VHNTQ2hVa2VmWXB3Si9vNXVyWUN1WDhGbW5TWk1LMG1sVERnUUREYndkWWVC?=
 =?utf-8?B?RUtiWXFEQ0RpSXBiN0Vpd09GV2ZRbjJPbThzU2RmSk1SSnlWdmFmRS83eHQ3?=
 =?utf-8?B?aTYrL1VSZ0dkNWl2NGk3SVd1L05UVWhVaVhzVUVSYThjM2svdSs4clkzakp2?=
 =?utf-8?B?Y0RQZDhWbWJ6STlHTVgxWnh4STByQ2ZhN2syZ253emlCeXFFZkV2OWJpWCtP?=
 =?utf-8?B?WTNxUUNMM3BpNzJyTGhNQ29Qa2Y5dXZHNXZkZFcvNWtObS90RW5xdVlCaGpS?=
 =?utf-8?B?NGgvME05bGR3bEJ6dEVTVytobUpDK3hnSCs5bFE3U3Z0b2IwM1Q4NFk0WEpJ?=
 =?utf-8?B?RlJmOVkzcGxyY1lXbkJSTDlJcFZPbTR5eFhTNVJadmYwTjY0ZTNQOUkzSGJj?=
 =?utf-8?B?Q2kvUXZaUmlDalFZWEpwWDZ4Nm9zTVVURUlQUkRTVlVVc2E5R2doeHk2dmNt?=
 =?utf-8?B?MFBkeGN3bXNGbXhhVGx3eE8wYWFBS0NPOUlEUldRL0lxaGpOb29abUdocHUy?=
 =?utf-8?B?YmpkSWxuMkMzNlB6eElqTGIvOUNFNjlud1djVGkrNzFQSXRGdDFkcThEMk1p?=
 =?utf-8?B?dlVsSE05REY3Yk82K0tPQ3Z2dFNaek9zVzYrUHE2Myt1MGdzb01HRHljUGQ5?=
 =?utf-8?B?NGlJa3hOajI1L3VYMUNYSFMzWnVUK1hyL3RTNk14S0VGMGlubEJ6ZkxCS2dT?=
 =?utf-8?B?OWhlcnhIYXJBN1hoODh6eUJhK3lpQzZabjJnc1gyR01TdWMyWXdtRDA5K2hs?=
 =?utf-8?B?TVZ3SFdJOXpOVHlKQW1Fci9oQlpYYnJKWHp4MGthcXhNTXhrRmI1NEo5ZXQ2?=
 =?utf-8?B?VVJJR3RWZlJ1TWxJTDBsRHM5UDRCdTBNWHU2S0VNMzV5eEVrMGpmZGhZUVE2?=
 =?utf-8?B?NWZMYldhMU9yMDE2UENFYkJhdWwrVnUrZGphc0g2UHlFWGlUdjF0YnNIZzV3?=
 =?utf-8?B?RG50UG9hak1rNGVpY1l5VDBsUDUyTXBPemtkcWpxMzJUVzMzeDdqaVdFcjVI?=
 =?utf-8?B?VDJ6dXd0TkRKemdqWnZ0TXhZVFE1UVhyN0IxNGlxYWtDYU05djhzMTVKRVc2?=
 =?utf-8?B?UmYyRjJLQTVKQTV1NmUzVFlzR2pKOTJ6TE1TdWFuMlpmOHlSYjRnYkV6Qk1I?=
 =?utf-8?B?OXBLTTNZVjBYd1pRVmxiKzZBRE16ZExqTmxDQ2Q5UWlUbUpyNkp5U1Q2cWdz?=
 =?utf-8?B?dUd6azR5akt6QzlmaUQxYkpxQzU2NHppcTlzb050Nk9wYVJIT3dYQzE5dEV4?=
 =?utf-8?B?QW13emdvQ0dxeGJsbGg5N3BsclkwQ0hYQjAybTRRdk9iY0k0bzIrZGxKbXdM?=
 =?utf-8?B?bHlyT1NpTnEvSGVSeWFDeVlTMFpBaHRLZFJZaTlpM3NDWTNIZVd3ZzNmUFVN?=
 =?utf-8?B?a3J3cko3YWUxRGVNUDJRUnh1R1pyT0VncUpUN0o2RFh5VVRXbFgyTFpKeXYr?=
 =?utf-8?B?N01kRGtjZFR1c2w3YXNKMUN0ZkpRQTd3UXFrcy94cHBHY3c2aXJaOWFrVTFS?=
 =?utf-8?B?V2JTdlVWUFduTk8zdEwzNFkxeldISllsTHBkRXpJTFozZVhOUm5DcS9DRUlO?=
 =?utf-8?B?dTZTMGMwT2tHcG13NW4zQVRYTVhpaGhDSmZLVjRoY2UwVVFIaWxwTzB3UThY?=
 =?utf-8?B?d25xUVNhMUIweVpmaXpyVkt2ZFNFNEUra3AyalJoaWVKeWJZZ24yNjNHYWF3?=
 =?utf-8?B?SWZsbmd3d0dJS1pxWkRObUk2cU5ZUElBanNqakx5RzBGVzBSeEhtcllRR1NV?=
 =?utf-8?B?ZXRBdUZVamc1eHZXS2xjbHJJc091M1lBSjFZblRML0dlM2NqQldBeVlFL2Ji?=
 =?utf-8?B?MXZINUpTWFlCYWFaT1pER3psZmNtSy9rc1c2ZGZVd2ZQYU9tZDFsc2xwankv?=
 =?utf-8?B?RWJLYnhaYWhhSzgyK1gxaWZmaXJFUDJEMjR6OTdSdk1CT2RjVXJjOG1RWENv?=
 =?utf-8?Q?VYn5oB7gaeA5gpzIM+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88181ba0-0bae-4bc0-ad40-08de76157068
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:32:38.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pug0qQYJR/dA3LLCqyYS6eCOsva4FojYoeqoCliQrKqIPzTDrHANZ+qvjbemqz2aBiAcp/b9i+nku0sBr1Hz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6923
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_153244_180082_63FC452D 
X-CRM114-Status: GOOD (  20.08  )
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

On Fri, Feb 27, 2026 at 10:07:05AM +0100, Linus Walleij wrote:
> On Thu, Feb 26, 2026 at 12:55 AM Frank Li <Frank.Li@nxp.com> wrote:
>
> > Add an optional .release_mux() callback to the pinmux_ops.
> >
> > Some devices require releasing resources that were previously acquired in
> > .set_mux(). Providing a dedicated .release_mux() callback allows drivers to
> > properly clean up hardware state or associated resources when a mux
> > function is no longer active.
> >
> > The callback is optional and does not affect existing drivers.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Can you explain why you need this custom code for this?
>
> Nominally pin control defines and puts the hardware into a
> number of states such as:
> "default"
> "idle"
> "sleep"
> "init"
>
> Usually (at least for silicon) what .release_mux() would to
> is semantically equivalent to a transition into the "init" or
> "sleep" state. And if these are not descriptive enough you can
> even define a "released" state.
>
> Is it not possible to reach the set-up of the hardware that you
> are desiring by just defining such a relaxed state?

I am not familiar with pinctrl code. I just need a place to call a callback
which do opposite work at .set_mux() function.

I see pair function pinmux_enable_setting() call .set_mux() and
 pinmux_disable_setting() just missing do oppsite work of .set_mux();

I may think too simple. I just do insmod/rmmod test. Any suggestion where
is good place to put it?

Does it call pair pinmux_enable(disable)_setting when switch state?

Frank

>
> Yours,
> Linus Walleij

