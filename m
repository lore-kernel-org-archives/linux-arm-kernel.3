Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D550C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 10:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bun7DXgfrzihoQdy+CxHxRyUuSdCirsltCFXqR+nYyI=; b=rs+RUCdvRgdtA0Fp0TDKtjA8ID
	ulTmBPFC3dfo3XnfVeH6iFRgoamSnxUuAmcQKPuz9WwQGkfKGCf723pYT5jop0W2pfDKpN49LShVf
	fGiZ2UpRiR3F32qxXqJ9ZhhBIcaaT9/1kWM7+okySP02ph+I5jGB+b4Bj7qmVmtNvpApXv6jMI/Tl
	gvwsjqtYXN9MXNLQr/Tw80ZTOOJ1ncYTt1kINRaRpWg0mFzp18PfmcZIWMgQ9mIpVRvxS3xI9tgZ9
	HEr6C4+LsmxrF+W+iwsmOAbo0Kw1QYSC5lFynD+/ZrDJSdkVG/CNXA/A4+TWLcpOgVGQQHj+Egwne
	l+nw0Ffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcsJ-00000004pSH-1Lmh;
	Tue, 15 Jul 2025 10:27:03 +0000
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net ([165.227.155.160])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcbq-00000004nrc-23iD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 10:10:05 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 15 Jul 2025 18:09:35 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Tue, 15 Jul 2025 18:09:35 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
	jszhang@kernel.org, jan.petrous@oss.nxp.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	boon.khai.ng@altera.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v3 2/2] ethernet: eswin: Add eic7700 ethernet driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <1b975a3e-ae1c-4354-90db-1f8d7ff567d3@kernel.org>
References: <20250528041455.878-1-weishangjuan@eswincomputing.com>
 <20250528041634.912-1-weishangjuan@eswincomputing.com>
 <1b975a3e-ae1c-4354-90db-1f8d7ff567d3@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2e8343eb.34d0.1980d8fa817.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgA3WxHfKHZon0WwAA--.12412W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEEDGh1MO8oigAAso
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_031002_826419_6CE3ADDF 
X-CRM114-Status: GOOD (  13.69  )
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

