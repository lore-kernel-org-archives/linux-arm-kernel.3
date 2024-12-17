Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1124DE77183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 02:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oQMDuaA1axLmSC9iIGYX/rPKxJnHKir/mtAAK893qbI=; b=A06NKKsjTzYHp99FURzdIourPy
	hzMpZ2jR6Qv9wYtrFDcdOhuksHItJpLSdl/ox88zFOmtLXjMpnEkkDWiasMH27O3kK81yO4fEsKSc
	o1ErsoNx3wEMVfwcfjIujVjphCUqqb4lyzkoInFUKSHqgUDwdeAT0YeWzVEAO0LoPdFC5QS3uz2fP
	0Ev6E5diavd6VtIlIuA2F5ANNTMxdc4t412R25tQu5Fn3xr/ICNfQvLZqspcpg0vql4FHSzcB4NKC
	qW9cqgRB4bN8RMnGiYBpOTb6OesHVt3ovFylHlMICFCyPUuF3lOTxwFbkT1bFQt+rfhUWg9y6Trom
	293T/uCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMsj-0000000BvDA-2Cjp;
	Tue, 17 Dec 2024 02:00:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMrf-0000000Bv8C-1qrk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 01:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=oQMDuaA1axLmSC9iIGYX/rPKxJnHKir/mtAAK893qbI=; b=KOtnRDimnpQtO9dpobbU5OACVn
	o9ln81C0nR7Sut4oN/6qH2rLlfPVbWb+eIdYq8dAUEvcaKxdJ7XNFSswmBVqAxTv6BLz1HFO0QHMx
	iMjbExEg1Ig+23LhBrK7yj7pJ7oOL1mD6X26aCfQCx9e8L5K+eI/di/IMAGsnSoNX95C1T7CJp5XE
	IM9OyPuhImJ4BIhm0iiG+7kKTa5t9m5rp+yvGTggZ92tezbN3R0jb6htwNYqNPXnwiklFLdVf21h1
	rwrjMxTmf0djPJezRA3/YrVeDoaJQTNDNBcJmiYwGeD2lddPq9bDvLEE/0Y+r799xDOPnBMR19vT5
	GSeOU0pw==;
