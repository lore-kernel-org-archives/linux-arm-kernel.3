Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948EF606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kRYP2xsj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sibb14fz3QLIg1WPRisCu0M3rtbnsCVRv/rciXLJovY=; b=kRYP2xsjQWVC9iVhbonzY9eZwM
	NSvTczbHXYJx7pP+7QamI6h5/7XRlzJWMbYoeMWOpnRZU4sw9GPoKBrYir1lWoMH8zBZLcKD10WnF
	WYOOwfkwsKHkEbS28X5hoUdnOPdAL8b7XMK4WLbsusjq8515jIlKXqvu2JYo5nmQXIZqLb8oFIrXY
	4nBqAUx8hD0G3UqwyLa0seKAgiEGgqPhC/SXdnhjQLHJRZFe7wlLvoKiGt7ci3MuDCJ6js3kYWKVF
	Osw8F3w7AKGAoGXKOYi3uCwOPIhtjBohAFj7Z+UDB7as3P4VFeAh/kqrrSHybCsqZ13KnGS4qAemE
	s3Ae9+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9HH-00000001RJK-2Gtw;
	Tue, 03 Nov 2026 07:49:56 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9HC-00000001RCm-43ED
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:49:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6oy5nMTRv6EMj4JfqZrEdFfi3Tiw+TKU1d33Sg0CkPNRCHwFnFX8/erIODKII20+Nknt/GO4uMk/mVJJXnn/Z5Mgq4zOiFT/0OaDwlXW++YNC96Qg+IAMTzr0LsSPYjPGJGQm64wz7A1eyYPUmza9z2dzWaYIrUmSym5ino/pLnwpiXaQE/gvCvF2lA3dLUZjjyHWodCiN7t/zInyuZk912uiXCFlYijc47FTURTlr7nHEJzscNRGcDeDvacWSWfLVLEhL3gJ0VeHfEgwXtlO2Bcrnfef6gxiXHAQD1w0gPOyVN/eEtgr7Y6mSMdgh0GEJLOSZUIYUMIYDfFUwYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sibb14fz3QLIg1WPRisCu0M3rtbnsCVRv/rciXLJovY=;
 b=vHQ/kjQAm4yHedMlD7lu7BqJSgdJ2ff/9YrM7MyFPtuO2mHkLILeYs9T98V8taXyfxcdZCVKP/7ZRj+dPMcFU7eXSJMfCCopTwkFHFj/6zEdtqSZHYB7xuXMCR32Nb1TZVPC+9pCzyhpCVJUFrr+ZE3sADrsmDz6CyrZTrEm2y7aS3VI7c0qb/yPPI7zyymp83WcBoSwGxgOZGwEX0evz80V2xgwVcQe2mKvGrxK5Ta+sNhyp/IRCaPtNBpVHkzpBhKO/fWKCiwXve8HnT3g/uVmsi+ev6ASySvo9tKT9OIqc80fDJna08pKZWxOqXyxthZwvVsIbFt3bJ1xYOxpwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by KU4PR06MB8433.apcprd06.prod.outlook.com (2603:1096:d10:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 07:49:44 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 07:49:43 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Roger Quadros
	<rogerq@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, =?utf-8?B?R2FyeSBZYW5nICjmnajmlrDkvJ8p?=
	<Gary.Yang@cixtech.com>, =?utf-8?B?RnVnYW5nIER1YW4gKOauteWvjOWImik=?=
	<fugang.duan@cixtech.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>,
	=?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Subject: [PATCH v5 3/3] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Thread-Topic: [PATCH v5 3/3] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Thread-Index: AQHda2fj4Q+u+LDaEEWoQSvGLJRG0g==
Date: Tue, 3 Nov 2026 07:49:43 +0000
Message-ID: <20261103074929.1971195-4-hongliang.yang@cixtech.com>
References: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
In-Reply-To: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|KU4PR06MB8433:EE_
x-ms-office365-filtering-correlation-id: b887ef0f-d689-4b99-0a3b-08df397f05e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|921020|38070700021|56012099006|261009223027099003|261028144727099003|261026121527099003|261022105027099003|261026140227099003|261021121427099003|10067099003|22082099003|18002099003|261102123227099003;
x-microsoft-antispam-message-info: 0XQnMrADov2BHo30xeTSiP7wyu/rNq8BJob4cVdpS/Wt5KmRqMeJd2fvI5n90O2jOZY+Y0v8fvJ5Qc5ju2GuoG0GXLV73n/3ByjcGUc0NczQvCboITNFbEB/M2bdQfg1a0bgMGLyMjj/A9J7XT+/+3Cz8D2xXcDSq6lDNNW8MlujsUBqmC2hsP/kVeGnQquL1Okl3qXGiGMYeQTwdJa4d8QKXwEa5zRA0b3DoEEX1M6v1t/HdvKRt/a8KlEH9dAiEiMAe35zVo9PQAXtXHTOgaahNAkcL4xh8yW/P/1BtX35im8JcriF+7CUtjxTSk69q+MELM3ccKVZggSYRjCmGYNXesdSGKWWuFvb1XpX62g+K9/F4CYE/NdGirpGFFF/D9FHobfNS/z9wFXf5lA1HRj3QTRXzTN0h5WAVq/uDNwhc90PC5mvnqEzYB6rdW5SEAozXTkpfDSEa5eKpuh/b/fzchIzYw4zOv1dyYF5HGGTopLR64qxCQbtKvmxSPaNZ3tBXDJ2ibOc2Wi8KorPSXwfz2Ip3DRp0qnfFdbqv7iu0Qy6fsKFthqQ8pUs8O1Pi19tBFqFxmhctUSXlQoA+kbjMlPIMcPNBdnazi2+tkXAxWghLeTDKEf4aP68Y77/2eS4kcVSEDtMV6lLKk7ZHHKMylris2JWt5UMcaJXkaX2U2bHATQmGMelYuou99mRum8snS7PU8T/DQw7Q21FoI6vb7bV/MDxkw05rWFCVCcZruuPwXqJNg/3NUh9qhV0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(921020)(38070700021)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(261102123227099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zy9Xc1FsLzBOUjJCakN6RGhMUlJvZi9QRDB2WFpXUC9NUlVPRnltWFVQUHVr?=
 =?utf-8?B?UHpNRG5STm8weW5aR1F4Q201YkhEWWFYR2xZemFmYXdFRzNMVmpyVUdZN1d6?=
 =?utf-8?B?UWpMdFhBRFZnbXZNNS9XWjR4djQybG1EVjZyMzdwV1B3cExSOFhSVWRGYWZD?=
 =?utf-8?B?NnZCQVBabHA1SUtnVmtBT29HSytLMTNIUURaVUVhaGdiclR0dWkzSER6eFdI?=
 =?utf-8?B?NUk5U3FvV3ZpcG02NldEcm4xa3VOamlleEMwWmUzaHMvUUdZQnhaK1EwckQ3?=
 =?utf-8?B?NExKMnlVRzJ6MWI1UVY1OEdzL3pERStqSEZZaWIrYUhLckxjamQ2UUw5T05p?=
 =?utf-8?B?UW9pbGFwTGZtYURsUHRFV1IzL2k0ZmozeW9iaVd1SVZCa3gyRDRsYTZkczB5?=
 =?utf-8?B?KzNMbW5MaVR4c3BBZ1Y2YUV1aWRSVzRMYmsvTUJvNUlrdzRCRFQ3S3ZJalkw?=
 =?utf-8?B?b2ZFdEt5bGhBK3BBcWJla3JaU2tnUWVHN0t4OGEveUZQdXliRjZUWU9oU2o0?=
 =?utf-8?B?QmRLTlNYRW9abXJXREhOVzlsYmdzT00yTlRuUUxtR3B2ZFBKQy9TTW9rWHZF?=
 =?utf-8?B?SWgzeGVvZVBWUHIvWXI4eE84alJmVVFhQW5rZVVTc1JMdEdnUVFPWGhJVThL?=
 =?utf-8?B?OHZDc09UODBlZ05HeWhmZk5FV09UMkxjTmV0cUJseTU4MjFuRVcrZ3Z2djgr?=
 =?utf-8?B?elo1RzdRRTJ1N3lmR2liaUR6dlA4NlVXYTljdlpKZElFeDVqVUhNb2pvZ2w4?=
 =?utf-8?B?ZG1obHljNnNmalZaSkpFMFJVa3hIMENqRDV0emt0ZncrL3A1Qk9VSHltcmFR?=
 =?utf-8?B?K1lHUDUrY0QweXVKUzBVME1TS1JzbEVEb2NSYzQrSUhQZGpWNSt1ZE8zVFNC?=
 =?utf-8?B?S0dOZldJZDYwTnBGTXB3QXA1em5tQTNNcU11dEt5SkxML01ySVpFWmhlSCta?=
 =?utf-8?B?RUV2Um9GT0diWTRnK0VEQjZ3TFF6UDZNTEpmYlp4ZWJaZmVJakZtWXZjcExV?=
 =?utf-8?B?N1M0RTRqUUcvM1RTSHJoWC95cWZKMzVKZ1FsTmsvS2pZOEE4bzRzc2lodlJm?=
 =?utf-8?B?UWdPUzFEMlRVNFZaZS9rbFhiUTRjbGtvUDJnSTVxOStlR3BlalNRVEU4b0dl?=
 =?utf-8?B?a3JJY015Y04rMTNZNDZ3KzVSekQ4bGEvTU0zOU5INWdtM0dWazF5OTBiNjZx?=
 =?utf-8?B?bG9XaCtpQm9kYzZzZkpUYVFBbVVFUXp2YWF3NHQzaEdBVFFTbnpvUWRhTzFU?=
 =?utf-8?B?S1RKd2FvQXl2blBzSTJYRFVpTFlOaWM0RjNPU2oyT2pUYURoZzVJZXBIaStQ?=
 =?utf-8?B?cUI5UG1YZG5LS290eEtLc3RqbVBiUmV5QXpxVVZxc1RUeDhXbzJxOXpMRkZH?=
 =?utf-8?B?QjhjL2QyMFk0c2doVy93SFFNZWsreEQ0OTZLQ0VWREpyYUdraHY2THhHQ2xj?=
 =?utf-8?B?UTE5ZUdmcDVMQmxLc0lUL1dpNXVObUFrZ01EbzJoZkQ3cnNVbVczUmJ0UU53?=
 =?utf-8?B?Q0hEb09UcnNoTmVBMGNHVndBRU9PZFRnWGtzZitpM1R2Q21mK2ZmeGozSTZa?=
 =?utf-8?B?T29HUzcvZVE3eDVtWFRMbWc2bmI0SlJDUHJRdjRSWjBYeVZJWU02RWtDZTgy?=
 =?utf-8?B?RDZjVlZFVW91eG1QdjFXQmFGTVl2eFJ4OEMydGI5dzFVTCtMVkVVNzFlUXRB?=
 =?utf-8?B?dlE0elh0bmFjNEZrZmpTNmVuTkRJS1J0M0h6U2lTdERJdGZ3OXZxZFNBWHY0?=
 =?utf-8?B?QkJEVkRLNENPS3ZqalpubGpnbTYzczEreEJKbFBWWUJPZGtmTnNOYjF3NGk4?=
 =?utf-8?B?M1lrNmJPWkFjMTN4R2l4UENZVlp6UC91NEFVdzdaZm9tT1hBSGN0RjNsODBS?=
 =?utf-8?B?MzlUYmtJWVlhbzRHZDZWZk84UVJ1WWdacWxneUZrSzlkWkpVaW9xSU84WVNV?=
 =?utf-8?B?eUJmcFh1SVZnSGdOMHhWL1VPTDdMdU5oQVZDeXFrQzZuSDVGM2NzRGt5SVpO?=
 =?utf-8?B?YXBTZk1XYUhib0R1eURzOG5sZzdXc1ZNdmpFTG5GRzNxTDNXVnRndUc0VDIw?=
 =?utf-8?B?Nm9FZitiQmdRcFhxTDBIR0FEVE9jU0lEMUJmZjhEZHAvQjdSMzVYemw2N3Bm?=
 =?utf-8?B?ZG0wKzFTN0xPMmw3cFZXQjdleGJROWtrVU53S0EzM2NDMXcwR0hyM2dSMDJM?=
 =?utf-8?B?WUhYeFZwNExNVU9tbVpIejBWNnZTUnloRVg3N09LdnhTblI1Y3IycXRHSm1B?=
 =?utf-8?B?azBCTnUvK1FMeEhENmxnc21yRksyN3FNbVFEd3JxaVJCMDRNNWZqMTBPMHAz?=
 =?utf-8?B?Wk1jOU02WjlIQkprR2tJNS9XODlFQ0pKNkFWQ1FJeHFrQ2x3S0l3bGRsWTV1?=
 =?utf-8?Q?/cU/YXCWbFKyEPGY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E23F5BCD12818148BEBDB7A56E867C81@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4439.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b887ef0f-d689-4b99-0a3b-08df397f05e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 07:49:43.2215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GjSD+GSjwAASDKxOP6+ca5soqrodxfKaaKCRejQ8sXs5d0oI18Ynbj0A9TGGjmrZS07xd4uGAvorFAq3b/UcdNTkJN2TFKfRk4AfA19mkug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU4PR06MB8433
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234951_602775_8B9B0BC8 
X-CRM114-Status: GOOD (  11.58  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIFVTQjQgYW5kIFVTQjUgY29udHJvbGxlciBub2RlcyBmb3IgdGhlIENJWCBTa3kxIFNvQy4g
RW5hYmxlIFVTQjQNCmFuZCBVU0I1IGluIGhvc3QgbW9kZSBvbiB0aGUgUmFkeGEgT3Jpb24gTzYg
Ym9hcmQuDQoNClRoZSB0d28gY29udHJvbGxlcnMgc2hhcmUgdGhlIFJDU1UgcmVnaXN0ZXIgcmVn
aW9uIGFuZCB0aGVpciBnbHVlDQpyZWdpc3RlcnMgYXJlIGludGVybGVhdmVkIGluc2lkZSBpdCwg
c28gdGhlIHJlZ2lvbiBpcyBkZXNjcmliZWQgYnkgYQ0Kc2ltcGxlLWJ1cyBjb250YWluZXIgd2l0
aCBhbiBhZGRyZXNzLXRyYW5zbGF0aW5nIHJhbmdlcyBwcm9wZXJ0eSBhbmQNCmVhY2ggY29udHJv
bGxlciBtYXBzIGl0cyByZWdpc3RlcnMgYXMgb2Zmc2V0cyBpbnNpZGUgdGhhdCByZWdpb24uDQoN
ClNpZ25lZC1vZmYtYnk6IEhvbmdsaWFuZyBZYW5nIDxob25nbGlhbmcueWFuZ0BjaXh0ZWNoLmNv
bT4NCi0tLQ0KdjQgLT4gdjU6DQotIEZpeGVkIGNvbnRpbnVhdGlvbiBsaW5lIGluZGVudGF0aW9u
IHJlcG9ydGVkIGJ5IGNoZWNrcGF0Y2guDQogYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS1v
cmlvbi1vNi5kdHMgfCA0MiArKysrKysrKysrDQogYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5
MS5kdHNpICAgICAgICAgfCA5NSArKysrKysrKysrKysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hh
bmdlZCwgMTM3IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvY2l4L3NreTEtb3Jpb24tbzYuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS1v
cmlvbi1vNi5kdHMNCmluZGV4IDVkNTdkZDllYTI5OS4uZDA3ZmFkMzAyMDUwIDEwMDY0NA0KLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS1vcmlvbi1vNi5kdHMNCisrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvY2l4L3NreTEtb3Jpb24tbzYuZHRzDQpAQCAtODAsNiArODAsMjIgQEAg
cGlucyB7DQogDQogCQl9Ow0KIAl9Ow0KKw0KKwlwaW5jdHJsX3VzYjQ6IHVzYjQtcG93ZXItb24t
Y2ZnIHsNCisJCXBpbnMgew0KKwkJCWJpYXMtcHVsbC1kb3duOw0KKwkJCWRyaXZlLXN0cmVuZ3Ro
ID0gPDg+Ow0KKwkJCXBpbm11eCA9IDxDSVhfUEFEX0dQSU8wNDFfRlVOQ19VU0JfRFJJVkVfVkJV
UzQ+Ow0KKwkJfTsNCisJfTsNCisNCisJcGluY3RybF91c2I1OiB1c2I1LXBvd2VyLW9uLWNmZyB7
DQorCQlwaW5zIHsNCisJCQliaWFzLXB1bGwtZG93bjsNCisJCQlkcml2ZS1zdHJlbmd0aCA9IDw4
PjsNCisJCQlwaW5tdXggPSA8Q0lYX1BBRF9HUElPMDQyX0ZVTkNfVVNCX0RSSVZFX1ZCVVM1PjsN
CisJCX07DQorCX07DQogfTsNCiANCiAmcGNpZV94OF9yYyB7DQpAQCAtMTE4LDYgKzEzNCwzMiBA
QCAmdWFydDIgew0KIAlzdGF0dXMgPSAib2theSI7DQogfTsNCiANCismdXNiNCB7DQorCXBpbmN0
cmwtMCA9IDwmcGluY3RybF91c2I0PjsNCisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCisN
CisJc3RhdHVzID0gIm9rYXkiOw0KK307DQorDQorJnVzYnNzXzQgew0KKwlkcl9tb2RlID0gImhv
c3QiOw0KKw0KKwlzdGF0dXMgPSAib2theSI7DQorfTsNCisNCismdXNiNSB7DQorCXBpbmN0cmwt
MCA9IDwmcGluY3RybF91c2I1PjsNCisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCisNCisJ
c3RhdHVzID0gIm9rYXkiOw0KK307DQorDQorJnVzYnNzXzUgew0KKwlkcl9tb2RlID0gImhvc3Qi
Ow0KKw0KKwlzdGF0dXMgPSAib2theSI7DQorfTsNCisNCiAmdXNiM19waHk0IHsNCiAJc3RhdHVz
ID0gIm9rYXkiOw0KIH07DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5
MS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS5kdHNpDQppbmRleCAwNmEzMTFl
ZTE0ZWYuLmMxMGRiMGZmOWFmNiAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvY2l4
L3NreTEuZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS5kdHNpDQpAQCAt
MTcsNiArMTcsMTEgQEAgLyB7DQogCSNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KIAkjc2l6ZS1jZWxs
cyA9IDwyPjsNCiANCisJYWxpYXNlcyB7DQorCQl1c2I0ID0gJnVzYjQ7DQorCQl1c2I1ID0gJnVz
YjU7DQorCX07DQorDQogCWNwdXMgew0KIAkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQogCQkjc2l6
ZS1jZWxscyA9IDwwPjsNCkBAIC02MDYsNiArNjExLDk2IEBAIG1ib3hfYXAyc2ZoOiBtYWlsYm94
QDgwYTAwMDAgew0KIAkJCWNpeCxtYm94LWRpciA9ICJ0eCI7DQogCQl9Ow0KIA0KKwkJdXNic3Nf
cmNzdTogdXNiLXJjc3VAOTFjMDMwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsN
CisJCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsNCisJCQkjc2l6ZS1jZWxscyA9IDwyPjsNCisJCQly
YW5nZXMgPSA8MHgwMCAweDAwMDAwMDAwIDB4MDAgMHgwOTFjMDMwMCAweDAwIDB4MTUwPiwNCisJ
CQkJPDB4MDAgMHgwOTFkMDAwMCAweDAwIDB4MDkxZDAwMDAgMHgwMCAweDIwMDAwPjsNCisNCisJ
CQl1c2I0OiB1c2JAMTQgew0KKwkJCQljb21wYXRpYmxlID0gImNpeCxza3kxLXVzYnNzcCI7DQor
CQkJCXJlZyA9IDwweDAwIDB4MTQgMHgwMCAweDEwPiwNCisJCQkJICAgICAgPDB4MDAgMHgxMDAg
MHgwMCAweDEwPjsNCisJCQkJcmVnLW5hbWVzID0gImF4aSIsICJzdGF0dXMiOw0KKwkJCQlyYW5n
ZXM7DQorCQkJCSNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KKwkJCQkjc2l6ZS1jZWxscyA9IDwyPjsN
CisJCQkJY2xvY2tzID0gPCZzY21pX2NsayBDTEtfVFJFRV9VU0IzQV9IMF9DTEtfU09GPiwNCisJ
CQkJCTwmc2NtaV9jbGsgQ0xLX1RSRUVfVVNCM0FfMF9BWElfR0FURT4sDQorCQkJCQk8JnNjbWlf
Y2xrIENMS19UUkVFX1VTQjNBX0gwX0NMS19MUE0+LA0KKwkJCQkJPCZzY21pX2NsayBDTEtfVFJF
RV9VU0IzQV8wX0FQQl9HQVRFPjsNCisJCQkJY2xvY2stbmFtZXMgPSAic29mIiwgImF4aSIsICJs
cG0iLCAiYXBiIjsNCisJCQkJcmVzZXRzID0gPCZzNV9zeXNjb24gU0tZMV9VU0JDX1NTMl9QUlNU
X04+LA0KKwkJCQkJPCZzNV9zeXNjb24gU0tZMV9VU0JDX1NTMl9SU1RfTj47DQorCQkJCXJlc2V0
LW5hbWVzID0gImFwYiIsICJjb3JlIjsNCisJCQkJY2l4LHVzYi1zeXNjb24gPSA8JnM1X3N5c2Nv
bj47DQorDQorCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQorDQorCQkJCXVzYnNzXzQ6IHVzYkA5
MWQwMDAwIHsNCisJCQkJCWNvbXBhdGlibGUgPSAiY2Rucyx1c2IzIjsNCisJCQkJCXJlZyA9IDww
eDAwIDB4OTFkMDAwMCAweDAwIDB4NDAwMD4sDQorCQkJCQkgICAgICA8MHgwMCAweDkxZDgwMDAg
MHgwMCAweDgwMDA+LA0KKwkJCQkJICAgICAgPDB4MDAgMHg5MWQ0MDAwIDB4MDAgMHg0MDAwPjsN
CisJCQkJCXJlZy1uYW1lcyA9ICJvdGciLCAieGhjaSIsICJkZXYiOw0KKwkJCQkJZHJfbW9kZSA9
ICJvdGciOw0KKwkJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI1MiBJUlFfVFlQRV9MRVZFTF9I
SUdIIDA+LA0KKwkJCQkJCTxHSUNfU1BJIDI1MiBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+LA0KKwkJ
CQkJCTxHSUNfU1BJIDI1MyBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+LA0KKwkJCQkJCTxHSUNfU1BJ
IDI1MiBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Ow0KKwkJCQkJaW50ZXJydXB0LW5hbWVzID0gImhv
c3QiLCAicGVyaXBoZXJhbCIsDQorCQkJCQkJIm90ZyIsICJ3YWtldXAiOw0KKwkJCQkJbWF4aW11
bS1zcGVlZCA9ICJzdXBlci1zcGVlZC1wbHVzIjsNCisJCQkJCXBoeXMgPSA8JnVzYjNfcGh5NF8w
PjsNCisJCQkJCXBoeS1uYW1lcyA9ICJjZG5zMyx1c2IzLXBoeSI7DQorDQorCQkJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOw0KKwkJCQl9Ow0KKwkJCX07DQorDQorCQkJdXNiNTogdXNiQDI0IHsNCisJ
CQkJY29tcGF0aWJsZSA9ICJjaXgsc2t5MS11c2Jzc3AiOw0KKwkJCQlyZWcgPSA8MHgwMCAweDI0
IDB4MDAgMHgxMD4sDQorCQkJCSAgICAgIDwweDAwIDB4MTEwIDB4MDAgMHgxMD47DQorCQkJCXJl
Zy1uYW1lcyA9ICJheGkiLCAic3RhdHVzIjsNCisJCQkJcmFuZ2VzOw0KKwkJCQkjYWRkcmVzcy1j
ZWxscyA9IDwyPjsNCisJCQkJI3NpemUtY2VsbHMgPSA8Mj47DQorCQkJCWNsb2NrcyA9IDwmc2Nt
aV9jbGsgQ0xLX1RSRUVfVVNCM0FfSDFfQ0xLX1NPRj4sDQorCQkJCQk8JnNjbWlfY2xrIENMS19U
UkVFX1VTQjNBXzFfQVhJX0dBVEU+LA0KKwkJCQkJPCZzY21pX2NsayBDTEtfVFJFRV9VU0IzQV9I
MV9DTEtfTFBNPiwNCisJCQkJCTwmc2NtaV9jbGsgQ0xLX1RSRUVfVVNCM0FfMV9BUEJfR0FURT47
DQorCQkJCWNsb2NrLW5hbWVzID0gInNvZiIsICJheGkiLCAibHBtIiwgImFwYiI7DQorCQkJCXJl
c2V0cyA9IDwmczVfc3lzY29uIFNLWTFfVVNCQ19TUzNfUFJTVF9OPiwNCisJCQkJCTwmczVfc3lz
Y29uIFNLWTFfVVNCQ19TUzNfUlNUX04+Ow0KKwkJCQlyZXNldC1uYW1lcyA9ICJhcGIiLCAiY29y
ZSI7DQorCQkJCWNpeCx1c2Itc3lzY29uID0gPCZzNV9zeXNjb24+Ow0KKw0KKwkJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOw0KKw0KKwkJCQl1c2Jzc181OiB1c2JAOTFlMDAwMCB7DQorCQkJCQljb21w
YXRpYmxlID0gImNkbnMsdXNiMyI7DQorCQkJCQlyZWcgPSA8MHgwMCAweDkxZTAwMDAgMHgwMCAw
eDQwMDA+LA0KKwkJCQkJICAgICAgPDB4MDAgMHg5MWU4MDAwIDB4MDAgMHg4MDAwPiwNCisJCQkJ
CSAgICAgIDwweDAwIDB4OTFlNDAwMCAweDAwIDB4NDAwMD47DQorCQkJCQlyZWctbmFtZXMgPSAi
b3RnIiwgInhoY2kiLCAiZGV2IjsNCisJCQkJCWRyX21vZGUgPSAib3RnIjsNCisJCQkJCWludGVy
cnVwdHMgPSA8R0lDX1NQSSAyNTcgSVJRX1RZUEVfTEVWRUxfSElHSCAwPiwNCisJCQkJCQk8R0lD
X1NQSSAyNTcgSVJRX1RZUEVfTEVWRUxfSElHSCAwPiwNCisJCQkJCQk8R0lDX1NQSSAyNTggSVJR
X1RZUEVfTEVWRUxfSElHSCAwPiwNCisJCQkJCQk8R0lDX1NQSSAyNTcgSVJRX1RZUEVfTEVWRUxf
SElHSCAwPjsNCisJCQkJCWludGVycnVwdC1uYW1lcyA9ICJob3N0IiwgInBlcmlwaGVyYWwiLA0K
KwkJCQkJCSJvdGciLCAid2FrZXVwIjsNCisJCQkJCW1heGltdW0tc3BlZWQgPSAic3VwZXItc3Bl
ZWQtcGx1cyI7DQorCQkJCQlwaHlzID0gPCZ1c2IzX3BoeTRfMT47DQorCQkJCQlwaHktbmFtZXMg
PSAiY2RuczMsdXNiMy1waHkiOw0KKw0KKwkJCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCisJCQkJ
fTsNCisJCQl9Ow0KKwkJfTsNCisNCiAJCXVzYjNfcGh5NDogdXNiLXBoeUA5MjEwMDAwIHsNCiAJ
CQljb21wYXRpYmxlID0gImNpeCxza3kxLXVzYjMtcGh5IjsNCiAJCQlyZWcgPSA8MHgwMCAweDA5
MjEwMDAwIDB4MDAgMHg0MDAwMD47DQotLSANCjIuNTQuMA==

