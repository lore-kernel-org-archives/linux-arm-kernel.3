Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441D4C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yeLUMa0JUHL9Jcd5CdiMIm+cVmNMIj7mCsFvxnnDmg=; b=jYLiN7B+y7ySyQX6qIzeJVtmJj
	d46ryH7jtG6ipWjYJMrsqdBchgAUOoIxnJ7p/aSMwhlb+1UTE2Ktu752/38OexhsNy0QzklZF/ryV
	5NQkSR7AmBwKR4SjM9/BaBGimKgbOkZ+3uZ8a+TA9gyPVprm7NQetC/M9wiwLKC1L/WxjE8+0XnhM
	wWFWKYAra+/g6nQD28ok103PLqjfhvL6tj6C7AvDPPDjWh7+LuEK9MgAU6nnMNmhlk/EFG/NYn3PC
	HF38+cl7JidFwKCwTKP8Lng2S/vB0j+YzCBHNPzqace7x1Z8txtB07y3L4lgV7+vNTRQ6eTwA+DGe
	EUKg7W2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLz4-0000000ChOl-1810;
	Fri, 07 Mar 2025 00:54:38 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLuF-0000000CgPX-0xq9;
	Fri, 07 Mar 2025 00:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=CnrtcoGRW+pS+hN72KT+FKiUeqkTv48XxIJR0USPjrs=; b=P
	zkSHdZc1KZ0lkqSkqPyHrEiB1fLYoXtzu8ixrDZ7UrSe0LIw153YMzyj/MOT7WAb
	Pd2lJZPvsRf5vO18S6yEZTYCMwFxVwqBXq++0HiskWRpzm2ba14pSbtlu4Tzuf8K
	TU78IH6ozWGfy2Rc9cgIp8uJ1SIGHL+KEliyZCT0sk=
Received: from andyshrk$163.com ( [103.29.142.67] ) by
 ajax-webmail-wmsvr-40-114 (Coremail) ; Fri, 7 Mar 2025 08:48:55 +0800 (CST)
X-Originating-IP: [103.29.142.67]
Date: Fri, 7 Mar 2025 08:48:55 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
	sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
	hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	"Andy Yan" <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
	robh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re:Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <326B91E9-FB91-43C3-B98B-3EF079F313C6@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
 <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
 <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
 <252BB2E2-4BC5-4402-953D-F7B30EA5DE14@gmail.com>
 <326B91E9-FB91-43C3-B98B-3EF079F313C6@gmail.com>
X-NTES-SC: AL_Qu2fA/+bt00o4yefZukfmkcVgOw9UcO5v/Qk3oZXOJF8jDvp6zIxdG1jMkbm3ueENxqyjTi3chhO99R2eY5ddJAgLOFk3fWQb48AINGO0GciIQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <545cc438.7e3.1956e13a3e2.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cigvCgD3Xw13QspnURl4AA--.4412W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBsJXmfKOquklAABsR
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_164939_622075_72958AD8 
X-CRM114-Status: UNSURE (   6.61  )
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

