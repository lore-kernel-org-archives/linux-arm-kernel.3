Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75448CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyMups70bW1ogWE0EaTnelofWvaWzMnau+KKTSwEx6k=; b=KMY1B46oh56thm6t8OzcezVvNL
	k36s8jIlxkS7OXZjy8CZy8fjEWfL34JZ2svpiK29QUYSoR7VYLOuOad5/FFgQvRxFNbo+NSO+AODF
	ZUiqeoIrEQZfA31DoUXIF4Af+ghRTf+exYwaIIsZM3BpOotrTxMsWAz5d9h+a9z6oequrdnKi+dIo
	CsrwW6N+GRYWXxJVITPDKjbfwrPUXs1MC+0BLNXL4IrHuIMLq6X0bdwKiV+JxlNAFikFBk7lNf1gE
	pAok0sW3izLYQkmn/PmpVrDVmsFGQqcEuOjzjoba/s+XHE5vlFv0u+CP808SJn5FG4gJws15I67Pe
	UN7Oz58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6q-0000000G6E2-1aKD;
	Fri, 05 Sep 2025 02:23:28 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuKVw-0000000FaPS-3E9m;
	Fri, 05 Sep 2025 00:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=o3UeHALX5qoweamPMaS1MOo62sjLt4Ear2JoA1tXdH0=; b=E
	ECBtM+ZATaxWbyo9uZnjjX3AKb4hqsFf0zL5yMq5SoZWgTY965YSmppEKkp6pfaG
	fGVYxVGHmyue5oNIpEw6Yu5Y/FT3d22STvwQDQtdu3eJ5qt/v5hrau9kyGz3d7GR
	s5pPO6llYsERiAngQVOpxAJeynKwS6h8jME6fgvesk=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-101 (Coremail) ; Fri, 5 Sep 2025 08:40:31 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 5 Sep 2025 08:40:31 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: heiko@sntech.de, mripard@kernel.org, neil.armstrong@linaro.org,
	andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
	rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
	knaerzche@gmail.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm
 bridge
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <u72vkfojufgvuqwuqpvgvnip3wogpgdcuc7bn46zo3bp7ogbu5@fmqotgyahrsn>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com>
 <u72vkfojufgvuqwuqpvgvnip3wogpgdcuc7bn46zo3bp7ogbu5@fmqotgyahrsn>
X-NTES-SC: AL_Qu2eBfyYvUAo5yKQYOkfmUgWjuw/WsG1v/Ul1YBSP556jCvp5SMHf3ZKHULs//mXIjigrBiNQDVU1+VTT7d4brIxhOSmkMWZwxSDEf8Xx9R1wg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <786c050a.6d2.1991751593e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZSgvCgDnb8Z_MbpoklIpAA--.133W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwy-Xmi6K7+O6wADs+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_174117_143144_6BE8B038 
X-CRM114-Status: GOOD (  16.66  )
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

