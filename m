Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F74606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Po5g+vs;
	dkim=pass (1024-bit key, unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=TU/TuOBy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OGak2s/be+NBIFlDyf6pMtxIMbRq7wU8Isw5DvKsbRc=; b=4Po5g+vspyY0sfr4LKkUNEiDz7
	nvap4Ia/5JIMvUl4U1exphg168KlmExq5q5hHmZ+wwcSQzyUqsoi1SWb7/k1XLWgeM/Jb4RnoebwD
	XBNXUEXZpLfmKbWVHgJaAyHCvHzOfQcFe16S1YfaJV6U5G2PkVLest4UwZSZ+FBU2uk/AY4u2gTB4
	mSxFP/2/ELA+BuxCnXntBf1wIjxeFqOi1xCo1ju/ypv6K5gi3cfiBPQPAByPa0NJ0Z6jBVrh76+EI
	LE80HIBOhtbBlu2RQY9lKVhXYIBWafiP/XX/vQ3t1FKsx4gXk+vD5S2kuF6nzJi+ukgmqwlY1u0xN
	rfOIqgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxhb-000000006Lc-0vVg;
	Mon, 02 Nov 2026 19:28:19 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxhY-000000006KL-0eAo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:28:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAnpSPyn6MXju0V7w5JUJPKltLn8ssJCMS7HheMktxLmWM/zL8qXFYA+/9AJCyOqKaj7oqgPpjZYicSk0O6Jm8ixK4/tuk0mrZeNLHC9Pk9kB07AT6LEImqKj+CyoaFrD055BC3krI3J6ZmnOMde5FdZnPd5PthJUQIrMtErN3rYbTZSjSqPCAVtgMxS52iOT6FPOD2kvwIcsuXscEDNEv9gkUfvBtmoc9mQGCbhNrsx1FGPZ3VCyg424Xkfoj+cnxR7b/4pkgngLrKn/7WyJTD2Mvz6HqcSpJbbAspPF3EHVZfa8ZMP7W8ddRkGxS/vkkz8Un0CryR0UL8aad14gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGak2s/be+NBIFlDyf6pMtxIMbRq7wU8Isw5DvKsbRc=;
 b=JKelECZ46Gvr/WWsai5riQnflnxAOR5DIBet1HUT9HHc9a68R8jmmQ6rNrg4rkxsiL4Hj1lKCIkSLN6jSQifsFMm3RvgLwUHAMpfhyBMshqEu7+goObEL/hcFHY0xTr1g4Q2+R7PlO429QblP95e8YYOWRFVGme5YybwiuQsBRMkz+eD3c0W6BRtJbKYa182j+MTIcHzjEAEy1z3pN2CZZxnDsc3+sGBBrIM2DM1HiHF/mIaOoiuXvaD3ExhgnVoXVEmMcqcR+OgsR512JTVmikdtVy9MiOP9OZjqjpKea+AlRVCSSXK14zJNoblGP+y0MSDcJEw4Z7LM1LxMOLq6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGak2s/be+NBIFlDyf6pMtxIMbRq7wU8Isw5DvKsbRc=;
 b=TU/TuOBy4TYmquQ5Jej3hcEIk8m217Ca8cs/OUCIBzSchFF60cT1rQtP84d5l4aMoMUIT4cd0zpY/0L3Fn9HZ0LVPzo3KsUzSJeyY509hRdXgW4dEytyEqVDtOKjFmpfp2aLkQDDbVv0C3sySyG+C4ozYqtlzC3NXd1jxYAwhO4=
Received: from CH4PPF0966F22FC.namprd21.prod.outlook.com
 (2603:10b6:61f:fc00::c44) by CH8PR21MB4911.namprd21.prod.outlook.com with
 HTTP via P2P; Mon, 2 Nov 2026 19:28:04 +0000
Received: from CH4PPF0966F22FC.namprd21.prod.outlook.com
 ([fe80::d976:2d64:b851:4f61]) by CH4PPF0966F22FC.namprd21.prod.outlook.com
 ([fe80::d976:2d64:b851:4f61%8]) with mapi id 15.21.0592.001; Mon, 2 Nov 2026
 19:28:04 +0000
From: Dexuan Cui <DECUI@microsoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Kameron Carr <kameroncarr@linux.microsoft.com>, Haiyang Zhang
	<haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
	"mhklinux@outlook.com" <mhklinux@outlook.com>, "will@kernel.org"
	<will@kernel.org>, "Mark.Rutland" <Mark.Rutland@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "sudeep.holla@kernel.org"
	<sudeep.holla@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"thuth@redhat.com" <thuth@redhat.com>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: RE: [EXTERNAL] Re: [PATCH v5 2/6] firmware: smccc: Detect hypervisor
 via RSI host call in CCA Realms
Thread-Topic: [EXTERNAL] Re: [PATCH v5 2/6] firmware: smccc: Detect hypervisor
 via RSI host call in CCA Realms
Thread-Index: AQHdZ/h1dAYFfTv4ukq3KPjS0plBmrcXEWxwgAOhXICAAHy0IA==
Date: Mon, 2 Nov 2026 19:28:04 +0000
Message-ID: <CH4PPF0966F22FC1D5F16A625B8827BFC05BF6A2@CH4PPF0966F22FC.namprd21.prod.outlook.com>
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
 <20261002215725.2015959-3-kameroncarr@linux.microsoft.com>
 <auPOnb_9Jfzh-oQE@arm.com>
 <CH4PPF0966F22FCAF3D8C6535743902930DBF6C2@CH4PPF0966F22FC.namprd21.prod.outlook.com>
 <auh6tWHyMU15QbRC@arm.com>
In-Reply-To: <auh6tWHyMU15QbRC@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=54e223ed-6411-4c52-8cd6-8c6a5d26abe9;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-11-02T19:24:00Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-traffictypediagnostic: CH4PPF0966F22FC:EE_|CH8PR21MB4911:EE_
x-ms-publictraffictype: Email
client-request-id: 71e20e67-ca8d-4150-905e-a653d1210477
request-id: 0507ae27-b74e-4454-da83-08df39176a87
x-ms-office365-filtering-correlation-id: 0507ae27-b74e-4454-da83-08df39176a87
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|38070700021|4143699003|11063799006|56012099006|261028144727099003|261026140227099003|261022075727099003|261022105027099003|7146999003|261026121527099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: ndReOZ7JWvLKn3d4W0zLq+/jo845AEKqNolfcZ5Zy/3T35EzofrOkE+D9f2Tm3gS5zAWUME9RhjYbDq4B7+UvTwjIzXr1PNr5JnREF5bdw+tdZbgQSikxnHDWKJRyK9ame4gb9lI1lE9VIDg7nS0B38MwzfJcfG4RRe8wRYl5UBQcpLi+6r8g2yJ68L8PjljtXMHtEjU1CJ+GtX+itWBhqd5XGgmnz3lSFAE7QjgfJLaug9wGVD0qQtJG8ejiLZLM1JIecOIcNQcpO9laoeHTJpNJ0dc5j+OSPYa4BWl8RcvXXtRR/3ZkHvadj8duoUgkCWuj3ElajBuJBg9IPTL7fOke7WhEHutfAr4C7RsnliWmGgM0PC/hNBAYsgKMxftOrW4lHz9kKcZjwL9T0r4xzved7Q+WiVZLCVaU5nKy/GVd/56otRChVsJK99NzN+tSa+Uwipy1/XrvC69VxRF3ptZAMd21/Qatjt2n4P8OXlViL88PD1R8zC+BpUnUCndSYtJigLcIewiY3ljaiCfXSUy+q5LxJKSIZ38xPzIpu1hIn8pkKxTNX2ytb7WNVhE5Xf0Xs2D0szrOCLOdjlcFVuWyRbF2IzcFoxRYipfDJTbDxjD08XfRZ7TzcB23zPG1hb5Y8rSju6QlVpzm0ljJX3nV5fLwLam7WjzRWhhAkziLyWhx36YLcgGl3L01AlJyReV1q03IAmADaFNvAbKMmSBGriDd2eURrxFYceCnfE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261022075727099003)(261022105027099003)(7146999003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oSI0U9lCfDXv6fzez14jb6406VS2jzIvL6verZx6aeNWFAfM5ipdtTrM2uMa?=
 =?us-ascii?Q?Wq9BOqTDlVK6/QelbFppuIKmq/4nHyrtAqryqHmZIWv99nzERMEqugHKr+4A?=
 =?us-ascii?Q?g28FpJ5OTaE8xGbG7ru551wLhFhhfBEH1MdMI93WJmTpOQq7pT+w7SYujynr?=
 =?us-ascii?Q?AvSr/NeQ/E0gj26EXXN0ImqjmPdFE/PvKG6pxoHdLUe/f1PT9BevCo13OxRl?=
 =?us-ascii?Q?0JEwVPkIulUTUh4c8fFRpT6RvNyh+mtlKYIY1CzA8dJdYTHnoL7HsB5suZXV?=
 =?us-ascii?Q?cYISYFvTrZHhAEESmYNiWt311/oex72HR1AZDSnZdziCkb/NNlx8FdXqQc9C?=
 =?us-ascii?Q?ZYFfp1zPDPR7m9j2z8kVqpPgixGohIpnozKkEla8cAIlnz1jX4GM6o5C8dob?=
 =?us-ascii?Q?Q9Vg1lATZFyeG8JQzmOiCadjBGfgFayI1R0x1Bs+tz4R/LgUd4W721dDofoY?=
 =?us-ascii?Q?lQwrhaSEi8Z79mc7J3XibcM4IS3+oK1V6xVXnZ0g0VzplE/I6WOQTzhFQxZX?=
 =?us-ascii?Q?jkAYnIVtj/L7nEUDgL5PgQwvwUrqnEoBEsoTLJ6TV9HKqIQwFjP9GfcgXVP4?=
 =?us-ascii?Q?56DrmL+6G3eEziFawlKId7mAopzd1NWhtA2uhhM8/u63bPI7mO+f2WONPQsO?=
 =?us-ascii?Q?Jn/MQ28xsRyQEFQBmfroJpuEISD9Yn28DG/FFZj0oelMtsTraNTJlrAW1pRx?=
 =?us-ascii?Q?klHRRtYn6/qLvcoIPLZo7QZ78q05+EbSylXe0zQclfv22SnT5kp6BA/H4KtX?=
 =?us-ascii?Q?LfdznYmdTyNsbLvn4H8n+S8V0nJc0rSS44AT4wMGZH7mMF+BvUNtMXUG6q+K?=
 =?us-ascii?Q?jd4ILmNC11hFMgNXCdWRfpPxEO9V7xsr/0Cqo13P2CGn/ziOqnUejVj8YjR9?=
 =?us-ascii?Q?kw76yxhjhRU5IMbfsvnehD6XL2/lIaJtQ/gy3MumgZA9Gj6xqC6IBWTspHfC?=
 =?us-ascii?Q?G9kZ/wsAHMXLhtZsyxEu9Ymm4CANyCRMEarQsrLIKgvtsMU9LYaI0+/BpzsB?=
 =?us-ascii?Q?eSa1YWCtJ+78U5zQkGgV23K97t518mKuVZlkQIxowyvR39uWWLJf0JShSEpa?=
 =?us-ascii?Q?okKhXBpPjIyezWx0NV4D/vuGUzzHXuAkCnpy5wKLjlbPn3Ze+C4DQrfslIVC?=
 =?us-ascii?Q?THkuyAZqzQIaBOv/Q9WJ/zHyTYw6rwo+73auuOmV8cgBv8fnPQcJObnnmvq6?=
 =?us-ascii?Q?pj/Dso/+1w8nAaHJHIV0bLz0Igm7OXa49cbcvyCLmpV3MlPOQmYWHJD9Z7tv?=
 =?us-ascii?Q?qVTuS3OxRpt0GhyW1VZv+kRxf5fb0KxIkBs7cd0FymznXUxgucro40huypGF?=
 =?us-ascii?Q?XaqotkGZ4clvKy5fhBHMw8Og6NlR4u8KrFHXESxRQ2YToz0ylUMXVSTJsax4?=
 =?us-ascii?Q?dRPWBoniYfWoeVYkFvHqApJv+N5/StMZDVmwkE1orxg3E1onqEdE2kaVvSX7?=
 =?us-ascii?Q?IF6xAH5qY1bJERay5tiVnbYmSVvTvF8Tcpa4l7lblq5+7+d4v3sLGe1ZxkEs?=
 =?us-ascii?Q?q/ozgbiZt+xl73V2lYAXjzNhiIg5fY5Qx/lyMzwen0t08GSGuhGKrp4VYNiL?=
 =?us-ascii?Q?mylIYbWV5KVNzVzNy7/+19/i7uBgiwnxPkyRLW+KlOHbg46cQv8m45lml978?=
 =?us-ascii?Q?lO+Ixw6F7Be1TU1mrJTyNrwa5YUKCfLmjTDK+MeSr6cQWJik1WJdIpOEhNjR?=
 =?us-ascii?Q?FS6GmXlFP74u2daR1Vkv+eLuK0En2+qBQ4yKrrWUYh3qwjsm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH4PPF0966F22FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0507ae27-b74e-4454-da83-08df39176a87
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 19:28:04.3655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZB13g85lDHfq93nZr6DequbmOZ8XZM8ikJ94KwcOlzPSif2LttQnlXxoANR92c5jD6x090PhDWCAEC9sm97QOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR21MB4911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_112816_201218_82A4C334 
X-CRM114-Status: GOOD (  10.73  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Catalin Marinas <catalin.marinas@arm.com>
> Sent: Monday, November 2, 2026 3:58 AM
> To: Dexuan Cui <DECUI@microsoft.com>
>  ...
> My point is not the RSI host call itself to query the UUID but what the
> Realm does afterwards. kvm_init_hyp_services() gets a positive answer
> for the KVM UUID and continues with an SMCCC 1.1 invocation to query the
> supported KVM features. The latter is not an RSI host call but an
> ordinary SMC call, to which the RMM responds with -1 in res.a0 (all
> lower 32 bits set). So we end up treating KVM hyp services as available
> in a Realm but their calls still use the SMC conduit and are rejected by
> the RMM.
> ...
> Catalin

Thanks for the clarification! Now I understood this patch is incorrect
for a realm on KVM, and v6 is correct.

Thanks,
Dexuan

