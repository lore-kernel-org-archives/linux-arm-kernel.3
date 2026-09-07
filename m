Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7CEC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izwwPFEZ2YDHlpNeAWpO9gjIXl3/uRvj1NTux/WAIB4=; b=W43qs5pirlnLxX1SnTgDqFv3XP
	RwFmMofa62FoaMstFqp6WqGunrOT0GRUB53qn4ImJkIagT1D8qgz5FVjyWp/MTTdBnPHipLqzvqf1
	uV0UWPUDdOmP7RkXCXCJisNtHmdixGIh+pMtmAqrLUoszetuFfJTm5WWW2nIEUFRWdX2+klN5VGYt
	AfIqlrQvDlo2SakgVla++8cl/tdCgqoW5EKrW2W8mGS+7qTDTfXQVEHJDx+xHZvq4F4TQ3xZAkdOX
	UKJU9QaC/gGZBdcSE4oAGHJfSlk1ZUAJk6Xzb1EO4SxX+VcCAS3xfu7ELR758RUofApp9bQ2lgIps
	X/zT31XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WdP-00000006UUY-1Xa3;
	Mon, 07 Sep 2026 10:31:31 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WdK-00000006USh-1r1o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=izwwPFEZ2YDHlpNeAWpO9gjIXl3/uRvj1NTux/WAIB4=; b=m
	z9s2nX1g4LUKLmfdjmG1a2TzjIbwl9fjS8Zzru0oHZeUAVhTgNFR+KwATq79L4Fk
	cCUPFv89OTZQN2C3/3Y3owqWbabwjWCnuFWjPlmttiAOCqb1SV5iSTO+ilfURmQA
	JJJ5kFlAMZL8EiHr0W/BfDUxKNJ5obVNJgNP/TyEqs=
Date: Mon, 7 Sep 2026 18:29:47 +0800 (CST)
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
Subject: Re:Re: Re: [PATCH v6 08/13] gpio: regmap: support
 write_data_after_dir and girq
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <ap5BgWtHMAxl28wF@ashevche-desk.local>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-8-e918514cb3b1@ambarella.com>
 <apqxwRgi-uVKkOpr@ashevche-desk.local>
 <27a1901.423e.1a07a183bd4.Coremail.zl020895@163.com>
 <ap5BgWtHMAxl28wF@ashevche-desk.local>
X-NTES-SC: AL_Qu2TCvucuUEj4SSaZ+kcn0wRhug/UMa4u/sm3YNXc+8GoC3f4joEek5lHXDK79C+JR6CqT2UbRFW0t1ffJNTQiBizjLGGro2SdHZZlp2GQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6ca46138.9970.1a07b6abb25.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kygvCgD3P+kbkp5qdBRBAA--.16072W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxhvsXmqekhuDRgAA3X
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_033126_911785_3CF41287 
X-CRM114-Status: GOOD (  16.31  )
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

