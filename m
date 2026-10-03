Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AC2CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4piNk7LYmRM6sh8EcC11GJZCJ3ItfW6aN3ztQuOQOY=; b=PKoWUj9g8Zk9iLwa9LiqD2SD85
	Gaj5kya3EplZpK+dpge4mgBK/beU0ha8DzfND3dWNmF7dMtpxN+YqccmX1ePr8na08SCUZqhJi7f4
	EI0H/+/JOLOJ1j8wb9xRur9G9nrb6D2fdiX6zhTk6/P1T6ei3/WPJdFKdfuEDiC4S77l1i56i9z0L
	Udj1DillvjH3T1hnCmgADyYIpnwdMB5eeK6BEQK9WcL1kjvFd4eJH4vLpEIW4Gpi//ApUgGPpNptp
	9mGy3aXjlqo+EfFMC1uUyoGz6HkCTbyRjZQJtqoFtSnqAUPtTD/bBbgjirQM1y1Ww1sMIrTJaAFlQ
	CePWx+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwhL-0000000DLKP-29of;
	Sat, 03 Oct 2026 10:10:31 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwhG-0000000DLJe-1Z22
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 10:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=H4piNk7LYmRM6sh8EcC11GJZCJ3ItfW6aN3ztQuOQOY=; b=P
	oFprmmvwu9vJ+eKHY6PH/tFT8Yb7LG+fczg13BySK6Nt4efV0uy6+tgrkThdNglH
	nvw6oZjF1INCmg7v2JAC318UZZ+fQm+8RGdEqzuV0dYtHNBkRz/mW1o45wAR3zlw
	YgopQioryuf2Lfb9faR5PT48wql2g4QJ24AcdDNujE=
Date: Sat, 3 Oct 2026 18:09:58 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "Frank Li" <Frank.li@oss.nxp.com>, "Vinod Koul" <vkoul@kernel.org>,
	"Frank Li" <Frank.Li@kernel.org>,
	"Michal Simek" <michal.simek@amd.com>,
	"Hyun Kwon" <hyun.kwon@xilinx.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH 3/3] dmaengine: xilinx: dpdma: Reserve space for a
 string terminator
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261001210021.GQ944070@killaraus.ideasonboard.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-4-yaojiale02@163.com>
 <20260926143415.GA764757@killaraus.ideasonboard.com>
 <ar7Hj-BQW7xPtjaC@lizhi-Precision-Tower-5810>
 <20261001210021.GQ944070@killaraus.ideasonboard.com>
X-NTES-SC: AL_Qu2SA/yZvUki7imcYOkdmE8Uges8WcC0svki1YJUc+4GhzHBwiABbHpeBEnt4NmlFwSNnAm9ShFy8/5qb6BZFaVVU2ewdjadkXA/7HvZFQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <7d6a7daa.140b.1a1013df0a8.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgD3n1V31MBqK0cHAA--.63684W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRYdV2rA1HYUSwAA3G
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_031026_734166_6C720F78 
X-CRM114-Status: GOOD (  19.92  )
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

