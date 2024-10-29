Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7495D5B840
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 01:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mgbkhyg9SzRwO328g2sh8WEP0WZ2JpVb/UKnB5toi5U=; b=RJu5ItBog4/aMFnylelNbjciD0
	BPCQfZev1j3j/1NzGibba4kD9IbL7ZehvC+7hsqK+JLlf0F5k8QROt0jwqzClLHTRH3KDBqh28Ea6
	T07ImWNJN7+pAoop1uY0ZW0C08ijqLQMuvCMmuD4epsbI9JRkF5oc+he3GlpOnMXuF15HdYHp/vwT
	TTczU/tbEj5HheONP/v0NGeaofSPtiUNQnQTk9UoegPgZ0HMc9O5VN9hUiVS2fXuz4wkYRzdS67y0
	UXktaB6WNI6cMxNHoNqo1A5gOQgXk6fhqz4y2C1C40YbJS/PYM3pXHb21vXEvq+ShgW2KyK/2PIyo
	0kHKBy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5bWL-0000000Cuji-2b1W;
	Tue, 29 Oct 2024 01:59:45 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5bUj-0000000CuXS-2pvo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 01:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=RnxTHzDdk8US5iJPkSYszsHCdC7XWQuzUMfU45N1Fgo=; b=W
	O/nQmSlz6xXHvDCXVH4ta3teWIECLq8aJB3BjMdplaRQ2cS1cqAH6UOLEK/qr8Qy
	pQlSDafCrbglLN9jSlX2dHoLOC91xE93X0LgPB3usWNnd2ivFKka+GCnpz/BS59H
	wXkgMIhbzoLOXtTVEwB0pLT5JTBMytjOJOi/cHsqT4=
Received: from huanglei814$163.com ( [111.48.58.10] ) by
 ajax-webmail-wmsvr-40-136 (Coremail) ; Tue, 29 Oct 2024 09:57:51 +0800
 (CST)
X-Originating-IP: [111.48.58.10]
Date: Tue, 29 Oct 2024 09:57:51 +0800 (CST)
From: huanglei  <huanglei814@163.com>
To: "Will Deacon" <will@kernel.org>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, huanglei <huanglei@kylinos.cn>
Subject: Re:Re:Re: [PATCH] arm64/Kconfig: introduce GENERIC_ISA_DMA
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <26ed8fbb.1809.192d5ef13e5.Coremail.huanglei814@163.com>
References: <20241025011641.4858-1-huanglei814@163.com>
 <20241028150544.GA2445@willie-the-truck>
 <26ed8fbb.1809.192d5ef13e5.Coremail.huanglei814@163.com>
X-NTES-SC: AL_Qu2YAv2duEgs5yKRbOkfm0cTguY+X8W4uv0h2IVSPJ5+jCnr6A8xUXBMM3bR2dCOEA2RrheYWxxjz/ZzRpRxWJIZl2Em6cGsLGHMIofV+9aZzQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <7f60ff1f.1d51.192d5fe6248.Coremail.huanglei814@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iCgvCgDXHyMfQSBnoqMZAA--.60957W
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/1tbiLBSG9mcfmUrE3QAGs8
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_185806_056391_EB788BC0 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