SGkgQW5keSwKClRoYW5rcyBmb3IgdGhlIGJ4dHdjIHBvaW50ZXIuCgpJIGxvb2tlZCBhdCBtYXBw
aW5nIFBMMDYxIG9udG8gcmVnbWFwLWlycS4gU3RhdHVzL21hc2svYWNrIChNSVMvSUUvSUMpCmNv
dWxkIGZpdCwgYnV0IFBMMDYxIHN0aWxsIG5lZWRzIHRoZSBjaGFpbmVkIGRlbXV4IHBsdXMgSVMv
SUJFL0lFViB0eXBlCnByb2dyYW1taW5nIChpbmNsdWRpbmcgRURHRV9CT1RIKSBhbmQgdGhlIGV4
aXN0aW5nIGdwaW9jaGlwIGltbXV0YWJsZQpoZWxwZXJzLiBUaGF0IGxvb2tzIGxpa2UgYSBwb29y
IGZpdCB2ZXJzdXMgaWRpLTQ4L2J4dHdjLXN0eWxlIGNoaXBzLCBhbmQKc3dpdGNoaW5nIHRoZSBs
b25nLXN0YW5kaW5nIEFSTSBQTDA2MSBwYXRoIGZyb20gY2hhaW5lZCB0byB0aHJlYWRlZApyZWdt
YXAtaXJxIHNlZW1zIHJpc2t5LgoKV2hhdCBJIHBsYW4gZm9yIHRoZSBuZXh0IHJvdW5kICh3aXRo
b3V0IGV4dGVuZGluZyBncGlvLXJlZ21hcCB3aXRoIGdpcnEpOgprZWVwIHRoZSBjdXN0b20gaXJx
Y2hpcCArIGNoYWluZWQgaGFuZGxlciwgY3JlYXRlIHRoZSBpcnFfZG9tYWluIGluCmdwaW8tcGww
NjEsIGFuZCBwYXNzIGl0IHZpYSBjb25maWcuaXJxX2RvbWFpbiB0byBncGlvLXJlZ21hcC4KCkRv
ZXMgdGhhdCBtYXRjaCB3aGF0IHlvdSBoYWQgaW4gbWluZCwgb3IgZG8geW91IHN0aWxsIHByZWZl
ciBhCnJlZ21hcC1pcnEtYmFzZWQgYXBwcm9hY2g/CgpCZXN0IHJlZ2FyZHMsCkxvbmcgWmhhbwoK
QXQgMjAyNi0wOS0wNyAxMjo0NTo1MywgIkFuZHkgU2hldmNoZW5rbyIgPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj5PbiBNb24sIFNlcCAwNywgMjAyNiBhdCAxMjoy
MDowM1BNICswODAwLCB6bDAyMDg5NSB3cm90ZToKPgo+PiA+IEFyZSB5b3UgZ29pbmcgdG8gZml4
IHRoaXMgSFcgaW4gdGhlIG5leHQgdmVyc2lvbiBvZiB0aGUgU29DPwo+PiBObyDigJQgQW1iYXJl
bGxhIGRvZXMgbm90IHVzZSB3cml0ZV9kYXRhX2FmdGVyX2Rpci4gSXQgb25seSBwcmVzZXJ2ZXMg
dGhlCj4+IGV4aXN0aW5nIEFSTSBQTDA2MSBxdWlyayBhbHJlYWR5IGRvY3VtZW50ZWQgaW4gZ3Bp
by1wbDA2MSAoZGF0YSB3cml0ZXMKPj4gaWdub3JlZCB3aGlsZSB0aGUgcGluIGlzIHN0aWxsIGFu
IGlucHV0KS4gT25seSBwbDA2MV9hcm0gc2V0cyB0aGUgZmxhZy4KPgo+QWgsIHRoaXMgaXMgYSBn
b29kIG5ld3MhCj4KPkluIGFueSBjYXNlIHdoZW4gZG9jdW1lbnRpbmcgdGhhdCBmbGFnLCBwbGVh
c2UgYWxzbyBtZW50aW9uIHRoYXQgYW55IG5ldyBIVwo+c2hvdWxkIG5vdCB1c2UgaXQgYXMgaXQn
cyBjb25zaWRlcmVkIGJ1Z2d5IChnbGl0Y2hlcyBkdXJpbmcgZGlyZWN0aW9uIGNoYW5nZQo+YXJl
IGd1YXJhbnRlZWQpLgo+Cj4+IEkgd2lsbCBhbHNvIG1ha2UgdGhlIGZpcnN0IGdwaW9fcmVnbWFw
X3NldCgpIGNvbmRpdGlvbmFsIHNvIHRoZSBxdWlyawo+PiBwYXRoIHdyaXRlcyBvbmNlIGFmdGVy
IGRpcmVjdGlvbl9vdXRwdXQsIG5vdCB0d2ljZS4KPgo+SSBzZWUgdGhhdCBvcmlnaW5hbCBwbDA2
MSBhY3R1YWxseSB3cml0ZXMgdHdpY2UuIFRCSCBJIGRvbid0IGtub3cgdGhlIGJlc3QKPmVmZm9y
dCBoZXJlIGFuZCBpZiBpdCdzIHJlYWxseSByZXF1aXJlZCB0byBkbyBzby4gUHJvYmFibHkgb3Ro
ZXJzIGhhdmUKPmJldHRlciBpZGVhcy4uLgo+Cj4+ID4gVGhpcyBuZWVkcyB0byBiZSBpbiBhIHNl
cGFyYXRlIHVwZGF0ZS4gQWxzbyB3ZSBuZWVkIHRvIHVuZGVyc3RhbmQgd2h5Cj4+ID4gaXQgaXMg
cmVxdWlyZWQuCj4+IE9LLCBnaXJxIHdpbGwgYmUgYSBzZXBhcmF0ZSBwYXRjaC4gUEwwNjEga2Vl
cHMgYSBjdXN0b20gY2hhaW5lZAo+PiBpcnFjaGlwIChub3QgcmVnbWFwLWlycSk7IGdwaW9fcmVn
bWFwIHRvZGF5IG9ubHkgdGFrZXMgaXJxX2RvbWFpbiBvcgo+PiByZWdtYXBfaXJxX2NoaXAsIHNv
IHdlIHBhc3NlZCBnaXJxIHRvIGtlZXAgdGhlIHVzdWFsIGdwaW9faXJxX2NoaXAgKwo+PiBncGlv
Y2hpcF9hZGQgZmxvdy4gT3BlbiB0byB1c2luZyBhIGNhbGxlci1jcmVhdGVkIGlycV9kb21haW4g
aW5zdGVhZCBpZgo+PiB5b3UgcHJlZmVyLgo+Cj5JZiB0aGVyZSBpcyBhIGNoYWluZWQgSVJRLCBs
b29rIGhvdyBQTUlDIGRyaXZlcnMgdXN1YWxseSBkbyBzaW1pbGFyIHNldHVwcy4KPkZpcnN0IHdo
YXQgY29tZXMgdG8gbXkgbWluZCBpcyBkcml2ZXJzL21mZC9pbnRlbF9zb2NfcG1pY19ieHR3Yy5j
Lgo+Cj4tLSAKPldpdGggQmVzdCBSZWdhcmRzLAo+QW5keSBTaGV2Y2hlbmtvCj4K

