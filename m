Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098DF10F6FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:From:Subject:Cc:To:Message-Id:Date:Content-Type:
	Content-Transfer-Encoding:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/epdbXMFdVsrIkMTz5VPvg/77n+qUmcD9hca/TXFCKc=; b=R8WmDtquo+7x3W0AeRgDtWadco
	C6sXYEXR2w5VQmaNJFJdHl9Pt8xKV+tpjVKE4t1xf2EqyV+UXHgoEcuTyZ6EUmk5rFmxClMMy6a5N
	KNu6wXZvXmFwxOcKy/uHUUat4Mhkw2lpR3pfxpLP91I/ulmPgFCL0Z1gXAGXtWy3zIqgGGP31wLdV
	HWf37i4svFXf2zLpajT3cfydZZcr8y6d2HiOB08UFB31v74ffsYrL5DgBqV4VPCVcgRbDLCgJfkT0
	d2SlnIhYPgtmG38fYZf2BVZhkpXuCKoyJF7etACbRE9vA6GI607mPv57K6d740PAKYw5SzID+tcfx
	KHXUdWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7x8R-0000000Fa8J-24mj;
	Wed, 01 Apr 2026 15:05:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7x8P-0000000Fa7x-1otk;
	Wed, 01 Apr 2026 15:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:References:
	From:Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/epdbXMFdVsrIkMTz5VPvg/77n+qUmcD9hca/TXFCKc=; b=MEd/2qXOmXf+4giMnoDo6E4BZV
	8/xJ8miB0fJbkWGc0ZZVEMrJF7m2cA6NGNOoyzAHTTIyfXlqmSH+7ChPH0i6Ldbe0wu84pWupog3T
	6RDtylflan7SIu+WmiQCZmpYuqPVph00SvF/9ZmZje0ofXFjLwUVve1zb/D+sViG4qQ6yep8uAhb5
	V3Kryt9UuXdgojtGkkJU2SeeW7q4fXwPuXeoY5MFPVZIaVPKwpPZsvmxmv88qmxIYm1N7VpUtu6lK
	1I6bEvDAyKPsh4INSWesh42iy7i8zT8L5ml2js1md2o4SYet4a32E+OFLhDbgbO5Rnog8gZ4A+5Y3
	9iyomsVw==;
Received: from mail-uksouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c205::3] helo=LO2P265CU024.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7x8L-00000000hi9-2paj;
	Wed, 01 Apr 2026 15:05:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtC7v+l8XDFaqGllLgTUtu7JUGxvgLi0blljg7BaC1NnxV02faGt0C2MO0VkIqF4nr4vY/j2Aa5rXmAfWGOKKrajGgsujjbLvbaAXPqusa5FlPxEh9DfsgM9DNJApGDB7bJQF2EDJ/nBzVaoJShzoLdKIVFBKNcQqYW50IQiM8qh7LlJPZVETsilsvRUMXMXd5RrlzKSkIxdwEOpnXOrkuLMei9VR8Y+32mMYZyL167UzWPspkrDpYE/51/kxbK1zI3CXpOzTFb/BrS9vU4igBRP9zmAikSOgDhNAQxaPaNC71uWHsbp/FmmSgikNDZtV/XzZnwOq+nWEyQfr8y4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/epdbXMFdVsrIkMTz5VPvg/77n+qUmcD9hca/TXFCKc=;
 b=dYNVZ1mlBPq499ldIPyv/f+3fo6wh2b8TmiXMHQRwNwLgkDO/7kPN2Brc+AkFIIkRB9g4S3qTmlFoMbc0ZuZW31vJGKh47yar0rHrziN5PCiZcXFBzIrDBRNLo1FHywi+jRFlQiZg5kXsWluWUNHEtRROz3Wittbw9M+Qc56qJJtZfvvC2MScqOb+PCiY1DZZ+tJnx7ZXm9naZh1cwNXrHKCcWSdmJTxWoMWCBDg+fHiogih9b0G8E9FCGTB3wfgBAIINMiy2kP2nTj72qNbRTyRk6h/kJx46VRsfAmuBcnQvtuCQq2NNUbj5RwbOgozEhs+1K5kN1k2TvT42t8bQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/epdbXMFdVsrIkMTz5VPvg/77n+qUmcD9hca/TXFCKc=;
 b=fin1S7WZ7N2TDHJAReejaqpgW0ONVdrEQjabYoE+lylKEu3kSD7Uwyz3nPGk7m5BNSgTDEE4K+zi+jO9ux6J3lVYmfr4lflbCzkth2+zQgxV1dzzCNb2UB/4IoFa6JGV+NbiR15HMG5zwOiLLIxNWd8Q9xXixk7mSZx+9ihCBuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6112.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:05:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:05:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:05:23 +0100
