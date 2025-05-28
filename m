Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12ACC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGI3YIv5COewLp59/u1LKJ9iLFWVW3C7cV+6fuUVsMw=; b=dnof8MYpMXsZloWq4uuoXiyLZi
	/Q7kwr2UIS9yim0Upokq5m5MOyo2xNHaMtwJSW5kS0FIek2P6EH3pRX/+K0UNCZrCDj88YLZWFu83
	MoE9tSE2/RU/MTYMkA52HvDqXYWAZ7z61RJ4AkOfsGM74KBhlbuXFUm+hZTi2lW2b3fwgIMIV96C7
	0dwK+4LeR82kTDJKj7X0wzIroCsnOdUGO9R62AsNN/TXl9ttM5tv9OlzcQBoH2wwAOxVKLGgtKAea
	G9Gkkz2XQFpo8nkM4coE+mMy29FdXG72TAr7F2N2PY5VXbtCZOI117gtvCHDpzBdvaPbtcrJZfMIT
	GsPJv4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCWs-0000000CdGL-2GhG;
	Wed, 28 May 2025 08:52:54 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCUK-0000000CcoR-1yFd;
	Wed, 28 May 2025 08:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Q/Kz/3SM6qMlxK4FSVI0nwRtn+UkFkCaBDdk8+T5tYc=; b=N
	nWYVRPSt9m92/Gn7VY4ZUuEqbwwnAbRw5+pW4GB/CSIO17d6Vc552qtDu3a+gIhj
	9P+v0CQDqArbn4Kfi3dtJWthUkg2hD9IQb/fp38ECY8pAivdDz3Ojw765MK4ktP1
	PG5QLZ0pP+vc7b93D9xERUOsExTTf0UWuc/c87L+fU=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-128 (Coremail) ; Wed, 28 May 2025 16:49:53 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 28 May 2025 16:49:53 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, simic@manjaro.org,
	krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, algea.cao@rock-chips.com,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v2] arm64: dts: rockchip: Adjust the HDMI DDC IO
 driver strength for rk3588
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <3704844.aeNJFYEL58@workhorse>
References: <20250522020537.1884771-1-andyshrk@163.com>
 <3704844.aeNJFYEL58@workhorse>
X-NTES-SC: AL_Qu2fCviZvUki5SKQZukfmkcVgOw9UcO5v/Qk3oZXOJF8jA7p4wscQHpOAWbq0cyIMRyRnBWaVRtWyPRTR6hlT6sb/yONQoqn4Ld8lYww2OFEbg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <9ffd480.852d.19716157087.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gCgvCgD3X+UxzjZopHQPAA--.35457W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAJbXmg2ya2jJQABsq
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015016_845630_9D3E2AF4 
X-CRM114-Status: GOOD (  14.15  )
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

