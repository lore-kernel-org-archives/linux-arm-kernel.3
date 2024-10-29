Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38BFD5B854
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 01:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwv3lrNEiBfplVrUYpxy6EF1KmIplolyImTr8ZDkzZk=; b=A6ZoaD0dGpRj46AEp0AVUpWpej
	XlVUQXlnP//52C3GeLqplsyPFNRDAsq1pikJbrYgGhiYkOEzUZ8K1YO8O1o/Zkty8fhACx/inoJdS
	455jmF4Q0c0ihOZhVeYSsuVR6OenFT5RAp/rkgkPreTUwEcDjO7KPzCIlL8kOwWaHyBTBNr5JS8SK
	K8s7EnlOIylYUq95WcGvsQchAT/fuXT/rMZ2bsuVChSc/HYEQjItofHsCNAy4dpizsupEqXk+xsrB
	JCXOVBRtvyGS27wwzfvkxkfLAu+JHcfEUz8FZeRywh3+z+rkXrSoXoRF4Jnc+nhYFHPns/qicQQFc
	cTx3XqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5bGN-0000000Ct50-19Ad;
	Tue, 29 Oct 2024 01:43:15 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5bEl-0000000Csoh-2WEb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 01:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=2Vz+MeuTf+UwEcWPoU/k4NxqWMXkbetMObceN4ZkTMo=; b=H
	EdXs86zizvlWzeNr80qP94i4Zx27fwSuBCzqqU01CMJXLEpEhty3zw9opZdog1Ql
	iUw72btB2KCtE6PFVrC1WZl/q0Pwgylaqou/AUop8UBS1S7ByH/bt7KLuTDaCJg2
	O/PcR/9kDEPaSum24SyNHQU7ToOCs50Wr8EzJM3X9E=
Received: from huanglei814$163.com ( [111.48.58.10] ) by
 ajax-webmail-wmsvr-40-136 (Coremail) ; Tue, 29 Oct 2024 09:41:08 +0800
 (CST)
X-Originating-IP: [111.48.58.10]
Date: Tue, 29 Oct 2024 09:41:08 +0800 (CST)
From: huanglei  <huanglei814@163.com>
To: "Will Deacon" <will@kernel.org>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, huanglei <huanglei@kylinos.cn>
Subject: Re:Re: [PATCH] arm64/Kconfig: introduce GENERIC_ISA_DMA
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20241028150544.GA2445@willie-the-truck>
References: <20241025011641.4858-1-huanglei814@163.com>
 <20241028150544.GA2445@willie-the-truck>
X-NTES-SC: AL_Qu2YAv2duUgt7iGRZekfm0cTguY+X8W4uv0h2IVSPJ5+jCnr6A8xUXBMM3bR2dCOEA2RrheYWxxjz/ZzRpRxWJIZvffIL7e7tfTH7+SGJGUMNQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <26ed8fbb.1809.192d5ef13e5.Coremail.huanglei814@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iCgvCgDnD740PSBnPJwZAA--.61000W
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/1tbiLBSG9mcfmUrE3QAEs+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_184136_017303_06F562B8 
X-CRM114-Status: GOOD (  10.27  )
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

CiAgICBFdmVuIGlmIE1BWF9TTUFfQ0FOTkVMUyBpcyBub3QgZGVmaW5lZCwgYXMgbG9uZyBhcyBH
RU5FVElDLVNJQV9ETUEgaXMgZW5hYmxlZKOsIHJlcXVlc3Rfcm1hL2ZyZWVfcm1hICBmdW5jdGlv
biB3aWxsIGFsc28gYmUgZXhwb3J0ZWQsIGFuZCBvdGhlciBtb2R1bGVzIHVzaW5nIHRoZXNlIHR3
byBpbnRlcmZhY2VzIHdpbGwgbm90IGVuY291bnRlciBsaW5rIGVycm9ycy4KCiAgICBJIGRvbid0
IGtub3cgd2h5IG90aGVycyBoYXZlbid0IG5vdGljZWQsIGJ1dCBJIGRpc2NvdmVyZWQgaXQgd2hl
biBkZWJ1Z2dpbmcgcGNpZSBwYXJhbGxlbCBwb3J0IGRyaXZlcnMuICBBbmQgdGhlIGFybS9LY29u
ZmlnICBoYXMgYmVlbiBhcm91bmQgZm9yIGEgbG9uZyB0aW1lLgoKCkJlc3QgcmVnYXJkcyEKCkF0
IDIwMjQtMTAtMjggMjI6MDU6NDUsICJXaWxsIERlYWNvbiIgPHdpbGxAa2VybmVsLm9yZz4gd3Jv
dGU6Cj5PbiBGcmksIE9jdCAyNSwgMjAyNCBhdCAwOToxNjo0MUFNICswODAwLCBodWFuZ2xlaTgx
NCB3cm90ZToKPj4gRnJvbTogaHVhbmdsZWkgPGh1YW5nbGVpQGt5bGlub3MuY24+Cj4+IAo+PiBF
bmFibGUgR0VORVJJQ19JU0FfRE1BIGZlYXR1cmUgb24gYXJtNjQgcGxhdGZvcm0sCj4+IHRodXMs
IHJlcXVlc3RfZG1hIGFuZCBmcmVlX2RtYSBpbnRlcmZhY2UgY2FuIGJlIGV4cG9ydC4KPj4gYW5k
IGRyaXZlciBtb2R1bGVzIGNhbiB1c2UgdGhlIHRoaXMgaW50ZXJmYWNlcyBvbiBhcm02NAo+PiBw
bGF0Zm9ybS4KPj4gCj4+IEN1cnJlbnRseSwgbWFueSBwY2llIHBhcmFsbGVsIHBvcnQgZHJpdmVy
cyBzdGlsbCB1c2UgdGhlc2UKPj4gaW50ZXJmYWNlcyB3aGVuIHBvcnRlZCB0byBhcm02NCBwbGF0
Zm9ybS4KPgo+V2h5IGhhcyBpdCB0YWtlbiBzbyBsb25nIGZvciBhbnlib2R5IHRvIG5vdGljZT8K
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBodWFuZ2xlaSA8aHVhbmdsZWlAa3lsaW5vcy5jbj4KPj4gLS0t
Cj4+ICBhcmNoL2FybTY0L0tjb25maWcgfCAzICsrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvS2NvbmZpZyBiL2FyY2gv
YXJtNjQvS2NvbmZpZwo+PiBpbmRleCBmZDlkZjZkY2M1OTMuLjk4NmViMjUxZjY4ZiAxMDA2NDQK
Pj4gLS0tIGEvYXJjaC9hcm02NC9LY29uZmlnCj4+ICsrKyBiL2FyY2gvYXJtNjQvS2NvbmZpZwo+
PiBAQCAtMzY3LDYgKzM2Nyw5IEBAIGNvbmZpZyBHRU5FUklDX0NTVU0KPj4gIGNvbmZpZyBHRU5F
UklDX0NBTElCUkFURV9ERUxBWQo+PiAgCWRlZl9ib29sIHkKPj4gIAo+PiArY29uZmlnIEdFTkVS
SUNfSVNBX0RNQQo+PiArCWRlZl9ib29sIHkKPj4gKwo+Cj5Eb2VzIHRoaXMgYWN0dWFsbHkgZG8g
YW55dGhpbmcgd2l0aG91dCBNQVhfRE1BX0NIQU5ORUxTIGRlZmluZWQ/Cj4KPldpbGwK

