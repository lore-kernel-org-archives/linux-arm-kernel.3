Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117CDCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUJtsokT7Bbjx3xhOtgLfkoXi7x2vZHzPk2iRHlJAzY=; b=q21G8WSPrLqZsfD+MmwQEd1qte
	Wvujn5Bmu9LZ22xAko3avaMjM9je3RoySntDnICcgXr5iEl/DjUxG4sHS/yOJD9De05yKEoEfWHEO
	daO+Xex7TDLaNj2QDin6pZ6QV3d+jEocpL7Y2d51+fayrncfPGnxbwXxt7VL16vIYv9kboXkWFjNf
	Q+BUQ9YnvzYkN54mTMvcqYHIjGfeLac2RA5iNZTmBXziCRscf1AkwCgqLqK9HnAlH/1g8dIM9Lckq
	oBvwRuz1QUxoatuOqUbPkOuCSqisSoyYfI6j5R7UT1h6dCcubOn4P1UYM5GbSQ8AyqOGKQaArGFtd
	YyG7eMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWV46-000000033ix-0cYz;
	Mon, 08 Jun 2026 08:10:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWV43-000000033iS-3alZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 08 Jun 2026 08:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HUJtsokT7Bbjx3xhOtgLfkoXi7x2vZHzPk2iRHlJAzY=; b=oQeSorDckkHYbQ/PtnIu+PUAwI
	JMHrHq+n9CXiWtLCGQ2/5VkG3qTe9udyypcjGIoBCQDdgObgQGtARRLfExwWzumD2evaS1hMrUWaQ
	TsNT7aqOjW9rpbT3tJqNKk7Xgh1wtYOu7+/AD1w7gWTxmMxAvglCIvAtRslrjYyLR4ezwpfNi6fo7
	OeZDOvkPnrxznRj+L5iM+ocF/6LKyaS3Rqzgn27551U+r1xxjsx5ek49bQBeGnBFf/O+chygr0nI7
	eFjMuFSxkGZ7d0Fwzjta2N4H2nmRkpOdkebbMRjPjsYJhdNTyJO5piDGvMdaEazmppEt/orG8mbHw
	/u8BqXGw==;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWV3z-00000000h6g-3TQJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:10:30 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657MX2MH2061148;
	Mon, 8 Jun 2026 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=HUJtsokT7Bbjx3xhOtgLfkoXi7x2vZHzPk2iRHlJAzY=; b=
	rE82gfuIhDnZMVoASB59vth0oBvN6yaYyLbaBjamVBe898PC6rrNxtClhVQut/QL
	2/A7nLT/q8VYDtj6Tloiqn/l3LaPt5WrhGZG4VFKcngWGJrfY+vN15jHMmRqfie+
	OoVJ+y4cefFajl9YDgjz3IZwspb5kybDBYxHQ789EzGzRKfQ3FQI4LQ5M1y5bwVq
	ftW9ag98DGDpkLS6sl7n6xXl2hxX/VVhjErRGCX0Lim0EdNybvj+f1b7HMHebN1d
	iSjzkQfW3slXg2hVmJZIfwJopiakfQrSUxXTOQGkQ34LyPgmxAILpvUFBazGYQ7a
	22WkMfEi7ql+YrZ4bHjaGA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4embkja0s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 08:04:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6587wTRL005943;
	Mon, 8 Jun 2026 08:04:53 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0ngg65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 08:04:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhN+qkLJwFf6O9C337Wk9Z/K310hJWNvhLzEQS6Jewub0H5g8JeWgVTSbP9YKO7FptdHNpZEGYYEYFkuuDsGEqLxYx0sJZD/+yGlPQBD/cIBwLeO0GXjDyruBt8rk7wuuLJc44F0EHDLHTz+AuUQ+kFuU8KF5NjMagPN1xcylLGhR4xy8M8AFktFnTXm/RYjuLSlAMIw1YPgJjNjF4qtfkhRP14tuyly+5QV4Abz1+TNUsJ85K9cXvw+I3ifiu19JlBCi3mrHyIERoOy7mgS6s+OfZZxJhMPcsLzfstzrgWxObKqssgXJ7ns8h63yJoSg2upCwpyTC+dsKz77q5G3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUJtsokT7Bbjx3xhOtgLfkoXi7x2vZHzPk2iRHlJAzY=;
 b=yy6FfhEvXcKcgsXda46tIyU4RqJ1+hI5NS/Ggm1lbe1j9MV2ETdX5i/P2s73d0t4XzgIitRBJOUVypc+DgcUnQegAQZbHEvNUw8FB3F6VgXrseKklQPM0QU+G56jC+a2yI3xuWnYSxUjIZ4Jb/Q00we6+fJZvH2K7ex+XFYPLUDDu8JyHcqUO3daS1c1D8slcG04HKckSauua5KfnjhH8Ke3LeJVrX4PTbIr2XKbWU4dFpMjkHrA528IrFke5LPZTkS/YxjdLZ5qat17QVOW89NeBfcwpBFjYmJtFErpaxkQpNYDO8Q/xECpzX/kyZcyDAU9zFvzU8uI86GhZaAq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUJtsokT7Bbjx3xhOtgLfkoXi7x2vZHzPk2iRHlJAzY=;
 b=Hsj6AJr0tGkKKJzQlJm2dkcU79KTYnBkig3Egq9KLeSiAyv0m8m8+LED2v8ViYW2HcXFaQu3Vlyd2/FHzW/LrbqHIvMn8F8sXqWoH+g8DpwjZ01oRehpCOMD45NVjzSqT/D3Tt4Pv/LAwM01yFZgjFkGWgUkCM5v//6Apke75Qs=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA6PR10MB8133.namprd10.prod.outlook.com (2603:10b6:806:436::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 08:04:50 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 08:04:50 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        bpf@vger.kernel.org
