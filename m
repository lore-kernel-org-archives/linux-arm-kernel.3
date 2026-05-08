Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61721CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 05:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0W/wBVAObQwwCcBVl6ZH+DTU1kffvaLDQmTAhORcktw=; b=WeHhLW+wwua2x2OOel0IkQ/XkG
	aJz2UcO/lfhkT7FkQCky+sWNmMuRkJmcrpR5PExhvi+Zv///dUg8NUo37dQVg4TpCam4qf8r5zNnp
	OHzWvfYaKk2i/qlz/Sm28ckdTmm6dpt2u+Dlc+Vqi7bRBwDzryFkncfnjBX0HXqvwbMaDBrApXfaz
	M0Unz46V3eDFTj6FOc07gGLucHD+RakZUiNyhLKKcoJpx3x5K9zXMQYb6oB8AmvHrLuAWjjKcuWpY
	bjrBKnsRRc9gc/r0rzICMVGcC6+F3Zi3HR+742t2JFPvl9RLMn2jNbVZerPC0lug1rH9DJ0bnSzS7
	BGpkgLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLE48-00000005fUn-37h8;
	Fri, 08 May 2026 05:48:00 +0000
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net ([209.97.182.222])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLE43-00000005fTn-33vf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 05:47:59 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 8 May 2026 13:47:31 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 8 May 2026 13:47:31 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH net v1 1/2] dt-bindings: ethernet: eswin: refine
 delay model and HSP register description
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <2436c6e9-4aad-4ffd-9fef-0cbbe38dc66d@lunn.ch>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083136.175-1-lizhi2@eswincomputing.com>
 <2436c6e9-4aad-4ffd-9fef-0cbbe38dc66d@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1b38bce2.7d07.19e06207806.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgBn_HDzeP1p2NgXAA--.6342W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEBDGn8vxER1gACsw
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_224756_029627_603DE891 
X-CRM114-Status: UNSURE (   7.14  )
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
bmRyZXdAbHVubi5jaD4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wNS0wNyAyMDoyOToxMCAo5pif5pyf
5ZubKQo+IOaUtuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTogYW5k
cmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpldEBnb29nbGUu
Y29tLCBrdWJhQGtlcm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCByb2JoQGtlcm5lbC5vcmcs
IGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZywgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcsIG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9z
cy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrLCBtYXhpbWUuY2hldmFsbGllckBi
b290bGluLmNvbSwgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBuaW5neXVAZXN3aW5jb21wdXRpbmcu
Y29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlw
cy5jb20sIHByaXRlc2gucGF0ZWxAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBlc3dpbmNv
bXB1dGluZy5jb20KPiDkuLvpopg6IFJlOiBbUEFUQ0ggbmV0IHYxIDEvMl0gZHQtYmluZGluZ3M6
IGV0aGVybmV0OiBlc3dpbjogcmVmaW5lIGRlbGF5IG1vZGVsIGFuZCBIU1AgcmVnaXN0ZXIgZGVz
Y3JpcHRpb24KPiAKPiA+ICAgICAgZXRoZXJuZXRANTA0MDAwMDAgewo+ID4gICAgICAgICAgY29t
cGF0aWJsZSA9ICJlc3dpbixlaWM3NzAwLXFvcy1ldGgiLCAic25wcyxkd21hYy01LjIwIjsKPiA+
ICAgICAgICAgIHJlZyA9IDwweDUwNDAwMDAwIDB4MTAwMDA+Owo+ID4gLSAgICAgICAgY2xvY2tz
ID0gPCZkMF9jbG9jayAxODY+LCA8JmQwX2Nsb2NrIDE3MT4sIDwmZDBfY2xvY2sgNDA+LAo+ID4g
LSAgICAgICAgICAgICAgICA8JmQwX2Nsb2NrIDE5Mz47Cj4gPiAtICAgICAgICBjbG9jay1uYW1l
cyA9ICJheGkiLCAiY2ZnIiwgInN0bW1hY2V0aCIsICJ0eCI7Cj4gPiAgICAgICAgICBpbnRlcnJ1
cHQtcGFyZW50ID0gPCZwbGljPjsKPiA+ICAgICAgICAgIGludGVycnVwdHMgPSA8NjE+Owo+ID4g
ICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gIm1hY2lycSI7Cj4gPiAtICAgICAgICBwaHktbW9k
ZSA9ICJyZ21paS1pZCI7Cj4gPiAtICAgICAgICBwaHktaGFuZGxlID0gPCZwaHkwPjsKPiA+ICsg
ICAgICAgIGNsb2NrcyA9IDwmZDBfY2xvY2sgMTg2PiwgPCZkMF9jbG9jayAxNzE+LCA8JmQwX2Ns
b2NrIDQwPiwKPiA+ICsgICAgICAgICAgICAgICAgPCZkMF9jbG9jayAxOTM+Owo+ID4gKyAgICAg
ICAgY2xvY2stbmFtZXMgPSAiYXhpIiwgImNmZyIsICJzdG1tYWNldGgiLCAidHgiOwo+IAo+IFBs
ZWFzZSBkb24ndCBtb3ZlIHRoZSBjbG9ja3MgYXJvdW5kLCBzaW5jZSB0aGV5IGhhdmUgbm90aGlu
ZyB0byBkbwo+IHdpdGggUkdNSUkgZGVsYXlzLgo+IAo+IAo+ID4gICAgICAgICAgcmVzZXRzID0g
PCZyZXNldCA5NT47Cj4gPiAgICAgICAgICByZXNldC1uYW1lcyA9ICJzdG1tYWNldGgiOwo+ID4g
LSAgICAgICAgcngtaW50ZXJuYWwtZGVsYXktcHMgPSA8MjAwPjsKPiA+IC0gICAgICAgIHR4LWlu
dGVybmFsLWRlbGF5LXBzID0gPDIwMD47Cj4gPiAtICAgICAgICBlc3dpbixoc3Atc3AtY3NyID0g
PCZoc3Bfc3BfY3NyIDB4MTAwIDB4MTA4IDB4MTE4PjsKPiA+IC0gICAgICAgIHNucHMsYXhpLWNv
bmZpZyA9IDwmc3RtbWFjX2F4aV9zZXR1cD47Cj4gPiArICAgICAgICBlc3dpbixoc3Atc3AtY3Ny
ID0gPCZoc3Bfc3BfY3NyIDB4MTAwIDB4MTA4IDB4MTE4IDB4MTE0IDB4MTFjPjsKPiA+ICsgICAg
ICAgIHBoeS1oYW5kbGUgPSA8JnBoeTA+Owo+ID4gKyAgICAgICAgcGh5LW1vZGUgPSAicmdtaWkt
aWQiOwo+ID4gICAgICAgICAgc25wcyxhYWw7Cj4gPiAgICAgICAgICBzbnBzLGZpeGVkLWJ1cnN0
Owo+ID4gICAgICAgICAgc25wcyx0c287Cj4gPiAtICAgICAgICBzdG1tYWNfYXhpX3NldHVwOiBz
dG1tYWMtYXhpLWNvbmZpZyB7Cj4gPiArICAgICAgICBzbnBzLGF4aS1jb25maWcgPSA8JnN0bW1h
Y19heGlfc2V0dXBfZ21hYzA+Owo+ID4gKwo+ID4gKyAgICAgICAgc3RtbWFjX2F4aV9zZXR1cF9n
bWFjMDogc3RtbWFjLWF4aS1jb25maWcgewo+IAo+IEFuZCB3aGF0IGRvIHRoZXNlIGNoYW5nZXMg
aGF2ZSB0byBkbyB3aXRoIFJHTUlJIGRlbGF5cz8KPiAKCllvdSdyZSByaWdodCwgdGhvc2UgdW5y
ZWxhdGVkIGV4YW1wbGUgY2hhbmdlcyBzaG91bGQgbm90IGJlIG1peGVkIGludG8gdGhlCmZpeC1y
ZWxhdGVkIGJpbmRpbmcgdXBkYXRlLgoKSSB3aWxsIGxpbWl0IHRoZSBiaW5kaW5nIGNoYW5nZXMg
dG8gb25seSB3aGF0IGlzIHJlcXVpcmVkIGZvciB0aGUgZml4ZXMsCnN1Y2ggYXMgdGhlIGFkZGl0
aW9uYWwgSFNQIENTUiBvZmZzZXRzIG5lZWRlZCBmb3IgZXhwbGljaXQgVFhEL1JYRCBkZWxheQpy
ZWdpc3RlciBpbml0aWFsaXphdGlvbiwgYW5kIGRyb3AgdGhlIHVucmVsYXRlZCBEVFMgZXhhbXBs
ZSByZW9yZGVyaW5nIG9yCmNsZWFudXAgY2hhbmdlcyBmcm9tIHRoaXMgc2VyaWVzLgo=

