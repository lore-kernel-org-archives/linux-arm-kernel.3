Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE20FCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 07:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3AkEkRJJo0jVO99ov3hOjezsomQAOLSpaf7FKnhiJ0=; b=SgRXPHMUNYaU1HTi1UivdlUjdC
	4EFkaV1FaIx4niAI1puhMNFpAGhVkrf+o5uOul9DXdKd8rVkCoNzYjvwAkbcUat8NMW6oQL0sKOUB
	t54mh3vL+5i2Zwuujrm+lhuQWKWeAq91JnY43JMB8o56WBnYoehNs8NIfIz6jpaRlh8XZRqyjVkT4
	vTUVequE3l6fAaYhwfDc58lJp3xb/MovlT7M+wQyv0kuyNixxLdycaf4r+BZFSAdaB/7c8M/f8EGc
	quj7jc/iXTcP1o3I0h0KTtnYuyTOgqqaiG2/QnRxPrY7kMe5pZLMc0HJXHl0fQtdPzI8LN6D6xmHc
	FEoD7pOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNn1S-00000007cqB-0pkl;
	Fri, 15 May 2026 07:31:50 +0000
Received: from azure-sdnproxy.icoremail.net ([52.229.168.213])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNn1N-00000007cpF-3EZd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 07:31:49 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 15 May 2026 15:31:16 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 15 May 2026 15:31:16 +0800 (GMT+08:00)
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
Message-ID: <29bee81.8323.19e2a8bf746.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TAJkCgBn_HDFywZq+qYZAA--.7037W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEIDGoF+ZIKMwACs4
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_003145_961210_D2B193B2 
X-CRM114-Status: UNSURE (   9.58  )
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

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZXMtLS0tLQo+IEZyb206ICJBbmRyZXcgTHVubiIgPGFu
ZHJld0BsdW5uLmNoPgo+IFNlbmQgdGltZTpUaHVyc2RheSwgMDcvMDUvMjAyNiAyMDoyOToxMAo+
IFRvOiBsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tCj4gQ2M6IGFuZHJldytuZXRkZXZAbHVubi5j
aCwgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwu
b3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgcm9iaEBrZXJuZWwub3JnLCBrcnprK2R0QGtlcm5lbC5v
cmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsIGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBtY29xdWVs
aW4uc3RtMzJAZ21haWwuY29tLCBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tLCBybWsra2Vy
bmVsQGFybWxpbnV4Lm9yZy51aywgbWF4aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20sIGxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20sIGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZywgbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWluQGVzd2lu
Y29tcHV0aW5nLmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCBwcml0ZXNoLnBh
dGVsQGVpbmZvY2hpcHMuY29tLCB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCBuZXQgdjEgMS8yXSBkdC1iaW5kaW5nczogZXRoZXJuZXQ6IGVzd2lu
OiByZWZpbmUgZGVsYXkgbW9kZWwgYW5kIEhTUCByZWdpc3RlciBkZXNjcmlwdGlvbgo+IAo+ID4g
ICAgICBldGhlcm5ldEA1MDQwMDAwMCB7Cj4gPiAgICAgICAgICBjb21wYXRpYmxlID0gImVzd2lu
LGVpYzc3MDAtcW9zLWV0aCIsICJzbnBzLGR3bWFjLTUuMjAiOwo+ID4gICAgICAgICAgcmVnID0g
PDB4NTA0MDAwMDAgMHgxMDAwMD47Cj4gPiAtICAgICAgICBjbG9ja3MgPSA8JmQwX2Nsb2NrIDE4
Nj4sIDwmZDBfY2xvY2sgMTcxPiwgPCZkMF9jbG9jayA0MD4sCj4gPiAtICAgICAgICAgICAgICAg
IDwmZDBfY2xvY2sgMTkzPjsKPiA+IC0gICAgICAgIGNsb2NrLW5hbWVzID0gImF4aSIsICJjZmci
LCAic3RtbWFjZXRoIiwgInR4IjsKPiA+ICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnBs
aWM+Owo+ID4gICAgICAgICAgaW50ZXJydXB0cyA9IDw2MT47Cj4gPiAgICAgICAgICBpbnRlcnJ1
cHQtbmFtZXMgPSAibWFjaXJxIjsKPiA+IC0gICAgICAgIHBoeS1tb2RlID0gInJnbWlpLWlkIjsK
PiA+IC0gICAgICAgIHBoeS1oYW5kbGUgPSA8JnBoeTA+Owo+ID4gKyAgICAgICAgY2xvY2tzID0g
PCZkMF9jbG9jayAxODY+LCA8JmQwX2Nsb2NrIDE3MT4sIDwmZDBfY2xvY2sgNDA+LAo+ID4gKyAg
ICAgICAgICAgICAgICA8JmQwX2Nsb2NrIDE5Mz47Cj4gPiArICAgICAgICBjbG9jay1uYW1lcyA9
ICJheGkiLCAiY2ZnIiwgInN0bW1hY2V0aCIsICJ0eCI7Cj4gCj4gUGxlYXNlIGRvbid0IG1vdmUg
dGhlIGNsb2NrcyBhcm91bmQsIHNpbmNlIHRoZXkgaGF2ZSBub3RoaW5nIHRvIGRvCj4gd2l0aCBS
R01JSSBkZWxheXMuCj4gCj4gCj4gPiAgICAgICAgICByZXNldHMgPSA8JnJlc2V0IDk1PjsKPiA+
ICAgICAgICAgIHJlc2V0LW5hbWVzID0gInN0bW1hY2V0aCI7Cj4gPiAtICAgICAgICByeC1pbnRl
cm5hbC1kZWxheS1wcyA9IDwyMDA+Owo+ID4gLSAgICAgICAgdHgtaW50ZXJuYWwtZGVsYXktcHMg
PSA8MjAwPjsKPiA+IC0gICAgICAgIGVzd2luLGhzcC1zcC1jc3IgPSA8JmhzcF9zcF9jc3IgMHgx
MDAgMHgxMDggMHgxMTg+Owo+ID4gLSAgICAgICAgc25wcyxheGktY29uZmlnID0gPCZzdG1tYWNf
YXhpX3NldHVwPjsKPiA+ICsgICAgICAgIGVzd2luLGhzcC1zcC1jc3IgPSA8JmhzcF9zcF9jc3Ig
MHgxMDAgMHgxMDggMHgxMTggMHgxMTQgMHgxMWM+Owo+ID4gKyAgICAgICAgcGh5LWhhbmRsZSA9
IDwmcGh5MD47Cj4gPiArICAgICAgICBwaHktbW9kZSA9ICJyZ21paS1pZCI7Cj4gPiAgICAgICAg
ICBzbnBzLGFhbDsKPiA+ICAgICAgICAgIHNucHMsZml4ZWQtYnVyc3Q7Cj4gPiAgICAgICAgICBz
bnBzLHRzbzsKPiA+IC0gICAgICAgIHN0bW1hY19heGlfc2V0dXA6IHN0bW1hYy1heGktY29uZmln
IHsKPiA+ICsgICAgICAgIHNucHMsYXhpLWNvbmZpZyA9IDwmc3RtbWFjX2F4aV9zZXR1cF9nbWFj
MD47Cj4gPiArCj4gPiArICAgICAgICBzdG1tYWNfYXhpX3NldHVwX2dtYWMwOiBzdG1tYWMtYXhp
LWNvbmZpZyB7Cj4gCj4gQW5kIHdoYXQgZG8gdGhlc2UgY2hhbmdlcyBoYXZlIHRvIGRvIHdpdGgg
UkdNSUkgZGVsYXlzPwo+IAoKSGkgQW5kcmV3LAoKQmVmb3JlIHNlbmRpbmcgdGhlIG5leHQgcmV2
aXNpb24sIEkgd291bGQgbGlrZSB0byBjb25maXJtIG9uZSBwb2ludCBhYm91dAp0aGUgYmluZGlu
ZyB1cGRhdGUuCgpJbiB5b3VyIHByZXZpb3VzIHJldmlldyBjb21tZW50OgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sLzdlNTkzZWRlLTU5ZWItNDMxNi1hYjcyLTk0OWE1MWMwMDhjNkBsdW5u
LmNoLwoKeW91IG1lbnRpb25lZCB0aGF0ICJhIHdlbGwgZGVzaWduZWQgYm9hcmQgc2hvdWxkIG5v
dCBuZWVkIGRlbGF5cyIuCgpCYXNlZCBvbiB0aGF0LCBJIGFtIHBsYW5uaW5nIHRvIHJlbW92ZSBy
eC1pbnRlcm5hbC1kZWxheS1wcyBhbmQKdHgtaW50ZXJuYWwtZGVsYXktcHMgZnJvbSB0aGUgcmVx
dWlyZWQgbGlzdC4KClRoZSBpbnRlbnRpb24gaXMgdGhhdCB0aGVzZSBwcm9wZXJ0aWVzIHJlbWFp
biBhdmFpbGFibGUgZm9yIE1BQy1zaWRlCmZpbmUgdHVuaW5nIHdoZW4gbmVlZGVkLCBidXQgYXJl
IG9wdGlvbmFsIHNpbmNlIHRoZSByZXF1aXJlZCBSR01JSSBkZWxheQptYXkgaW5zdGVhZCBiZSBw
cm92aWRlZCBieSB0aGUgUEhZIChmb3IgZXhhbXBsZSB3aXRoIHJnbWlpLWlkKSBvciBieSB0aGUK
Ym9hcmQgZGVzaWduLgoKV291bGQgeW91IGNvbnNpZGVyIHRoaXMgdG8gYmUgYSBmaXggdG8gYW4g
b3Zlcmx5IHJlc3RyaWN0aXZlIHNjaGVtYQpyZXF1aXJlbWVudCwgb3IgbW9yZSBvZiBhIHNjaGVt
YSByZWxheGF0aW9uIC8gaW1wcm92ZW1lbnQ/CgpUaGlzIHdpbGwgaGVscCBkZXRlcm1pbmUgd2hl
dGhlciB0aGlzIGNoYW5nZSBzaG91bGQgcmVtYWluIGluIHRoZSBuZXQKc2VyaWVzIG9yIGJlIG1v
dmVkIHRvIGEgZm9sbG93LXVwIG5ldC1uZXh0IHNlcmllcy4KClRoYW5rcywKWmhpIExpCg==

