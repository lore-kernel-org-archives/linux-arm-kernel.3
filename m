Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA9BC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGZwkLXnuY4+/QwJcLfdSxe/Big0L54fZ395euLjrVI=; b=vMaE7N+sPefm6AE5yKQQT8W0bf
	jbMbL8qjICLrQhTBZTU7z2KUrZictFREgp0yW/gDoOPp11pwcTRmy4Rp/U096i4ufO26iXZ7YV4in
	azogBEhvCxGbJNLnWV/wp6iNw/onxWMMEO0q/bnzag3uh74PfoO+9bzdas+QYOH2m/TZ5UiOL6H1w
	XRR9Eu/fwkqR7ud+WKZyxKAuccomMby+h17KsXGLowovZbbLvnGfFIP5ZEQ9zitYGP/0lBMEapESy
	LpXr+WoXcLkk31PAjNCn38lShn+fdx5pOWKCCFltl1UNjFwb5ebUZNlaQXHVJiQDeR8d+A+YZv/+b
	jnJRjOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E6v-0000000BDCI-1aC6;
	Wed, 09 Sep 2026 08:56:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E6u-0000000BDBq-1arO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sGZwkLXnuY4+/QwJcLfdSxe/Big0L54fZ395euLjrVI=; b=nhv1vFYRklCnVKnonZEZ+w5DMZ
	cFnto2VltoFTyyfyOVKoj9UkNRU7UOKtDIl/MviDMA5t2Geu1PSoPwBFuoOv1RY0r2ShHV0gXVB8y
	BE9EcXwuCAU3jrTkyd8wNJdVOXRnwXOU6qr5dpdpgi06d2CB5IASFmnSiCf0ZXIB/XwmbzX/yOtDk
	345P7woydD5HaLulZJKJR6MCnFpRMj7jPaxEnObtNkliPkK0hxjp6fg6bGy/JoDrt05X/L4uvXLMs
	dxG18LK6HhCDNlKmqHdPzEUCxszjCBjnE0dprpkNGvAflGwwDbObonxxESAQYtvRADNakIxAJi0j6
	+6asAWxQ==;
Received: from mail-francecentralazon11013012.outbound.protection.outlook.com ([40.107.162.12] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E6o-00000000x0y-210H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:56:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2oeNDmUg+Q+gQNBp2H9T9QbM8YA+dPsdCSlUuXxpii4hT2LkiA1f6iWX8S7pe7VYji/Ec7nP6ORbCxR2rINXWAjqcMlvM6+1bIM6ijDU/CP7ku0OUjfmz1ij6Qfp27DG+/woXRX3cGRN30QdFSfTfhXqnrNAjepzmy8y7MLgdfzx/HDtkkR3EP3/Hjy7CAIXwZDIjNSQQzCqjmv7kLWx5QsviY+LvTRlXlUc5usd2GxkTKJSHhdQTL1mAQVF9nh1E7Jx6WNXkjHepX+m0t6sMeaQkqw64C88i96far9bPrRhkYglkUaFRc+N6R0JWLRPwmP3LpYJpV2lb0k7CjhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGZwkLXnuY4+/QwJcLfdSxe/Big0L54fZ395euLjrVI=;
 b=JVV6I4cFc7DGXlJoIYto0iu7T0zAx5JBMfEYMIzw9m4uiBZiWzcjV1d49knIC6HMsbfplqufbEkHl5olBm2PkOs0Vkc+Yysrh92Iatq9r5m2UXmurnaTDrEjTMn2fyCnKbWmElvVlZaHQEyMCyTeMOhWUU4eVfMFOIzqj7/fzSnpR3NV/RA72T6gMrMmJwu6oNLNrB2O+kBH6nW4e28y4y2K2+MrKNFPmWqTLMvn1iKfdEU6VNSbl/fszstS3bZ2r/QvBmeu5tv6uqNPBn3/eLtf4HtJJZxhtzBmINCM9D/J6Xu3kKXt1qFnbwo4Ct+41N40zinZBgxefMw3S8FtBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGZwkLXnuY4+/QwJcLfdSxe/Big0L54fZ395euLjrVI=;
 b=duUZWElSQzP1ci48xAHs18LdIO7QO6IGjjrcnbLHBCZypevYjd5C13kozUP36SBkVvJEI3+HgvRzy0Kqwcwl2eh7JJMoUK6FYWC28vfi08VKB99ajAisikK9xbg0VQhsnQXz6psspimEc0lhjBoEsBY97uQZGGOlEobg6ComB4tH2iyfZY+cTDcZYJrMmYjBO+issmnegyzgMQy691RJW8FdVIwXH5eRkXKaHzwjpiOl+FxZLs9CY3sIuACX1eplKTQcEMmNLaPd/VTrafgcU/dSNI3mFGvA+2smLhNooEBY0WpJMe0j4D17ukldpamE/Q/vya3lUJfFgIlc4yDCZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AM8PR04MB7266.eurprd04.prod.outlook.com
 (2603:10a6:20b:1d6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 08:56:40 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%3]) with mapi id 15.21.0382.012; Wed, 9 Sep 2026
 08:56:40 +0000