QXQgMjAyNi0xMC0wMiAwNTowMDoyMSwgIkxhdXJlbnQgUGluY2hhcnQiIDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+T24gVGh1LCBPY3QgMDEsIDIwMjYgYXQgMDQ6
NTA6MjNQTSAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6Cj4+IE9uIFNhdCwgU2VwIDI2LCAyMDI2IGF0
IDA1OjM0OjE1UE0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4+ID4gT24gU2F0LCBT
ZXAgMjYsIDIwMjYgYXQgMDg6MTI6NTBQTSArMDgwMCwgSmlhbGUgWWFvIHdyb3RlOgo+PiA+ID4g
eGlsaW54X2RwZG1hX2RlYnVnZnNfd3JpdGUoKSBhbGxvY2F0ZXMgYSBidWZmZXIgb2Ygc2l6ZSBi
eXRlcywgYW5kCj4+ID4gPiBzdHJuY3B5X2Zyb21fdXNlcigpIGNhbiBmaWxsIGl0IHdpdGhvdXQg
YSB0ZXJtaW5hdGluZyBOVUwgd2hlbiB0aGUgaW5wdXQKPj4gPiA+IGhhcyBubyBOVUwgaW4gdGhl
IGNvcGllZCByYW5nZS4gc3Ryc2VwKCkgYW5kIHN0cmNhc2VjbXAoKSB0aGVuIHJlYWQKPj4gPiA+
IGJleW9uZCB0aGUgYnVmZmVyLgo+PiA+Cj4+ID4gc3RybmNweSgpIGhhcyBsb25nIGJlZW4gY29u
c2lkZXJlZCB1bnNhZmUsIGFuZCBoYXMgZmluYWxseSBiZWVuIHJlbW92ZWQKPj4gPiBmcm9tIHRo
ZSBrZXJuZWwgaW4gdjcuMi4gQSBiZXR0ZXIgZml4IHdvdWxkIGJlIHRvIHNpbWlsYXJseSByZXBs
YWNlCj4+ID4gc3RybmNweV9mcm9tX3VzZXIoKSB3aXRoIGEgc2FmZSBlcXVpdmFsZW50Lgo+PiAK
Pj4gRG8geW91IG1lYW5zIHVzZSBzdHJuZHVwX3VzZXIoKT8KPgo+SSB3YXMgdGhpbmtpbmcgYWJv
dXQgYWRkaW5nIGEgc3Ryc2NweV91c2VyKCksIGJ1dCBhIGR1cCB2ZXJzaW9uIGNvdWxkCj5wb3Nz
aWJseSBiZSBpbnRlcmVzdGluZyB0b28gaWYgdGhlcmUgYXJlIGVub3VnaCB1c2VycyB0aGF0IGNh
bGwKPmtbem1dYWxsb2MgKyBzdHJuY3B5X2Zyb21fdXNlci4KClRoYW5rcyBmb3IgYWxsIHJldmll
d3MsIGhvdyBhYm91dCB0aGlzIG9uZT8KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYx
MDAzMDk1OTIyLjU3NTM1MC0xLXlhb2ppYWxlMDJAMTYzLmNvbS8KPgo+PiA+ID4gQWxsb2NhdGUg
YW4gZXh0cmEgYnl0ZSBhbmQga2VlcCB0aGF0IGJ5dGUgemVyby1pbml0aWFsaXplZCwgc28gdGhl
IGlucHV0Cj4+ID4gPiBjb3BpZWQgcmVtYWlucyB1bmNoYW5nZWQgYW5kIHRoZSBidWZmZXIgaXMg
YWx3YXlzIHRlcm1pbmF0ZWQuCj4+ID4gPgo+PiA+ID4gRml4ZXM6IDFkMjIwNDM1Y2FiMyAoImRt
YWVuZ2luZTogeGlsaW54OiBkcGRtYTogQWRkIGRlYnVnZnMgc3VwcG9ydCIpCj4+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4KPj4gPiA+IC0tLQo+PiA+
ID4gIGRyaXZlcnMvZG1hL3hpbGlueC94aWxpbnhfZHBkbWEuYyB8IDIgKy0KPj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4gPiA+Cj4+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEveGlsaW54L3hpbGlueF9kcGRtYS5jIGIvZHJpdmVycy9k
bWEveGlsaW54L3hpbGlueF9kcGRtYS5jCj4+ID4gPiBpbmRleCBkOWEzNTQyYzQ1MzEuLmI2MWVm
MzA2MmQ4NCAxMDA2NDQKPj4gPiA+IC0tLSBhL2RyaXZlcnMvZG1hL3hpbGlueC94aWxpbnhfZHBk
bWEuYwo+PiA+ID4gKysrIGIvZHJpdmVycy9kbWEveGlsaW54L3hpbGlueF9kcGRtYS5jCj4+ID4g
PiBAQCAtNDEwLDcgKzQxMCw3IEBAIHN0YXRpYyBzc2l6ZV90IHhpbGlueF9kcGRtYV9kZWJ1Z2Zz
X3dyaXRlKHN0cnVjdCBmaWxlICpmLAo+PiA+ID4gIAlpZiAoZHBkbWFfZGVidWdmcy50ZXN0Y2Fz
ZSAhPSBEUERNQV9UQ19OT05FKQo+PiA+ID4gIAkJcmV0dXJuIC1FQlVTWTsKPj4gPiA+Cj4+ID4g
PiAtCWtlcm5fYnVmZiA9IGt6YWxsb2Moc2l6ZSwgR0ZQX0tFUk5FTCk7Cj4+ID4gPiArCWtlcm5f
YnVmZiA9IGt6YWxsb2Moc2l6ZSArIDEsIEdGUF9LRVJORUwpOwo+PiA+ID4gIAlpZiAoIWtlcm5f
YnVmZikKPj4gPiA+ICAJCXJldHVybiAtRU5PTUVNOwo+PiA+ID4gIAlrZXJuX2J1ZmZfc3RhcnQg
PSBrZXJuX2J1ZmY7Cj4KPi0tIAo+UmVnYXJkcywKPgo+TGF1cmVudCBQaW5jaGFydAo=

