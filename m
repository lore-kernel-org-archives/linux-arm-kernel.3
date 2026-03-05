Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF612EFCE58
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 02:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybndNrLUKU2ohwbDLpcSzdJf2WxNWha0amEA0YitpQ8=; b=OOJ4FBogJBK5pTv/gmL3J62WmH
	ysxB7SriTxh/o7GYIQ40iYTZQd5k/dUhuAfqmvPbUGeheYB5f9Ah3QAzHhFF7agNQa8ra/Wx2x+Du
	ZIFKO0y895oxUl7qYXW7VS5g46W6DCZEyCmynYIY3WbkVn7cHLK7IiUhpbxVAto1YY8iF4oyxzYhq
	vnFScVpebrUJDj26qw2DFcA6r5NYHaw2WxKWGBBjM9ms6ledDVHY1UsYPdYfBlCC51X9K++Eie1w4
	5q9ro8eIh5wHj/EOXJ3586Ny+RrS2xzEHlfuAA4axZTXPa67g+jUYsqFPNGt1qr2UZqzWn8JOPrqb
	2i2wsfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxyps-00000000o6R-0k1F;
	Thu, 05 Mar 2026 02:53:12 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxypo-00000000o5h-2ji7;
	Thu, 05 Mar 2026 02:53:10 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Thu, 5 Mar 2026 10:52:38 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Thu, 5 Mar 2026 10:52:38 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Conor Dooley" <conor@kernel.org>, krzk+dt@kernel.org
