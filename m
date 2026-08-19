Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4647C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNudpO1wWIBaAVTB5TfdRT6h2O1jEPXOPoL8dbL3MZE=; b=aYC25WAUOWQv0CaQ6yhrrG8ULY
	02JUtkCcmzxUFYiJvBa1LTFGh8nhvLz+CkeYTe2Ep58CIAjha1xRMnu0Iu+Mo0X41Qjip+m1+mA7R
	Iub5CaHow5f3w4LYhxWtkViP8oGXH0rYKap/d0ad0eacqI2+OuFTw0X3PKNP6oG0V/AAFbGLddRkI
	2MPQcbx/vmbSKoknvqdLOsrg0afQwt36Oh+m8tuzvkWqyFnecgA8miiBEqHZykRn9AY/2x4yqb5VT
	L32ZcozpofFZMwGygxH1vbsPWzDOyeyykXgL4af0hy6CjLKK49RYCXa0rx4t5mxZzC2pH7xAs3bkW
	ilv4YfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcaX-00000009PgK-08pL;
	Wed, 19 Aug 2026 09:28:01 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcaT-00000009Pep-1pbp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=zNudpO1wWIBaAVTB5TfdRT6h2O1jEPXOPoL8dbL3MZE=; b=n
	D82eXptP5ALSooxAI5+9giRk1XsljWqScHJpORWVrQ4CEGNCY4TJTyICBbsZ6c8p
	JkiMdWUc2G6AkmU1El7EcDhIT9ENCBJaQXCbWj0fLbMn11EFxQWXupM3uWv9qwX2
	JGnKAbRJVhsFgE4//qwn8PFOVJng9mdr5ikHk3ck10=
Received: from zl020895$163.com ( [180.169.129.163] ) by
 ajax-webmail-wmsvr-40-101 (Coremail) ; Wed, 19 Aug 2026 17:26:51 +0800
 (CST)
X-Originating-IP: [180.169.129.163]
Date: Wed, 19 Aug 2026 17:26:51 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: longzhao@ambarella.com, "Arnd Bergmann" <arnd@arndb.de>,
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
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Brian Masney" <bmasney@redhat.com>, "Lee Jones" <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: Re:Re: [PATCH v5 06/12] dt-bindings: serial: add Ambarella CV75
 UART
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <b81a9de7-b5b0-4450-82af-065895a8352c@kernel.org>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-6-7bbb12f0360f@ambarella.com>
 <b81a9de7-b5b0-4450-82af-065895a8352c@kernel.org>
X-NTES-SC: AL_Qu2TBf2Yvk4q5yabZelS6DN615F8O5rMxLRDmdYrY+8JiBnj2hsZf1x6Flza4t7CNmLR1GtFoERaHxdqxSK4
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <276a15fa.74e4.1a0195849f7.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZSgvCgD3H+zbdoVq3PY0AA--.8244W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxhvPQWqFdtsMfQAA3g
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_022758_014552_36206D91 
X-CRM114-Status: UNSURE (   8.94  )
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKSSBkaWQgbm90IGNvcHkgYSBzcGVjaWZpYyBTb0MgVUFS
VCBiaW5kaW5nLiBJIGZvbGxvd2VkIHRoZSBjb21tb24KODI1MCBPRiBwcm9wZXJ0aWVzIChyZWct
c2hpZnQgLyByZWctaW8td2lkdGgpLiBJIHdpbGwgZHJvcCB0aGVtIAphbmQgaGFyZGNvZGUgdGhl
IGFjY2VzcyBpbiB0aGUgZHJpdmVyLgoKQmVzdCByZWdhcmRzLApMb25nIFpoYW8KCkF0IDIwMjYt
MDgtMTkgMTU6Mzc6MDIsICJLcnp5c3p0b2YgS296bG93c2tpIiA8a3J6a0BrZXJuZWwub3JnPiB3
cm90ZToKPk9uIDE4LzA4LzIwMjYgMTI6MzEsIExvbmcgWmhhbyB2aWEgQjQgUmVsYXkgd3JvdGU6
Cj4+IEZyb206IExvbmcgWmhhbyA8bG9uZ3poYW9AYW1iYXJlbGxhLmNvbT4KPj4gCj4+IERvY3Vt
ZW50IHRoZSBBbWJhcmVsbGEgQ1Y3NSBvbi1jaGlwIFVBUlQgY29udHJvbGxlciBiaW5kaW5nIGZv
ciBlYXJseQo+PiBjb25zb2xlIGJyaW5nLXVwLiBUaGUgYmluZGluZyByZXF1aXJlcyBhIHNpbmds
ZSBSQ1QgY2xvY2sgaW5wdXQgYW5kCj4+IGZpeGVkIDMyLWJpdCByZWdpc3RlciBhY2Nlc3Mgdmlh
IHJlZy1zaGlmdCBhbmQgcmVnLWlvLXdpZHRoLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTG9uZyBa
aGFvIDxsb25nemhhb0BhbWJhcmVsbGEuY29tPgo+PiAtLS0KPj4gIC4uLi9iaW5kaW5ncy9zZXJp
YWwvYW1iYXJlbGxhLGN2NzUtdWFydC55YW1sICAgICAgIHwgNTYgKysrKysrKysrKysrKysrKysr
KysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtYmFyZWxsYSxj
djc1LXVhcnQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwv
YW1iYXJlbGxhLGN2NzUtdWFydC55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMjIzYzg0YmY0NjBkCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWJhcmVsbGEsY3Y3NS11YXJ0
LnlhbWwKPj4gQEAgLTAsMCArMSw1NiBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAxLjIKPj4gKy0tLQo+PiAr
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zZXJpYWwvYW1iYXJlbGxhLGN2NzUt
dWFydC55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBBbWJhcmVsbGEgQ1Y3NSBVQVJUCj4+ICsKPj4g
K21haW50YWluZXJzOgo+PiArICAtIExvbmcgWmhhbyA8bG9uZ3poYW9AYW1iYXJlbGxhLmNvbT4K
Pj4gKwo+PiArYWxsT2Y6Cj4+ICsgIC0gJHJlZjogc2VyaWFsLnlhbWwjCj4+ICsKPj4gK3Byb3Bl
cnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IGFtYmFyZWxsYSxjdjc1LXVh
cnQKPj4gKwo+PiArICByZWc6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiArICBpbnRlcnJ1
cHRzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgY2xvY2tzOgo+PiArICAgIG1heEl0
ZW1zOiAxCj4+ICsKPj4gKyAgcmVnLXNoaWZ0Ogo+PiArICAgIGNvbnN0OiAyCj4+ICsKPj4gKyAg
cmVnLWlvLXdpZHRoOgo+PiArICAgIGNvbnN0OiA0Cj4KPkJvdGggcHJvcGVydGllcyBhcmUgcmVk
dW5kYW50LiBDb25zdCBwcm9wZXJ0aWVzIGFyZSBwb2ludGxlc3MuIERpZCB5b3UKPnRha2UgYW55
IGV4aXN0aW5nIGNvZGUgYXMgZXhhbXBsZSBvZiB0aGlzPyBJZiBzbyB3aGljaCwgc28gd2UgY2Fu
IGZpeCBpdD8KPgo+QmVzdCByZWdhcmRzLAo+S3J6eXN6dG9mCg==