CkhpIFBpb3RyLArlnKggMjAyNS0wMy0wNiAyMjoyODowOO+8jCJQaW90ciBPbmlzemN6dWsiIDxw
aW90ci5vbmlzemN6dWtAZ21haWwuY29tPiDlhpnpgZPvvJoKPgo+Cj4+IFdpYWRvbW/Fm8SHIG5h
cGlzYW5hIHByemV6IFBpb3RyIE9uaXN6Y3p1ayA8cGlvdHIub25pc3pjenVrQGdtYWlsLmNvbT4g
dyBkbml1IDYgbWFyIDIwMjUsIG8gZ29kei4gMTU6MDg6Cj4+IAo+PiAKPj4gCj4+PiBXaWFkb21v
xZvEhyBuYXBpc2FuYSBwcnpleiBBbmR5IFlhbiA8YW5keXNocmtAMTYzLmNvbT4gdyBkbml1IDYg
bWFyIDIwMjUsIG8gZ29kei4gMTM6MTU6Cj4+PiAKPj4+IEhpIFBpb3RyLAo+Pj4gCj4+PiAKPj4+
IAo+Pj4gVGhlbiB3aGVuIHlvdSBEUCBjYWJsZSBwbHVnaW4sIHlvdSBjYW4gcnVuIGNvbW1hbmQg
YXMgYmVsbG93IHRvIHNlZSBpZiB0aGUgZHJpdmVyIGRldGVjdHMgdGhlIEhQRDoKPj4+IAo+Pj4g
IyBjYXQgL3N5cy9jbGFzcy9kcm0vY2FyZDAtRFAtMS9zdGF0dXMgCj4+PiBjb25uZWN0ZWQKPj4+
ICMgCj4+PiAKPj4gCj4+IAo+PiBBbmR5LAo+PiBUaHghCj4+IAo+PiBXaXRoIGFib3ZlIGNoYW5n
ZXMgaeKAmW0gZ2V0dGluZyDigJ5jb25uZWN0ZWTigJ0uCj4+IEFsc28gaXQgbG9va3MgY3J0YyBn
ZXRzIHJlYXNvbmFibGUgbW9kZTogaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vd2FycG1lL2Q2MjIw
ZTNjYzUwMjA4NmE0Yzk1ZjA1YmQ5ZjljZjBjCj4+IAo+PiBTdGlsbCBibGFjayBzY3JlZW4gaG93
ZXZlcuKApgo+PiAgIAo+Cj5zb21lIGFkZGl0aW9uYWwgZGF0YSBwb2ludDogL3N5cy9rZXJuZWwv
ZGVidWcvZHJpLzEvdm9wMi9zdW1tYXJ5IAo+Cj4KPndvcmtpbmcgaGRtaToKPgo+VmlkZW8gUG9y
dDE6IEFDVElWRQo+ICAgIENvbm5lY3RvcjogSERNSS1BLTEKPiAgICAgICAgYnVzX2Zvcm1hdFsw
XTogVW5rbm93bgo+ICAgICAgICBvdXRwdXRfbW9kZVtmXSBjb2xvcl9zcGFjZVswXQo+ICAgIERp
c3BsYXkgbW9kZTogMTkyMHgxMDgwcDYwCj4gICAgICAgIGNsa1sxNDg1MDBdIHJlYWxfY2xrWzE0
ODUwMF0gdHlwZVs0OF0gZmxhZ1s1XQo+ICAgICAgICBIOiAxOTIwIDIwMDggMjA1MiAyMjAwCj4g
ICAgICAgIFY6IDEwODAgMTA4NCAxMDg5IDExMjUKPiAgICBDbHVzdGVyMC13aW4wOiBBQ1RJVkUK
PiAgICAgICAgd2luX2lkOiAwCj4gICAgICAgIGZvcm1hdDogWFIyNCBsaXR0bGUtZW5kaWFuICgw
eDM0MzI1MjU4KSBnbGJfYWxwaGFbMHhmZl0KPiAgICAgICAgcm90YXRlOiB4bWlycm9yOiAwIHlt
aXJyb3I6IDAgcm90YXRlXzkwOiAwIHJvdGF0ZV8yNzA6IDAKPiAgICAgICAgenBvczogMAo+ICAg
ICAgICBzcmM6IHBvc1swLCAwXSByZWN0WzE5MjAgeCAxMDgwXQo+ICAgICAgICBkc3Q6IHBvc1sw
LCAwXSByZWN0WzE5MjAgeCAxMDgwXQo+ICAgICAgICBidWZbMF06IGFkZHI6IDB4MDAwMDAwMDAw
MTdlMTAwMCBwaXRjaDogNzY4MCBvZmZzZXQ6IDAKPlZpZGVvIFBvcnQyOiBESVNBQkxFRAo+Cj4K
Pgo+Cj5ub24td29ya2luZyBEUDoKPgo+VmlkZW8gUG9ydDE6IERJU0FCTEVECj5WaWRlbyBQb3J0
MjogQUNUSVZFCj4gICAgQ29ubmVjdG9yOiBEUC0xCj4gICAgICAgIGJ1c19mb3JtYXRbMTAwYV06
IFJHQjg4OF8xWDI0Cj4gICAgICAgIG91dHB1dF9tb2RlW2ZdIGNvbG9yX3NwYWNlWzBdCj4gICAg
RGlzcGxheSBtb2RlOiAxOTIweDEwODBwNjAKPiAgICAgICAgY2xrWzE0ODUwMF0gcmVhbF9jbGtb
MTQ4NTAwXSB0eXBlWzQ4XSBmbGFnWzVdCj4gICAgICAgIEg6IDE5MjAgMjAwOCAyMDUyIDIyMDAK
PiAgICAgICAgVjogMTA4MCAxMDg0IDEwODkgMTEyNQo+ICAgIENsdXN0ZXIxLXdpbjA6IEFDVElW
RQo+ICAgICAgICB3aW5faWQ6IDEKPiAgICAgICAgZm9ybWF0OiBYUjI0IGxpdHRsZS1lbmRpYW4g
KDB4MzQzMjUyNTgpIGdsYl9hbHBoYVsweGZmXQo+ICAgICAgICByb3RhdGU6IHhtaXJyb3I6IDAg
eW1pcnJvcjogMCByb3RhdGVfOTA6IDAgcm90YXRlXzI3MDogMAo+ICAgICAgICB6cG9zOiAwCj4g
ICAgICAgIHNyYzogcG9zWzAsIDBdIHJlY3RbMTkyMCB4IDEwODBdCj4gICAgICAgIGRzdDogcG9z
WzAsIDBdIHJlY3RbMTkyMCB4IDEwODBdCj4gICAgICAgIGJ1ZlswXTogYWRkcjogMHgwMDAwMDAw
MDAwN2VkMDAwIHBpdGNoOiA3NjgwIG9mZnNldDogMAoKPgoKQWxsIGR1bXAgaW5mb3JtYXRpb24g
Y3VycmVudGx5IGFwcGVhcnMgdG8gYmUgY29ycmVjdCwgc28gSSdtIHRlbXBvcmFyaWx5IHVuc3Vy
ZSB3aHkKdGhlcmUgaXMgbm8gZGlzcGxheSBvbiB0aGUgbW9uaXRvci4KTWF5YmUgdHJ5IHNvbWUg
cGx1ZyBhbmQgdW5wbHVnIGZvciB0aGUgRFAgY2FibGUsIG9yIHRyeSBhbm90aGVyIGNhYmxlIG9y
IG1vbml0b3I/CgpJdCBzZWVtcyB0aGF0IHRoaXMgYm9hcmQgdXNlcyBhIERQIHRvIEhETUkgY29u
dmVydGVyPyBEb2VzIHRoaXMgdHJhbnNtaXR0ZXIgbmVlZCBhIGRyaXZlcj8KCkkgd29uJ3QgYmUg
YXQgbXkgY29tcHV0ZXIgb3ZlciB0aGUgbmV4dCB0d28gb3IgdGhyZWUgZGF5cywgc28gYW55IGZ1
cnRoZXIgcmVwbGllcyB0byB5b3VyIGVtYWlsCm1pZ2h0IGhhdmUgdG8gd2FpdCB1bnRpbCBuZXh0
IHdlZWsuCgoK