Cc: "Bo Gan" <ganboing@gmail.com>, "Jakub Kicinski" <kuba@kernel.org>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, robh@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH net-next v3 1/3] dt-bindings: ethernet: eswin: add
 clock sampling control
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260304-capable-setback-908ba5b5c858@spud>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260303163846.156d18f7@kernel.org>
 <20260304-regulate-verdict-c3a361d2dc83@spud>
 <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
 <20260304-capable-setback-908ba5b5c858@spud>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <9eaad6e.4df8.19cbbe95b3c.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgBnCXP276hpA8kFAA--.1626W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgERDGmoXwcMsQAAs6
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_185308_822269_BC1C2CE4 
X-CRM114-Status: GOOD (  24.18  )
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

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQ29ub3IgRG9vbGV5IiA8
Y29ub3JAa2VybmVsLm9yZz4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wMy0wNCAxNzozMDo1NyAo5pif
5pyf5LiJKQo+IOaUtuS7tuS6ujogIkJvIEdhbiIgPGdhbmJvaW5nQGdtYWlsLmNvbT4KPiDmioTp
gIE6ICJKYWt1YiBLaWNpbnNraSIgPGt1YmFAa2VybmVsLm9yZz4sIGxpemhpMkBlc3dpbmNvbXB1
dGluZy5jb20sIGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4u
Y2gsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIHJvYmhAa2VybmVs
Lm9yZywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNv
bSwgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwgcm1rK2tlcm5lbEBhcm1saW51eC5vcmcu
dWssIHdlbnNAa2VybmVsLm9yZywgcGp3QGtlcm5lbC5vcmcsIHBhbG1lckBkYWJiZWx0LmNvbSwg
YW91QGVlY3MuYmVya2VsZXkuZWR1LCBhbGV4QGdoaXRpLmZyLCBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnLCBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tLCBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1pbkBlc3dpbmNvbXB1dGlu
Zy5jb20sIHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbSwgcHJpdGVzaC5wYXRlbEBlaW5m
b2NoaXBzLmNvbSwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbQo+IOS4u+mimDogUmU6
IFtQQVRDSCBuZXQtbmV4dCB2MyAxLzNdIGR0LWJpbmRpbmdzOiBldGhlcm5ldDogZXN3aW46IGFk
ZCBjbG9jayBzYW1wbGluZyBjb250cm9sCj4gCj4gT24gVHVlLCBNYXIgMDMsIDIwMjYgYXQgMDU6
MjM6MThQTSAtMDgwMCwgQm8gR2FuIHdyb3RlOgo+ID4gSGkgQWxsLAo+ID4gCj4gPiBPbiAzLzMv
MjYgMTY6NDcsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXIgMDMsIDIwMjYg
YXQgMDQ6Mzg6NDZQTSAtMDgwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6Cj4gPiA+ID4gT24gVHVl
LCAgMyBNYXIgMjAyNiAxNDoxNjozNyArMDgwMCBsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tIHdy
b3RlOgo+ID4gPiA+ID4gVGhlcmUgYXJlIGN1cnJlbnRseSBubyBpbi10cmVlIHVzZXJzIG9mIHRo
ZSBFSUM3NzAwIEV0aGVybmV0IGRyaXZlciwgc28KPiA+ID4gPiA+IHRoZXNlIGNoYW5nZXMgYXJl
IHNhZmUuCj4gPiA+ID4gCj4gPiA+ID4gV2hhdCBkbyB5b3UgbWVhbiBieSB0aGlzIHNlbnRlbmNl
PyBUaGUgY29tbWl0IHVuZGVyIEZpeGVzIHdhcyBwYXJ0IG9mCj4gPiA+ID4gTGludXggdjYuMTkg
YWxyZWFkeS4KPiA+ID4gCj4gPiA+IFRoZSAiZnVubnkiIHRoaW5nIGlzIHRoYXQgY2FyaW5nIGFi
b3V0IHVzZXJzIGRvZXNuJ3QgZXZlbiByZWFsbHkgbWF0dGVyCj4gPiA+IG9uIHRoZSBkZXZpY2V0
cmVlIHBhdGNoLCBleGNlcHQgZm9yIHRoaXMgaHVuazoKPiA+ID4gfEBAIC04MSw3ICs5OSw5IEBA
IHByb3BlcnRpZXM6Cj4gPiA+IHwgICAgICAgICAgICAgICAgICAgICAgICAgIG9yIGV4dGVybmFs
IGNsb2NrIHNlbGVjdGlvbgo+ID4gPiB8ICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBPZmZzZXQg
b2YgQVhJIGNsb2NrIGNvbnRyb2xsZXIgTG93LVBvd2VyIHJlcXVlc3QKPiA+ID4gfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmVnaXN0ZXIKPiA+ID4gfCsgICAgICAgICAgLSBkZXNjcmlwdGlv
bjogT2Zmc2V0IG9mIHJlZ2lzdGVyIGNvbnRyb2xsaW5nIFRYRCBkZWxheQo+ID4gPiB8ICAgICAg
ICAgICAtIGRlc2NyaXB0aW9uOiBPZmZzZXQgb2YgcmVnaXN0ZXIgY29udHJvbGxpbmcgVFgvUlgg
Y2xvY2sgZGVsYXkKPiA+ID4gfCsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogT2Zmc2V0IG9mIHJl
Z2lzdGVyIGNvbnRyb2xsaW5nIFJYRCBkZWxheQo+ID4gPiB8Cj4gPiA+IHwgcmVxdWlyZWQ6Cj4g
PiA+IHwgICAtIGNvbXBhdGlibGUKPiA+ID4gQW5kIGl0IG9ubHkgbWF0dGVycyBoZXJlIGJlY2F1
c2UgYW4gaXRlbSBpcyBpbmplY3RlZCBtaWQtbGlzdC4gSWYgdGhpcwo+ID4gPiB3YXMgbW92ZWQg
dG8gdGhlIGVuZCB3aXRoIHRoZSBSWEQgZGVsYXksIHRoZSAqKmR0LWJpbmRpbmcqKiBjaGFuZ2Vz
Cj4gPiA+IGRvbid0IGhhdmUgaXNzdWVzIHdpdGggc2FmZXR5LiBJJ3ZlIG5vdCBsb29rZWQgYXQg
d2hldGhlciB0aGVyZSBhcmUKPiA+ID4ga25vY2stb24gY29uY2VybnMgYWJvdXQgdXNlcnMgaW4g
dGhlIGRyaXZlciBvciB3aGF0ZXZlciB5ZXQsIGJ1dCBmcm9tIGEKPiA+ID4gYmluZGluZyBQT1Yg
b25seSB0aGF0IGh1bmsgY2FuIGJyZWFrIHNvbWV0aGluZyB0aGF0IGN1cnJlbnRseSB3b3Jrcy4K
PiA+IAo+ID4gVGhpcyB3YXMgYWxyZWFkeSBkaXNjdXNzZWQgaGVyZSBpbiB2MToKPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvZTcxODNhZTEtOGI4Yi00ZTc3LTlmNGUtM2JjMWI0YjYz
NTU2QGx1bm4uY2gvCj4gPiAKPiA+IFRoZSBkZXZpY2UtdHJlZSBpcyBub3QgY2hlY2tlZCBpbiB5
ZXQgYnkgRVNXSU4gZm9sa3MsIHNvIHRoZXJlJ3MgY3VycmVudGx5Cj4gPiBubyB1c2VyIG9mIHRo
ZSBkdC1iaW5kaW5nLiBObyBuZWVkIHRvIHdvcnJ5IGFib3V0IGJhY2t3YXJkIGNvbXBhdC4KPiAK
PiBUaGUgYmluZGluZyBhbmQgZHJpdmVyIGV4aXN0LCB0aGVyZSBkb2Vzbid0IG5lZWQgdG8gYmUg
YSBkdHMgaW4gdHJlZSBmb3IKPiB0aGVyZSB0byBiZSBwb3RlbnRpYWwgdXNlcnMuIElmIHRoZSBi
cmVhayB3YXMgaW1wb3J0YW50IEkgbWlnaHQgbm90Cj4gY2FyZSwgYnV0IHRoaXMgc2VlbXMgdG8g
YmUgYSBncmF0dWl0b3VzIGJyZWFrLCBzaW5jZSB0aGUgbmV3IGl0ZW1zIGNvdWxkCj4gYmUgYWRk
ZWQgdG8gdGhlIGVuZCBvZiB0aGUgbGlzdCBhbmQgY29tcGF0aWJpbGl0eSBtYWludGFpbmVkIHdp
dGhvdXQKPiBpbmN1cnJpbmcgYW55IG1vcmUgZGlmZmljdWx0eSBmb3IgeW91LgoKSGkgQ29ub3Ig
YW5kIEtyenlzenRvZiwKClRoYW5rcyBmb3IgdGhlIHJldmlld3MuCgotIFRoZSBuZXh0IHBhdGNo
IHdpbGwgZml4IHRoZSBwcm9wZXJ0eSBvcmRlciB0byBhdm9pZCBhbnkgYnJlYWthZ2UKICB3aXRo
IGV4aXN0aW5nIERUIGJpbmRpbmdzLgoKLSBFdGgxIGRvZXMgaGF2ZSBhIHRpbWluZyBpc3N1ZSBp
biBzaWxpY29uLCBhcyBkaXNjdXNzZWQgaGVyZToKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzMyYTFmODE0LjJjNzkuMTliZmUxNzMyMjUuQ29yZW1haWwubGlubWluQGVzd2luY29tcHV0
aW5nLmNvbS8KCsKgIEJhc2VkIG9uIHRoaXMsIGFuZCBhY2NvcmRpbmcgdG8gdGhlIGFkdmljZSBm
cm9tIEFuZHJldwogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNTljZWM2MTctMDE4OS00
ZGMzLWJjM2YtNjM0NjE1NWE2MmFlQGx1bm4uY2gvCiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC9iZDIwMmNmYS1kNmViLTRkMGUtOTgyZC1iNDk3OTVkZDI1ZjdAbHVubi5jaC8KwqAgYWRk
aW5nIGEgRFQgcHJvcGVydHkgaXMgbm90IGEgcmVhc29uYWJsZSBhcHByb2FjaC4KwqDCoArCoCBJ
biB0aGUgbmV4dCBwYXRjaCwgSSB3aWxsIGltcHJvdmUgdGhlIGRlc2NyaXB0aW9uL3BhcmFncmFw
aCBhbmQgcHJvcGVybHkKICBkb2N1bWVudCB0aGUgdGltaW5nIGlzc3Vlcy4KwqDCoArCoCBEbyB5
b3UgdGhpbmsgdGhpcyBpcyBva2F5PwoKQmVzdCByZWdhcmRzLApaaGkgTGkK

