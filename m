Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63F2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SOIOIY5F;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dQ7LQTSr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OJCENJzW/bBXYLvzrsTgkm5MhsQXeAEIrE5rKIN1Uro=; b=SOIOIY5FE9k6JPJWi2PM9Yha1E
	rlxQs3nI88o5oU1atdl45kCsWqiJFtxgaZ2cN8+gDFQhiqTKuau9fgf4XMZWp4zes7PAB7/947LRR
	a1bJYze6L670eMaBtcqvAi5SVQITSs7PJ5B+Gv/sfs2D50nKq9ESSEkkU4pjuBHnAKFwqrY7w7Lzd
	NRS9cK5V3xNfmAYfeh2g1OaaWoxdWt38+gYgb6dNiHdZeYwRXAuSBQMyQZIsY7O2u4u3bEnCIsMLD
	g+PYtoNxE/nsgmF3bW1+qNAPMHQWAO2f7Aats1yp/xgLVRAZaf31Wb+Ar0nGFpomKDsw4+Y3j3LAk
	yKXODbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp2c-0000000C4YM-2w68;
	Fri, 30 Oct 2026 16:01:18 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp2a-0000000C4Xa-2qbf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:01:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6sLoZupINlJXp4RwtPiWBaqbGVIRuRt4DEXPbPB92AZ+gaUtHB60S07Inu1qSqT6dtRgjDbGK0IAikOVrjEh5vmppUC47H5O+UGmOKThl4RhGBgrGuiIwavEWXrkX6j8k52J8olwcdxQostFlSrfiroc5fondQ4hApUPOn+9FDJVOleIRZbGPQ767iGIOOdVBVJTYgTvOYIRp3GgiWxS8mT2HeLUz2e7xgubtOLGSilNfNTNPgKKlNKE5ENtxAatGzfsBPk+9yr6FAHvI5SuyCkN4oKl7J5X4GxOwlIh4Zwncku1oOTLiZiweuGSYwhZjEGKYnAoGqpqie1N6Z0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJCENJzW/bBXYLvzrsTgkm5MhsQXeAEIrE5rKIN1Uro=;
 b=P3Lg+2btdueF5/T4Ys/VG9W0mWWPXFkeo684lrZP1KEa6S36A6nlNBftL7X5OnalL8qggNsJbZE/1m5rQKvx9TZO/JNbJx6eUewot+f9usjEFHmXgxoNHS0c7cF8NioRD6oJqoY2W1RY1WVhfjn6ZZ/gIoDWzY8TREbWE4f62yGWkG6JY2YoFMSDERjlB6qrWxJx3PCE3CexAJKF5dxa0QYaClUEj3cXmPZX6zbCajqX94Ywpi+XirMirD23dexTGlBwzy2y/6ZJSCLZUqsZODX5+rpz9ZiID6E1+DdCf290gVpG4RC5JVh00k1jOLE/3RxMLCd5tDWURdUlXRzKVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJCENJzW/bBXYLvzrsTgkm5MhsQXeAEIrE5rKIN1Uro=;
 b=dQ7LQTSr4+q3E/Phun7MjaEff2JU2A0BbhxA0iQUGEbnxopm361jhSt5KIPOokAT/KHX9b89+hj5gXy5a0QFR6/Mxzn3PBD+Eq/YItK8nxPm8NmtqLbcllaYbG8UvKgCpUvCOrDhjTX32V/bEZtoak+xIXqmnZs26Z1s4SoJciCosu9g/GKWDU2ZvhJfy+cph63eTxyKkktf81S9nbKQpCH0CVHGRliR+vJ87JSlTscAdUvK4/5ag0fNNn7qW3eATkTWl5zlEosZBTyKd+HAyxYsQK3kBwfM94So7bhsXJ7t3Lp+3TlS2fiEaINbtZg9iXgpUHUSylMXd0a/uf29oA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by BR0PR04MB385734.eurprd04.prod.outlook.com
 (2603:10a6:2c8:61::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 16:01:12 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 16:01:11 +0000
Date: Fri, 30 Oct 2026 11:01:02 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Joshua Crofts <crofts@kernel.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] dmaengine: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <auS_PrwhMwhc5BNk@SMW015318>
References: <20261030145901.1393-1-crofts@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030145901.1393-1-crofts@kernel.org>
X-ClientProxiedBy: DM6PR07CA0100.namprd07.prod.outlook.com
 (2603:10b6:5:337::33) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|BR0PR04MB385734:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff3483d-8a3c-43b6-3654-08df369f04c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|18002099003|22082099003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: 3KISJCyzKO5+H/m4a+nFK6CmQVZWph0V+Id2SqVNTSeTquIjIL/cbu+Z6HjljpVn4ETE5KqbzJ1rriDjuyk9V/jUZNGatI4dpyc/o1tDa7cx49atoKR2t1Pu7DIYs/mq7AJgoUEHsQGZoxz8mFyeqWQW/1h/Me/YfEwgYL/HjMVdTBqpgmzp8sMoqREIr7ye1zqysBpcwqCnYUHdY+z3X3lx0gGb664ojCm+Qewb6V9q35yY/YuCxBBu3/h6XL5BxPITsNu+uq+IzZl697gs6d4EnNhkT8s5uJIV8keILNDs+O5NdD2MUQxVFI4I4OzZjK0JINtY11W789L4LURhqp8WsRZMeQZZKS4v9xuEoyrq8CR11V/rcB2qu2B+n9JRZNRl5P2rQF6tcAB+Tb47G0WLcaRep7yxJeACC5aMbhP6ShyWKvPuiV6/nxq+g36cjTe9QwI2rWUfANGNkQ/ae6evcJSyWw7p7rUNL8JfEV0Nq5ByrBp+QNPyuFi5XocAhVx3LMohqcq1ST8IcNm+2ADhsHLZYY9N/qQduD/Y7qpkJO5uuNX438l850oJ77G1MDqtQ3ApM41bDwjcNnTm1WBALMucA+NycmnwKH7OGtXsXE1iYhxN2omvJ/Fu137fnMTJDE5tC88JqtGEbV3E3h2hZr88z2NZbgPp0jCaGVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?isMU4RI2ryY0g0l2zDFiby2AOd1fD+f6WfhCps61lqwQoUmFpB86B4VONLD2?=
 =?us-ascii?Q?85vbqJr0Zn1lL7JHVsY95rYdQ2Pay01D5D/w8Qo7NczTnoL4r1yMdQNlXk/f?=
 =?us-ascii?Q?CCLMfmF4kk6VO9kEhzEjjpXfsqgO5O1j5k9bYSJ89DfyyqMKppATqSKtGnJE?=
 =?us-ascii?Q?lbtt5Qmp5bGnKYNsakdFAk/luMxus+F4/0/qyqWalcylJ7VkYqN1AOq0gQwA?=
 =?us-ascii?Q?+fpf8brp1zdXi0Mkn7PcPFy4xIhsAyRqoxQRNfGehQM0byH+PEZ4fazDucGj?=
 =?us-ascii?Q?gkdEbLTPXrtDK8UheU291DOAGKZpptYU3iBgX42de1t5RESfIvKhRD2LXp3y?=
 =?us-ascii?Q?Fc15LCYfGJ9BScg7f4GE0KZmsJaHDuASsJuiX2bQid2MV62Lmmetg6YMqKc7?=
 =?us-ascii?Q?wzNFBwhJunMDpzmD6UCFHdQy6f7lyTs2ZdnKlZXv9EXudjqVWgoZqYDFsR6L?=
 =?us-ascii?Q?+JLrp4BR7BJub7UFcgOgOCZEYFHcTLcdlQm9iikKGSI0GaiNacpcvlvZBbj7?=
 =?us-ascii?Q?JjuVGVElgX8WKrXnxl6kQCpnSZDkCuuv/Btkowo39g8IOntL7BlY0jTnp4KN?=
 =?us-ascii?Q?HUcGPZXvOwH8gFO2ZJ5q6cpzEYnfsmezRIUGp7CmTiEDxoLFu8ySoHbcrA2m?=
 =?us-ascii?Q?4n4gh9+6YBJtTjAX8RiMR4qwxey1roljjc73AUWrK8S1VxrfbuO1dMTlCwlI?=
 =?us-ascii?Q?gSGqqBz488ESLuYaV3ImbwMb3bZ73lzF+5MP3d0YybLaTSeXdxBhcSpN9sg9?=
 =?us-ascii?Q?LjjTJEqOkLoRfRn2zu6dzaKv24UBmeRJtpZQnhtAyjUfBLlssujRTnQ+M1US?=
 =?us-ascii?Q?JPUJETiwcipOynVfgqkF3cme8meMt+RV5SMcDG+3n6ceBoJZ9F2nniBPdV3I?=
 =?us-ascii?Q?oRP3xcuzRV4uF5ZDUfSHxUIsmAdd2ebzBUUZNgrzxim8u/52EKv1WB7S4bTs?=
 =?us-ascii?Q?0UdHJz4hZCzUwx11wd+UD/ZvjvmWr/K4EYEHMJDEUFvWcYYrrYeiIuVE4Qwv?=
 =?us-ascii?Q?QuiD74PwkI4zyx+C+upa7G3HkpN+wb3kjHR9+/MYeqO/JMoapjJh/2Ri2hr8?=
 =?us-ascii?Q?EKkYJxH986pTw+ZBsijTijIsoFWOPOSW+G7vn/YGwFm+xg/uw7NucTCvV1fS?=
 =?us-ascii?Q?lTtjtfZhFmJ5vfAEGsRGx+lk0wJCu7PJFRx6yoszYeYUIS1GBjipABBEwdF+?=
 =?us-ascii?Q?Zlw5pvjCpKLHuECkZwOjKzX8jhb8/oof2q/xifsoepiHX3vSBOLieIXWvZIK?=
 =?us-ascii?Q?vxv1YgHzvv8G/tHoy7qvdbErJfXTNQetAITvRZljcohUuaV1DW1zlFjlcSPA?=
 =?us-ascii?Q?4cjRpR9YfPHNadoIS2WmMhy+TlUiaSwuor4EClF6ro/3sAyiFwEiX+np3rGN?=
 =?us-ascii?Q?E05RRl++Zi78ZYAu2ApdLIo6V596OOjXh8nQZ7uVZzwoRPqbfNpx5K2MD4LX?=
 =?us-ascii?Q?cCjwp9z3kZDF/NbQy7D1VmIw7IourgZxvEPqox175xyiowcJwnX2T5lNXuz9?=
 =?us-ascii?Q?zkp178hM8ltQixIugmYnByOhfF4phbvMlw0oMsKKUGGR5wUq2RTilGsRY+3R?=
 =?us-ascii?Q?TfppsAMtwX664NhQ/vlFFgJpqxUHyIRkhN5sDPeo4t5i3jjxnG8EQwrb0wnS?=
 =?us-ascii?Q?L+aG3QdlwE3zr8orlLcvpOOzAv194+1kXx4TNvj6YcMWYyOwQL9kDAETwm4V?=
 =?us-ascii?Q?UaRklVDHmSgwd5bquAuGRCylGdc1tR5QEGFgk17PLmoxUSiAi83UlJQgkC05?=
 =?us-ascii?Q?A0Rfne61qr/ib6qOVyRdr1EPA+MDd7xd1t2jkQGz2M0ryobEya5/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff3483d-8a3c-43b6-3654-08df369f04c1
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 16:01:11.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/8anWG9iJPKTsERFkVRylZkhd4Hiz/m5nxkaRRxNqplWnwTgZTUkxl1ShZFodBo87F8Dei6Yz9PR81j3xlrXfiKJRx3kZVVsYaefVwrghlvKJV/a6Bz+DQhNL+p1j2H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB385734
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_090116_721017_F1268A68 
X-CRM114-Status: GOOD (  12.26  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 02:58:58PM +0000, Joshua Crofts wrote:
> [You don't often get email from crofts@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Joshua Crofts (3):
>   dmaengine: at_xdmac: remove redundant
>     pm_runtime_dont_use_autosuspend() calls
>   dmaengine: qcom: remove redundant pm_runtime_dont_use_autosuspend()
>     calls
>   dmaengine: ti: remove redundant pm_runtime_dont_use_autosuspend()
>     calls

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/dma/at_xdmac.c     | 2 --
>  drivers/dma/qcom/bam_dma.c | 1 -
>  drivers/dma/ti/cppi41.c    | 5 +----
>  3 files changed, 1 insertion(+), 7 deletions(-)
>
>
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> --
> 2.47.3
>

