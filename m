Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE81C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xL+CoTR59C4km0YBHA8/+2wEU5OAHfxf36Bb0007UXs=; b=Q+tBTCtIuG75MN43bAmwA7g2Hv
	otC6tWmHoshyFgRlyj3l/izuoQCt23Vqkg9zekAFTHUhyQuC0ZbLsVzoF9jNG2dUJXzFDcHPFA94w
	AsUBwFq3IOrcaMZ/pcB7lGQw/rRIgSgTlXm+8YgnbLbiP5K3m22QuIWEDcQqh7ZO7aJYZnKUSMhbM
	csp2SMZizEa6bCatiFRIhgB2laExVA6pXNHnJERtecstho5sR28+UaXc5jxaNea2qCI/x30+ky0NK
	Yy86N6lb54q2g7tJ5P4u2DS5vvXoAZPaY18ECTjnh6/XSrJUK2RfHhnymuNKRZ1WrOfzf3YMUNYf2
	WQwpU2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x276W-0000000HNFT-2rPV;
	Thu, 03 Sep 2026 13:03:44 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x276S-0000000HNEe-1det
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=xL+CoTR59C4km0YBHA8/+2wEU5OAHfxf36Bb0007UXs=; b=V
	Tbqw2/FmwS4BYiHW0rwmkxQUU0Vnv7sRkl9W17mQb+gRraw7iOPsVJH/rs7FQ/k7
	lDtHJXYlEF52X63tlpJ4wpttQpf/FkF6NedBUeTYruurmpE7kWZ56aYIr/pGZE5z
	KGl9m3KFo4lTw9AmXh7WBnFsSUJ4HWh5MA3OVGU89Q=
Received: from zl020895$163.com ( [2408:84e2:4b0:1b4c:d51e:e49:24cd:960c] )
 by ajax-webmail-wmsvr-40-115 (Coremail) ; Thu, 3 Sep 2026 21:01:58 +0800
 (CST)
X-Originating-IP: [2408:84e2:4b0:1b4c:d51e:e49:24cd:960c]
Date: Thu, 3 Sep 2026 21:01:58 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: longzhao <longzhao@ambarella.com>, "Arnd Bergmann" <arnd@arndb.de>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>,
	soc <soc@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Linus Walleij" <linusw@kernel.org>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-gpio <linux-gpio@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Brian Masney" <bmasney@redhat.com>, "Lee Jones" <lee@kernel.org>,
	mfd <mfd@lists.linux.dev>
Subject: Re:Re: Re: Re: [PATCH v5 10/12] serial: 8250: add Ambarella UART
 driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <aplttDenvZHvn0mF@ashevche-desk.local>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-10-7bbb12f0360f@ambarella.com>
 <aoRpc2RK2_X3CdAi@ashevche-desk.local>
 <162c0385.2c076.1a018b82fa7.Coremail.zl020895@163.com>
 <aplcxoINt0YAjvxL@ashevche-desk.local>
 <709278f9.9699.1a067207b4c.Coremail.zl020895@163.com>
 <aplttDenvZHvn0mF@ashevche-desk.local>
X-NTES-SC: AL_Qu2TCvifv00q7iCeYekcn0wRhug/UMa4u/sm3YNXc/0Esj/kyz4scntFDXrp/eCXEz6OlTaJfwFx48pKcKVZvW+TqzbAigqlbyZHIiayZw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <3a51b3fb.9b8c.1a0675c9db8.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cygvCgD3_4DGb5lqPuE+AA--.16267W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7gYOf2qZb8YJQwAA3J
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_060341_289099_C9DF181B 
X-CRM114-Status: GOOD (  13.86  )
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

