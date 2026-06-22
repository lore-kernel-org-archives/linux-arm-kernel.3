Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3995CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 02:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNzXLGPbgjHjVIZkEPXI0gjusig9YVEFyMRzgKCkUvc=; b=2Lt4veRe17Shc9XEwimOz4/UZB
	RmaoCEcCXgOQKUyjgkqW2NjH1UuMJlQluK+bVEyCxSER4CzoF072lR/LykyIYd9Ta7xW7fOMUKveV
	uqSO5pHM93LqsziX04t0k1AmenIuIZcXk2aTiwo5gcquyjYL2CFWUGsHWvN6kQhLqSSeKTUnlmguy
	+SlGR48R9tK5xBKKH0Tnq077ztQ1Yy22/hmzjElvaTpbBh0JlB3KtwT8OEcRKONPC2/EjcLuLMzFT
	T4DOIEAyUTX8JLS543wmxC3OoJndML1YgFIGNxdgO5nsw9Oxi1OkjkWOgveK0r58BOBtUy5TqsMhK
	MsYThdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUH3-00000004IUp-2csK;
	Mon, 22 Jun 2026 02:20:33 +0000
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUGv-00000004IUJ-2xSh;
	Mon, 22 Jun 2026 02:20:31 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Mon, 22 Jun 2026 10:19:50 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Mon, 22 Jun 2026 10:19:50 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: "Maxime Chevallier" <maxime.chevallier@bootlin.com>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com, horms@kernel.org, lee@kernel.org
Subject: Re: Re: [PATCH net-next v8 3/6] net: stmmac: eic7700: make RGMII
 delay properties optional
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <30229cfe-b395-4d0f-81ef-eb780ac26599@lunn.ch>
References: <20260610012727.848-1-lizhi2@eswincomputing.com>
 <20260610012937.911-1-lizhi2@eswincomputing.com>
 <eaa645fc-be06-4a15-8c2f-6e82129c4715@bootlin.com>
 <30229cfe-b395-4d0f-81ef-eb780ac26599@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <512b77d5.993b.19eed207fc9.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TAJkCgDHW3DHmzhqEvksAA--.8326W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEGDGo4EpcWfAACs2
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_192025_916163_D9166919 
X-CRM114-Status: GOOD (  24.95  )
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

CgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiAiQW5kcmV3IEx1bm4iIDxh
bmRyZXdAbHVubi5jaD4KPiBTZW5kIHRpbWU6U2F0dXJkYXksIDEzLzA2LzIwMjYgMTU6NDg6NDYK
PiBUbzogIk1heGltZSBDaGV2YWxsaWVyIiA8bWF4aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20+
Cj4gQ2M6IGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20sIGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVkdW1hemV0
QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9iaEBrZXJuZWwub3JnLCBrcnprK2R0QGtl
cm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsIHBh
YmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tLCBhbGV4YW5kcmUudG9y
Z3VlQGZvc3Muc3QuY29tLCBybWsra2VybmVsQGFybWxpbnV4Lm9yZy51aywgcGp3QGtlcm5lbC5v
cmcsIHBhbG1lckBkYWJiZWx0LmNvbSwgYW91QGVlY3MuYmVya2VsZXkuZWR1LCBhbGV4QGdoaXRp
LmZyLCBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tLCBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5j
b20sIGxpbm1pbkBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBz
LmNvbSwgcHJpdGVzaC5wYXRlbEBlaW5mb2NoaXBzLmNvbSwgd2Vpc2hhbmdqdWFuQGVzd2luY29t
cHV0aW5nLmNvbSwgaG9ybXNAa2VybmVsLm9yZywgbGVlQGtlcm5lbC5vcmcKPiBTdWJqZWN0OiBS
ZTogW1BBVENIIG5ldC1uZXh0IHY4IDMvNl0gbmV0OiBzdG1tYWM6IGVpYzc3MDA6IG1ha2UgUkdN
SUkgZGVsYXkgcHJvcGVydGllcyBvcHRpb25hbAo+IAo+IE9uIFdlZCwgSnVuIDEwLCAyMDI2IGF0
IDEwOjI2OjUwQU0gKzAyMDAsIE1heGltZSBDaGV2YWxsaWVyIHdyb3RlOgo+ID4gSGksCj4gPiAK
PiA+IE9uIDYvMTAvMjYgMDM6MjksIGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20gd3JvdGU6Cj4g
PiA+IEZyb206IFpoaSBMaSA8bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbT4KPiA+ID4gCj4gPiA+
IE1ha2UgcngtaW50ZXJuYWwtZGVsYXktcHMgYW5kIHR4LWludGVybmFsLWRlbGF5LXBzIG9wdGlv
bmFsIGluIHRoZQo+ID4gPiBFSUM3NzAwIERXTUFDIGRyaXZlci4KPiA+ID4gCj4gPiA+IFRoZSBk
cml2ZXIgcHJldmlvdXNseSByZXF1aXJlZCBib3RoIHByb3BlcnRpZXMgdG8gYmUgcHJlc2VudCBh
bmQgd291bGQKPiA+ID4gZmFpbCBwcm9iZSB3aGVuIHRoZXkgd2VyZSBtaXNzaW5nLiBUaGlzIHJl
c3RyaWN0cyB2YWxpZCBoYXJkd2FyZQo+ID4gPiBjb25maWd1cmF0aW9ucyB3aGVyZSBSR01JSSB0
aW1pbmcgaXMgaW5zdGVhZCBwcm92aWRlZCBieSB0aGUgUEhZIG9yCj4gPiA+IGJvYXJkIGRlc2ln
bi4KPiA+ID4gCj4gPiA+IFVwZGF0ZSB0aGUgZHJpdmVyIHRvIHRyZWF0IG1pc3NpbmcgZGVsYXkg
cHJvcGVydGllcyBhcyB6ZXJvIGRlbGF5LAo+ID4gPiBhbGxvd2luZyBzeXN0ZW1zIHdpdGhvdXQg
ZXhwbGljaXQgTUFDLXNpZGUgZGVsYXkgdHVuaW5nIHRvIG9wZXJhdGUKPiA+ID4gY29ycmVjdGx5
Lgo+ID4gPiAKPiA+ID4gVGhpcyBhbGlnbnMgdGhlIGRyaXZlciBiZWhhdmlvciB3aXRoIHRoZSB1
cGRhdGVkIGRldmljZSB0cmVlIGJpbmRpbmcKPiA+ID4gYW5kIHByb3ZpZGVzIGEgc2FmZSBkZWZh
dWx0IGNvbmZpZ3VyYXRpb24gd2hlbiBNQUMtc2lkZSBkZWxheQo+ID4gPiBwcm9ncmFtbWluZyBp
cyBub3QgcmVxdWlyZWQuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBaaGkgTGkgPGxpemhp
MkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZWljNzcwMC5jIHwgNiAtLS0tLS0KPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWVpYzc3MDAuYyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWVpYzc3MDAuYwo+ID4gPiBpbmRleCA0
YWM5NzlkODc0ZDYuLmVjOTliNTk3YWVhZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZWljNzcwMC5jCj4gPiA+ICsrKyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWVpYzc3MDAuYwo+ID4gPiBAQCAt
MTY1LDkgKzE2NSw2IEBAIHN0YXRpYyBpbnQgZWljNzcwMF9kd21hY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAgCQlkd2NfcHJpdi0+ZXRoX2Nsa19kbHlfcGFyYW0g
Jj0gfkVJQzc3MDBfRVRIX1JYX0FESl9ERUxBWTsKPiA+ID4gIAkJZHdjX3ByaXYtPmV0aF9jbGtf
ZGx5X3BhcmFtIHw9Cj4gPiA+ICAJCQkJIEZJRUxEX1BSRVAoRUlDNzcwMF9FVEhfUlhfQURKX0RF
TEFZLCB2YWwpOwo+ID4gPiAtCX0gZWxzZSB7Cj4gPiA+IC0JCXJldHVybiBkZXZfZXJyX3Byb2Jl
KCZwZGV2LT5kZXYsIC1FSU5WQUwsCj4gPiA+IC0JCQkibWlzc2luZyByZXF1aXJlZCBwcm9wZXJ0
eSByeC1pbnRlcm5hbC1kZWxheS1wc1xuIik7Cj4gPiA+ICAJfQo+ID4gPiAgCj4gPiA+ICAJLyog
UmVhZCB0eC1pbnRlcm5hbC1kZWxheS1wcyBhbmQgdXBkYXRlIHR4X2NsayBkZWxheSAqLwo+ID4g
PiBAQCAtMTg3LDkgKzE4NCw2IEBAIHN0YXRpYyBpbnQgZWljNzcwMF9kd21hY19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAgCQlkd2NfcHJpdi0+ZXRoX2Nsa19kbHlf
cGFyYW0gJj0gfkVJQzc3MDBfRVRIX1RYX0FESl9ERUxBWTsKPiA+ID4gIAkJZHdjX3ByaXYtPmV0
aF9jbGtfZGx5X3BhcmFtIHw9Cj4gPiA+ICAJCQkJIEZJRUxEX1BSRVAoRUlDNzcwMF9FVEhfVFhf
QURKX0RFTEFZLCB2YWwpOwo+ID4gPiAtCX0gZWxzZSB7Cj4gPiA+IC0JCXJldHVybiBkZXZfZXJy
X3Byb2JlKCZwZGV2LT5kZXYsIC1FSU5WQUwsCj4gPiA+IC0JCQkibWlzc2luZyByZXF1aXJlZCBw
cm9wZXJ0eSB0eC1pbnRlcm5hbC1kZWxheS1wc1xuIik7Cj4gPiA+ICAJfQo+ID4gCj4gPiBJIHRo
aW5rIHRoZW4geW91IG5lZWQgdG8gaGFuZGxlIFJHTUlJLCBSR01JSV9JRCwgUkdNSUlfUlhJRCBh
bmQgUkdNSUlfVFhJRCwKPiA+IGJ5IHVzaW5nIGRlZmF1bHQgZGVsYXlzIGZvciB0aGVzZSAodXN1
YWxseSBhcm91bmQgMm5zKSwgYXMgaGVyZSBhbGwgZGVsYXlzCj4gPiB3aWxsIGJlIHNldCB0byAw
LCByZWdhcmRsZXNzIG9mIHRoZSBSR01JSSBtb2RlIGluIHVzZS4KPiAKPiBOby4gQnkgZGVmYXVs
dCwgdGhlIE1BQyBhZGRzIDBucyBkZWxheSwgYW5kIHBhc3NlcyB0aGUgcGh5LW1vZGUgdG8gdGhl
Cj4gUEhZLiBJdCB3aWxsIHRoZW4gYWRkIHRoZSAybnMgZGVsYXkuIEl0IGlzIHBvc3NpYmxlIHRv
IHVzZSB0aGUKPiB0eC1pbnRlcm5hbC1kZWxheS1wcyBhbmQgcngtaW50ZXJuYWwtZGVsYXktcHMg
aW4gdGhlIE1BQyB0byBhZGQgc21hbGwKPiB0dW5pbmcgZGVsYXlzLCBidXQgbm90IHRoZSBmdWxs
IDJucy4KPiAKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNS9zb3VyY2Uv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9ldGhlcm5ldC1jb250cm9sbGVy
LnlhbWwjTDI4Nwo+IAoKVGhhbmtzIGZvciB0aGUgZWFybGllciBkaXNjdXNzaW9uIGFuZCBmb3Ig
aGVscGluZyBjbGFyaWZ5IHRoZSBldGgwCmRlc2lnbi4KCkknbSBwcmVwYXJpbmcgYSB2OSBvZiB0
aGUgc2VyaWVzLiBUaGUgbmV4dCByZXZpc2lvbiB3aWxsIGFkZHJlc3MgdGhlCmlzc3VlcyByZXBv
cnRlZCBieSBTYXNoaWtvIHJldmlldywgbWFpbmx5IERUIGJpbmRpbmcgc2NoZW1hIGFuZCBEVFMK
d2FybmluZ3MuCgpCZWZvcmUgSSBwb3N0IHY5LCBJJ2QgbGlrZSB0byBjaGVjayB3aGV0aGVyIHlv
dSBoYXZlIGFueSBjb25jZXJucyBvcgpzdWdnZXN0aW9ucyByZWdhcmRpbmcgdGhlIGRyaXZlciBj
aGFuZ2VzLgoKVGhhbmtzLApaaGkK

