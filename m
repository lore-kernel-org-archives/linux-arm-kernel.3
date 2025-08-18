Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093DFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3nZzQZJBxRZZupTaIyBceh0v8+H4dWrvmOyyIFzkms=; b=EpIiITp4EnPYijTgRrN/wKSSHf
	CfZzPtRwnoq3GRqOMO23TLMYN2ThN68oHVoeT9Z1wa3qx50O+26N2QRixKmRaqkatvQRtv9zT2Mam
	j++NSF+kSG/W+dPmdFQN9EMfEbgORyb8ishbOwUZBbuQADvFRGhy2nyyWo43WCRkCMk4y4LTfEznj
	9WMCQVC5nulk12Ghhkq5Jsg1F5WKfFBM/f8pTcBAuColzwbbNkkKXf1WXcmpgAP8cBb7Ixm5haGRx
	Ihx/Eqzgvs+TpzV6tqkouy5w2f4O4128xRS//7mU4bVMfSqhbn1U31eFBUx8ICutUqPlqvkb7mtBL
	By+Ex68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03k-00000007V0Y-183B;
	Mon, 18 Aug 2025 13:38:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvSs-00000006xke-3wIX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 08:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T3nZzQZJBxRZZupTaIyBceh0v8+H4dWrvmOyyIFzkms=; b=ib48xDqBbKBl4Yb18R3sN1OS1s
	EF2q9qkUPMj+KY1dUyiuAQo/qlMHKkRV1PdcwSJTUSyTWEd4qt1LxIqWn+vt2n1vSfI3GpU1UERUw
	0PKem2g0zUW+sxlOrOPWmtzF5BYMcJ1eSE4JZbE2pb4AKOl4srJJDDZwGKRWZ9BlI7HBWrxnrpMM+
	tIUPq41q2/1Ghj2NY+p/5v0whuLS7X5NwZLNcFzDiIOV88r/IbNDKHdthY4TrFeybuZ6mjTT2zeh4
	xIFBvgLIMFMX1+vFa8TkC/4qXgpwokXXr8xrwWYsiKFYJi71JErtgwga2uLecP4NH7OYnAcJvC1/3
	YkO7c+xg==;
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvSp-0000000HKim-1tWh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:43:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjJvKSaHLCoeCrlBxMl8XztaZtUtqC/ko2dFKSc/33CgAprKoQtQH39GnYA3LBCw/qjDTNMwFwjiEQVzV3ZejIgDDY0VimN/4VJ3yyCRPVssSi4/k0OPdpL3V5YzPPEUwHNXVSse2FZSI180X5t9lWoTnnmvarUvdYR1VvKw4HN8/MHkF8sJEjW+EekaSBEAqomyIu2hJHjkGSRYnolJhCNNaKSMkQetmvgcDZ5xCXMbEPfEv9pfcaNwPZxvNR/DBsYMjTycDA2pgYyQYiaENZLDpubMHEYDBkhLBVSkBBRSFWPV7+3xu3u7MSa7Q1LDD4kkl19wUn8WYMNKf92oJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3nZzQZJBxRZZupTaIyBceh0v8+H4dWrvmOyyIFzkms=;
 b=kb1ybnOiP3h9IR63eErdilk0LHMAlEt6z2V/1iJ7GM2GKu9yuO4r5ZZsTQzddgKgOBwKdjB41Inexw5P4qW+xTpp4mP+00Ia84RHix3W16cVQurVw2ht99Cct/Nn5x0MDWJ1SngPBlFKF7b/0iNyZIZza9ikd621SlnxyOVtFlZDTmRbkRz3u2JHUNIcXcnbTn99gok7nWnu8mDK7B6cz7O1vwHszQV/rci3YjlKrBZyZ8tj2z12Iao7y9LXVzJeBGO+QgtBRZo8UuHPZt8Gp1ANnXqp1C1Jwb2AP1wBNfwOqFG5+RnnyiSVSjQ0oe27KC2EODJ9NrM2fOHoHZij9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=technexion.com; dmarc=pass action=none
 header.from=technexion.com; dkim=pass header.d=technexion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technexion.onmicrosoft.com; s=selector2-technexion-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3nZzQZJBxRZZupTaIyBceh0v8+H4dWrvmOyyIFzkms=;
 b=uC/GLUKSMcc16CGmbZDDAnbKNCXEhd0BUJLTTD2RUC8nBuYhMJZ+dx3kQ4xHmxG4KWD4Fm2ZNi2EllvfRTGTdt4fvYyUcte5Cu4IMATZkZy9WMsaAQ9OyjygA/wf+q+6LWCdZwBzNwfPFYuKZhP6P3UTK2XsxsQw9LzaPT4digQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=technexion.com;
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
 by SG2PR03MB6825.apcprd03.prod.outlook.com (2603:1096:4:1d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Mon, 18 Aug
 2025 08:43:12 +0000
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::5ac3:4497:4694:db94]) by KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::5ac3:4497:4694:db94%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 08:43:12 +0000
Date: Mon, 18 Aug 2025 16:43:06 +0800
From: Richard Hu <richard.hu@technexion.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Ray Chang <ray.chang@technexion.com>
Subject: Re: [PATCH v4 0/2] Add TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G
 carrier board support
