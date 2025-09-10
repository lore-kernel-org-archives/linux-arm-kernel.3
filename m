Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219E6CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRjq8XWD+5JGqB7JhkYl6nl7QM3sj5UrtQ721rRgubY=; b=RtM0Wb5UUYhK6wCpi+TsZyOIdT
	fr0IepcLONr2Anj65J7m4Gsb31bkR6WtjN7hz0wmzW4Qxj7HhcoE7jRi83Ib08LEOfpJEn/DC9+sd
	+TjIydcgacEqfkP+MpxsRC4MxpvSMsi2KgDGarCAJU+BuNgSeqgUTiP6Fx8PaELFCqQJb+6VVnLif
	PP7ft7ti0pDLyjkFNjQ3QKPBjjDHrRgYOMm+RX5rh92JvReC7Y0FO2yLPbBNG/OVsODkRfFd7gLEX
	H78tff5o/pPwKi7Yo/CsQM7SbuCAvMaqnCPzxcv6IvcUaI8ayz3xUf/k8l4yPcnrmx4W6Q0eAfAZd
	pGnYrdGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGJy-0000000Cydq-0JXv;
	Wed, 10 Sep 2025 08:36:54 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGJu-0000000CybN-1Tz7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:36:52 +0000
Received: from weishangjuan$eswincomputing.com ( [10.12.96.155] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 10 Sep 2025 16:36:19 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.155]
Date: Wed, 10 Sep 2025 16:36:19 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6Z+m5bCa5aif?= <weishangjuan@eswincomputing.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com, rmk+kernel@armlinux.org.uk,
	faizal.abdul.rahim@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
	boon.khai.ng@altera.com, 0x1207@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	emil.renner.berthing@canonical.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v5 1/2] dt-bindings: ethernet: eswin: Document for
 EIC7700 SoC
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20250905-hissing-papaya-badger-1b2ddf@kuoka>
References: <20250904085913.2494-1-weishangjuan@eswincomputing.com>
 <20250904090055.2546-1-weishangjuan@eswincomputing.com>
 <20250905-hissing-papaya-badger-1b2ddf@kuoka>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3579e9ca.106c.19932c4c2f0.Coremail.weishangjuan@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgAXt5WDOMFo7PzMAA--.25110W
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/1tbiAQEBEGjAVn
	gdDwAAsF
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013650_693712_9FD1580D 
X-CRM114-Status: UNSURE (   7.90  )
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

