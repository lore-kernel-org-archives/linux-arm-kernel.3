Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56E3C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzL1hNUP4we1Y+VXPMp5QAgKUT95/IJsjvsaRpU6fWQ=; b=aXJkDu4Wgc0RjMHgSDUcKEXZ6j
	0hOYpQG3nCCXA+bqiqL3lghmdi1ZqWY0z9FZbsx97U7RM1VWjiRlSXxnOgGXhkp4uZAyYPCqsmSUX
	yfo6ILioSS15JxkAPEJVC1f11XQTwTrKh/SobLPYFUZxbdtbbBxqkPpnnQc4gQpeNNhLd8PIkydff
	KSu2+1UGsmfD9c4aXDA8kVbi+/DWIu0n/cX3KF/fFqKl2yLsbHnjW08tak+w4rkcGuCbAt6FtSmnt
	M7CJm/O8c2ZQDHCPIiFw+7PyYj5KHdS53lyzJimqKN8Yja9md0WvrveKG55xWZotVAAM/lIHI+lxc
	wJ2DxdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFY0-0000000CAu8-3T3Q;
	Thu, 20 Mar 2025 13:02:56 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFRh-0000000C9qF-0FuX;
	Thu, 20 Mar 2025 12:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=PV8J72Kd8Fa075AwZSVmGmHrrt420GzFAmi5jXfZWH8=; b=h
	eI/BSbkrIuvldqB/lJQ4JMIvoWt78fgs408Zt+CycsmWKKbQs72ZSUGJ7Jrdg9L5
	WDSEMbMwJyILyF9yVZrTgdlgY2L8Ze3ByK9i1lXduCuKB3MRu9qN4sloc5rFWZuM
	gc3Tp7gmfwUnITcmJDHw2oCd+7gD7x+AzvzoImVOFA=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Thu, 20 Mar 2025 20:56:04 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 20 Mar 2025 20:56:04 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: dsimic@manjaro.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, krzk+dt@kernel.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re:Re: [PATCH] arm64: dts: rockchip: aliase sdhci as mmc0 for
 rk3566 box demo
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <19b62068.1082.193ed25f901.Coremail.andyshrk@163.com>
References: <20241221104920.4193034-1-andyshrk@163.com>
 <24438615.ouqheUzb2q@diego>
 <19b62068.1082.193ed25f901.Coremail.andyshrk@163.com>
X-NTES-SC: AL_Qu2fAPicukst4iSeYukfmkcVgOw9UcO5v/Qk3oZXOJF8jDjp4xEhV2B6MH/20uOCARCyuyGufh9t7txYW6d3eJ0gDSag/xFgLgGfyqB2/Sa6kw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2ae3fb1a.ad30.195b3a0087e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bygvCgD3vzFkENxnDwKCAA--.42918W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAcWXmfcCF-htQABsm
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_055625_490267_ABCD5A0D 
X-CRM114-Status: GOOD (  14.56  )
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

