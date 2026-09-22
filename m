Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBDFC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnoll3Gl1nyyRg5uk5+JlX/6VytXLqnlS1hZMgMavvY=; b=0TpX5xfZ6SIZZEZkzchxIW6pU8
	4eXUnp+eRA2EbnRkYfbja+y1/pEluhbiM90HtQNQ5rD4df7uIMo2t+CQwEerm4gc3AwJ7+wlK+wTj
	O9M1iVET4h0cw+kduTnFs11QBshbT+hRxgwlQS8VxJMTH1CdCXYcOCEszO+61l0qsjuc7SEdj66Tk
	OZgAMkej/zy0UWjl+pCvVkSFZFkJ064NAsY039ckZ+7dWvVk76AxEPdtg3T2GzYe4pLcEoNIcG3lQ
	YvX1Rubz7XINmlGC4pVgnkgbRmlHDFjBOszZBtg0cBrLzqbYcEKHyoT9zOH0Qp5hQdni9t4F/hP/V
	cYa7iDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vs0-00000004gJg-0Yf3;
	Tue, 22 Sep 2026 08:28:56 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vrx-00000004gIK-2vTg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=qnoll3Gl1nyyRg5uk5+JlX/6VytXLqnlS1hZMgMavvY=; b=R
	NwWRP9F5BPYXmSDWAJQfRmpnoOszT2orSP3u0oCdHZVq6mnHamYOXonbeHsow2zB
	lYyrdzhcsQ/QeiWStDCFGgVcxODu43kafaXkp2T6ZUfwYUZLdf+nIz3eirG5RCqX
	Uli6/RKw2xVcJ4H7Jne37fPrwQ0hLs4nMjmF8w09xE=
Date: Tue, 22 Sep 2026 16:28:00 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Linus Walleij" <linusw@kernel.org>
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
	"Bartosz Golaszewski" <brgl@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, "Lee Jones" <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re:Re: [PATCH v8 04/18] dt-bindings: pinctrl: add Ambarella CV75
 pinctrl
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAD++jLnUVOAtq-h_qDdWpEhZFZehFKo4qqgcTHD9zDQTdF4yhg@mail.gmail.com>
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com>
 <CAD++jLnUVOAtq-h_qDdWpEhZFZehFKo4qqgcTHD9zDQTdF4yhg@mail.gmail.com>
X-NTES-SC: AL_Qu2SAvyduk4j5iOeZekcn0wRhug/UMa4u/sm3YNXc84FpwPw5QMjZmNDNHL32tKTBxilqxOseRpTx8lTXqZ3KLaXA5U/vIF3zQFUwP6sBg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <408f0b0c.7560.1a0c83a9ff4.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gygvCgD3vzgQPLJqKLkVAA--.40070W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxRBay2qyPBBDAwAA3w
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_012854_124616_7923FF4A 
X-CRM114-Status: UNSURE (   9.78  )
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

SGkgTGludXMsCgpUaGFuayB5b3UuCgoiUHV0dGluZyBzb21lIHBpZWNlcyBpbiBwbGFjZSB0byBi
ZWdpbiB3aXRoIiBzb3VuZHMgbGlrZSBhIGdvb2QgaWRlYS4gV2hhdCBkbyBJIG5lZWQgdG8gZG8g
bmV4dD8gSeKAmW0gc3RpbGwgbmV3IHRvIHRoaXMsIHRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSBh
bmQgZ3VpZGFuY2UuCgpCZXN0IHJlZ2FyZHMsCkxvbmcgWmhhbwoKQXQgMjAyNi0wOS0yMiAxNTox
MToxOSwgIkxpbnVzIFdhbGxlaWoiIDxsaW51c3dAa2VybmVsLm9yZz4gd3JvdGU6Cj5IaSBMb25n
LAo+Cj5PbiBNb24sIFNlcCAyMSwgMjAyNiBhdCA2OjIz4oCvQU0gTG9uZyBaaGFvIHZpYSBCNCBS
ZWxheQo+PGRldm51bGwrbG9uZ3poYW8uYW1iYXJlbGxhLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Pgo+PiBGcm9tOiBMb25nIFpoYW8gPGxvbmd6aGFvQGFtYmFyZWxsYS5jb20+Cj4+Cj4+IERvY3Vt
ZW50IHRoZSBDVjc1IHBpbiBjb250cm9sbGVyIGJpbmRpbmcgdXNpbmcgZ2VuZXJpYyBmdW5jdGlv
biBhbmQKPj4gZ3JvdXBzIHByb3BlcnRpZXMgZm9yIHBpbm11eCBjb25maWd1cmF0aW9uLgo+Pgo+
PiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+Cj4+IFJldmll
d2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFs
Y29tbS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IExvbmcgWmhhbyA8bG9uZ3poYW9AYW1iYXJlbGxh
LmNvbT4KPgo+SXMgdGhpcyBzb21ldGhpbmcgSSBzaG91bGQganVzdCBhcHBseSB0byB0aGUgcGlu
Y3RybCB0cmVlPwo+Cj5TYW1lIHF1ZXN0aW9uIGFib3V0IHRoZSBkcml2ZXIuCj4KPkknbSBub3Qg
c3VyZSB5b3UnbGwgZ2V0IGFsbCBvZiB0aGUgQW1iYXJlbGxhIGluIGZvciB2Ny40IGFueXdheQo+
c28gd2hhdCBhYm91dCBwdXR0aW5nIHNvbWUgcGllY2VzIGluIHBsYWNlIHRvIGJlZ2luIHdpdGg/
Cj4KPllvdXJzLAo+TGludXMgV2FsbGVpago=