Cc: arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org,
        peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com,
        harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
        xueshuai@linux.alibaba.com, rdunlap@infradead.org,
        david.laight.linux@gmail.com, broonie@kernel.org,
        joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ashok.bhat@arm.com,
        Ankur Arora <ankur.a.arora@oracle.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Christoph Lameter <cl@linux.com>
Subject: [PATCH v12 03/15] arm64/delay: move some constants out to a separate header
Date: Mon,  8 Jun 2026 01:04:28 -0700
Message-Id: <20260608080440.127491-4-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20260608080440.127491-1-ankur.a.arora@oracle.com>
References: <20260608080440.127491-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:303:b4::32) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA6PR10MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a01c00-a9da-4c9e-92b6-08dec5349d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 8Pd9MvUog/5yFge43waUnZXZzmjBzNQ/a/mxt//hZbLK1FHz0JkUG9vQ7wa8SkO/uC06sxxmn0vpNiXOPky+lkxyuUKCDqTKNtiif0Zc7uXGKnSKd9XoYE8PiZ0O61N619Ycd1ukISTte74hzG+2k1r5w9jkeovECfZW5BGMxrgMVEjSPtePdI2zHOvat/T+Ijd7H3XnO03cJCVSA+3nk0MH56R0+sPMCb+EGpPsXUptkyDcancDEaHrHpFuYBQe79StvscMOB4cH1wn9URqjW1Dan+4eGC4HeoWChhA2eqs4cyFvfGqXv4dOlwytVbbf/jw6zjxEVKs+9WyRHcar2bssAscLLxgmLLH5OS0u7viTv+GJ+QAWgJm6tFT0iIPpwaSFI137JCmFfBZ8M82a79IpY2RfTsjxWzBA/Okbnogy4WEhXOGb4JQ1mR16LzLKoScRTGmS81VkPGGsWS6/hvHBpu1RlGPPluKul/MukakMJ6BdLZPDpKr8gru/2oq6nnKA+BqFSC2OAXFoB/w4E67nT7Lbwy1X0gC7skebMAlaNeWGeJikY4e67PEg8HXRqI2vGvm49D+iUIr2RybzLoCDvhLL6nEsUTLw4cvLH3Yx6ZPMPLTPWajVRzeE4Y3nH01wGWmE7uzJRqGHAOtGCsAivfOGR9Ou5nHrA0BakNcqtIZ9jAyqsskOhjnEd4r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xDGKKaSjIOeGoGgRchNygyIdVxm565v8P4ps4PZJ4zaQsfZif8EZ00BzCbfx?=
 =?us-ascii?Q?NRZqqNxBtncGPQ1iasKSrWRPeWRZEIFf+VTR+PQt9qnp96QZ30HThtY8QVgp?=
 =?us-ascii?Q?6X6chJrYfecjSA+4xngVHztwX2B1gfHm4+vlOLq5VmVzUzQd7vZ3INOGrARl?=
 =?us-ascii?Q?E0UsgRd1/bCj4FQsEak0H2gfF0v+SdN9wiMMVvyOkeBKA2rvE7GuUMxdj025?=
 =?us-ascii?Q?pRxEAyPse6gvISxwZurnFGbAZfV2Ew2zy+zRs/RAKxeY8UGeJX6MlCamM8ag?=
 =?us-ascii?Q?NtDswgLuagbAyHZcGITsuNjbjKpMS0rYIEjvW9k7+D+rB70SkllHazacA3vl?=
 =?us-ascii?Q?nmKxiRQ9tsWR/wHjlj1zCbOtxd8gPVIeFhD4ngPgO+V0X9RGqELPXDxiaynG?=
 =?us-ascii?Q?Pi2II6ZrccbG3xSjuPis4EeCnfZlW56YPypzxLq9Fa+8k0dTxitBmg5xb287?=
 =?us-ascii?Q?duns2B9snwhcdVOQNbMGctagoLnA8YFnU9AhcZUzPd7/GeBb5auwFcz/1V/s?=
 =?us-ascii?Q?NPkdNfVjuhWn4Emk/M2sKOovwHVMrjiSGj/L9Yst2PMkznj3bbrah0xFlBtr?=
 =?us-ascii?Q?YfPEOe+1Vo7AaojPR9MyQG8qj1Z/rfKB5m6Ro5llwBE6tOw5mDWhN1jnEozx?=
 =?us-ascii?Q?8U3/iTTjmPD7x3wEoVVOj6sr0t+10vEuSR56Cy6DBgWOj74WpBtQhA+mnW1j?=
 =?us-ascii?Q?ImIMVcBv+o1WFcGQDyW9BBRb0vs4QZc6TAvggQLiVljzZsVB9oHNAtgw2gFA?=
 =?us-ascii?Q?13Wo6BeXTg5IDeXDzDLg4+bm5sTn1suEXlm+to5bgAzdVgiAYfrXyyRWQPm0?=
 =?us-ascii?Q?6+udc4IacCBHZ16vAorWbPppI1pYjvno7QhM5MNkRDi9uHGxwI4R7k5GbUl1?=
 =?us-ascii?Q?GExUcSa5mtWcXMSfXvg9oNg1PZbX2xHCNfI1avRdHyDLUXCzShc6YEfgzsoC?=
 =?us-ascii?Q?Q0Sm/uWjrCIvWR4NPE9yhTOVxwtjin2gmQqiTckilH/h9rWZhZlNH98WDOpb?=
 =?us-ascii?Q?DEX+3I8MWjP9fkeHeC7Q0UTGSeW3PrCwezNGOz9eEU7C1o1Opa9malrdV/fo?=
 =?us-ascii?Q?UQztBbpfXduEuYL2qhLfSuw6Khs6J1pPBn36KD7Dh/ifgzo543h0SG0nIiQ8?=
 =?us-ascii?Q?mOn3/gmwWqH6o1mh5EWsbHdTQ4ddXu6PvX+3sOiIgjZ3kNSuHGERLdH64qqn?=
 =?us-ascii?Q?TkDLcd70tXmq7r6IhH0b/iqOHhgCxUM7aPyOAM7BFgDfK1hsby1O97XYEAw2?=
 =?us-ascii?Q?XG4YDWh4GUHRUTGuRnq6953Q3n/LjUysAGkCSFIGiQVSgLfIYjneyUFpeAVY?=
 =?us-ascii?Q?8GzaHgVpMMuPpNGhFfA0KDaYDdUi0De6EG3G5evSykX3M2yXxmtQgytPoNk8?=
 =?us-ascii?Q?fC8Jpa+6oOSOMz/9STuFeGELqFQzR1uUmWwXFEN1p06g+67iAfKTJItuyahz?=
 =?us-ascii?Q?+n62h8SaU8fMCtgIZiQMP8vZbw+A/XaQRFJksLwjhxI98F8hLwLToWOnQSmO?=
 =?us-ascii?Q?GavAnWtg4uvznMtZtASsOCjS3E+Ot4HuOZvB9H6gjME4j4EplUkBEOCZT77N?=
 =?us-ascii?Q?d2fH8yCj5aipso7uQvn12xgVPrb1JPxPyezVpFuVVdsba13uZJ1wdXT1MmoA?=
 =?us-ascii?Q?3IBf+hj5ymkJFYSiNEHtBEtnYHD/mowgxt6Ju5ksTGlQvFL6t2z6CivzP7GU?=
 =?us-ascii?Q?ADdrt7ZtVcV2shK4NqmUiLlXbwEwQOawOWm7gYpYGv+bM2wgFXVKE9vWCxz2?=
 =?us-ascii?Q?QAy9gz4boA=3D=3D?=