ICAgVGhlcmUgd2FzIGEgc2xpZ2h0IHdvcmQgc3BlbGxpbmcgZXJyb3IgaW4gdGhlIHByZXZpb3Vz
IHJlcGx5o6wgTm93IGNvcnJlY3QgaXQuCgogRXZlbiBpZiBNQVhfRE1BX0NIQU5ORUxTIGlzIG5v
dCBkZWZpbmVkLCBhcyBsb25nIGFzIEdFTkVSSUNfSVNBX0RNQSBpcyBlbmFibGVko6wgcmVxdWVz
dF9kbWEvZnJlZV9kbWEgIGZ1bmN0aW9uIHdpbGwgYWxzbyBiZSBleHBvcnRlZCwgYW5kIG90aGVy
IG1vZHVsZXMgdXNpbmcgdGhlc2UgdHdvIGludGVyZmFjZXMgd2lsbCBub3QgZW5jb3VudGVyIGxp
bmsgZXJyb3JzLgpJIGRvbid0IGtub3cgd2h5IG90aGVycyBoYXZlbid0IG5vdGljZWQsIGJ1dCBJ
IGRpc2NvdmVyZWQgaXQgd2hlbiBkZWJ1Z2dpbmcgcGNpZSBwYXJhbGxlbCBwb3J0IGRyaXZlcnMu
ICBBbmQgdGhlIGFybS9LY29uZmlnICBoYXMgYmVlbiBhcm91bmQgZm9yIGEgbG9uZyB0aW1lLgoK
QmVzdCByZWdhcmRzIQoKPkF0IDIwMjQtMTAtMjggMjI6MDU6NDUsICJXaWxsIERlYWNvbiIgPHdp
bGxAa2VybmVsLm9yZz4gd3JvdGU6Cj4+T24gRnJpLCBPY3QgMjUsIDIwMjQgYXQgMDk6MTY6NDFB
TSArMDgwMCwgaHVhbmdsZWk4MTQgd3JvdGU6Cj4+PiBGcm9tOiBodWFuZ2xlaSA8aHVhbmdsZWlA
a3lsaW5vcy5jbj4KPj4+IAo+Pj4gRW5hYmxlIEdFTkVSSUNfSVNBX0RNQSBmZWF0dXJlIG9uIGFy
bTY0IHBsYXRmb3JtLAo+Pj4gdGh1cywgcmVxdWVzdF9kbWEgYW5kIGZyZWVfZG1hIGludGVyZmFj
ZSBjYW4gYmUgZXhwb3J0Lgo+Pj4gYW5kIGRyaXZlciBtb2R1bGVzIGNhbiB1c2UgdGhlIHRoaXMg
aW50ZXJmYWNlcyBvbiBhcm02NAo+Pj4gcGxhdGZvcm0uCj4+PiAKPj4+IEN1cnJlbnRseSwgbWFu
eSBwY2llIHBhcmFsbGVsIHBvcnQgZHJpdmVycyBzdGlsbCB1c2UgdGhlc2UKPj4+IGludGVyZmFj
ZXMgd2hlbiBwb3J0ZWQgdG8gYXJtNjQgcGxhdGZvcm0uCj4+Cj4+V2h5IGhhcyBpdCB0YWtlbiBz
byBsb25nIGZvciBhbnlib2R5IHRvIG5vdGljZT8KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IGh1YW5n
bGVpIDxodWFuZ2xlaUBreWxpbm9zLmNuPgo+Pj4gLS0tCj4+PiAgYXJjaC9hcm02NC9LY29uZmln
IHwgMyArKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+PiAKPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L0tjb25maWcgYi9hcmNoL2FybTY0L0tjb25maWcKPj4+IGlu
ZGV4IGZkOWRmNmRjYzU5My4uOTg2ZWIyNTFmNjhmIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02
NC9LY29uZmlnCj4+PiArKysgYi9hcmNoL2FybTY0L0tjb25maWcKPj4+IEBAIC0zNjcsNiArMzY3
LDkgQEAgY29uZmlnIEdFTkVSSUNfQ1NVTQo+Pj4gIGNvbmZpZyBHRU5FUklDX0NBTElCUkFURV9E
RUxBWQo+Pj4gIAlkZWZfYm9vbCB5Cj4+PiAgCj4+PiArY29uZmlnIEdFTkVSSUNfSVNBX0RNQQo+
Pj4gKwlkZWZfYm9vbCB5Cj4+PiArCj4+Cj4+RG9lcyB0aGlzIGFjdHVhbGx5IGRvIGFueXRoaW5n
IHdpdGhvdXQgTUFYX0RNQV9DSEFOTkVMUyBkZWZpbmVkPwo+Pgo+PldpbGwK

