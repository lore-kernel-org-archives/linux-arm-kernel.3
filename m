Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34D3D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BJDoCFOpHi7PC0uRvJVMhbyyY4Hs6nO4u5vH5JzJjIU=; b=bw3j/wHiUwoBd060x9IeSDdDR6
	dOJMLhIr0f93D/5uXX9a4PtAySicJxTNys8SyYHfgAIFjzAk6m/nV1gmYv5lqYwtxy8jA6arJgil7
	0Y+YG/DBsh/ldYGRzihCjhdA0WemWB5jGUXyH7DOWTIphIz+nAFcFhshhUx3CMAhbqspPryQWVH24
	HMoKpsf++8gNKfQjyZ4MpnhE4kVGcHcIuIUInFpXTGy66e3kgPSW8AZL5H42tEGlXBorztyhXDEJz
	nN2htMEUymZSoUWX53y2v40XvZor/IJsXVeqRfdcqWDUwIkhSKgLK9EUljoeR54HbznrSWlbSG11x
	ONx+cT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Al-00000003T6T-1uqR;
	Tue, 20 Jan 2026 08:33:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Ak-00000003T6N-0MEn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 08:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=BJDoCFOpHi7PC0uRvJVMhbyyY4Hs6nO4u5vH5JzJjIU=; b=PvR3L6mpNsPp5HvkvaFSaVHe+W
	/JfqQ+Lz89tgycn/asw64fR0+MSQJaj79se+mRep9aC8+/92l6DnjmvZqv3uGwKWBAWOgqufJ7sUG
	pMcLBFJBRkN+ACdcxYsBVLur2ZdLZabnshw9DQIJxhM98nohMv1sz4sVuRm6voFH+T9hcsWkNEXmU
	h0bNkEJReObnC2khWl6nOkU3pocVKNFBp8L3l+CuoQIF62aSTMbb6ARbRh3LSm4XkLpvOAB+iOI18
	O7NwKfSK6KsHJtFf8xC7ZDFGpmHVGhnQFHlTo1IeC77f2xdXwNtZtqxfYZ/EQpXC9dENA/xgJBuMy
	7+KyV/1Q==;
