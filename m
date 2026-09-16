Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C31C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0brGLsUCM8OjbH30xJ1GI8+aQZaH1XqCveD1VKrsWZs=; b=FjMVKimsr+YEx52O2XbenplTa2
	VJW1CDK7NnyTTVUklj7HCq5zkUVGE3123orWVZOnwz4JHKHP+OA1XIrzXmHLyfBbQTFa9v80QmzUT
	EUfkpnlajkrByk4Y6ypbGdaH9vb8s2kEkwxndfpO0w2u/a16PcOO9HNsjNaWtfvengu09n2cNWzPk
	MzyPAvyKJvT89A26+oTVSVunhSuAqCt7vOdzyQV4vnVeYlWQxLFNTxVLnsJO3EQP7oW9aDif6tPqv
	ObyyV5SWg2F1AgwQ2z9FN4ZpHEoepYtUNoZSSaTQ83nhnPZrDt8z07Px9EGsuvs1eCDqdHTFv9Ga4
	Zqb2edGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hbg-00000008Kdb-35RD;
	Wed, 16 Sep 2026 04:50:53 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hbd-00000008Kbp-3nBG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=0brGLsUCM8OjbH30xJ1GI8+aQZaH1XqCveD1VKrsWZs=; b=c
	ozk4Wq4p0a+DYAskc3v9AeRJoPdFWFJor9rVy8GTBoM2VubqyAPdxTZ6dRvW8RyZ
	qXdVJoirnouBR8BM6pThOkUfT62bcjnWVEPGMy5OWgP6o852ML5VEF7Mn6bzmsEg
	Simst3JWQ+tkbh3OetC6/1WiW62pyZkPkW5yxTQPY4=
Date: Wed, 16 Sep 2026 12:49:46 +0800 (CST)
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
Subject: Re:Re: [PATCH v7 09/15] gpiolib: regmap: add gpio_regmap_get_chip()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <aqlknvOejkE5zutq@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-9-3297d3fbc9c0@ambarella.com>
 <aqlknvOejkE5zutq@ashevche-desk.local>
X-NTES-SC: AL_Qu2TC/mYu0kj4CiRZekcn0wRhug/UMa4u/sm3YNXc+gGgS7rxD0iflpxF2DKzOe1GTqXuzGSbTdPyMZYULtmDWHgzTizjvt8es72bjBGWA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <327d09fc.4043.1a0a88cad9b.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iCgvCgD334PqH6pqGGFHAA--.23892W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxgtHuGqqH+vnbAAA3N
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_215050_276545_287A5F9D 
X-CRM114-Status: GOOD (  10.73  )
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