RGVhcsKgS3J6eXN6dG9mIEtvemxvd3NraSwKClRoYW5rIHlvdSBmb3IgeW91ciBwcm9mZXNzaW9u
YWwgYW5kIHZhbHVhYmxlIHN1Z2dlc3Rpb25zLgpPdXIgcXVlc3Rpb24gaXMgZW1iZWRkZWQgYmVs
b3cgeW91ciBjb21tZW50LgoKQmVzdCByZWdhcmRzLAoKCkxpIFpoaQpFc3dpbiBDb21wdXRpbmcK
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzJdIGV0aGVybmV0OiBlc3dpbjogQWRkIGVpYzc3
MDAgZXRoZXJuZXQgZHJpdmVyCj4gRGF0ZTogVGh1LCAzIEp1bCAyMDI1IDExOjUzOjMzICswMjAw
CVt0aHJlYWQgb3ZlcnZpZXddCj4gTWVzc2FnZS1JRDogPGYwOTZhZmExLTI2MGUtNGY4Yy04NTk1
LTNiNDE0MjViMjk2NEBrZXJuZWwub3JnPiAocmF3KQo+IEluLVJlcGx5LVRvOiA8MjAyNTA3MDMw
OTIwMTUuMTIwMC0xLXdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gT24gMDMvMDcv
MjAyNSAxMToyMCwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbSB3cm90ZToKPiA+ICsJ
cmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgocGRldi0+ZGV2Lm9mX25vZGUsICJlc3dp
bixzeXNjcmdfY3NyIiwgMSwKPiA+ICsJCQkJCSAmaHNwX2FjbGtfY3RybF9vZmZzZXQpOwo+ID4g
KwlpZiAocmV0KQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LCAi
Y2FuJ3QgZ2V0IGhzcF9hY2xrX2N0cmxfb2Zmc2V0XG4iKTsKPiA+ICsKPiA+ICsJcmVnbWFwX3Jl
YWQoZHdjX3ByaXYtPmNyZ19yZWdtYXAsIGhzcF9hY2xrX2N0cmxfb2Zmc2V0LCAmaHNwX2FjbGtf
Y3RybF9yZWdzZXQpOwo+ID4gKwloc3BfYWNsa19jdHJsX3JlZ3NldCB8PSAoRUlDNzcwMF9IU1Bf
QUNMS19DTEtFTiB8IEVJQzc3MDBfSFNQX0FDTEtfRElWU09SKTsKPiA+ICsJcmVnbWFwX3dyaXRl
KGR3Y19wcml2LT5jcmdfcmVnbWFwLCBoc3BfYWNsa19jdHJsX29mZnNldCwgaHNwX2FjbGtfY3Ry
bF9yZWdzZXQpOwo+ID4gKwo+ID4gPiArCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4
KHBkZXYtPmRldi5vZl9ub2RlLCAiZXN3aW4sc3lzY3JnX2NzciIsIDIsCj4gPiArCQkJCQkgJmhz
cF9jZmdfY3RybF9vZmZzZXQpOwo+ID4gKwlpZiAocmV0KQo+ID4gKwkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoJnBkZXYtPmRldiwgcmV0LCAiY2FuJ3QgZ2V0IGhzcF9jZmdfY3RybF9vZmZzZXRcbiIp
Owo+ID4gKwo+ID4gKwlyZWdtYXBfd3JpdGUoZHdjX3ByaXYtPmNyZ19yZWdtYXAsIGhzcF9jZmdf
Y3RybF9vZmZzZXQsIEVJQzc3MDBfSFNQX0NGR19DVFJMX1JFR1NFVCk7Cj4gPiArCj4gPiArCWR3
Y19wcml2LT5oc3BfcmVnbWFwID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShwZGV2
LT5kZXYub2Zfbm9kZSwKPiA+ICsJCQkJCQkJICAgICAgICJlc3dpbixoc3Bfc3BfY3NyIik7Cj4g
Cj4gVGhlcmUgaXMgbm8gc3VjaCBwcm9wZXJ0eS4gSSBhbHJlYWR5IHNhaWQgYXQgdjIgeW91IGNh
bm5vdCBoYXZlCj4gdW5kb2N1bWVudGVkIEFCSS4KPiAKClRoZSBwcm9wZXJ0aWVzIGluIHRoZSBZ
QU1MIGZpbGUgdXNlIGRhc2hlcywgd2hpbGUgdGhlIGRyaXZlciB1c2VzIHVuZGVyc2NvcmVzLCBy
ZXN1bHRpbmcgaW4gYW4gaW5jb25zaXN0ZW5jeS4gVGhpcyB3aWxsIGJlIGNvcnJlY3RlZCBpbiB0
aGUgbmV4dCBwYXRjaC4gSXMgdGhpcyBjb3JyZWN0PwoKPiA+ICsJaWYgKElTX0VSUihkd2NfcHJp
di0+aHNwX3JlZ21hcCkpCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQ
VFJfRVJSKGR3Y19wcml2LT5oc3BfcmVnbWFwKSwKPiA+ICsJCQkJIkZhaWxlZCB0byBnZXQgaHNw
X3NwX2NzciByZWdtYXBcbiIpOwo+ID4gKwo+ID4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3Uz
Ml9pbmRleChwZGV2LT5kZXYub2Zfbm9kZSwgImVzd2luLGhzcF9zcF9jc3IiLCAyLAo+IAo+IE5B
Swo+IAo+ID4gKwkJCQkJICZldGhfcGh5X2N0cmxfb2Zmc2V0KTsKPiA+ICsJaWYgKHJldCkKPiA+
ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgImNhbid0IGdldCBldGhf
cGh5X2N0cmxfb2Zmc2V0XG4iKTsKPiA+ICsKPiA+ICsJcmVnbWFwX3JlYWQoZHdjX3ByaXYtPmhz
cF9yZWdtYXAsIGV0aF9waHlfY3RybF9vZmZzZXQsICZldGhfcGh5X2N0cmxfcmVnc2V0KTsKPiA+
ICsJZXRoX3BoeV9jdHJsX3JlZ3NldCB8PSAoRUlDNzcwMF9FVEhfVFhfQ0xLX1NFTCB8IEVJQzc3
MDBfRVRIX1BIWV9JTlRGX1NFTEkpOwo+ID4gKwlyZWdtYXBfd3JpdGUoZHdjX3ByaXYtPmhzcF9y
ZWdtYXAsIGV0aF9waHlfY3RybF9vZmZzZXQsIGV0aF9waHlfY3RybF9yZWdzZXQpOwo+ID4gKwo+
ID4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChwZGV2LT5kZXYub2Zfbm9kZSwg
ImVzd2luLGhzcF9zcF9jc3IiLCAzLAo+ID4gKwkJCQkJICZldGhfYXhpX2xwX2N0cmxfb2Zmc2V0
KTsKPiA+ICsJaWYgKHJldCkKPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYs
IHJldCwgImNhbid0IGdldCBldGhfYXhpX2xwX2N0cmxfb2Zmc2V0XG4iKTsKPiA+ICsKPiA+ICsJ
cmVnbWFwX3dyaXRlKGR3Y19wcml2LT5oc3BfcmVnbWFwLCBldGhfYXhpX2xwX2N0cmxfb2Zmc2V0
LCBFSUM3NzAwX0VUSF9DU1lTUkVRX1ZBTCk7Cj4gPiArCj4gPiArCXBsYXRfZGF0LT5jbGtfdHhf
aSA9IGRldm1fY2xrX2dldF9lbmFibGVkKCZwZGV2LT5kZXYsICJ0eCIpOwo+ID4gKwlpZiAoSVNf
RVJSKHBsYXRfZGF0LT5jbGtfdHhfaSkpCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRl
di0+ZGV2LCBQVFJfRVJSKHBsYXRfZGF0LT5jbGtfdHhfaSksCj4gPiArCQkJCSJlcnJvciBnZXR0
aW5nIHR4IGNsb2NrXG4iKTsKPiA+ICsKPiA+ICsJcGxhdF9kYXQtPmZpeF9tYWNfc3BlZWQgPSBl
aWM3NzAwX3Fvc19maXhfc3BlZWQ7Cj4gPiArCXBsYXRfZGF0LT5zZXRfY2xrX3R4X3JhdGUgPSBz
dG1tYWNfc2V0X2Nsa190eF9yYXRlOwo+ID4gKwlwbGF0X2RhdC0+YnNwX3ByaXYgPSBkd2NfcHJp
djsKPiA+ICsKPiA+ICsJcmV0ID0gc3RtbWFjX2R2cl9wcm9iZSgmcGRldi0+ZGV2LCBwbGF0X2Rh
dCwgJnN0bW1hY19yZXMpOwo+ID4gKwlpZiAocmV0KQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJv
YmUoJnBkZXYtPmRldiwgcmV0LCAiRmFpbGVkIHRvIGRyaXZlciBwcm9iZVxuIik7Cj4gPiArCj4g
PiArCXJldHVybiByZXQ7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIGVpYzc3MDBfZHdtYWNfbWF0Y2hbXSA9IHsKPiA+ICsJeyAuY29tcGF0aWJsZSA9
ICJlc3dpbixlaWM3NzAwLXFvcy1ldGgiIH0sCj4gPiArCXsgfQo+ID4gK307Cj4gPiArTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgZWljNzcwMF9kd21hY19tYXRjaCk7Cj4gPiArCj4gPiArc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZWljNzcwMF9kd21hY19kcml2ZXIgPSB7Cj4gKwkucHJv
YmUgID0gZWljNzcwMF9kd21hY19wcm9iZSwKPiArCS5yZW1vdmUgPSBzdG1tYWNfcGx0ZnJfcmVt
b3ZlLAo+ICsJLmRyaXZlciA9IHsKPiArCQkubmFtZSAgICAgICAgICAgPSAiZWljNzcwMC1ldGgt
ZHdtYWMiLAo+ICsJCS5wbSAgICAgICAgICAgICA9ICZzdG1tYWNfcGx0ZnJfcG1fb3BzLAo+ICsJ
CS5vZl9tYXRjaF90YWJsZSA9IGVpYzc3MDBfZHdtYWNfbWF0Y2gsCj4gKwl9LAo+ICt9Owo+ICtt
b2R1bGVfcGxhdGZvcm1fZHJpdmVyKGVpYzc3MDBfZHdtYWNfZHJpdmVyKTsKPiArCj4gK01PRFVM
RV9BVVRIT1IoIkVzd2luIik7Cj4gCj4gRHJvcCwgdGhhdCdzIG5vdCBhIHBlcnNvbi4KPiAKPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCg==