Received: from mail-francecentralazon11013017.outbound.protection.outlook.com ([40.107.162.17] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Ah-0000000DbT5-0FI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 08:33:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8fWYQ8gpI2UAfxwr6ABLlU/6EFo9W32V5cMs+TxovtWgS/s/ETaQnY+tEyPLW/J9EDxE0kpi5wz3M/l8unA6iSUVJBR7RJy0m19kecyOXK+KuLgJdHrU99NgnmEwAko6slfZrnplbJbVq+wVXguAYoAcuItDdfeoDKO/xrT4gsYaSCodySc4vHVqp7dIkCkIiWBr60TS+lFJpHASoga3yStOZuJVN9Z9Xh+tfVer25D6qrItjUvbLBAq2fQkCHpupn4sfmjsAq9VzQPicX5PMsEx2bOKg0B9gXB+6ch9uQy5FCtSTmJmbnNzcLdP6D2RWGT6AEtmXHZdd7SkEcdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJDoCFOpHi7PC0uRvJVMhbyyY4Hs6nO4u5vH5JzJjIU=;
 b=lI6YOpBzqLnwKT0IWjxMN7sOODqRXfp+N2gwOk/j/7qaVuvTCVuPtzRLBvZ7C6OWPqA+02g5c0Tu+iXNWkKa5vN9A6U6XvdXAFMD4wyiTk1n1kicb9WClih2G1mMsGd29EEhFmSnIuhhZDH4cx0fvrYrPtDBDq41d9zwCFgixiJY7PAeJ+THbghGYrJimriF58of6Bgu0PjliWoSe0fGh4ieWHrA3K8Fh6y1xKq6G8jk0hERYaRbCjNQGEOxulLzcjLfBW4BkNw+SavEBC2Dd0rsAR6vpeNOeRKJTl9dWemQ7PuQNbM1Iu5K3kGqhZNZ0v24fU2YQWyuZChb0bSH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJDoCFOpHi7PC0uRvJVMhbyyY4Hs6nO4u5vH5JzJjIU=;
 b=PaqejHo99aPxZiNL9C9KsJ+1raRjuuPpCXvGVA83otsoTFR3VW30u7UK5N6BsdaH/+IqTCNkB9blxlxkROUqmxpmkT3OA36WdOBfNn0bnB0JYgf9QmIlB7a7M4psg5LW0WQPeHCIzIdJuIiIdCiutvsU4uYWUcJCj7vBmCCxvuNQi4CkyZjn46ZA1lY6Ib+9J70c2tIkPEJc+Yclr8zeq+9TObOeWBrzZs79VwOh6aizY+PCH7biMIaG1BzG5E4saimVSMcJdQebbKhB78tgVlNgX/sJDumO/WZxBpf1rV2ei6b4nnNovi6qPy9YC9ffoQHaaJ0pGcxcCYU6SrC9SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAXPR04MB8797.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 20 Jan
 2026 08:33:01 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:33:01 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx93-evk/qsb: add m2-pcm-level-shifter-hog to enable BT HFP
Date: Tue, 20 Jan 2026 16:32:33 +0800
Message-Id: <20260120083233.1899272-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PAXPR04MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea95c66-082a-4235-bf9f-08de57fe85d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5vzHXc2vOBjFTss/2xppvgWH7cEykel0VAOzk9nsOnWmmjfUGkjlQhV51q1N?=
 =?us-ascii?Q?7U0q/bnI2dSlfuZlQHErh5+Qeb07e6QlDaGjU8jyEw2P6Aczma84po2ztdpY?=
 =?us-ascii?Q?ESue0wkpB+20skSfLm+wyst5/jkNCSGSaVI5m6gm3XLq5C3nplBIs6/UT1xN?=
 =?us-ascii?Q?qaIgld81OmmfGk0KRT7KaNqydA1XcSJGKD1MIPhMWWOoCES5hWWrjb/uJ3Ot?=
 =?us-ascii?Q?Qz9am0W8tX38D3hvIDOjjdKWIhkYtX4mhEbu0ahvrDTFSCO176Nsjfb3DqPJ?=
 =?us-ascii?Q?J62SBNnLoETcOFyb2cFTj1Sh3iV1wJMcRoX2zuU+rcpJRv/J8x9OJCzOKg88?=
 =?us-ascii?Q?e+ATtvXYWugbRYEz2lZgOEA5dnIXZykHxCjw+NJb6jp5dGWzrwg3G29tjs32?=
 =?us-ascii?Q?ufOBYnfP9VFOPCNYKs4T4UNDvIbDFERoJ1LmQN8zlOwCcKHcf0nwWiAMMoy1?=
 =?us-ascii?Q?EK923+Im8F4XRTMCk2VovOduNZKsZz3xeA5wjN0aLOvMuNtg3RGN+K1suaSw?=
 =?us-ascii?Q?ZuKhONxH1IewtgKrc/fn5JhizK6V5sSihA8TGz2YQmaEH7UDJ7g6LZ2YKjqc?=
 =?us-ascii?Q?DVJd2QyccxcscbPGr5WsRqrnBKmCnGqyeIi2TbHDosd7wzRcaph497rwG+ok?=
 =?us-ascii?Q?uFpqbjqfC5eHFEePBsFsCDGjfTfBXwUidwiojt0BHxKYzV4+C4bKsBsuYA7i?=
 =?us-ascii?Q?4SX8mfh3C29/Sh7cUyq5xksRJgqILpi8MfanGW/aMzQWIPhtgEg54PmjTx7R?=
 =?us-ascii?Q?XcvF3n3AZxbfkmgTegN9qoQ9IxwQ8YlSBkYNbdP+iALl4lcsLukGnE+KtvpW?=
 =?us-ascii?Q?To7QZLBBXNFmSG3jhn97ey29IEun9GEXEVtX2+p3GnEWGCDLkSiS8+rDZiqW?=
 =?us-ascii?Q?z87bAgW1GwBZT643C6ERCzo/mhJxVSGyXDH0FGCEtY/BuN/7wSf864Dq0Btr?=
 =?us-ascii?Q?MANPKbfuG+aSGyArHWdr7s5arx1/7BpH3jQOKwakNk062mNhtDD7qZMGDXw5?=
 =?us-ascii?Q?/ZagU8msZhRYXbxqUFlqyhdGH19jvujuxgL+vM7TiArjIfsSSauapDE26eqH?=
 =?us-ascii?Q?L2btFUbjOXHnNWAjE69g1CjEEK/dO7sTPt3gZKP+obpM4om/FDFCcv0UASsm?=
 =?us-ascii?Q?P6rvMWNlfbyi81XVdcPtUfd9s1QmpUiNtHDjs+LlnNzc1JClKB35thq0UeFE?=
 =?us-ascii?Q?8o5+NM9C/5/4Nc6hYZ9sUy6IuT20JDj7bG/3BXtivQuzHIXphjHeaI2Fwf4p?=
 =?us-ascii?Q?ntFX7LhdmjjJKUJaajOWVb4ZZXKuV/DYi+BvVJVLB3K+sMVbXmKBl7l/Ls0Z?=
 =?us-ascii?Q?8kMd6+nlALc/Xi/XiHwRwH0gBSecA0HQMYY5aPQWGeS2JgqtGa7rUQD5BisY?=
 =?us-ascii?Q?Y6i6UldIbmESbnfQ353RkNfwYxflGIcoMsrZsYYAq3TCgfsRZo2dXJyn0xch?=
 =?us-ascii?Q?54TVyIx8nxFmQlKDy/Pe5CNOHzMcwDmvuis/CsDK+opIkRSiCPJymhvqpuSC?=
 =?us-ascii?Q?8acJLNLJ1IYqW8AIUv/501nveoIJu+T/oNeUl6sLJ3+J9nwPSFJ7h2p0tNh5?=
 =?us-ascii?Q?aawuABJ28uAeg8mw2GwNFPAajRCkxMhOiVNAaxPwj2QVzfHoa7AuqleOiV0A?=
 =?us-ascii?Q?JoK4UnfSPy36l2AjITlB+3w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VW6R4HA6DfpX8QfYOqmEagFokcmwuhgQ0Ux6KjSxVzQG0273H0tP5dW2JB4a?=
 =?us-ascii?Q?07VOap+SmfhxloBDRfswvkYhPqMtOrRv31AeYtpKYQidCkcnzZ46E15CTnKH?=
 =?us-ascii?Q?aSEXFAO+KqBcJDAd6zMRrS+QBgbfRSr8QrdRCPiW7UpDaD/mLNQb82v7oFB3?=
 =?us-ascii?Q?NRXLsliCAypk7kko0wBEzGe9S6nU5jRapAy42zo749nvS5aj0OdLyytq/KK5?=
 =?us-ascii?Q?GipgvTsVt4VysUPZlAmuiFU5xuKi4trU/987QlQSfV3ql/aFkuC1fWjtzbNZ?=
 =?us-ascii?Q?jCaHGWctKQaUwOoKTHLhidDtlD4nHlxT5J86uXw1tx5240bSV5sfUDaoiXHW?=
 =?us-ascii?Q?ECgBWvsF+4rLU3Qx8K7E+RaoZCFFHk49I9jThV0xIyFxrV7JCbZvJXQHiq4o?=
 =?us-ascii?Q?9fj8qji3V1vEtvkY09eTG/VDaiGsaWPUk0t+snsb1iclzrOGgVdwosZX9sOA?=
 =?us-ascii?Q?sTCfeghx3AeytdSYjSVLy/suGlq+/pwDFSIbScvPjBaKUb+dM1G6Qowlg/ao?=
 =?us-ascii?Q?EL3Q6Ni7BcULsE0Wy7U/NWb5et8XVnDDKYIatusd/SyabpWNbEZ5lk9rlEAk?=
 =?us-ascii?Q?duuBa1qbuG5jPnFapwhCFKTy/MMVhLRTkrStYFQz9Zns1sBDcuupO2ntDZMf?=
 =?us-ascii?Q?9PjlEASvaMVWKI36bgtJ/OET9uzEfkwBIxFmEv18bqkI4zAUc9hCO8xcRR00?=
 =?us-ascii?Q?BVZm1M/nqQp6VW36iYC9+fNsRQ+mAHNdLc2UvjMo6iXut0CSuGwzH+C+E8qn?=
 =?us-ascii?Q?3rAaqyUNue8XQlRx47jIpUbsCrBqECCqxvr+LKa2beLaqg6VuEkLrRHYy4JJ?=
 =?us-ascii?Q?QmgaavTTRvsTPNt2hYfMT+lERsGZd2aD8s9L8p6srjbPgwDe0nR1fhLw+FY2?=
 =?us-ascii?Q?NZbJE6uCpj2SZ4rlqMYjJR0DVWyEmN18QUiMgUdvJvR7hU/hjOmAvkQXkhyw?=
 =?us-ascii?Q?TSkMfZO9eH3YBxchfUPJcs1RVNHsu3NRZLDDcnejbVfE5N4nHqiOJBEZW3HX?=
 =?us-ascii?Q?lTdB+c3905nMs372awnKY2e6XkawlfVfDA+hVnl792zFz6X09tTluQ5rPU6W?=
 =?us-ascii?Q?jYf0fjwogFL0IaTZCJ9i8RNFeo48YvyfAdCA+8jV+lMSchaQdwRRAPzqkFVC?=
 =?us-ascii?Q?6wBfVx13giJPiBM623a9dCzV2hTgT0qBhddsjxO9j8bcuxIB5mZ0FZqtHWha?=
 =?us-ascii?Q?TKBN4WxI6S8SH4dldUNvOjVOG9rJJE239gs26RomVS8uVEHnA78ERJUGIJL5?=
 =?us-ascii?Q?AWkbEOH/hFdfZo5ilJs4a1s8Vs29vr4dqTDdjnCibPUDB41TlNqE8pJ8doVq?=
 =?us-ascii?Q?Q1q2KUam6ji5exWG2Nqi5GsAYV3a4nOQd0aKTTsQd7XdgmEYQRAivXcoMBN9?=
 =?us-ascii?Q?5+adr5NOMclSvCVy844yZoJ3258DekGTS2+fCvwmS5v56wEFpkYA5/8ZeJK0?=
 =?us-ascii?Q?73Io06umXff8/e3nY/9lMB7w/WTbF9KOJtxCA1mReUBRb6G/hKFFJrfNKgN2?=
 =?us-ascii?Q?F7RK3CWALQox2RXZEv754L64tpbwB8HBn0hd/sn5jt7uMKd3sZ+9MSEHohpQ?=
 =?us-ascii?Q?mAsSEmny2FctUAkI5QlwBxRBTMr+zXJSxSSpoSkKs9wKA4qw1xzGEGNa87Cf?=
 =?us-ascii?Q?ZWNMifx9NRZOXJ4dqcB+Gnc0LcxeP5B7NH5x16bFiQd7BD/OYSUB9F9ttbxp?=
 =?us-ascii?Q?q6eV7k/gVGg4wGbmfzccV+pazhPWy/uE4xliaDF8ebBOU//oFxcoW1TOPRwv?=
 =?us-ascii?Q?dMQ0m1plaw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea95c66-082a-4235-bf9f-08de57fe85d2
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:33:01.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lY0qWy6RpgHwUmTkKryMUvcHutLVzUKY29ZJWtPm15/xOof2tq8dolleySJL2mxZscekbI94a0Uk3ErI+lGlPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8797
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_083307_188511_D3A70ECB 
X-CRM114-Status: UNSURE (   8.52  )
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

For i.MX93 11x11 EVK and 9x9 QSB boards, add the gpio-hog to enable the
M.2 PCM pins level shifter connected between soc sai1 interface and M.2
PCM pins so that HFP feature can be supported.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 6 ++++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts   | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 8dd5340e8141..acb160d3186c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -356,6 +356,12 @@ pcal6524: gpio@22 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+
+		m2-pcm-level-shifter-hog {
+			gpio-hog;
+			gpios = <19 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
 	};
 
 	pmic@25 {
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 0852067eab2c..11e08673083b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -349,6 +349,12 @@ mic-can-sel-hog {
 			gpios = <17 GPIO_ACTIVE_HIGH>;
 			output-low;
 		};
+
+		m2-pcm-level-shifter-hog {
+			gpio-hog;
+			gpios = <19 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
 	};
 
 	pmic@25 {
-- 
2.37.1