Received: from mail-db8eur05on20622.outbound.protection.outlook.com ([2a01:111:f403:2614::622] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMrb-00000004yn0-3LxB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 01:59:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRsNX+W6HgEaZ3FFoI4Z4oEdRIj3H1G584XZ8S9xbUK9bDO5hBQXpbxm1WAWfk8jLKqTHBP2mYOjVPkw4kEt3AUvmj7RJqWX8nR7CGEKGRY8pGVD8wH7kI8NIMB7HAcIDFoG+qEY2EKeo2eQAGd+CRk5IBkCzkA4EH9bIF19xTyzecoBi3XKuo5OtKFy1TEi8GcYJO7EfE+cWSIqxB/9oOsTOSeMDrSsBDWFC7NespuQKc5R354qv4mYdXE5xNGQy1FOioZZPw5A6PETky7dN7L+PcJkqv0iCYwWQXGgCvwv+WoUYAkSaFSBx5cmLnoIKj5dKnOEc8zSpSHEVzs4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQMDuaA1axLmSC9iIGYX/rPKxJnHKir/mtAAK893qbI=;
 b=Z6BKbz7DZj4MtmWPHO43odpNIAam9nKc7q+YRhkJPDIe729hK0uyg/DiYerzHlX9q0fXICsuWN4APGwyA7zinv6Wjtr88vCdd3seXej+mlpDF63s1Li4v/lZhGcJkpJzmhxhm42/J6SLTPpxfc5YQDm+jiKJzxWRVM6tXX9Y08QjJvEzqOUIkDzEFLSNYl3gqnnV6h0vE1Ir1iAUvIAHn68ABJkcdKuJpyBIUZGDQO5kZGAfQ74i3oRJZPWeiu91Y/RXgAmd7z3qoWK+0Dvek0kQnAGAgDYNNLNHMMFho9JT9uR10l+Kt2jXqyRoLSj6IU9T1KJg6nVN4wSCPScX9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQMDuaA1axLmSC9iIGYX/rPKxJnHKir/mtAAK893qbI=;
 b=hflCKqFe9kwFMSTCM262o8y/O8cpBiwytdsTsXK+joc+c2QZphI9tL8ZzIhCWp7YnO7+HPMqJvY2vjY/o/XtM5grYBZO+unFbuakV2kZ8NqeNkiDJLVzKtneORmZcjEBZddrk9cBtEq5FK9aecJa6Dtl9HOFmsS5qQsY9fin9wQWXSzARPPpZjTv6dCXw90+xkdj4lCdBs7hIgxy9WWNrObzTZVocfJ+mDpEAYPWN2EQ6dMJWMabHh+o/BVWvbeIWbmJfDRULo5j96VblFcCLE0ALXWxk+AQsyYpW/vJOnjJ4W/Mmk8ByZOdSJrKVSkKa23Dlr4pIOKdMdi6T0r7Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10851.eurprd04.prod.outlook.com (2603:10a6:150:21e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 01:58:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:58:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	marex@denx.de,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2] soc: imx8m: Add remove function
Date: Tue, 17 Dec 2024 09:58:26 +0800
Message-Id: <20241217015826.1374497-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10851:EE_
X-MS-Office365-Filtering-Correlation-Id: 72961264-c6be-4524-0e6c-08dd1e3e5ed2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?90+VR6iAwACcuVuoQTHGmI/WFEAJaL72yzicwKn5NqzYVGygvchgrpVqcgGA?=
 =?us-ascii?Q?G/2LI7pdfZBBrgLHu0lcc3ipaaSNIJ5jy8eRFwEu0vApfArmNqXKs46+0jNE?=
 =?us-ascii?Q?Job+E1cNPKJw9nf/RZYPXH13WiHPGiyzJ29sQiWItKUnLYD8KNALHzUX/zrK?=
 =?us-ascii?Q?mVQEGq/M7nmBnRN4ySr6qvObN1+XL7bc42egqsWSfrWyVd2lh4VWhGzmuf27?=
 =?us-ascii?Q?bYguP5LZ8rjRiHx7Uuq+i/0gQgeJkvwUR31ucj55tAvW0+nYCepmcAUCvoxy?=
 =?us-ascii?Q?rku0QL9b4l3qBUu8ZEjwHC+JoqCtVWDu2xJrQISfpePItF6fONuBFYXUSwhK?=
 =?us-ascii?Q?zVzC9Ig2lInUnqvhc4hR0WJ332u2Q4yQrMdWg6dIrazk3Y4kVDqNhW4YZBDr?=
 =?us-ascii?Q?J57iQ+/rnGvmKkLNiyLjqRdWH0QPIDnPztdGfyO/8ah+qtSPA44EdqH8b9pJ?=
 =?us-ascii?Q?dTIggVUlmtgoEQEBU8WYph6Gaj/gkzB5fF5xPvPKp8VfBZkE4DIEQXtz4xVY?=
 =?us-ascii?Q?3UtvY9WbezdQprUOzYnB65NbRYjlo2cZTrD1C5g4sFLKLQJBMM9+TN2sLzrB?=
 =?us-ascii?Q?eHtlR82kUki52KKazZO1BexY4+PxPgWd+wrcsZ2fom2RNOBKqYoDM4CHTjsH?=
 =?us-ascii?Q?LKyjEJudOaxK/x62GgBEVcGeNl+DYZX9fsZNs1AmA3nUxrMpTXWmcObmqe1E?=
 =?us-ascii?Q?ifvH5cp2nb1Ylj66+OAXJ5zMif6DydeRT4ypM1T2xMbjJWBW3p9r2gpJf6hR?=
 =?us-ascii?Q?0YJ5DVwZfl1FVA+qi7WFGeGbCm+JUb43GQ7uQ3FkeX9LMe3kNRTAe+ySZhBA?=
 =?us-ascii?Q?dEutbofGJ+fUlmtBZ5c1w7o85dk41+Okkhn8jP3S6IejETqKMfhDIZkpGLXx?=
 =?us-ascii?Q?CNpk4HDHZ+OiEfBilB5p2yOkHr6APkcx+wE1K3KPv747WbXhb3KYMkefO567?=
 =?us-ascii?Q?HH1jXzqYF0tF3kA2A7ePeAjGW5EDJzNpxvp/ngw1AsfeVp5GujuolSL4sZgq?=
 =?us-ascii?Q?E8EWE4EBprmak9iXpuCbCPbJiJKLnJ/z01qA0mqQ/ukpzNz5bU7RHA7Kwbyd?=
 =?us-ascii?Q?U/kYnfX84e9U0x1dk/PFDiVJ704pRJ1T/EWj/OwEyQRdZ/xXmI4qps5fd9OB?=
 =?us-ascii?Q?WlXZ9d1hoHJOTJBHOQnn2/b0sLEhV3sOHfy6bL8+sNieiMnT5nx/8Flk6cyZ?=
 =?us-ascii?Q?6BATkS1kaWqsH+eC3Z6EjC17vtxvTCCIuGVrN9S9qh2azxiI9EQ2l++d8qXO?=
 =?us-ascii?Q?17ddIJGANvI7C2IgFWSMjewprY6eolqgSRnt0zJTaO4ivv+pVJdmteT/yxZp?=
 =?us-ascii?Q?bxEjtOpB4RY852k55BB9sDaQeIStjvjdBD/X0RnFxNzvar60zNnX52QC5FYH?=
 =?us-ascii?Q?3I+YKAT57ia9JPJP/TJpE94ibdAlioAgWOGGJQ9lKYP451+IQ79LNtg5S+w7?=
 =?us-ascii?Q?5xd5TjHMyCUIarqjLSO2lWsQfq7QlGEp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o9quJ1pCnkIiq95zFQDQ6av28GhFulC7AdQtExiNvCdgx48kOI0kUmxGYfUe?=
 =?us-ascii?Q?ICIT6Adjd2wsaSC9P4ZGGhL8kp/wzFNIVC6ln+9PshXRQIH+1HrmH1cXvNZd?=
 =?us-ascii?Q?IEbSGxNza9YM9QvZuzRGwiZfYpFYfJzo9kC237CvDuVPxZuXEeJgT7YTYTUN?=
 =?us-ascii?Q?X0dFpxuEJ16uFITI4JO4zKr8wPcY+ZPQgP+HEzCPxbCQhGMTES18Z0+NV0Od?=
 =?us-ascii?Q?9XXj1shw8Ug7hICgrEqdACttA5ghqMb7IF7aqiXor94qzF24QmzLIScKMEKC?=
 =?us-ascii?Q?zFuym+wFgiu9FU6sdaN8sk3C4RgVR7mRNmlzxJhEyw62m0rhbsUNhLgx+FYE?=
 =?us-ascii?Q?+SRHDSbN7yMp27V7+SxpZS9WiBYmf6nGmOnosnN7/xLishIjLwOzDkESHBDP?=
 =?us-ascii?Q?gUNxdVMjV9AanDizMjflPqymz1JNOAGsi0O8OynGsa667ak3QSf2Ah7WUb89?=
 =?us-ascii?Q?kvpmFLu/cb0JUFCUW+cdTqsis6ZhoCIVDMQf5Jmf+UDtBQdaUCn1IJr5/rc5?=
 =?us-ascii?Q?sNhuW+WOxGOYO/T08zAFpnrgjxNcvrEkP8DOyjzxycsztixP+gqTq24Cj6ux?=
 =?us-ascii?Q?kusBVTBeYgPw5DKU0c80HWahtMDOs0mOCnwiO4K3C3jLTOcG39weCpEx+rdl?=
 =?us-ascii?Q?6LbHfCv7+8xkEUB8hF3LjJiFNMUC1KafPZu4zyMWrakGjdNYXtRxgFAfJPH6?=
 =?us-ascii?Q?k5z3uYtLzQtrC6H7Ub5XBsNG9GFMHgPBz2iruybaz5SMHD30ld2yn0+L3F7j?=
 =?us-ascii?Q?7pkRe23Xl73d7lGMlujJVyzQkFZqkZMHkm2EZQEbDgGRKH0/yAIqUa9kYq4k?=
 =?us-ascii?Q?qipj1uS+8lCO3LqoNFWMec0ZckNiQxB/47auXH/W2I3oWVDGKnT3yuuHG9/y?=
 =?us-ascii?Q?OgduVq0zzUt+Rr4aW10jRYCUcN7aqH8f7rcktXMvv91u3LSL3OADDtSmG6if?=
 =?us-ascii?Q?JO5NDumTENzVP2i4omFaWEsphZDckKX/QwNCi0uSGDKpC+11abiiCb6pG2qz?=
 =?us-ascii?Q?kSbcvg4YOn7GToI8H2MRs3bTL+odScpiJV2OCuPvN6qBcpdAC5uWfQCzxL+K?=
 =?us-ascii?Q?Ih+giwen8RQ2eFV9jpngZMwC/fGLUEM8Osw5w2xn6/0yljxa6TeCwpWd+orQ?=
 =?us-ascii?Q?g6YEIuH6LkdH84dgfcctJZi+3v104s/eGdmHQded4mgbY7IuVKYYoOUNW1jS?=
 =?us-ascii?Q?wSL5QCFrMF0IG+xPm3wQWJw2II+d4fgsFaiIse0t6rl9a1t03iZ3Ke0I8FPq?=
 =?us-ascii?Q?k7eAhD41zGDIGw2zpqg3R15mTmRVsWrhF5pyNpRZMDpiggARXFnsZvFcHtMW?=
 =?us-ascii?Q?EJ/YuUincn1rcRYaLqwFhLm4agKKh8knmDXkKW5IjjRUzeI12dI8mJpMNPoy?=
 =?us-ascii?Q?jslr7fTubvlkV0xqH7cl1oe52V0wOf1jGPYm3263nHPdsMpL6kivVg9OKhkH?=
 =?us-ascii?Q?x1GKagoMbsHyYxdV8qDylmsN0m24ftH+D1EcsLih4SzJm65WClRmD+1nBD3H?=
 =?us-ascii?Q?P3fYUSjYTqVER/cIWgIq5Ge9WPKuK0Tg/Zy49hhUB32QU3dq0L3b7B4CnyRF?=
 =?us-ascii?Q?4LiBX1t7UUo/I6OpZQ1xLJlLiGagwB5h/x+9+aoE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72961264-c6be-4524-0e6c-08dd1e3e5ed2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:58:58.7013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/S2d86Vs7xtJr3ja+6o+4UKbeTXFTUnS0cVajGa16nWGRGnTH98melQp1W01SY81OvI2qOQQqQA/aXVgppxkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_015908_157111_5F5D3F9A 
X-CRM114-Status: GOOD (  17.41  )
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

From: Peng Fan <peng.fan@nxp.com>

Unregister the cpufreq device and soc device in remove path, otherwise
there will be warning when do removing test:
sysfs: cannot create duplicate filename '/devices/platform/imx-cpufreq-dt'
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc1-next-20241204
Hardware name: NXP i.MX8MPlus EVK board (DT)

Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as platform driver")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Add err check when create the cpufreq platform device

 drivers/soc/imx/soc-imx8m.c | 41 +++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 8ac7658e3d52..97c8718c2aa1 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -33,6 +33,11 @@ struct imx8_soc_data {
 	int (*soc_revision)(u32 *socrev, u64 *socuid);
 };
 
+struct imx8m_soc_priv {
+	struct soc_device *soc_dev;
+	struct platform_device *cpufreq_dev;
+};
+
 #ifdef CONFIG_HAVE_ARM_SMCCC
 static u32 imx8mq_soc_revision_from_atf(void)
 {
@@ -195,10 +200,11 @@ static __maybe_unused const struct of_device_id imx8_soc_match[] = {
 static int imx8m_soc_probe(struct platform_device *pdev)
 {
 	struct soc_device_attribute *soc_dev_attr;
+	struct platform_device *cpufreq_dev;
 	const struct imx8_soc_data *data;
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *id;
-	struct soc_device *soc_dev;
+	struct imx8m_soc_priv *priv;
 	u32 soc_rev = 0;
 	u64 soc_uid = 0;
 	int ret;
@@ -207,6 +213,10 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
 	soc_dev_attr->family = "Freescale i.MX";
 
 	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
@@ -235,21 +245,40 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	if (!soc_dev_attr->serial_number)
 		return -ENOMEM;
 
-	soc_dev = soc_device_register(soc_dev_attr);
-	if (IS_ERR(soc_dev))
-		return PTR_ERR(soc_dev);
+	priv->soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(priv->soc_dev))
+		return PTR_ERR(priv->soc_dev);
 
 	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
 		soc_dev_attr->revision);
 
-	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
-		platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
+	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT)) {
+		cpufreq_dev = platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
+		if (!IS_ERR(cpufreq_dev))
+			priv->cpufreq_dev = cpufreq_dev;
+		else
+			dev_err(dev, "Failed to create imx-cpufreq-dev device: %ld",
+				PTR_ERR(cpufreq_dev));
+	}
+
+	platform_set_drvdata(pdev, priv);
 
 	return 0;
 }
 
+static void imx8m_soc_remove(struct platform_device *pdev)
+{
+	struct imx8m_soc_priv *priv = platform_get_drvdata(pdev);
+
+	if (priv->cpufreq_dev)
+		platform_device_unregister(priv->cpufreq_dev);
+
+	soc_device_unregister(priv->soc_dev);
+}
+
 static struct platform_driver imx8m_soc_driver = {
 	.probe = imx8m_soc_probe,
+	.remove	= imx8m_soc_remove,
 	.driver = {
 		.name = "imx8m-soc",
 	},
-- 
2.37.1


