Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148FF606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l6opbK4L;
	dkim=pass (1024-bit key, unprotected) header.d=SocionextGlobal.onmicrosoft.com header.i=@SocionextGlobal.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-SocionextGlobal-onmicrosoft-com header.b=H+J76dwY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioVCbRDzc0w5QRwAWnGYTH/poomMQSKZ3v53lGlC1cc=; b=l6opbK4LiKV0uKolZC1Lzt/Ifr
	cnJLTEjABJgRXbmqo3v3fwzHX2NjJE3lmtTdn224i+XFEMs0fKEr7Mcqza871cJJd/6Zkx5IJCAHO
	Hp93qwRL/Y8S+++Vnewr/8LWoh8Wo9sEmsCf6+LOeuhvYg960J1Tf95q9B3lFzQoe69HEooOGEoB+
	cR7myd25vN38O53Own/xyFh/lnFdXjVoqxLuUaehCQCqmWi1NUDMvTYeq5SiHrlKznh5z+sYvYAaL
	HmZYGHwkKR2CiKrFT7PJzkaaFd8UEBH3Mw16Mxd3Ilqv0u++PBMeqYwwj/RBI7fVmA0fdTmUzhvvW
	0iRc9gkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5FW-00000009BUw-2Rjm;
	Tue, 20 Oct 2026 08:31:10 +0000
Received: from ps81.spcmail.jp ([52.192.49.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5FS-00000009BTv-1aIm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:31:09 +0000
Received: from ip-10-10-30-85.ap-northeast-1.compute.internal (localhost [127.0.0.1])
        by ncs81.cs.local (8.18.1/8.17.2) with SMTP id 69K8V1lv477229;
        Tue, 20 Oct 2026 17:31:01 +0900
Received: from ip-10-10-28-82.ap-northeast-1.compute.internal (localhost [127.0.0.1])
	by nmg81.cs.local (Postfix) with SMTP id 4j85GY2dkzzMpsfd;
	Tue, 20 Oct 2026 17:31:01 +0900 (JST)
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	by npr83.cs.local (Postfix) with ESMTPS id 4j85GH13Wzz3kMcY;
	Tue, 20 Oct 2026 17:30:47 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFYNuJGKoN969RPlV1hXX0Iv7XuhAVr9I6vAS6JRqyXiro4wdniOtsZmY44F3c6j+ouW+zkBXmIQKDOkLNfkRFUUeGBpQxSMmU+xwKpbRuLy4Q9ONBul0QDjjOZPOvGnglwidGuTVgDuU6MU3w2qg6pkDaMPqhX2AyCrnP91KhlN161p9aJwMjWoHb59LpkphaCPMuczyA15GocjYZ2HPLQFyb6aNX37FbRfVh62faSDGtK3W0o5SbYuUUwiP+jUXty5jh3iJ+kyacG9GBvc0tisOUlYilml1YAVgFe2v/CjuB/uX8ZJisnX/Iuf7YvYYzOYKkfFcA3mxabq/XWj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioVCbRDzc0w5QRwAWnGYTH/poomMQSKZ3v53lGlC1cc=;
 b=OUXbfowyOB16LSXmjJU7+1nZgCSJibWMakmJGNyOGN0x9P34DWH4q6RZbMFcy28mgjeg3GLSOkNbwQCj3yDvHMQsoXVUUBevPgLOkuCe4tlCUY8aQTmonnpIsnP7c+ZzQJ2mZ5lCzktlyjEklRtEPhn0eWxCkKHeTfqRysrTG+vpfwqzwyOgM9HkjNqna0bX4+wxDm5pdpG9KbEEktmD4263NHOuDFBrutXGEkVX5lHmrjG4e2uJRR1p1C4Vo+G3pFrQQ6TSfzfNU8vtvxMDITRAnjsUKMBCjxBwRxjpih4eDRI45zGZHQ/j0hxMG6hFfJSFaKbc7pDBb4mHaWO0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=socionext.com; dmarc=pass action=none
 header.from=socionext.com; dkim=pass header.d=socionext.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SocionextGlobal.onmicrosoft.com;
 s=selector1-SocionextGlobal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioVCbRDzc0w5QRwAWnGYTH/poomMQSKZ3v53lGlC1cc=;
 b=H+J76dwY4JEo/gYMwf93IMELAd0mOjWgSaejsQiXtHzqWLUesmzkBzcEYh5h1jdz+t3TQIQY0fxefX2bOvHVK6oC/JMQbtW9hCwDWwDYgvEhRlLHtdheGpXHChWDBOH5pWH/2iBVTm92cY+zLTK6rmeQYubr1OsSxtCF3loXVxk=
Received: from TYWP286MB3648.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3f3::9)
 by TYYP286MB1523.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:30:45 +0000
Received: from TYWP286MB3648.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5242:b270:2d9c:2c5f]) by TYWP286MB3648.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5242:b270:2d9c:2c5f%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 08:30:45 +0000
From: <orito.takao@socionext.com>
Subject: Re: [PATCH] ARM: milbeaut: Drop the select of the nonexistent
 CONFIG_PINCTRL_MILBEAUT