SSBzZWUuIFRoYW5rIHlvdSwgQW5keS4KCkJlc3QgcmVnYXJkcywKTG9uZyBaaGFvCgpBdCAyMDI2
LTA5LTAzIDIwOjUzOjA4LCAiQW5keSBTaGV2Y2hlbmtvIiA8YW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPk9uIFRodSwgU2VwIDAzLCAyMDI2IGF0IDA3OjU2OjE3UE0g
KzA4MDAsIHpsMDIwODk1IHdyb3RlOgo+PiAKPj4gVGhhbmtzIGZvciB0aGUgY29uZmlybWF0aW9u
LiAKPj4gSSB3aWxsIGtlZXAgODI1MF9hbWJhcmVsbGEgYW5kIHVwZGF0ZSB0aGUgY29tbWl0IG1l
c3NhZ2UgYXMgeW91Cj4+IHN1Z2dlc3RlZC4KPgo+Tm8sIEkgbWVhbiB0byBnbyBiYWNrIHRvIHRo
ZSB2ZXJzaW9uIHRoYXQgbW9kaWZpZXMgODI1MF9kdy4KPgo+PiBBdCAyMDI2LTA5LTAzIDE5OjQw
OjU0LCAiQW5keSBTaGV2Y2hlbmtvIiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29t
PiB3cm90ZToKPj4gPk9uIFdlZCwgQXVnIDE5LCAyMDI2IGF0IDAyOjMxOjU5UE0gKzA4MDAsIHps
MDIwODk1IHdyb3RlOgo+PiA+PiAKPj4gPj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+PiA+Cj4+
ID4+IFRoaXMgaXMgQW1iYXJlbGxhIDgyNTAtY29tcGF0aWJsZSBJUCwgbm90IFN5bm9wc3lzIERl
c2lnbldhcmUuIFdlCj4+ID4+IGZpcnN0IHRyaWVkIDgyNTBfZHcgYWZ0ZXIgTGludXMgYXNrZWQg
dXMgdG8gbW92ZSB0byB0aGUgODI1MCBsaWJyYXJ5Owo+PiA+PiB5b3UgdGhlbiB0b2xkIHVzIG5v
dCB0byB0b3VjaCA4MjUwX2R3IGFuZCB0byB1c2UgODI1MF9hbWJhcmVsbGEKPj4gPj4gaW5zdGVh
ZC4gVGhhdCBpcyB3aGF0IHRoaXMgcGF0Y2ggaXMuCj4+ID4+IEJhY2tncm91bmQ6Cj4+ID4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvQ0FEKytqTG02SHpFVTFUTS1jPVZ0anYzRkpFQmVjVlA3
VHl4U2dxX1EwekYtWXdUNk5BQG1haWwuZ21haWwuY29tLwo+PiA+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1zZXJpYWwvYW44S3Z2SFdYMG5hSDNYd0Bhc2hldmNoZS1kZXNrLmxvY2Fs
Lwo+PiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1zZXJpYWwvN0U3NzQzMDUtMzky
MC00QkI3LUJBNDYtRTA3NzJENkJFRDg0QGFtYmFyZWxsYS5jb20vCj4+ID4+IEkgd2lsbCBhbHNv
IHN3aXRjaCB0byB1YXJ0X3JlYWRfcG9ydF9wcm9wZXJ0aWVzKCkgYW5kIHRyaW0gdGhlCj4+ID4+
IDgyNTBfZHctZGVyaXZlZCBib2lsZXJwbGF0ZS4KPj4gPgo+PiA+VGhhbmtzIGZvciB0aGUgcmVn
aXN0ZXIgZGVzY3JpcHRpb25zLCBpdCB3YXMgaGVscGZ1bC4gQWZ0ZXIgZ29pbmcgdGhyb3VnaCB0
aGVtCj4+ID5pdCBzZWVtcyB0aGUgdjMgYXMgeW91IG1hZGUgaXQgaXMgZ29vZCBlbm91Z2ggKHNv
cnJ5IGZvciBnb2luZyBiYWNrIGFuZCBmb3J0aCkuCj4+ID5XaGF0IGl0IG5lZWRzIGlzIGJldHRl
ciBjb21taXQgbWVzc2FnZSBleHBsYWluaW5nIHRoYXQgd2hpbGUgaXQncyBub3QgYSBTeW5vcHN5
cwo+PiA+RFcgSVAsIGl0IHdhcyBtYWRlIHRvIGJlIHF1aXRlIGNvbXBhdGlibGUgd2l0aCB0aGF0
IChvbiByZWdpc3RlciBsZXZlbCkgYW5kIGhlbmNlCj4+ID5ubyBuZXcgZHJpdmVyIGlzIHJlcXVp
cmVkLCBqdXN0IGEgc21hbGwgcXVpcmsuCj4KPi0tIAo+V2l0aCBCZXN0IFJlZ2FyZHMsCj5BbmR5
IFNoZXZjaGVua28KPgo=