CkhlbGxvIERtaXRyee+8jAoKQXQgMjAyNS0wOS0wNSAwODowNTowNiwgIkRtaXRyeSBCYXJ5c2hr
b3YiIDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+T24gV2VkLCBT
ZXAgMDMsIDIwMjUgYXQgMDc6MDc6MzhQTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+IEZyb206
IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gCj4+IENvbnZlcnQgaXQgdG8g
ZHJtIGJyaWRnZSBkcml2ZXIsIGl0IHdpbGwgYmUgY29udmVuaWVudCBmb3IgdXMgdG8KPj4gbWln
cmF0ZSB0aGUgY29ubmVjdG9yIHBhcnQgdG8gdGhlIGRpc3BsYXkgZHJpdmVyIGxhdGVyLgo+PiAK
Pj4gU2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiAK
Pj4gLS0tCj4+IAo+PiBDaGFuZ2VzIGluIHY3Ogo+PiAtIFJlYmFzZSBvbiBsYXRlc3QgZHJtLW1p
c2MtbmV4dAo+PiAKPj4gQ2hhbmdlcyBpbiB2NjoKPj4gLSBSZWJhc2Ugb24gbGF0ZXN0IGRybS1t
aXNjLW5leHQKPj4gLSBMaW5rIHRvIFY1OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
b2NrY2hpcC8yMDI1MDUxMjEyNDYxNS4yODQ4NzMxLTEtYW5keXNocmtAMTYzLmNvbS8KPj4gCj4+
IENoYW5nZXMgaW4gdjU6Cj4+IC0gU3BsaXQgY2xlYW51cCBjb2RlIHRvIHNlcGVyYXRlIHBhdGNo
Cj4+IC0gU3dpdGNoIHRvIGRldm1fZHJtX2JyaWRnZV9hbGxvYygpIEFQSQo+PiAtIExpbmsgdG8g
VjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJvY2tjaGlwLzIwMjUwNDIyMDcwNDU1
LjQzMjY2Ni0xLWFuZHlzaHJrQDE2My5jb20vCj4+IAo+PiBDaGFuZ2VzIGluIHY0Ogo+PiAtIERv
IG5vdCBzdG9yZSBjb2xvcmltZXRyeSB3aXRoaW4gaW5ub19oZG1pIHN0cnVjdAo+PiAtIExpbmsg
dG8gVjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJvY2tjaGlwLzIwMjUwNDAyMTIz
MTUwLjIzODIzNC0xLWFuZHlzaHJrQDE2My5jb20vCj4+IAo+PiBDaGFuZ2VzIGluIHYzOgo+PiAt
IEZpcnN0IGluY2x1ZGVkIGluIHYzCj4+IC0gTGluayB0byBWMjogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvZHJpLWRldmVsLzIwMjUwMzI1MTMyOTQ0LjE3MTExMS0xLWFuZHlzaHJrQDE2My5jb20v
Cj4+IAo+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnICAgICAgICAgICAgICAgIHwg
ICA3ICsKPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUgICAgICAgICAgICAgICB8
ICAgMSArCj4+ICAuLi4vaW5ub19oZG1pLmMgPT4gYnJpZGdlL2lubm8taGRtaS5jfSAgICAgICAg
fCA1MDIgKysrKystLS0tLS0tLS0tLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvS2Nv
bmZpZyAgICAgICAgICAgICAgfCAgIDEgKwo+PiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL01h
a2VmaWxlICAgICAgICAgICAgIHwgICAyICstCj4+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
aW5ub19oZG1pLXJvY2tjaGlwLmMgfCAxODggKysrKysrKwo+PiAgaW5jbHVkZS9kcm0vYnJpZGdl
L2lubm9faGRtaS5oICAgICAgICAgICAgICAgIHwgIDMzICsrCj4+ICA3IGZpbGVzIGNoYW5nZWQs
IDM2NiBpbnNlcnRpb25zKCspLCAzNjggZGVsZXRpb25zKC0pCj4+ICByZW5hbWUgZHJpdmVycy9n
cHUvZHJtL3tyb2NrY2hpcC9pbm5vX2hkbWkuYyA9PiBicmlkZ2UvaW5uby1oZG1pLmN9ICg2OSUp
Cj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRt
aS1yb2NrY2hpcC5jCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0vYnJpZGdlL2lu
bm9faGRtaS5oCj4+IAo+PiBAQCAtNjM3LDE0ICs1ODQsMTMgQEAgc3RhdGljIHZvaWQgaW5ub19o
ZG1pX2luaXRfaHcoc3RydWN0IGlubm9faGRtaSAqaGRtaSkKPj4gIAloZG1pX21vZGIoaGRtaSwg
SERNSV9TVEFUVVMsIG1fTUFTS19JTlRfSE9UUExVRywgdl9NQVNLX0lOVF9IT1RQTFVHKDEpKTsK
Pj4gIH0KPj4gIAo+PiAtc3RhdGljIGludCBpbm5vX2hkbWlfZGlzYWJsZV9mcmFtZShzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+PiAtCQkJCSAgIGVudW0gaGRtaV9pbmZvZnJhbWVf
dHlwZSB0eXBlKQo+PiArc3RhdGljIGludCBpbm5vX2hkbWlfYnJpZGdlX2NsZWFyX2luZm9mcmFt
ZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+PiArCQkJCQkgICAgZW51bSBoZG1pX2luZm9m
cmFtZV90eXBlIHR5cGUpCj4+ICB7Cj4+IC0Jc3RydWN0IGlubm9faGRtaSAqaGRtaSA9IGNvbm5l
Y3Rvcl90b19pbm5vX2hkbWkoY29ubmVjdG9yKTsKPj4gKwlzdHJ1Y3QgaW5ub19oZG1pICpoZG1p
ID0gYnJpZGdlX3RvX2lubm9faGRtaShicmlkZ2UpOwo+PiAgCj4+ICAJaWYgKHR5cGUgIT0gSERN
SV9JTkZPRlJBTUVfVFlQRV9BVkkpIHsKPj4gLQkJZHJtX2Vycihjb25uZWN0b3ItPmRldiwKPj4g
LQkJCSJVbnN1cHBvcnRlZCBpbmZvZnJhbWUgdHlwZTogJXVcbiIsIHR5cGUpOwo+PiArCQlkcm1f
ZXJyKGJyaWRnZS0+ZGV2LCAiVW5zdXBwb3J0ZWQgaW5mb2ZyYW1lIHR5cGU6ICV1XG4iLCB0eXBl
KTsKPj4gIAkJcmV0dXJuIDA7Cj4+ICAJfQo+PiAgCj4+IEBAIC02NTMsMjAgKzU5OSwxOSBAQCBz
dGF0aWMgaW50IGlubm9faGRtaV9kaXNhYmxlX2ZyYW1lKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsCj4+ICAJcmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gLXN0YXRpYyBpbnQgaW5ub19o
ZG1pX3VwbG9hZF9mcmFtZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+PiAtCQkJ
CSAgZW51bSBoZG1pX2luZm9mcmFtZV90eXBlIHR5cGUsCj4+IC0JCQkJICBjb25zdCB1OCAqYnVm
ZmVyLCBzaXplX3QgbGVuKQo+PiArc3RhdGljIGludCBpbm5vX2hkbWlfYnJpZGdlX3dyaXRlX2lu
Zm9mcmFtZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+PiArCQkJCQkgICAgZW51bSBoZG1p
X2luZm9mcmFtZV90eXBlIHR5cGUsCj4+ICsJCQkJCSAgICBjb25zdCB1OCAqYnVmZmVyLCBzaXpl
X3QgbGVuKQo+PiAgewo+PiAtCXN0cnVjdCBpbm5vX2hkbWkgKmhkbWkgPSBjb25uZWN0b3JfdG9f
aW5ub19oZG1pKGNvbm5lY3Rvcik7Cj4+ICsJc3RydWN0IGlubm9faGRtaSAqaGRtaSA9IGJyaWRn
ZV90b19pbm5vX2hkbWkoYnJpZGdlKTsKPj4gIAlzc2l6ZV90IGk7Cj4+ICAKPj4gIAlpZiAodHlw
ZSAhPSBIRE1JX0lORk9GUkFNRV9UWVBFX0FWSSkgewo+PiAtCQlkcm1fZXJyKGNvbm5lY3Rvci0+
ZGV2LAo+PiAtCQkJIlVuc3VwcG9ydGVkIGluZm9mcmFtZSB0eXBlOiAldVxuIiwgdHlwZSk7Cj4+
ICsJCWRybV9lcnIoYnJpZGdlLT5kZXYsICJVbnN1cHBvcnRlZCBpbmZvZnJhbWUgdHlwZTogJXVc
biIsIHR5cGUpOwo+PiAgCQlyZXR1cm4gMDsKPj4gIAl9Cj4+ICAKPj4gLQlpbm5vX2hkbWlfZGlz
YWJsZV9mcmFtZShjb25uZWN0b3IsIHR5cGUpOwo+PiArCWlubm9faGRtaV9icmlkZ2VfY2xlYXJf
aW5mb2ZyYW1lKGJyaWRnZSwgdHlwZSk7Cj4+ICAKPj4gIAlmb3IgKGkgPSAwOyBpIDwgbGVuOyBp
KyspCj4+ICAJCWhkbWlfd3JpdGViKGhkbWksIEhETUlfQ09OVFJPTF9QQUNLRVRfQUREUiArIGks
IGJ1ZmZlcltpXSk7Cj4KPkl0J3Mgbm90IGFuIGlzc3VlIGZvciB0aGlzIHBhdGNoIChhbmQgSSB0
aGluayBpdCBjYW4gYmUgZml4ZWQgYWZ0ZXIgdGhpcwo+c2VyaWVzIGlzIG1lcmdlZCkuIEkgdG9v
ayBhIHF1aWNrIGdsYW5jZSBhdCBmcmFtZSBwcm9ncmFtbWluZy4gSXQgZmVlbHMKPmxpa2UgdGhl
IGNsZWFyX2luZm9mcmFtZSBzaG91bGQgYmUgcG9raW5nIGF0IHJlZ2lzdGVycyAweDljIC8gMHg5
ZC4gQW5kCj53cml0ZV9pbmZvZnJhbWUgdGhlbiBjYW4gc3VwcG9ydCBIRE1JLCBTUEQgYW5kIEF1
ZGlvIGluZm9mcmFtZXMgaW4KPmFkZGl0aW9uIHRvIHRoZSBBVkkuIEkgZG9uJ3QgaGF2ZSBoYXJk
d2FyZSB0byBleHBlcmltZW50IChub3IgdGltZSA6LSkpLAo+YnV0IHdvdWxkIHRoZXJlIGJlIGEg
Y2hhbmNlIHRvIGltcHJvdmUgdGhpcz8KCk9rYXksIEknbGwga2VlcCB5b3VyIHN1Z2dlc3Rpb25z
IGluIG1pbmQgYW5kIGxvb2sgZm9yIGFuIG9wcG9ydHVuaXR5IHRvIHRyeSB0aGVtIG91dCBsYXRl
ci4gClRoZSBoYXJkd2FyZSBmb3IgdGhpcyBib2FyZCBpcyBpbmRlZWQgdmVyeSBzY2FyY2UgYXQg
dGhlIG1vbWVudOKAlEkgcHV0IGluIGEgbG90IG9mIGVmZm9ydCBqdXN0CnRvIGdldCBteSBoYW5k
cyBvbiBvbmUuIFRoZSBtYWluIHJlYXNvbiBJJ20gbW9kaWZ5aW5nIHRoaXMgY29kZSBpcyB0byBj
b252ZXJ0IGFsbCBvZiBSb2NrY2hpcCdzCmRpc3BsYXkgaW50ZXJmYWNlIGRyaXZlcnMgaW50byBi
cmlkZ2UgbW9kZSwgd2hpY2ggd2lsbCBtYWtlIGl0IGVhc2llciB0byBzZXBhcmF0ZSB0aGUgY29u
bmVjdG9yCnBhcnQgaW50byB0aGUgZGlzcGxheSBkcml2ZXIgc2lkZSBpbiB0aGUgZnV0dXJlLgoK
VGhhbmsgeW91IGFsd2F5cy4KCgoKPgo+LS0gCj5XaXRoIGJlc3Qgd2lzaGVzCj5EbWl0cnkK