Thread-Topic: [PATCH] ARM: milbeaut: Drop the select of the nonexistent
 CONFIG_PINCTRL_MILBEAUT
Thread-Index: AQHdPQ2GqXaTRnkdok+6iDO0ESdpa7cGXJBA
Date: Tue, 20 Oct 2026 08:30:45 +0000
Message-ID: <TYWP286MB36482E84CF538FA59F404BD5FA672@TYWP286MB3648.JPNP286.PROD.OUTLOOK.COM>
References: <20260905080648.34615-1-kmehltretter@gmail.com>
In-Reply-To: <20260905080648.34615-1-kmehltretter@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ccmail7: Relayed
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=socionext.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWP286MB3648:EE_|TYYP286MB1523:EE_
x-ms-office365-filtering-correlation-id: 2b6fdeb1-e42d-4d4c-16ac-08df2e846fa3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|11063799006|261009223027099003|22082099003|18002099003|10067099003|1580799027;
x-microsoft-antispam-message-info: nbTR1DY/c+v3CvvL1I2hmCLBfKskYYAMuE0PjEYyeJydni/jmBgu7297ZGPz10/lKXirYWa7UNwtoD9+fDlMMjaq1cXj6ScYzpPglnUvpN5vmIXN6rspn8xLYmodCRXUf9kWhTsxF03VAKWdIE86eUeF8elBnOY36+6VPp8RhiraBk9WK36ApfQzeH+95MFt71zwWK8XPq8LGvDYPDeFvlKZV0Qc3izg8cAPPfFyYyy6v38Vd0J1VPjDtcecsS5JMkRDOLgjyak7U0pyjRm/0xoSzRLzcpnUYIi5VIjW3XLdaZn+ZzyE3mcWO5mkSLievzC06EGu8LrMlX8aoHgfIEy7eYwkDJQBCvoJKHMr+395UqqOiASFVLl9AY/KY/stwJCvNXUD3SE0e1R4fQvUwRfHPKR0jtgNbP1eWKtE1Q+YN/PDRkwcIhm7C57htQX2M0HhZG0H3Sm4mzL1S2IMWC/oWHtR5cnmOayey2K8n+m9yxq9T0OV19anSMDAI/hHLEBRFBOcsUbRXiGP3U11PqQqwexoFtFTgrWLzNoC5kLr/9gKuKsBn+xvbtctlRxjRi/dzfH4P4MPR7sUeOrOFGl73F393QxDuN3wgSjg4gi9rXkjmXft+mceTXzCkoi++GG83dhL7PnYlL4TekTeufR2i3Roefi++2K7HIuU/iQ/oMo9pAV+oEqt3tnKoBEqNFHE9q1MIf16GLI7NZ4ZX0a/wrgyCcBQAheQxi4rVEpE1qBAZXvhVqzkmCponorl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWP286MB3648.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(11063799006)(261009223027099003)(22082099003)(18002099003)(10067099003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?U0Zxa2V0bHA2d2pmalEzZ2JBUk9kdmtLSEpNUDljT1ZWRnFOUW5EQzBk?=
 =?iso-2022-jp?B?QU1lWG53QXFFUEJab0M0ejJ1V044bThVQ0lFcTZCN3hpRHg1bHdFVlpK?=
 =?iso-2022-jp?B?dVhPa1JYL1JaM3pPdlhYMlJ6d3NEYUVHQU9ZZlFzSEE0cElwM2FYeFZW?=
 =?iso-2022-jp?B?c2ZMaG9sZXowWUVGVEtpRFpsMkd0cnFUUG1seVU2dmpDbUNpcXRVWTN6?=
 =?iso-2022-jp?B?SFU4bXZkQ3lneXIvdEhhL0I2TFBJQUtwSDFIUkV0RERDRHR6S3MyYmxq?=
 =?iso-2022-jp?B?Ykh3QW00ckJZK3hRVUM2a3BVaXRSbmR1QnM2SkxmNXFueHRZbDJBTXU3?=
 =?iso-2022-jp?B?Q2dMa2pDL0E4Sm0yeGd5ejZyRlpPTXBIRXp2WGcrT0srbjROZDQzZEVx?=
 =?iso-2022-jp?B?MEFtMWR2TjJaUVc1d2JsUzJ3QmhudTcyQk95c2RXQkY1Vy9oZy9XN2pS?=
 =?iso-2022-jp?B?WWZvZlB2R0ZPOWhuTng0N01razJzRVppWHVpTjhZWmc3eXc1RVhMUk13?=
 =?iso-2022-jp?B?VmZFK3lxYTEvY3F4eTBHd1FXL0xRVkNYNTNMOXpsUDNiMlR5OVl3Ry9s?=
 =?iso-2022-jp?B?S3hubHBIZzAwSzhqdmFkV3EraGpoOTdxdE1vTFd3SHNaaUJZeitYRTdI?=
 =?iso-2022-jp?B?Y2lLNmNDdmhTTHBDalliZHYwVStydzYrV0Q0R3lkSVJPZ1B2SjlNNkNI?=
 =?iso-2022-jp?B?YjhkZlRxcFNHeDhiWFlrdVBaMmdRY2gzQnk2elIrZExuYnR0SHRIK0VM?=
 =?iso-2022-jp?B?T1N0UEo1S2hHQjQ0UVl1bWYyZ21qaDlKY3N2Ly9mSFdoUW5ydFJUY1cz?=
 =?iso-2022-jp?B?VnZJWGlFcUhjMWxQQTE1ZmR0MXVjZTNwalhld3QrdlF4ZUNGaWRWUHph?=
 =?iso-2022-jp?B?M1IvWTRqUGtiQmRuMHM5MWErd3l2b1hMVldvd3RLT2FKc2MrUnptRWpO?=
 =?iso-2022-jp?B?SFc4STJheTR1TWZaa0ZnbXBocGNzenYxVE1zcDRZZjFpRTNwT2hxaDRo?=
 =?iso-2022-jp?B?Z0RrRkJJNldBWnJaTnVTNlFobUJmck9FV1lIKzlYRER0aHAxOGxmM3pn?=
 =?iso-2022-jp?B?WjRDYzRaWU5abmdJV2FaSEdBVlFTWStaMVhCU1hlRHhqNWhLN2U4dFVP?=
 =?iso-2022-jp?B?NWFWUWhudlFiQy9HREYxV2dENlR4aFdONDdKTmFqdlhOQlB1UnhWQjFI?=
 =?iso-2022-jp?B?bTZCaXdJUDZLTkRGVm5PbjhUdGVlSTBkY3RoNzNoVUxmaEwrWVFhVk9k?=
 =?iso-2022-jp?B?VEV2SXFsQ2QzcERMcmlPMjloa1QyaFA2OXFGTWNnRDlFdDROc3NsaTVi?=
 =?iso-2022-jp?B?aHlseURXdnBDUVlrUmgySWc4RGRDeElRUTNZTlBUT2Y1Y09TNUR4MFBD?=
 =?iso-2022-jp?B?VFdoMHVVaGpWVGw4OU9iQTYrNk4yWXN0b281N1F0enM5aGZTalRPN1p5?=
 =?iso-2022-jp?B?dkJSSS9ScTZWTjE4NHFzL0VNY2t0Z0ZFdmpueUMvUHpibFRnSFB2dDRE?=
 =?iso-2022-jp?B?K1drTFNiT01MaEVjL3BWOG5RSld2VGRrbk1XV0daV0FmNzdqV08weXNS?=
 =?iso-2022-jp?B?TS9VTGNJRHJMZzB1Qy9NTWlJcFRiY1MzWGd4bzZoalB0THVlcndCdW1o?=
 =?iso-2022-jp?B?V3JuWkJlWDk1aVJmamM1bTU3eXpYOFl0ZEwwNDJUUDh5dENwajlVcFhr?=
 =?iso-2022-jp?B?eVpyOGY2MDZKeUhTMFpZdDBCWHJidnZlblE4QVE1VTlsZ0liM3A1M2tH?=
 =?iso-2022-jp?B?aVIyZmZiK1Y0VklsNkdJTG42U2V6SWFuSVJwMWtzYmhFZjcvRXVzNEd2?=
 =?iso-2022-jp?B?Z3Z6RjYyVzRGTmVlUndkS2xoVm1wdEJTYnpJZjlrL0xhTmdyWU8xcXdn?=
 =?iso-2022-jp?B?cVkrckdSUU8yZFdUb0VDc3YzZlE3Mkh0b0NkMmpadEdXb2Y4UW9KTG1K?=
 =?iso-2022-jp?B?RkVoVm9kVE9GWGx6THMycEtSYWdkV09QMDR3cHVYSm1Bd1VLcjNYTWxo?=
 =?iso-2022-jp?B?VzNwUDlHcnErMGlkZ1NRSWhVa2JKOXFaY2VWTEE1Uk14VVI4Z21LWGNn?=
 =?iso-2022-jp?B?dTRXRjl4MjlxSEtZWS9nSVlSZmJyenFsL3QyVjNyZnhzcnVoN0lxbWg1?=
 =?iso-2022-jp?B?bER4ZFdCT1MwM3RrZnZUTUlHTkZWMi9ka29BZUNSMWhWYy9QcDNQbWpX?=
 =?iso-2022-jp?B?UkJPTWl1YzZxM0ZuZk5vZ1RMcFN5a3F1WHlwR1l0QS9LcUlxLzl0Tmgx?=
 =?iso-2022-jp?B?aHFUem1helVGeTNud1pIeW5RbXhkSXhpc0xLMmNlejVrMkRDVzNVM3Bq?=
 =?iso-2022-jp?B?dDJqMjBMUmNkL0hzRDNEbXE2RkQ5RXRGKzM1OSswOHpyM2VPVGY4YXJy?=
 =?iso-2022-jp?B?N1VwV24zbW4wanVaZ2hoQTZzSjgrQ3NKODJZSUxoSGlyYmZPNHE3K05m?=
 =?iso-2022-jp?B?eHNmUEQzakh2cnBDME54U2dzQjhuemtXbThZVERGejBISmRXQ3ExaUs3?=
 =?iso-2022-jp?B?U2pKd29tNkpDeXRSZG1rVmpSTitlcE51WndXZz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RNLIJTiCs+7G6AcvaLwDHsHYqWL7eIk4Wjo5GOuFqX4cAlbn3PqifW1qJhuZY3pJ19mmHzpMvNcudYhLB4SYREkfnjBM/YjcDuuQXWYkS92AP4mfau2fiucO71FXUbE6FFwclkxHkd258t/89sNEi9ijQfhIABCNzfRxsoRkKjcoMVm5GlK9eWDQraDl+lijgFqALqKiIuDrz+46UhVrwWVih9/0gcZPI2rQnor/YSpUO9VIShmaCJEYr2OnNuevAoCTLDCk6t76Gg2o3mjHzFpKZV39Kt8ahg5u4teOnmpdTDshy+fjKYH5r4lo2Z7KSHxbxy1hZGCKtNABv+y0Sg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6ogU49EJ196KydPMQGMwZS+A4eTg/fTWJqehqdBSloFT9OFhvNogs5agn95kWTsnLPVnfPOR5AxC4XO9R+HhHKKwIWVOtXlbNyD1Efb4mKeAAMZ5Q1P0ov+gxZGYi25dIh5XdpZE+6iSkAhVLpBn9wSNcb3llEa3ylTeFELMEcOzZzLIFLuutoQ3I6TVVUfVsJOebdTDLWQISYZmyQkWhBVyzxuxy/Ba1zhxLdFNTSQaMCYiMjY5lKxLNzNejsVMZlAFQGGwhpvKxo3t9J//iUzvyPDVgtFXfxhhP30Xg5YzOk8IUpoigUPnamTNt9EpLC1LbMGmMRwuX2PzovFbu49Kj1/0legGvI0oeBjmlGpJdD4rwIMDOWb79aFZHnj88ydwLiGklbKmwBilXdHRQ/U0JL94NrVEF6PXuKs7jH7chs9YJ7KCN1V5zbyKMxa3SMGWWdBzv0joqb/Hd1tn8Lezv3Snun5xdq7YQHhcl/yjTgh4s9HpziqtTJwv68KWmZGVtXAHRNnOzg28MqYlBuKIZRC6MqXuuYRyYSR/0420UhNlUsxyAv+CA7gwgWh2RKOWHJsKO2HNIh9AMSiipnEsjZ/GALCws0KZK7l+KYMlbIxiJOtjb+hq2KbeI13KUeNqeHgtCtFwPAczixXcqIrpyx2DYJZWtMyY4ZCsDE+BJLBf9PyKB3koaVcet4LIOPfK3eYr87Fou1EVI7UmQEL+IcaZeN3cdNuxYspLey/0KCtfbExbNxvT1/a+tm2t
X-OriginatorOrg: socionext.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWP286MB3648.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6fdeb1-e42d-4d4c-16ac-08df2e846fa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 08:30:45.3183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33c08a51-ea9e-46de-8669-aff1f467d3fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/B0cyPklDMDMBCIEFtziqNARc8lP/eqTx3GwyKb1itQi1QFSiBxNjiTFrizTeRmgLp6rAklivP5v4lozMvQtF2BOgingV+d0n/yOqRoCSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1523
X-CC-Mail-RelayStamp: CC/Mail Relayed
X-CC-Mail-RelayStamp: CC/Mail EncServer Relayed
To: <kmehltretter@gmail.com>, <sugaya.taichi@socionext.com>
Cc: <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_013106_532600_657314FA 
X-CRM114-Status: UNSURE (   7.95  )
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

On 9/5/26 05:07 Karl Mehltretter wrote:
> No Kconfig symbol CONFIG_PINCTRL_MILBEAUT exists,
> and git log -S finds no Kconfig file that has ever defined one,
> so the select in CONFIG_ARCH_MILBEAUT_M10V is silently ignored. Remove it=
.
> CONFIG_PINCTRL itself is still selected on the line above.
>
> Fixes: 9fb29c734f9e ("ARM: milbeaut: Add basic support for Milbeaut m10v =
SoC")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Takao Orito <orito.takao@socionext.com>

--
Regards
Orito




