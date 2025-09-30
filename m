Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69A8CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 10:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMx8FUm2ZLB0XniXrNo8GuTLz1co5QisWKhfgkIkgBI=; b=udCdtGzrLqipru+yIReXq9lNhG
	mlbwTunmv6FxF2QrZqWPP8eosD2/AKyYvHziJP+bS/MGN9BNL2kd1JaAfK5bP4sG7oIXBl82zwv4B
	nrcaihcxFGugsgVtFUUDFpmb5uc8ww7XK3AKZ4gSmf6q9850goj2IFu8UNeTtdTVI6o0dTzTmpXzo
	2QclVWYWDobmYcMY+Gf+7ljmbNH78gXskwodX8eAW3sNJIk9BRmFcKgbMeh+Hq7JbDjI+8F9T2h1q
	YqmukALb0hdJz0fwFPXJOYIZtLBF7YS12CQ42dQL2TtPKMJfxUUphqodTLeGqh2osjfxWXokfitc3
	oAy69YnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XBU-00000004wjT-2jlq;
	Tue, 30 Sep 2025 10:02:12 +0000
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net ([209.97.182.222])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XBQ-00000004whf-3Tqu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 10:02:11 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 30 Sep 2025 18:01:32 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Tue, 30 Sep 2025 18:01:32 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?UTF-8?B?6Z+m5bCa5aif?= <weishangjuan@eswincomputing.com>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	yong.liang.choong@linux.intel.com, anthony.l.nguyen@intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, jan.petrous@oss.nxp.com,
	jszhang@kernel.org, inochiama@gmail.com, 0x1207@gmail.com,
	boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: [PATCH v7 2/2] ethernet: eswin: Add eic7700 ethernet
 driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aNJjshm4Z8H2Z8_V@shell.armlinux.org.uk>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918090026.3280-1-weishangjuan@eswincomputing.com>
 <aMw-dgNiXgPeqeSz@shell.armlinux.org.uk>
 <30080c70.16e1.199748921d3.Coremail.weishangjuan@eswincomputing.com>
 <aNJjshm4Z8H2Z8_V@shell.armlinux.org.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7a5436bb.2377.1999a11f6b3.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgAHLBJ9qttoIeXuAA--.18724W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEBDGjatNUciwABsL
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_030209_160421_996D4C17 
X-CRM114-Status: GOOD (  13.67  )
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

