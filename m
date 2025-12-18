Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30421D6D237
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6BHkF+Rrn+ag54JCru9oS14GbGeUMI86q2Vu7+sBvs=; b=DAY/D/OO/RTkqUQgubw4cyGYQv
	6xq4+kwJMoa2Yf4bVAxlzt+j0fUvNlSAp98KJIlbt6xRNGuMMRDZU15CYQI4X5yt0EtQqb8ry6b3u
	TEG6cOsfYVMKs6YcrAK79+f90TIPqD0QCrZbnClG+TYIOH1w/fDvxG/BfiUjpUI0dSGHRj2cbNvNC
	JjCPrI0nmYaZtGac4ltZLubWTW/Ooh6pUuN43otRsTTkt+4IB7c6qd8wTbuQSbuYr/5XvcIftlJxu
	ib5E/rmW7A8izb8+Lw1mAZUKZyjOg3ePH0Tts96hgKMMM3Dk2tDWOVUBJFSr+bTLiArRzTvPRrtog
	Q+J3KbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWG2K-00000008hUW-3BqZ;
	Thu, 18 Dec 2025 15:35:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWG2J-00000008hUO-2Sh4
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Dec 2025 15:35:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+6BHkF+Rrn+ag54JCru9oS14GbGeUMI86q2Vu7+sBvs=; b=FRzCkOLr1zioM3Zk/SoD8gsBiT
	HJfBFfIhAPT6ssFsL93zX+s3XS05VFKbuOB4Tbhbw3T5h6JScaZt7hHqzbUMotusDItSR2NDB19GJ
	FhIXDrRebzXD8xQ30RCgMeu+w3t1+qCb2Qj1Keu+PR7l/PRKD/sAErMWiCNzxKKSkRFYN4OWn7bMO
	mN9FxpG/0wuCG1oKs0L8uZGIAJmZWpuz92kKH9fK4kPMOgC0+DQQwLwqk75/kpWv13mgQijXw77Vt
	LXy9taF6dD/FgyY3fmM3oD58cYUSOAtwHmCu9a9vW+x65kIZb8CKX7U2qcloErCvV9DOo9PzkB4Ee
	rwe2qjGg==;
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFAn-000000094Yl-2Z1V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 14:40:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAW5+LPiWZL7SIbe0HDhNL+g0B1HOdISIA0VhZdcplAaLj6+daY4YOVw1Eu7srJmnz+pmQCc0xJk/Jfmd1gf0xUrmjufYJxqhGygjMTdLlo27DtMbipnlZDQ7U8NOyy2R7Rur+hYcMzl1Fq+13b1qKi/Ax8nJauxTQztJbQlvuW3Z/0sli9WkerdM759/ebYJ1Ev1bb/yba576aZdORek695KYk9fp2KT2ZMl97guRST3cB4bHOH+j00MorFHom6xUiLFIw0K3hBvgrYT+amlFiXeq8z4DSFiAfl05DRnNq4HrRlPm9Z9HUuaSjQPaQ3oVD4fxnCDUsrfPf9P+AKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6BHkF+Rrn+ag54JCru9oS14GbGeUMI86q2Vu7+sBvs=;
 b=XEip1vmQyaSb4MNWPCkGXackMlE3fnVM+tdkUa12DaS0CTVcsjrLnfFobHfsZRyV7fZpUnjJHfn23Vux1xHcaqwaLufpvGLkcBjI8WVTA3bRcpHHgGQSVHbLcJLsSddx9S1nIoi9T2eAZvEgylh0dMvdxaPKyJqvY1JEsSiVfpp7lLInDw+zh4VIua5y/4qQUA3sBGOPpGM/XPPTtek9+dCaFXnxrYAWCEC/6uYyA7iLOgzi99XCt/6qqwmGYoaRZHEsPMPreHIRlc1NBi2q/1w8z4LVNGy3OkzZy4UW+FfORaA+9c05rJ6NqsP/HKixyUNf7BGajv+7yriiggur0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6BHkF+Rrn+ag54JCru9oS14GbGeUMI86q2Vu7+sBvs=;
 b=MAIiPwQVRQ0srnCXwm2Ub97NoQo3NayVEdVt669VHhZpQG3RxLgF2KiiHjlQRmkbDWpD4oFdEoluiSSX7OIG6rvQ7K3mtDPPeJa+pxcnT88UrX/PHb2JjVkLf4kmXAxfY8XpfSwVZqfe9PBcFCSgsVLXSi1nm8b8yDsdZwQC179kGyye+6kiO9aDAGxGF3jM7vwaoM3+39IcA08nHlxirVERNcrhj8dmKpxcKnCSw2AaQLlL6k4UjQTiMx8bfmmkm86EotsIC77GCbznrHsimOJy19G/xRCbwZQW7ST+itSPzyXRCgA9JvcBCoD4fqY9NMjMcAqpqEkIwsvjWmhcSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 15:35:19 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:35:19 +0000
