Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB3606EE92
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yCZr035V;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ArGmvhCu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NKjNB3wtxYHJHG3AFmcyhPh3WhvjJcLNhevZ39+SWYg=; b=yCZr035VzE8KtUcbX0NsY8JI3g
	FmmmmsqEk+SP9ZPwyn30tA9BXLbF0EPAOwTc0MDgepnfjrskb1gXnJI9k8PFeoIRtAx5+ynV4zubr
	RA9Iauag+3slrx6TalYVxrOIkpHIp4iC9GgEe8v/My0PabNwM5DgE5sq+OpPqNn/LSq40Pl6vbBZz
	YbYQbEJ0LiKnxw6v1q5XN4H89akXbDplWmJiQfXxA0rwiUO27XmsmgFsUST/nMB/FVQEV6LRkxUGS
	RTn6xm66BUrfT1/dm9bm3NUGQF85IPzqToU7vbusheA0Z8TJiCdlloZbTsnK0ruBgcZ+pCEGJ0ZMq
	0dA0p2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIDu-0000000CAIc-20Ae;
	Fri, 06 Nov 2026 11:35:10 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIDr-0000000CAI0-2GD8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIvkiclaSfoWlwqA8AmxJnYa8Yhxb62yJ400hfGOBh33dKhC4a+VPRMaeg/qv/xrbEonQ2yJ1u6riVTvfSSPDOyBj7/q4sMuL1Pg9pkAVbMAN/m2y5EKHbj6qFgY376o8bk15CaVBImZH1/rttWDuFJPJrFlsmdR0gyKM+eM22ZW+dysR7FWdWyfYg2IgwUmktof3s/j5WKCJqfAMgTYq+J2tfpV4xmLgJLfsQgMwtcXSBmCBUwC2Bf0vHsySnjFsEkuSG3D05rWih2ELcGDjyZH3mrQPw9LUZxRQFQCvsbu0+1UBhdmSKGlZJcHK37cUnphqQ1ToCFpmcwi+DpX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKjNB3wtxYHJHG3AFmcyhPh3WhvjJcLNhevZ39+SWYg=;
 b=GwNq2b64S0dSMdPE+S6H/Vc5789DiWEVJW/+0iyRvjXz54wxE61iWwf07aprWd1MSh/gGTStP+zkZDstM86JaYWJuzhidfyaPBjtT/qQo9VB0W21QCAq49LHwC8tLejadFbyWw4RFopt2Im+LhPP7cNGwlloSOngaeYxvEmI8YI+/KpZZ4/tVKtqzFHb8SoWHPAqr33zzfP5vtnD5auKSOqBOfeuGvTUxxY+LjknGb2zb58Hv63iCOKJujB+u3l9oEj9FvQq+GH3sJBuz/YG4b5w9lfUQdDFSvHSdNTI+75xtW5CEssVuWfNpLvOWoB8kf44gKFHEaTtgr+FhBwBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKjNB3wtxYHJHG3AFmcyhPh3WhvjJcLNhevZ39+SWYg=;
 b=ArGmvhCuiK57fZNC8ADN/oVuiIazx8srrPwThY6YLWGPY9SKNEmhhpR7uWE9BTHrHO/qTK2j0915LZ+6DTPhe3rDgFKy+CGAvuLtxd1x5eJsLnP57fIP0BazlixJZ6xAMH6CwpPIoc9Vgc1luyBthupLjYL3GdL2GydVnLPDJVQ=
