Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D077606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3rgSnu5u;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=sDvq7toM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qBqp13DPdEHUHCSXRn7+Q5vq7grlNus6E/juuLjtF0A=; b=3rgSnu5u9VVfQJlcc2X+/TH3ll
	Avbw79X66zSECo3Wr3qgwZX3XY64OmA+OKRiDpU0Tdyp1Ph7pjNytv+ET2bZdHLWFycOqNlO0RMGR
	fmUmdX3oWIT0OudL42hiQ8EXvf40470FDAUfICOeHWwoZDJ342X6MbHQoz2IjkgulYKqxCiF5YUpM
	FW5WEJw7rpbN1C8oazVlx2BSj32bUyTfCHoVNFyGhrCHolY2CLCY78GtN0aKFo04xzX8Rlmj6iYsh
	V3aEcuKbNiaax00WjESou2WjJGfkxKtfa3GoX14rrOVWPJnc84WGIRmT2agdXcyCsGBKpfYPmB/X5
	8gkz8HMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoeL-0000000DmaQ-37Iq;
	Thu, 22 Oct 2026 08:59:49 +0000
Received: from mx2.securetransport.de ([2a03:4000:13:6c7::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoeH-0000000DmYz-421u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1792659557;
	bh=qBqp13DPdEHUHCSXRn7+Q5vq7grlNus6E/juuLjtF0A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=sDvq7toMbyTAGofLV0Sc6uI88o6FgCdC81AuJbSvywP6GgJDjSHTtimrcV0IGcQ0i
	 n8+UjcAss5UOn0y/5pE2yp3bCM92vaBq19uFFhlfoVJWHljOzwm0HTJCV2h8hRToHV
	 1udQWEKnvxePVk9jDVjqi5bpxl0+vmCD16L+zKOwv3fZ6kVmPRXhC5Q0UFomX8jIk8
	 NyykdOq9ObUOTh/lmEde9zWBUOV1P9YQsaweyYX8EYtOXscAXlbIAONmsb9px83Bna
	 ygrhoNhVS3VxnyVWCMDmDaXRBmhXKPbGJS4+GHA3zmgiipI95UjDS6i+3MpjFOA6hu
	 NijZ6yPZ6vpwg==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@nabladev.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	kernel <kernel@dh-electronics.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB number
Thread-Topic: [PATCH 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB
 number
Thread-Index: AQHdYWJeSY9vaX+wRk+57BDo1ZAIarcIHKaAgAEaxXA=
Date: Thu, 22 Oct 2026 08:59:15 +0000
Message-ID: <75107c033de14aa19a21f3b2fc66ece1@dh-electronics.com>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <20261021134435.17350-2-cniedermaier@dh-electronics.com>
 <3ca82faf-dc5a-4ef7-ad8a-f6273b3e0388@nabladev.com>
In-Reply-To: <3ca82faf-dc5a-4ef7-ad8a-f6273b3e0388@nabladev.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_015946_226493_94331B19 
X-CRM114-Status: GOOD (  14.76  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QG5hYmxhZGV2LmNvbT4NClNlbnQ6IFdlZG5lc2RheSwg
T2N0b2JlciAyMSwgMjAyNiA3OjIxIFBNDQo+IE9uIDEwLzIxLzI2IDM6NDQgUE0sIENocmlzdG9w
aCBOaWVkZXJtYWllciB3cm90ZToNCj4+IFRoZSBQQ0IgbnVtYmVyIG9mIHRoZSBtYXZlbyBib3gg
aXNuJ3QgNTI1LiBDaGFuZ2UgdGhlDQo+PiBudW1iZXIgdG8gdGhlIGNvcnJlY3QgbnVtYmVyLCA2
MjUuDQo+Pg0KPj4gRml4ZXM6IDE0NWUyNzMyYTVlOSAoIkFSTTogZHRzOiBpbXg2dWxsLWRoY29y
OiBBZGQgTWFyYW50ZWMgbWF2ZW8gYm94IikNCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBO
aWVkZXJtYWllciA8Y25pZWRlcm1haWVyQGRoLWVsZWN0cm9uaWNzLmNvbT4NCj4+IC0tLQ0KPj4g
Q2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+PiBDYzogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6aytkdEBrZXJuZWwub3JnPg0KPj4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRA
a2VybmVsLm9yZz4NCj4+IENjOiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4+IENjOiBT
YXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+PiBDYzogUGVuZ3V0cm9uaXgg
S2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCj4+IENjOiBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+PiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QG5hYmxhZGV2
LmNvbT4NCj4+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPj4gQ2M6IGlteEBsaXN0
cy5saW51eC5kZXYNCj4+IENjOiBrZXJuZWxAZGgtZWxlY3Ryb25pY3MuY29tDQo+PiBDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPj4gLS0tDQo+PiAgIGFyY2gvYXJtL2Jvb3QvZHRz
L254cC9pbXgvaW14NnVsbC1kaGNvci1tYXZlby1ib3guZHRzIHwgMiArLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2dWxsLWRoY29yLW1hdmVvLWJveC5kdHMg
Yi9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZ1bGwtZGhjb3ItbWF2ZW8tYm94LmR0cw0K
Pj4gaW5kZXggZWIwYjkxMDQwMTEwLi5iYjgyZDk3ZjlkODQgMTAwNjQ0DQo+PiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy9ueHAvaW14L2lteDZ1bGwtZGhjb3ItbWF2ZW8tYm94LmR0cw0KPj4gKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2dWxsLWRoY29yLW1hdmVvLWJveC5kdHMN
Cj4+IEBAIC02LDcgKzYsNyBAQA0KPj4gICAgKiBESENPTSBpTVg2VUxMIHZhcmlhbnQ6DQo+PiAg
ICAqIERIQ1ItaU1YNlVMTC1DMDgwLVIwNTEtU1BJLVdCVC1JLTAxTEcNCj4+ICAgICogREhDT1Ig
UENCIG51bWJlcjogNTc4LTIwMCBvciBuZXdlcg0KPj4gLSAqIG1hdmVvIGJveCBQQ0IgbnVtYmVy
OiA1MjUtMjAwIG9yIG5ld2VyDQo+PiArICogbWF2ZW8gYm94IFBDQiBudW1iZXI6IDYyNS0yMDAg
b3IgbmV3ZXINCj4gSXMgdGhlIHJldi4yMDAgY29ycmVjdCAsIG9yIGlzIHRoZSBiYXNlIGJvYXJk
IHN0aWxsIHJldi4xMDAgPw0KDQpIYXJkd2FyZSByZXYuMTAwIHdhcyBhIHByb3RvdHlwZSB0aGF0
IHdhcyBuZXZlciBzaGlwcGVkIGFuZA0KaXMgbm90IGNvbXBhdGlibGUgd2l0aCByZXYuMjAwIG9y
IGxhdGVyLg0KDQpSZWdhcmRzDQpDaHJpc3RvcGgNCg==

