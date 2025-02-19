Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2E1C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 01:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ni1r638kXhz6gOBSh0GzjFMf1Ey2XUVcA0yKk/KtpJY=; b=wf/abliaDbhn/EDq1Glif0ILWL
	SbR2o46K3eucxFZaP5OyfErZxYzbHFNOjlof1wEHopUD0PhFILmJjD5lz/S7YUMd8IrxYY4AWm3K+
	HWhZvCoXliMJeGI7QyVWmbT3H5Sli1D+FEItP6Au6fUdkeHw/pBDW3wve+U/yHWfCuL0fSiLRnrig
	05hn6/5LTptM8n3gNsHwRxEtY2dOVl72mZ6Hq0cE2QRtGy2Afq9az81q5kVwQcKTcH8QkhxYiNb46
	EjiM4ZT0GxTyS/Ky9yZ4e9KsQ0MWR2peT/6pVEC6ZiasCZUdFpRcBqyEBot2llb+tXYyCVkUhKF+U
	ZBbZc2/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYgR-0000000AVfh-1Y4B;
	Wed, 19 Feb 2025 01:15:27 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYdy-0000000AV8j-1mn5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 01:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739927572;
	bh=Ni1r638kXhz6gOBSh0GzjFMf1Ey2XUVcA0yKk/KtpJY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GG4Nw1bvSKh8tDf3E+2t/uMIf7OolfOAl6mSmUWL6zpk45Zsy2/B31/S+KrMPCKx4
	 ptMe2y+TaQ2da9TTRW4kF91rgL/iQlVLR8uTcQTUm/mkyAlBGk2h+6SjjiBPdty042
	 h6X9e2gKDVlq9GIMEyIiGdMm2RHoRjy9z9B9qsjsIku2Ec1nKqcf7b75A5v1Nw7cR5
	 3XUMMv21fA2X652KA2KlzJ3oMwWKUiie9gAbHsrtYmI3bTWaF8gzoZDIEvzvccX30x
	 2uoYuiCFfVP9hCm3IzcbGoVzFO5AHfBXbNNAq3JxbEULwt1kbNRAwVTXLg2nANYCZJ
	 SBKyx4CtVg8PA==
Received: from [192.168.68.112] (203-173-1-6.dyn.iinet.net.au [203.173.1.6])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ECA6176191;
	Wed, 19 Feb 2025 09:12:51 +0800 (AWST)
Message-ID: <a7df160add1563a69573e00af44caf8bb73f520b.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: aspeed-g6.dtsi: enable IRQ for
 watchdogs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Heyi Guo <guoheyi@linux.alibaba.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Feb 2025 11:42:51 +1030
In-Reply-To: <20250218031709.103823-2-guoheyi@linux.alibaba.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
	 <20250218031709.103823-2-guoheyi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_171254_675990_E2686AE3 
X-CRM114-Status: GOOD (  11.84  )
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

SGkgSGV5aSwKCk9uIFR1ZSwgMjAyNS0wMi0xOCBhdCAxMToxNiArMDgwMCwgSGV5aSBHdW8gd3Jv
dGU6Cj4gVG8gZmluYWxseSBlbmFibGUgd2F0Y2hkb2cgcHJldGltZW91dCBmdW5jdGlvbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBIZXlpIEd1byA8Z3VvaGV5aUBsaW51eC5hbGliYWJhLmNvbT4KPiAK
PiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBDYzogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6aytkdEBrZXJuZWwub3JnPgo+IENjOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtl
cm5lbC5vcmc+Cj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Cj4gQ2M6IEFuZHJl
dyBKZWZmZXJ5IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+Cj4gLS0tCj4gwqBhcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc2LmR0c2kgfCA0ICsrKysKPiDCoDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkL2FzcGVlZC1nNi5kdHNpCj4gYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVk
LWc2LmR0c2kKPiBpbmRleCA4ZWQ3MTViZDUzYWEuLmVmN2NlZDI4NWM0NCAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc2LmR0c2kKPiArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc2LmR0c2kKPiBAQCAtNTM4LDIzICs1MzgsMjcgQEAg
dWFydDU6IHNlcmlhbEAxZTc4NDAwMCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgd2R0MTogd2F0Y2hkb2dAMWU3ODUwMDAgewo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb21w
YXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXdkdCI7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDFlNzg1MDAw
IDB4NDA+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGludGVycnVwdHMgPSA8R0lDX1NQSSAyNAo+IElSUV9UWVBFX0xFVkVM
X0hJR0g+OwoKVGhlIGJpbmRpbmcgd2lsbCBuZWVkIGFuIHVwZGF0ZSB0byBhbGxvdyAnaW50ZXJy
dXB0cycgYXMgYW4gb3B0aW9uYWwKcHJvcGVydHkuCgpBbmRyZXcK