X-Exchange-RoutingPolicyChecked: UGEiygWotdQyUCy0QB1HsIwkSKNzfCVQXguCf1j+GEbnrSzOyOe2RR5VnOqwzh21SI5KrfLPOMpIAzh28zGBkCo9DSOzkZ6u9aY8L03R2zM678jamF1ST3MF+CseiSQmm0x4QP9hbzToUgaxJGsg4T11LOUdOWoYAVtJEraWhKWy9waJgwqHnNSVyhs8P6YNxjTsvk40LADzI3tMrA8gEttQ18rTtFZCraUOGaVMeJ++S8MH7n72yKw6OjOJjVQKni+wK8yb4dsiXg7fySKu5tM2DyLtUr2eDFssomsBwPnIUTescxRoJoZoXD/xsgemgWpLR6+EKIYeiw86yWbpiA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: gYUCKmCzCc+chtR/cSgMonh3/NeIa3Yc+PwGcOH26oyGJe3/URJA2Ts9+qsPLzWPW0bSsN/nczYsXCNuq9nGZUs3CF561Z1zmgMt7ZoZ68PTOFipHFp7B93ru6NXTCG++vrSk/cmX/tOLZViQ02LpbrwdIywg/femVHO8wpU850vfFjaQwUaiZFlNqPwNSfKich/xXee6GOJwPG3tKJE8zIjxRw5eKqXmPP8bQHxW3Bgghxc1yTUDlVNajz7qoQvnPP2iJE5oqqdSYWAT6DjUF6tLuU5X9e851PyWogxg76H3EKGQaCpPkjq+UzxPBEtcy7nMOhxH+vosH+fTfTgoLhVQq132qs4ufOBiYVxM+6OGVW9FMcj7oz+agUSuMApTgX3szf3JN6RYTqHeRq8RV99Y0r8aWZyYV0+zyrjbbkE0CHFZJs4rbUy5AVC07QJNplwFQO/LAZL5h/5DiGWiORg/x80Dsw+55YD2zh8qKudiHgfBsw37p9T3lM942aY/Q/78iUEP3l/iEbKyHsuwddY0fBhuDwRyWgIK2CV/25g5TgYYwZaM3ipawAiUhIfEhguUUT2r2rnO96CATqcUwUDgcosB2AboGd28V/F1YM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a01c00-a9da-4c9e-92b6-08dec5349d7e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 08:04:50.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFq0+WBeU0kvBSIf2xPaEG/jdFwCu33Et4JazWyO85Y0ylm6hmm0lq4fbdktEfMgBDWZDB5Sxxj3UKBoRtRRf/R9DlDUFn6Z3FJhBcxCc1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8133
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2606080073
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NCBTYWx0ZWRfX4HbU/GjXBnZ0
 6TU5JlOoYVj52cnzqtRzuaPct+gMlcfirZ0hHDOZ5+ZXxXwSwyYMizHThkYc3gz1rJJ5Y32GNGu
 I1bIKGr3Fm6bly4vrmIeB9OomhAR6TSTaq0Sc5nWRxiFHlBh+ufyYT8z8/DoLRlqbM9MNSy32J0
 iBk/0zhi+kLqmmAVJlVOmTJFI7Woq3Gf0Su9SJIrfgqAnYTeiVa7GKHF71539KRIkiY4mF/q2ik
 qymvC12JqATNxy8FGx+nqLBovSa5WNDdiqmdfubBZWULU7nxOmhZdoBN5RLMLXLIQHUxTf+DQ1Q
 xUYGRm0UHSybCA/zOhnJgKapr0svlhYeXCxxwr2BPnXupOh2AccfQpLShCWTlsKqUeCVdLms/hz
 wVKvlQPJ1gN6medBomwhkzp4U6s0qjYYw524A/DTlfUXgVCOSArap0XT7bGzkIZ9lGLZfaFaM6Y
 EzPDQxf6WsWM/T/AbnHlBDBdqRlQgDFnpXIBK6kU=
