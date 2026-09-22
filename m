Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35042C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 04:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaZTkgojwJAJQrGoC5NhOOXweXtHWAmBtxxIT+eq7m8=; b=YcOs6QLoaoF1nrHDmHqbT5f5va
	LAiRuk8kRPZQUd4Q9HZtZTGGXKudh4SwYddDzh/kT+j9s922CC7VviecoV3zBt5T2LIeYucqueDb2
	FutbrFjt9FYvd1nOikrL85Yur19rEYZWHUkp0iSckzu6pR3zLMdcAP2ZLnferGfazwEPfAuiwVDR2
	PRgf0sYTTKr1pWggWREN89stJ8eiOT/YiPeFyfF5QKTRRd3ZV4jK2TAwIZvaLVmWY3p8oohmmy+hD
	BrHr1cf5bFZ8FXIj9cmvNMIG0l2Z6ZhFTueLTGHMD0STp66G4y6ZKHxm9CNfFWgdBjYccw8ple698
	CzXDUMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8s2X-00000004Ao6-0gKz;
	Tue, 22 Sep 2026 04:23:33 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8s2U-00000004Anb-2HKY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 04:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=IaZTkgojwJAJQrGoC5NhOOXweXtHWAmBtxxIT+eq7m8=; b=T
	CiseVed5aJoM1GxB2UT7ds/Rp3AafmFqIAbVuw+cq3fjToCfaYfRj6HkG4qlXtpT
	5xltHD5JpBnWjZQMP1PxtZWoktrS1iPvjoUcjq29xfFyFjx753g5lkcHceiPu78P
	khUsFoj3IoCW5iqRRk1lZV9w5A1dLl5Jqd/Zd+e6hM=
Date: Tue, 22 Sep 2026 12:22:08 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Michael Walle" <michael@walle.cc>
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
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
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
In-Reply-To: <DLL08SC6PWNS.2BUBIQYMBWIKQ@walle.cc>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-9-3297d3fbc9c0@ambarella.com>
 <DLL08SC6PWNS.2BUBIQYMBWIKQ@walle.cc>
X-NTES-SC: AL_Qu2SAvyev0Ep7iaRY+kcn0wRhug/UMa4u/sm3YNXc8IFsjzg4iUlVkNgBVjUyuKtIgyxmweLaAZBxvZ/ZKZCK59HEukBAsUwbKJ7cS4L4w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <650e4694.3f81.1a0c7598840.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hCgvCgDn7+lwArJqGTJMAA--.1210W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxRDjVWqyAnCc3gAA3L
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_212331_033986_7523F897 
X-CRM114-Status: UNSURE (   7.71  )
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

SGkgTWljaGFlbCwKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCmdwaW8tcmVnbWFwIGNhbiBhbHJl
YWR5IGF0dGFjaCBhIGRvbWFpbiB2aWEgY29uZmlnLmlycV9kb21haW4gb3IKcmVnbWFwX2lycV9j
aGlwLiBQTDA2MSBjYW5ub3QgdXNlIHJlZ21hcC1pcnE6IHR5cGUgaXMgcHJvZ3JhbW1lZCBpbgpJ
Uy9JQkUvSUVWIChpbmNsdWRpbmcgYm90aC1lZGdlKSBhbmQgdGhlIHBhcmVudCBJUlEgaXMgYW4g
QU1CQSBjaGFpbmVkCmRlbXV4LgoKSW4gdjggdGhlIGN1c3RvbSBsaW5lYXIgZG9tYWluIHVzZWQg
dGhlIGdwaW9fY2hpcCBhcyBob3N0X2RhdGEsIGFuZAp0aGF0IGNoaXAgb25seSBleGlzdHMgYWZ0
ZXIgZ3Bpb19yZWdtYXBfcmVnaXN0ZXIoKSwgc28gSSBhZGRlZApncGlvX3JlZ21hcF9nZXRfY2hp
cCgpLgoKSSBjYW4gZHJvcCB0aGUgaGVscGVyOiBjcmVhdGUgdGhlIGRvbWFpbiB3aXRoIHRoZSBQ
TDA2MSBwcml2YXRlIGRhdGEgYXMKaG9zdF9kYXRhLCBwYXNzIGl0IGluIGNvbmZpZy5pcnFfZG9t
YWluLCBhbmQgbGV0IGdwaW8tcmVnbWFwIHJlZ2lzdGVyCml0LiBJIHdpbGwgZG8gdGhhdCBpbiB0
aGUgbmV4dCByZXZpc2lvbiBpZiB5b3UgYWdyZWUuCgpCZXN0IHJlZ2FyZHMsCkxvbmcgWmhhbwoK
QXQgMjAyNi0wOS0yMSAyMDo0ODo0NCwgIk1pY2hhZWwgV2FsbGUiIDxtaWNoYWVsQHdhbGxlLmNj
PiB3cm90ZToKPk9uIFR1ZSBTZXAgMTUsIDIwMjYgYXQgMToxNSBQTSBDRVNULCBMb25nIFpoYW8g
dmlhIEI0IFJlbGF5IHdyb3RlOgo+PiBGcm9tOiBMb25nIFpoYW8gPGxvbmd6aGFvQGFtYmFyZWxs
YS5jb20+Cj4+Cj4+IExldCBkcml2ZXJzIHRoYXQgaW1wbGVtZW50IGEgY3VzdG9tIGlycWNoaXAg
cmV0cmlldmUgdGhlIGdwaW9fY2hpcAo+PiBhZnRlciByZWdpc3RyYXRpb24uIEF0dGFjaCBhIGNh
bGxlci1wcm92aWRlZCBpcnFfZG9tYWluIG9ubHkgd2hlbiBpdAo+PiBpcyBwcmVzZW50Lgo+Cj5T
byB3aHkgZG8gd2UgbmVlZCB0aGlzPyBXaHkgY2FuJ3QgZ3Bpby1yZWdtYXAgcmVnaXN0ZXIgdGhl
Cj5pcnFfZG9tYWluPwo+Cj4tbWljaGFlbAo=

