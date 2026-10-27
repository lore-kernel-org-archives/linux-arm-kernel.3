Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E83606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 03:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EjQq2CAg;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SHJUcUqM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jQGgVbxqmsbZd7abv57D2+XZk0t2sqvJKtHrBiFXMis=; b=EjQq2CAgwJt2hT7N1HI2RAX/NH
	kxnTrSrsDqq5Sst4iEakbZF91VdlTo635f1v2tYWuM2LS4puarpbxf74kLHv+vUv/xKL6CL9GwLI3
	43C3te9AMWZoUv/+UkdwouQz+MSThjEJWgpWCSPtEY9Js+XGXbILeXa9Og2aC7J7yuJne3D7vTU4g
	H0u6hMcp06CwD3JEFc95j0gIy/QcMcPW0zPXXqdAkhStIpdaLGI6ZPKznxIok+/bF6Nmfz5UAOwQc
	3VFnobZ+6qal5PDhgz8BWLZdXZ32iIQlSCzkhsZBgIZKhEiUDAKJgVJeGYdMCtaTR8HPNmd20uy89
	Mo+Rtkzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXRQ-00000003g96-3pJy;
	Tue, 27 Oct 2026 03:01:36 +0000
Received: from mail-westeuropeazon11010044.outbound.protection.outlook.com ([52.101.69.44] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXRO-00000003g8F-41ln
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 03:01:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNAr0r4oqMKjym3bYXN76wyejzhwYthGP1CErvwGxBMFhjT3Ftm0njDQ3ARWlKlkt30YSXWBJ1Vw04iB6we1oaV0H+w6plqU3lC0zSUT1aXyz5SGPoFV6cggTbRk40lrJyMVEHhaBVkMtkPL5QEaXbZmuEHsFY8oVBYUiVMeqMcOrQBdEV3McuS8zUL8wi0kHT43XAsERRHV6AbL+kgTgRKgxeagLAVD1Miwts5jv/Xu0r+NipuShEFmqKXMycUfzAd5pCpQFrkX3zcidexVUb6G6WnRccKyWAIRt6Xd6uaMqnJyM8zuxb3EJnx063gSPm1+Josy+9tK1BUhoxr2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQGgVbxqmsbZd7abv57D2+XZk0t2sqvJKtHrBiFXMis=;
 b=UbX35zE043h2EFovnBI81Lrr5OmvbkmMMWOQxGJYCAOMtkgIKKz5KjjTkjNTJ8tnsc0tAetigYRuq8GHJY3fknZwmNg7Ysf/wQd7KKONe6YyC1hFZGPcvwyx0EMhNYUOTTss9v8Fad4e3/UZXYH511zSqz3VeydGHdNNLyUr14rkhckrSkyLAVsIHDJaI8vY3AH8TL81e8JJjtpqgY61ckQLhW+3NlO5WQM8G6ivOaMBKLZtjMSD/25jXLVNFwO4k1vbcLP3Q08RY+g50hfcZGqw1CjPoIsT1aCmCSrrN6UP+63HDY+AUHfvHHsPhx3zvrsueUVKBKXx6cjzfVN9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQGgVbxqmsbZd7abv57D2+XZk0t2sqvJKtHrBiFXMis=;
 b=SHJUcUqMYVB0rlazAIcDEz7t0S9sF7b0NRu6n/bWtOuAMs78A4UAdZkpboggDW7Z7BginUEosGAr90f6RyoIs/czMS00X4O7qSOUZVAYg5cK8JXVvxfYnJyYQsf0uB9vFzuWvsq6SHQAamms1jSUW0FL7+SftG4QLeYyNf/AaX1LpOM99s4l9BrAN6ICIAxGaSpxPsG025SUScuWBzOBjSyyZ6pP807WYP1R3fpowmZ7D/IixYUWZo97mx/3Qr9P7OerVhdX6CsBFWzS2PTkKtMIOzgWiIUPeQq3j3+7YvOVVvowDoWarnTZgjXwXaNrMtiqSNqtOWR4BIfZ1xv8rQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB10193.eurprd04.prod.outlook.com (2603:10a6:150:1a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 03:01:30 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 03:01:30 +0000
Date: Tue, 27 Oct 2026 10:58:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Message-ID: <auATVtqpLgJoSElu@nxa18884-linux-1.ap.freescale.net>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
 <951ff0c2bad8709b77b5ac7086b70cc7d37ce51c.1793008847.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <951ff0c2bad8709b77b5ac7086b70cc7d37ce51c.1793008847.git.u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: MA5P287CA0133.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB10193:EE_
X-MS-Office365-Filtering-Correlation-Id: a81c4036-2d0a-4015-322a-08df33d69999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|23010399003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Stf/jcU1ifzcPY8BKnvSwYSLVWWvVo2vrD97Hl50U2D4XK6jFTFUfeFwCxw3pwcDHCIO46w7ouOFq1L9Cxhsqm4S2SElg3NDDNXXv4TUdQyALsXzTBvLFCcNY9/4JB9UYElYgVukyYauha7m/VLoNVxXiCMkoEjauLTXeTk9LHmMVIJCIRJmfOjiYbB6aQT0cw0iFQqmYoPFhNBTrws6i1fv/SwibgTs3gSrjVYk7JSUEucvX36Or5UgRs/EWouDT9IAb64XXavKxtEMkOnyTgibsjV7OB8zDhmjH1ZxmfSAiyR6KL2cKcmqK6xlrp5s/Z/sHQ5X8cND7pDGgmzkJU9NarB+DD8A7jGwG/XEFa/3reoQs6Wiw4KoYikHaJMavGGtOm7uE2kLNmthubxHb3H9jiQufkkw6Syb4lCN2YvdHv2yi8wsR/Y4TrwatR1HtPAYPbwKMp03sD4WBy8RD4Ep02JMCZ4unb2BK2VUZS9A7/cXBsNyFAjT4Mbw+rKDn97DWRMsog1An9sspPLHUlmD2ik7jVI6PqF6LXnJbft6fO5pB2RbYAJHT4KOWTIBSFnScTYPNuGeR1CQQSxmLkskBBvJoRkBZ7Y1wqaSk8xo05F8cWF5ErtMuVahYKq3yBlynitARt3o/pE2ArpqV4SrLij4hpRo/vlAjSm+SOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(23010399003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k/xn83wSQkmBLDxKl77i0ndYBcEDETecz8vSnOYu8YUtO7R8shaKdf9WPqxM?=
 =?us-ascii?Q?zkfJp1xNNwXg0ezwyeb4PzDEDTyTcMhP8PN7nbnJ3HfZhZtBIGwNFXaBKLEo?=
 =?us-ascii?Q?uqMD5Lm/N+5T5J4qqRzIeQVMNWgHcGdvwmM2jxOG7vUq15ky2+WM5cnUQsY5?=
 =?us-ascii?Q?VdEU9hYamropbMOpSnSw/bveigaLGGwI7eXs3mAYFCWkghe3Gj07C1Pnwlx7?=
 =?us-ascii?Q?jY7XDXjNbjIwypIXEVIYtS1BXnfNcaTa8l2+1WuI01CQdUgqkw0FYxdYgZXp?=
 =?us-ascii?Q?adiTmYOIj0VxIhpGZIYUL3GuyqX6mZ1MxJIhKlClk57SkTlMDGUZ9Jk0lFBt?=
 =?us-ascii?Q?QMSj0ZAAOItjDOfUf9kxysjlUeZoaJ6TFbzv4xUce9vUjSTy9qS7CMu6NtoG?=
 =?us-ascii?Q?PWRRt+F/4W/hHtaS//29jvbDSqp/eDnqjJTPH5hW1HTqKIXWeAbIVEBCHO5P?=
 =?us-ascii?Q?QGhHEMwHI+GqExBKTa/5lt5HJ6G97Z569FfNfW6OkHPcJtCnGWNgCChcpf1J?=
 =?us-ascii?Q?5lVR0SVTwukm/8BtjzXjf/MxP5pf3oawH6VklNIUPDbkdpRT+m1L3SoFcz8W?=
 =?us-ascii?Q?AGHYniFscU0HkHgqwcD/Yhb03/QkfKABnpeesqPO3NwA7PIkOlLL2waDsXbX?=
 =?us-ascii?Q?rRMVvd95Bw5g7RZhw6jwyZMFzwMGrDIm5wSb0DBCpdXe4eekT0I7NbbO4LdA?=
 =?us-ascii?Q?MqWE7M0pa64I+sE1mIQcmNKXRwB3gleXXgpX7SvBA9puZ0V/2BIz6G4f/8Ys?=
 =?us-ascii?Q?ZVz5K9WYImsM+aaIj+wtpSxz8slYEbPof7zJjsDucZxfAVlapeJ3fi3z+28B?=
 =?us-ascii?Q?xcerbfVNHmgANidO2MAkees0iIJntBBITACBzQQv/W9HbtcmSWsSMhgJi+z6?=
 =?us-ascii?Q?cBqGwV8lky0ESLLQ4h+MX813hVmNi0FUv7/VRg4MWtI7DXDHD7y6VQBT+LQK?=
 =?us-ascii?Q?KHGWz5TXDynR3p+feqY5RpEcXraSK1dcls56vv317L/EKih1TMW4PRDQ1Oxi?=
 =?us-ascii?Q?yHKyVJEjnkJWsRCmnY1/eCKd9IgMPB74L/eF/Ky1qDk19EaQ8EgoejTl19+c?=
 =?us-ascii?Q?VXUUasD+Turft7NzO7O0+MAFA6j4hmj9Hc3ydjQPEQEkJAV8RsTu4D/Gvwbt?=
 =?us-ascii?Q?2//k3k+sxGaAKFMB6l3OKKmCBq9fALXW29FZKkoBARKUtWElOxEN7r47f9Li?=
 =?us-ascii?Q?53cRgxyFPJJxou6m0PRW22DQFeUgGj+NPCz6AUUwK2ylFv3eLbfRJUQ+yiC8?=
 =?us-ascii?Q?dLwHEviA45VovSlo2ri5ejincO9JWfGrYnJcuFODyLBDJfVwvK28B2z3I8FI?=
 =?us-ascii?Q?CSxGbODpMER+XCsJ6zKIfPgx4YhnG188Jtha1fe3rcZ+l3gk1GEqUZUkx16l?=
 =?us-ascii?Q?JjUsLqoxo52vNHTj4SKCZnWdkCERzCCZAxa4+6VuMSMeYVfMbKVYJfAPavx1?=
 =?us-ascii?Q?mBYi7v9EMwMVDaWRjG9pwoFnZu9SGmUwP4J5jWYJb9HDXPwsM8kb0zZluNkC?=
 =?us-ascii?Q?C7kk8UFTW+AcjandWo3O+bX7l01OBtQL+LM4ZB/+DII3WO71KHt7dSY7iWUa?=
 =?us-ascii?Q?dVlNZMl0UxcTHIdIvucSBJ01Wc6NUM0gSNUn543IqFMVsTWsYaydIwcH220r?=
 =?us-ascii?Q?eMi9SD998THL2D0Gy+B2pRl70fD2DbwxqdgqAS5DPfoxlW9KlzVMNfqWIPhl?=
 =?us-ascii?Q?FQim8I0ySpmoBAi5Pcw3PXwOh895x4j+E6DZ97mQS9bvOQGirHivNXv3NsiX?=
 =?us-ascii?Q?zQIlShjK6Lwu6ofb4xylI/JfFVO/KKcdfLxFbfyXkKbdpZLQVfQT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81c4036-2d0a-4015-322a-08df33d69999
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 03:01:30.4210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZnuJOkLPeq1FDz30Jl+Yg0pbbWpRqwoyZoumZCvSIcRPPP2VxFGxYOGQW2PQf1CcUe189HluBnHI/+8F5kNSZ78hwDIFwkU1peyzAQCOsuFM4cgIqVbc8QfjNbdUorc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_200135_010605_CAC53F78 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 11:09:31AM +0100, Uwe Kleine-K??nig wrote:
>This callback allows to use the core's rproc_elf_load_segments()
>function instead of reimplementing it for very minor changes.
>
>Signed-off-by: Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

