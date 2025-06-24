Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7EEC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJ2Y39ij81lvq+iKRiDDGSNRlRMdUnfqavwz1La/gMA=; b=pZ9dtKCSabz5DY89vs8QxF0d/S
	1qsHpwTKdKjciPgcVtyZyXg7IGi8McgkxH6zfdyUyxqw+bxkM2xwKPi80K6tb6F+8nBSTD00R385G
	vBYbFAVu4lTPDBLZduZm6D/bnP7nXxsqsHQJr2OhunUbhu7Pnh3gxxtrFgmW+3Sm51cKlo8NS875A
	IqMycieI21wveJcS7GEK/3L2ad8i+OhgV054mYGHALCk2qEcfX3bnuABfWhovG8si1ydIRHBnCtQS
	kfKhS4cezg7jUNkhXqQ9kMkFpwxMwDiFKyYDgylbhWXT1mekrIK4HjzLcUGShgxfndj0TIv++pmin
	0CG7vrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDO4-000000078a3-2UbT;
	Tue, 24 Jun 2025 23:49:12 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDJB-0000000785c-48wT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 23:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750808648;
	bh=gJ2Y39ij81lvq+iKRiDDGSNRlRMdUnfqavwz1La/gMA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e/RG7Gxtw5W3CBuHcYNGv/w6plOoXdvuDnYyw33OMFnLPx72CtSGk/mZVXDr7kvvQ
	 lQvvNjIR1z8+dP7hIHuOSYtYQD69z1shXUbod2f8a7IMnm825YwQtkOHMr+yELaxul
	 yHnm2INU8nEpzKBuh2vJh8kEUimMut/n87IO40InhzIg+jyeGaAHddunxB9jbcMnPe
	 CJ5D7W+W3MQclg+FTgFRnR9fCt7vYXSiUcHhmJMZc9tDY4hV2wBBE/5Kkgn7eZSp9l
	 IT4B8PjYymsEerPDdo/Ios43uN7yJ3Tqmm6H7hD3myXFMDgpvEPP+Pcaxzkrs5xhDd
	 S8K/nYPNmn1Uw==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2047A640CD;
	Wed, 25 Jun 2025 07:44:06 +0800 (AWST)
Message-ID: <0f495eec39fd25d71a59a56876f6142e6fe786f3.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, Leo Wang
	 <leo.jt.wang@fii-foxconn.com>
Date: Wed, 25 Jun 2025 09:14:05 +0930
In-Reply-To: <20250621-add-support-for-meta-clemente-bmc-v2-2-6c5ef059149c@fii-foxconn.com>
References: <20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com>
	 <20250621-add-support-for-meta-clemente-bmc-v2-2-6c5ef059149c@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_164410_216011_709724E3 
X-CRM114-Status: GOOD (  13.78  )
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