RGVhciBLcnp5c3p0b2YgS296bG93c2tpLAoKSSBob3BlIHRoaXMgZW1haWwgZmluZHMgeW91IHdl
bGwuIEZpcnN0LCBwbGVhc2UgYWxsb3cgbWUgdG8gYXBvbG9naXplIGZvciBhbnkgaW5jb252ZW5p
ZW5jZQpjYXVzZWQgYnkgdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIHlhbWwgZGVzY3JpcHRp
b24uIFdlIGhhdmUgbm93IHJldmlzZWQgdGhlIGRlc2NyaXB0aW9uCmNvbnRlbnQgYWNjb3JkaW5n
bHkgYXMgZm9sbG93OgoKZGVzY3JpcHRpb246CsKgIFBsYXRmb3JtIGdsdWUgbGF5ZXIgaW1wbGVt
ZW50YXRpb24gZm9yIFNUTU1BQyBFdGhlcm5ldCBkcml2ZXIuCgpJbiBhZGRpdGlvbiwgdGhlIGxp
bmsgdG8gdjUgcGF0Y2hlcyBpcyBhcyBmb2xsb3dz77yaCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI1MDkwNDA5MDA1NS4yNTQ2LTEtd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNv
bS8KCkkgaGF2ZSBhIHF1ZXN0aW9uIHRvIHNlZWsgeW91ciBhZHZpY2UuCkFmdGVyIHNlbmRpbmcg
dGhlIHY1IHBhdGNoZXMsIHdlIHJlY2VpdmVkIHlvdXIgZmVlZGJhY2suIE9yaWdpbmFsbHksIHdo
ZW4gcHJlcGFyaW5nIHRoZSB2NiBwYXRjaGVzLAp3ZSBpbnRlbmRlZCB0byBpbmNsdWRlIHRoZSAi
UmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kga3J6eXN6dG9mLmtvemxvd3NraUBsaW5h
cm8ub3JnIiB0YWcuCkhvd2V2ZXIsIGdpdmVuIHRoYXQgd2UgaGF2ZSByZXZpc2VkwqB0aGUgeWFt
bCBkZXNjcmlwdGlvbiwgSSBhbSB1bmNlcnRhaW4gd2hldGhlciB0aGlzIHRhZyBzaG91bGQKc3Rp
bGwgYmUgaW5jbHVkZWQgaW4gdGhlIHY2IHBhdGNoZXMuIFBlcnNvbmFsbHksIEkgYmVsaWV2ZSBp
dCB3b3VsZCBiZSBhcHByb3ByaWF0ZSB0byByZXRhaW4gdGhlCiJSZXZpZXdlZC1ieSIgdGFnLiBD
b3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gaWYgdGhpcyBpcyBjb3JyZWN0PwpUaGFuayB5b3UgZm9y
IHlvdXIgdGltZSBhbmQgZ3VpZGFuY2UuIEkgbG9vayBmb3J3YXJkIHRvIHlvdXIgcmVzcG9uc2Uu
CkJlc3QgcmVnYXJkcywKU2hhbmdqdWFuIFdlaQoKCj4gLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQo+
IOWPkeS7tuS6ujogIktyenlzenRvZiBLb3psb3dza2kiIDxrcnprQGtlcm5lbC5vcmc+Cj4g5Y+R
6YCB5pe26Ze0OjIwMjUtMDktMDUgMTU6NTM6MzAgKOaYn+acn+S6lCkKPiDmlLbku7bkuro6IHdl
aXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20KPiDmioTpgIE6IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVk
dW1hemV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIHJv
YmhAa2VybmVsLm9yZywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIG1jb3F1ZWxpbi5zdG0zMkBnbWFp
bC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIHlvbmcubGlhbmcuY2hvb25nQGxp
bnV4LmludGVsLmNvbSwgdmxhZGltaXIub2x0ZWFuQG54cC5jb20sIHJtaytrZXJuZWxAYXJtbGlu
dXgub3JnLnVrLCBmYWl6YWwuYWJkdWwucmFoaW1AbGludXguaW50ZWwuY29tLCBwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20sIGlub2NoaWFtYUBnbWFpbC5jb20sIGphbi5w
ZXRyb3VzQG9zcy5ueHAuY29tLCBqc3poYW5nQGtlcm5lbC5vcmcsIHAuemFiZWxAcGVuZ3V0cm9u
aXguZGUsIGJvb24ua2hhaS5uZ0BhbHRlcmEuY29tLCAweDEyMDdAZ21haWwuY29tLCBuZXRkZXZA
dmdlci5rZXJuZWwub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBsaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tLCBlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5v
bmljYWwuY29tLCBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRp
bmcuY29tLCBsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9j
aGlwcy5jb20KPiDkuLvpopg6IFJlOiBbUEFUQ0ggdjUgMS8yXSBkdC1iaW5kaW5nczogZXRoZXJu
ZXQ6IGVzd2luOiBEb2N1bWVudCBmb3IgRUlDNzcwMCBTb0MKPiAKPiBPbiBUaHUsIFNlcCAwNCwg
MjAyNSBhdCAwNTowMDo1NVBNICswODAwLCB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29t
IHdyb3RlOgo+ID4gRnJvbTogU2hhbmdqdWFuIFdlaSA8d2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0
aW5nLmNvbT4KPiA+IAo+ID4gQWRkIEVTV0lOIEVJQzc3MDAgRXRoZXJuZXQgY29udHJvbGxlciwg
c3VwcG9ydGluZyBjbG9jawo+ID4gY29uZmlndXJhdGlvbiwgZGVsYXkgYWRqdXN0bWVudCBhbmQg
c3BlZWQgYWRhcHRpdmUgZnVuY3Rpb25zLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGkgTGkg
PGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGFuZ2p1YW4g
V2VpIDx3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gCj4g
QmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo=