Date: Wed, 9 Sep 2026 11:56:35 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable+noautosel@kernel.org
Subject: Re: [PATCH] bus: fsl-mc: register the object drivers after
 misc_class exists
Message-ID: <ihh2hdeove5tj37mk53htlyzwfnnn4tzufumzcnkza6kkr5yoc@rs2ojo5lod6q>
References: <20260901-for-upstream-fsl-mc-initcall-order-v1-1-36ffe48f767d@free.fr>
 <fmmf72ypmmooyxszz3l47xabdhvetowgvbmbjmvj6bumuh5onh@pntmny63urbg>
 <ap7mmR_4QV0k88dK@L30177.local>
 <dvnnk7fnk57x7gf4mc25codec62xtpbe4v7omhjguqxd25ssmu@pqqjwe5xif4q>
 <aqA1FKnhAA6iIuyH@L10892.iliad.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqA1FKnhAA6iIuyH@L10892.iliad.local>
X-ClientProxiedBy: AS4P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::9) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AM8PR04MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 437c819d-d6a0-44cc-d10d-08df0e504392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|10067099003|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info: 3I8JSJMlNS38RHrfWX9mQLsmL6JZUlRnpaDNwwnM+xqKvpn4zXDj4/e80Ye72RxcbmqYXedpL7O5xztnOsmKag0/KynVCiM5BONaI1I2LQptlFK1Uxf417+74QyfX2/+shRaY4AuFHOlvlS3GI2cFfk0Iwd5tGFB+DzXBHtw3E8f1uhlThD88cWt2EfQopea1rf0YGUilLG1zWsEsB9IRl8fID7x8GVsNvj3NconRWYlKqsEzPq20NZDe85l5zch39av0bxAk3pq//9LRV5W1LMqRgLLPHorXiXy6p4qLp84jgmkWmoQPRHZi+xHWYw0eYK1ZJJq5TP0N0MH9MoTJEJ9XmsJvEiDxD2hHp/Nw6AAQPpVBJPjcu/f8YaPaI44R3IpE49n9SIivJZwoLN/mLCJLhS8629iq39YJrXKRvvZMSlZ8ncp4vXVEfhW3r8hwKEFmNfIVAJ4gX2J6hIWJP6BxDcCy09uhv0HGLKTWLl+ePteZWpX5PLzhlEge5XrRWfaGVDYqnIOGTYOr/FlgRSsV7oUsL7KIxyTW8uxlhWniDorza1uhxkjH7+3yvLNWoff+GO7AYsxzb8KUQcjHkV9C/J6cKf2uiX9T3N85v7o0Ix9zsy6Om6nLv4WPzyEaMpVpnwJyxSqRAfZmsFXCaKAMlbDPx205BLPeSDU1pnxH/xNBhgbkw+1sfqjzEnx56zRMaaNHWE33JKkfIECcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X14nL7tNU4S5v9kiH6NZ6wo6/gSfyiS6YwQD2hR7ZaWDZqe3JO/yYjn/c7Iz?=
 =?us-ascii?Q?2B90vyYvC05DOh6Lvw41B3ASltakvEvmI7QGaj8920oyjYhYKcMCwRcIgPx6?=
 =?us-ascii?Q?77vxE0cL9JXEI12sc0TP/eB1KM7Y1tQLG1jnFVUN2sbmJkBUbmxscq+RScwg?=
 =?us-ascii?Q?yJAqSI61ecn+Gqq5Gt8nyyoVkoKnu+wHjc3jmPfr6XbwSriXqXWwfrNoj7Sv?=
 =?us-ascii?Q?ZjEfye38uEgYf3JVnyeNUkMAKgcCJzrKiOL8WvABCs/knAO3f6Tr9ZJfDVwj?=
 =?us-ascii?Q?w702Eoyh+QxoMDUxT5zuSuZYHYPCNHe7VklLi3ifNUdQK4ykDR8hvuP6YW8L?=
 =?us-ascii?Q?F3CW+XE9B31HYSKaUl9NXHYkArgTlMlIbOEDCS9JwXbSGTNfiVeRTtsLBcNA?=
 =?us-ascii?Q?ZHmOjeXRupZDZk5WlowBiUb+hYYVvJxYsJnKzOZcD+s9FRRn5nFcSCCn7r85?=
 =?us-ascii?Q?70zP6Siw7z4DjjPs+ut0iUyV3taOxz1AJB521N2hl5tcVFvlsr51l0qlDGrr?=
 =?us-ascii?Q?P8Awjvwe+0Sv6oFSL0X+J5mWz5tWccbxUGJKLs7X4AlrJ6zzBU0OCFTJ8RBN?=
 =?us-ascii?Q?vxuHkwsE+fo71B5Qhm0VZji86lFOonkk8IB3+bSYMFV/6QKvMTCUqr79xKH3?=
 =?us-ascii?Q?eHGK8P542cisyJpBGbot2xHkj0AEMvE3kHHHViRHgs+MYOQNWi4aoa1uw0u1?=
 =?us-ascii?Q?i61Z2ngw1cKDThj7IEwcF0RhC2Bs9x09XF1WB72Jz8lEjEZemnVlBohZUasT?=
 =?us-ascii?Q?E0Md4MhxJYyUFE5/KptYbAIVG9pxi+lscL3RXqfkRDcOMkNq5zzldq1sbB/Z?=
 =?us-ascii?Q?ljGXIJUG2rKGx79EVe/5KeXEDm4Alnlro1mdafUKMW7QHYLUEbUtviIvDXnX?=
 =?us-ascii?Q?fnHB7KhAS+iQ+7lkLv5pOfwTOfMphwiQX6yoAR1VdbfBusLqEnZAwhiorDNf?=
 =?us-ascii?Q?07ZfwGz2TOfGAHwDhZOj1odccLgXtyYqbLeLRSjEGPWzbXOxfd/pFbolNrAi?=
 =?us-ascii?Q?W7oWot1mgeknOcgM3rkyH5htTMVeb02FHpanZzFS5ukUJLgfdQB61nGXgd2z?=
 =?us-ascii?Q?dnwaek+XQFcJVC62iPafxsAyclyfT2M0qP6FK6riq+iJxAKF9+16PlwY6jMU?=
 =?us-ascii?Q?FU7d0409YkMXKgZjAA8IUhLT6VPFUl4TVXEM3vmaQSzIwd5qRC8SLxzIgCnk?=
 =?us-ascii?Q?Kx3/cMfxLQZocJYffVwjeGoQrhkuyUpS1iHESDKh9Do31ljXWHuDZsQ4j3eA?=
 =?us-ascii?Q?TJisOFbT4DhosBjkrfChS8siZkHJZyOPKfMAhUnQjZp9hNu272zZAeRT5OA4?=
 =?us-ascii?Q?DU6zXVBLJung64ZXBNgiW+x91f6YOStJFOjuz+e6d0PcVfKRzu1t5xeUGIcJ?=
 =?us-ascii?Q?rdDqj25/h+70gA0PsnIFHcNhJvH6kKMk/SDeBwbm4LvD7owgi/pK9Rk6MONZ?=
 =?us-ascii?Q?jkCJ9cTl+nhNBW2asCoSAehdtA6zLrjhxUdTNqbCy4jGVzL/HD0xAW8k+CFr?=
 =?us-ascii?Q?NA2k0iLqKZS7orKzyKUK1j9vLCC9YTdzIq+dYFvXsIqzZAYpctK+ddkshWZ/?=
 =?us-ascii?Q?HiCVhyEv8MumovxfFhMNycjzPj5dyqsq3biHPLtt5UgYpSy9TMnyw3z3MpMI?=
 =?us-ascii?Q?7xC+lRSW1QJj1xTUKgKwpNtI9lv2S3xxCLt+Pl8Eq89Fdi3Wo903/H8GAQHf?=
 =?us-ascii?Q?UzdKAYlr2S68E8ZF97ALnyBH+EJ1J2KgCnrjD1BorYlTAugpQBQO4fCU7uOi?=
 =?us-ascii?Q?kq0XccgOvg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437c819d-d6a0-44cc-d10d-08df0e504392
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:56:40.5188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6T0IQEassZoZz6/AzuUDGGe9bjihmd/cZ1kroqU+dA+GIpWF1/0NRu1/jkDmE5pKKwYA+4I03GiQaa9I4CkDwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095648_103675_9FB08872 
X-CRM114-Status: GOOD (  22.72  )
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