SGkgUnVzc2VsbCBLaW5nLAoKVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb25zLiB3ZeKAmXZlIGRv
bmUgc29tZSB0cmlhbHMgYW5kIGludmVzdGlnYXRpb25zLApidXQgd2XigJlkIGxpa2UgdG8gY2xh
cmlmeSBhIGZldyBwb2ludHM6CgpNb3ZpbmcgZWljNzcwMF9jbGtzX2NvbmZpZygpIGludG8gcGxh
dF9kYXQtPmluaXQgYW5kIHBsYXRfZGF0LT5leGl0IGRvZXMKYWxsb3cgdXMgdG8gZHJvcCBlaWM3
NzAwX2R3bWFjX3JlbW92ZSgpIGFuZCB1c2UgZGV2bV9zdG1tYWNfcGx0Zm1fcHJvYmUoKQp0byBz
aW1wbGlmeSB0aGUgY29kZS4KCkhvd2V2ZXIsIHdlIGRvbuKAmXQgd2FudCBjbGtzX2NvbmZpZygp
IHRvIGJlIGludm9rZWQgYWdhaW4gZHVyaW5nCnN0bW1hY19wbHRmbV9yZXN1bWUoKSBhbmQgc3Rt
bWFjX3BsdGZtX3N1c3BlbmQoKS4gRm9sbG93aW5nIHlvdXIKc3VnZ2VzdGlvbiwgdGhpcyBtZWFu
cyB3ZSB3b3VsZCBuZWVkIHRvIHByb3ZpZGUgZW1wdHkgcGxhdF9kYXQtPnN1c3BlbmQoKQphbmQg
cGxhdF9kYXQtPnJlc3VtZSgpIG1ldGhvZHMuCgpDb3VsZCB5b3UgY29uZmlybSB3aGV0aGVyIHlv
deKAmXJlIHBsYW5uaW5nIHRvIGFkZCB0aGUgc3VzcGVuZCBhbmQgcmVzdW1lCmhvb2tzIGludG8g
dGhlIHBsYXRfc3RtbWFjZW5ldF9kYXRhIHN0cnVjdHVyZT8KQWxzbywgcmVnYXJkaW5nIHRoZSBj
bGVhbnVwcyB5b3UgbWVudGlvbmVkIGZvciBvdGhlciBzdG1tYWMgZ2x1ZSBkcml2ZXJzLApkbyB5
b3UgaGF2ZSBzb21lIGxpbmtzIG9yIHJlZmVyZW5jZSBjb21taXRzIHNvIHdlIGNhbiByZXZpZXcg
dGhlIGFwcHJvYWNoCnlvdSB0b29rPwoKVGhhbmtzIQoKQmVzdCByZWdhcmRzLApMaSBaaGkKCj4g
LS0tLS3ljp/lp4vpgq7ku7YtLS0tLQo+IOWPkeS7tuS6ujogIlJ1c3NlbGwgS2luZyAoT3JhY2xl
KSIgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPiDlj5HpgIHml7bpl7Q6MjAyNS0wOS0yMyAxNzow
OTowNiAo5pif5pyf5LqMKQo+IOaUtuS7tuS6ujog6Z+m5bCa5aifIDx3ZWlzaGFuZ2p1YW5AZXN3
aW5jb21wdXRpbmcuY29tPgo+IOaKhOmAgTogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGFu
ZHJldytuZXRkZXZAbHVubi5jaCwgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xl
LmNvbSwga3ViYUBrZXJuZWwub3JnLCByb2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9y
ZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZywgcGFiZW5pQHJl
ZGhhdC5jb20sIG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9z
cy5zdC5jb20sIHZsYWRpbWlyLm9sdGVhbkBueHAuY29tLCB5b25nLmxpYW5nLmNob29uZ0BsaW51
eC5pbnRlbC5jb20sIGFudGhvbnkubC5uZ3V5ZW5AaW50ZWwuY29tLCBwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20sIGphbi5wZXRyb3VzQG9zcy5ueHAuY29tLCBqc3poYW5n
QGtlcm5lbC5vcmcsIGlub2NoaWFtYUBnbWFpbC5jb20sIDB4MTIwN0BnbWFpbC5jb20sIGJvb24u
a2hhaS5uZ0BhbHRlcmEuY29tLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBsaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tLCBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1pbkBlc3dpbmNv
bXB1dGluZy5jb20sIGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtlc2gudmFnaGVsYUBl
aW5mb2NoaXBzLmNvbQo+IOS4u+mimDogUmU6IFJlOiBbUEFUQ0ggdjcgMi8yXSBldGhlcm5ldDog
ZXN3aW46IEFkZCBlaWM3NzAwIGV0aGVybmV0IGRyaXZlcgo+IAo+IE9uIFR1ZSwgU2VwIDIzLCAy
MDI1IGF0IDExOjA2OjA4QU0gKzA4MDAsIOmfpuWwmuWonyB3cm90ZToKPiA+IEluIHRoZSBjdXJy
ZW50IGVpYzc3MDBfZHdtYWMgZ2x1ZSBkcml2ZXIsIHRoZSByZWdtYXBfcmVhZCgpL3dyaXRlKCkK
PiA+IG9wZXJhdGlvbnMoZm9yIHBoeV9jdHJsMSwgYXhpX2xwX2N0cmwxLCBhbmQgdGhlIFJYL1RY
IGRlbGF5IHJlZ2lzdGVycykpYXJlwqAKPiA+IHBlcmZvcm1lZCBkaXJlY3RseSBpbiB0aGUgcHJv
YmUoKSBmdW5jdGlvbi4gV291bGQgaXQgYmUgY2xlYW5lciB0byBtb3ZlIHRoZXNlCj4gPiByZWdp
c3RlciBjb25maWd1cmF0aW9ucyBpbnRvIHRoZSBpbml0KCkgY2FsbGJhY2sgaW5zdGVhZCwgc28g
dGhhdCB0aGV5IGFyZQo+ID4gYWxzbyByZWFwcGxpZWQgZHVyaW5nIHJlc3VtZSgpPwo+IAo+IFRo
aXMgaXMgYSBxdWVzdGlvbiBJIGNhbid0IGFuc3dlciBkZWZpbml0aXZlbHkgYXMgSSBkb24ndCBr
bm93IHdoYXQKPiBoYXBwZW5zIGR1cmluZyBhIHN1c3BlbmQgb24geW91ciBoYXJkd2FyZSwgYW5k
IHRodXMgd2hpY2ggcmVnaXN0ZXJzCj4gYXJlIGxvc3QgLyByZXNldCBieSB0aGUgdGltZSB0aGUg
c3lzdGVtIHJlc3VtZXMuIFNvIEkgY2FuIG9ubHkgZ2l2ZQo+IHRoZSBvYnZpb3VzIGd1aWRhbmNl
Lgo+IAo+IElmIHRoZSBzZXR0aW5ncyBpbiB0aGUgZGVsYXkgcmVnaXN0ZXJzIGFyZSBsb3N0IG92
ZXIgYSBzdXNwZW5kL3Jlc3VtZQo+IHRoZW4gdGhleSBuZWVkIHRvIGJlIHJlLWluaXRpYWxpc2Vk
IGFmdGVyIHJlc3VtZS4KPiAKPiAtLSAKPiBSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3
LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KPiBGVFRQIGlzIGhlcmUhIDgwTWJw
cyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQo=

