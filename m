Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33F5C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLgY3kGNMUhiuDbvekSroJmn4LdKkP1crGpWtw0K8y4=; b=0QmrklMezDmgkKPis/aRkByalC
	l5r5yc7EeYDhMTPQf0e+v8EbWjn6nJEA/MiWQl+vJVHeHPqjSUp18gx3b6iN3Gmw1yhw4gE9RXk/p
	v2hEn/0tImE6L+LnLCw4mP9vrb49GeLbKbNxg6XyyAdmol3hr1rsFwwpY6mT97EBrtcoFw+aj9ojY
	0mrJjEXkYNBSjqgAJVM9BxwSokbQbvRk2gqCVJtHt6/Z4Hb8XnLufH7bYJtaYHQ1rCDlY0r03OWB1
	HKY2ZjT34jYksZxQf5KIzPLdHvsY63pxWv9bHWo1UOlUZOqGlOkqlhy4MnMf8JW/32EziMmgx6ICh
	nW1LH0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4arV-0000000Dpoi-11Kl;
	Thu, 10 Sep 2026 09:14:29 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4arS-0000000Dpnn-08dy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=sLgY3kGNMUhiuDbvekSroJmn4LdKkP1crGpWtw0K8y4=; b=f
	DWqdEwz9pXonBk+xO+4U3bNgelCLO4lj0rllTbkgB1K6xwCo1+/kMnW1ufWvlA28
	Iyq2f54/PO4/i7l5bPHWh6R+xHAIpsqB5WSVLSDcR2zJY38WDDHHH9k2wXdjs85i
	XNj05+QQiiZG3crGx/famHpzxYg5kZlNGnnac7tHfs=
Date: Thu, 10 Sep 2026 17:12:52 +0800 (CST)
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
Subject: Re:Re: [PATCH v6 11/13] serial: 8250_dw: add Ambarella CV75 quirks
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <aqJrSnr0rwv4BOJ3@ashevche-desk.local>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com>
 <aqJrSnr0rwv4BOJ3@ashevche-desk.local>
X-NTES-SC: AL_Qu2TC/yYvk0s5CmQZekcn0wRhug/UMa4u/sm3YNXc/0EqiX9+T4sR2RaDHjs89yCBiKngRWUTRFQw9phRId03a0R+3XdO1UpGQhOrxxtfQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <122573f8.8232.1a08a9765fc.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cygvCgBXLkGVdKJqLs1DAA--.42107W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxRWF9mqidJVRiAAA3T
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_021426_445965_00145378 
X-CRM114-Status: GOOD (  11.18  )
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

