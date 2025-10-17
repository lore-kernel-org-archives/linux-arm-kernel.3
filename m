Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B398CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTcxHlEj5c7iI/0V80uuFE3x8ns1iNcbIRuDMWqLeuA=; b=AMuFtL7sdKiK+GTXx6rq0QOaou
	+QfmOa3SLfJ2CXPwo897/erYhE/AYWkcTv67V4+pjNRKcifFKbWtkQpgAbnEKBHxt4DSbKklfDm7i
	UkYtjg7zM0QiMrziJCKE5u9lOaANsr+y3c2UjLTeBEbtLpdMxVopIV7XfMV7qXC5YBl9UWrqGhim/
	a60laYyR9zgfIUfuC7DlJDHLnAjLU9dskLLm2m8FaAwUoK+TEwYhqVEIF2AfujWXpE+eU+biW1dFe
	cmO/itH7k0K69cyvn15sVqJN6vMbYs+GTMXG1DJ0jqzdrhpQ2PixZgPl5TTKRws8jyZA6c+r5nBR5
	g2zcE5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9guK-00000007KvX-1Lsi;
	Fri, 17 Oct 2025 09:37:56 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9guG-00000007Kta-3PQ7;
	Fri, 17 Oct 2025 09:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=8ilA4sxFLlSdabkUDG5fdxMV+kXtCGg+zOCuqv9nCa8=; b=W
	Kl+k/D5Nrq480aVg9oxFP9BbuRSYBSHnBHEOsx3foPzxC8oVBXeyXIum96VLOoaF
	z4/2amwjRKWj6VeCykMerC7EmVFvcDmnLfEQ9cMcxFLR3rwRJxLQE0bpkKceKNEE
	OYnYXZwItLEB5NdN1ndlqP8efE5LHc9jw2z8paQhAg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Fri, 17 Oct 2025 17:36:54 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 17 Oct 2025 17:36:54 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Maud Spierings" <maud_spierings@murena.io>
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
	andy.yan@rock-chips.com, devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
	heiko@sntech.de, jernej.skrabec@gmail.com, jonas@kwiboo.se,
	knaerzche@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re:Re: [PATCH v8 2/2] MAINTAINERS: Add entry for Innosilicon hdmi
 bridge library
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <392dc6d7-a0e5-4f9e-85c4-8d811777a697@murena.io>
References: <20251016083843.76675-3-andyshrk@163.com>
 <040d8fe8-da2f-4aa5-a2c3-1aec0cf2e8f0@murena.io>
 <671fc19.84e3.199f162a66c.Coremail.andyshrk@163.com>
 <392dc6d7-a0e5-4f9e-85c4-8d811777a697@murena.io>
X-NTES-SC: AL_Qu2dAvqSvEAq4iORbOkfmUgWjuw/WsG1v/Ul1YBSP556jC/r8zkjQUF9DEnN7/uOLACpsBq9WjdwxuR2UoVeWLsLrfo3WJ3P97zyaC3eKzuLkg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7d14fa88.9099.199f187848a.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgDXP0Q2DvJoKNINAA--.5781W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEAbpXmjyCm9rcgACsF
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_023753_187416_2A5EBB06 
X-CRM114-Status: GOOD (  11.63  )
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

