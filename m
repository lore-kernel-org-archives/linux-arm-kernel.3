Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB24D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 06:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtV9ua9qsGLLzEpn211K83IwD0zL2xMQJwrkSq3b3AI=; b=zvpiGaqU/cgmY0+5G9/ufLG8vE
	0c/t1KmoDm7wvnT2is9qHwDuMGcAvOopQwSYeexGoZy20Tahd+cAaqdRSqRYNxUZIe/cCv3ZG1ORL
	N+TIGIbsSE1Tp7BJJ9G4S5CCVrxy9C6xUemlmUS/xS30FKRfQSUC+l9LT155EQFxzgxfDbQ70VkLG
	1EYswEi/yrBdrgpLsRwNy+1rUPWJb8wsC80e0+HqS6i23+0bZ/gXcN9U/ysMYw5rnvDts2O12T2XL
	/ixhA15HHPskFxl7H9V6zgA4wvcDU8MODXMi9To11nHX/Xk4O/c3Z1tWSWp3bLB1U/604qR6iWg7v
	f4edHEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAzJ-00000004nt1-2IX4;
	Mon, 12 Jan 2026 06:01:13 +0000
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net ([209.97.182.222])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAzF-00000004nsR-2gl6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 06:01:12 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Mon, 12 Jan 2026 14:00:47 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Mon, 12 Jan 2026 14:00:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgAXH2wRjmRpdw2UAA--.9113W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEFDGlj0IseagABst
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_220109_977794_FB036F68 
X-CRM114-Status: GOOD (  12.85  )
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

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQW5kcmV3IEx1bm4iIDxh
bmRyZXdAbHVubi5jaD4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wMS0xMCAwMjoyNzo1NCAo5pif5pyf
5YWtKQo+IOaUtuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTogZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGFuZHJldytuZXRkZXZAbHVubi5jaCwgZGF2ZW1AZGF2
ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3JnLCByb2JoQGtl
cm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2
QHZnZXIua2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5zdG0zMkBnbWFp
bC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGludXgu
b3JnLnVrLCBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tLCBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1pbkBlc3dpbmNvbXB1dGluZy5jb20s
IHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbSwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0
aW5nLmNvbQo+IOS4u+mimDogUmU6IFtQQVRDSCB2MSAxLzJdIGR0LWJpbmRpbmdzOiBldGhlcm5l
dDogZXN3aW46IGFkZCBjbG9jayBzYW1wbGluZyBjb250cm9sCj4gCj4gPiAgICByeC1pbnRlcm5h
bC1kZWxheS1wczoKPiA+IC0gICAgZW51bTogWzAsIDIwMCwgNjAwLCAxMjAwLCAxNjAwLCAxODAw
LCAyMDAwLCAyMjAwLCAyNDAwXQo+ID4gKyAgICBlbnVtOiBbMCwgMjAsIDYwLCAxMDAsIDIwMCwg
NDAwLCA4MDAsIDE2MDAsIDI0MDBdCj4gPiAgCj4gPiAgICB0eC1pbnRlcm5hbC1kZWxheS1wczoK
PiA+IC0gICAgZW51bTogWzAsIDIwMCwgNjAwLCAxMjAwLCAxNjAwLCAxODAwLCAyMDAwLCAyMjAw
LCAyNDAwXQo+ID4gKyAgICBlbnVtOiBbMCwgMjAsIDYwLCAxMDAsIDIwMCwgNDAwLCA4MDAsIDE2
MDAsIDI0MDBdCj4gCj4gWW91IG5lZWQgdG8gYWRkIHNvbWUgdGV4dCB0byB0aGUgQ2hhbmdlbG9n
IHRvIGluZGljYXRlIHdoeSB0aGlzIGlzCj4gc2FmZSB0byBkbywgYW5kIHdpbGwgbm90IGNhdXNl
IGFueSByZWdyZXNzaW9ucyBmb3IgRFQgYmxvYnMgYWxyZWFkeSBpbgo+IHVzZS4gQmFja3dhcmRz
IGNvbXBhdGliaWxpdHkgaXMgdmVyeSBpbXBvcnRhbnQgYW5kIG5lZWRzIHRvIGJlCj4gYWRkcmVz
c2VkLgo+IApUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpVbmRlcnN0b29kLiBPdXIgdW5kZXJzdGFu
ZGluZyBpcyB0aGF0IGNoYW5naW5nIHRoZSBhbGxvd2VkIHZhbHVlcyBvZgpyeC1pbnRlcm5hbC1k
ZWxheS1wcyAvIHR4LWludGVybmFsLWRlbGF5LXBzIG5lZWRzIHRvIGJlIGV4cGxpY2l0bHkKanVz
dGlmaWVkIGFzIERUIEFCSSBzYWZlLgoKRm9yIHYyLCB3ZSBhcmUgcGxhbm5pbmcgdG8gcmVwbGFj
ZSB0aGUgZW51bSB3aXRoIGEgbWluL21heCBjb25zdHJhaW50LgpUaGVzZSBwcm9wZXJ0aWVzIGNh
cnJ5IGxpdGVyYWwgZGVsYXkgdmFsdWVzIGluIHBpY29zZWNvbmRzLCBhbmQgYWxsCnByZXZpb3Vz
bHkgdmFsaWQgdmFsdWVzIHdpbGwgcmVtYWluIHZhbGlkIGFuZCByZXRhaW4gdGhlIHNhbWUgbWVh
bmluZy4KRXhpc3RpbmcgRFQgYmxvYnMgd2lsbCB0aGVyZWZvcmUgY29udGludWUgdG8gd29yayB1
bmNoYW5nZWQuCgpXZSB3aWxsIGFsc28gYWRkIGV4cGxpY2l0IHRleHQgdG8gdGhlIGNvbW1pdCBt
ZXNzYWdlIGV4cGxhaW5pbmcgd2h5IHRoaXMKY2hhbmdlIGlzIERUIEFCSSBzYWZlIGFuZCB3aHkg
bm8gcmVncmVzc2lvbnMgYXJlIGV4cGVjdGVkLgoKPiA+ICsgIGVzd2luLHJ4LWNsay1pbnZlcnQ6
Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIEludmVydCB0aGUgcmVjZWl2ZSBjbG9j
ayBzYW1wbGluZyBwb2xhcml0eSBhdCB0aGUgTUFDIGlucHV0Lgo+ID4gKyAgICAgIFRoaXMgcHJv
cGVydHkgbWF5IGJlIHVzZWQgdG8gY29tcGVuc2F0ZSBmb3IgU29DLXNwZWNpZmljCj4gPiArICAg
ICAgcmVjZWl2ZSBjbG9jayB0byBkYXRhIHNrZXcgYW5kIGhlbHAgZW5zdXJlIGNvcnJlY3QgUlgg
ZGF0YQo+ID4gKyAgICAgIHNhbXBsaW5nIGF0IGhpZ2ggc3BlZWQuCj4gPiArICAgIHR5cGU6IGJv
b2xlYW4KPiAKPiBUaGlzIGRvZXMgbm90IG1ha2UgdG9vIG11Y2ggc2Vuc2UgdG8gbWUuIFRoZSBS
R01JSSBzdGFuZGFyZCBpbmRpY2F0ZXMKPiBzYW1wbGluZyBoYXBwZW5zIG9uIGJvdGggZWRnZXMg
b2YgdGhlIGNsb2NrLiBUaGUgcmlzaW5nIGVkZ2UgaXMgZm9yCj4gdGhlIGxvd2VyIDQgYml0cywg
dGhlIGZhbGxpbmcgZWRnZSBmb3IgdGhlIHVwcGVyIDQgYml0cy4gRmxpcHBpbmcgdGhlCj4gcG9s
YXJpdHkgd291bGQgb25seSBzd2FwIHRoZSBuaWJibGVzIGFyb3VuZC4KPiAKWW91IGFyZSBjb3Jy
ZWN0IGFib3V0IHRoZSBSR01JSSBzcGVjaWZpY2F0aW9uLiBUaGUgaW50ZW50IG9mCmVzd2luLHJ4
LWNsay1pbnZlcnQgaXMgbm90IHRvIGNoYW5nZSB0aGUgUkdNSUkgc2FtcGxpbmcgcnVsZSwgYnV0
IHRvCmNvbXBlbnNhdGUgZm9yIFNvQy1pbnRlcm5hbCBSWEMtdG8tUlhEIHNrZXcgYW5kIHJlc3Rv
cmUgdGhlIGNvcnJlY3QKc2FtcGxpbmcgcmVsYXRpb25zaGlwIGF0IHRoZSBNQUMgaW5wdXQuCgpP
biBFSUM3NzAwLCBSWEMgYW5kIFJYRCBleHBlcmllbmNlIGFuIGludGVybmFsIHNrZXcgYmVmb3Jl
IHJlYWNoaW5nIHRoZQpNQUMuIEF0IGhpZ2ggc3BlZWQsIHRoaXMgY2FuIHNoaWZ0IHRoZSBlZmZl
Y3RpdmUgc2FtcGxpbmcgcG9pbnQgYnkKYXBwcm94aW1hdGVseSBoYWxmIGEgY3ljbGUsIGNhdXNp
bmcgdGhlIE1BQyB0byBzYW1wbGUgdGhlIHdyb25nIG5pYmJsZQpvbiBlYWNoIGVkZ2UuCgpDb25j
ZXB0dWFsbHksIHRoZSBzaXR1YXRpb25zIGFyZSBhcyBmb2xsb3dzLgoKUkdNSUktc3BlY2lmaWVk
IGJlaGF2aW9yIChjb3JyZWN0KToKClJYQzogICBfXy/igL7igL5cX18v4oC+4oC+XF9fCiAgICAg
ICAgIOKGkSAg4oaTICAgICAgCiAgICAgICAgIHwgIHwgICAgICAKICAgICAgICAgfCAgfCAgICAg
IAogICAgICAgICB8ICArLS0tLS0tLS0tIHNhbXBsZSBSWERbNDo3XQogICAgICAgICArLS0tLS0t
LS0tLS0tIHNhbXBsZSBSWERbMDozXQoKU29DLWludGVybmFsIHNrZXcgY2F1c2luZyBpbmNvcnJl
Y3Qgc2FtcGxpbmcgKHdpdGhvdXQgaW52ZXJ0KToKClJYQzogICBfXy/igL7igL5cX18v4oC+4oC+
XF9fCiAgICAgICAgIOKGkSAg4oaTICAgICAgCiAgICAgICAgIHwgIHwgICAgICAKICAgICAgICAg
fCAgfCAgICAgIAogICAgICAgICB8ICArLS0tLS0tLS0tIHNhbXBsZSBSWERbMDozXSAgICh3cm9u
ZykKICAgICAgICAgKy0tLS0tLS0tLS0tLSBzYW1wbGUgUlhEWzQ6N10gICAod3JvbmcpCgpBZnRl
ciBlbmFibGluZyBpbnRlcm5hbCBSWCBjbG9jayBpbnZlcnQ6CgpSWEM6ICAgX18v4oC+4oC+XF9f
L+KAvuKAvlxfXwogICAgICAgICDihpEgIOKGkyAgICAgIAogICAgICAgICB8ICB8ICAgICAgCiAg
ICAgICAgIHwgIHwgICAgICAKICAgICAgICAgfCAgKy0tLS0tLS0tLSBzYW1wbGUgUlhEWzQ6N10g
ICAoY29ycmVjdCkKICAgICAgICAgKy0tLS0tLS0tLS0tLSBzYW1wbGUgUlhEWzA6M10gICAoY29y
cmVjdCkKClRoZSBpbnZlcnQgY29udHJvbCByZXN0b3JlcyBzYW1wbGluZyBvZiBSWERbMDozXSBv
biB0aGUgcmlzaW5nIGVkZ2UKYW5kIFJYRFs0OjddIG9uIHRoZSBmYWxsaW5nIGVkZ2UsIGV4YWN0
bHkgYXMgZGVmaW5lZCBieSB0aGUgUkdNSUkKc3BlY2lmaWNhdGlvbi4gTm8gcHJvdG9jb2wtbGV2
ZWwgYmVoYXZpb3Igb3IgZWRnZSBhc3NpZ25tZW50IGlzCmNoYW5nZWQuCgpUaGFua3MsCkxpIFpo
aQo=

