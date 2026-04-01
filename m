Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1F910F6FD7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:Cc:To:From:Subject:Message-Id:Date:Content-Type:
	Content-Transfer-Encoding:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU9pNSkEyFCEfMmb9x+tSzogN4+aIGbrPvpIkkd6HiQ=; b=pu89ZWRWuVgK3z7DCfXppn/aoc
	lTrZaHX4aprPMVk78Jz/kTr99qIxvM2a4lOkAZdX291/oaT48HMg2ByERf3RAtNygCZ4/Y6CvHBaj
	2+ib2pay20ieR+Td/Wpw/NdunB70ZQdYRHMtecO6Lfs2qXx9w+7RL2tOiDMyWaqfc9D5GKmXuaBOc
	h/QDunasFsnXHiwKdgfkoIUF+IQHEb7ygnxMnIlj0te8Ee+ze68NBiaGYONQ3gvQTX8xPCfp2rzyl
	xELIjFe5D8RnDl5c0Op4gugyAb2/1x81c9gbXssyGQV7RP1TGvcTjjldTz554DugZOqgsCyDOL623
	WfP2yCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xMX-0000000FcgL-2AkZ;
	Wed, 01 Apr 2026 15:20:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xMW-0000000Fcfm-0LON;
	Wed, 01 Apr 2026 15:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:References:Cc
	:To:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kU9pNSkEyFCEfMmb9x+tSzogN4+aIGbrPvpIkkd6HiQ=; b=I2o/L9fW0MEzsLbVslKotLSgNz
	R/y97Pbpx0GbfSK8Z01ifmH0XngM88qLbYft3hyqLh5WS9fzz8gtUY91T/LDNkbzahBTHQyvRqMre
	PpLqki5ThDBR6RHEXHahm4taWJenPcb6ox1GcCcJ8YjMbeSoQM4jNCEcZEt8pIC1zPvB+/CkWTT0/
	kn+tcnOmh24iOz32AWVHluOfcuTB55dnVzrzekyxs9Z82ZUOzKSVzi1J5Ds8hJ1VqSYxiWNSrSJk+
	n0kzoNaaNdDuwB4k3ES03G1awG+RiAMhpoZ78fq8YxlGosfv9kXSMGpF6uutFT0FYXVxlHUHaESrH
	hEb/yU/w==;