SGkgQW5keSwKVGhhbmtzIGZvciB0aGUgUmV2aWV3ZWQtYnkuCgo+IFdvbmRlcmluZyBpZiB3ZSBz
aG91bGQgdW5kbyB0aGlzIGluIHRoZSBwb3J0J3MgLnNodXRkb3duKCkgY2FsbGJhY2suCkkgc2F3
IHRoZSBzaHV0ZG93biBwYXRoIGFscmVhZHkgY292ZXJzIGl0OiBkdzgyNTBfc2h1dGRvd24oKSBj
YWxscwpzZXJpYWw4MjUwX2RvX3NodXRkb3duKCksIHdoaWNoIGRvZXMKCXVwLT5pZXIgPSAwOwoJ
c2VyaWFsX3BvcnRfb3V0KHBvcnQsIFVBUlRfSUVSLCAwKTsKc28gYm90aCB0aGUgSUVSIHNoYWRv
dyBhbmQgaGFyZHdhcmUgSUVSIGFyZSBjbGVhcmVkLCBpbmNsdWRpbmcgRVRPSS4KCkJlc3QgcmVn
YXJkcywKTG9uZyBaaGFvCgpBdCAyMDI2LTA5LTEwIDE2OjMzOjE0LCAiQW5keSBTaGV2Y2hlbmtv
IiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPk9uIEZyaSwgU2Vw
IDA0LCAyMDI2IGF0IDAyOjM4OjE4UE0gKzA4MDAsIExvbmcgWmhhbyB2aWEgQjQgUmVsYXkgd3Jv
dGU6Cj4KPj4gVGhlIEFtYmFyZWxsYSBDVjc1IFVBUlQgaXMgQW1iYXJlbGxhIElQLCBub3QgYSBT
eW5vcHN5cyBEZXNpZ25XYXJlCj4+IGxpY2Vuc2VkIGJsb2NrLiBBdCB0aGUgcmVnaXN0ZXIgbGV2
ZWwgaXQgaXMgY2xvc2UgZW5vdWdoIHRvIERXIEFQQiBVQVJUCj4+IHRoYXQgYSBmdWxsIGN1c3Rv
bSBVQVJUIGRyaXZlciBpcyB1bm5lY2Vzc2FyeTogcmV1c2UgODI1MF9kdyB3aXRoIGEKPj4gc21h
bGwgcGxhdGZvcm0gcXVpcmsuCj4+IAo+PiBRdWlya3M6Cj4+IC0ga2VlcCBJRVIgRVRPSSAoYml0
IDUpIHNldCBmb3IgUlggdGltZW91dCBiZWhhdmlvdXIKPj4gLSBza2lwIHNldF9yYXRlOyBiYXVk
IGNsb2NrIGlzIG1hbmFnZWQgb3V0c2lkZSB0aGUgVUFSVCBibG9jawo+Cj5SZXZpZXdlZC1ieTog
QW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4KPi4u
Lgo+Cj4+ICtzdGF0aWMgaW50IGR3ODI1MF9pZXJfbWFza19zdGFydHVwKHN0cnVjdCB1YXJ0X3Bv
cnQgKnApCj4+ICt7Cj4+ICsJc3RydWN0IGR3ODI1MF9kYXRhICpkID0gdG9fZHc4MjUwX2RhdGEo
cC0+cHJpdmF0ZV9kYXRhKTsKPj4gKwlzdHJ1Y3QgdWFydF84MjUwX3BvcnQgKnVwID0gdXBfdG9f
dTgyNTBwKHApOwo+PiArCWludCByZXQ7Cj4+ICsKPj4gKwlyZXQgPSBzZXJpYWw4MjUwX2RvX3N0
YXJ0dXAocCk7Cj4+ICsJaWYgKHJldCkKPj4gKwkJcmV0dXJuIHJldDsKPj4gKwo+PiArCS8qCj4+
ICsJICogQW1iYXJlbGxhIGtlZXBzIHZhcmlhbnQgSUVSIGJpdHMgKGUuZy4gRVRPSSkgc2V0IGZv
ciBjb3JyZWN0IFJYCj4+ICsJICogdGltZW91dCBiZWhhdmlvdXIuIEZvcmNlIHRoZW0gaW50byB0
aGUgODI1MCBJRVIgc2hhZG93IHNvIGxhdGVyCj4+ICsJICogZ2VuZXJpYyBJRVIgdXBkYXRlcyBk
byBub3QgY2xlYXIgdGhlbS4KPj4gKwkgKi8KPgo+V29uZGVyaW5nIGlmIHdlIHNob3VsZCB1bmRv
IHRoaXMgaW4gdGhlIHBvcnQncyAuc2h1dGRvd24oKSBjYWxsYmFjay4KPgo+PiArCXVwLT5pZXIg
fD0gZC0+cGRhdGEtPmllcl9tYXNrOwo+PiArCXNlcmlhbF9wb3J0X291dChwLCBVQVJUX0lFUiwg
dXAtPmllcik7Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4gK30KPgo+LS0gCj5XaXRoIEJlc3QgUmVn
YXJkcywKPkFuZHkgU2hldmNoZW5rbwo+Cg==

