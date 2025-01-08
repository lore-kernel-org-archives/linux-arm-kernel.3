Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF06E77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 00:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vx9EdJsNBcRIpz/ADVbnPQyQLhZV+V1R6yfVIWa60vw=; b=1Bs/snRLK1ZHt8Tt3jWfOD1sIh
	Fw348vb5A2Bt3cpINtCk0Li6V8/fcPDH9JQ00qdVwOdjecpori3Imb1NvXoPZ2R/W5c2rBGWk4sjm
	Lxt1o7u23KcAKjRINo7Z8d6bOFLQ+MqvojQCibCikqDmmgJi19/EFJNOjnm+dMzOuTV2/dsL2IaJ9
	xe4l3rDHMwGkrGn/iJjtwaG0BUIKn75tglnhV/6uFvZyxiqxG17Bp93SJznJn+fxrQJ/OTszDmTo3
	BsWu9a1q5aoAklpHGCZQ+P8e3a/YOje9RC8GbNioxQ9Z8ekcke3esZ6SIemdZVJhzbmYKpnXfbQFo
	9yHSbaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJzc-00000006dKI-38OK;
	Wed, 08 Jan 2025 00:32:16 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJy3-00000006d71-0XOW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 00:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736296236;
	bh=vx9EdJsNBcRIpz/ADVbnPQyQLhZV+V1R6yfVIWa60vw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Jtms8RdjwKm/KLZV7eXQhHgkPq5ONs3LP5R2RBqkaJUL1Rq4h7bB+IjQsAEIaS/cf
	 8KObp78BnCS+z+UvbWP7i8Tv/UF6I4p2rimJ1yFRKRnkCdYNjlJ/hLPZmITF7VJ5Pp
	 8eTIauA0372S3VD0riVvzVKQc/r4faMWbm3ID/4lQIhMdvoj+B//sYWffvxmH74yQs
	 o/o2X8abIYRJwok0Wu832CNuipDEh8LbdGyhUpRxQ4SKzMeJHXJkLK38n6sV5XYuPa
	 cirPCuYjBo35fm64HQDeN1GGw0Ou1ErdChk4tyh/vFuyfjcu8tOguM+LWA+sa0ChXJ
	 LZboxPuE10QhA==
Received: from [192.168.68.112] (ppp118-210-64-24.adl-adc-lon-bras32.tpg.internode.on.net [118.210.64.24])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3641C70801;
	Wed,  8 Jan 2025 08:30:36 +0800 (AWST)
Message-ID: <a180245323d06ce09697abb1ee9e83cc66e73db1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite4: adjust secondary flash name
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Wed, 08 Jan 2025 11:00:35 +1030
In-Reply-To: <Z31VRZg2LTd36S4n@heinlein>
References: <20241218212458.3050775-1-patrick@stwcx.xyz>
	 <e3279e0c41259f165a0cde0195b196f416ac566a.camel@codeconstruct.com.au>
	 <Z31VRZg2LTd36S4n@heinlein>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_163039_364395_BA004514 
X-CRM114-Status: GOOD (  12.93  )
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

T24gVHVlLCAyMDI1LTAxLTA3IGF0IDExOjI0IC0wNTAwLCBQYXRyaWNrIFdpbGxpYW1zIHdyb3Rl
Ogo+IE9uIFR1ZSwgSmFuIDA3LCAyMDI1IGF0IDAzOjQ0OjA0UE0gKzEwMzAsIEFuZHJldyBKZWZm
ZXJ5IHdyb3RlOgo+ID4gCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Rh
dHVzID0gIm9rYXkiOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG0yNXAs
ZmFzdC1yZWFkOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbGFiZWwgPSAi
Ym1jMiI7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsYWJlbCA9ICJhbHQt
Ym1jIjsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGktcngtYnVzLXdp
ZHRoID0gPDQ+Owo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaS1tYXgt
ZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoH07Cj4gPiAKPiA+
IEknbSBoaXR0aW5nIGNvbmZsaWN0cyAoPykgd2hlbiBJIGFwcGx5IHRoaXMgb24gdG9wIG9mWzFd
LiBEbyB5b3UKPiA+IG1pbmQKPiA+IHJlYmFzaW5nIGl0Pwo+ID4gCj4gPiBbMV06IGh0dHBzOi8v
Z2l0aHViLmNvbS9hbWJvYXIvbGludXgvdHJlZS9mb3IvYm1jL2FzcGVlZC9kdAo+IAo+IFN1cmUu
wqAgSXQgbG9va3MgbGlrZSBzb21lb25lIGVsc2V3aGVyZSBjaGFuZ2VkIHRoZSBzcGktcngtYnVz
LXdpZHRoCj4gd2hpY2ggaXMgY2F1c2luZyB0aGUgY29uZmxpY3QuwqAgSSdsbCByZXNlbnQgYSBy
ZWJhc2UuCj4gCj4gSSdkIGxpa2UgdGhpcyBiYWNrcG9ydGVkIHRvIHRoZSBvcGVuYm1jIHRyZWUg
YWxzby7CoCBOb3Qgc3VyZSB3aGljaAo+IHZlcnNpb24gaXMgYmVzdCBmb3IgdGhhdCB0cmVlIHJp
Z2h0IG5vdy4KPiAKCkkndmUgYXBwbGllZCB0aGUgcmViYXNlZCBwYXRjaCB0byBib3RoICh0aGUg
YmFja3BvcnQgZGlkbid0IGNvbmZsaWN0KS4KCkFuZHJldwo=


