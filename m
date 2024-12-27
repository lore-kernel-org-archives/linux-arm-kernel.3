Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F850E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 10:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHevsAM8EbFeow1k8+MH3QcELQyxnNUcwcmCQEVBRXo=; b=N8MsFbzdN2Qf6h333sUPiMLSil
	2cvMvibOW6gZZV2466bVR3I2SvYgu1BelSSBO9TcMFHFVssPZYDrOBFJiQqECepvOIBIGOLhksV/1
	ug02NZa4gciGtnCEvP6N6I2cquXzo/rM+G+NXO78aak0sIonsyPNdHGxiQDJTdjDczSXY+IcaONBM
	dzyDud5OUE9YYgitNyLBTJygC9SBdVz/soeoz2zVzIuOP8zyKlL/CB3oZbzpt/dy6a2/xS4i8bnYc
	R1SX9/Nysy0j6GIgdRkqK6GulQdrRGTf2/zHkcMshIca52wRxeDuB9w2xNw7HY2BSnPajE7l7UA4v
	1TWnCg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR7t7-000000000XS-2aoq;
	Fri, 27 Dec 2024 10:48:13 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR7ru-000000000C2-3yuP;
	Fri, 27 Dec 2024 10:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=YnthY4zZdSbrOKLUnSFJOycJreOsuayfzdspDnc2WqI=; b=S
	BF4//NBwO4oYyIcRbXZSVRPixCAyvfmBwfUOaZswjJwD7NxyhzpY7bndDmchh06i
	4ca0RAcu3+wApiMbqeKsORhhndBO1CAc3mFMysbPUE9uFMjP9BVsPL0bgBoMSsm0
	duLZBLKEfYgF+7XfMljlk3Ne78S7O+n5UYyfJnsi1s=
Received: from andyshrk$163.com ( [103.29.142.67] ) by
 ajax-webmail-wmsvr-40-130 (Coremail) ; Fri, 27 Dec 2024 18:46:32 +0800
 (CST)
X-Originating-IP: [103.29.142.67]
Date: Fri, 27 Dec 2024 18:46:32 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: heiko@sntech.de, cristian.ciocaltea@collabora.com, 
	detlev.casanova@collabora.com, krzk+dt@kernel.org, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, sebastian.reichel@collabora.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, 
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH] dt-bindings: phy: add rk3576 hdptx phy
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <gkx4rmkwhngqsn5wotp3mdk6nn4oydrzgkfwhansd6j5ap5pek@rowfnww34rsd>
References: <20241224091919.267698-1-andyshrk@163.com>
 <gkx4rmkwhngqsn5wotp3mdk6nn4oydrzgkfwhansd6j5ap5pek@rowfnww34rsd>
X-NTES-SC: AL_Qu2YB/6SuUsi5CeQbOkfmkcVgOw9UcO5v/Qk3oZXOJF8jADoxjoPQEJSJELo/860NC+UmgmGTTRuyOZHZoV9TZwxc2Q0W5vhsxfDZXdaIOeosA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5de24299.9cde.19407b99e5c.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gigvCgD3HyGJhW5n27FKAA--.24661W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQ7CXmdufw6o2gACsz
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_024659_384107_6F6115A0 
X-CRM114-Status: GOOD (  11.35  )
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

