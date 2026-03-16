Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B317F013EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEv7H8wUAD+BrP8ZuaOLnqDLbw8fyN/qFrh0I0eyPFQ=; b=C5aag102okPdWQOz5nVSpmOlpU
	S1Hk3VVr9DqUJLL389q4G5PMegHheZKJpNHrbyajf1nzUkFmm3aH6GErQHh1CYmCLoPt6+3Ew22R6
	eIvwctqIp/YpHiJyWI5tf2fR49DAdjC9KDXPWdppftEBbRFC78lgNlS1xwC2oAum/EDU84dcaT2Xn
	cV2/CGjJvNoAdmoe1wdkvChDAqNeepxVZiAbnb47h8/pFFuNHy4mwQYko1NcMotaiQWfe2hpvxVpi
	b2FlCQmZwnXSqmZw4cBCcojKVtyYPfI10QuXJdimcJFmsHrmUt9H4zcFA9PpRtNXr2X8eiaHrGgB6
	7iM+Yi1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23so-00000003bAL-3FDK;
	Mon, 16 Mar 2026 09:05:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23sm-00000003b9k-49fs;
	Mon, 16 Mar 2026 09:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sEv7H8wUAD+BrP8ZuaOLnqDLbw8fyN/qFrh0I0eyPFQ=; b=FoQdsWqwKj+Cyo7x1talP5itO3
	nchcFoyQV+5ox1UhLnzBa1afwHY56n1+VCYhc4ppW6B5p6WSfEPjgSQh62J9fHqR2d37b/RsUHmun
	VE0rZoEtjCKkWJIGBK185CbwxNO3nI9J47Up2zjA4eR2GI/d4HqEP6ElFSEJ/7nBhp1DR8zkfSztn
	B+YUKdwKfXuqkUjyWaXkJKpV56IWej54K33VoXMZuIU2qp4RWWQ2jDmiSc9hfHkG/yFT6V9LZ8uwM
	VCKEHya2jsCCczNAI3HSw2W6EeLFQbe/n2iMtJv8FyGEbS9iCwxz5lHbGtACXxnDoc5GMSQP6KxNs
	u/fBK81w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23sj-00000006KUN-0clJ;
	Mon, 16 Mar 2026 09:05:03 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62G92P7X01603540, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773651745; bh=sEv7H8wUAD+BrP8ZuaOLnqDLbw8fyN/qFrh0I0eyPFQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Rda9qxTiZq5vTbF9pDXFqoP1NIzYJh4pFSzEzAaSZlZvsh47eA72FQfJTKB+j4wdb
	 jiFFSFwie3K8kYcSgQ4ogKm7ZZrUcCeQViK68nhr86+9RuHgA4A8z3GxYlZuSmu2tH
	 YPSfntY9hFAVzePpI/ZyM4Rzu94gx0I1NTvN5fKja0Maoa1Jg6W+H4Dwo6AJ68ILpi
	 dgFladqqqrzl7Chp066AUndgVTgeLdRU0NBo+d3xEYjiZ7yVgWhZwgKxtM1AltYYaO
	 GpyfXfTS4pu2aTDAFgZNk6dQh6cxcaY+3iaM5w6DtFU9tkOj+QpVPRou+LMCRNfIBO
	 6npqXcp/4MaQA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62G92P7X01603540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 17:02:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 16 Mar 2026 17:02:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 16 Mar 2026 17:02:26 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Conor Dooley <conor@kernel.org>
CC: "linusw@kernel.org" <linusw@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "afaerber@suse.com"
	<afaerber@suse.com>,
        "bartosz.golaszewski@oss.qualcomm.com"
	<bartosz.golaszewski@oss.qualcomm.com>,
        =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>,
        =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>,
        =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>,
        =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?=
	<tychang@realtek.com>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>
Subject: RE: [PATCH v3 1/7] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Thread-Topic: [PATCH v3 1/7] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Thread-Index: AQHcshOoiOeMTeCCV0q5pdIUUbkMA7WqpPCAgAAAoQCABj094A==
Date: Mon, 16 Mar 2026 09:02:25 +0000
Message-ID: <1c2a4a328a294d4ca536818ec9abb9c9@realtek.com>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
 <20260312113040.68189-2-eleanor.lin@realtek.com>
 <20260312-decathlon-unheard-33543f7c9f38@spud>
 <20260312-sizably-gleaming-07c514a1fb70@spud>
