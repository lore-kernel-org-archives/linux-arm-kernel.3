Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B2FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRRn5494WVPiZ1HbdbeXdMsTMq7k/8XqGHHbIo4GKCE=; b=TPTGWqggtNXV1ILreyvfYfE5h7
	SMPlVJ0q2jyURtVSlfs/Dv7A5oe3jgMvWx4ESJMoXj5JRy8aQtip4RD2Rjby5YZUd0NZ27OaHMrgD
	XIwyjuiq5GdADX1LKwsNHZXYo5SeThH5G9c1kJMwzswzC7r9flYIjQfggryRgmkw5iflhQyVF6s9S
	Bkm7qXcC7FBx4xjnL++X8HzDTcAk4bcW/s6xlN8BJ2K5oZrREYdcfXDGPB9UD/ScvRp1hOPXj9Coh
	varszr68/MQ2zg7lPptt5n5jlzx2d1Jayw+JSN+RqTTKl/XpPsP4lmbZo4/Rnn6k3Gd6PRV6CC4xS
	oz1SAvYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNB23-0000000Fhz4-2qxU;
	Thu, 05 Jun 2025 13:53:23 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAhX-0000000FeYJ-0QnB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:32:12 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 15:32:09 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Thu, 5 Jun 2025 15:32:09 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Frank Li <Frank.li@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Thread-Topic: [PATCH v4 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Thread-Index: AQHb1h2p186darlQmUK22qpyzH8BCrP0brUA
Date: Thu, 5 Jun 2025 13:32:09 +0000
Message-ID: <2bfe7b81-b70e-4882-b1ce-8cbaef24838f@actia.se>
References: <20250605132754.1771368-1-john.ernberg@actia.se>
 <20250605132754.1771368-4-john.ernberg@actia.se>
In-Reply-To: <20250605132754.1771368-4-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B1445363726A
Content-Type: text/plain; charset="utf-8"
Content-ID: <24B75F4E67FE224A942D8D7BE8B8B5BC@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_063211_147088_000DE7F6 
X-CRM114-Status: GOOD (  25.46  )
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

SGksDQoNCk9uIDYvNS8yNSAzOjI4IFBNLCBKb2huIEVybmJlcmcgd3JvdGU6DQo+IE5YUCBTb0Nz
IGxpa2UgdGhlIGlNWDhRTSwgaU1YOFFYUCBvciBpTVg4RFhQIHVzZSBwb3dlciBkb21haW5zIGZv
cg0KPiByZXNvdXJjZSBtYW5hZ2VtZW50Lg0KPiANCj4gQWRkIGNvbXBhdGlibGUgc3RyaW5ncyBm
b3IgdGhlc2UgU29DcyAoUVhQIGFuZCBEWFAgZ2V0cyB0byBzaGFyZSBhcyB0aGVpcg0KPiBvbmx5
IGRpZmZlcmVuY2UgaXMgYSBjb3JlLWNvdW50LCBRPVF1YWQgY29yZSBhbmQgRD1EdWFsIGNvcmUp
LCBhbmQgYWxsb3cNCj4gcG93ZXItZG9tYWlucyBmb3IgdGhlbSBvbmx5LiBLZWVwIHRoZSBvbGQg
cmVzdHJpY3Rpb24gZm9yIG90aGVycy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRXJuYmVy
ZyA8am9obi5lcm5iZXJnQGFjdGlhLnNlPg0KPiANCj4gLS0tDQo+IA0KPiB2NDoNCj4gICAtIFJl
d29yZCBjb21taXQgbWVzc2FnZSAoRnJhbmsgTGkpDQo+ICAgLSBBZGQgZXhwbGljaXQgaW14OHF4
cCBjb21wYXRpYmxlIChGcmFuayBMaSkNCj4gICAtIE1vdmUgdGhlIGpvYi1yaW5nIGNvbnN0cmFp
bnRzIGJhY2sgdG8gdGhlIGpvYi1yaW5nIHNlY3Rpb24gdW5kZXIgYW4NCj4gICAgICdhbGxPZjon
IHRvIGF2b2lkIHRoZSB3YXJuaW5nIGZyb20gdjIgKFJvYiBIZXJyaW5nKQ0KPiANCj4gdjM6DQo+
ICAgLSBGaXggd2FybmluZ3MgZGlzY292ZXJlZCBieSBSb2IgSGVycmluZydzIGJvdA0KPiAgIC0g
RGVjbGFyZSB0aGUgY29tcGF0aWJsZXMgY29ycmVjdGx5IChLcnp5c3p0b2YgS296bG93c2tpKQ0K
PiANCj4gdjI6DQo+ICAgLSBBZGp1c3QgY29tbWl0IG1lc3NhZ2UgKEZyYW5rIExpKQ0KPiAgIC0g
T25seSBhbGxvdyBwb3dlci1kb21haW5zIHdoZW4gY29tcGF0aWJsZSB3aXRoIGlteDhxbSAoRnJh
bmsgTGkpDQo+IC0tLQ0KPiAgIC4uLi9iaW5kaW5ncy9jcnlwdG8vZnNsLHNlYy12NC4wLnlhbWwg
ICAgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNDAg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8vZnNsLHNlYy12NC4wLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY3J5cHRvL2ZzbCxzZWMtdjQuMC55YW1sDQo+
IGluZGV4IDc1YWZhNDQxZTAxOS4uZWFiNDNlN2EzNTRjIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY3J5cHRvL2ZzbCxzZWMtdjQuMC55YW1sDQo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8vZnNsLHNlYy12NC4w
LnlhbWwNCj4gQEAgLTQ2LDYgKzQ2LDggQEAgcHJvcGVydGllczoNCj4gICAgICAgICAtIGl0ZW1z
Og0KPiAgICAgICAgICAgICAtIGVudW06DQo+ICAgICAgICAgICAgICAgICAtIGZzbCxpbXg2dWwt
Y2FhbQ0KPiArICAgICAgICAgICAgICAtIGZzbCxpbXg4cW0tY2FhbQ0KPiArICAgICAgICAgICAg
ICAtIGZzbCxpbXg4cXhwLWNhYW0NCj4gICAgICAgICAgICAgICAgIC0gZnNsLHNlYy12NS4wDQo+
ICAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxzZWMtdjQuMA0KPiAgICAgICAgIC0gY29uc3Q6IGZz
bCxzZWMtdjQuMA0KPiBAQCAtNzcsNiArNzksOSBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgaW50ZXJy
dXB0czoNCj4gICAgICAgbWF4SXRlbXM6IDENCj4gICANCj4gKyAgcG93ZXItZG9tYWluczoNCj4g
KyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICAgICBmc2wsc2VjLWVyYToNCj4gICAgICAgZGVzY3Jp
cHRpb246IERlZmluZXMgdGhlICdFUkEnIG9mIHRoZSBTRUMgZGV2aWNlLg0KPiAgICAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gQEAgLTEwNiw3ICsx
MTEsMTAgQEAgcGF0dGVyblByb3BlcnRpZXM6DQo+ICAgICAgICAgICAgICAgICAtIGNvbnN0OiBm
c2wsc2VjLXY1LjAtam9iLXJpbmcNCj4gICAgICAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxzZWMt
djQuMC1qb2ItcmluZw0KPiAgICAgICAgICAgICAtIGl0ZW1zOg0KPiAtICAgICAgICAgICAgICAt
IGNvbnN0OiBmc2wsc2VjLXY1LjAtam9iLXJpbmcNCj4gKyAgICAgICAgICAgICAgLSBlbnVtOg0K
PiArICAgICAgICAgICAgICAgIC0gZnNsLGlteDhxbS1qb2ItcmluZw0KPiArICAgICAgICAgICAg
ICAgIC0gZnNsLGlteDhxeHAtam9iLXJpbmcNCj4gKyAgICAgICAgICAgICAgICAtIGZzbCxzZWMt
djUuMC1qb2ItcmluZw0KPiAgICAgICAgICAgICAgICAgLSBjb25zdDogZnNsLHNlYy12NC4wLWpv
Yi1yaW5nDQo+ICAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxzZWMtdjQuMC1qb2ItcmluZw0KPiAg
IA0KPiBAQCAtMTE2LDYgKzEyNCw5IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiAgICAgICAgIGlu
dGVycnVwdHM6DQo+ICAgICAgICAgICBtYXhJdGVtczogMQ0KPiAgIA0KPiArICAgICAgcG93ZXIt
ZG9tYWluczoNCj4gKyAgICAgICAgbWF4SXRlbXM6IDENCj4gKw0KPiAgICAgICAgIGZzbCxsaW9k
bjoNCj4gICAgICAgICAgIGRlc2NyaXB0aW9uOg0KPiAgICAgICAgICAgICBTcGVjaWZpZXMgdGhl
IExJT0ROIHRvIGJlIHVzZWQgaW4gY29uanVuY3Rpb24gd2l0aCB0aGUgcHBpZC10by1saW9kbg0K
PiBAQCAtMTI1LDYgKzEzNiwyMCBAQCBwYXR0ZXJuUHJvcGVydGllczoNCj4gICAgICAgICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJheQ0KPiAgICAg
ICAgICAgaXRlbXM6DQo+ICAgICAgICAgICAgIC0gbWF4aW11bTogMHhmZmYNCj4gKyAgICBhbGxP
ZjoNCj4gKyAgICAgIC0gaWY6DQo+ICsgICAgICAgICAgcHJvcGVydGllczoNCj4gKyAgICAgICAg
ICAgIGNvbXBhdGlibGU6DQo+ICsgICAgICAgICAgICAgIGNvbnRhaW5zOg0KPiArICAgICAgICAg
ICAgICAgIGVudW06DQo+ICsgICAgICAgICAgICAgICAgICAtIGZzbCxpbXg4cW0tam9iLXJpbmcN
Cj4gKyAgICAgICAgICAgICAgICAgIC0gZnNsLGlteDhxeHAtam9iLXJpbmcNCj4gKyAgICAgICAg
dGhlbjoNCj4gKyAgICAgICAgICByZXF1aXJlZDoNCj4gKyAgICAgICAgICAgIC0gcG93ZXItZG9t
YWlucw0KPiArICAgICAgICBlbHNlOg0KPiArICAgICAgICAgIHByb3BlcnRpZXM6DQo+ICsgICAg
ICAgICAgICBwb3dlci1kb21haW5zOiBmYWxzZQ0KDQpUbyBkb2RnZSB0aGUgYWxsT2YgaGVyZSBJ
IGhhZCB0byBtYWtlIHNvbWUgY2hhbmdlcyB0byBkdC1zY2hlbWEgDQpub2Rlcy55YW1sLiBJcyB0
aGUgYWxsT2YgT0sgb3IgZG9lcyB0aGUgY2hhbmdlcyBsb29rIGxpa2Ugc29tZXRoaW5nIHRoYXQg
DQpzaG91bGQgYmUgc3VibWl0dGVkIGZvcm1hbGx5Pw0KDQpUaGFua3MhIC8vIEpvaG4gRXJuYmVy
Zw0KDQotLS0tLS0tLS0tLS0tLS0tLS0+OC0tLS0tLS0tLS0tLS0tLS0tLQ0KDQogRnJvbSAzOWUz
Yzg1ZTUzYWI1NzBmZGQ1ZDVhOTMxNTZhOGE0ODZlZjIwZjBjIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQ0KRnJvbTogSm9obiBFcm5iZXJnIDxqb2huLmVybmJlcmdAYWN0aWEuc2U+DQpEYXRlOiBX
ZWQsIDQgSnVuIDIwMjUgMTU6MTI6NTUgKzAyMDANClN1YmplY3Q6IFtQQVRDSF0gc2NoZW1hczog
bm9kZXM6IEFsbG93IGlmLXRoZW4tZWxzZSBpbiBwYXR0ZXJuUHJvcGVydGllcw0KICBvYmplY3Rz
DQoNCkhhdmluZyBsb2NhbCBpZi10aGVuLWVsc2Ugc3RhdGVtZW50cyB1bmRlciBlLmcuIGEgcGF0
dGVyblByb3BlcnRpZXMgb2JqZWN0DQpub2RlIGNhdXNlcyBhIHNjaGVtYSB3YXJuaW5nIGFib3V0
IGFuIHVuZXhwZWN0ZWQgc3RhdGVtZW50Lg0KDQpBbGxvdyB0aGlzIGNvbnN0cnVjdCB0byByZWR1
Y2Ugc2l6ZSBvZiBpZi10aGVuLWVsc2UgYmxvY2tzIHRoYXQgd291bGQNCm90aGVyd2lzZSBuZWVk
IHRvIG9jY3VyIGF0IHRoZSB0b3AgbGV2ZWwsIG1ha2luZyB0aGVtIGVhc2llciB0byByZWFkLA0K
YW5kIG1vcmUgbG9jYWxpemVkIHRvIHdoYXQgdGhleSBhcmUgY29udHJvbGxpbmcuDQoNClNpZ25l
ZC1vZmYtYnk6IEpvaG4gRXJuYmVyZyA8am9obi5lcm5iZXJnQGFjdGlhLnNlPg0KLS0tDQogIGR0
c2NoZW1hL21ldGEtc2NoZW1hcy9ub2Rlcy55YW1sIHwgMyArKysNCiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHRzY2hlbWEvbWV0YS1zY2hlbWFzL25v
ZGVzLnlhbWwgDQpiL2R0c2NoZW1hL21ldGEtc2NoZW1hcy9ub2Rlcy55YW1sDQppbmRleCAwYjJj
OGY3Li5lNDVjYjQ1IDEwMDY0NA0KLS0tIGEvZHRzY2hlbWEvbWV0YS1zY2hlbWFzL25vZGVzLnlh
bWwNCisrKyBiL2R0c2NoZW1hL21ldGEtc2NoZW1hcy9ub2Rlcy55YW1sDQpAQCAtMjcsNiArMjcs
OSBAQCBwcm9wZXJ0eU5hbWVzOg0KICAgICAgLSBkZXByZWNhdGVkDQogICAgICAtIHJlcXVpcmVk
DQogICAgICAtIG5vdA0KKyAgICAtIGlmDQorICAgIC0gZWxzZQ0KKyAgICAtIHRoZW4NCiAgICAg
IC0gYWxsT2YNCiAgICAgIC0gYW55T2YNCiAgICAgIC0gb25lT2YNCg0KDQo=

