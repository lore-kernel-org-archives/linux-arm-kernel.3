Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2158FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cb0frJ8AxbUSv7H2ltdN6AqKZLI+5mb8RQngUp+mi9U=; b=EV0eQiH5LkzmU6iwE1fl/gQC87
	m9aIJLgL4QAIeW7Vp7gFb2/IPN33t4AeFXOfKjCrP6MlRmcypyeoDGL/oC9xx4HorgnwNvPWAiR7m
	ct4O2VPG7yDOdc9Zpuwv9dKHbIIOiMtQeGpt7VE6wbnoi6ApViQe1UUrv5qxU1uLqDQfO7PMxqXID
	JQ6lRrn32ATVnseq17lDcEzWHxc7miuoEz7m54P30YZ46RJ14QoOPIyPtdMP2AZByhJ1XB8jaSlG5
	kMxmzQ++gvXqD1lbUGBXtd5L9vnCm8VcSiNSp3/rzEmWYV9xBdUbaICHCQs84vAzcJhIZa9ZZSrYm
	J3E3ioKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhxp-0000000Fw3F-1qMc;
	Wed, 06 Aug 2025 17:30:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhs3-0000000FuzI-3bl7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 17:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cb0frJ8AxbUSv7H2ltdN6AqKZLI+5mb8RQngUp+mi9U=; b=F/jgak0l+q/C0PQvYD8+Crsug+
	zMGHH2vpYiyJudS01LsUElvN/NZJKBCFqjxzgWPp/zqFXiwnTgHl2UZstmFNl5E7WZW114zQamAg6
	QK0wlSUpyps80O5tfR/5M+eT508d3oV6bSW4W2aDPwc5GQuvH0jcDYT9qZX4y9v2viuKjB5NxTfSt
	/lbWJR4BmdKsqRdKnF23O5u6GuHFZaxfqzKvP8wxPct9hbsAwqWiS+XUF5FAqhPDBWRnqdbHfRnDR
	D58w0a2I7fHhWFy06ufc3dGt8/yXH3vQ6pqB6BCpw5ASREwOMTgjF+5kIg01O5gLwSTzd+cO/a5pl
	XmKSSE/A==;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhrz-0000000EL71-2wpt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:24:10 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GROv9019682;
	Wed, 6 Aug 2025 17:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=cb0frJ8AxbUSv7H2lt
	dN6AqKZLI+5mb8RQngUp+mi9U=; b=LXV1MX/VOi1/lH3+xxcpzMmcWCYmstdWH3
	8yXQFQk+RfGW+gJkOPgyi0ZQF5xojTWUKRF9fSU3peq0ePENPOQmUgVOGb5Yqnny
	/It9YeGqapcsZU+/b7G6DbNmx0muepdQEw2+zYN6+sArV7KLWqm5S4RAJw2pT5+n
	/voxSLqJeBvKRgiVcWzFZaMuowK+0lkthMBSFYs2oticzYvx/i6QvAp9E2NqQNlt
	KVCrq8BAoAC3TDwTQ3cGKv7MM24U4L9lTyFW6LDCIGkc6Mtv0OWLVyY9Uv3Z4izA
	AGcefCqh8vMtcKx7vssHeQnt67gbYVKQx+VshCPMMbVoinfgkj6A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf2818-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 17:23:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576GBLOJ032074;
	Wed, 6 Aug 2025 17:23:35 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwqtxst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 17:23:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfFDb0NFSFQnNGiQmg/DvEmL0XOrt5OIVMd34tj7VrUH8WR0Dm5Uy46DUpR67miOlydeq3CAGsFgrlp+iZX7a3Y3PMicI7OoFLBh0TTRTpC1UA5aNKL9K9MMS/AJGMSsa5xP22tgkCrJm+Hu4NvHptPMnz6hN/tujgotAGB+tpUCXVbT87pZoVSfx+Q7MxxwcKFaZ6BHBB9k7JAQY9wzzeoO8KsZDcnhotnKOvCrywiecOBbfAnJyWcKAalJBZZwwyeUUhIEXo3fHLztnj+i9h50MFNnhLy4ZVicNst7lkWWY4lyCN/Dj+GS/gyfsm8cE+un886GyKIHM5UcXpowng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cb0frJ8AxbUSv7H2ltdN6AqKZLI+5mb8RQngUp+mi9U=;
 b=Zjnt8KkAeNfXoErsvvIbwN96i+ij4F3k9nLz26hSxQloX9WxaFEeGdnySYZxMp80h9fO0yR0bSG6hayEfwX2LktsL2dYoioeSzEhK3iaZcr2XC8gvihApGeFJzW6yW+oUP14H1cRrdG3A+64Y+zBcHFlaxSEdoJi7j8/tC2UA0tWG6RujaCQMZzOx4c9aMYBjyjSHqo91IHUPjMhtmr3ER8vAnM8bgZYD1UwWevgLNAsL9IuMmv84SobZL0bwIRb4QQzBsgOo9e1bTUt+nE0TPRfYumV6gBNADz/c3H2E0YzEzBUtUBzQUm/3LjrL4q0KoOFf4zSwZWxbc338fltHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cb0frJ8AxbUSv7H2ltdN6AqKZLI+5mb8RQngUp+mi9U=;
 b=XJvQ1Q9EVWHJwx0B3T/imn3GySQEINevRoVMELNTS9BZEfYZNXnX9pUPODZcOQBjX5WA+DzDLmexu0MgKZDwaOAt3U5KMWbvSqWFjzve2DhBltfesP5jitcFIpT9E7VsrVYPiDUN0IB6sUejiYyU4sBrFhe3oPi9f19LpTBqGjU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7330.namprd10.prod.outlook.com (2603:10b6:610:12f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 17:23:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 17:23:33 +0000
Date: Wed, 6 Aug 2025 18:23:30 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com,
        syzbot+57bcc752f0df8bb1365c@syzkaller.appspotmail.com
Subject: Re: [PATCH mm-hotfixes-unstable] mm: Pass page directly instead of
 using folio_page
Message-ID: <a954da55-b223-4e55-876e-865a842e4a01@lucifer.local>
References: <20250806145611.3962-1-dev.jain@arm.com>
 <acee52bf-4f19-4e85-8d69-15d6cda54e95@lucifer.local>
 <78922f87-dc5c-4652-a5c3-869d1bca1d88@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78922f87-dc5c-4652-a5c3-869d1bca1d88@arm.com>
X-ClientProxiedBy: LO0P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: fcef7d67-f353-4e55-2d21-08ddd50df809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FjkFZoGhGzvq4/NqI8JV/9F+IQdcA5vSA8krl4vDTLEbrlFi/Vy+mLAubOdH?=
 =?us-ascii?Q?LspDGu0J+VBcnhdU3o6PW3JLLom5JFztgBNUXy4GEXd+EQ4H07P44iQye8hr?=
 =?us-ascii?Q?hLKkzX28iB4aEJCs+CCCnQeZxZ+6sAUPB+1zK4LJvjBtM8ANToXCyuyMIfnU?=
 =?us-ascii?Q?VX6ihV2x3QCwU5DEsKAlQI9WqhTQosY21mv6ELjv4IiwqI7Ui3XuI5j1TP4F?=
 =?us-ascii?Q?dM9ttzkbDIW3pZ6wYlWCk4ULWGMtoQc6/WFizpZaZklejZ+3608qHDjbwMRk?=
 =?us-ascii?Q?G+HVAVS8Kypcrc2tNtvBJS7c+BD+5C59C1GHInS2SHnlR6eTxJdOluJEjGoU?=
 =?us-ascii?Q?7VZvd3nlY66dUV+YcYuYJ74+95c99YKifhzR7Ck1FqQMfUqZaFeI/yNUUBoY?=
 =?us-ascii?Q?vybHbUCWY/wxlsz3CCN/Evlz2D1XZOX6DMUYwEb1+et5yoYd16ZLA/Pht2hX?=
 =?us-ascii?Q?JqtzDt/Ezu/CWE7QncKBEM2P6c5BB8O2SCeHUlm2y+8nghd8BX5rl6q0MKZy?=
 =?us-ascii?Q?sOIzgxh5gxmLnXC+wHijzCMdYvdKFfCQPToO71QD3Dr1vT/x3l17VaBS53eG?=
 =?us-ascii?Q?l6/P6VOVtXuucm0/z/hcadP4SOi8ypgHHV3rdHtiNRGm5McYB75TrrwSC9EO?=
 =?us-ascii?Q?SCijJ8RuUUjDaq/4e7gMf/m2fPPIVMQlEAeObjgCHcx/0Ji4kVjUSaPn2Lgf?=
 =?us-ascii?Q?zVH0UO2wiVDN/M8euSsefDmChB5tXq/R0fBf23CvFJYU73949wih9iTNK/1j?=
 =?us-ascii?Q?PvrFlBTVVdgWfP5bMfcaKd2hhko9fO8new6uDlyl+/q7yYDGHp5ejQdnx1n8?=
 =?us-ascii?Q?xgCjlxITFYnZtgPaPOyIzb0MCsjKgdW0WGXpY33CbAc36Wy9T2WAVIOlT242?=
 =?us-ascii?Q?/nktJVN+kGYwTHZE9/5vj1sduAyKUrs/r4CM5XKOc2WWAhqWm+rgR6fEOlJ7?=
 =?us-ascii?Q?XeQwtuWO3z3epMSJzWWokJrVcJwyfUKlVUaNKmyKEFieQ8/Vi/7KIpobedje?=
 =?us-ascii?Q?JANyE2t7khV628iZ1bq9HNFxccnDH/wv+DyPSrgNoX2bIFaMZ//VAzTgmdSE?=
 =?us-ascii?Q?v61LPxFVXrl6xXIoIyfyyUmKm7lmxB9KlqzJtgWDa6kCWcCJCW4hgAKGikG/?=
 =?us-ascii?Q?Z0TohWLblfD+P9s00SBuYAXwYj/xry3YBOQyNMvSn4XwoWaWjyUEzelnYnwc?=
 =?us-ascii?Q?8S9D0tiyAoWG7A6Vp4Yyws4CpyFhcEHLJbIQAr/ApuiMo1Lx1FOm9qW6jPNJ?=
 =?us-ascii?Q?t9isfbA0mshZAxJfS0eidS8RXlpCl1rtk83+T9v1YgiF6Ybad1aolk/qO8oD?=
 =?us-ascii?Q?hqVNKmACXolfLdrcB5XxbCeBARaQb+neooPFiinpjPSd76kY0TfizVHNf6PY?=
 =?us-ascii?Q?YDHBMR9o1KDmmAiUy8LiGTcJiSxgQNF0JO3gUUrAne/G5yXivZrvMGce9hxO?=
 =?us-ascii?Q?n5RKTHvHZxI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dLz0td+1cO72k3RXki24XpOo1N76rHhuQ5dBglPz8wDMQ13oscsED7scIPa5?=
 =?us-ascii?Q?P29oiM0ZFKTsT9Tuc8gBuwoXUvQTNMcbUNOAxT/MXt/DWgruSaChKAZOwm7E?=
 =?us-ascii?Q?Gcp7Mw6FM8YHDUJ1tIbYLx1pV2r81E3gJXoVcfDds2JPkpkt2+NwoKFyoYhK?=
 =?us-ascii?Q?E7Ac5/p5YnMRVUDGuZBKPuMTzQYHV8I4OzDg3P1yo/0AN9dk4FuJ5mDbR6FD?=
 =?us-ascii?Q?t1dUGnEeHRMqdKJ2SWj+MoX/7cUIgBkw0D35C/v/Iz9wYgngEgjvWV4SKn69?=
 =?us-ascii?Q?leK2MJd0OdVq9zNx6CH28Ja74JCZLbAooGDLw5+I2RUwR/tIX5c/g5RjssrQ?=
 =?us-ascii?Q?nlY5WNPOSs7TF89W9WP2sw+eW9baHx+GZ3MaUk0LJ4rh3oEUkugXN40y7fTo?=
 =?us-ascii?Q?nKBwvGL9WCpbZ40evBQDIrJRDJAvAn2/PW5q3yraEFyKpFsOgc/0jrYTO6xI?=
 =?us-ascii?Q?QtE0MkZ891ZtmSY/m92lho4WyUWiLtU5uREU5y2D4j+VeB22LMzbCMcsJz7N?=
 =?us-ascii?Q?zV1yQyAwZJnHcQDYrH6LxUXj7oKDTVTJz1Iw4YNn1Bi429MjYYr04A7Brt67?=
 =?us-ascii?Q?2FsTm6YS3uddn26Y4eGWEXjJOnKmRHMxemTW/489QjxM+eBCT9CqGLpYPrz9?=
 =?us-ascii?Q?UwjfLFT9Jf4DCRvElK48UKgWGq91zBQZMpQREakXe0O2K+OwSsrHRqLbHieq?=
 =?us-ascii?Q?3lHCuM4+zW59e3Wzh8G0v0O3YdoN0kcPWTLOMGsY2C8YweauMEYAGo49R6aP?=
 =?us-ascii?Q?eIeJrMff710q5nkT6lhGKxXiOiOcX5xNPlbgHF/EDoEugF7LOgCwTRqK+9Zb?=
 =?us-ascii?Q?oBUvlQm0030RLBUrNH87Zi5mr7PWNZ4gltjZmHMVh3OeBzI5hdOGUPutAkMg?=
 =?us-ascii?Q?zaIEXXMDkRK3LYqvtk2G5JNMKS1pwuG8GzUuY8c/f+B2TeZPF8+iyQsSMYXC?=
 =?us-ascii?Q?9sLFM9SvJHYsWhDQkthFRKsGvwFL2vx8/hvY5xXCHVXoFaTO4vVbQCD1Gbsr?=
 =?us-ascii?Q?OkzdyC+okjt+v5Lp7WYADm+rzDdGosOb/NFs1OVbmni0IlJ5+EyDljLruDFf?=
 =?us-ascii?Q?PrOxlTeZLEpGwMHnLcjWyRTveX0LcGDoU588xrdtynMxqDC6G5NXUWTaSz8e?=
 =?us-ascii?Q?2Dv4Z8QqfaidK4gDrEz1n/qXbM4xHFwuzLnNloS06WRDq2MQfZbO7INGeQKz?=
 =?us-ascii?Q?Pav+hipSnzSYlUErfYtX0Fp+mKuxDFSbywM4RmiagpdyyffCOAPFqJRU8lmq?=
 =?us-ascii?Q?9QBzKvic/t2jnTw6t4yRsDmQbz0U0oIOTrRUIc64W5PN9dZLSAOXVlraBK2v?=
 =?us-ascii?Q?+NZlJjI/mR3F8RYXSJN4K5Xx8lNAC/jpvLY6tWIvEjUtNXYiPquZR/oR64nS?=
 =?us-ascii?Q?fC4bE7TgO2yTeCNry0t1tu1XBsjbybwAo5CE7/1EL4pP89DbWb9jUkloryQe?=
 =?us-ascii?Q?iKJ+FdcrxekX7h6iwyGDui1VHvRovQU9QvENS9TbVVH/B1+DneK3h34mF/G8?=
 =?us-ascii?Q?eROSocckA6zFZe4DhBy+Z/hO4uOVq3GwcQLZ5HYG58HU95fq7BBnDDsW015g?=
 =?us-ascii?Q?gcezyuUd9JU1mE86sGLB31k/pFlv5IbDSt7/yZ9/3z+ZnxBuWEmXIj3rsnvz?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: K08IToAynGhCyY0TI1cKnHQnkUNeT0s/7unnlGnQVfgCGCVuD6UKTXJl/ncYHkyZ1Sg/Tzf28OLyqFW2mW32q0s9nfI/GOPrYA+ZUenA5LzUQfMw2SdRLjmmP5/RpExkBKcXWX7nvyB1A5VKBsIfVhIn2Dkx5H20/XYz2hXQmQsBOInPcg2A+tgeFwUdwMVa35D+EKhKAKGA3jrpt0XoQWgOIewYhAkAenq46SRKNPugUWOUD5MlTvra5urOzXKomW9fHkscSFWBv6+DXk3hQJ3otOAVeo5opKpI/Epua0JvUrC1OUw6Tp09c/Es20/Pkx8bYmWwsxGrUdff88R2vLB6yfiO1LLTc5perfJptzDy4FF1OMSw9D2wl6bLlbKzNpRhNPgWNEnbK/TOM35vpMFU9EbMNDWHl3PLE3llYVybikSP2jGQSn5XNjPmVqTj/DO8y5SrPu8Qh3FQSK1lEURxAEAvYtV9tY1sk1NlZ1Fx/HvWCLDacvsSlslhpJHb50POedwYk64aGwLoz3enpr5dOmi7i3G6xdFeWecJMZyjbdnU2jnz3DebANEN0/MEK6C3RfuWrobpwbqbpQAZQnEafqOM6olHTuI8dTo/WNU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcef7d67-f353-4e55-2d21-08ddd50df809
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 17:23:32.9820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHTdaGUBip8FATuShph9v+uoq3AStykh2tlswzcnX8WcGxe/+W5hj5W01Ca+ejdntwWCS+EHbZGyT7EGGoVzaJQgUElC8sQTP11iPFBJ4No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7330
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060113
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDExMiBTYWx0ZWRfX0tgujGKJtAk6
 0fILYx0hynuwAsaJlJ/sfSFnPF1nUHxEy5XqFD0YLt5kZTG2LWKkouzBb9oBsfgiuqbyu7JDH0V
 zGb4ZVPtNqWoRK6mzoJiLbjF72IDim2Uu8Of6XCC206BD/sykmUYtznnBCs7isdbLHeiOX6yj/q
 qThf1CPluQZ9enapvaXJe5JJVWHozXVTzI0PlH/+QIN6dwjW3F7wL3aWid6oOliqw9RgG+s4oBK
 gwP42LZIg8kg0Ya30wEAMWspdwD3mWmabWJIRVQ8Aiil3zWfUAvQnixqgc8LPGUQf5S2O2Z3nDZ
 C5wtLLfgi1Tz+XrrbP7wsgpH6ERr+MxfHodiu703X+06Vfy7Dl18tH9gLFEendBdpr9tTLUyv3l
 hQi/5nMGx+nYml01XsndDNtDVoYZQPPK8m1xggWI1d81wTscxZiGLswWE4K1+IeQ8Qqt7VIW
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=68938f98 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=hSkVLCK3AAAA:8 a=7CQSdrXTAAAA:8
 a=yPCof4ZbAAAA:8 a=9KwJ4gaBJbOfb7WTA1sA:9 a=CjuIK1q_8ugA:10
 a=cQPPKAXgyycSBL8etih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: xsIa55h5kiKlpmOjYWywJ0YOsqaV3sR5
X-Proofpoint-GUID: xsIa55h5kiKlpmOjYWywJ0YOsqaV3sR5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_182408_062292_FB4B465E 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, Aug 06, 2025 at 10:49:46PM +0530, Dev Jain wrote:
>
> On 06/08/25 10:10 pm, Lorenzo Stoakes wrote:
> > On Wed, Aug 06, 2025 at 08:26:11PM +0530, Dev Jain wrote:
> > > In commit_anon_folio_batch(), we iterate over all pages pointed to by the
> > > PTE batch. Therefore we need to know the first page of the batch;
> > > currently we derive that via folio_page(folio, 0), but, that takes us
> > > to the first (head) page of the folio instead - our PTE batch may lie
> > > in the middle of the folio, leading to incorrectness.
> > >
> > > Bite the bullet and throw away the micro-optimization of reusing the
> > > folio in favour of code simplicity. Derive the page and the folio in
> > > change_pte_range, and pass the page too to commit_anon_folio_batch to
> > > fix the aforementioned issue.
> > >
> > > Reported-by: syzbot+57bcc752f0df8bb1365c@syzkaller.appspotmail.com
> > > Fixes: cac1db8c3aad ("mm: optimize mprotect() by PTE batching")
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > This looks reasonable, fixes the problem and compiles/works on my machine so:
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Thanks.
>
> >
> > This badly needs refactoring as 13 parameters being passed to a function is
>
> Which function are you talking about?

Misread, 9, but it's still silly. mprotect in general needs rework. I may submit
a patch for this at some point...

Anyway let's just get this hotfix in asap.

>
> > ridiculous, but we can do that later.
> >
> > Let's get this in as a hotfix asap.