Message-Id: <DHHWT5V20WEB.287E608FVAGLR@garyguo.net>
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
Subject: Re: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target`
 version and replace comment
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-18-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-18-ojeda@kernel.org>
X-ClientProxiedBy: LO4P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac42ab0-eba5-4a9e-e0a2-08de90001a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|22082099003|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: YhjC0FtcXTS85KUzTebdBbqDZ1NP3xQ2T+Z8V3jkCcUBw7bfKKn4aUnqcCe1W0T9adIoUjqLqIcmS1Wu1H28rxuUEIRBcsS8EtWW79Pz3H+Wf6WBg4QVKS5CFEK/KsCBYtHQmf6gJsD0HKYdSeJlhuUGBmSBybHKG7uiHVLmyEyabn8vwpdY2oaX0a7QoV3m4nYMM7IHHvuuo6b4B51RdVIEVuSjhdxgh6bvu8WZkwEHseDzYzNE6Tqf/rdHeAd+LoJfCFKOUSsrXrrF6XjhQv1cppeXTPbLl0nwMML4+/YlXXOTSV4Qz6rCwJ0JcUN9VzlWZxsOAKAg4GB+xpXa8E/pm33dWa7stiSIHL5d3ROnvcbarDU/hfoDeUmY1Jw7Y48aTHAgBaQApabnvD8Y568tXqMSTWHLYXFoV5+i8U265La3hR3hrOkZLOrsVUnIsWH8No9aaHBzZUz7fnhEULqs9J41m80zU4TkTENpi++0UMX06Z8B1WnuKEOcM8zJpf4+PJHs1fx5A9zER5Sm1GzPFNcLbrgC2qcd6gMhsH2d0k9WSWaU2hcgj9nE9MLYvX4DnMHPy4QTgV9HGyiroXWCCQjRVWMimNLo90EIcZxWpL/bc9FSbMkclzYnFS7MjAxPkQs/dLp3CmtIuaOCYxbv9J6VVxXPpBksl7GsPD4iHkhV6G8neF6VKmDicGxLFYYyxNDbXp2yA4h0QB7NVTXCzF7Myv/1P66Iq76uJs3ZpoXs7ox/h+VrTnvJzY0gACsuTn53fX2P0QdLIC6vZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(22082099003)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmJ2MWxkeXIwTk80UXh0UnA3SldWWEV0RzVyMWNnc3Z0K3dMNVlDOXJsVjY3?=
 =?utf-8?B?REpQNU5sV0RwWHFhenl5em4zc0J4a2l3Q3VDSWZXZkxQaHd4NExsVXYza2Vo?=
 =?utf-8?B?OUw0cjNPcXdyZkswTnJsTXBQa3dnR3ZqT3FJRDcrSFp5di9YbTdVYlJ0RTBD?=
 =?utf-8?B?YUNPdTJ2Z0dtU2o3bXpoWGNpajVKempxaDBNZG9YZ2pSRkFDMHRtUTROOEps?=
 =?utf-8?B?RmJEbDFNS2s1L3FtenhpclhCcURDaW1LMUhIZm95TG1PT3d3eVdhZ0wweC90?=
 =?utf-8?B?cGFpZ2JmNWVUdG1kd0YvbU4vdkJYRjRMR3BwVnJjQmJBSG1wR0pzRmw2UWdM?=
 =?utf-8?B?czhIZkVHUmFWTE00azRlcG9hWGJXc3BRU1NJVGIxWTI3RnpBVnlyVlgxbWFk?=
 =?utf-8?B?ZlRCbEM1RVNsV05YSGw1alVkTGFLTTUwdXJXMDNjVWwvOTVGYlF0MDJqMmpC?=
 =?utf-8?B?dENiVUtGbE90bkJpNGRoMjg3LzQra0NlZzZCR1g5K1F5dWNudWVFTVFtNnJv?=
 =?utf-8?B?L3BRU3RTMnI5M1IxcGFwRmpYUDJpU3ZMbXhSMlZRU1dRRHRZazhOWEY5K1d5?=
 =?utf-8?B?WjA4Q01QdmRvU0JBVUF3ajFSRXBxejhpZDFzWFB2NTQ2Ky8vM2JrYVJ0Z0NJ?=
 =?utf-8?B?THJWcXJGNnZsRDhlUnVXVzFqaTZLOW1UZXB2Zm8reUlad1ljNjVvbC9LdFk3?=
 =?utf-8?B?V0svZ2dkdlFwcHZ4UkZCYWRkV09xNTE1MjNHYm1OdS9OVXpVQ1UwbDhpMFI2?=
 =?utf-8?B?VHBnakZGeEhjQkxHWmRXWWxIb291WXhFUjIxemFmbzVXWHZTZDN5b3ZlVTJU?=
 =?utf-8?B?ejVtT0NKcnRUR2crVk1tY2Vrd1ZyR29rbEU5cXE3RnZ3VUtjdWdjMTU0ZlRk?=
 =?utf-8?B?anQ0OWtHZGxCWndYMVdwZTgzc1ZEVWlMbU5nSnBkdEFtY1pMUjVJb3FGR09w?=
 =?utf-8?B?S0ovZ1JhSnd0WU0xWVJhenJadUNNZ0M0NDg0YlJUcCtQV3BlMkMwVTdyN2xm?=
 =?utf-8?B?TWh1TFhnSHVHYlM3aFIrdnlRREcrMnRUbHVGRXNLSDMxUjRhM250MmlRcWRU?=
 =?utf-8?B?YU5pOUJEZUhVOUtIZlQ3MlFEaFdpT09yc1lwR01DbnpER2oyK1I4SDRoUEpn?=
 =?utf-8?B?TjJxcXBDeC9EdUdwQ0J4Y0ZZeVhIMnIxWEczT2F4bWF0Tzc2MlFueHRYUVRq?=
 =?utf-8?B?cmxYRlZXRWo3Z1pZQkt1cVRtSFMwOHNZbnd0NUVYbzlsVzRvVVYwTDFqd0tk?=
 =?utf-8?B?YkZBemxKWW1PUG1yVnBYMHRLTHVjUU1aenJwYzlnSC9RNG1oaWRQUVFISDRB?=
 =?utf-8?B?ZFFLVmdSSmwxU3ZjUFhsRFJuUzQ3TGFkMEdqRVlhYmRnMjZwaDArb1JvRFZi?=
 =?utf-8?B?c2ZlanpLQjRQWkRnbVBnVlNDSFJtYWVHVlJWb3lSNlMyeFlzVDJ2RGlzUVVY?=
 =?utf-8?B?QWNmbm5aWWNGb3pKMzRGV0tzMkpkR1FtcHZUYnJzVk51VytTNEw5czdFVzNR?=
 =?utf-8?B?MEJFVE5NUVVBUUVnbW1XSHFjMlp1RlN2dWRmRFhxMUs0TmZmTFJ3TllKNjBs?=
 =?utf-8?B?YlRaQnBob0lERVhpL1J2L2lyTzFNRUIvYjlnaFo0OVJYSGNVc2hZQjRNeFVp?=
 =?utf-8?B?aUpxVm91TklWU3U2QzlTckx0VElQdXhRU0w1N3BpczZrcjNnVGhjZnFEb0NV?=
 =?utf-8?B?dndOMFkxZHRlR3k5RXNyalBuWXVtYUF4am9mZVRHUE1kT010ZUNZWG1YUGlC?=
 =?utf-8?B?cTZVcTlra0ZjeEFWRVIrZWRkRjZ4TnBYR3VwZVlySGJ3QllTZ0o4MWpPQVl1?=
 =?utf-8?B?VFA3Z080K3VFZE96WjlBM1ZZQzhtS2RDbjh3dCtDWUdxNTZKd0JqK3pMVjFS?=
 =?utf-8?B?bVBUU1VGV0h6TWU2Q2xtaW1KL0Z2TzFtV1ZKaWNDOVp1SWsxQTRlVTBzb29N?=
 =?utf-8?B?WGVkTEtUam5tT3NMRWhpcGh1aUxIaXpaZi8wZnRjNXZQOTZ2K0s0a2kySGdG?=
 =?utf-8?B?aU4xZHZiSFFEK2RVYzN2VmxwUHNOVnJrWHgxZmwzQ0RSK3kwdjRlRzFLb2pZ?=
 =?utf-8?B?YzFBaDIrMjY1azhVakFFcVNKcG54c0ZJc0NoK2hpMWFhRWptNElIcS9MTUs2?=
 =?utf-8?B?Ry9CKzRSSGNtc3NkZXZEaFRKYmhRRjdKZzlBTjhTVjQxV1FhQlV1UEpmMUdZ?=
 =?utf-8?B?U1BKcG5jd2QrNWhFT2JuVUMzOEF4VlR1UWY2RE5UMXlQbE9tMzdyTHIxSzIv?=
 =?utf-8?B?OUhoVmlNUk9CWGk0eE5vaThlbEoyS1B3VWpUQjFFR29oUiszd0VtRjJXTzQ1?=
 =?utf-8?B?NnY1QklVY3BEdHVDS21SczY1czBrYThlK0x2SStIajFZd3poK0JwQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac42ab0-eba5-4a9e-e0a2-08de90001a43
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:05:24.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7wolcEQhuXf2Igk8921H6d8xSkmjPmpTfU+ewikEsjzW2gGmx1n115ICu5fFZ6aPSTpXDSFjqXgwXIQ/sy7XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_160529_756437_DB1A2514 
X-CRM114-Status: GOOD (  10.98  )
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
> As the comment in the `Makefile` explains, previously, we needed to
> limit ourselves to the list of Rust versions known by `bindgen` for its
> `--rust-target` option.
>=20
> In other words, we needed to consult the versions known by the minimum
> version of `bindgen` that we supported.
>=20
> Now that we bumped the minimum version of `bindgen`, that limitation
> does not apply anymore.
>=20
> Thus replace the comment and simply write our minimum supported Rust
> version there, which is much simpler.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/Makefile | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)