On Tue, Sep 08, 2026 at 06:17:24PM +0200, Vincent Jardin wrote:
> Hi Ioana,
> 
> > I am indeed in the case in which the uapi support is builtin but the
> > dprc.1 probing is deferred, thus it will get executed after misc_init()
> > had a chance to run.
> > 
> > The deferral happens because of_dma_configure_id() returns EPROBE_DEFER
> > since it waits for arm-ssmu to probe. How did you get past this
> > deferral?
> 
> I think I isolated the difference: I guess you have smmu enabled while I
> did disable it. I checked and when smmu is enabled back, the issue does
> not show up anymore. But it is not my goal.

I am not trying to convince you that the patch is not necessary, I am
just trying to identify the scope of the issue correctly.

> 
> I do have with my dts,
>         &smmu {
>                 status = "disabled";
>         };
> 
> for the mc to load, you need:
>         fsl_mc: fsl-mc@80c000000 {
>                 compatible = "fsl,qoriq-mc";
>                 ...
>                 iommu-map = <0 &smmu 0 0>;
>                 dma-coherent;
>         };
> 
> it seems due to,
> of_dma_configure_id() -> of_iommu_configure() ends up with "no IOMMU" and
> it returns 0 instead of -EPROBE_DEFER.
> 
> So the root DPRC, populated at arch_initcall_sync, probes now
> synchronously, before misc_init() registers misc_class at subsys_initcall
> and so dprc.1 is created classless. (I hope I did not miss something).

With smmu disabled from the DT, I can now reproduce the problem.

Thanks!

