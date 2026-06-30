Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBCCC43638
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/4r70jIYKEfklbvmlRzzK+2YQZ4WCvj6gCAe2mrN1c=; b=lNwd81Aoe+G656gncAMBIhWqE7
	t2TOabJ3S3bBLZMbFQzeNO2DVrKxiwMJKBgPg7zlv7jybAIuvTZ63s5JSQUOccHnOHwZbw5dTEGFc
	kiLenzo1tfBY3fUOMVk5wvafZB2ClFhWwj7J3onKJ4Wz9mQF6+TerjvLn2lt/wUdd4NileB6n3O8e
	0cbJdMuCaqnATiHyfXpoxYejJt5Cel031h3edDMrzpBUsK006RjT2R85tpaVTeTPqJjvfqu96T9Br
	a5nWfPbJKm//Y9vsL8h+6bgCA9p3Jt86TU3bBtR6sdfEumPV4XiTmrpyDVw/3TOxATUx93OEvjCos
	CpIkP+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDc-0000000GB9H-2T3F;
	Tue, 30 Jun 2026 07:49:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDH-0000000GAVB-3iu2;
	Tue, 30 Jun 2026 07:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=a/4r70jIYKEfklbvmlRzzK+2YQZ4WCvj6gCAe2mrN1c=; b=GYOlfGkFHwjMSUBk6hgvRCP0ZU
	WDgfmH2Uu3+bDRqP3eE/YJPLS7cCW7zOlNUYMdiCHKeeUvYqPVs2zxh9HJjbGuUmxE0N8JUVdc90x
	Y1XWKl1eNqg/bz4Y8yhoahwSRkx9A9jDRi1Z5ikywbdRHbN1Dp2CD1qS2gGcUSYjpIOpACj0Jnum6
	UAlJZ0YgGWgz/4n38O6wuGNY8133n4IKIEBRa0cEvyd0oh1TLJUJD2xtkyidqHLHO7cmRM3QVOT6b
	/JGXCd54wYVkcL0Ql6Tr86RWIBmJui94qUORFAdNiFPnotut1ZiQwWjwJmuCaqzigbiqv4oi0d4YS
	OXQXkyjg==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDE-00000004XZ0-3ae6;
	Tue, 30 Jun 2026 07:48:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KC9JALnXMw/c9zEcQcBO3pZuiviX88TLzQiseWQY9fDcK/VsMD6ASEKP0LwuKP4L1j+gwGRGMQ9O8HCZiXqbECAxR0RAJdEPFYb925ghNY24V9+WjDmejO1OBXWxzOKZlgwaUSyszTQ52y5Zo5M74+zTvQVHg8WElPvevTwvylhpYujdO1gjph4yDZO7WUsIqrMM9UjUPj3tu0jrXQxGWFN4bht+y3uj1vMedgd1h6F+2M96WkKi/dPOLJe/XByJ2xuUhOqMez9eFFCbz0QumgljR1AgHUcev9lDBoo7Je0NuTJg8VaKCnrshiql05PpOFeiG2QYdXSCei4UkIQnaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/4r70jIYKEfklbvmlRzzK+2YQZ4WCvj6gCAe2mrN1c=;
 b=lZjUAxb0/HkHbQ0kYmjXUI3Fk3fHixiXxTi8/PBzDaVckzsoRmyqZ8Yt8MEG7wPxv4V8rHUcx+sEpJjuUYn9++NFokapht5R1I5qW7p72JN8XTFEeXs1DSkG23lyLobjys6i5OIkK6bFIr4nOLRocm0UEtN3LrVugzcw7s4psUFifS+xS3q1nvOWdcAoIIP+n1QOziBLJe7W7z9gmAo5SDz9Wxgj9Zfm40PQg+/hnWTIo9wgHrJNG9Yls6qoHW4Ca2Xpxcl3m9KeHo+4UyddUmBrficAsuxuSslDgZW+SOr4cwsv3fKtvmi++o6zKBmWW1M76y+cnF/NSSf9U615iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/4r70jIYKEfklbvmlRzzK+2YQZ4WCvj6gCAe2mrN1c=;
 b=Q2kPxaLRieQLz6H0wcISoS4GA3/LD4x5QKp1qP6jm/FshlOd4qM0kstXFMWz/K4+f8TeQmz3rG5exzTlMcUj2Ms1UvSzOQsrmdhi3SRnDEybo0emf+lzKte/fY4hT19HaNrzheOq7z+QUsrmEYvk7Z4G3poTpj0EHZBEvHyHU2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by GV1PR08MB10535.eurprd08.prod.outlook.com
 (2603:10a6:150:161::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:48:40 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 07:48:40 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Tue, 30 Jun 2026 09:48:26 +0200
Subject: [PATCH v3 3/3] phy: rockchip: phy-rockchip-inno-csidphy: add clock
 lane phase tuning
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-feature-mipi-csi-dphy-4k60-v3-3-176792ab71fa@wolfvision.net>
References: <20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net>
In-Reply-To: <20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805715; l=3042;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=Tqd4m+h+mXUR7yNiqt+EmEzjdd0dUJ2ulLBb5QSWcpQ=;
 b=dKcHfNMpgcvGUbPOVobXJPpm1L8e0D0/WfTFt7nqMVDriqtGXKAldbQz+FIiHk2A4geU3qyPm
 r/Dmd9WvcFEAmF/q4la12HKY2tsVr6WXg4z9cXz01F7nTj/QBOCxGx7
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::20) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|GV1PR08MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c67ccf-f473-429e-e486-08ded67c0039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|7416014|3023799007|22082099003|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ZEDqU0mqrVpU1V4U44Z6O0dtCGEWiEh5wKBk05Fb10I5RM/W+BmDq12Bayb9ZLPwNQTUhDMUeVgFm8SlIkU/SlpCTfBM4XADfW1A+0uv7NAmNhhpCzuSUJYSB1PYcQkhx1Vtc6/68x0IFfwxgduxUzxTkYdDXxm1l4tZP1+0aO7wcSRbFGeEmzVYg1JZAlA9uh6SX9y0YjtMGh00DiHDfoiRRu/ET/kVQS4PaE4NpDzOCJmIgrbIrczNBL4u4x1rtqgad1OCtDma2ejjPW3WHYmvBou5DJsn/ES2nBLAokQRIiMCLuTGiBbuM54j1PImYTpc1jojRPBGI29uqCuu3OFtjmcn+sJDqreSBSfy7H1hIhyJRQwGRPS8jJKo1dW9hNZR4y6cqalskiC9gplgHhaGquyJdnaio1OwtOBxrctmCSrypIN1nqR6Zn4BDtK0038GzVZyIJvm86eGetLtyyK1YTl7o81jwSInT8FbIxUvDjABEohi3oACE7+fRcu4vewveQ0kEJgnQu13W5YQL94Py1kGSR/laZzEEtcw+qeejIkmp3mZp0NPpM7WJfUjvcFu4WpVlfQjIZdF4Qt960AG9dsW5NAw6MBL5cufRgFVhnC07pc0/YLoZ+WmhmZ/bmjc9VeQX65mIEhyMVkKWHg3Ghu0L5tPqSLEEBaSyd/t5LgJcEbd16W7RZnRKm6UtsAqbS+RWD/75+YTmhnRbHOIGl5M7yN0dsKLIojuwyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(7416014)(3023799007)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXVSWFhjK3Rja2VFV2UvVDJoWFV4eVpSVGZnWnBmcURtYjVZelBBdmNIZTV1?=
 =?utf-8?B?bzc3Q1drc1JUTzhuSVNqcGY2U3VsUEZsUkdsVm51MlBQd3BYbHo0U2VVeWVv?=
 =?utf-8?B?cGdXM3FqbWJuM2htNlpuMGRYaEdhaTRCbW1NV2hkS3VDcDNaTTZwUitZNE9q?=
 =?utf-8?B?YnJ3NUZRVXpPNmxqbm1SSVBEL2NoQUVmb1dwSFhlWEtLa2JRdzlaYWliYWVk?=
 =?utf-8?B?UGpBbCtVUFlMNEpXZGMzMkRJY2l1NjJTMVZDTzlFL20zdVFmZC9mL0dqWTlG?=
 =?utf-8?B?WHhSYXYxVVY5Q3pLc2hhZmhlMzBBYUt4VGRBalVucWxzcmZITFVwaEM5bERW?=
 =?utf-8?B?eksyek1DdEw2VnhGVklhMFRoN2JFYk1yT3VGRHlVV2lVWVZ3aFBxR1RTckJr?=
 =?utf-8?B?V1RqQ2dXUHE4czVqUnZJQXBoZVlieGdhdHJkVkQ4aDZkVFpwNXhZL0hjYWNz?=
 =?utf-8?B?Si9ncHV4ckQrbVFDT1gxbUJiTGN1RTR6Mm8xWWhRMU9YY1FlY1d3RlR3K2Qx?=
 =?utf-8?B?VElJNFkxSHd5UjY5LzM5M3o5UzlLYytsSE1MN2QvbmpLODBhQUp4QURreXBo?=
 =?utf-8?B?R3NMNEY5YUorRE0wbk94emNFTUxFeTdkMDV1T1JvMDVucFBoS21EY0Z1eDBL?=
 =?utf-8?B?aVlaUjZJZUxRUCtLWjZWQS96em1jTmtIdmp5Z1JDZ3ZZYWNhL1V1bG9pSDhY?=
 =?utf-8?B?RnJhOWZYSkcyL3N1R2NCMnVRWFYrWFJsK2tLemk0VXk2MmlOTmk1WWpHSXow?=
 =?utf-8?B?SW1DS2o0NENzQkVqVU9pcTFjejNIS1BqV2JpL0FFVmFIaHZhQlRqakVleFAv?=
 =?utf-8?B?TnpRa29hYTVFNU02UTRLNE9QOUxFZU1KViszNytuQzFKNGlRKy96dmpWR0JX?=
 =?utf-8?B?NDRxcExURWRhS3dtNkcwWXU2R2pOWmxpbWFGL2VMNVIxKzNxbURyR1Y3NEgx?=
 =?utf-8?B?VU9URjIxN2FQTmJSUFBnbGp0bkNNY0p0cHU0ZHlKVS9qZmNuMEp4djh2YTgy?=
 =?utf-8?B?ZUphaXh4TDNTZEtPRVJpL1REbk1XeXpqcGtObURlTm8yelk0cEthRCtVQnlD?=
 =?utf-8?B?ZTY1MVU2RHBUb2FXSGZQbVdQeDVxNHhHVUREaitMVjBDNjU0cmRERXRPSklE?=
 =?utf-8?B?QUcyWTdXSmtydzJJUFJWbUhVMmZ5QUI2YjZ5OGVVZFY5WVhTdFRsNGY0RDlv?=
 =?utf-8?B?T0c2OVpyMXdNenJzUkpUeDVCclFiTkt4WTZwaVpHT0JNZnJMb3JjTExwNlJ3?=
 =?utf-8?B?OWl4bTk1cXl1VndLNWhoNnE5YkQwVE1HNkFjWldCSElxSXJDcHFsWE5ObndW?=
 =?utf-8?B?SXNxdTcxMFNtcUphYlZOMnFacHZyNC9DUTlIdUJDRlU0MFRFaXVCRUlUTGJR?=
 =?utf-8?B?L09RNW8wVUVUS2JIM2czaVg3R0JRNzNEMFNMVWlVc1BQaUhjTXc0Rzk1c2hx?=
 =?utf-8?B?VnNvWitMd080V0JjUWI1OC9lRVlaY2Evdjd0VitxQW5IQXQ4eWxaY2wrVkZ5?=
 =?utf-8?B?QVEvNlB2RzR0SGs2eE1LbjNHdmt4ZlBZMGUyVGhVazdmT0NNMk1zdElBdnBO?=
 =?utf-8?B?VU5hNGlFZ2crTmR5bWxUMnZ6VzRXL2F3SWZXV1dpaTRzL1VaSTBVN2xiUFBh?=
 =?utf-8?B?UWNmWXhHQjh1L1ZFU09LYk9RQldTKzMzY2dFcnlRS29JeWVqU0pHWU9lZXZw?=
 =?utf-8?B?akQvSXFGQTBFY3Q2YmxsL3NzVmFPS3JzeDZTejZGT21qZUpUN0grMEZ4QTZQ?=
 =?utf-8?B?K2RFZXQvOUM4a2lCN0ZzYTNWYW5UenJBZVRkYVJZUUlDWEtJbXdMZ3BIZ1RX?=
 =?utf-8?B?WGtLUVpNU1Y1R0d4M2Rmd0J4dnlibFY1aWVmZ0lXbGJhMGVXSktxKzVXbjZn?=
 =?utf-8?B?Zng5eXc1ME5UYVBMa3FrZ3JjMFNDUGIvU3pJQktJcWwvNitDK0txakxYQTE0?=
 =?utf-8?B?cEdWekhEc0VVejBJeEtXczl6Q0svc1pzQm9nV003ZzJ6MnZvNGVvcWZQd1hw?=
 =?utf-8?B?WEc3T1hrNTVPc3FYVDZMZGdRSDdSNFZ0TC9XRGEwWjdvWUN1aVZCZ2tuUmRk?=
 =?utf-8?B?RjdubDRsV2g3d25jL1V5M1BZVnh1Zk85ZlFodnVHR0FsUGJCY2N3TGFjUkVG?=
 =?utf-8?B?UDFwUDVLNEJpZmxlMklQYzM5SDNwazZuUEZsK3YwVldvOUdFd1JpSlVqMEZQ?=
 =?utf-8?B?VWFFY3RYQVZ0V3lXeFlzdzR0cHVlb085enVSR09xaTBHV0c0U2R1Wk95bXZp?=
 =?utf-8?B?bEZqejdZNWJlb0U2N2hTb2tWTC8zeG1sOUdLS0tra1A1QnoybzBNNVVvRnFl?=
 =?utf-8?B?WWVrZlROaEV0UXhGcC9jRFRmYUQxSmduMVFxaTVFNGhzcS9oRU92Z3pWWWZv?=
 =?utf-8?Q?ilrUF5lQAm1J66QA=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c67ccf-f473-429e-e486-08ded67c0039
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:48:40.2501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7XNEA8KynUGm+FakNsjmztZGXPqcQRSVOeItAdWSP/dfF7BdV2wW7FqGalebvTr7Usp8Rb39CDtjBpahGGvI7ZaM8N5nEIsEqK4M+VrJX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084857_072607_9C109FDE 
X-CRM114-Status: GOOD (  12.82  )
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