X-Authority-Analysis: v=2.4 cv=ROSD2Yi+ c=1 sm=1 tr=0 ts=6a2677a6 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=NufY4J3AAAAA:8 a=yPCof4ZbAAAA:8 a=gQgDrPkycQ706KZxoKkA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22 a=TPcZfFuj8SYsoCJAFAiX:22
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13723
X-Proofpoint-GUID: ZU9nTXKRnrgzCWRDx0qDMwqhWsyrmftV
X-Proofpoint-ORIG-GUID: ZU9nTXKRnrgzCWRDx0qDMwqhWsyrmftV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_091028_472190_17B58CEF 
X-CRM114-Status: GOOD (  17.92  )
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

Moves some constants and functions related to xloops, cycles computation
out to a new header. Also make __delay_cycles() available outside of
arch/arm64/lib/delay.c.

Rename some macros in qcom/rpmh-rsc.c which were occupying the same
namespace.

No functional change.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Reviewed-by: Christoph Lameter <cl@linux.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---

Notes:
  - include <linux/types.h> (flagged by sashiko)
---
 arch/arm64/include/asm/delay-const.h | 28 ++++++++++++++++++++++++++++
 arch/arm64/lib/delay.c               | 15 ++++-----------
 drivers/soc/qcom/rpmh-rsc.c          |  8 ++++----
 3 files changed, 36 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/include/asm/delay-const.h

