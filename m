Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9C9C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 00:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkQ8ik4KdAGTrmDROq1yWEvtaKgYAVb1rRwmJhpHbIY=; b=kQNPx2mifLQ03pdrk0KCmXo3gB
	qKi4pYm+6U+L3yUhNmOVo3i+/cm9pBVuB1kPVjHoU8ArmaTR2KLqlVGnWpAZWLs3VMabQCSwJEUbk
	klYd0Sw67fPGERIBAhG6AOo62aNiNDTa+Urr4GukV6MGoJrtUyfSIsvcLur1JeZY/3c+LRyAgJsC3
	uh5YLp+lMknekushSUZAX0B/+E1zrGHcwKKuwqbTUtcliHlRgQt69DHXvmCDoTfu+FMCNAZBvcArE
	mYNha5Vqq5AEXmsy7a4k1WzAhLIT3dDum/Hb8MvNjC85RZOJRObzSRyazqRgyD6LaqXLJbtr52OY/
	O6NzPIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBwb-00000006NqB-3jhj;
	Tue, 18 Feb 2025 00:58:37 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBv8-00000006Nhc-3FhY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 00:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739840217;
	bh=EkQ8ik4KdAGTrmDROq1yWEvtaKgYAVb1rRwmJhpHbIY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PKHF027/YqWI0hLDSpaf6m8oWe3aOeZOErMZjZyNQK/1VLMrsayuAOE9MEeeRmyeG
	 Zya4NJgfYPP7QoVHwEi25s3nATtH1x/QivmUGOdTzFfc/dSXlcdIedaSHkwfN/M0Q7
	 ISJ5sz/LA6WAvmEl3mFtlMXoCysBYbssI53AalZv5prualDQ3f4ENR+SdxHGpImIOZ
	 EoDpYyDX5UGmIG0L+Csp/Qu1AMif4DGQRpwp4a3vULIfLxUCnspSpP98Jurxmyr7Oj
	 y1F503EdhB5E1H/gwdiSnrVDzPjMTSxt5aDs+SX0qyp70hqIwAdNcyJ4uejTQ646mL
	 itPZMdMybTs+g==
Received: from [192.168.68.112] (ppp118-210-165-49.adl-adc-lon-bras34.tpg.internode.on.net [118.210.165.49])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5BB64759DD;
	Tue, 18 Feb 2025 08:56:54 +0800 (AWST)
Message-ID: <6fd7cd57261ddf9831f57dc4c637b24e9f8982d9.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Kevin Chen
 <kevin_chen@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org,  conor+dt@kernel.org, joel@jms.id.au,
 chiawei_wang@aspeedtech.com,  linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Cc: "tomer.maimon" <tomer.maimon@nuvoton.com>
Date: Tue, 18 Feb 2025 11:26:53 +1030
In-Reply-To: <e43b5f8f-37e4-4468-b3ca-5059a5e6f3c3@kernel.org>
References: <20250217114831.3225970-1-kevin_chen@aspeedtech.com>
	 <20250217114831.3225970-4-kevin_chen@aspeedtech.com>
	 <e43b5f8f-37e4-4468-b3ca-5059a5e6f3c3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_165707_015817_71EBEC92 
X-CRM114-Status: GOOD (  10.04  )
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

T24gTW9uLCAyMDI1LTAyLTE3IGF0IDEzOjAwICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIDE3LzAyLzIwMjUgMTI6NDgsIEtldmluIENoZW4gd3JvdGU6Cj4gPiArCj4gPiAr
wqDCoMKgwqDCoMKgwqBwY2MtPm1kZXYucGFyZW50ID0gZGV2Owo+ID4gK8KgwqDCoMKgwqDCoMKg
cGNjLT5tZGV2Lm1pbm9yID0gTUlTQ19EWU5BTUlDX01JTk9SOwo+ID4gK8KgwqDCoMKgwqDCoMKg
cGNjLT5tZGV2Lm5hbWUgPSBkZXZtX2thc3ByaW50ZihkZXYsIEdGUF9LRVJORUwsICIlcyVkIiwK
PiA+IERFVklDRV9OQU1FLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBjYy0+bWRldl9pZCk7
Cj4gPiArwqDCoMKgwqDCoMKgwqBwY2MtPm1kZXYuZm9wcyA9ICZwY2NfZm9wczsKPiA+ICvCoMKg
wqDCoMKgwqDCoHJjID0gbWlzY19yZWdpc3RlcigmcGNjLT5tZGV2KTsKPiA+ICvCoMKgwqDCoMKg
wqDCoGlmIChyYykgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldl9lcnIo
ZGV2LCAiQ291bGRuJ3QgcmVnaXN0ZXIgbWlzYyBkZXZpY2VcbiIpOwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX2ZyZWVfa2ZpZm87Cj4gPiArwqDCoMKgwqDCoMKg
wqB9Cj4gCj4gWW91IGNhbm5vdCBleHBvc2UgdXNlci1zcGFjZSBpbnRlcmZhY2VzIGZyb20gU29D
IGRyaXZlcnMuIFVzZQo+IGFwcHJvcHJpYXRlIHN1YnN5c3RlbSBmb3IgdGhpcyB3aXRoIHByb3Bl
ciBBQkkgZG9jdW1lbnRhdGlvbi4KPiAKPiBTZWU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL2JjNTExOGYyLTg5ODItNDZmZi1iYzc1LWQwYzcxNDc1ZTkwOUBhcHAuZmFzdG1haWwuY29t
Lwo+IGFuZCBtb3JlIGRpc2N1c3Npb25zIG9uIExLTUwKCkZ1cnRoZXIsIGRyaXZlcnMvbWlzYy9h
c3BlZWQtbHBjLXNub29wLmMgYWxyZWFkeSBleGlzdHM6CgpodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD05
ZjRmOWFlODFkMGFmZmMxODJmNTRkZDAwMjg1ZGRiOTBlMGIzYWUxCgpLZXZpbjogRGlkIHlvdSBj
b25zaWRlciByZXdvcmtpbmcgaXQ/CgpOdXZvdG9uIGhhdmUgYSBzaW1pbGFyIGNhcGFiaWxpdHkg
aW4gdGhlaXIgTlBDTSBCTUMgU29DKHMpIHdpdGggdGhlCiJCUEMiICgiQklPUyBQT1NUIENvZGUi
IGNvbnRyb2xsZXIpLiBUaGVyZSBzaG91bGQgYmUgc29tZSBjb25zZW5zdXMgb24KdGhlIGJpbmRp
bmcgYW5kIHVzZXJzcGFjZSBpbnRlcmZhY2UuCgpBbmRyZXcK


