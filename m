Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cnui+75J;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Sh8aGAqX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3lRXQWQxD9ae/ou/DI5aEmOcAYEKKay1BQZaxAG7OA=; b=Cnui+75Jr2ACK2i2ua8UIFAQrv
	/cFulX1lU+6kxW8qMV1tafWEy5u2N/z14Y87RUSWk9ucxrssWdU4Cq8YtxY2YaDXbJWEHFevHEyAq
	3COaI4+9RgqTEingrC/G/V7X3NqCiaJ5U8gf5kIZ/lETzAawUxt/uAsXVIGW21HIGeR4ika1pUxJg
	sbJfj7+oc82CWcZW8F5D7AwdtVxIFH4vTvA1hcDT+d1uzcO/pYXh2WjTHePkVmG8GsABWl8M5CK7g
	8JE1jWOagf73EAt2Lhf0qLI5ihpk8VM0vQysitTQ2O3yDD+51FnlGo/2+kO+xmkepiX9sYgU1sop0
	FbOfsN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsEM-00000008Avy-3pD7;
	Mon, 19 Oct 2026 18:37:06 +0000
Received: from mail-francecentralazon11013061.outbound.protection.outlook.com ([40.107.162.61] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsEK-00000008AvB-3dfS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 18:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwy8QvMsBE11MY+wEUvLl6CedxHFsC9wXbsFT5G03itV+O5Yd0841aZs6xxNzExOtuHd7Rhw2X17k7mK6rinBjOMplutQD2hQhqr3E9ugYx1ppdOAYdGm9yo5ejTT6xdtRH846MNSg61AAnHpfH9lhHMX8qStzRcipDSw2mLk8Su3K63eDN+3aDpQlMKj7HKJNHp5kTERIJ9yYsNvO+olaxE7e6mkfhnAi9xX6zkmQsBx7NPMd2Tmp/RAGvCFAZ1d2DSE13Fa6WNevE97zz6YodzNTxDnGHCimV7zTHdVOYo4wmLs0kjkZbeAFcD6dSiQPnpHsIiby9wXojQvaASzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3lRXQWQxD9ae/ou/DI5aEmOcAYEKKay1BQZaxAG7OA=;
 b=zLVRb3QuyqtUnlq4thBkabRW3+l3Refvc/NHWDHfBzek8YX2ytdhmEIoLp2jpA12QSfYBieLoPfHOxHqKhP9pWvLP1jb81EK7KWrvCVVJk0g3eKAz4vtrmMI52+ueU9cveQZON7/RdbG767sZCuRfAYadvbvTcj6wk4CiNDJ1nGEani8moAAa9yCLybSsC984PYmxoGhnc1qWfNo7HZe4k6jNihsvhiufyfX2j65jCgdKaswtRuJfNlP8yRDYbkKHZTLczwFJfVYevC1/OyG2roZ/umpzTF4W408KbhnEnS772j6Pfq4JpJEbA8ti07xsCSmAKnkQu5vQMd7lrujtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3lRXQWQxD9ae/ou/DI5aEmOcAYEKKay1BQZaxAG7OA=;
 b=Sh8aGAqX+i6qfwjwK/zxbMpVof6HvZ4K3YX40KkS++mI0QrUZQxAZ+sYzGorwhB1oMDOGRr9yk2jk16hakzm1pYmO1A9Agzi7sEasQ5i4cJyo7ipMd8c7aN/A987rkqOIRqRH7+7MqwHK1YekjBmrD16w8aulxBgw/jFCe33uWNgnHkYct6uMszseDBLj/1Kkt6Y6oloR3+8o9sf75ZOh54WCbwQqNIbna2GLZ7ZNZ/vl9YV+ty1H3N5o0qj6bLv1xSkJ3FY+H+duSyKmitglJ14a5PK4GSeTDb89YHT2xmcJIUt0a8QP99Kwc0yUaW7lhbJ9a75Akms9aBoB6hupw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB9734.eurprd04.prod.outlook.com (2603:10a6:150:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:36:57 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:36:56 +0000
Date: Mon, 19 Oct 2026 13:36:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Daniel Byrne <daniel1.byrne@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>, Frank Li <Frank.Li@kernel.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dmaengine: add dmaengine_async_is_tx_complete() for
 channel status queries
Message-ID: <atZjPjTz8iJQKFNj@SMW015318>
References: <20261019150632.4026424-1-daniel1.byrne@intel.com>
 <20261019150632.4026424-2-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019150632.4026424-2-daniel1.byrne@intel.com>
X-ClientProxiedBy: PH7P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB9734:EE_
X-MS-Office365-Filtering-Correlation-Id: 734be38f-1f84-44de-0e4c-08df2e0ff42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|261009223027099003|10067099003|56012099006|3023799007|22082099003|18002099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: ycxNkJSPUyQztm8D36cUUd2gSwNzFAlNJqmm2M6rdkDfmw8wOpVjW9vCDmFXHWxqDARncTTvVmh6eb35qjFp0RsCL39xxAxoKmAhZl+VzrHmsDzGeAEOlQ+zTkYHWCSulTdfGxTH8Eqwc4RlY7GsS3P/tcrQbNEF2Ru8cc2yy3X0sHCtyvXSnD0IU+/AOzkoDi/r1OsaJ/Yq1bD8mrGqfP2VnHRptfXzhpUBbGK6VLh2oOWMvRmQNMpBeHmPOojzkpUWxG3dLco+r+3hhABJcjuytwyOqAT6zbmoBvvqW/rhoINyq4oPQ1zmNdPMOt4nWqjxAZnnf1qSmlaR7zNjs3axWcfX4FU3LZbI50kOkU7O6cx3BPGPuN4GFUSGgbvUhWbNRDvzE+sRPjt9K1Z4GOUD6AExSP84LI5I3HxJz5dPRluCneb7Lh0I1kh2Mj4ytzCIUOEjDBktu+rWHRq+IybQZmSluEBHVh/2QrmoQKKpGAA6/s0bXhY3qoMd7j2EyI1teOtg/7IpFRAB2gGVLVdjRuN4VERw5T7hwpOsMjiLgoPo+HaroJtMS7ozBQCLrpXGVRRi6gJaGG993m4DA9HGEXrH58gaH/8+17qmiunvI89q5qngPslKPjJPrAZJ1WskrK+iOLd7jAlyXjDhrLtI0VG69kxH7gSjsMX8xlw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yu+oxRD9J09G591cntWyGMDI8HMJSmfu0DZE3SmAeyivHkJuAGs+mBwBy6C2?=
 =?us-ascii?Q?wC8q7flG+rbQW3kfGl20kfkFaqbbpyk9S5K91QEVPsIO4l+Dqv+1t2hVIhNK?=
 =?us-ascii?Q?/e47BYw2K0oDZBVg5KaPoceeV1xgxbF/MpsR3A7iTqUlHpECO6KS80E5UZdf?=
 =?us-ascii?Q?PcPjyr+wJWBfJeEqcGkse5ukvpzhDj0agF1fFwDPAFlwmvjzryNbOkUBvzMY?=
 =?us-ascii?Q?6tZvinsMmW20MGAZmdQavQyiMYnGiccnQKGXrWwB8/leoPB3WSDMZzzPh4KI?=
 =?us-ascii?Q?S6h+mu+AVQV9fGj67sZ4q8lykTsi12jRqU/6GdDN4Jt2M0yoOD/H+N7v3BYT?=
 =?us-ascii?Q?RlZlDOYP1hixI4+nf954NyMTYx+CEneCUYk4J6+LONSe0DruFnrsHSyWL9Om?=
 =?us-ascii?Q?LTd3e0qEOXn1q1uQ551Xh8sWNB4IZ6op21hQwjn8DliO3vrblJkvNb880Ujx?=
 =?us-ascii?Q?4ET2ZW9iNxN+GEwy3wmC9U8g1fB0ijkogrfLw+xiKENnxB3pdpCTPJeZcvDC?=
 =?us-ascii?Q?iAeOT63+zhNP5nWuFEstu5YVVrs9CJgNyXdQ4XptQem2ALnafmd6URm4sFDh?=
 =?us-ascii?Q?VNVuTkTBGSe6oDdEvjowMBKrqrWijVbgyCx9huY1hVUxyxiyfB22MGNnB+mm?=
 =?us-ascii?Q?OPZudXz1Wxll40T9wM4Fx+w1ScF7MeBKuM6Q+smwIQ2EDuI9LYEOnwIQyfea?=
 =?us-ascii?Q?yy4qyuiSwjSyMiWKn481e26lvBhHChR5sUo+U7FO3WyUXuuJwKfmUetuRvAO?=
 =?us-ascii?Q?zCOmX6IsjkrsZY7OgD84ewJGk6GPvzoSCN0GLNQeNFJfU3I6pYy1Jj90CENQ?=
 =?us-ascii?Q?eU4ci1ZMNRyOMuYSXQP9rqiecKk0HsyfQGV1B+YbBxA+zRbx5+CkNI0AaIsW?=
 =?us-ascii?Q?XyTAQy40LCgHTMz3olQKWRUG9mrKtWT920VNdJJqfySLjUYdmMK8odL07Fb4?=
 =?us-ascii?Q?XJvxoLfB6Xsn3ncGFDHy8f1ehmRn8xpzavY9y59pQ+xdXUl5PMo/0IYs3VoH?=
 =?us-ascii?Q?sj2JlXPjD+lOB+f1uOKpEKZOYVg1wKjbthrl6MRshwgIBV5D5oBVdCDJg4dY?=
 =?us-ascii?Q?BIGPVXo8YvnOBUDG7+AfQ4O8q0AZT3ahYAGl/TNVAVB0Hb7mM0Uq0h4y0w7T?=
 =?us-ascii?Q?zl+GFlGm0SURMtEPCgfSrvwSY/wuG8LgdaSTeCT84FxDMg+4hJCn3nM0+lpW?=
 =?us-ascii?Q?9v7PSXJHKeGJw5ZORiwu7ahrObyDqQ3QWVL9ae9+g+xaZpm6H+Y5ajkFJeeO?=
 =?us-ascii?Q?+xPbDIXxYtnEptAH21QWbFWAQUWxeBVG2QHjmLac/aM/Y+gDLQBUxk3xnLhq?=
 =?us-ascii?Q?nLqBrkLm5QRPMy369sN9sNcicutJPKeaf42d0RS8HSxruSEfzsEuPlTRvkMC?=
 =?us-ascii?Q?QVKM58OIwcNXHqg4vOKuX3u/fgPdPRosLJZsI+iTIXS4+1PPCn6Uk1lizG5O?=
 =?us-ascii?Q?48v9FHNpiMtO4DOlazuXz9pMUU6fErvu6xE1Cw3bywhTqJ00gLcmC0WNOAZ4?=
 =?us-ascii?Q?JVQYsbFTlr/CMQQXHTjEhPSdLuBOcbE0LzZhi76Q21W5eBx6C/r6HzogRExo?=
 =?us-ascii?Q?N1xibn4IPbG9YsD2ittEHG4PjRYEkn+zr1yPWgADNlGWJAYom3JMmM+yCCgK?=
 =?us-ascii?Q?JsFXCj8sYe6wum0qJ4j0lRXS7QryJSGPUUy1jgdTInu4TV5kem4nae1q3GYB?=
 =?us-ascii?Q?UaF82iT2ci/aDF67iurs9ZIwH0avFQ8Tihipu+uvIzciQmQaQ4qU7NhFpZLI?=
 =?us-ascii?Q?hln6Wi/E6pa1Lsm8haQVhFZyw/AzaB6R+I1C4TCyNV1EQazZWla6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734be38f-1f84-44de-0e4c-08df2e0ff42d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:36:56.7794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSzmnOQlQu+XLEjVKmC5Fh4eT2fJvsoXi6Zgoq9p41CBtSuba5GDKZrQ/WnZKUH21rcWaoF5h+SbN3BFWYHarK/VPx/38wNmiQB2tT06dXy0gUWciNADXJpP522OX5sw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9734
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_113704_907432_88CFD7B1 
X-CRM114-Status: GOOD (  17.59  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 08:06:30AM -0700, Daniel Byrne wrote:
> [You don't often get email from daniel1.byrne@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Add dmaengine_async_is_tx_complete() as the client API for polling the
> completion of one transaction. Like dma_async_is_tx_complete(), which
> it deprecates, it routes the query to the channel's device_tx_status()
> callback; the change is that it drops the @last and @used outputs,
> which only make sense for providers that complete in cookie order.
> A provider that tracks per-descriptor state can answer exactly from
> that state, and a high-rate in-kernel polling user, the io_uring DSA
> copy offload to be posted separately, depends on such answers.

Does it should wrap dmaengine_tx_status()?  from naming conversion

dmaengine_async_is_tx_complete() should return bool type.

>
> The kernel-doc says how far such an answer goes. It is exact for a
> transaction submitted without DMA_PREP_INTERRUPT, on the first query
> that reports it finished. An interrupt-armed transaction reports its
> result through callback_result, and a cookie whose descriptor has been
> retired reads DMA_COMPLETE. The client guide's advice to pause or stop
> the channel before a query points at that text.

I don't that it is true. Supposed user can always poll state regardless if
set DMA_PREP_INTERRUPT.

>
> dma_async_is_complete() was only used through dma_cookie_status(), so
> delete it from the client header and open-code the cookie-window
> comparison there.

> Move dma_set_tx_state(), which only providers call,
> from the client header into drivers/dma/dmaengine.h; every in-tree

Use sperate patch for such movement.

Frank

