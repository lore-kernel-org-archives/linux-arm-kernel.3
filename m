Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBB3CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 04:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOfqp69JcHUenStvsJhSWzm74vh4e1gjzLYrUutW6B4=; b=lwFBYNgL2VwbgMBG8wMHW+dZRa
	59Umi8WkroYmGExho6HqbAb++xuE3pWAqGRs80O1hTUt5aO/6CdIRn/MRfckhLmFLkx6nqv5W0QeR
	j7akF0Z0TQ+Zp4ATZb7iqpFIpPqBsL62Xks9QQT/gZtgQyghOxvt85CHiFXFTEU2p/ZiWrQShw4H2
	ReX6Az/C06tPIzPBdwLZauRm3tOM4B9run85NHsmXVItcPIgd0B008p0yDcuPdXY6TQO+WH/PoeqX
	QqPN9x95QqXjFmAiQ9nyE++rxgnwX1ZFKdj9HSsazWc/DhjPitQ3DzLYchyc2sZKufjhfyg2wLIq+
	N9/ksCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfCR-00000003tEN-02zx;
	Wed, 03 Sep 2025 04:34:23 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utf9h-00000003sWR-3cNs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 04:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756873885;
	bh=zOfqp69JcHUenStvsJhSWzm74vh4e1gjzLYrUutW6B4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=O/Q0+huTqBG5Gci+NR6iWMVRDmD/ivXH9zJMQTBvhMosT3ddDaIrwYrEpax1mEsGU
	 uOudqMsjwzGhx4g8z5V+Il3mXfk9JbMAx/FG/leY6hYZkSmMzgiS7oSwKqan6oXMtW
	 eC7PHv+6g+iQBPqU1R/QL41KA7ruDcywh8LzH+J4m+vQfQMGC+K3BBTvCl3doU/O8v
	 YeJqwZ6/lWTREgVFa0M6gQt7kl5c1NvlcOLkYJGczMXSZb8UGT6bfVBYoEEeg1XlmK
	 1S0ZXDTD3W5CgV8AgqSZMxTXM3AiuaFA5sIFFQVA9wjRrvWSD4YP+km8nJs9Wfinyy
	 lQ4Ych5bkaZJg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D50876E02C;
	Wed,  3 Sep 2025 12:31:23 +0800 (AWST)
Message-ID: <3a65d568540e9ca43d3bfc24cfe5f72d2bb12b3b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 3/3] ARM: dts: aspeed: harma: add mp5990
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 03 Sep 2025 14:01:22 +0930
In-Reply-To: <20250828074955.542711-4-peteryin.openbmc@gmail.com>
References: <20250828074955.542711-1-peteryin.openbmc@gmail.com>
	 <20250828074955.542711-4-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_213134_090184_28E16181 
X-CRM114-Status: GOOD (  16.90  )
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

SGkgUGV0ZXIsCgpPbiBUaHUsIDIwMjUtMDgtMjggYXQgMTU6NDkgKzA4MDAsIFBldGVyIFlpbiB3
cm90ZToKPiBBZGQgc3VwcG9ydCBmb3IgdGhlIEhTQyBNUDU5OTAgZGV2aWNlIG9uIHRoZSBIYXJt
YSBwbGF0Zm9ybS4KPiAKPiBUaGlzIGNoYW5nZSB1cGRhdGVzIHRoZSBkZXZpY2UgdHJlZSB0byBp
bmNsdWRlIHRoZSBNUDU5OTAgSFNDCj4gKEhvdCBTd2FwIENvbnRyb2xsZXIpLCBhbGxvd2luZyBw
cm9wZXIgY29uZmlndXJhdGlvbiBhbmQgaW50ZWdyYXRpb24KPiB3aXRoIHRoZSBwbGF0Zm9ybS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBZaW4gPHBldGVyeWluLm9wZW5ibWNAZ21haWwuY29t
Pgo+IC0tLQo+IMKgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1ibWMtZmFjZWJvb2st
aGFybWEuZHRzIHwgNCArKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9hc3BlZWQtYm1jLWZhY2Vi
b29rLWhhcm1hLmR0cwo+IGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1ibWMtZmFj
ZWJvb2staGFybWEuZHRzCj4gaW5kZXggODEyNzhhNzcwMmRlLi4yM2VhZjQ3YTM4ZTggMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1ibWMtZmFjZWJvb2staGFy
bWEuZHRzCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1ibWMtZmFjZWJv
b2staGFybWEuZHRzCj4gQEAgLTUyMCw2ICs1MjAsMTAgQEAgaW11eDI4OiBpMmNAMCB7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgI3NpemUtY2VsbHMgPSA8MD47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmVnID0gPDA+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcG93ZXItc2Vuc29yQDIwIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0g
Im1wcyxtcDU5OTAiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDIwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcG93ZXItbW9uaXRvckA2MSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbXBh
dGlibGUgPSAiaXNpbCxpc2w2OTI2MCI7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDYxPjsKCkkndmUgYXBw
bGllZCB0aGUgc2VyaWVzLCBob3dldmVyLCBjYW4geW91IHBsZWFzZSBzZW5kIGEgZm9sbG93LXVw
IHBhdGNoCmFkZGluZyBuZXctbGluZXMgYmV0d2VlbiB0aGUgY2hpbGQgbm9kZXMgb2YgaW11eDI4
PyBJdCdzIG5vdCBjb25zaXN0ZW50CndpdGggdGhlIHJlc3Qgb2YgdGhlIGRldmljZXRyZWUgYW5k
IGlzIGEgYml0IGRlbnNlLgoKVGhhbmtzLAoKQW5kcmV3Cgo=