SGkgQW5keSwgCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpJdCBpc24ndDsgdGhhdCB3YXMgbGVm
dG92ZXIgZnJvbSBkcm9wcGluZyBnaXJxLiB2OCB3aWxsIHJlc3RvcmUgdGhlCm9yaWdpbmFsIGF0
dGFjaCBjb2RlLiBUaGUgcmVhbCBhZGRpdGlvbiBpcyBncGlvX3JlZ21hcF9nZXRfY2hpcCgpLCBz
bwpQTDA2MSBjYW4gY3JlYXRlIGl0cyBpcnEgZG9tYWluIGFmdGVyIHJlZ2lzdGVyLgoKQmVzdCBy
ZWdhcmRzLApMb25nIFpoYW8KCkF0IDIwMjYtMDktMTUgMjM6MzA6MzgsICJBbmR5IFNoZXZjaGVu
a28iIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+T24gVHVlLCBT
ZXAgMTUsIDIwMjYgYXQgMDc6MTU6MzlQTSArMDgwMCwgTG9uZyBaaGFvIHZpYSBCNCBSZWxheSB3
cm90ZToKPgo+PiBMZXQgZHJpdmVycyB0aGF0IGltcGxlbWVudCBhIGN1c3RvbSBpcnFjaGlwIHJl
dHJpZXZlIHRoZSBncGlvX2NoaXAKPj4gYWZ0ZXIgcmVnaXN0cmF0aW9uLiBBdHRhY2ggYSBjYWxs
ZXItcHJvdmlkZWQgaXJxX2RvbWFpbiBvbmx5IHdoZW4gaXQKPj4gaXMgcHJlc2VudC4KPgo+Li4u
Cj4KPj4gIHN0cnVjdCBncGlvX3JlZ21hcCAqZ3Bpb19yZWdtYXBfcmVnaXN0ZXIoY29uc3Qgc3Ry
dWN0IGdwaW9fcmVnbWFwX2NvbmZpZyAqY29uZmlnKQo+PiAgewo+PiAtCXN0cnVjdCBpcnFfZG9t
YWluICppcnFfZG9tYWluOwo+PiAgCXN0cnVjdCBncGlvX3JlZ21hcCAqZ3BpbzsKPj4gIAlzdHJ1
Y3QgZ3Bpb19jaGlwICpjaGlwOwo+PiAgCWludCByZXQ7Cj4KPj4gICNpZmRlZiBDT05GSUdfUkVH
TUFQX0lSUQo+PiAgCWlmIChjb25maWctPnJlZ21hcF9pcnFfY2hpcCkgewo+PiArCQlzdHJ1Y3Qg
aXJxX2RvbWFpbiAqaXJxX2RvbWFpbjsKPj4gKwo+PiAgCQlncGlvLT5yZWdtYXBfaXJxX2xpbmUg
PSBjb25maWctPnJlZ21hcF9pcnFfbGluZTsKPj4gIAkJcmV0ID0gcmVnbWFwX2FkZF9pcnFfY2hp
cF9md25vZGUoZGV2X2Z3bm9kZShjb25maWctPnBhcmVudCksIGNvbmZpZy0+cmVnbWFwLAo+PiAg
CQkJCQkJIGNvbmZpZy0+cmVnbWFwX2lycV9saW5lLCBjb25maWctPnJlZ21hcF9pcnFfZmxhZ3Ms
Cj4+IEBAIC00MjAsMTIgKzQyNywxNSBAQCBzdHJ1Y3QgZ3Bpb19yZWdtYXAgKmdwaW9fcmVnbWFw
X3JlZ2lzdGVyKGNvbnN0IHN0cnVjdCBncGlvX3JlZ21hcF9jb25maWcgKmNvbmZpZwo+PiAgCQkJ
Z290byBlcnJfcmVtb3ZlX2dwaW9jaGlwOwo+PiAgCj4+ICAJCWlycV9kb21haW4gPSByZWdtYXBf
aXJxX2dldF9kb21haW4oZ3Bpby0+aXJxX2NoaXBfZGF0YSk7Cj4+ICsJCWlmIChpcnFfZG9tYWlu
KSB7Cj4+ICsJCQlyZXQgPSBncGlvY2hpcF9pcnFjaGlwX2FkZF9kb21haW4oY2hpcCwgaXJxX2Rv
bWFpbik7Cj4+ICsJCQlpZiAocmV0KQo+PiArCQkJCWdvdG8gZXJyX3JlbW92ZV9ncGlvY2hpcDsK
Pj4gKwkJfQo+PiAgCX0gZWxzZQo+PiAgI2VuZGlmCj4+IC0JaXJxX2RvbWFpbiA9IGNvbmZpZy0+
aXJxX2RvbWFpbjsKPj4gLQo+PiAtCWlmIChpcnFfZG9tYWluKSB7Cj4+IC0JCXJldCA9IGdwaW9j
aGlwX2lycWNoaXBfYWRkX2RvbWFpbihjaGlwLCBpcnFfZG9tYWluKTsKPj4gKwlpZiAoY29uZmln
LT5pcnFfZG9tYWluKSB7Cj4+ICsJCXJldCA9IGdwaW9jaGlwX2lycWNoaXBfYWRkX2RvbWFpbihj
aGlwLCBjb25maWctPmlycV9kb21haW4pOwo+PiAgCQlpZiAocmV0KQo+PiAgCQkJZ290byBlcnJf
cmVtb3ZlX2dwaW9jaGlwOwo+PiAgCX0KPgo+SSBkbyBub3QgdW5kZXJzdGFuZCBob3cgaXQncyBk
aWZmZXJlbnQgZnJvbSB0aGUgb3JpZ2luYWwgb25lLiBDYW4geW91IGVsYWJvcmF0ZT8KPgo+LS0g
Cj5XaXRoIEJlc3QgUmVnYXJkcywKPkFuZHkgU2hldmNoZW5rbwo+Cg==

