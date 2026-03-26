Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF72109E52B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 03:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OoD/586wfscgcCERlMV9YK0cmcINDrZLfN+kCmWW3FE=; b=GlIKHAR8Fn3bGwFIhRz13o5nEB
	mZuEWrudkkNyFq4k9htwuPHlE7UbqGIhooxi+RM4VsbBRn84X8ZInM453rSkJKuAD3mdJy0vpggs3
	oADh4pg5eXktgvh/H5aYDCpn31oBSxEw+gsKYjKrRDIo9XmDR5KmxG6EQw6bFlfz93C5EdUOvspPX
	QjF/M57ryx35LrXhIyDpO/wS3ANtQjtKCrLRgTZHHEvozOBOp1L0TQlLOCFgIatXEVMbycpl4SvxC
	APCmT61JTYxKWeWgHnzHTTxE2i+M/HQ/4j+k//Ji1E4nOEzYo3w7cRv1tjFlJO/B7c2J+Ut5OuN4V
	DW/M9kUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5bC7-00000004cbo-1hLk;
	Thu, 26 Mar 2026 03:15:39 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5bC1-00000004cbH-0dTC;
	Thu, 26 Mar 2026 03:15:35 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Thu, 26 Mar 2026 11:14:45 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Thu, 26 Mar 2026 11:14:45 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Simon Horman" <horms@kernel.org>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH net-next v5 3/3] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260325180330.GL111839@horms.kernel.org>
References: <20260324073017.376-1-lizhi2@eswincomputing.com>
 <20260324073408.439-1-lizhi2@eswincomputing.com>
 <20260325180330.GL111839@horms.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2a12c839.5e64.19d28232537.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDHaXOlpMRpqdYLAA--.3593W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgERDGnEDooA3QADsp
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_201533_569261_DACF981D 
X-CRM114-Status: UNSURE (   9.18  )
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

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiU2ltb24gSG9ybWFuIiA8
aG9ybXNAa2VybmVsLm9yZz4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wMy0yNiAwMjowMzozMCAo5pif
5pyf5ZubKQo+IOaUtuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTog
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGFuZHJldytuZXRkZXZAbHVubi5jaCwgZGF2ZW1A
ZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3JnLCByb2Jo
QGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0
ZGV2QHZnZXIua2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5zdG0zMkBn
bWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGlu
dXgub3JnLnVrLCBwandAa2VybmVsLm9yZywgcGFsbWVyQGRhYmJlbHQuY29tLCBhb3VAZWVjcy5i
ZXJrZWxleS5lZHUsIGFsZXhAZ2hpdGkuZnIsIGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcsIGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20sIGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywg
bWF4aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20sIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20s
IGxpbm1pbkBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNv
bSwgcHJpdGVzaC5wYXRlbEBlaW5mb2NoaXBzLmNvbSwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0
aW5nLmNvbQo+IOS4u+mimDogUmU6IFtQQVRDSCBuZXQtbmV4dCB2NSAzLzNdIHJpc2N2OiBkdHM6
IGVzd2luOiBlaWM3NzAwLWhpZml2ZS1wcmVtaWVyLXA1NTA6IGVuYWJsZSBFdGhlcm5ldCBjb250
cm9sbGVyCj4gCj4gT24gVHVlLCBNYXIgMjQsIDIwMjYgYXQgMDM6MzQ6MDhQTSArMDgwMCwgbGl6
aGkyQGVzd2luY29tcHV0aW5nLmNvbSB3cm90ZToKPiA+IEZyb206IFpoaSBMaSA8bGl6aGkyQGVz
d2luY29tcHV0aW5nLmNvbT4KPiA+IAo+ID4gRW5hYmxlIHRoZSBvbi1ib2FyZCBHaWdhYml0IEV0
aGVybmV0IGNvbnRyb2xsZXIgb24gdGhlCj4gPiBIaUZpdmUgUHJlbWllciBQNTUwIGRldmVsb3Bt
ZW50IGJvYXJkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGkgTGkgPGxpemhpMkBlc3dpbmNv
bXB1dGluZy5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vZHRzL2Vzd2luL2VpYzc3MDAtaGlmaXZlLXBy
ZW1pZXItcDU1MC5kdHMgfCA0MiArKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L2Vzd2luL2VpYzc3MDAuZHRzaSAgICAgICAgfCA2NiArKysrKysrKysrKysrKysrKysrCj4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxMDggaW5zZXJ0aW9ucygrKQo+IAo+IFVuZm9ydHVuYXRlbHkgdGhp
cyBkb2VzIG5vdCBjb21waWxlOgo+IAo+ICQgQVJDSD1yaXNjdiBtYWtlIGFsbG1vZGNvbmZpZyBk
dGJzCj4gLi4uCj4gICBEVEMgICAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvZXN3aW4vZWljNzcwMC1o
aWZpdmUtcHJlbWllci1wNTUwLmR0Ygo+IGFyY2gvcmlzY3YvYm9vdC9kdHMvZXN3aW4vZWljNzcw
MC5kdHNpOjMwMC4yOC0zMzAuNTogRVJST1IgKHBoYW5kbGVfcmVmZXJlbmNlcyk6IC9zb2MvZXRo
ZXJuZXRANTA0MDAwMDA6IFJlZmVyZW5jZSB0byBub24tZXhpc3RlbnQgbm9kZSBvciBsYWJlbCAi
Y2xrIgo+IC4uLgo+IAo+IC0tIAo+IHB3LWJvdDogY2hhbmdlcy1yZXF1ZXN0ZWQKCkhpIFNpbW9u
LAoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCllvdSdyZSByaWdodCwgdGhpcyBidWlsZCBmYWls
dXJlIGlzIGR1ZSB0byBhbiBpbnZhbGlkIGNsb2NrIHJlZmVyZW5jZQooImNsayIpIGluIHRoZSBF
dGhlcm5ldCBub2RlLCB3aGljaCBkb2VzIG5vdCBjb3JyZXNwb25kIHRvIGFuIGV4aXN0aW5nCmNs
b2NrIHByb3ZpZGVyIGxhYmVsIGluIHRoZSBjdXJyZW50IERUUy4KCkZvciBjb250ZXh0LCB0aGlz
IHdhcyBkaXNjdXNzZWQgZHVyaW5nIGFuIGVhcmxpZXIgcmV2aXNpb246Cmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvNWRlYThjZTAuNDQzNS4xOWM0NzEyMzFmNS5Db3JlbWFpbC5saXpoaTJA
ZXN3aW5jb21wdXRpbmcuY29tLwoKVGhlIEVJQzc3MDAgY2xvY2sgY29udHJvbGxlciBzdXBwb3J0
IGhhcyBzaW5jZSBiZWVuIGFwcGxpZWQsIHNvIEkgd2lsbAp1cGRhdGUgdGhlIERUUyB0byByZWZl
cmVuY2UgdGhlIGNvcnJlY3QgY2xvY2sgcHJvdmlkZXIgYW5kIGVuc3VyZSB0aGUKYnVpbGQgcGFz
c2VzIGNsZWFubHkuCgpJIHdpbGwgZml4IHRoaXMgaW4gdGhlIG5leHQgcmV2aXNpb24gKHY2KS4K
ClRoYW5rcywKWmhpIExpCg==