Message-ID: <aKLnmjYVWLtDFfkI@vm>
References: <20250724-add-technexion-edm-g-imx8m-plus-som-v4-0-d1c88155d6f4@technexion.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-add-technexion-edm-g-imx8m-plus-som-v4-0-d1c88155d6f4@technexion.com>
X-ClientProxiedBy: TP0P295CA0006.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::6)
 To KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7454:EE_|SG2PR03MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 49067c88-172e-4456-bb80-08ddde33439e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sDI5JopH/5VJNkdeWaXQA3OoNmyNLwTr2ZQ4y3WPNE9zadyqjot8gSR+ac8p?=
 =?us-ascii?Q?yUlgkq1thdn/VBbQyYLKf617p0DGe94N1S8jdkIh6jCaxtoDOU/idR35QUCY?=
 =?us-ascii?Q?WoDFtnnSkroWMxNU34eQ7KxSIrgn5kBv4VTIDBWhU0NJH1q/CwXGwvixV0J9?=
 =?us-ascii?Q?9vdZqB/OsTZY8Y0Zr9p4EgTx0AuQt9Is9/0w0C9lzJJIm4edoebcTOrdPxLl?=
 =?us-ascii?Q?03ZHn0B6AxGqM+ThRKeQKOgguaHs5ksI8FRZRQ7Uz7ljVuuVEr4e4wp16ALo?=
 =?us-ascii?Q?OH4N9w10VoVmL9CnApEo/wNshfStUQeWXELzvGjmtN860W9DiWMorj1PyUWI?=
 =?us-ascii?Q?qJUe3pp8VUxueHaZ1YXMhhHn1luG/7RfVmH73gRNJRXggy5SvXumxQ6DU9T9?=
 =?us-ascii?Q?FeJhKXV2iUkhU6bJ6Kg8Lobm6F0PL8eQAid4vgsKmR/o5Egxrs6xgSpA3J1/?=
 =?us-ascii?Q?Krk38DHVmNdkYqXIAto43GdEoV6vsC+MQgdvudm3zhx8zvXYeZJ6yrGaAWiv?=
 =?us-ascii?Q?Yd9CJn5/cKyLp+1X9YOLZbiGSe+h1KMhHtctgmv6hsiASYynVy9yO7sIzME6?=
 =?us-ascii?Q?FLPrBxH8RrWf/qmQQmKXPGkJGQ42w5ecz0T3sjaQw8XPK+OKBoBeZLbqp2VD?=
 =?us-ascii?Q?SA1Q8Mn4yzbVN6VMXYCUrohyUmQ04QLTwqsaCSz6c+KkKCxespPEIctAlfoJ?=
 =?us-ascii?Q?48NrusFNuENDCr3fbSQuJDMANc4x8Rvr97LJxs5dv9b2lvQtLbTPfoLO3LTu?=
 =?us-ascii?Q?trqQ8vwGBsXmG3EBVGMQMppEo37Dx4LfFn8eGa0k4CJ7uS/l1dCcJrQmGmEp?=
 =?us-ascii?Q?ZS4xJpIj3BILvL16k3LJm0u86j/r5YZ62n3SjbHuvlrIDeMJ6XCqmTZFRJMX?=
 =?us-ascii?Q?twOuVXKjnGOp7+A28u1v4OvDXuSy+tS0vAzHZuKhqu5RxJjKcYBtRf/Sk9cO?=
 =?us-ascii?Q?ozQPPRAXUQ2j78vDY2BPjZcHj1JJ/j1KieouLEjj0D8Az60NX05GKR8X5qa+?=
 =?us-ascii?Q?Od8Mm+MYJISGceXnVhRHKbr0jXh0KSLXv2tMn3kinM1NyFFvQ8w7EDRfpNur?=
 =?us-ascii?Q?rj5Mx2SikQtaPggy81a7qjCJFagCvo6Q+rHWN43tnX6enhCjn4B0rMMezbD/?=
 =?us-ascii?Q?/eCplSoEXPIFvNw6tis03i/nznTaopjV8T5tK/qZWEwm/LS2RR1UWdiFjoBZ?=
 =?us-ascii?Q?39AWO83N37CkbY79xcrJIDeInFdaO8nkxpy2wVeixwBcDG5eB1WG3LeEG65Z?=
 =?us-ascii?Q?0e9SSlPvphVtvogNuxyFQA6lQvNMEf4SGk0UgK5c50v0XHey7h6Q4sDN02l0?=
 =?us-ascii?Q?yJ8eyqLhZOdSe7wXb4cLp5LQ0mPxmf1oqZhJjqzkjl3T3THlqtUxvNTVpNVn?=
 =?us-ascii?Q?/QvsOAJyYncovHLT0Y9shQEXibSDJxgWdc9Bp0ZfARF3KHRLsZZuJ27l/YvI?=
 =?us-ascii?Q?Isg/4AmhjBpV8jlGmc0FzPSkmjONE5925cUvx4XrJI9Uwlzoo9p96Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7454.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AzVjYtP4+WVDd8E62vPer5ExgYI113hcA23RnabrzYRvVU88JrGR3v6hlr3i?=
 =?us-ascii?Q?iZfpxr0AtKGNbEWpTbKXfseHOOe4LJ8lsYL7HmCcAp8C1oec/hSherf/dfu/?=
 =?us-ascii?Q?JT+d+cwjTGXM8WCGjDqfSLaa4sUcWFetRJaR6M+mcqvDf9DKfAu+OiXQ+7sB?=
 =?us-ascii?Q?DlmjCJHLNsnfcNHKwhOdtws1835fZ7YturLMi7QIks1bT6T1Uy2IakKe5IJC?=
 =?us-ascii?Q?I2TyPBs4dv7ihYoHYAznvpnUdBtPlfyUL6to1ICs+yu9pjdXmRKFXM3p6yBq?=
 =?us-ascii?Q?3ha6WYfe9p/wPhEK0Aq8FcrOCYsu7ER4jONG38YJIAfD7DKfRYVkx1yVaQdh?=
 =?us-ascii?Q?ymQtP11g3PirOzk05Ax4kFdk9FQ8PSPkw2g0yD/hNGPYNp1BO4weQs6Bd1mC?=
 =?us-ascii?Q?dGAH471NkaVlN54Rj3XogPyli6AGVu2BddJ6IVh0zpuO1v1L78IAC+2bt6z+?=
 =?us-ascii?Q?s4BFDpKQ2houdGLHyW/l0YrlQfPOWsZHWxeaT1t6RWA7VA2fVKPTlcOb2Ysu?=
 =?us-ascii?Q?6gQc6txiNRAldaw4+7Z38tuapzqfmxovCYqk8GKTok6BeQALOJHyHn3+JVkY?=
 =?us-ascii?Q?mq/AnqLvQL2xSIMZ+kpPe0bl5tvulrqI5j5QtNR1WrhfTS0a2xv3zfy+UsDZ?=
 =?us-ascii?Q?G0LvgiLaLpRZIWFMF9SpSFLJc1S3vCeuOOlwgAorB+DP2Iir+F+cuVzgq8kq?=
 =?us-ascii?Q?IuK1Ef8AzTgRoeku3TfpIGmyE+xIeqAJcou2eGWMXJwG9jEyCaoe7W8vIN2M?=
 =?us-ascii?Q?OQvBc+wg9n+VWFDnRg7FVnErwPxCM4DGS8LUYKbCo0WF9wKjsHzIXk4ErgFO?=
 =?us-ascii?Q?LljiAUT/3YdPXtp9lgyYw/fXcp1CYSRNkr7umJhFpGJnnaRhg6blJkfJ2N4F?=
 =?us-ascii?Q?djswX5dh3FJ80nAnD5fUrDBnKr4DorDVrNntvF7vxTsWxCv/FTfmQ1SQ7U+N?=
 =?us-ascii?Q?HVomHirmfUb59cGLbJzbxk6BPLIo8fAioXCxxCp5WKhm4dLL3V34fCwWtBpA?=
 =?us-ascii?Q?rBpwJvepim805JbtTDaQTI3D9w1AfTtXsEFaDKyY7+DtsTbonGoSrTUJ9EW/?=
 =?us-ascii?Q?9c0+PqApESz+TKFDOOrCUejo4OJVndpEUSgbDCdP3yqujIzImvlZQZvzvF9j?=
 =?us-ascii?Q?muY2E6oCliGSwdRGrhaiRPW50DnVnHOMQKNdyoaGxLVhVWMcLixQwpOCi44h?=
 =?us-ascii?Q?O4Y/RBFChgRhKGPP1ndVns9Nn8lkAAXLgD0OMKENAYVbIJpXru0sJkUJrwCY?=
 =?us-ascii?Q?XSda1WZU7oJVjSAkVBWqvgfDks6aSPyMFp8vr7JFyaTq0RTC46gFbfO7i/of?=
 =?us-ascii?Q?YS+Jtc1o86z0F5V7f8Ow4A9tsz/zMFGFVbCKNAL4cfgIB78MTZN94qBDb/Bp?=
 =?us-ascii?Q?zLqw/0WTijJd3avrDHyzu5+eS2klEamLn/MdwJqhk10zPQdHchjozdS6Nt0g?=
 =?us-ascii?Q?vBD0AAqWScE1jalJ95FFoCCAMycHjPeG4cxI0Hp3/QrpId4beMyZO2xa0OTP?=
 =?us-ascii?Q?nQmZJfCdebIiuOTSawtmG8OVk9FLmtrEhxdagBYPVNpqFRlaO2zlUwIU8cpe?=
 =?us-ascii?Q?y8QhO0P7n1CwZfZNmdeS6JIl/hWn/yr7EhC+J/w5J2cagyo7EsWlZWQQmavP?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: technexion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49067c88-172e-4456-bb80-08ddde33439e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7454.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 08:43:12.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5ee19679-b9a6-4497-8ed2-1eda849e753b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CREq141UDxDtUq9ZWaqI6SGR0a+MrrnFQquSzRxSgE7PlV922zPiwLxixnRULthiX9E+K3YpJbuqg+RTPh0nl3Tm6qploGv5W49Xy+NNhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_094335_595748_2A1AF813 