In-Reply-To: <20260312-sizably-gleaming-07c514a1fb70@spud>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_090501_950690_893B8E5C 
X-CRM114-Status: GOOD (  14.31  )
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

PiBPbiBUaHUsIE1hciAxMiwgMjAyNiBhdCAwNTo0MjozMVBNICswMDAwLCBDb25vciBEb29sZXkg
d3JvdGU6DQo+PiBPbiBUaHUsIE1hciAxMiwgMjAyNiBhdCAwNzozMDozNFBNICswODAwLCBZdS1D
aHVuIExpbiB3cm90ZToNCj4+PiBGcm9tOiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNv
bT4NCj4+PiANCj4+PiBBZGQgYSBnZW5lcmljIHBpbiBjb25maWd1cmF0aW9uIHByb3BlcnR5ICJp
bnB1dC12b2x0YWdlLW1pY3Jvdm9sdCIgDQo+Pj4gdG8gc3VwcG9ydCBoYXJkd2FyZSBkZXNpZ25z
IHdoZXJlIHRoZSBpbnB1dCBsb2dpYyB0aHJlc2hvbGQgaXMgDQo+Pj4gZGVjb3VwbGVkIGZyb20g
dGhlIHBvd2VyIHN1cHBseSB2b2x0YWdlLg0KPj4+IA0KPj4+IFRoaXMgcHJvcGVydHkgYWxsb3dz
IHRoZSBwaW5jdHJsIGRyaXZlciB0byBjb25maWd1cmUgdGhlIGNvcnJlY3QgDQo+Pj4gaW50ZXJu
YWwgcmVmZXJlbmNlIHZvbHRhZ2UgZm9yIHBpbnMgdGhhdCBuZWVkIHRvIGFjY2VwdCBpbnB1dCAN
Cj4+PiBzaWduYWxzIGF0IGEgZGlmZmVyZW50IHZvbHRhZ2UgbGV2ZWwgdGhhbiB0aGVpciBwb3dl
ciBzdXBwbHkuIEZvciANCj4+PiBleGFtcGxlLCBhIHBpbiBwb3dlcmVkIGJ5IDMuM1YgbWF5IG5l
ZWQgdG8gYWNjZXB0IDEuOFYgbG9naWMgc2lnbmFscy4NCj4+PiANCj4+PiBUaGlzIGRlZmluZXMg
dGhlIHJlZmVyZW5jZSBmb3IgVklIIChJbnB1dCBIaWdoIFZvbHRhZ2UpIGFuZCBWSUwgDQo+Pj4g
KElucHV0IExvdw0KPj4+IFZvbHRhZ2UpIHRocmVzaG9sZHMsIGVuYWJsaW5nIHByb3BlciBzaWdu
YWwgZGV0ZWN0aW9uIGFjcm9zcyANCj4+PiBkaWZmZXJlbnQgdm9sdGFnZSBkb21haW5zLg0KPj4+
IA0KPj4+IFNpZ25lZC1vZmYtYnk6IFR6dXlpIENoYW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29tPg0K
Pj4+IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29t
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkByZWFsdGVrLmNv
bT4NCj4+PiAtLS0NCj4+PiBDaGFuZ2VzIGluIHYzOg0KPj4+IC0gUmViYXNlZCBvbnRvIHRoZSBk
ZXZlbCBicmFuY2ggb2YgdGhlIHBpbmN0cmwgdHJlZS4NCj4+PiAtIEltcHJvdmVkIGNvbW1pdCBt
ZXNzYWdlIGFuZCBkZXNjcmlwdGlvbi4NCj4+PiAtLS0NCj4+PiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY2ZnLW5vZGUueWFtbCB8IDUgDQo+Pj4gKysrKysN
Cj4+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPj4+IA0KPj4+IGRpZmYgLS1n
aXQgDQo+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5j
Zmctbm9kZS55YW1sIA0KPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvcGluY2ZnLW5vZGUueWFtbA0KPj4+IGluZGV4IGZlOTM2YWIwOTEwNC4uZmQ0OWEwZDUz
YmYwIDEwMDY0NA0KPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aW5jdHJsL3BpbmNmZy1ub2RlLnlhbWwNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9waW5jZmctbm9kZS55YW1sDQo+Pj4gQEAgLTE2Miw2ICsxNjIs
MTEgQEAgcHJvcGVydGllczoNCj4+PiAgICAgICAgdGhpcyBhZmZlY3RzIHRoZSBleHBlY3RlZCBk
ZWxheSBpbiBwcyBiZWZvcmUgbGF0Y2hpbmcgYSB2YWx1ZSB0bw0KPj4+ICAgICAgICBhbiBvdXRw
dXQgcGluLg0KPj4+ICANCj4+PiArICBpbnB1dC12b2x0YWdlLW1pY3Jvdm9sdDoNCj4+PiArICAg
IGRlc2NyaXB0aW9uOiBTcGVjaWZpZXMgdGhlIGlucHV0IHZvbHRhZ2UgbGV2ZWwgb2YgdGhlIHBp
biBpbiBtaWNyb3ZvbHRzLg0KPj4+ICsgICAgICBUaGlzIGRlZmluZXMgdGhlIHJlZmVyZW5jZSBm
b3IgIFZJSCAoSW5wdXQgSGlnaCBWb2x0YWdlKSBhbmQgVklMDQo+Pj4gKyAgICAgIChJbnB1dCBM
b3cgVm9sdGFnZSkgdGhyZXNob2xkcyBmb3IgcHJvcGVyIHNpZ25hbCBkZXRlY3Rpb24uDQo+PiAN
Cj4+IFNob3VsZCB0aGlzIGJlIGFkZGVkIGhlcmU6DQo+PiAgIC0gaWY6DQo+PiAgICAgICByZXF1
aXJlZDoNCj4+ICAgICAgICAgLSBpbnB1dC1kaXNhYmxlDQo+PiAgICAgdGhlbjoNCj4+ICAgICAg
IHByb3BlcnRpZXM6DQo+PiAgICAgICAgIGlucHV0LWVuYWJsZTogZmFsc2UNCj4+IA0KPj4gYW5k
IG1hZGUgbXV0dWFsbHkgZXhjbHVzaXZlIHdpdGggaW5wdXQtZGlzYWJsZT8NCj4NCg0KWWVzLCBJ
IHdpbGwgYWRkIHRoZSByZXN0cmljdCBhcyBmb2xsb3dzOg0KYWxsT2Y6DQogIC0gaWY6DQogICAg
ICByZXF1aXJlZDoNCiAgICAgICAgLSBpbnB1dC1kaXNhYmxlDQogICAgdGhlbjoNCiAgICAgIHBy
b3BlcnRpZXM6DQogICAgICAgIGlucHV0LWVuYWJsZTogZmFsc2UNCiAgICAgICAgaW5wdXQtdm9s
dGFnZS1taWNyb3ZvbHQ6IGZhbHNlDQoNCj4gQWxzbyBsb29raW5nIGF0IHYxLCBzaG91bGQgdGhp
cyBiZSBzb21ldGhpbmcgbGlrZSAiaW5wdXQtdGhyZXNob2xkLXZvbHRhZ2UtbWljcm92b2x0Ij8N
Cj4gImlucHV0LXZvbHRhZ2UtbWljcm92b2x0Ij8gZG9lc24ndCBzZWVtIHNwZWNpZmljIGVub3Vn
aCB0byB0aGUgZGVzY3JpYmVkIHVzZSBjYXNlLg0KPg0KDQpBZ3JlZWQuIEkgd2lsbCByZW5hbWUg
aXQgdG8gImlucHV0LXRocmVzaG9sZC12b2x0YWdlLW1pY3Jvdm9sdCIgaW4gdjQuDQoNCkJlc3Qg
UmVnYXJkcywNCll1LUNodW4NCg0KPiANCj4+PiArDQo+Pj4gIGFsbE9mOg0KPj4+ICAgIC0gaWY6
DQo+Pj4gICAgICAgIHJlcXVpcmVkOg0KPj4+IC0tDQo+Pj4gMi4zNC4xDQo+Pj4NCg==

