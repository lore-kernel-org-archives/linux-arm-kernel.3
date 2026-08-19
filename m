Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1BBC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW9Q1qCU51uLoqGiIqveU5bfYzn6cKDutLnmgvwQB6c=; b=v0S85FA8QLEheFQtlzYUbQ2Ii1
	FGs1Bzv7VsVi4c9Xy1QEzWTgHFOyFzEXxrgeOvOK2o3IQeQUgJwg3m9RuDe7HITpVfIFamTtlpm8z
	+oIGr0OtdzEF9RxSNyDNv+4NriPAzeF19NbjhkgjLK/oLXva1ZMF0zaPGMn5l+srm+zBysFbcchPk
	Q811XOS/OTowoOra+BaJXsJgCkifcmResFGUZJptVz6nbg9KyhegOkkyKw12K372gWOvldjtaWERR
	Oizp/ISIS+GUjK2KOEO8GGw1XtxN48OMrCyW3MckXPiEwJjoCu4N2aL+hV7i0y/HMC4nfUgFoukuD
	dc6mlhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcV9-00000009P3O-1ozb;
	Wed, 19 Aug 2026 09:22:27 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcV6-00000009P2y-1Bxq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=hW9Q1qCU51uLoqGiIqveU5bfYzn6cKDutLnmgvwQB6c=; b=I
	27e0VvLiHoNyExGGtGLRmOU8awvyYTqlIRisIeg/Z3evZMdpoboDdFJ4KFS1/Glp
	q00CnKIsM0MUmkBTc2PtMN3DgD1gWK+gtyfunhwWruXj0fSquDHC5ch9ONY4Tey7
	cIMrnDN4FlByECiUTc1/WDQH5UCprvAb3zUCe69eHY=
Received: from zl020895$163.com ( [180.169.129.163] ) by
 ajax-webmail-wmsvr-40-101 (Coremail) ; Wed, 19 Aug 2026 17:21:09 +0800
 (CST)
X-Originating-IP: [180.169.129.163]
Date: Wed, 19 Aug 2026 17:21:09 +0800 (CST)
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
Subject: Re:Re: [PATCH v5 02/12] dt-bindings: mfd: syscon: add Ambarella
 CV75 secure scratchpad
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <6c8471ad-8d68-42d9-bc61-83968a2e8acd@kernel.org>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-2-7bbb12f0360f@ambarella.com>
 <6c8471ad-8d68-42d9-bc61-83968a2e8acd@kernel.org>
X-NTES-SC: AL_Qu2TBf2Yvkot7yWYYelS6DN615F8O5rMxLRDmdYrY+8JiBnj2hsZf1x6Flza4t6Q947My16VWDGwcqobvXWK
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <4d8af3ba.7360.1a01953118f.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZSgvCgDnD+yGdYVqpvQ0AA--.8191W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxgZ662qFdYbyuwAA3E
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_022224_838943_A380C02A 
X-CRM114-Status: UNSURE (   9.43  )
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

UmVzZW5kIHRoaXMgZHVlIHRvIHdyb25nIEhUTUwgZm9ybWF0IGJlZm9yZS4KCkhpIEtyenlzenRv
ZiwKClNvcnJ5IGZvciByZXNlbmRpbmcgd2l0aG91dCBhbiBvbi1saXN0IHJlcGx5LgoKSSB0cmVh
dGVkIHRoZSBjb3ZlciBsZXR0ZXIgYXMgZW5vdWdoOiB2MiBhc2tlZCB0byBkcm9wIHRoZSBzZXBh
cmF0ZQpiaW5kaW5nIGFuZCBwdXQgdGhlIGNvbXBhdGlibGUgaW4gc3lzY29uLnlhbWwsIHdoaWNo
IHYzL3Y1IGFscmVhZHkKZGlkLiBTYXNoaWtvIHRoZW4gYXNrZWQgdG8gYWxzbyBhZGQgaXQgdG8g
YSBzZWxlY3QgZW51bS4gSSB0aG91Z2h0CnRoYXQgd2FzIGEgZmFsc2UgcG9zaXRpdmUgoaogY3Vy
cmVudCBzeXNjb24ueWFtbCBoYXMgbm8gc3VjaCBzZWxlY3Q7Cm1hdGNoaW5nIGlzIGluIHN5c2Nv
bi1jb21tb24ueWFtbCB2aWEgdGhlICJzeXNjb24iIGZhbGxiYWNrIKGqIHNvIEkKZGlkIG5vdCBy
ZXBseS4KCkkgYW0gbmV3IHRvIHRoaXM6IGlmIEkgdGhpbmsgYSBTYXNoaWtvIGNvbW1lbnQgaXMg
YSBmYWxzZSBwb3NpdGl2ZSwKc2hvdWxkIEkgcmVwbHkgb24gdGhlIHBhdGNoIHRocmVhZCB3aXRo
IHRoZSByZWFzb24gYW5kIHdhaXQsIHJhdGhlcgp0aGFuIG9ubHkgbWVudGlvbmluZyBpdCBpbiB0
aGUgY292ZXIgbGV0dGVyPwoKSWYgSSBzdGlsbCBtaXNzZWQgc29tZXRoaW5nLCBJIHdpbGwgZml4
IGl0IGluIHY2LgoKQmVzdCByZWdhcmRzLApMb25nIFpoYW8KCkF0IDIwMjYtMDgtMTkgMDM6Mjc6
MDcsICJLcnp5c3p0b2YgS296bG93c2tpIiA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPk9uIDE4
LzA4LzIwMjYgMTI6MzEsIExvbmcgWmhhbyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4+IEZyb206IExv
bmcgWmhhbyA8bG9uZ3poYW9AYW1iYXJlbGxhLmNvbT4KPj4gCj4+IEFsbG93IGFtYmFyZWxsYSxj
djc1LXNlYy1zY3JhdGNocGFkIGFzIGEgc3lzY29uIGZvciB0aGUgc2hhcmVkIHNlY3VyZQo+PiBz
Y3JhdGNocGFkIHJlZ2lzdGVycyBvbiBDVjc1Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTG9uZyBa
aGFvIDxsb25nemhhb0BhbWJhcmVsbGEuY29tPgo+Cj5Zb3UgYWxyZWFkeSByZWNlaXZlZCByZXZp
ZXcgYXQgdjIgd2hpY2ggeW91IGRpZCBub3QgcmVzcG9uZCB0byBhbmQgZGlkCj5ub3QgaW1wbGVt
ZW50Lgo+Cj5CZXN0IHJlZ2FyZHMsCj5Lcnp5c3p0b2YK