Date: Thu, 18 Dec 2025 10:35:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 3/3] media: imx-csi: use media_pad_is_streaming helper
Message-ID: <aUQfLLVHSHD2RIDT@lizhi-Precision-Tower-5810>
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
 <20251218-media-imx-cleanup-v2-3-9e3e3c269f7f@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-media-imx-cleanup-v2-3-9e3e3c269f7f@pengutronix.de>
X-ClientProxiedBy: BYAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dc5066-e607-42a6-2291-08de3e4b0cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2uc1Sm4WSaM8KC+H2RV46dbmZbp/TVQtn64sh0KFpRTzW7Fji/I/Ax/9O+2l?=
 =?us-ascii?Q?SqDtUU34e7yfy2gP/Tr7j7pyTXQ5s/7yCL81yoMHFBz5nM2bEXseQLgMYFAU?=
 =?us-ascii?Q?AjOOcMDuPEO9z5G9H7g9t1JQQI2m0MEyT2BC1gC8zIQ88WZRjBhiQ3zElmVa?=
 =?us-ascii?Q?HwC7jPIDJBsVLYNzUhk/OghRqJB9KnTM6yjF4kfRGdiKoFWRg3DtkbARTeSb?=
 =?us-ascii?Q?p+RiXjOXE/D6iVlqunh5kKg6eU9EX6GkCOZ2Kkw2/elkjcl296GH+0AOyPwv?=
 =?us-ascii?Q?c9lbJ82dLzwuGUJJKOlNtDXnvDxQtqH8Ip2awvUDM3N/p2dXsLgQ++3qK5Ys?=
 =?us-ascii?Q?WgeNx4MgCCgg7sQIcC61j1yApKlOKX1cJBBVDVPZzp6oNkcWXSBSEpJ+Iw4H?=
 =?us-ascii?Q?3hiSvT7kY6DSQO0x4iYTjljkeVrCXhKy/RCRhOFStk4rxWbPYYnHLKazKG3z?=
 =?us-ascii?Q?V5FABNDjguwa/4vI6mCkRHXndHogUgzPRY9e2/T4OzjEm9sjUeQNDK2jw3R+?=
 =?us-ascii?Q?A1HHls9Zla8tIGH86rYhetAIbeX75sxKcwRd1x3onqKDRcDlnysUtHPBSXtx?=
 =?us-ascii?Q?d4Mii2s98bsU55h1kU3Rvpyb3knHDaz0u+yFlEssv/J521hPnyQ9kb6/I+wR?=
 =?us-ascii?Q?ZDJF55bSd2MF5bFUV1d7EZSnT5JHQ1dL76QGckPtpcW8U/7NmWvflroB8BaP?=
 =?us-ascii?Q?hWF/mZN/X64q2i6qwOqgOL3quibvxeqJ+e+Jwr/17B0pYmbeD6FccD0fyvVG?=
 =?us-ascii?Q?LVgBBg3MOhrcLcWPMnv2khyrTKZ4dklkyqHzDwIGWyapKUTjIpW8gE9+WbNh?=
 =?us-ascii?Q?eLVjM+nu0qt9mYIy3EjkLPAVonYZ6VDtNGCsBuHlUfWoI63O+N9bQmCKGsOA?=
 =?us-ascii?Q?OMRLpOwzdRjIvB/bfda7zof7DK2iISnEc5sU9I1rpk6/7NSSIH89L4TQec/8?=
 =?us-ascii?Q?0pQZdBiAnXxrCyRrxnzYWfOpsaJxuZrrdyR5jKpoHCssLW5P+biPufb9EPtV?=
 =?us-ascii?Q?ErQWiWY4gakuMfGGYJ+/udAxyavN6b6XTEDt6xyHcnnKqWWi6dZOBpDpzIvP?=
 =?us-ascii?Q?cD48pgTzmq5vMBHZFWgNnrheNtQjorGi9hx0H+mgFKcNCDaGM4TW5FcRhqhd?=
 =?us-ascii?Q?nyD1+qMOZcmB1rIvsM5+WWGznChQT40bjAb5MHMbNFPsZVnRgbvoIun3eG4j?=
 =?us-ascii?Q?EOMTAESpM67uIQFMCZlH9lhooOg+Kdn/bUJ0gMYVvpY0JZQIC68Dl52cel9U?=
 =?us-ascii?Q?V4rhyMjjtKgoikIEnc7WJarogbTzifAW5vKeF/W0jM+vh7kokHY8cdlJANGa?=
 =?us-ascii?Q?3lQROjrnlV/iysQzInb9aPMNMj426ydPaD2UOzKJ9kNLdH4YfURewaaqWrGG?=
 =?us-ascii?Q?d1EeK1dYGa1gwBpPtM2AcO9KHUY9+UcGG8t9b+qWZPBaSePlZ3mAcFqPz0lj?=
 =?us-ascii?Q?ofOwAh3qoyzdE7lv51lJg2SnGWxPgnV68pd69aylC4m7kjo1hJVEDkm7tc54?=
 =?us-ascii?Q?FMjPGgTgs3dtOFekzozZDAqK3b/HG1qCuYbz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pGVDtkbaOSsv+AbqKp92htx0zX1gSaNA9eGbBD5jKmXdV74JD9+bz72oMxbP?=
 =?us-ascii?Q?uLMTiA81nl3u2vhlwTVIpenE/5NfcNte3aL25YI/LNIAMp1IHARlWNgdLGWO?=
 =?us-ascii?Q?F8t2IKMjOMn0Mn9x2Y80wZwRIePXcfTFRBDbxhJ/LgOSYiAKxtMwe0Fzl9Cl?=
 =?us-ascii?Q?RipVp/UHd49yVay69rSXS3t68/O3cUnbsVZ7hfFQGr0nBt7cRkKNKf8rqMW8?=
 =?us-ascii?Q?fKAaMbsrhdksYJXZ2oRYW2SARwR2OEfWzyPFrERwmr10PRfKQGdV59Qi09xE?=
 =?us-ascii?Q?428NLfEWQ8Aibpi3dSwJPIBe1GYGY1h4yf4SVIw/jx4RFtsz8hXeNhhgXRyF?=
 =?us-ascii?Q?/PsxqE4TMkh+Q1skkwbI3xPQfvO9gj3fdlJdaRlqCb+6JW3GePPAcuWLPz6n?=
 =?us-ascii?Q?hLNGStjezK8pegkB2bWYzDzK2Yls4OgOrzT8+z/FnBpN8NC+nRz6eKZ2BagO?=
 =?us-ascii?Q?TMsl7twXtaejfLxmvpYGiFlz2f4rM0MQJC5qT9cbAGMgwo8TkINX8oFlWW35?=
 =?us-ascii?Q?qr+8nQ6XV/fHd2PUicobYcpxgWb41rh9sBZeuXqzf7VqgfrvuAZ01YmEpI75?=
 =?us-ascii?Q?20UTijaCDH6/ZaqRCRa7UmKqJXzrf7NEdFOlLBP0Uvx7WxA5rSrxX2vMt83D?=
 =?us-ascii?Q?EgMI9l2J3acVbne/AvrGMRff6CoZPYVLhCG08sviaL8pbOHvDwnEyjwSTzRt?=
 =?us-ascii?Q?cFB3L4VMXY995iZgrpIYTyoexpm01gJIdUcQ+dDLQTNkmLXLZUJkvOANNQWf?=
 =?us-ascii?Q?eFcgYVOd2xNAFSjDjrrFvBrNnF6GhgBAmGhMkXard0hI11nzkBvfpqfn2VKn?=
 =?us-ascii?Q?qdwRj912obgDk7B1kh9nE97uLmfw8YWOYH4AlBOGMwx6SBbQCJFu1kjdtYap?=
 =?us-ascii?Q?26Ho3D+UNPnALTeBnWmm4HKkDu5/nQjfbF4F0q4YsJLWXes0tpNxHLX2ZG19?=
 =?us-ascii?Q?Ryr4ivABTSTSUDy8fVeADfCLLIh1WAKKhttctLrx629kLaSmAD4APgFCwtco?=
 =?us-ascii?Q?3UUPe/FS3PLko9T3Ml2S+/kbLCUxqpI5qkAM2vJi+LGqq2RvLDGj6g7Rzbh3?=
 =?us-ascii?Q?2ISXMK3x/3WynRdLPtLX0mqwODmqwAAPz7luksPVJ+4Ns6L+WOD4reoVVggF?=
 =?us-ascii?Q?nzVxFKj7FQmXhmglVhewVYkyMVx3K9t3hbdkGdhUJ1w4b7STbgiDSJgaNXma?=
 =?us-ascii?Q?dK6CvEN/t/vlxZQ3Y1XDSYQdY65KPF3IPNh/xaRNXPs9WuIrM9e5Kd65pEzi?=
 =?us-ascii?Q?pSiCFvVR9J2fS5A8pPko8hCp3kTR1+JY1/lwD3SUtoC6HHN1E/Wf5+LPuTF5?=
 =?us-ascii?Q?NeXz7dLHLrEogu6Yfe6czOe0ppC0yxRtdX+kxVaR7h81E9xSs3kb7x1TFM9+?=
 =?us-ascii?Q?9Nlkpd3ZMzYrfmG4no9TtZnhWnviAkHyi7U2fTYldyZ3nIWl6Pc6JcdvLupS?=
 =?us-ascii?Q?QGTdI9J9EmE9Cw+c0deiyue3ETx09kWpJkg5U/bMxS0MDNapTDDl/E6Pe1/1?=
 =?us-ascii?Q?kF78Gx2mYLDi6SKTTy7Givyqj+YWDeEkJMD8pGP/9i0Zq8ebaZYRffIXbsS8?=
 =?us-ascii?Q?CliP5bdj0axvA8L7D1FsIULkvmOsrLLeJxPMxBrp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dc5066-e607-42a6-2291-08de3e4b0cfa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:35:19.5668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqcYh+AL4Akg8Va7zqR5nabS7GQQd/RKQarjYW0w0MhI51OvgpGKLGB7mgAMihzOgJq6u2HpxWCgio2SUqzuKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_144009_811022_1A28BDD8 
X-CRM114-Status: GOOD (  18.28  )
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

On Thu, Dec 18, 2025 at 10:23:51AM +0100, Michael Tretter wrote:
> The media_pad_is_streaming() helper is explicitly intended to check
> whether a pad has been started with media_pipeline_start(). Use it
> instead of relying on the implicit assumption that a pad with a
> pipeline is streaming.
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

 ---
> Changes in v2:
> - Update commit message as suggested by Frank Li
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index bd9af147a801..1a2e5e40c99c 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -774,7 +774,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
>  			__media_pipeline_stop(pad);
>  	} else {
>  		v4l2_subdev_call(sd, video, s_stream, 0);
> -		if (media_pad_pipeline(pad))
> +		if (media_pad_is_streaming(pad))
>  			__media_pipeline_stop(pad);
>  	}
>
>
> --
> 2.47.3
>

