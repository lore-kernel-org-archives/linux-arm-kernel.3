Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62684D6CFB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 03:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tWzlg4noYB1SecXcRQgDvZBvbUbx3Ptw7Th/eHLv3M=; b=YGBKUTD/r+ju6ZYFKhR1vR4Wbk
	dFIODDXzmf3ri0HZTzteMEbdcdalKBHSCWtOwlF/Cb+AJqd4nIrpu06uyUwWbWm3NcpjJgbuq5zM/
	uvQIwlXJcNNZqjVN0kvQcbZgkIdN7O+oA6A8jMY1iHW+0oSH35DfTLAycUOc4afYs/ttldih+IW4e
	KwpDPyjJVPyAn9FY1CGmqF0QnglhuE2Ax+7VT3/Z30R2oJl2iUgzq+et4l1I4vMnOKooogxiGlW0G
	P1VTejv5hqvVsAjcBJXgX+BD/hbx4RQThm/hF23iHSnaZatVyDILhJVy96zba/XyhV+PLF2RpLouX
	19kuHXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7PZ-000000084PD-10Ry;
	Fri, 23 Jan 2026 03:00:37 +0000
Received: from azure-sdnproxy.icoremail.net ([4.193.249.245])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7PV-000000084OW-3Aej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 03:00:36 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 23 Jan 2026 11:00:16 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 23 Jan 2026 11:00:16 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgD3SmxA5HJpFPMEAA--.1437W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEQDGlyUYERQgABsG
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_190034_305172_9C37C9DB 
X-CRM114-Status: UNSURE (   7.64  )
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

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQW5kcmV3IEx1bm4iIDxh
bmRyZXdAbHVubi5jaD4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wMS0yMiAyMTozMjozNCAo5pif5pyf
5ZubKQo+IOaUtuS7tuS6ujog5p2O5b+XIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPgo+IOaK
hOmAgTogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGFuZHJldytuZXRkZXZAbHVubi5jaCwg
ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3Jn
LCByb2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9y
ZywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIHJtaytrZXJuZWxA
YXJtbGludXgub3JnLnVrLCBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
LCBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1pbkBlc3dpbmNvbXB1
dGluZy5jb20sIHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbSwgd2Vpc2hhbmdqdWFuQGVz
d2luY29tcHV0aW5nLmNvbQo+IOS4u+mimDogUmU6IFJlOiBbUEFUQ0ggdjEgMS8yXSBkdC1iaW5k
aW5nczogZXRoZXJuZXQ6IGVzd2luOiBhZGQgY2xvY2sgc2FtcGxpbmcgY29udHJvbAo+IAo+ID4g
T24gRUlDNzcwMCwgUlhDIGFuZCBSWEQgZXhwZXJpZW5jZSBhbiBpbnRlcm5hbCBza2V3IGJlZm9y
ZSByZWFjaGluZyB0aGUKPiA+IE1BQy4gQXQgaGlnaCBzcGVlZCwgdGhpcyBjYW4gc2hpZnQgdGhl
IGVmZmVjdGl2ZSBzYW1wbGluZyBwb2ludCBieQo+ID4gYXBwcm94aW1hdGVseSBoYWxmIGEgY3lj
bGUsIGNhdXNpbmcgdGhlIE1BQyB0byBzYW1wbGUgdGhlIHdyb25nIG5pYmJsZQo+ID4gb24gZWFj
aCBlZGdlLgo+IAo+IFlvdSBzYXkgaW50ZXJuYWwuIFNvIHRoZSBza2V3IGlzIGZpeGVkLCBpdCBp
cyBhIHByb3BlcnR5IG9mIHRoZQo+IHNpbGljb24/IElmIHNvLCB3aHkgYSBEVCBwcm9wZXJ0eT8g
V2h5IG5vdCBqdXN0IGhhcmQgY29kZSBpdCBpbiB0aGUKPiBkcml2ZXI/IFNpbmNlIGl0IGlzIGlu
dGVybmFsLCBkaWZmZXJlbnQgYm9hcmRzIHNob3VsZCBub3QgbmVlZCBpdCBzZXQKPiBkaWZmZXJl
bnRseT8KPiAKVGhhbmtzIGZvciB0aGUgcXVlc3Rpb24uCgpFSUM3NzAwIGhhcyB0d28gRXRoZXJu
ZXQgTUFDcy4gT25seSBldGgxIGhhcyB0aGlzIGludGVybmFsIFJYQy9SWEQgc2tldywKZXRoMCBk
b2VzIG5vdC4KClNvIHRoaXMgaXMgbm90IGEgY2hpcC13aWRlIGNvbnN0YW50IHRoYXQgY2FuIGJl
IGhhcmRjb2RlZCBpbiB0aGUgZHJpdmVyLgpXZSBuZWVkIGEgd2F5IHRvIGRpc3Rpbmd1aXNoIHRo
ZSB0d28gTUFDIGluc3RhbmNlcywgd2hpY2ggaXMgd2h5IHRoaXMgaXMKZGVzY3JpYmVkIHBlci1w
b3J0IGluIERUUy4KCi0tCkxpIFpoaQo=

