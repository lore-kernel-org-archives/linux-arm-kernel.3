Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DEAC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DtGnFpzM8f43M0udRhNnwjvmNlde+mVhX6RbziV3+g=; b=gkqOtggL0HsGzYpmpSupZMtdrt
	hu1se3X35XoTtsBLQMDWiWh1uj/5d5DF6lS9fX5hG144VMNceD7xGAYzUReqI423o2AMkoudvZ1WF
	rBE+/MudiyLx/j0wO7+MYGcIrP0SRk8Kk//wupHuFINSsBZIz8u1em1nUWUsQvzkl5QdQRfwL3obF
	Zwe4fg8kBoadcZZn5dQn3xRnCy8jFTCkY2rT3DBG8Cz6tte5RUM4BtIkFN8KP6cEk7ulvsxWFKdyD
	j77eczuMvg2p6li6ZN7zMcO/z9bmYzIBmqA5fX2UHrstx8hSWkzcdLuE0fF+/81b9l4q9wz0cRELt
	P2x0FgRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXmp-00000009unW-062Z;
	Wed, 22 Jan 2025 10:16:39 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXlX-00000009uf7-0nPe;
	Wed, 22 Jan 2025 10:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=X8Jqip2+EUnxTzwkbxgRzDjMVQmyTYWY55G8IQGsnqg=; b=J
	TFgnUhmPLhBtBzXJEpH/oTSefjxwCukLrU0bnmvK83Vru1gpCSVSzt2TC0c2VDzg
	+/e223PumNREJ/j8rtEIkmIYkwTSJYQJf5sOdZJcGC8J7JWD4YGlSh5KmO5MaUHa
	kt1nUKfRTXluNWH0tfzYCBZNfRtJfDEjqIxYA9fkaw=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Wed, 22 Jan 2025 18:14:38 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 22 Jan 2025 18:14:38 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
	detlev.casanova@collabora.com, daniel@fooishbar.org, robh@kernel.org,
	sebastian.reichel@collabora.com,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v12 12/13] dt-bindings: display: vop2: Add rk3576
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250122-amber-moth-of-upgrade-fa8331@krzk-bin>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103500.2528258-1-andyshrk@163.com>
 <20250122-amber-moth-of-upgrade-fa8331@krzk-bin>
X-NTES-SC: AL_Qu2YBfmfv0As7iibZekfmkcVgOw9UcO5v/Qk3oZXOJF8jCrr+CUnVkFMJFbsweeONhCLrheYTj1O48h1bZN6b5MbUXGMFwQ7SUeIEvUXSRjajA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <76fe64e1.7132.1948d81c1f4.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgD33_kOxZBn3c1cAA--.18436W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gHcXmeQv7FH9wACsa
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_021519_601823_3114A374 
X-CRM114-Status: GOOD (  15.64  )
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