diff --git a/arch/arm64/include/asm/delay-const.h b/arch/arm64/include/asm/delay-const.h
new file mode 100644
index 000000000000..2a5acfb7bff1
--- /dev/null
+++ b/arch/arm64/include/asm/delay-const.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_DELAY_CONST_H
+#define _ASM_DELAY_CONST_H
+
+#include <linux/types.h>
+#include <asm/param.h>	/* For HZ */
+
+/* 2**32 / 1000000 (rounded up) */
+#define __usecs_to_xloops_mult	0x10C7UL
+
+/* 2**32 / 1000000000 (rounded up) */
+#define __nsecs_to_xloops_mult	0x5UL
+
+extern unsigned long loops_per_jiffy;
+static inline unsigned long xloops_to_cycles(unsigned long xloops)
+{
+	return (xloops * loops_per_jiffy * HZ) >> 32;
+}
+
+#define USECS_TO_CYCLES(time_usecs) \
+	xloops_to_cycles((time_usecs) * __usecs_to_xloops_mult)
+
+#define NSECS_TO_CYCLES(time_nsecs) \
+	xloops_to_cycles((time_nsecs) * __nsecs_to_xloops_mult)
+
+u64 notrace __delay_cycles(void);
+
+#endif	/* _ASM_DELAY_CONST_H */
diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a..c660a7ea26dd 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -12,17 +12,10 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/timex.h>
+#include <asm/delay-const.h>
 
 #include <clocksource/arm_arch_timer.h>
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(unsigned long xloops)
-{
-	return (xloops * loops_per_jiffy * HZ) >> 32;
-}
-
 /*
  * Force the use of CNTVCT_EL0 in order to have the same base as WFxT.
  * This avoids some annoying issues when CNTVOFF_EL2 is not reset 0 on a
@@ -32,7 +25,7 @@ static inline unsigned long xloops_to_cycles(unsigned long xloops)
  * Note that userspace cannot change the offset behind our back either,
  * as the vcpu mutex is held as long as KVM_RUN is in progress.
  */
-static cycles_t notrace __delay_cycles(void)
+u64 notrace __delay_cycles(void)
 {
 	guard(preempt_notrace)();
 	return __arch_counter_get_cntvct_stable();
@@ -73,12 +66,12 @@ EXPORT_SYMBOL(__const_udelay);
 
 void __udelay(unsigned long usecs)
 {
-	__const_udelay(usecs * 0x10C7UL); /* 2**32 / 1000000 (rounded up) */
+	__const_udelay(usecs * __usecs_to_xloops_mult);
 }
 EXPORT_SYMBOL(__udelay);
 
 void __ndelay(unsigned long nsecs)
 {
-	__const_udelay(nsecs * 0x5UL); /* 2**32 / 1000000000 (rounded up) */
+	__const_udelay(nsecs * __nsecs_to_xloops_mult);
 }
 EXPORT_SYMBOL(__ndelay);
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c6f7d5c9c493..ad5ec5c0de0a 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -146,10 +146,10 @@ enum {
  *  +---------------------------------------------------+
  */
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
+#define RPMH_USECS_TO_CYCLES(time_usecs)		\
+	rpmh_xloops_to_cycles((time_usecs) * 0x10C7UL)
 
-static inline unsigned long xloops_to_cycles(u64 xloops)
+static inline unsigned long rpmh_xloops_to_cycles(u64 xloops)
 {
 	return (xloops * loops_per_jiffy * HZ) >> 32;
 }
@@ -819,7 +819,7 @@ void rpmh_rsc_write_next_wakeup(struct rsc_drv *drv)
 	wakeup_us = ktime_to_us(wakeup);
 
 	/* Convert the wakeup to arch timer scale */
-	wakeup_cycles = USECS_TO_CYCLES(wakeup_us);
+	wakeup_cycles = RPMH_USECS_TO_CYCLES(wakeup_us);
 	wakeup_cycles += arch_timer_read_counter();
 
 exit:
-- 
2.31.1


