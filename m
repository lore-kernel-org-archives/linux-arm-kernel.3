Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23532CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 02:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyJWM5q8wlnOqWx5bMCl7ppdv5LJ0QqOaQ1SST/zF5s=; b=yPqDV6CGDGn+le/SCVxbpWHtLd
	ObZn2giBrR4bnDF3n7D+3yMW6dEdSyBIaBCbhgAuoE3DqvuQatyhVqW9xnwS//oQJaO0wNF032Tko
	GBTYOB9LPjqvWd9epRQq+1El4iL3ROmXE8+Qo2wyOl7o89gt5NrVFoyhCcBAsSFD7iSeqUcPBpJWq
	WPZCx29hQdMwigOXlK+ZOCrZqZtZN4bDJQP+Nm+l0EdcmLbXjsEkpJmQ2/PUij2uiyH/rO+QiT0/p
	Y/uTKdOoVJo2/BnhYS2y39PxUeeVdlF6Zym3dO6s8/35Vxb0+blcVfVuVzMJtOrGimlA0/8UIgp8m
	o7mTxBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRjm-00000000Ua0-0ld0;
	Wed, 06 May 2026 02:11:46 +0000
Received: from azure-sdnproxy.icoremail.net ([52.229.168.213])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRji-00000000UZ2-0m7f;
	Wed, 06 May 2026 02:11:44 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Wed, 6 May 2026 10:10:57 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Wed, 6 May 2026 10:10:57 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, devicetree@vger.kernel.org, davem@davemloft.net,
	edumazet@google.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
	horms@kernel.org