CkhlbGxvIE5pY29sYXMsCgpBdCAyMDI1LTA1LTI3IDE5OjUzOjU2LCAiTmljb2xhcyBGcmF0dGFy
b2xpIiA8bmljb2xhcy5mcmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+T24gVGh1cnNk
YXksIDIyIE1heSAyMDI1IDA0OjA1OjI0IENlbnRyYWwgRXVyb3BlYW4gU3VtbWVyIFRpbWUgQW5k
eSBZYW4gd3JvdGU6Cj4+IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4K
Pj4gCj4+IEZvciB0aGUgUkszNTg4IEhETUkgY29udHJvbGxlciwgdGhlIGZhbGxpbmcgZWRnZSBv
ZiBEREMgU0RBIGFuZCBTQ0wKPj4gYWxtb3N0IGNvaW5jaWRlIGFuZCBjYW5ub3QgYmUgYWRqdXN0
ZWQgYnkgSERNSSByZWdpc3RyZXIsIHJlc3VsdGluZwo+PiBpbiBwb29yIGNvbXBhdGliaWxpdHkg
b2YgRERDIGNvbW11bmljYXRpb24uCj4+IAo+PiBBbiBpbXByb3ZlbWVudCBvZiB0aGUgY29tcGF0
aWJpbGl0eSBvZiBEREMgY2FuIGJlIGRvbmUgYnkgaW5jcmVhc2luZwo+PiB0aGUgZHJpdmVyIHN0
cmVuZ3RoIG9mIFNDTCBhbmQgZGVjcmVhc2luZyB0aGUgZHJpdmVyIHN0cmVuZ3RoIG9mIFNEQQo+
PiB0byBpbmNyZWFzZSB0aGUgc2xvcGUgb2YgdGhlIGZhbGxpbmcgZWRnZS4KPj4gCj4+IEl0IHNo
b3VsZCBiZSBub3RlZCB0aGF0IHRoZSBtYXhpbXVtIGRyaXZpbmcgc3RyZW5ndGggb2YgaGRtaW0w
X3R4MV9zY2wKPj4gaXMgb25seSAzLCB3aGljaCBpcyBkaWZmZXJlbnQgZnJvbSB0aGF0IG9mIHRo
ZSBvdGhlciBJT3MuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5Acm9j
ay1jaGlwcy5jb20+Cj4+IAo+PiAtLS0KPj4gCj4+IENoYW5nZXMgaW4gdjI6Cj4+IC0gQ29ycmVj
dCB0aGUgbWF4IGRyaXZlIGxldmVsIG9mIGhkbWltMF90eDFfc2NsLgo+PiAKPj4gIC4uLi9kdHMv
cm9ja2NoaXAvcmszNTg4LWJhc2UtcGluY3RybC5kdHNpICAgICB8IDIwICsrKysrLS0tLS0tCj4+
ICAuLi4vZHRzL3JvY2tjaGlwL3JrMzU4OC1leHRyYS1waW5jdHJsLmR0c2kgICAgfCAgNSArLS0K
Pj4gIC4uLi9ib290L2R0cy9yb2NrY2hpcC9yb2NrY2hpcC1waW5jb25mLmR0c2kgICB8IDM1ICsr
KysrKysrKysrKysrKysrKysKPj4gIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCj4+IAo+Cj5UZXN0ZWQtYnk6IE5pY29sYXMgRnJhdHRhcm9saSA8bmlj
b2xhcy5mcmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+Cj4KPlF1aWNrbHkgdGVzdGVkIHRoaXMgb24g
Ym90aCBIRE1JIHBvcnRzIG9mIGEgUk9DSyA1VCB3aXRoIGFuIEhETUkgY2FwdHVyZQo+Y2FyZCBv
biB0aGUgb3RoZXIgZW5kLiBXaGlsZSBJIGRpZG4ndCBvcmlnaW5hbGx5IGhhdmUgYW55IGlzc3Vl
cyB0byBiZWdpbgo+d2l0aCwgdGhpcyBwYXRjaCBkb2VzIG5vdCBpbnRyb2R1Y2UgYW55IG5ldyBv
bmVzLCBzbyBzZWVtcyBnb29kIHRvIG1lLgoKClRoYW5rcyBmb3IgeW91dCB0ZXN0LgoKSSBzZW50
IHRoaXMgcGF0Y2ggYmVjYXVzZSBzb21lb25lIGZyb20gdGhlIGNvbW11bml0eSByZXBvcnRlZCB0
byBtZSB0aGF0IGhpcyBib2FyZApjb3VsZG4ndCBzdWNjZXNzZnVsbHkgZXN0YWJsaXNoIGRkYyBj
b21tdW5pY2F0aW9uIHdoZW4gcnVubmluZyB0aGUgbWFpbmxpbmUga2VybmVsLgpBZnRlciBjb25k
dWN0aW5nIGV4dGVuc2l2ZSBjb21wYXJpc29ucywgaXQgd2FzIGRpc2NvdmVyZWQgdGhhdCB0aGVy
ZSB3ZXJlIGRpZmZlcmVuY2VzCmluIHRoZSBJTyBkcml2ZSBzdHJlbmd0aCBjb25maWd1cmF0aW9u
IGJldHdlZW4gbWFpbmxpbmUgY29kZSBhbmQgdGhlIGRvd25zdHJlYW0gY29kZS4gClRoZW4sIEkg
cmVjYWxsZWQgdGhhdCBkdXJpbmcgdGhlIGNoaXAgYnJpbmd1cCBwcm9jZXNzIGFuZCB3aGVuIGNv
bmR1Y3RpbmcgdGhlIFNJIHRlc3QsIAp3ZSBoYWQgZW5jb3VudGVyZWQgdGhpcyBwcm9ibGVtIGJl
Zm9yZSwgYW5kIHdlIGRpZCB0aGUgZml4IGJ5IGFkanVzdGluZyBEREMgSU8gZHJpdmUgc3RyZW5n
dGguCj4K

