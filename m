Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECDCCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+P9dxchY5SJkktkl8TcKYhsAOXSaRJWlUgjAz3ODR0=; b=E1zKX2XpwVR7OBEaZo5CHHiGgm
	B1Qm1mHQaK2bNMPdhmMayaX+oKuYvZ2HoxrvO6bHejqymdNZjMzbaomcCVsMBLpdqaWIxn+qZ11iM
	sLcnkiYMn5lm7CY8JIDBYjw7F8dXbTgk9rJjSph6mCl+r+hX5J6j5luP3h2EL92IxPHHnOoQjONYY
	F7PxPhGspY+qMWR1Qmr0HyXxk+hTCAWra+d0CCU0ITRDYkCbkfxPbC4+Zw+YKlqMDWpGJ3wb7/eR1
	q571UBdkQrOgFQ1rtZomRY2R04iBnFKFozu1WfDvmf4hCnGQ/eSwidmPMTplgNLifaewVHcYU/xyY
	QikPQhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unAmB-00000004AR7-47Zq;
	Sat, 16 Aug 2025 06:52:27 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unAjd-00000004AJg-1my6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 06:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=t2FIL0R2g0j7CPoPJZf3RTeZF3I0HPipz6v385+gi4A=; b=Y
	FtkgtcP2U8ZDKFYRT3cEP5UXb6dddKNlD7TqxuRwIg9Xl5yx4SdSbJW20xdNbtwk
	cp9zNKGctmYKLMMPcOGaHg2dCcHKkW1u88Lf7mH3lRwkytqtdd+B7jaYqK5BVax5
	0Sr2b/1MJ8taAa3x0nHpxPA87JE0SXigzN2nN8N3U0=
Received: from 15074444048$163.com ( [116.128.244.169] ) by
 ajax-webmail-wmsvr-40-149 (Coremail) ; Sat, 16 Aug 2025 14:49:21 +0800
 (CST)
X-Originating-IP: [116.128.244.169]
Date: Sat, 16 Aug 2025 14:49:21 +0800 (CST)
From: =?GBK?B?wO66wL3c?= <15074444048@163.com>
To: "Mark Brown" <broonie@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev,
	maz@kernel.org, joey.gouly@arm.com, james.morse@arm.com,
	miko.lenczewski@arm.com, yangyicong@hisilicon.com,
	robin.murphy@arm.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, lihaojie <lihaojie@kylinos.cn>
Subject: Re: [PATCH] arm64: cpufeature: Replace inline with __always_inline
 for GCS checks
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <4ac4f0d0-fa5e-4c47-bcdb-fc2a65450848@sirena.org.uk>
References: <20250815011905.1368058-1-15074444048@163.com>
 <4ac4f0d0-fa5e-4c47-bcdb-fc2a65450848@sirena.org.uk>
X-NTES-SC: AL_Qu2eB/+ZuUEt5yibYukfmkgajuw7XcK5v/Un3IBXOZFwjCLr1BgxR3xEJUTE89qCCB2trR+QYDxHzcJGRpFEX58oepg+dUNSY44EssKFraRpPA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <5bc224c7.18fa.198b1a3d8b4.Coremail.15074444048@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: lSgvCgD3n5PyKaBomDQbAA--.392W
X-CM-SenderInfo: rprvilauuukiiuy6il2tof0z/1tbiMQurUGif4h9jhgAEsq
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_234949_775620_506BC39E 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