T24gU2F0LCAyMDI1LTA2LTIxIGF0IDE1OjUxICswODAwLCBMZW8gV2FuZyB3cm90ZToKPiBGcm9t
OiBMZW8gV2FuZyA8bGVvLmp0LndhbmdAZ21haWwuY29tPgo+IAo+IEFkZCBsaW51eCBkZXZpY2Ug
dHJlZSBlbnRyeSBmb3IgTWV0YSBDbGVtZW50ZSBjb21wdXRlLXRyYXkKPiBCTUMgdXNpbmcgQVNU
MjYwMCBTb0MuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGVvIFdhbmcgPGxlby5qdC53YW5nQGZpaS1m
b3hjb25uLmNvbT4KPiAtLS0KPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9NYWtlZmlsZcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxICsKPiDCoC4uLi9kdHMv
YXNwZWVkL2FzcGVlZC1ibWMtZmFjZWJvb2stY2xlbWVudGUuZHRzwqDCoMKgIHwgMTI1NCArKysr
KysrKysrKysrKysrKysrKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxMjU1IGluc2VydGlvbnMoKykK
PiAKPiAKCipzbmlwKgoKPiArCj4gKyZpMmMyIHsKPiArwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAi
b2theSI7Cj4gK8KgwqDCoMKgwqDCoMKgLy8gTW9kdWxlIDAsIEV4cGFuZGVyIEAweDIwCj4gK8Kg
wqDCoMKgwqDCoMKgaW9fZXhwYW5kZXIwOiBncGlvQDIwIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJueHAscGNhOTU1NSI7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDIwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZ3Bpby1jb250cm9sbGVyOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAj
Z3Bpby1jZWxscyA9IDwyPjsKPiArwqDCoMKgwqDCoMKgwqB9Owo+ICsKCipzbmlwKgoKPiArCj4g
KyZpb19leHBhbmRlcjAgewo+ICvCoMKgwqDCoMKgwqDCoGdwaW8tbGluZS1uYW1lcyA9Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJGUEdBX1RIRVJNX09WRVJUX0wtSSIsCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJGUEdBX1JFQURZX0JNQy1JIiwKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIkhNQ19CTUNfREVURUNULU8iLAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAiSE1DX1BHT09ELU8iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAiIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIkJNQ19TVEJZ
X0NZQ0xFLU8iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiRlBHQV9FUk9UX0ZB
VEFMX0VSUk9SX0wtSSIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJXUF9IV19F
WFRfQ1RSTF9MLU8iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiRVJPVF9GUEdB
X1JTVF9MLU8iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiRlBHQV9FUk9UX1JF
Q09WRVJZX0wtTyIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJCTUNfRVJPVF9G
UEdBX1NQSV9NVVhfU0VMLU8iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiVVNC
Ml9IVUJfUlNUX0wtTyIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCIiLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiU0dQSU9fRU5fTC1PIiwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIkIyQl9JT0VYUF9JTlRfTC1JIiwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIkkyQ19CVVNfTVVYX1JFU0VUX0wtTyI7Cj4gK307Cgppb19leHBh
bmRlcjAgaXMgYSBub2RlIGxhYmVsIHRoYXQgeW91J3JlIGRlZmluaW5nIGluIHRoaXMgc2FtZSBz
b3VyY2UKZmlsZS4gVGhlIGNvZGluZyBzdHlsZSBleHBlY3RhdGlvbiBpcyB0aGF0IHlvdSBkZWZp
bmUgYWxsIHRoZQpwcm9wZXJ0aWVzIGluIHRoZSBub2RlIGl0c2VsZi4gTGFiZWwgcmVmZXJlbmNl
cyBsaWtlIHRoZSBvbmUgYWJvdmUKc2hvdWxkIGJlIHVzZWQgd2hlbiByZWZlcmVuY2luZyBub2Rl
cyBmcm9tIGluY2x1ZGVkIGZpbGVzLgoKUGxlYXNlIGZpeCB0aHJvdWdob3V0IChlLmcuIGF0IGxl
YXN0IGlvX2V4cGFuZGVyMSAtIGlvX2V4cGFuZGVyMTMsIGJ1dAphbnkgb3RoZXIgaW5zdGFuY2Vz
IGFzIHdlbGwpLgoKPiArCj4gKyZwaW5jdHJsIHsKPiArwqDCoMKgwqDCoMKgwqBwaW5jdHJsX25j
c2kzX2RlZmF1bHQ6IG5jc2kzX2RlZmF1bHQgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBmdW5jdGlvbiA9ICJSTUlJMyI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGdyb3VwcyA9ICJOQ1NJMyI7Cj4gK8KgwqDCoMKgwqDCoMKgfTsKPiArCj4gK8KgwqDCoMKgwqDC
oMKgcGluY3RybF9uY3NpNF9kZWZhdWx0OiBuY3NpNF9kZWZhdWx0IHsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZnVuY3Rpb24gPSAiUk1JSTQiOwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBncm91cHMgPSAiTkNTSTQiOwo+ICvCoMKgwqDCoMKgwqDCoH07CgpDYW4g
eW91IHBsZWFzZSByYXRoZXIgYWRkIHRoZXNlIHRvIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9h
c3BlZWQtZzYtCnBpbmN0cmwuZHRzaSBzbyBvdGhlciBib2FyZHMgY2FuIG1ha2UgdXNlIG9mIHRo
ZW0/CgpUaGFua3MsCgpBbmRyZXcK


