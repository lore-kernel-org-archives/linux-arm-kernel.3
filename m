Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CEDC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+U9NeyCw2uUc/iR5VKPiZXuak/wBBYadp2bG6uegDY=; b=TcZPIP8MygHcBOsI3N9rv1HmNr
	DOaqoUxIyslQ1tWAFPNIQRmmtWunFKKyAR7JnPt29bqmr0tRdMDWHoCV7fz/Ap/JLSWYLGzKEUET8
	W+2Xs/uI4Mngr8gDzbBznWHsmZpMhyYR0fIewnPDKXlzwcEPcEPMArcYFiDleGYRhpZnoFAdPxtJ2
	0L/0mlCmSQy4829+3hmjxDg0DjjJakmcmhaDbwkPR3vEjEbdZS7uIVexNIMmzCl2v3uV3iboQoKAk
	RUx9Lc+LjDIiE/n8koxpbRw8tm+ZCsRNSy77XZ6HH38uzy8gSmfPNRMzvu/YlhzeDQSR9EGtz15DI
	peCw/oKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7U7w-0000000Dq4K-0dKZ;
	Fri, 18 Sep 2026 08:39:24 +0000
Received: from mail-proxy25256.mail.163.com ([103.129.252.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7U7u-0000000Dq3G-16Al
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=A+U9NeyCw2uUc/iR5VKPiZXuak/wBBYadp2bG6uegDY=; b=W
	60BaHoParjrLUjIpIbGTR86wL4FMUqI3CTHzYhLCuakgAEm7b2KGZOm9QxFHF7Q7
	nHMIP9B++Yf+DQVScw6asQW8f0C+zb40TNbLN+M02ux7nmA28szYUxuyAuIekado
	TemWxt/GPOCYizg7vocTYzkUhIV8ljZsSBbhC87j/U=
Date: Fri, 18 Sep 2026 16:33:13 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Long Zhao" <longzhao@ambarella.com>, "Arnd Bergmann" <arnd@arndb.de>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Jerome Brunet" <jbrunet@baylibre.com>,
	"Linus Walleij" <linusw@kernel.org>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, "Lee Jones" <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v7 05/15] dt-bindings: gpio: pl061: add Ambarella
 CV75 variant
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260918-affable-aardvark-of-superiority-6a5ed2@quoll>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-5-3297d3fbc9c0@ambarella.com>
 <20260918-affable-aardvark-of-superiority-6a5ed2@quoll>
X-NTES-SC: AL_Qu2TC/uZv0si5SebYOkcn0wRhug/UMa4u/sm3YNXc+4EmTLm2QYGZWdKNl/tzP+PED+yqxGsciBy6c5ic7Z9DiZ4Z4Mjf+qV5QMl6Un47w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <258a5ebc.76e6.1a0b3a5f810.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aSgvCgBnH7lJ96xqT21HAA--.51648W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7QnVR2qs90mJ9AAA3z
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_013922_559492_5EB9823D 
X-CRM114-Status: GOOD (  13.84  )
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

SGkgS3J6eXN6dG9mLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LCB3aWxsIGZpeCB0aGUgY29tbWl0
IG1lc3NhZ2UgYW5kIFlBTUwgb3JkZXIgaW4gdjguCgpUaGUgQU1CQSBjb3JlIG1hdGNoZXMgdGhl
IFBMMDYxIGRyaXZlciBieSBQcmltZUNlbGwgSUQsIG5vdCBieSB0aGUgRFQgY29tcGF0aWJsZSBz
dHJpbmcuIFRoZXNlIGJhbmtzIGRvIG5vdCBpbXBsZW1lbnQgdGhlIHN0YW5kYXJkIFBMMDYxIElE
ICgweDAwMDQxMDYxKSwgc28gYXJtLHByaW1lY2VsbC1wZXJpcGhpZCBtdXN0IGJlIHNldDsgMHgw
MDBlODA2MSBpcyB0aGUgSUQgdGhlIGRyaXZlciB1c2VzIGZvciB0aGUgQW1iYXJlbGxhIGxheW91
dC4KClRoZXkgc2l0IG9uIHRoZSBQcmltZUNlbGwgYnVzIGJ1dCBhcmUgbm90IHJlZ2lzdGVyLWNv
bXBhdGlibGUgd2l0aCBhcm0scGwwNjEgKDMyLWJpdCwgMzIgbGluZXMsIGV4dHJhIG1hc2svZW5h
YmxlKSwgc28gYXJtLHBsMDYxIGlzIG5vdCBhIGZhbGxiYWNrLiBJIHdpbGwgc3BlbGwgdGhhdCBv
dXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKYWxsT2Ygd2lsbCBtb3ZlIGFmdGVyIHRoZSByZXF1
aXJlZDogYmxvY2suCgpCZXN0IHJlZ2FyZHMsCkxvbmcgWmhhbwoKQXQgMjAyNi0wOS0xOCAxNTox
NToyMSwgIktyenlzenRvZiBLb3psb3dza2kiIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+T24g
VHVlLCBTZXAgMTUsIDIwMjYgYXQgMDc6MTU6MzVQTSArMDgwMCwgTG9uZyBaaGFvIHdyb3RlOgo+
PiBBZGQgYW1iYXJlbGxhLGN2NzUtZ3BpbyBhcyBhIFByaW1lQ2VsbC1jb21wYXRpYmxlIFBMMDYx
IHZhcmlhbnQsIHdpdGgKPj4gYXJtLHByaW1lY2VsbC1wZXJpcGhpZCBhbmQgZ3Bpby1yYW5nZXMg
cmVxdWlyZWQuIFJlZmVyZW5jZQo+Cj5Zb3UganVzdCBkZXNjcmliZWQgdGhlIGRpZmYsIGJ1dCB0
aGlzIHNob3VsZCBleHBsYWluIHdoeSB5b3UgZG8gdGhlc2UKPmNoYW5nZXMuIFdoeSBhIGZpeGVk
IHBlcmlwaGlkIGlzIG5lZWRlZD8gSXNuJ3QgaXQgaW1wbGllZCBieSBjb21wYXRpYmxlPwo+Cj4+
IHByaW1lY2VsbC55YW1sIGFuZCB1c2UgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzLgo+PiAKPj4gU2ln
bmVkLW9mZi1ieTogTG9uZyBaaGFvIDxsb25nemhhb0BhbWJhcmVsbGEuY29tPgo+PiAtLS0KPj4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vcGwwNjEtZ3Bpby55YW1sICAgICAgIHwgMjUg
KysrKysrKysrKysrKysrKysrKy0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwaW8vcGwwNjEtZ3Bpby55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwaW8vcGwwNjEtZ3Bpby55YW1sCj4+IGluZGV4IDRkOTcwZTU1MTA0
Yi4uMDBkMGQ4ZGRkMmM5IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3Bpby9wbDA2MS1ncGlvLnlhbWwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwaW8vcGwwNjEtZ3Bpby55YW1sCj4+IEBAIC0xNSwxNyArMTUsMzYg
QEAgc2VsZWN0Ogo+PiAgICBwcm9wZXJ0aWVzOgo+PiAgICAgIGNvbXBhdGlibGU6Cj4+ICAgICAg
ICBjb250YWluczoKPj4gLSAgICAgICAgY29uc3Q6IGFybSxwbDA2MQo+PiArICAgICAgICBlbnVt
Ogo+PiArICAgICAgICAgIC0gYXJtLHBsMDYxCj4+ICsgICAgICAgICAgLSBhbWJhcmVsbGEsY3Y3
NS1ncGlvCj4+ICAgIHJlcXVpcmVkOgo+PiAgICAgIC0gY29tcGF0aWJsZQo+PiAgCj4+ICthbGxP
ZjoKPgo+YWxsT2Ygc2hvdWxkIGJlIHBsYWNlZCBhZnRlciAicmVxdWlyZWQ6IiBibG9jay4KPgo+
PiArICAtICRyZWY6IC9zY2hlbWFzL2FybS9wcmltZWNlbGwueWFtbCMKPj4gKyAgLSBpZjoKPj4g
KyAgICAgIHByb3BlcnRpZXM6Cj4+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4+ICsgICAgICAgICAg
Y29udGFpbnM6Cj4+ICsgICAgICAgICAgICBjb25zdDogYW1iYXJlbGxhLGN2NzUtZ3Bpbwo+PiAr
ICAgIHRoZW46Cj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICBhcm0scHJpbWVjZWxs
LXBlcmlwaGlkOgo+PiArICAgICAgICAgIGNvbnN0OiAweDAwMGU4MDYxCj4+ICsgICAgICByZXF1
aXJlZDoKPj4gKyAgICAgICAgLSBhcm0scHJpbWVjZWxsLXBlcmlwaGlkCj4+ICsgICAgICAgIC0g
Z3Bpby1yYW5nZXMKPj4gKwo+PiAgcHJvcGVydGllczoKPj4gICAgJG5vZGVuYW1lOgo+PiAgICAg
IHBhdHRlcm46ICJeZ3Bpb0BbMC05YS1mXSskIgo+PiAgCj4+ICAgIGNvbXBhdGlibGU6Cj4+ICAg
ICAgaXRlbXM6Cj4+IC0gICAgICAtIGNvbnN0OiBhcm0scGwwNjEKPj4gKyAgICAgIC0gZW51bToK
Pj4gKyAgICAgICAgICAtIGFtYmFyZWxsYSxjdjc1LWdwaW8KPj4gKyAgICAgICAgICAtIGFybSxw
bDA2MQo+Cj5TbyBhIFByaW1lQ2VsbC1jb21wYXRpYmxlIFBMMDYxIHZhcmlhbnQgd2hpY2ggaXMg
bm90IGNvbXBhdGlibGUgd2l0aAo+UEwwNjE/IFlvdSBoYXZlIGVudGlyZSBjb21taXQgbXNnIHRv
IGV4cGxhaW4gdGhhdCBhbmQgc2F5IHNvbWV0aGluZwo+bm9uLW9idmlvdXMgYWJvdXQgdGhlIGhh
cmR3YXJlLgo+Cj4+ICAgICAgICAtIGNvbnN0OiBhcm0scHJpbWVjZWxsCj4+ICAKPgo+QmVzdCBy
ZWdhcmRzLAo+S3J6eXN6dG9mCg==

