Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B56CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aswFcthnfv2rmWTg22G0hBTDeuWReucnE/3ZxaWwGJo=; b=gMktTG9aRg3eZ145ZwEV8XpjZW
	rkhzhN8CPKa7G9d+lAap0LjO5i00uGe8Wvr2Dtn/sQHcA0MM+7iK6ofYA4iJuwOrpBKQ/OIE9iYIT
	1PCEhR6gGCJXtR4e+p8k6mynaNAsfpa8aJFM1yNDXN3eyMUujPeNjVKgu8bhwnVRHObY7l3JJxlrb
	anKlp0rUYTqU/+GdoikTLni89O4YigROfZRAVBLnzZBaln5g5l+crH4YJmDhA+C26GH2PcjrBHpsI
	wBDBeid67fA5893vtYV85gc6v1uUcj52TzgzVswuCUf+peqcpMHRcKnH86eslEXsChrZfjQc71SMQ
	JklyT91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRRH-00000005VOA-2FSl;
	Tue, 02 Dec 2025 14:33:11 +0000
Received: from mx2.securetransport.de ([2a03:4000:13:6c7::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRRD-00000005VNm-2ozb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 14:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1764685962;
	bh=aswFcthnfv2rmWTg22G0hBTDeuWReucnE/3ZxaWwGJo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YRqP8cL3tTx9QHaZ8qTclZJmQ2Fv9LLk/4XIxJmCQWxN3L5gKO/TbqcuFlaIJahLZ
	 4qOY7hHGC7HIWHPH+R6R7PRTcqUvpslXYo4g6VwnJyNJNHrqoRuodm/2MvvlhOeU4f
	 NvrXESxKiP3tI7XfUAot4KCpGOyx0jQ9FX1Vo7lor9za73y1ghDtuU8N0ss/pCoEDx
	 kyOflZoCuxWlyvBKdfBu/ZhuJ2JDepng02IwO+Ga9z9OHsG30Rrq5h2OoX1tMoMQoM
	 Q6Fc622OdSUoqmcLLxC2TZHReXjQbRAWS3lmexWSvIGLbGWhOgyNoL6VVuTdtAHc7e
	 Ka6XtUbJhl6wg==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marek.vasut@mailbox.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, kernel
	<kernel@dh-electronics.com>
Subject: RE: [PATCH] arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on
 DH electronics i.MX8M Plus DHCOM
Thread-Topic: [PATCH] arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on
 DH electronics i.MX8M Plus DHCOM
Thread-Index: AQHcY5F4pbnyemf+0kevbalLqYn3ELUOaJJQ
Date: Tue, 2 Dec 2025 14:32:38 +0000
Message-ID: <12d58795b3664ff08e509f0a0929d1b9@dh-electronics.com>
References: <20251202134200.8397-1-marek.vasut@mailbox.org>
In-Reply-To: <20251202134200.8397-1-marek.vasut@mailbox.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_063307_945011_DC95FCFD 
X-CRM114-Status: GOOD (  16.46  )
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

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0QG1haWxib3gub3JnPg0KU2VudDogVHVlc2Rh
eSwgRGVjZW1iZXIgMiwgMjAyNSAyOjQyIFBNDQo+IEFkZCBtaXNzaW5nICdjbG9ja3MnIHByb3Bl
cnR5IHRvIExBTjg3NDBBaSBQSFkgbm9kZSwgdG8gYWxsb3cgdGhlIFBIWSBkcml2ZXINCj4gdG8g
bWFuYWdlIExBTjg3NDBBaSBDTEtJTiByZWZlcmVuY2UgY2xvY2sgc3VwcGx5LiBUaGlzIGZpeGVz
IHNwb3JhZGljIGxpbmsNCj4gYm91bmNpbmcgY2F1c2VkIGJ5IGludGVycnVwdGlvbnMgb24gdGhl
IFBIWSByZWZlcmVuY2UgY2xvY2ssIGJ5IGxldHRpbmcgdGhlDQo+IFBIWSBkcml2ZXIgbWFuYWdl
IHRoZSByZWZlcmVuY2UgY2xvY2sgYW5kIGFzc3VyZSB0aGVyZSBhcmUgbm8gaW50ZXJydXB0aW9u
cy4NCj4gDQo+IFRoaXMgZm9sbG93cyB0aGUgbWF0Y2hpbmcgUEhZIGRyaXZlciByZWNvbW1lbmRh
dGlvbiBkZXNjcmliZWQgaW4gY29tbWl0DQo+IGJlZGQ4ZDc4YWJhMyAoIm5ldDogcGh5OiBzbXNj
OiBMQU44NzEwLzIwOiBhZGQgcGh5IHJlZmNsayBpbiBzdXBwb3J0IikNCj4gDQo+IEZpeGVzOiA4
ZDY3MTI2OTViYzggKCJhcm02NDogZHRzOiBpbXg4bXA6IEFkZCBzdXBwb3J0IGZvciBESCBlbGVj
dHJvbmljcyBpLk1YOE0gUGx1cyBESENPTQ0KPiBhbmQgUERLMiIpDQo+IFNpZ25lZC1vZmYtYnk6
IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBtYWlsYm94Lm9yZz4NCj4gLS0tDQo+IENjOiBDaHJp
c3RvcGggTmllZGVybWFpZXIgPGNuaWVkZXJtYWllckBkaC1lbGVjdHJvbmljcy5jb20+DQo+IENj
OiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+DQo+IENjOiBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0
QGtlcm5lbC5vcmc+DQo+IENjOiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1
dHJvbml4LmRlPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gQ2M6IFNh
c2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IFNoYXduIEd1byA8c2hh
d25ndW9Aa2VybmVsLm9yZz4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENj
OiBpbXhAbGlzdHMubGludXguZGV2DQo+IENjOiBrZXJuZWxAZGgtZWxlY3Ryb25pY3MuY29tDQo+
IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gLS0tDQo+ICBhcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtZGhjb20tc29tLmR0c2kgfCAxICsNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1kaGNvbS1zb20uZHRzaQ0KPiBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1kaGNvbS1zb20uZHRzaQ0KPiBpbmRleCA2
OGMyZTAxNTZhNWM4Li5mODMwM2I3ZTJiZDIyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtZGhjb20tc29tLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWRoY29tLXNvbS5kdHNpDQo+IEBAIC0xMTMsNiAr
MTEzLDcgQEAgbWRpbyB7DQo+ICAgICAgICAgICAgICAgICBldGhwaHkwZjogZXRoZXJuZXQtcGh5
QDEgeyAvKiBTTVNDIExBTjg3NDBBaSAqLw0KPiAgICAgICAgICAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAwMDcuYzExMCIsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOw0KPiArICAg
ICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsayBJTVg4TVBfQ0xLX0VORVRfUU9TPjsN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzM+Ow0K
PiAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDE5IElSUV9UWVBFX0xFVkVM
X0xPVz47DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9l
dGhwaHkwPjsNCg0KVGVzdGVkLWJ5OiBDaHJpc3RvcGggTmllZGVybWFpZXIgPGNuaWVkZXJtYWll
ckBkaC1lbGVjdHJvbmljcy5jb20+DQoNClJlZ2FyZHMNCkNocmlzdG9waA0K