Received: from DS7PR12MB9503.namprd12.prod.outlook.com (2603:10b6:8:251::15)
 by MW4PR12MB7288.namprd12.prod.outlook.com (2603:10b6:303:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 11:35:01 +0000
Received: from DS7PR12MB9503.namprd12.prod.outlook.com
 ([fe80::62c0:6aa0:897c:44d9]) by DS7PR12MB9503.namprd12.prod.outlook.com
 ([fe80::62c0:6aa0:897c:44d9%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 11:35:01 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Jonathan Cameron <jic23@kernel.org>, "Simek, Michal"
	<michal.simek@amd.com>, "Potthuri, Sai Krishna"
	<sai.krishna.potthuri@amd.com>, David Lechner <dlechner@baylibre.com>,
	=?iso-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
	<andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "amitrkcian2002@gmail.com"
	<amitrkcian2002@gmail.com>
Subject: RE: [PATCH 2/6] iio: adc: versal-sysmon: validate temperature
 hysteresis
Thread-Topic: [PATCH 2/6] iio: adc: versal-sysmon: validate temperature
 hysteresis
Thread-Index: AQHdasS1tSYdaUNTakOTVjECb6koGbccIRWAgATNUJA=
Date: Fri, 6 Nov 2026 11:35:00 +0000
Message-ID: <DS7PR12MB9503E787CBD5E9292B5637CEDC762@DS7PR12MB9503.namprd12.prod.outlook.com>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
 <20261102122112.1723130-3-amit.kumar-mahapatra@amd.com>
 <aumyreagvU6zewKI@ashevche-desk.local>
In-Reply-To: <aumyreagvU6zewKI@ashevche-desk.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-06T11:28:37.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9503:EE_|MW4PR12MB7288:EE_
x-ms-office365-filtering-correlation-id: ce075138-d9d5-4e23-ea90-08df3bf9fe53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|38070700021|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261009223027099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 1OGO5v49gXYY+++iSrM/zCmTIxWVj1Klwmvk5beVXfwWSjrHH8gw8iE30bA8MRNxkzOTspP/zTlZnakoAbH64/NSBYu0tA7i9E0/2Z2YbzzmHlkLccjV0i9s5dzapcaxM7ujXxFNobycYubo2fefFqIbRpVsbmKuM+m2ajmHGXPYgP0aCfyTprsMOiSXqCmG+TJS6sj2jJ41uFF3ZuzmxP/Hajh3Ol4YLU7sCeS8fntcbxxVopOcCOaLz87zCpF4hIBqq25v9iF2YVpaxvZPUnlfXf7QqJcwz3/vTWBGnE3WIpQX/Pp4RkkL6N1HdrgTr2nM6T8pzbBQjub8INfpNpExjlQ0jxJpGBO1CmICkFHNzMK38PXqM1pJRe0jA3XLNNF7aOjVXYYE0ELVrVhLXYpLnkoNYb0QQnl/Um/mP5tCE6jeHfCvYwYEfOQbI+ejE8g55Yva3LJcMUxqWqXA2EQcDYvDf4wOqCgYEI9WrwXnlP5uKvIERkJYfC4UZ/kQ0Sp1SyyGFLUEdAOEGQLGWj1b+sy4iSgA6ttiNy8jgM3HCQyyn33AbDNBDgVaCQiyANgKTe7fIPWgwJZGS37bxsOnztNWY1/Qgrw7iIQD8eneRM3Wne5iaEbIkf4zBLsZln+7upGf5zodgyoEPI5xXFFYDBoUUpmNndzUzdjyisP6HJXAZ9TmfYxoMIRtT4SlpDQjjaVNPehrSOHPoJzkv2x4A56PDRdDWto9kwoPyQE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9503.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hhc8O25X6sryfgO5fpslTN9H4Ph+ngsPr6mGRnRe/Lx98I6kRWqtZII707?=
 =?iso-8859-1?Q?t3bERVnfv+UprKTgh0p4xvS9oa6RxSGsZ/1bkxHQjBoZ6iHM78fNYgU//2?=
 =?iso-8859-1?Q?I4SRb8at1sIRTZ1pm/65iLiU17fhKxIxdmA4vvoO9xboSgWtt1mnIeOqyU?=
 =?iso-8859-1?Q?M2rVDdfnvzZP15JHbdUW18SirQANb84iBkdRRL4qIi00rV92UlJ5RlDuYM?=
 =?iso-8859-1?Q?aWQq9+ZXfsODPi9rySj5QuDJNYM9h9xIht9r0wSAiRqcqa7b/MxiuRO/ks?=
 =?iso-8859-1?Q?upJ7RMVDbqJ5Utt7DSyJih6+TdhgMEbp5aMcJpq4LfXAr0BghLTn/u6mat?=
 =?iso-8859-1?Q?tBLeeArOPyiCSEE/uuPTwEwsx7Y0IRFNiuvOPSNBpfrGFKmbAPUNKrMFZs?=
 =?iso-8859-1?Q?Q3LqNsPt83M7aXDdtw81AYU4zJi8lNy6dgYHSzmh+bS/UjrKyC2cCLXAWq?=
 =?iso-8859-1?Q?pjWgOfD9YrmdKUf5AJ39m6TGmsFC2rLr+RrgcxvRnVrQZA3xdWYh0bkjvF?=
 =?iso-8859-1?Q?jrv4aYU+r5Wtm+ZX2WoQBP5ea0fdeGY+7MIawkoBDajokB+oCodzYIMw62?=
 =?iso-8859-1?Q?MSxjoIhlfmi8b2+H19mNSPQtz/HBRNTpTN5/fkE81MLI46OzLuIA/oIeD5?=
 =?iso-8859-1?Q?Ku/AThYLEWC+prn7u8dJFX/d6w49vlULujmBurM+8aXV/1t/765pil6ldP?=
 =?iso-8859-1?Q?KkNSFN8QWYlvMtSqnOCODiOWs0GDLn8UrID7w/WNqf3hxYTBV1cSPCWEfv?=
 =?iso-8859-1?Q?flRHKOPv9uC69b/HoMr+XLhKO0Wr1DfW9ltdksyTJhJNE2jnbLiYsesbgO?=
 =?iso-8859-1?Q?KJUgHKXyY1Wqq45A+nRQcLmtkuUC/GW7rcnVA/IwJWrKiMwTDjBsgdsJBK?=
 =?iso-8859-1?Q?guBmt3LK979GP9dpCHgfMA69fw1cUs+O+wLUh/cvQGi8QqR/b5glODVmbI?=
 =?iso-8859-1?Q?riKVx+Hag8Q09Y+gLCoEYmcDNJRM1zZtWttmBmhwqmvM02njg/3wG+dAQI?=
 =?iso-8859-1?Q?DycMoMhgQP03MP6IMVT79kveCqWiBhoe7MENs/Lrh4FpsbTkO0l7PWgAio?=
 =?iso-8859-1?Q?q1XgJWwazchOJ0RNTPWnsuvWJa+F+SPpsyx/uvaGo5wiscgz73s8RicOwN?=
 =?iso-8859-1?Q?2oc+gu1XJlqMh+2/RGvTZay+LJlKSrxHde1XcDw3ZVgMtI+X50Nz5pHKfc?=
 =?iso-8859-1?Q?H+Hnu1cExvyK9B40Ns7FT4bR4NgpemYYTMXiAlwG/ruNJRaYwYC9zKNa+P?=
 =?iso-8859-1?Q?ms1SZCizSlmJGRrSmCsNCsQQO25J8Wm7FbdrC9UFlXK2AlrrRrYwbyOR6k?=
 =?iso-8859-1?Q?NCKWeCFptYEbF0tbBijmxAWkcCiDyKS0NR5YSqU7MradP9cKOO1StLg+sr?=
 =?iso-8859-1?Q?Uqsqh0+oDxxTACLJb2cMoZzf5nwg0IFe6Khy9W1GWflxCqYvsZbpfGgiBq?=
 =?iso-8859-1?Q?lfxtENcABI90JBVuSfBb33GoveNUHcbssq2w/ZZnlzUPbk95f1y/rohvC3?=
 =?iso-8859-1?Q?TbdFvRLE86dEFPUrlO7Q2C/sC/jMIXLPXnHMqWUYYuB4edjFGmun6FTGyy?=
 =?iso-8859-1?Q?fdJDPVToeh4hWVfeaZNOE8Lds5SQadgph23UXE4xFhJAZq1Mc0EIn66PAy?=
 =?iso-8859-1?Q?JapdgSj/Pj5aL9Sj6GNMRlUogyTN3JCI3wTEmBBYCySX4TJYHECW/bIpFT?=
 =?iso-8859-1?Q?feUTK4HOIshZJQewETfDBdu2pE2oqS7VxWddxXf57F7BzgFSaMI9/ArSgl?=
 =?iso-8859-1?Q?qGKFv6qK4AMUpN8Z23lcUoslqJZyWVU9e0sqMbKJjg19Pg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9503.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce075138-d9d5-4e23-ea90-08df3bf9fe53
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 11:35:00.6520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tbfnYZKoj+mVUJhpsvu//KEwTgQscxmG/nUcJXZes/EUAlsHtKtseKq//kHKxzxTO6S3GzzLbHBLwp0JwqrmHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_033507_582508_F624884D 
X-CRM114-Status: GOOD (  20.83  )
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

AMD General

Hello Andy,

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@intel.com>
> Sent: Tuesday, November 3, 2026 3:39 PM
> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>
> Cc: Jonathan Cameron <jic23@kernel.org>; Simek, Michal
> <michal.simek@amd.com>; Potthuri, Sai Krishna <sai.krishna.potthuri@amd.c=
om>;
> David Lechner <dlechner@baylibre.com>; Nuno S=E1 <nuno.sa@analog.com>; An=
dy
> Shevchenko <andy@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; linux=
-
> iio@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> amitrkcian2002@gmail.com
> Subject: Re: [PATCH 2/6] iio: adc: versal-sysmon: validate temperature hy=
steresis
>
> On Mon, Nov 02, 2026 at 05:51:08PM +0530, Amit Kumar Mahapatra wrote:
> > The hysteresis written through sysfs is only checked for being negative=
.
> > A large value makes upper_mc - hysteresis in
> > sysmon_update_temp_lower() overflow before it is clamped. Reject
> > values above the full Q8.7 span of
> > 511992 millicelsius, and name the Q8.7 temperature limits so that the
> > span and the existing range checks share one definition.
> >
> > The cached hysteresis is seeded at probe from the threshold registers
> > without checking that the lower threshold is not above the upper one.
> > Treat that case as zero hysteresis, as negative values are rejected on
> > the write path.
>
> ...
>
> >     sysmon_q8p7_to_millicelsius(upper_reg, &upper_mc);
> >     sysmon_q8p7_to_millicelsius(lower_reg, &lower_mc);
> > -   *hysteresis =3D upper_mc - lower_mc;
> > +   *hysteresis =3D max(upper_mc - lower_mc, 0);
>
> But you can use abs_diff() and let it make the problem of the supplier.

I went with max() because an inverted pair (lower above upper) doesn't
really describe a hysteresis, so treating it as zero seemed the safest
reading. With abs_diff(), an inverted 80/90 pair would be read as
10 degrees, and the next threshold write would then set the lower
threshold to 70.

That said, I don't have a strong preference. If you'd rather see abs_diff()
here, I'm happy to switch to it in v2.

Regards,
Amit
>
> --
> With Best Regards,
> Andy Shevchenko
>