Subject: Re: Re: [PATCH net-next v7 2/4] net: stmmac: eic7700: enable clocks
 before syscon access and correct RX sampling timing
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260430163551.7491407a@kernel.org>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
 <20260427072508.1151-1-lizhi2@eswincomputing.com>
 <20260428180625.738223cf@kernel.org>
 <2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
 <20260430163551.7491407a@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <38d052b7.7a70.19dfb0d782b.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDHaXMyo_ppwzEXAA--.6613W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQETDGn6G5we7wACs4
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_191142_533741_5BE14130 
X-CRM114-Status: GOOD (  12.79  )
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

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiSmFrdWIgS2ljaW5za2ki
IDxrdWJhQGtlcm5lbC5vcmc+Cj4g5Y+R6YCB5pe26Ze0OjIwMjYtMDUtMDEgMDc6MzU6NTEgKOaY
n+acn+S6lCkKPiDmlLbku7bkuro6IOadjuW/lyA8bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbT4K
PiDmioTpgIE6IGFuZHJldytuZXRkZXZAbHVubi5jaCwgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmcsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIHJvYmhAa2VybmVs
Lm9yZywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNv
bSwgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwgcm1rK2tlcm5lbEBhcm1saW51eC5vcmcu
dWssIHBqd0BrZXJuZWwub3JnLCBwYWxtZXJAZGFiYmVsdC5jb20sIGFvdUBlZWNzLmJlcmtlbGV5
LmVkdSwgYWxleEBnaGl0aS5mciwgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBtYXhpbWUu
Y2hldmFsbGllckBib290bGluLmNvbSwgbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWlu
QGVzd2luY29tcHV0aW5nLmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCBwcml0
ZXNoLnBhdGVsQGVpbmZvY2hpcHMuY29tLCB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29t
LCBob3Jtc0BrZXJuZWwub3JnCj4g5Li76aKYOiBSZTogW1BBVENIIG5ldC1uZXh0IHY3IDIvNF0g
bmV0OiBzdG1tYWM6IGVpYzc3MDA6IGVuYWJsZSBjbG9ja3MgYmVmb3JlIHN5c2NvbiBhY2Nlc3Mg
YW5kIGNvcnJlY3QgUlggc2FtcGxpbmcgdGltaW5nCj4gCj4gT24gVGh1LCAzMCBBcHIgMjAyNiAx
NDo0Mzo1MCArMDgwMCAoR01UKzA4OjAwKSDmnY7lv5cgd3JvdGU6Cj4gPiA+IFdoeSBGaXhlcz8g
SWYgZXRoMSBuZXZlciB3b3JrZWQgdGhpcyBpcyBub3QgYSBmaXggYnV0IG5ldyBmdW5jdGlvbmFs
aXR5Cj4gPiA+IElmIHlvdSB3YW50IHRvIG1ha2UgdGhpcyBhIGZpeCB0byBwcmV2ZW50IGluY29t
cGF0aWJpbGl0eSAtIGN1dCBpdCBkb3duCj4gPiA+IGp1c3QgdG8gdGhlIGV0aDAgY2hhbmdlcy4K
PiA+ID4gICAKPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24uCj4gPiAKPiA+IFlvdSdy
ZSByaWdodCB0aGF0IGV0aDEgbmV2ZXIgd29ya2VkIGF0IEdpZ2FiaXQgc3BlZWQsIHNvIHRoaXMg
c2hvdWxkCj4gPiBub3QgYmUgdHJlYXRlZCBhcyBhIGZpeC4KPiA+IAo+ID4gSW4gdjgsIEkgd2ls
bCBzcGxpdCB0aGUgY2hhbmdlcyBpbnRvIHR3byBwYXRjaGVzIHdpdGhpbiB0aGUgc2FtZSBzZXJp
ZXM6Cj4gPiAtIFBhdGNoIDEgd2lsbCBjb250YWluIG9ubHkgdGhlIGZpeGVzIGFmZmVjdGluZyB0
aGUgZXhpc3RpbmcgZXRoMAo+ID4gZnVuY3Rpb25hbGl0eSwgYW5kIHdpbGwga2VlcCB0aGUgRml4
ZXMgdGFnLgo+ID4gLSBQYXRjaCAyIHdpbGwgYWRkIHRoZSBldGgxIHN1cHBvcnQgKFJYIGNsb2Nr
IGludmVyc2lvbiB3b3JrYXJvdW5kKQo+ID4gYXMgbmV3IGZ1bmN0aW9uYWxpdHksIHdpdGhvdXQg
YSBGaXhlcyB0YWcuCj4gPiAKPiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ugd291bGQgcHJl
ZmVyIGEgZGlmZmVyZW50IHNwbGl0IG9yIG9yZGVyaW5nLgo+IAo+IElmIHlvdSB3YW50IHRvIGNv
bnNpZGVyIHNvbWUgcGFydCBvZiB0aGlzIGNvbW1pdCBhIGZpeCBpdCBoYXMgdG8gYmUKPiBwb3N0
ZWQgc2VwYXJhdGVseSB0byB0aGUgbmV0IHRyZWUgKHJhdGhlciB0aGFuIG5ldC1uZXh0KS4KPiBP
bmNlIGl0J3MgbWVyZ2VkIGFuZCBtYWtlcyBpdCB3YXkgb3ZlciB0byB0aGUgbmV0LW5leHQgdHJl
ZSAoZWFjaAo+IFRodXJzZGF5KSB5b3UgY2FuIHBvc3QgdGhlIG5ldC1uZXh0IGNobmFnZXMgZm9y
IGV0aDEKClRoYW5rcywgdW5kZXJzdG9vZC4KCkkgd2lsbCBzcGxpdCB0aGUgY2hhbmdlcyBhY2Nv
cmRpbmdseToKLSBTZW5kIHRoZSBldGgwIGZpeGVzIGFzIGEgbmV3IHYxIHNlcmllcyB0YXJnZXRp
bmcgbmV0LgotIFNlbmQgdGhlIGV0aDEgZW5hYmxlbWVudCBhcyBhIG5ldyB2MSBzZXJpZXMgdGFy
Z2V0aW5nIG5ldC1uZXh0LgoKVGhhbmtzIGZvciB0aGUgZ3VpZGFuY2UuCg==