Received: from mail-ukwestazon11020118.outbound.protection.outlook.com ([52.101.195.118] helo=CWXP265CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xMS-00000000k60-4BPV;
	Wed, 01 Apr 2026 15:20:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuBnE6fSzF73JePcmFRnP7TU8/oyNueuxJKX8EICNi9XvSutU4pWlcEgWNhujzfzho/IQLsBZausdW2BGlE1itOQ4/d+MNB17DAI6iym3s/sOk7dmMRtJTRdV23H7esU9E3VMbg/5YciVJ29MY7VIGVnjZz4At3b0aAfptJLx7g4W1GTrYQh+D3+i349St0j+UBqvP3dAkHB8yFVWXsjr9t0x6DcRZ39VyABSHkr2MikKYZ11/ryrwq8eH64B3C689C/BuDmeXolpc4Go7HKncSR7IL0K4P/JMQWRpZWocn8qZYrD+gmn1EqlK0aEQEK3kgm1584bz7Et9qNMF4Fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kU9pNSkEyFCEfMmb9x+tSzogN4+aIGbrPvpIkkd6HiQ=;
 b=kOYRlRbIrQ5iYJrrsVgrWMufpaNnjJf/Qab62mSIo67kHIHgsSy7x2W7ekt7bueX1a4bNJina4Cln6VF5w3JZxQB3jlFviUevMdeuu7UfeKcFE43Iyj9l40wFe6Ct46NRLfWj79MPYrFCEXK7ROtdi23cAgWoKAApuzXMCzRiu7hR3vCIggfgi4SF1UPs9dSvVuc9cpWN9wPpQBDp8xhpzYZpe8FKbKE1N7F0An7X5pJjNbg9dCH4At5nyt7FtJ2hCz94aUd1NwCqqiYtrTdM/w7OTtIteXmZ2RhR7bDuRkPzOFh4YqSNsRpDHNfjoxvKu9m4pt7s6YG1URZcTFyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU9pNSkEyFCEfMmb9x+tSzogN4+aIGbrPvpIkkd6HiQ=;
 b=lk4/785aByLlNM5MVkiQL2HAXBoFoO6Sr021VLjxRQ3UpOrxZLlAHDMMP2PVbURvTqkquIfMtOzIHWo1s2vTx1b79LhNXV/QTpJEc1CyG85y++BqfnuB6cqex4NxDJnB6FXBFm1vDMc1k9l3YIaqECPYvV4B7uGeCudEb8EaESA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6603.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:20:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:20:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:20:00 +0100
Message-Id: <DHHX4CIURW6F.3MHAW3E4AJY1I@garyguo.net>
Subject: Re: [PATCH 31/33] rust: declare cfi_encoding for lru_status
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 "moderated for non-subscribers" <linux-arm-kernel@lists.infradead.org>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rae
 Moar" <raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-32-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-32-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0527.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 08688cdc-8241-4a6f-eb53-08de90022479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: +64nV6FZLEKmVoc3rTtuM1gFvUJHoL8C+BwCXV3ddq/apgnynC0e8TT/mxtxM6JdjWPcweQ3vF1J9bUfOiNfgrryX9O5Yj6KdkdcafjH2Qvvf7Z8iERBJzadsJ9cxS80Z0ejfRFIeMFc3zu6NIzjxQ/l4bg71voDAa2yoMhDkEqDB5ItesQQScBFQi0EH2UD4jm+uwqTmcab5FpMmXZs5WjkrJtVQmZ/pyB579bJcknxCnF2iqrVj5b22aSLlFmyCOeom+r84skulFuO9tEzPhhq+ueDKXxacYYr/E1LFDoQkhWgOuWkPjiKF2jGHnTrEZQLLA1s2vL2cYo5LVsaxdzR0SeCNZl702DbeM3WaxdgCmE99FHh9AL0OXWkYbjCYOb2Ada5++lxRog7AQ32IMJCdyoNpD8TSwXhlrhyYMrUPQ/hLfQkTPjn8oJwPTmXSmXEizR5rVcUFTzmcOhbw2PvRvHXHxo2HKLXMMZn3QwCCKVvKx1Ap1jg8BSuBtiXiOxeUlN5h2LFDGMvEC7m0qiOE4UvaA+u04sD8hV7XCiSSIxk3EUvk2arSQhV2oRVvt3P+a/2QE5anIvjQAz2QpBoKwaiusq9ZSQAIm4AFaWYxaQ9/OEE2t/zVMe/RzkHOqRNskEuGJGeiwCQp9vTJqIOMr7PuPO34a8s4lAK80vJYLl03QsnOeZcUiCfRPJOPgeIcv2vMHzSKBGXpJNmKLlgfafF9xoHER2OrcIdQFc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUJyeTNFOVlDYzdxTTl3c2xRaVkvbWVPWGd1UGhHVGQ3Vm84MndxbGF6a3J2?=
 =?utf-8?B?bGlncHVWdWN6NFd3K2wvQkJ1ajk4SlErNnJzeUh3SGlFV3p3NEN6UWNPMHAr?=
 =?utf-8?B?TlpZMzFqWU9ReW9yblM2VWVyckhpSmdKM1VtV05kbVBYL0JHVnViUzhuUUk4?=
 =?utf-8?B?M1pnR1ViYTRHTmh4ZVVqRjZUM29XbEYxclpmRTJsejB5WVNweVhaSlF6U0Jl?=
 =?utf-8?B?VjlXTVZDRDJPRGFpbGNNMTkzbjhCMmpCaFdKSXU2RWFFZm1OR1piL3c4MnFH?=
 =?utf-8?B?ZC8vVUI2SmlEUTdBSTZvWWQ2SEt1WnVnMjdUVlZCS2kvUS8ycVpDQnJuVTl4?=
 =?utf-8?B?MDF5d3pXT1lhSTNXanFGbUg5UWZtTHBrOUc1VmdwREpPOW1MV052R1piaHZB?=
 =?utf-8?B?NmhvTGdzKzRpdXhFTitpa25laGd2ajJWR2tnNGtLTytVSFdmZ1lNVVN4ZjQr?=
 =?utf-8?B?Q0FoaHl0K2JSV3daWGZ3U2lMbzNILzQrQ0g1UFpOOEwwOEFQbk9oZm1qN20w?=
 =?utf-8?B?WFNqZktwYk5jL0JhRndWMEk5MzZPY3FKV3VMQXcrTEpiZW1VS3BqRmhVQlFr?=
 =?utf-8?B?WERVcUJubGR6c01Kc2RuQStaVEdBb1hvUnFESmdFM2hWVm8rSFBtdjhXN1ly?=
 =?utf-8?B?VlhoTWk2cmFzTFdLMlF4T05aSmZnRzNVZGpIYWxPWkFzSGswUkZyMWc1YkR4?=
 =?utf-8?B?MG5pSlVpRUptZUsvbE5TbC9xYiswN1NDTE1qQ0ZUT0s0anZ1akhMQTJxZjVT?=
 =?utf-8?B?M1l1QjkrUG1ZTERpSTgxT21reU42T2pjZS9hZkZXbXBaaWplYjhDTVZTOC9J?=
 =?utf-8?B?ZkhrZjcxTVREODNEcXZNZnJBWHpNcklJakE0WUtZeFBCMHlways0U1FiUHFB?=
 =?utf-8?B?UWlQTUFtT0t5M0pDam04U3l4b0plQU9qajkzcWlDaG4rU05OSzEzQ0EyZE9p?=
 =?utf-8?B?b1loY0JuYnJZUkFMaE5DYVo0M1NLcFpXRkRCK1BuZ1RhQmtyWjB6SDJhWFAz?=
 =?utf-8?B?STR1aVRNTUt0NzNZaTRUNDFWc0FPLzhJRitkYnhDV2ZsNXYrZ0tCbWY1dkpO?=
 =?utf-8?B?ZVdGTnNYZUljaWRLNEREWXVVSURNVE50cSt0MW5OVlpIR0R3U0M2YUFuekY3?=
 =?utf-8?B?V200ZFNBdVBUdEh4Zm1QZTRXbS9nU3RDWDZZVm5IUXVsQk5reG5nckd4WHJS?=
 =?utf-8?B?UmNxZnNpLzhqbGFlcU43T1NpTVNWZkxWNFRBZnV5aVlOdW5PeHRKcDM4dXdw?=
 =?utf-8?B?WTRFYlVGa3FSblk1QTAzcTFUNGJnRXpIYkpRWTRXaEx1dGtYczhjZmxKM1pL?=
 =?utf-8?B?TGdPeWRIUk84aHdkWW1EcGc2TkR0NGhnS2hmdWRMYkNtOFhwVi9qSCtVa3B6?=
 =?utf-8?B?TXUyUjJpRThsM0ErSDZJQzJtVlA2U1dBQXJ3VXYwb3A5blFiTTZENTRSbk5O?=
 =?utf-8?B?TGhEOEM4VHdYa01VcE5HWklRb05HS012dG1jZFBZVFFYS2gyQkdHTU1KcnV3?=
 =?utf-8?B?MHJUR0V0RHhnZnV5NmJjcVJaWmFDdjA5ckRxR2ZCTDVPR3BFd1NBVVdOZHB4?=
 =?utf-8?B?am5TSVRDRmsxSXl6NWRwa3VhY3J4L3B1TWJWdklvWGV3Z3hCOG9KbzNGcUVF?=
 =?utf-8?B?MStnYWVycWRLaFg5U0tGUUZ2S3d5VTFZdkVPekw0WmFuVmdNNEdqdWUyditq?=
 =?utf-8?B?bzlyMHBTK3hzdk5lMVNnK2czSXF2b2JXajVSRzgxajZ3N1hxOVdCV2RpTzNO?=
 =?utf-8?B?aXlnT1hjRHN3M1hGbW10YnErZmNpSnhia1c3VEtkMHcyWU9BNEZBMWI1aStx?=
 =?utf-8?B?a2IwUUMwN2MrNHYyUVh3eGo3TmgwSG0xU2w2N2VKR2gwWGZaT2U4WFdVTmF6?=
 =?utf-8?B?MWNVOHFHcnFzd0g3TDdkOUhqVHk0c21jYkk2Mmo0OWU3eit5cTZUTEhVc2Jk?=
 =?utf-8?B?UlFFeHNaenZvck41bkZDSmhJbjhqWEgzQm9paCtpcW1pdmdmekxWZGUrWnFO?=
 =?utf-8?B?T2JuNEg3eSsrVTU3aGtxMDRxQXNRWkZBbGJjV2Z2aE5JREw1UlQyNzhFMXJv?=
 =?utf-8?B?Nm0zUkgzR3prUzY2dzJoVmlmUUJZU0M4dHIrZmVNeGg2R0hnSCt2cXpBU3R6?=
 =?utf-8?B?R3pqTVhJR0M1ejNNb3o5NW5ORGd5VWFPQ01TTkFFY09oSDFZU3g3bDFzWmpQ?=
 =?utf-8?B?L1dJOTYvbzMvYkdlNlNCVll5OWlqOVlxRzE4SWFuSCtZZmpoWFVQbTFvSUhV?=
 =?utf-8?B?UmlyakdvMTJjNE02Rzk2ZUtqNlBMR1BVUE12TEZLMTZjUll5dHhiVTJSUkJM?=
 =?utf-8?B?VjNYMmNwbFFYMlRUQm5XeXMxRmZpVHIvaTdTZGNIYURwdC9sR09Mdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 08688cdc-8241-4a6f-eb53-08de90022479
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:20:01.0220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEyQBBH6y5608rbAIzwULHaoIlj1LNP2+1gaCNHjQbJotNBO9flucwzzP98jGWZLI/EL58uZkRSUQq3MoLXlhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6603
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_162005_124763_FB841210 
X-CRM114-Status: GOOD (  24.37  )
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

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> From: Alice Ryhl <aliceryhl@google.com>
>=20
> By default bindgen will convert 'enum lru_status' into a typedef for an
> integer. For the most part, an integer of the same size as the enum
> results in the correct ABI, but in the specific case of CFI, that is not
> the case. The CFI encoding is supposed to be the same as a struct called
> 'lru_status' rather than the name of the underlying native integer type.
>=20
> To fix this, tell bindgen to generate a newtype and set the CFI type
> explicitly. Note that we need to set the CFI attribute explicitly as
> bindgen is using repr(transparent), which is otherwise identical to the
> inner type for ABI purposes.
>=20
> This allows us to remove the page range helper C function in Binder
> without risking a CFI failure when list_lru_walk calls the provided
> function pointer.
>=20
> The --with-attribute-custom-enum argument requires bindgen v0.71 or
> greater.
>=20
> [ In particular, the feature was added in 0.71.0 [1][2].
>=20
>   In addition, `feature(cfi_encoding)` has been available since
>   Rust 1.71.0 [3].
>=20
>   Link: https://github.com/rust-lang/rust-bindgen/issues/2520 [1]
>   Link: https://github.com/rust-lang/rust-bindgen/pull/2866 [2]
>   Link: https://github.com/rust-lang/rust/pull/105452 [3]
>=20
>     - Miguel ]
>=20
> My testing procedure was to add this to the android17-6.18 branch and
> verify that rust_shrink_free_page is successfully called without crash,
> and verify that it does in fact crash when the cfi_encoding is set to
> other values. Note that I couldn't test this on android16-6.12 as that
> branch uses a bindgen version that is too old.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://patch.msgid.link/20260223-cfi-lru-status-v2-1-89c6448a63a4@=
google.com
> [ Rebased on top of the minimum Rust version bump series which provide
>   the required `bindgen` version. - Miguel ]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/android/binder/Makefile            |  3 +--
>  drivers/android/binder/page_range.rs       |  6 +++---
>  drivers/android/binder/page_range_helper.c | 24 ----------------------
>  drivers/android/binder/page_range_helper.h | 15 --------------
>  rust/bindgen_parameters                    |  4 ++++
>  rust/bindings/bindings_helper.h            |  1 -
>  rust/bindings/lib.rs                       |  1 +
>  rust/uapi/lib.rs                           |  1 +
>  8 files changed, 10 insertions(+), 45 deletions(-)
>  delete mode 100644 drivers/android/binder/page_range_helper.c
>  delete mode 100644 drivers/android/binder/page_range_helper.h


