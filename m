Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D55CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU4fC88JBHAp0zYfJSbS98oDp1yi1/hICgQxsaUH6hM=; b=vrYJwneUO+OPwcBfMpuS3wIE0B
	zVl2UmZ/jxbTvZ1Ak7Cy+6Qf6Hr51nNlTZP52UQ9w7Vuwwt4Lkm0Nzs7/V9uk/SpVA2izvbDfCp83
	mKRnE0wzf2r9jXpuwaQFFA6iY6vxv6vszHK7A0Uic3spsYWMXi/8LFgX0rI8NxX7jlYUZOs0wKgtX
	i/ZhGvqX7Lq/cPXwoHuEDsNTL8LAdqVGAnti8qFwC9ViXvwIBqnCcEFOeuIhAa/s9mESeMFG0EHc0
	lGizwFD9bV8H50593vhoLyRuKSV2rnR1Pq7R9YBqCK8sZMJ4hHvT9vQ3SdPy6sZHKM2Ryii9MKO9Y
	O/zqW46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyShA-00000007U1P-1jkg;
	Tue, 16 Sep 2025 10:13:56 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySh7-00000007Tzj-2Iyl;
	Tue, 16 Sep 2025 10:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=9r47YpNtLDGnmu9MOq0uHzZ3Aq3g0W9pPUXAi/LnBFQ=; b=Z
	apZ3uEpnncAPLxsqchcfOGWIxhpZD/lRTziSBpcEoAogYTKT1p4CpRdqmkq50FYO
	9ov7c5xIGkypEoEH4is0KRWQBK9u38fZPIBQFKWwJBobTBbi7nk/OE+XpCsCXiW0
	aR+3m7IYGqaqEm1N+VaqCnRb/vnDdeLSJ+VHY1GQe8=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-132 (Coremail) ; Tue, 16 Sep 2025 18:13:14 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 16 Sep 2025 18:13:14 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>,
	"Chaoyi Chen" <kernel@airkyi.com>,
	"Heiko Stuebner" <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Dragan Simic" <dsimic@manjaro.org>,
	"FUKAUMI Naoki" <naoki@radxa.com>, "Jonas Karlman" <jonas@kwiboo.se>,
	"Peter Robinson" <pbrobinson@gmail.com>,
	"chaoyi.chen@rock-chips.com" <chaoyi.chen@rock-chips.com>,
	"Geert Uytterhoeven" <geert+renesas@glider.be>,
	"Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>,
	"Sebastian Reichel" <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] arm64: dts: rockchip: Enable DisplayPort for
 rk3588-evb2
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <0884990e-f349-49d5-804a-932125aca1cf@rock-chips.com>
References: <20250916080802.125-1-kernel@airkyi.com>
 <50379c05-c8b7-4858-98ff-da7ebdc06863@cherry.de>
 <352856bb-76b6-4861-8a3f-80f94f7c7375@rock-chips.com>
 <72ddffd6-bd8f-418e-996d-70267d3ca7e4@cherry.de>
 <0884990e-f349-49d5-804a-932125aca1cf@rock-chips.com>
X-NTES-SC: AL_Qu2eCvyauE0i4iSabekfmUgWjuw/WsG1v/Ul1YBSP556jAPoxxw8QE5yE3nd79OjGy6SgCG5YAlI2Nlmf4dhWoA56gnBH63NZzQMYzV9RE1SfA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5e94042f.9278.1995203a448.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hCgvCgDXr1Y6OMloJJALAA--.2564W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwDKXmjJMDLeaAADsx
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_031353_910600_2613755A 
X-CRM114-Status: GOOD (  21.61  )
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

