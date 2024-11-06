Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C5CD59F40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUpD/adQtI0xP3Z1yxQhyvJ0tZgMbldcwT+hDS7al44=; b=Xfed9M4wudpjnOV9QULW/dJLuJ
	+46yGlYbpemoyWCVSlkG7L9f7Cgr1gev1MopzPDx4SaVN2pxspyl7hIq1D9tCLqc/00flb/uylowe
	b63DOKM2hxejwKAG3JVgg9O6jzvUsd8FddshtzhBaMvhRBqByE+1VaDmYkjLLsCbEpASE9mWusfqU
	c8sLddH0+ZShGNtekUQPg9MPxZb1s+aKSFyZN+Gc5hYlJjYf82KLverv94kODmM3gohnGabQn/Py/
	e/CYdEljwipdEBCwOuPi86ANSAcKwi1SqxUXAQcRZF6ow4zWEvniYDCT5eyEzimJAnmA5GfQQ6Gng
	+iNWpdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iH6-00000003tJk-2xxR;
	Wed, 06 Nov 2024 15:48:52 +0000
Received: from mx3.securetransport.de ([116.203.31.6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iFM-00000003sm8-2rX5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1730907995;
	bh=SUpD/adQtI0xP3Z1yxQhyvJ0tZgMbldcwT+hDS7al44=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GKZH8J+CWD9n4KGgUxQjBUJ9zbTEmLJo0ZN15EQ1OU5WE9/3xZYSqjYouGrDUc+m3
	 jgz1UH0MMhXmeggB+DvW4IvgBYMU7Bm44/n9j6kXymm5jF9HOu1E58ciljEiuJWYru
	 6d1BditNMtUF90cSnHyzoGyjGC3iKh81vYu5mtaqGTh/FS8dB4JtNRs9vW6NXFxb2y
	 48pWo4OsCfWBUy7/rhnEG6PLKKs96rwfm4zE6OEvWG97s/8L3xW8ndXKP4AyZd/ekQ
	 1o6cT1ZQ+sLymt9Dn37y6o2xU08rE4FWgCy+38DlnZNyVkW6XMWg4+z3DFX64dGpOT
	 Xam3zz1cpC5NQ==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel
	<kernel@dh-electronics.com>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: RE: [PATCH] ARM: dts: stm32: Deduplicate serial aliases and chosen
 node for STM32MP15xx DHCOM SoM
Thread-Topic: [PATCH] ARM: dts: stm32: Deduplicate serial aliases and chosen
 node for STM32MP15xx DHCOM SoM
Thread-Index: AQHbL9rCDR++m5XnwEia1oSEi4J2B7KqZhfA
Date: Wed, 6 Nov 2024 15:46:32 +0000
Message-ID: <c4e579b989ed4a93bf6270175abd1869@dh-electronics.com>
References: <20241105233026.161463-1-marex@denx.de>
In-Reply-To: <20241105233026.161463-1-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_074704_966360_54DF08DC 
X-CRM114-Status: GOOD (  15.16  )
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

PiBGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gU2VudDogV2VkbmVzZGF5LCBO
b3ZlbWJlciA2LCAyMDI0IDEyOjMwIEFNDQo+IERlZHVwbGljYXRlIC9hbGlhc2VzIHsgc2VyaWFs
TiA9IC4uLiB9IGFuZCAvY2hvc2VuIG5vZGUgaW50bw0KPiBzdG0zMm1wMTV4eC1kaGNvbS1zb20u
ZHRzaSAsIHNpbmNlIHRoZSBjb250ZW50IGlzIGlkZW50aWNhbA0KPiBvbiBhbGwgY2FycmllciBi
b2FyZHMgdXNpbmcgdGhlIFNUTTMyTVAxNXh4IERIQ09NIFNvTS4gTm8NCj4gZnVuY3Rpb25hbCBj
aGFuZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4N
Cj4gLS0tDQo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3Qu
Y29tPg0KPiBDYzogQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPg0KPiBDYzogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPg0KPiBDYzogTWF4aW1lIENvcXVl
bGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBrZXJu
ZWxAZGgtZWxlY3Ryb25pY3MuY29tDQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcNCj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20N
Cj4gLS0tDQo+ICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1kaGNvbS1kcmMwMi5k
dHNpICAgfCAxMiAtLS0tLS0tLS0tLS0NCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
NXh4LWRoY29tLXBkazIuZHRzaSAgICB8IDEwIC0tLS0tLS0tLS0NCj4gIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0L3N0bTMybXAxNXh4LWRoY29tLXBpY29pdHguZHRzaSB8IDEwIC0tLS0tLS0tLS0NCj4g
IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRoY29tLXNvbS5kdHNpICAgICB8ICA3
ICsrKysrKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4
eC1kaGNvbS1kcmMwMi5kdHNpDQo+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgt
ZGhjb20tZHJjMDIuZHRzaQ0KPiBpbmRleCBiYjRmOGEwYjkzN2YzLi5hYmUyZGZlNzA2MzY0IDEw
MDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1kaGNvbS1kcmMw
Mi5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRoY29tLWRy
YzAyLmR0c2kNCj4gQEAgLTYsMTggKzYsNiBAQA0KPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lu
cHV0L2lucHV0Lmg+DQo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcHdtL3B3bS5oPg0KPiANCj4g
LS8gew0KPiAtICAgICAgIGFsaWFzZXMgew0KPiAtICAgICAgICAgICAgICAgc2VyaWFsMCA9ICZ1
YXJ0NDsNCj4gLSAgICAgICAgICAgICAgIHNlcmlhbDEgPSAmdXNhcnQzOw0KPiAtICAgICAgICAg
ICAgICAgc2VyaWFsMiA9ICZ1YXJ0ODsNCj4gLSAgICAgICB9Ow0KPiAtDQo+IC0gICAgICAgY2hv
c2VuIHsNCj4gLSAgICAgICAgICAgICAgIHN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgi
Ow0KPiAtICAgICAgIH07DQo+IC19Ow0KPiAtDQo+ICAmYWRjIHsNCj4gICAgICAgICBzdGF0dXMg
PSAiZGlzYWJsZWQiOw0KPiAgfTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxNXh4LWRoY29tLXBkazIuZHRzaQ0KPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMybXAxNXh4LWRoY29tLXBkazIuZHRzaQ0KPiBpbmRleCAxNzFkN2M3NjU4ZmE4Li4wZmI0ZTU1
ODQzYjlkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1k
aGNvbS1wZGsyLmR0c2kNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgt
ZGhjb20tcGRrMi5kdHNpDQo+IEBAIC03LDE2ICs3LDYgQEANCj4gICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9wd20vcHdtLmg+DQo+IA0KPiAgLyB7DQo+IC0gICAgICAgYWxpYXNlcyB7DQo+IC0gICAg
ICAgICAgICAgICBzZXJpYWwwID0gJnVhcnQ0Ow0KPiAtICAgICAgICAgICAgICAgc2VyaWFsMSA9
ICZ1c2FydDM7DQo+IC0gICAgICAgICAgICAgICBzZXJpYWwyID0gJnVhcnQ4Ow0KPiAtICAgICAg
IH07DQo+IC0NCj4gLSAgICAgICBjaG9zZW4gew0KPiAtICAgICAgICAgICAgICAgc3Rkb3V0LXBh
dGggPSAic2VyaWFsMDoxMTUyMDBuOCI7DQo+IC0gICAgICAgfTsNCj4gLQ0KPiAgICAgICAgIGNs
a19leHRfYXVkaW9fY29kZWM6IGNsb2NrLWNvZGVjIHsNCj4gICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0g
PDA+Ow0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtZGhj
b20tcGljb2l0eC5kdHNpDQo+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtZGhj
b20tcGljb2l0eC5kdHNpDQo+IGluZGV4IGI1YmM1M2FjY2Q2YjIuLjAxYzY5M2NjMDM0NDYgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRoY29tLXBpY29p
dHguZHRzaQ0KPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1kaGNvbS1w
aWNvaXR4LmR0c2kNCj4gQEAgLTcsMTYgKzcsNiBAQA0KPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L3B3bS9wd20uaD4NCj4gDQo+ICAvIHsNCj4gLSAgICAgICBhbGlhc2VzIHsNCj4gLSAgICAgICAg
ICAgICAgIHNlcmlhbDAgPSAmdWFydDQ7DQo+IC0gICAgICAgICAgICAgICBzZXJpYWwxID0gJnVz
YXJ0MzsNCj4gLSAgICAgICAgICAgICAgIHNlcmlhbDIgPSAmdWFydDg7DQo+IC0gICAgICAgfTsN
Cj4gLQ0KPiAtICAgICAgIGNob3NlbiB7DQo+IC0gICAgICAgICAgICAgICBzdGRvdXQtcGF0aCA9
ICJzZXJpYWwwOjExNTIwMG44IjsNCj4gLSAgICAgICB9Ow0KPiAtDQo+ICAgICAgICAgbGVkIHsN
Cj4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaQ0K
PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRoY29tLXNvbS5kdHNpDQo+IGlu
ZGV4IDc0YTExY2NjNTMzM2YuLjA4NmQzYTYwY2NjZTIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRoY29tLXNvbS5kdHNpDQo+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRoY29tLXNvbS5kdHNpDQo+IEBAIC0xNCw2ICsxNCwx
MyBAQCBhbGlhc2VzIHsNCj4gICAgICAgICAgICAgICAgIGV0aGVybmV0MSA9ICZrc3o4ODUxOw0K
PiAgICAgICAgICAgICAgICAgcnRjMCA9ICZod3J0YzsNCj4gICAgICAgICAgICAgICAgIHJ0YzEg
PSAmcnRjOw0KPiArICAgICAgICAgICAgICAgc2VyaWFsMCA9ICZ1YXJ0NDsNCj4gKyAgICAgICAg
ICAgICAgIHNlcmlhbDEgPSAmdXNhcnQzOw0KPiArICAgICAgICAgICAgICAgc2VyaWFsMiA9ICZ1
YXJ0ODsNCj4gKyAgICAgICB9Ow0KPiArDQo+ICsgICAgICAgY2hvc2VuIHsNCj4gKyAgICAgICAg
ICAgICAgIHN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOw0KPiAgICAgICAgIH07DQo+
IA0KPiAgICAgICAgIG1lbW9yeUBjMDAwMDAwMCB7DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGgg
TmllZGVybWFpZXIgPGNuaWVkZXJtYWllckBkaC1lbGVjdHJvbmljcy5jb20+DQo=