CgoKCgoKCgoKCgoKCkF0IDIwMjUtMDgtMTUgMjM6Mzg6MTEsICJNYXJrIEJyb3duIiA8YnJvb25p
ZUBrZXJuZWwub3JnPiB3cm90ZToKPk9uIEZyaSwgQXVnIDE1LCAyMDI1IGF0IDA5OjE5OjA1QU0g
KzA4MDAsIDE1MDc0NDQ0MDQ4QDE2My5jb20gd3JvdGU6Cj4KPj4gV2hlbiB1c2UgX19hbHdheXNf
aW5saW5lIFRoZSBjb21waWxlciB3aWxsIGFsbW9zdCBjZXJ0YWlubHkgaW5saW5lCj4+IHN5c3Rl
bV9zdXBwb3J0c19nY3MsIHdoaWNoIGFsbG93cyB0aGUgY29tcGlsZXIgdG8gb3B0aW1pemUgYW5k
IGNoZWNrCj4+IGVhcmxpZXIgZHVyaW5nIHRoZSBjb21waWxhdGlvbiBwaGFzZS4gSWYgc3lzdGVt
X3N1cHBvcnRzX2djcygpIHJldHVybnMKPj4gZmFsc2UsIHRoZW4gdGhlIGxpbmUgb2YgY29kZSBy
ZXN0b3JlX2djc19jb250ZXh0ICgmdXNlcikgd2lsbCBub3QKPj4gYWN0dWFsbHkgYmUgZ2VuZXJh
dGVkLCBzbyB0aGUgY29tcGlsZXIgd2lsbCBub3QgcmVwb3J0IGFuIGVycm9yLgo+Cj4+IC1zdGF0
aWMgaW5saW5lIGJvb2wgc3lzdGVtX3N1cHBvcnRzX2djcyh2b2lkKQo+PiArc3RhdGljIF9fYWx3
YXlzX2lubGluZSBib29sIHN5c3RlbV9zdXBwb3J0c19nY3Modm9pZCkKPj4gIHsKPj4gIAlyZXR1
cm4gYWx0ZXJuYXRpdmVfaGFzX2NhcF91bmxpa2VseShBUk02NF9IQVNfR0NTKTsKPj4gIH0KPgo+
SWYgd2UncmUgZG9pbmcgdGhpcyBmb3Igb25lIG9mIHRoZSBzeXN0ZW1fc3VwcG9ydHNfZm9vKCkg
ZnVuY3Rpb25zIHdlCj5zaG91bGQgZG8gaXQgZm9yIGFsbCBvZiB0aGVtIGNvbnNpc3RlbnRseSwg
bm90IGp1c3QgZm9yIG9uZSByYW5kb20gb25lLgoKVGhhbmtzIGZvciB5b3VyIGFkdnMhCgpUaGUg
a2V5IHBvaW50IG9mIHRoaXMgaXNzdWUgaXMgdGhhdCBjYWxsaW5nIHByZXNlcnZlX2djc19jb250
ZXh0IGFuZCByZXN0b3JlX2djc19jb250ZXh0IGlsbGVnYWwsCj4+PgpAQCAtMTEzNiw2ICsxMjM5
LDEyIEBAIHN0YXRpYyBpbnQgc2V0dXBfc2lnZnJhbWUoc3RydWN0IHJ0X3NpZ2ZyYW1lX3VzZXJf
bGF5b3V0ICp1c2VyLAogICAgICAgICAgICAgICAgX19wdXRfdXNlcl9lcnJvcihjdXJyZW50LT50
aHJlYWQuZmF1bHRfY29kZSwgJmVzcl9jdHgtPmVzciwgZXJyKTsKICAgICAgICB9CiAKKyAgICAg
ICBpZiAoc3lzdGVtX3N1cHBvcnRzX2djcygpICYmIGVyciA9PSAwICYmIHVzZXItPmdjc19vZmZz
ZXQpIHsKKyAgICAgICAgICAgICAgIHN0cnVjdCBnY3NfY29udGV4dCBfX3VzZXIgKmdjc19jdHgg
PQorICAgICAgICAgICAgICAgICAgICAgICBhcHBseV91c2VyX29mZnNldCh1c2VyLCB1c2VyLT5n
Y3Nfb2Zmc2V0KTsKKyAgICAgICAgICAgICAgIGVyciB8PSBwcmVzZXJ2ZV9nY3NfY29udGV4dChn
Y3NfY3R4KTsKKyAgICAgICB9Cjw8PApfX2Fsd2F5c19pbmxpbmUganVzdCBoZWxwIG9wdGltaXpl
IHVuZGVmaW5lZCBmdW5jo6xPZiBjb3Vyc2UsIHRoaXMgY291bGQgYWxzbyBiZSBjaXJjdW12ZW50
ZWQgCmJ5IGFkZGluZyBDT05GSUdfQVJNNjRfR0NTIGNoZWNrcy4gSSdkb24ndCB0aGluayBvdGhl
ciBzeXN0ZW1fc3VwcG9ydF9mb28oKSBmdW5jdGlvbnMKIHNob3VsZCBtb2RpZnksIHRoZXkgZG9u
J3QgZXhoaWJpdCBzaW1pbGFyIHByb2JsZW1zLgo=