X-CRM114-Status: GOOD (  19.77  )
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

On Thu, Jul 24, 2025 at 10:34:04AM +0800, Richard Hu wrote:
> Add initial support for TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G
> carrier board.
> 
> Changes in v4:
> - Incorporate review feedback from Shawn and apply further cleanups to DTS
>   style and node naming.
> 
> in patch 2/2:
>        - Addressed formatting issues by adding newlines and removing
>          unnecessary backslashes.
> 
>        - Removed the lvds-backlight node for the optional display panel,
>          which will be handled by a device tree overlay.
> 
>        - Aligned several node names with DT conventions. For example:
>          - `codec@1a` -> `audio-codec@1a`
>          - `gpio-leds` -> `leds`
>          - `pcie0-refclk` -> `clock-pcie-ref`
>          - `wlreg-on` -> `regulator-wl-reg-on`
> 
> Changes in v3:
> - The changes address DT schema warnings, remove unused regulators, and
>   improve the overall structure.
> 
> in patch 2/2:
>        - Fixed DT Schema Warnings: Renamed the i2c-gpio node to i2c-0 to
>          resolve a naming convention warning reported by Rob's checker.
> 
>        - Removed Unused Regulators: Removed several unused regulator-fixed
>          nodes for LVDS, backlight, ethernet power, and the OTG VBUS, as
>          pointed out by Peng Fan.
> 
>        - Added EEPROM Nodes: Added device tree nodes for the EEPROMs
>          present on both the SOM and the baseboard.
> 
>        - Node Reorganization: Relocated the iomuxc node to the end of the
>          device tree files for better readability.
> 
> Change in V2:
> - Ensured accurate `To:` and `Cc:` addresses by utilizing
>   `b4 prep --auto-to-cc`. (Thanks to Krzysztof Kozlowski for the
>   tip on this command and helpful suggestion from Rob Herring).
> 
> in patch 1/2:
>         - Add Acked-by tag.
> 
> in patch 2/2:
>         - Generic Node Naming: Refactored device tree node names for I2C
>           GPIO expanders, the USB Type-C controller, and the PMIC to adhere
>           to generic naming conventions (e.g., `gpio@21`, `usb-typec@67`,
>           `pmic@25`).
> 
>         - Removed Unused SPI Node: Eliminated the `spidev1` node due to an
>           incorrect and non-existent compatible string (`rohm,dh2228fv`).
> 
>         - Minor formatting improvements (e.g., whitespace, indentation).
> 

Hi Shawn,

This is just a gentle ping to follow up on this patch series, in case it got buried in other emails.

Thanks, 

Richard

