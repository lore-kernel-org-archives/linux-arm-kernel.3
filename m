Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DA3C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJcOsp7/4gBcZglC/7Pd3zJVofVyfh4TOUzPHB2LbyM=; b=YKKdWb2afxPTaxDO2X+FmTdTg1
	hf4QaTZjYsNeI/GbGI1r/kRqe5yWiiPuqlVD+xsEV8q4DD+ucGb82w3ij+3cu0COuIjakkZ6YASm4
	kGqKVrLKL5Dl1xWs8Mqk+WdZwKLTltMe4ui0NdQ6/1KRFFhfrxgmMdfE3q4WCUqPWXtzmG00H+EtL
	wN1YPorAfDU9Fl6YA9ju2udT2Qetv4+vevAoYtP9q9ZZT05gRb3vTh4Z2zys2VIHIZuWHQI3u3aOG
	3TYS81AQB1p4rTSADoijMrZQTXcd4nb1ulbBJdN4KWcdl69RxZLQYieLZ9goof0g7KA3mExhBHgYj
	LgLdA+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Beo-0000000BLOY-3s3R;
	Thu, 17 Sep 2026 12:56:06 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Bem-0000000BLN0-0feX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=hJcOsp7/4gBcZglC/7Pd3zJVofVyfh4TOUzPHB2LbyM=; b=b
	hDMZFuCwZhSkhaMjahcX5Bc05UtoeH3U7Sl3PP+Z0O5nklwxOkrfAsaVj1kzJ1/C
	Ph75WHXQ6Jwlmp3FaB5SqyXkkkLmh60LChtuTjj/FD/tHRgEBQYw7CSWjYln4dl9
	yKGQ/bZSPv+fNWsI53VzHJ5JbdjGW84sZEoBkxnOAo=
Date: Thu, 17 Sep 2026 20:55:15 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: longzhao@ambarella.com, "Arnd Bergmann" <arnd@arndb.de>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
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
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, "Lee Jones" <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: Re: [PATCH v7 12/15] pinctrl: ambarella: add CV75 pin
 controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <aqvbfCQ6cxfGYJeC@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-12-3297d3fbc9c0@ambarella.com>
 <aqp0VlwWotnuK9t7@ashevche-desk.local>
 <40f1f819.7f85.1a0ae9e4dae.Coremail.zl020895@163.com>
 <aqvbfCQ6cxfGYJeC@ashevche-desk.local>
X-NTES-SC: AL_Qu2TC/qftk8q4yGQY+kcn0wRhug/UMa4u/sm3YNXc+4Eqibs3gYGRG9PH0nv/8uJLS6Juh6wVSdN18d0QrRHMpJrKUK/9tD+DJuJ0EekfA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4bd10649.9ba9.1a0af6f7ffd.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aSgvCgAHvpUz46tqpbxGAA--.49547W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7hOK+2qr4zO2kQAA36
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_055604_591496_EED62E06 
X-CRM114-Status: GOOD (  10.82  )
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

VGhhbmtzLCBBbmR5LgoKUElOQ1RSTF9QSU5HUk9VUCBvbmx5IGNhcnJpZXMgcGluIG51bWJlcnMu
IFRoZSBJT01VWCBhbHQgaXMgbm90IHRoZQpwaW5jdHJsIGZ1bmN0aW9uOiB0aGUgc2FtZSBwaW4g
aXMgaW4gc2V2ZXJhbCBncm91cHMgd2l0aCBkaWZmZXJlbnQKYWx0cywgYW5kIGEgZmV3IGdyb3Vw
cyBtaXggYWx0cy4KCkluIHY4IEkgd2lsbCBzd2l0Y2ggdGhlIGdyb3VwIHRhYmxlcyB0byBQSU5D
VFJMX1BJTkdST1VQIGFuZCBwYXNzIGEKcGVyLXBpbiBhbHQgYXJyYXkgYXMgZ3JvdXAgZGF0YSBm
b3Igc2V0X211eCgpLiBQSU5DVFJMX1BJTkZVTkNUSU9OCnN0YXlzIGFzIGl0IGlzLgoKQmVzdCBy
ZWdhcmRzLApMb25nIFpoYW8KCkF0IDIwMjYtMDktMTcgMjA6MjI6MjAsICJBbmR5IFNoZXZjaGVu
a28iIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+T24gVGh1LCBT
ZXAgMTcsIDIwMjYgYXQgMDU6MDY6NDVQTSArMDgwMCwgemwwMjA4OTUgd3JvdGU6Cj4+IFRoYW5r
cyBmb3IgdGhlIHJldmlldy4gVGhlIHNtYWxsIGNvbW1lbnRzIHdpbGwgYmUgaW4gdjgsCj4+IGlu
Y2x1ZGluZyBwaW5jb25mIHNldCB2aWEgcmVnbWFwX2Fzc2lnbl9iaXRzLgo+PiAKPj4gUElOQ1RS
TF9QSU5HUk9VUCBkb2VzIG5vdCBmaXQgaGVyZTogZ3JvdXBzIGNhcnJ5Cj4+IEFNQkFfUElOTVVY
KHBpbiwgYWx0KSwgbm90IGEgcGluLW51bWJlciBsaXN0LCBzbyBJIHdpbGwga2VlcAo+PiBDVjc1
X0dST1VQLgo+Cj5JIGRpZG4ndCBnZXQuIEl0IHRha2VzIGEgcGluIGFzIGEgcGFyYW1ldGVyIGFu
ZCBhZGRzIHRoZSBmdW5jdGlvbiBvbiB0b3AKPm9mIGl0LiBJdCBpcyBhIGNvbWJvLCBidXQgSSB0
aGluayBpdCBzdGlsbCBmaXRzIHRoZSBwdXJwb3NlLiBQbGVhc2UsIHVzZQo+ZXhpc3RpbmcgZGF0
YSBzdHJ1Y3R1cmUgYW5kIGEgbWFjcm8uCj4KPj4gQXQgMjAyNi0wOS0xNiAxODo0OTo1OCwgIkFu
ZHkgU2hldmNoZW5rbyIgPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
Cj4+ID5PbiBUdWUsIFNlcCAxNSwgMjAyNiBhdCAwNzoxNTo0MlBNICswODAwLCBMb25nIFpoYW8g
dmlhIEI0IFJlbGF5IHdyb3RlOgo+Cj4uLi4KPgo+PiA+PiArI2RlZmluZSBBTUJBX1BJTk1VWChw
aW4sIGFsdCkJCSgoKGFsdCkgPDwgMTIpIHwgKHBpbikpCj4+ID4+ICsjZGVmaW5lIEFNQkFfUElO
TVVYX1RPX1BJTihtdXgpCQkoKG11eCkgJiAweGZmZikKPj4gPj4gKyNkZWZpbmUgQU1CQV9QSU5N
VVhfVE9fQUxUKG11eCkJCSgoKG11eCkgPj4gMTIpICYgMHg3KQo+PiA+PiArCj4+ID4+ICtzdHJ1
Y3QgYW1iX3Bpbm11eF9ncm91cCB7Cj4+ID4+ICsJY29uc3QgY2hhciAqbmFtZTsKPj4gPj4gKwlj
b25zdCB1MzIgKm11eDsKPj4gPj4gKwl1bnNpZ25lZCBpbnQgbm11eDsKPj4gPj4gK307Cj4KPl5e
XiBsZWZ0IGZvciB0aGUgY29udGV4dC4KPgo+Cj4tLSAKPldpdGggQmVzdCBSZWdhcmRzLAo+QW5k
eSBTaGV2Y2hlbmtvCj4K