At high data rates like 4K60 (2500 Mbps), such as when using an
LT6911GXD bridge chip on an RK3588 board, fixed default timing parameters
can cause signal integrity issues and clock-data recovery failures.
The driver currently lacks a mechanism to adjust the clock lane sampling
phase to compensate for board-specific trace variations.

Resolve this by parsing and applying the optional 'rockchip,clk-lane-phase'
device tree property. This enables board-specific tuning of the clock
lane sampling phase in ~40 ps steps (range 0-7) to optimize link
stability. If the property is absent, the driver falls back to the
hardware default.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 5281f8dea0ad3..3a15840e86cad 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -69,6 +69,10 @@
 #define RK1808_CSIDPHY_CLK_CALIB_EN		0x168
 #define RK3568_CSIDPHY_CLK_CALIB_EN		0x168
 
+#define CSIDPHY_LANE_CLK_3_PHASE		0x38
+#define CSIDPHY_CLK_PHASE_MASK			GENMASK(6, 4)
+#define CSIDPHY_CLK_PHASE_DEFAULT		3
+
 #define RESETS_MAX				2
 
 /*
@@ -151,6 +155,7 @@ struct rockchip_inno_csidphy {
 	const struct dphy_drv_data *drv_data;
 	struct phy_configure_opts_mipi_dphy config;
 	u8 hsfreq;
+	int clk_phase;
 };
 
 static inline void write_grf_reg(struct rockchip_inno_csidphy *priv,
@@ -304,6 +309,13 @@ static int rockchip_inno_csidphy_power_on(struct phy *phy)
 		rockchip_inno_csidphy_ths_settle(priv, priv->hsfreq,
 						 CSIDPHY_LANE_THS_SETTLE(i));
 
+	if (priv->clk_phase >= 0) {
+		val = readl(priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
+		val &= ~CSIDPHY_CLK_PHASE_MASK;
+		val |= FIELD_PREP(CSIDPHY_CLK_PHASE_MASK, priv->clk_phase);
+		writel(val, priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
+	}
+
 	write_grf_reg(priv, GRF_DPHY_CSIPHY_CLKLANE_EN, 0x1);
 	write_grf_reg(priv, GRF_DPHY_CSIPHY_DATALANE_EN,
 		      GENMASK(priv->config.lanes - 1, 0));
@@ -449,6 +461,7 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct phy *phy;
+	u32 phase;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -464,6 +477,18 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	priv->clk_phase = -1;
+	if (device_property_read_u32(dev, "rockchip,clk-lane-phase",
+				     &phase) == 0) {
+		if (phase >= BIT(3)) {
+			dev_err(dev,
+				"rockchip,clk-lane-phase %u out of range [0,7]\n",
+				phase);
+			return -EINVAL;
+		}
+		priv->clk_phase = phase;
+	}
+
 	priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
 						    "rockchip,grf");
 	if (IS_ERR(priv->grf)) {

-- 
2.34.1