SGksIAoKQXQgMjAyNS0wMS0yMiAxNjowNDo1OSwgIktyenlzenRvZiBLb3psb3dza2kiIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+T24gVHVlLCBKYW4gMjEsIDIwMjUgYXQgMDY6MzQ6NTdQTSAr
MDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNo
aXBzLmNvbT4KPj4gCj4+IEFkZCB2b3AgZm91bmQgb24gcmszNTc2LCB0aGUgbWFpbiBkaWZmZXJl
bmNlIGJldHdlZW4gcmszNTc2IGFuZCB0aGUKPj4gcHJldmlvdXMgdm9wIGlzIHRoYXQgZWFjaCBW
UCBoYXMgaXRzIG93biBpbnRlcnJ1cHQgbGluZS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkg
WWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gCj4+IC0tLQo+PiAKPj4gQ2hhbmdlcyBp
biB2MTI6Cj4+IC0gU3BsaXQgZnJvbSBwYXRjaCAxMC8xMwo+Cj5PcmRlciB5b3VyIHBhdGNoZXMg
ZmluYWxseS4gSXQncyB2MTIgYW5kIHlvdSBzdGlsbCBzZW5kIGJpbmRpbmcgYWZ0ZXIKPnRoZSB1
c2VyLiBSZWFkIGNhcmVmdWxseSBzdWJtaXR0aW5nIGJpbmRpbmdzL3BhdGNoZXMuCgpXaGF0IGRv
IHlvdSBtZWFuIGJ5ICJzZW5kaW5nIGJpbmRpbmcgYWZ0ZXIgdXNlciIgaGVyZT8gCkkgdGhpbmsg
UEFUQ0ggMX45IGFyZSBmaXggYW5kIHByZXBhcmF0aW9ucywgUEFUQ0ggMTMoImRybS9yb2NrY2hp
cDogdm9wMjogQWRkIHN1cHBvcnQgZm9yIHJrMzU3NiIpCmlzIHRoZSB1c2VyIHRoYXQgdXNlcyB0
aGUgbmV3IGJpbmRpbmcuCgo+Cj4+IAo+PiBDaGFuZ2VzIGluIHYxMToKPj4gLSBSZW1vdmUgcmVk
dW5kYW50IG1pbi9tYXhJdGVtcyBjb25zdHJhaW50Cj4+IAo+PiBDaGFuZ2VzIGluIHYxMDoKPj4g
LSBNb3ZlIGludGVycnVwdC1uYW1lcyBiYWNrIHRvIHRvcCBsZXZlbAo+PiAtIEFkZCBjb25zdHJh
aW50IG9mIGludGVycnVwdHMgZm9yIGFsbCBwbGF0Zm9ybQo+PiAtIEFkZCBjb25zdHJhaW50IGZv
ciBhbGwgZ3JmIHBoYW5kbGVzCj4+IC0gUmVvcmRlciBzb21lIHByb3BlcnRpZXMKPj4gCj4+IENo
YW5nZXMgaW4gdjk6Cj4+IC0gRHJvcCAndm9wLScgcHJlZml4IG9mIGludGVycnVwdC1uYW1lcy4K
Pj4gLSBBZGQgYmxhbmsgbGluZSBiZXR3ZWVuIERUIHByb3BlcnRpZXMKPj4gLSBSZW1vdmUgbGlz
dCBpbnRlcnJ1cHQtbmFtZXMgaW4gdG9wIGxldmVsCj4+IAo+PiBDaGFuZ2VzIGluIHY4Ogo+PiAt
IEZpeCBkdF9iaW5kaW5nX2NoZWNrIGVycm9ycwo+PiAtIG9yZGVyZWQgYnkgc29jIG5hbWUKPj4g
LSBMaW5rIHRvIHRoZSBwcmV2aW91cyB2ZXJzaW9uOgo+PiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJvY2tjaGlwLzZwbjNxanhvdGR0cHp1Y3B1bDI0eXJvN3BwZGRlend1aXpuZW92
cXZtZ2R3eXYyajdwQHp0ZzRtcXlpcW1qZi9ULyN1Cj4+IAo+PiBDaGFuZ2VzIGluIHY0Ogo+PiAt
IGRlc2NyaWJlIGNvbnN0cmFpbnQgU09DIGJ5IFNPQywgYXMgaW50ZXJydXB0cyBvZiByazM1NzYg
aXMgdmVyeQo+PiAgIGRpZmZlcmVudCBmcm9tIG90aGVycwo+PiAtIERyb3AgS3J6eXN6dG9mJ3Mg
UmV2aWV3ZWQtYnksIGFzIHRoaXMgdmVyc2lvbiBjaGFuZ2VkIGEgbG90Lgo+PiAKPj4gQ2hhbmdl
cyBpbiB2MzoKPj4gLSBvcmRlcmVkIGJ5IHNvYyBuYW1lCj4+IC0gQWRkIGRlc2NyaXB0aW9uIGZv
ciBuZXdseSBhZGRlZCBpbnRlcnJ1cHQKPj4gCj4+IENoYW5nZXMgaW4gdjI6Cj4+IC0gQWRkIGR0
IGJpbmRpbmdzCj4+IAo+PiAgLi4uL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wMi55YW1s
ICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDUyIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wMi55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAv
cm9ja2NoaXAtdm9wMi55YW1sCj4+IGluZGV4IDE1N2EzN2VkODRkYS4uYTJhNjM2OWM3YjZmIDEw
MDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9y
b2NrY2hpcC9yb2NrY2hpcC12b3AyLnlhbWwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wMi55YW1sCj4+IEBAIC0y
MSw2ICsyMSw3IEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgZW51bToKPj4gICAgICAgIC0gcm9ja2No
aXAscmszNTY2LXZvcAo+PiAgICAgICAgLSByb2NrY2hpcCxyazM1Njgtdm9wCj4+ICsgICAgICAt
IHJvY2tjaGlwLHJrMzU3Ni12b3AKPj4gICAgICAgIC0gcm9ja2NoaXAscmszNTg4LXZvcAo+PiAg
Cj4+ICAgIHJlZzoKPj4gQEAgLTM4LDEwICszOSwyMSBAQCBwcm9wZXJ0aWVzOgo+PiAgICAgICAg
LSBjb25zdDogZ2FtbWEtbHV0Cj4+ICAKPj4gICAgaW50ZXJydXB0czoKPj4gLSAgICBtYXhJdGVt
czogMQo+PiArICAgIG1pbkl0ZW1zOiAxCj4+ICsgICAgbWF4SXRlbXM6IDQKPj4gICAgICBkZXNj
cmlwdGlvbjoKPj4gLSAgICAgIFRoZSBWT1AgaW50ZXJydXB0IGlzIHNoYXJlZCBieSBzZXZlcmFs
IGludGVycnVwdCBzb3VyY2VzLCBzdWNoIGFzCj4+IC0gICAgICBmcmFtZSBzdGFydCAoVlNZTkMp
LCBsaW5lIGZsYWcgYW5kIG90aGVyIHN0YXR1cyBpbnRlcnJ1cHRzLgo+PiArICAgICAgRm9yIFZP
UCB2ZXJzaW9uIHVuZGVyIHJrMzU3NiwgdGhlIGludGVycnVwdCBpcyBzaGFyZWQgYnkgc2V2ZXJh
bCBpbnRlcnJ1cHQKPj4gKyAgICAgIHNvdXJjZXMsIHN1Y2ggYXMgZnJhbWUgc3RhcnQgKFZTWU5D
KSwgbGluZSBmbGFnIGFuZCBvdGhlciBpbnRlcnJ1cHQgc3RhdHVzLgo+PiArICAgICAgRm9yIFZP
UCB2ZXJzaW9uIGZyb20gcmszNTc2IHRoZXJlIGlzIGEgc3lzdGVtIGludGVycnVwdCBmb3IgYnVz
IGVycm9yLCBhbmQKPj4gKyAgICAgIGV2ZXJ5IHZpZGVvIHBvcnQgaGFzIGl0J3MgaW5kZXBlbmRl
bnQgaW50ZXJydXB0cyBmb3IgdnN5bmMgYW5kIG90aGVyIHZpZGVvCj4+ICsgICAgICBwb3J0IHJl
bGF0ZWQgZXJyb3IgaW50ZXJydXB0cy4KPj4gKwo+PiArICBpbnRlcnJ1cHQtbmFtZXM6Cj4+ICsg
ICAgaXRlbXM6Cj4+ICsgICAgICAtIGNvbnN0OiBzeXMKPj4gKyAgICAgIC0gY29uc3Q6IHZwMAo+
PiArICAgICAgLSBjb25zdDogdnAxCj4+ICsgICAgICAtIGNvbnN0OiB2cDIKPj4gIAo+PiAgICAj
IFNlZSBjb21wYXRpYmxlLXNwZWNpZmljIGNvbnN0cmFpbnRzIGJlbG93Lgo+PiAgICBjbG9ja3M6
Cj4+IEBAIC0xMzUsNiArMTQ3LDggQEAgYWxsT2Y6Cj4+ICAgICAgICAgIGludGVycnVwdHM6Cj4+
ICAgICAgICAgICAgbWF4SXRlbXM6IDEKPgo+U28gdGhpcyBjaGFuZ2UgbW92ZXMgdG8gdGhpcyBw
YXRjaC4KPgo+PiAgCj4+ICsgICAgICAgIGludGVycnVwdC1uYW1lczogZmFsc2UKPj4gKwo+PiAg
ICAgICAgICBwb3J0czoKPj4gICAgICAgICAgICByZXF1aXJlZDoKPj4gICAgICAgICAgICAgIC0g
cG9ydEAwCj4+IEBAIC0xNDgsNiArMTYyLDM5IEBAIGFsbE9mOgo+PiAgICAgICAgcmVxdWlyZWQ6
Cj4+ICAgICAgICAgIC0gcm9ja2NoaXAsZ3JmCj4+ICAKPj4gKyAgLSBpZjoKPj4gKyAgICAgIHBy
b3BlcnRpZXM6Cj4+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4+ICsgICAgICAgICAgY29udGFpbnM6
Cj4+ICsgICAgICAgICAgICBlbnVtOgo+PiArICAgICAgICAgICAgICAtIHJvY2tjaGlwLHJrMzU3
Ni12b3AKPj4gKyAgICB0aGVuOgo+PiArICAgICAgcHJvcGVydGllczoKPj4gKyAgICAgICAgY2xv
Y2tzOgo+PiArICAgICAgICAgIG1pbkl0ZW1zOiA1Cj4KPk5vLiBZb3UgZGlkIG5vdCBpbXBsZW1l
bnQgbXkgY29tbWVudCBhdCBhbGwuCj4KPlNvIGFnYWluOgo+IldoeSBtaW5JdGVtcz8gTm90aGlu
ZyBpbiB0aGlzIHBhdGNoIG1ha2VzIHNlbnNlIGZvciBtZS4gTmVpdGhlciBjaGFuZ2luZwo+ZXhp
c3RpbmcgYmluZGluZyBub3IgbmV3IGJpbmRpbmcgZm9yIHJrMzU3Ni4iCj4KPlRvIGFkZHJlc3Mg
c3VjaCBjb21tZW50LCBjb21lIHdpdGggcmVhc29uYWJsZSBhbnN3ZXIgdG8gIndoeSIuIE5vdCBq
dXN0Cj5zZW5kIHRoZSBzYW1lLiBJdCdzIGEgd2FzdGUgb2YgbXkgdGltZSB0byBrZWVwIHJldmll
d2luZyB0aGUgc2FtZS4KPgo+QmVzdCByZWdhcmRzLAo+S3J6eXN6dG9mCj4K