CkhpIEtyenlzenRvZiwKCkF0IDIwMjQtMTItMjcgMTY6NTU6MjcsICJLcnp5c3p0b2YgS296bG93
c2tpIiA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPk9uIFR1ZSwgRGVjIDI0LCAyMDI0IGF0IDA1
OjE5OjEzUE0gKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+PiBGcm9tOiBBbmR5IFlhbiA8YW5keS55
YW5Acm9jay1jaGlwcy5jb20+Cj4+IAo+PiBUaGUgSERQVFggUEhZIG9uIHJrMzU3NiBpcyBjb21w
YXRpYmxlIHdpdGggaXQgb24KPj4gcmszNTg4Lgo+Cj5QbGVhc2Ugd3JhcCBjb21taXQgbWVzc2Fn
ZSBhY2NvcmRpbmcgdG8gTGludXggY29kaW5nIHN0eWxlIC8gc3VibWlzc2lvbgo+cHJvY2VzcyAo
bmVpdGhlciB0b28gZWFybHkgbm9yIG92ZXIgdGhlIGxpbWl0KToKPmh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y2LjQtcmMxL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3Vi
bWl0dGluZy1wYXRjaGVzLnJzdCNMNTk3Cj4KPj4gCj4+IEFkZCBjb21wYXRpYmxlIGZvciBpdC4K
Pgo+IkFkZCBjb21wYXRpYmxlIGZvciB0aGUgSERQVFggUEhZIG9uIHJrMzU3Niwgd2hpY2ggaXMg
ZnVsbHkgY29tcGF0aWJsZQo+d2l0aCBmb28gYmFyLiIKPgo+T25lIHNlbnRlbmNlLgoKV2lsbCBk
byBpbiBWMiwgdGhhbmtzLgoKPgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHku
eWFuQHJvY2stY2hpcHMuY29tPgo+PiAtLS0KPj4gCj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9waHkvcm9ja2NoaXAscmszNTg4LWhkcHR4LXBoeS55YW1sIHwgNyArKysrKy0tCj4+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcm9ja2NoaXAscmsz
NTg4LWhkcHR4LXBoeS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bo
eS9yb2NrY2hpcCxyazM1ODgtaGRwdHgtcGh5LnlhbWwKPj4gaW5kZXggODRmZTU5ZGJjZjQ4Li4z
NjRkYjIwNDljZTIgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waHkvcm9ja2NoaXAscmszNTg4LWhkcHR4LXBoeS55YW1sCj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcm9ja2NoaXAscmszNTg4LWhkcHR4LXBoeS55
YW1sCj4+IEBAIC0xMSw4ICsxMSwxMSBAQCBtYWludGFpbmVyczoKPj4gIAo+PiAgcHJvcGVydGll
czoKPj4gICAgY29tcGF0aWJsZToKPj4gLSAgICBlbnVtOgo+PiAtICAgICAgLSByb2NrY2hpcCxy
azM1ODgtaGRwdHgtcGh5Cj4+ICsgICAgb25lT2Y6Cj4+ICsgICAgICAtIGNvbnN0OiByb2NrY2hp
cCxyazM1ODgtaGRwdHgtcGh5Cj4+ICsgICAgICAtIGl0ZW1zOgo+Cj5XaHkgaXRlbXM/Cj4KPj4g
KyAgICAgICAgICAtIGVudW06Cj4KPldoeSBlbnVtPwo+Cj4+ICsgICAgICAgICAgICAgIC0gcm9j
a2NoaXAscmszNTc2LWhkcHR4LXBoeQo+Cj5TbyB0aGF0J3MganVzdCBlbnVtIHdpdGggcHJldmlv
dXMgZW50cnkuLi4gYnV0IHlvdSBzYWlkIGNvbXBhdGlibGUsIHlldAo+bm90aGluZyBpcyBoZXJl
LiBUZXN0IHlvdXIgcGF0Y2hlcyAtIERUUyB3aWxsIGZhaWwgb24gdGhpcy4gRHJpdmVyIGFzCj53
ZWxsIChhc3N1bWluZyB5b3UgZXhwcmVzc2VkIHByb3Blcmx5IGNvbXBhdGliaWxpdHkpLgoKSXMg
dGhpcyB0aGUgcmlnaHQgd2F5IHRvIHdyaXRlIGl0IO+8n++8mgoKcHJvcGVydGllczoKICAgY29t
cGF0aWJsZToKLSAgICBlbnVtOgotICAgICAgLSByb2NrY2hpcCxyazM1ODgtaGRwdHgtcGh5Cisg
ICAgb25lT2Y6CisgICAgICAtIGVudW06CisgICAgICAgICAgLSByb2NrY2hpcCxyazM1ODgtaGRw
dHgtcGh5CisgICAgICAtIGl0ZW1zOgorICAgICAgICAgIC0gZW51bToKKyAgICAgICAgICAgICAg
LSByb2NrY2hpcCxyazM1NzYtaGRwdHgtcGh5CisgICAgICAgICAgLSBjb25zdDogcm9ja2NoaXAs
cmszNTg4LWhkcHR4LXBoeQo+Cj5CZXN0IHJlZ2FyZHMsCj5Lcnp5c3p0b2YK

