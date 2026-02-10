Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7DCEA3F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 10:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xH0/xyuV2m4IGJF4YQH/yddhchsc4qxVZOZhbxGO42E=; b=a4fdN0fmNC12T07osfZzw7uz+r
	V+ZbI0jqWePsTwFM9r84h9FciJmvDeo8Dvel1Q64mwi9A7gMU+n0Qw5Z84lpOJ7F+LFEnL2MdOQmh
	Slod5OAWd9q/Jy9RnhhZFxi4U1DOoPJWUfW4FeOlSrguR3pTTZG2iM6ooNCihYkx8CKcNxuEUPg1v
	qOpx54SwKJXfWg0ughOsfKTEvjXuyG25QwO+X1fwev39B0KY1/fa4srDPFeyb84NUUOAWIIxPfSod
	75Z76JXUZAKWFJs/jDq+H0sHPCTZ/mHCNF/IaVdynuUBZIrOSP8YL+ht7uSkMrhvVdN2fTb3gujzk
	ZmrxERhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpksm-0000000GpjC-2RPU;
	Tue, 10 Feb 2026 10:22:12 +0000
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpksj-0000000GphM-0141
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 10:22:12 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 10 Feb 2026 18:21:40 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Tue, 10 Feb 2026 18:21:40 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	"Andrew Lunn" <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH v2 0/2] net: stmmac: eic7700: fix EIC7700 eth1 RX
 sampling timing
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aYnvwAK3gpxBs-EF@shell.armlinux.org.uk>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <64bf6b40-b947-4ffa-8d48-4d6341931327@lunn.ch>
 <aYnvwAK3gpxBs-EF@shell.armlinux.org.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5dea8ce0.4435.19c471231f5.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDXMzm0BotpuZEEAA--.2117W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEODGmKDIMekQAAsi
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_022209_352309_E086E6D3 
X-CRM114-Status: GOOD (  11.78  )
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

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiUnVzc2VsbCBLaW5nIChP
cmFjbGUpIiA8bGludXhAYXJtbGludXgub3JnLnVrPgo+IOWPkemAgeaXtumXtDoyMDI2LTAyLTA5
IDIyOjMxOjI4ICjmmJ/mnJ/kuIApCj4g5pS25Lu25Lq6OiBsaXpoaTJAZXN3aW5jb21wdXRpbmcu
Y29tLCAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4KPiDmioTpgIE6IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5u
ZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9iaEBrZXJuZWwub3Jn
LCBrcnprK2R0QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtl
cm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tLCBh
bGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tLCBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tLCBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1p
bkBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbSwgd2Vp
c2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbQo+IOS4u+mimDogUmU6IFtQQVRDSCB2MiAwLzJd
IG5ldDogc3RtbWFjOiBlaWM3NzAwOiBmaXggRUlDNzcwMCBldGgxIFJYIHNhbXBsaW5nIHRpbWlu
Zwo+IAo+IE9uIE1vbiwgRmViIDA5LCAyMDI2IGF0IDAyOjM2OjExUE0gKzAxMDAsIEFuZHJldyBM
dW5uIHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMDksIDIwMjYgYXQgMDU6NDY6MjhQTSArMDgwMCwg
bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbSB3cm90ZToKPiA+ID4gRnJvbTogWmhpIExpIDxsaXpo
aTJAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gPiAKPiA+ID4gdjEgLT4gdjI6Cj4gPiAKPiA+IEZv
ciB2ZXJzaW9uIDMsIHBsZWFzZSBpbmNsdWRlIGEgcGF0Y2ggdG8gdGhlIFNvQyAuZHRzaSBmaWxl
IGFkZGluZyB0aGUKPiA+IEV0aGVybmV0IG5vZGVzLiBXZSBsaWtlIHRvIHNlZSB1c2VycyBvZiBj
b2RlIGJlaW5nIGFkZGVkLgo+IAo+IEluIGFkZGl0aW9uIHRvIEFuZHJldydzIGNvbW1lbnRzLCBi
ZWZvcmUgcG9zdGluZyBhbm90aGVyIHNlcmllcywgcGxlYXNlCj4gcmV2aWV3IGh0dHBzOi8vZG9j
cy5rZXJuZWwub3JnL3Byb2Nlc3MvbWFpbnRhaW5lci1uZXRkZXYuaHRtbCwKPiBwYXJ0aWN1bGFy
bHkgc2VjdGlvbnMgMS40IGFuZCAxLjYuMS4KPiAKVGhhbmtzIGZvciB0aGUgY29tbWVudHMuCgpU
aGUgdjMgcGF0Y2ggd2lsbCB0YXJnZXQgdGhlIG5ldCBnaXQgdHJlZS4KCldlIHdpbGwgYWRkIHRo
ZSBldGhlcm5ldCBub2RlcyBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgY2xvY2sgbm9kZSB0bwplaWM3
NzAwLmR0c2kgYW5kIGVpYzc3MDAtaGlmaXZlLXByZW1pZXItcDU1MC5kdHMgaW4gdjMgcGF0Y2gu
IAoKUGxlYXNlIG5vdGUgdGhhdCB0aGUgRUlDNzcwMCBjbG9jayBjb250cm9sbGVyIGJpbmRpbmcg
YW5kIGRyaXZlciBhcmUgbm90CnlldCBtZXJnZWQgdXBzdHJlYW0sIHNvIHRoZSBjbG9jayBub2Rl
cyB3aWxsIG5vdCBiZSBmdW5jdGlvbmFsIHVudGlsIHRoZQpjbG9jayBkcml2ZXIgaXMgYXZhaWxh
YmxlLiBBcyBhIHJlc3VsdCwgZHRic19jaGVjayB3aWxsIGN1cnJlbnRseSByZXBvcnQKc2NoZW1h
IHdhcm5pbmdzL2Vycm9ycyByZWxhdGVkIHRvIHRoZSBjbG9jayBub2Rlcy4gVGhpcyBpcyBhIGtu
b3duIGFuZAp0ZW1wb3JhcnkgbGltaXRhdGlvbiB1bnRpbCB0aGUgY2xvY2sgYmluZGluZyBhbmQg
ZHJpdmVyIGFyZSBhdmFpbGFibGUKdXBzdHJlYW0uCgpQbGVhc2UgbGV0IHVzIGtub3cgaWYgdGhp
cyBhcHByb2FjaCBpcyBhY2NlcHRhYmxlLgoKQmVzdCByZWdhcmRzLApaaGkgTGkK