CgpIZWxsbyBRdWVudGlu77yMCgrlnKggMjAyNS0wOS0xNiAxNzo0ODo0Me+8jCJDaGFveWkgQ2hl
biIgPGNoYW95aS5jaGVuQHJvY2stY2hpcHMuY29tPiDlhpnpgZPvvJoKPk9uIDkvMTYvMjAyNSA1
OjI0IFBNLCBRdWVudGluIFNjaHVseiB3cm90ZToKPgo+PiBPbiA5LzE2LzI1IDExOjE4IEFNLCBD
aGFveWkgQ2hlbiB3cm90ZToKPj4+IEhpIFF1ZW50aW4sCj4+Pgo+Pj4gT24gOS8xNi8yMDI1IDQ6
NDEgUE0sIFF1ZW50aW4gU2NodWx6IHdyb3RlOgo+Pj4+IEhpIENoYW95aSBDaGVuLAo+Pj4+Cj4+
Pj4gT24gOS8xNi8yNSAxMDowOCBBTSwgQ2hhb3lpIENoZW4gd3JvdGU6Cj4+Pj4+IEZyb206IENo
YW95aSBDaGVuIDxjaGFveWkuY2hlbkByb2NrLWNoaXBzLmNvbT4KPj4+Pj4KPj4+Pj4gVGhlIHJr
MzU4OCBldmIyIGJvYXJkIGhhcyBhIGZ1bGwgc2l6ZSBEaXNwbGF5UG9ydCBjb25uZWN0b3IsIGVu
YWJsZQo+Pj4+PiBmb3IgaXQuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENoYW95aSBDaGVu
IDxjaGFveWkuY2hlbkByb2NrLWNoaXBzLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IMKgIC4uLi9ib290
L2R0cy9yb2NrY2hpcC9yazM1ODgtZXZiMi12MTAuZHRzwqDCoMKgwqAgfCAzOSArKysrKysrKysr
KysrKysrKysrCj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCj4+Pj4+
Cj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OC1l
dmIyLXYxMC5kdHMgYi9hcmNoLyBhcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1ODgtZXZiMi12
MTAuZHRzCj4+Pj4+IGluZGV4IDkxZmU4MTBkMzhkOC4uMGU1YWY2MWY2NmZlIDEwMDY0NAo+Pj4+
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OC1ldmIyLXYxMC5kdHMK
Pj4+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1ODgtZXZiMi12MTAu
ZHRzCj4+Pj4+IEBAIC0yNSw2ICsyNSwxOCBAQCBjaG9zZW4gewo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgc3Rkb3V0LXBhdGggPSAic2VyaWFsMjoxNTAwMDAwbjgiOwo+Pj4+PiDCoMKgwqDCoMKg
IH07Cj4+Pj4+IMKgICvCoMKgwqAgZHAtY29uIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBh
dGlibGUgPSAiZHAtY29ubmVjdG9yIjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGxhYmVsID0gIkRQ
IE9VVCI7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB0eXBlID0gImZ1bGwgc2l6ZSI7Cj4+Pj4KPj4+
PiBUaGlzIGlzbid0IHZhbGlkIGFjY29yZGluZyB0byB0aGUgZHQgYmluZGluZy4gSXQgc2hvdWxk
IGJlICJmdWxsLXNpemUiIGluc3RlYWQuCj4+Pgo+Pj4gV2lsbCBmaXggaW4gdjIuCj4+Pgo+Pj4K
Pj4+Pgo+Pj4+PiArCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwb3J0IHsKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZHBfY29uX2luOiBlbmRwb2ludCB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmVtb3RlLWVuZHBvaW50ID0gPCZkcDBfb3V0X2Nvbj47Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+Pj4+
PiArwqDCoMKgIH07Cj4+Pj4+ICsKPj4+Pj4gwqDCoMKgwqDCoCBoZG1pLWNvbiB7Cj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImhkbWktY29ubmVjdG9yIjsKPj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHR5cGUgPSAiYSI7Cj4+Pj4+IEBAIC0xMDYsNiArMTE4LDI0IEBAIHZj
YzV2MF91c2JkY2luOiByZWd1bGF0b3ItdmNjNXYwLXVzYmRjaW4gewo+Pj4+PiDCoMKgwqDCoMKg
IH07Cj4+Pj4+IMKgIH07Cj4+Pj4+IMKgICsmZHAwIHsKPj4+Pj4gK8KgwqDCoCBwaW5jdHJsLTAg
PSA8JmRwMG0wX3BpbnM+Owo+Pj4+PiArwqDCoMKgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
Cj4+Pj4+ICvCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4+PiArfTsKPj4+Pj4gKwo+Pj4+PiAr
JmRwMF9pbiB7Cj4+Pj4+ICvCoMKgwqAgZHAwX2luX3ZwMjogZW5kcG9pbnQgewo+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgcmVtb3RlLWVuZHBvaW50ID0gPCZ2cDJfb3V0X2RwMD47Cj4+Pj4+ICvCoMKg
wqAgfTsKPj4+Pj4gK307Cj4+Pj4+ICsKPj4+Pj4gKyZkcDBfb3V0IHsKPj4+Pj4gK8KgwqDCoCBk
cDBfb3V0X2NvbjogZW5kcG9pbnQgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmVtb3RlLWVuZHBv
aW50ID0gPCZkcF9jb25faW4+Owo+Pj4+PiArwqDCoMKgIH07Cj4+Pj4+ICt9Owo+Pj4+PiArCj4+
Pj4+IMKgICZncHUgewo+Pj4+PiDCoMKgwqDCoMKgIG1hbGktc3VwcGx5ID0gPCZ2ZGRfZ3B1X3Mw
PjsKPj4+Pj4gwqDCoMKgwqDCoCBzcmFtLXN1cHBseSA9IDwmdmRkX2dwdV9tZW1fczA+Owo+Pj4+
PiBAQCAtOTE2LDYgKzk0Niw4IEBAICZ1c2JfaG9zdDFfeGhjaSB7Cj4+Pj4+IMKgIH07Cj4+Pj4+
IMKgIMKgICZ2b3Agewo+Pj4+PiArwqDCoMKgIGFzc2lnbmVkLWNsb2NrcyA9IDwmY3J1IERDTEtf
Vk9QMl9TUkM+Owo+Pj4+PiArwqDCoMKgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmNydSBQ
TExfVjBQTEw+Owo+Pj4+Cj4+Pj4gVGhpcyBpcyBzdXJwcmlzaW5nLCB0aGUgb25seSBvdGhlciBi
b2FyZCB3aGljaCBoYXMgdGhlIERQMCBlbmFibGVkICh0aGUgQ29vbFBpIDRCKSBkb2Vzbid0IHNl
dCB0aGVzZSB0d28uCj4+Pj4KPj4+PiBEb2VzIEhETUkgc3RpbGwgd29yayBhcyB3ZWxsIGFzIGl0
IHVzZWQgdG8gd2l0aCB0aGVzZSBuZXcgcHJvcGVydGllcz8gV2h5IGFyZSB0aG9zZSBuZWVkZWQ/
IFNvbWUgY29udGV4dCBpbiB0aGUgY29tbWl0IGxvZyBvciBhcyBhIGNvbW1lbnQgaW4gdGhlIERU
IHdvdWxkIGJlIG1vc3Qgd2VsY29tZSEKPj4+Cj4+PiBZZXMsIEhETUkgYW5kIERQIGNhbiB3b3Jr
IG5vcm1hbGx5IHdoZXRoZXIgdGhlc2UgbmV3wqBwcm9wZXJ0aWVzIHJlbW92ZWQgb3Igbm90Lgo+
Pj4KPj4+IFRoZSBrZXkgcG9pbnQgaXMgdGhhdCB3aGVuIHVzaW5nIFYwUExMLCB3ZSBjYW4gZ2V0
IG1vcmUgdXNhYmxlIHJlc29sdXRpb24gYmVjYXVzZSBEUCByZXF1aXJlcyBhIHByZWNpc2UgY2xv
Y2suIElmIFYwUExMIGlzIG5vdCBleHBsaWNpdGx5IHNwZWNpZmllZCBoZXJlLCB0aGVuIGRjbGtf
dm9wMiAoVlAyKSBtYXkgYmUgZGl2aWRlZCBkb3duIG9uIEdQTEwsIENQTEwsIGV0Yy4gSW4gdGhp
cyBjYXNlLCBvbmx5IGEgZmV3IGZyZXF1ZW5jeSBwb2ludHMgYXJlIGF2YWlsYWJsZS4gSW4gbXkg
Y2FzZSwgd2hlbiBWMFBMTCBpcyBub3QgdXNlZCwgb25seSByZXNvbHV0aW9ucyBzdWNoIGFzIDEw
MjR4NzY4IGFuZCA2NDB4NDgwIGFyZSBhdmFpbGFibGUuCj4KPk9oISBUaGlzIGlzIGJlY2F1c2Ug
R1BMTCB3YXMgbm90IGluaXRpYWxpemVkIHRvIHRoZSBjb3JyZWN0IGZyZXF1ZW5jeSBkdXJpbmcg
dGhlIFUtQm9vdCBzdGFnZS4gSXQgc2hvdWxkIHN1cHBvcnQgdHlwaWNhbCBmcmVxdWVuY2llcyBz
dWNoIGFzIDEwODBQICgxNDguNU0pLCA0SyAoNTk0TSkgLgo+Cj4KPj4+Cj4+PiBGb3IgSERNSSwg
SSB0aGluayBpdCB3aWxsIHVzZSBjbGtfaGRtaXBoeV9waXhlbDAvMSBhcyBjbG9jayBwYXJlbnQg
d2hpY2ggaXMgcHJvdmlkZWQgYnkgdGhlIEhETUkgUEhZIHdoZW4gaXQgd29yayBvbiBUTURTIG1v
ZGUgc28gdGhhdCB3ZSBkb24ndCBuZWVkIHRvIHNldCBpdCAuCj4+Pgo+Pgo+PiBDb25zaWRlcmlu
ZyB0aGUgY2xvY2tzIGFyZSBhbGwgaW50ZXJuYWwgdG8gdGhlIFNvQywgc2hvdWxkbid0IGFsbCB5
b3UgaGF2ZSBleHBsYWluZWQgYmUgYXBwbGljYWJsZSB0byB0aGUgQ29vbFBpIDRCIHRvbyAoYW5k
IG90aGVyIGJvYXJkcyB3aXRoIERQKT8gSSdtIHRyeWluZyB0byB1bmRlcnN0YW5kIGlmIHdlIHNo
b3VsZCBhZGQgc29tZXRoaW5nIHNpbWlsYXIgdG8gQ29vbFBpIDRCIERUUyBhcyB3ZWxsPwo+Cj5Z
ZXMsIEkgdGhpbmsgdGhpcyBtb2RpZmljYXRpb24gaXMgbmVjZXNzYXJ5IGJlY2F1c2Ugc29tZSBy
ZXNvbHV0aW9ucyB1c2Ugc3BlY2lhbCBmcmVxdWVuY2llcy4KPgo+Cj4+Cj4+IEBBbmR5LCB5b3Un
cmUgdGhlIG9uZSB3aG8gYWRkZWQgc3VwcG9ydCBmb3IgRFAgdG8gQ29vbFBpIDRCLCB3aXRob3V0
IHRoZXNlIHByb3BlcnRpZXMsIGlzIHRoZXJlIHNvbWV0aGluZyB3ZSBuZWVkIHRvIGRvIHRoZXJl
IGFzIHdlbGw/CgpPbiB0aGUgQ29vbFBJIDRCLCBzaW5jZSBubyBkZWRpY2F0ZWQgUExMIHdhcyBz
cGVjaWZpZWQsIHRoZSBHUExMIHdvdWxkIGJlIGF1dG9tYXRpY2FsbHkgYXNzaWduZWQgYXMgdGhl
IFBMTCBzb3VyY2UgZm9yIGRjbGtfdm9wMi4gCkFzIHRoZSBmcmVxdWVuY3kgb2YgR1BMTCBpcyAx
MTg4IE1Ieiwgd2UgY2FuIG9ubHkgZ2V0IHR5cGljYWwgY2xvY2sgZnJlcXVlbmNpZXMgc3VjaCBh
cyA3NC4yNSwgMTQ4LjUsIDI5NywgNTk0TUh6LCB3aGljaCBjb3JyZXNwb25kCnRvIHR5cGljYWwg
cmVzb2x1dGlvbnMgb2YgNzIwUCwgMTA4MFAsIDRLMzAvNjAuIElmIHRoZXJlIGFyZSBzb21lIG1v
cmUgc3BlY2lhbCByZXNvbHV0aW9ucywgc3VjaCBhcyBhIDM4NDB4MjE2MCA1OS45NEh6IERQIHJl
c29sdXRpb24KdGhhdCByZXF1aXJlcyBhIGRjbGsgY2xvY2sgb2YgNTkzLjQwNyBNSHosIHRoZW4g
aXQgY2Fubm90IGJlIHN1cHBvcnRlZC4KIEkgd2lsbCBjb25kdWN0IG1vcmUgdGVzdHMgbGF0ZXIg
YW5kIHRoZW4gc3VibWl0IGEgcGF0Y2ggdG8gc3BlY2lmeSBWMFBMTCBmb3IgQ29vbFBpIDRCJ3Mg
VlAyLiAKCkFuZCBDaGFveWkncyAgcGF0Y2ggaXMgY29ycmVjdC4KCgo+Pgo+PiBUaGFua3MhCj4+
IFF1ZW50aW4KPj4KPj4K