SGkgTWF1ZO+8jAoK5ZyoIDIwMjUtMTAtMTcgMTc6MTk6MjHvvIwiTWF1ZCBTcGllcmluZ3MiIDxt
YXVkX3NwaWVyaW5nc0BtdXJlbmEuaW8+IOWGmemBk++8mgo+SGkgQW5keSwKPgo+T24gMTAvMTcv
MjUgMTA6NTYsIEFuZHkgWWFuIHdyb3RlOgo+Pgo+PiBIZWxsbyBNYXVk77yMCj4+Cj4+IEF0IDIw
MjUtMTAtMTcgMTU6NTg6MjIsICJNYXVkIFNwaWVyaW5ncyIgPG1hdWRfc3BpZXJpbmdzQG11cmVu
YS5pbz4gd3JvdGU6Cj4+PiBIaSBBbmR5LAo+Pj4KPj4+PiBGcm9tOiBBbmR5IFlhbiA8YW5keS55
YW5Acm9jay1jaGlwcy5jb20+Cj4+Pj4KPj4+PiBBZGQgZW50cnkgZm9yIElubm9zaWxpY29uIGhk
bWkgYnJpZGdlIGxpYnJhcnkKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5
LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4+PiAtLS0KPj4+Pgo+Pj4+IChubyBjaGFuZ2VzIHNpbmNl
IHYxKQo+Pj4+Cj4+Pj4gICBNQUlOVEFJTkVSUyB8IDggKysrKysrKysKPj4+PiAgIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVS
UyBiL01BSU5UQUlORVJTCj4+Pj4gaW5kZXggZjlmOTg1YzdkNzQ3OS4uMGFkY2ZiMWMyNjRhMSAx
MDA2NDQKPj4+PiAtLS0gYS9NQUlOVEFJTkVSUwo+Pj4+ICsrKyBiL01BSU5UQUlORVJTCj4+Pj4g
QEAgLTEyMjk5LDYgKzEyMjk5LDE0IEBAIE06CVNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxh
bmQub3JnPgo+Pj4+ICAgUzoJTWFpbnRhaW5lZAo+Pj4+ICAgRjoJZHJpdmVycy9wb3dlci9zdXBw
bHkvaXA1eHh4X3Bvd2VyLmMKPj4+PiAgIAo+Pj4+ICtJTk5PU0lMSUNPTiBIRE1JIEJSSURHRSBE
UklWRVIKPj4+PiArTToJQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+Pj4+ICtM
OglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+Pj4gK1M6CU1haW50YWluZWQKPj4+
PiArVDoJZ2l0IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbWlzYy9rZXJuZWwu
Z2l0Cj4+Pj4gK0Y6CWRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW5uby1oZG1pLmMKPj4+PiArRjoJ
aW5jbHVkZS9kcm0vYnJpZGdlL2lubm9faGRtaS5oCj4+Pj4gKwo+Pj4+ICAgSU5PVElGWQo+Pj4+
ICAgTToJSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPj4+PiAgIFI6CUFtaXIgR29sZHN0ZWluIDxh
bWlyNzNpbEBnbWFpbC5jb20+Cj4+Pj4gLS0gCj4+Pj4gMi40My4wCj4+PiBJIGJlbGlldmUgdGhp
cyBwYXRjaCBzaG91bGQgYmUgc3F1YXNoZWQgaW50byB0aGUgcGF0Y2ggdGhhdCBhY3R1YWxseQo+
Pj4gY3JlYXRlcyB0aGUgZmlsZXMgbGlzdGVkIGluIHRoZSBNQUlOVEFJTkVSUyBlbnRyeSwgbGlr
ZSBJIGRvIGhlcmUgWzFdLgo+Pj4gQ2hlY2twYXRjaCBzaG91bGQgYmUgY29tcGxhaW5pbmcgYWJv
dXQgcGF0Y2ggWzEvMl0gaWYgSSdtIG5vdCBtaXN0YWtlbiwKPj4+IHdoZW4geW91IHJ1biBgYjQg
cHJlcCAtLWNoZWNrYC4KPj4gV2UgdGFsa2VkIGFib3V0IHNvbWV0aGluZyBzaW1pbGFyIGhlcmVb
Ml3vvJoKPj4gTWF4aW1lIGJlbGlldmVzIHRoZXkgc2hvdWxkIGJlIHNlcGFyYXRlIHBhdGNoZXMs
Cj4+IEFuZCBJJ3ZlIHNlZW4gbWFueSBtZXJnZWQgY29tbWl0cyBpbiB0aGUga2VybmVsIGFyZSBh
bHNvIGhhbmRsZSBNQUlOVEFJTkVSUyBlbnRyeSBhcyBzZXBhcmF0ZSBwYXRjaGVzCj4+Cj4+Cj4+
IFsyXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJvY2tjaGlwLzN5Z3FuajRpZGV5N3U0
bTdsdGx2N3BuZmhra3ZjZXBtcGZkaWpkc3pjdGFlb3BxM2t5QHF0ZWczM2NvbWpsMy8KPgo+SXQg
c2VlbXMgdGhlcmUgYXJlIGluZGVlZCBvcGluaW9ucyBhYm91dCB0aGlzIFszXSwgZ3Vlc3Mgd2hh
dGV2ZXIgdGhlIAo+YWN0dWFsIG1haW50YWluZXIgd2FudHMgaXMgd2hhdCB3aWxsIGhhcHBlbiwg
c29ycnkgdG8gZGlzdHVyYi4KCkl0J3Mgb2theSwgSSBkb24ndCBoYXZlIGEgc3Ryb25nIHByZWZl
cmVuY2UgZm9yIGVpdGhlciBhcHByb2FjaC4gSXQgdWx0aW1hdGVseSBkZXBlbmRzIG9uIHRoZSBt
YWludGFpbmVyJ3MgZGVjaXNpb24KCj4KPgo+V291bGQgYmUgbmljZSB0byBnZXQgc29tZSBjZW50
cmFsIGd1aWRlbGluZSBhYm91dCBob3cgaXQgc2hvdWxkIGJlLgo+Cj4KPlszXSAKPmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC81MWI3MjAwMy1lOWE1LTRmMzQtYWQwOC0yNDlmYzI0YjMwNDFA
a2VybmVsLm9yZy8KPgo+Pgo+Pj4gTGluazoKPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI1MTAwOS1tYXgyNTAxNC12NC0xLTZhZGIyYTBhYTM1ZkBnb2NvbnRyb2xsLmNvbS8KPj4+
IFsxXQo+Pj4KPj4+IEtpbmQgcmVnYXJkcywKPj4+IE1hdWQK

