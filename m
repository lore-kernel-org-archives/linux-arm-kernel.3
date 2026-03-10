Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68946FCC9D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adVdp0CWnInaiA8SkZvdYfPWJFxylLonnt+wV3B403o=; b=jGOINH2w/qd9w0lEuVEggpyyjh
	0wzrBCBl49F98+UhucqjP9vrFm4carzFLkTCrCOtJLc3eUbsh+QOfNxj0h83UwyXRr2GITNUNz/Te
	4yDQH8m5UvT8+f3O3qv8EVy8lPpC3pR0lzVPqjgjOGx/OR6gX4UBMNyL6bZ5cuozP4EKYLomwdSeO
	mTh5RldMRxxqs6nXsexdYDo81Siw8Y+7c1CE726LLnHqGFloZSsf82fstB04hgd9Y5n44qSWY6nD8
	KyxFb+Sy/NtB7erKw6ALDbTA+kdYg8Uxq81opwPcFsCkgEhn/SHGT3rx3b/WQZclTL/Ky8pJ1MAJQ
	FkQWy3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrK7-00000008qNA-20NV;
	Tue, 10 Mar 2026 07:16:11 +0000
Received: from azure-sdnproxy.icoremail.net ([52.175.55.52])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrK2-00000008qMY-2qme;
	Tue, 10 Mar 2026 07:16:09 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 10 Mar 2026 15:15:40 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Tue, 10 Mar 2026 15:15:40 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Yao Zi" <me@ziyao.cc>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	wens@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH net-next v3 3/3] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aaa4xodVNaY0gmBA@pie>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061732.918-1-lizhi2@eswincomputing.com> <aaa4xodVNaY0gmBA@pie>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <408e45b4.51a4.19cd699f60e.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDHaXMcxa9pRCIHAA--.2221W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQECDGmu9hMT1QABsr
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_001607_016760_BC9E8796 
X-CRM114-Status: GOOD (  12.83  )
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

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiWWFvIFppIiA8bWVAeml5
YW8uY2M+Cj4g5Y+R6YCB5pe26Ze0OjIwMjYtMDMtMDMgMTg6MzI6MzggKOaYn+acn+S6jCkKPiDm
lLbku7bkuro6IGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20sIGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVkdW1h
emV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9iaEBrZXJuZWwub3JnLCBrcnprK2R0
QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcs
IHBhYmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tLCBhbGV4YW5kcmUu
dG9yZ3VlQGZvc3Muc3QuY29tLCBybWsra2VybmVsQGFybWxpbnV4Lm9yZy51aywgd2Vuc0BrZXJu
ZWwub3JnLCBwandAa2VybmVsLm9yZywgcGFsbWVyQGRhYmJlbHQuY29tLCBhb3VAZWVjcy5iZXJr
ZWxleS5lZHUsIGFsZXhAZ2hpdGkuZnIsIGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcs
IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20sIGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IOaK
hOmAgTogbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWluQGVzd2luY29tcHV0aW5nLmNv
bSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCBwcml0ZXNoLnBhdGVsQGVpbmZvY2hp
cHMuY29tLCB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tCj4g5Li76aKYOiBSZTogW1BB
VENIIG5ldC1uZXh0IHYzIDMvM10gcmlzY3Y6IGR0czogZXN3aW46IGVpYzc3MDAtaGlmaXZlLXBy
ZW1pZXItcDU1MDogZW5hYmxlIEV0aGVybmV0IGNvbnRyb2xsZXIKPiAKPiBPbiBUdWUsIE1hciAw
MywgMjAyNiBhdCAwMjoxNzozMlBNICswODAwLCBsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tIHdy
b3RlOgo+ID4gRnJvbTogWmhpIExpIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gCj4g
PiBFbmFibGUgdGhlIG9uLWJvYXJkIEdpZ2FiaXQgRXRoZXJuZXQgY29udHJvbGxlciBvbiB0aGUK
PiA+IEhpRml2ZSBQcmVtaWVyIFA1NTAgZGV2ZWxvcG1lbnQgYm9hcmQuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IFpoaSBMaSA8bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbT4KPiA+IC0tLQo+ID4g
IC4uLi9kdHMvZXN3aW4vZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cyB8IDUwICsrKysr
KysrKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3NzAwLmR0c2kg
ICAgICAgIHwgNTQgKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTA0
IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
ZXN3aW4vZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvZXN3aW4vZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cwo+ID4gaW5kZXggMTMxZWQx
ZmM2YjJlLi5kNTU4ZjBmZGZiMzggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L2Vzd2luL2VpYzc3MDAtaGlmaXZlLXByZW1pZXItcDU1MC5kdHMKPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvZXN3aW4vZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cwo+IAo+IC4u
Lgo+IAo+ID4gQEAgLTIwLDYgKzIyLDU0IEBAIGNob3NlbiB7Cj4gPiAgCX07Cj4gPiAgfTsKPiA+
ICAKPiA+ICsmZ21hYzAgewo+ID4gKwlwaHktaGFuZGxlID0gPCZnbWFjMF9waHkwPjsKPiA+ICsJ
cGh5LW1vZGUgPSAicmdtaWktaWQiOwo+ID4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+
ID4gKwlwaW5jdHJsLTAgPSA8JmdwaW8xMDZfcGlucz47Cj4gPiArCXJ4LWludGVybmFsLWRlbGF5
LXBzID0gPDIwPjsKPiA+ICsJdHgtaW50ZXJuYWwtZGVsYXktcHMgPSA8MTAwPjsKPiA+ICsJc3Rh
dHVzID0gIm9rYXkiOwo+ID4gKwo+ID4gKwltZGlvIHsKPiA+ICsJCWNvbXBhdGlibGUgPSAic25w
cyxkd21hYy1tZGlvIjsKPiAKPiBTaW5jZSBpdCdzIGltcGxlbWVudGVkIGluIHRoZSBEV01BQyBJ
UCwgSSB0aGluayB0aGUgbWRpbyBidXMgaXMKPiBTb0Mtc3BlY2lmaWMgYW5kIHNob3VsZCBiZSBw
dXQgaW50byB0aGUgU29DIGRldmljZXRyZWUgaW5zdGVhZC4KPiAKCkhpIFlhbyBaaSwKClRoYW5r
cyBmb3IgdGhlIHJldmlldy4KCllvdSdyZSByaWdodCB0aGF0IHRoZSBNRElPIGJ1cyBpcyBpbXBs
ZW1lbnRlZCBhcyBwYXJ0IG9mIHRoZSBEV01BQyBJUCBhbmQKaXMgdGhlcmVmb3JlIFNvQy1zcGVj
aWZpYy4gSXQgbWFrZXMgbW9yZSBzZW5zZSB0byBkZXNjcmliZSB0aGUgTURJTwpjb250cm9sbGVy
IGluIHRoZSBTb0MgZHRzaS4KCkknbGwgbW92ZSB0aGUgTURJTyBub2RlIHRvIGVpYzc3MDAuZHRz
aSBhbmQga2VlcCBvbmx5IHRoZSBQSFkgbm9kZSBpbiB0aGUKYm9hcmQgZHRzIGluIHRoZSBuZXh0
IHJldmlzaW9uLgoKVGhhbmtzLApaaGkgTGkK