SGkgSGVpa2/vvIwKCkF0IDIwMjQtMTItMjIgMTQ6NTU6MDksICJBbmR5IFlhbiIgPGFuZHlzaHJr
QDE2My5jb20+IHdyb3RlOgo+Cj5IaSBIZWlrb++8jAo+QXQgMjAyNC0xMi0yMSAyMDo1NTowMiwg
IkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPj5IaSBBbmR5LAo+Pgo+
PkFtIFNhbXN0YWcsIDIxLiBEZXplbWJlciAyMDI0LCAxMTo0OTowNyBDRVQgc2NocmllYiBBbmR5
IFlhbjoKPj4+IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4+IAo+
Pj4gRm9sbG93IG1vc3Qgb3RoZXJzIHJrMzU2eCBiYXNlZCBib2FyZHMsIGFuZCB1LWJvb3Qgb25s
eSB1c2UgbW1jMC8xCj4+PiBhcyBtbWMgYm9vdCB0YXJnZXRzLCBzbyBhbGlhc2Ugc2RoY2kgYXMg
bW1jMC4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hp
cHMuY29tPgo+Pj4gLS0tCj4+PiAKPj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3Jr
MzU2Ni1ib3gtZGVtby5kdHMgfCA2ICsrKy0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU2Ni1ib3gtZGVtby5kdHMgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JvY2tjaGlwL3JrMzU2Ni1ib3gtZGVtby5kdHMKPj4+IGluZGV4IDQxYjRjZDVhNDIyMC4u
N2QwZWVkZjFiZDBkIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hp
cC9yazM1NjYtYm94LWRlbW8uZHRzCj4+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tj
aGlwL3JrMzU2Ni1ib3gtZGVtby5kdHMKPj4+IEBAIC0xOSw5ICsxOSw5IEBAIC8gewo+Pj4gIAo+
Pj4gIAlhbGlhc2VzIHsKPj4+ICAJCWV0aGVybmV0MCA9ICZnbWFjMTsKPj4+IC0JCW1tYzAgPSAm
c2RtbWMwOwo+Pj4gLQkJbW1jMSA9ICZzZG1tYzE7Cj4+PiAtCQltbWMyID0gJnNkaGNpOwo+Pj4g
KwkJbW1jMCA9ICZzZGhjaTsKPj4+ICsJCW1tYzEgPSAmc2RtbWMwOwo+Pj4gKwkJbW1jMiA9ICZz
ZG1tYzE7Cj4+Cj4+c29ycnksIGJ1dCB0aGF0IHdvbid0IGJlIHBvc3NpYmxlIDotKCAuCj4+Cj4+
VGhlIG9yaWdpbmFsIGFsaWFzZXMgZm9yIHRoZSBtbWMgb3JkZXIgd2VyZSBhZGRlZCBvdmVyIDIg
eWVhcnMgYWdvCj4+KG5vdmVtYmVyIDIwMjIpIGFuZCBiZWNhbWUgcGFydCBvZiB0aGUgQUJJIHRo
ZW4uCj4KPlllcywgIHRoZSBwYXRjaCBmb3IgdGhpcyBib2FyZCB3YXMgc3VibWl0dGVkIGJ5IG1l
Lgo+VGhpcyBpcyBhIHR2IGJveCAgZXZhbHVhdGlvbiBkZW1vIGJvYXJkIHRoYXQgd2UgdXNlIGlu
dGVybmFsbHnvvIxhbmQgaXQgaXMgbm90IHNvbGQgdG8gdGhlIHB1YmxpYy4KPkkgc3VibWl0dGVk
IGl0IHRvIHRoZSBtYWlubGluZSBiZWNhdXNlIGl0IGlzIHNtYWxsLCBjb21wYWN0IGFuZCBzdHJl
YW1saW5lZCwgaXQgZWFzeSBmb3IgbWUKPnRvIHVzZSBpdCAgdGVzdCB0aGUgbWFpbmxpbmUgdm9w
MiBkcml2ZXIuIAo+SSB0aGluayBpIGFtIGN1cnJlbnRseSB0aGUgb25seSB1c2VyIHdobyB3aWxs
IHVzZSB0aGlzIGJvYXJkIHJ1biB0aGUgbWFpbmxpbmUga2VybmVsLgo+SSdtIG5vdCBzdXJlIGlm
IHdlIGNhbiBsZXQgaXQgZ28uCgoKU28gZmFyLCBubyBvbmUgaGFzIGNvbWUgZm9yd2FyZCB0byBj
bGFpbSB0aGF0IHRoZXkgYXJlIHVzaW5nIHRoaXMgYm9hcmQuCkFjdHVhbGx5LCBhcyBJIG1lbnRp
b25lZCBiZWZvcmUsIGN1cnJlbnRseSwgaXQgaXMgb25seSBtZSB3aG8gaXMgdXNpbmcgdGhpcwpi
b2FyZCB0byBkbyBzb21lIERSTS1yZWxhdGVkIHRlc3RzLiBDb3VsZCB5b3UgY29uc2lkZXIgbWVy
Z2luZyBpdD8gCklmIGxhdGVyIG9uIHNvbWVvbmUgcmVhbGx5IGNvbWVzIGZvcndhcmQgYW5kIGNs
YWltcyB0aGF0IHRoaXMgbW9kaWZpY2F0aW9uCmhhcyBhZmZlY3RlZCBpdCwgd2UgY2FuIHN0aWxs
IHJldmVydCB0aGlzIHBhdGNoLgoKPgo+Cj4+Cj4+SW1hZ2luZSBzb21lb25lIHVzaW5nIHRoYXQg
Ym9hcmQgd2l0aCBhIHJvb3Rmcz0vZGV2L21tY2JsazJwMSBwYXJ0Cj4+aW4gdGhlIGNvbW1hbmRs
aW5lIHRvIG1vdW50IHRoZSBvbGQgc2RoY2ktcGFydDEgYXMgcm9vdGZzLCBidXQgbm93Cj4+eW91
IHJlb3JkZXIgdGhlIGNvbnRyb2xsZXJzLCBzbyBzbyB0aGF0IGNvbW1hbmRsaW5lIHdvdWxkIHRy
eSB0byBhY2Nlc3MKPj5zZG1tYzEsIHNvIHRoZWlyIHN5c3RlbSB3b24ndCBib290IGFueW1vcmUg
YWZ0ZXIganVzdCBhIHNpbXBsZSBrZXJuZWwKPj51cGRhdGUuCj4+Cj4+QnJlYWtpbmcgcGVvcGxl
J3Mgc2V0dXAgaXMgb25lIG9mIHRob3NlIGJpZyBuby1nby1zIGluIHRoZSBrZXJuZWwsIHNvCj4+
c2FkbHkgeW91J2xsIG5lZWQgdG8gbGl2ZSB3aXRoIHRoZSBleGlzdGluZyBvcmRlci4KPj4KPj4K
Pj5IZWlrbwo+Pgo+Pgo=

