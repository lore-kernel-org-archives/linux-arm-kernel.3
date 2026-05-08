Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7979CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 05:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMCizTcYAtsgFOiImTv5tFAxKtV30n/+YgJ18hEjcPs=; b=TzOMTQdyUmGs7cnb60zq4I0cmL
	M0C3Mdl6e0QojDfUIS1IlfH4R0THmRpIIrkIDsrlVTmJ8I3PwFBliwCubP8wjKNX/ik/VkgySCZCq
	n6pyf2GR9r+eKESIsr6A1fgGpQwEhwXxTi5cLW39uNGILD5yaE+m2hgshrDOduhqqoRQD8MjrEvtm
	84rw/ctbbRz3+XPZutbWRfcF5qq3cZ4wi1JlrBjXCX13D4M8NZWhMPJJ2mVVOyiolq5rC8MF8iCxo
	EUzU6HzEHRIMiAU18Y5UMSTFDzikCahZqnbcKgp+NhH0DU7o364nf3PUmLXhIF9GxcCNEFl/O59mo
	SkLESDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLE0X-00000005esX-45vi;
	Fri, 08 May 2026 05:44:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLE0W-00000005erO-1FGs
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 05:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iMCizTcYAtsgFOiImTv5tFAxKtV30n/+YgJ18hEjcPs=; b=PlkA2d9BGrBTz2/9Ap/7YSyKU2
	V08wRameRn7isXUyOyI1xQ7DQi62JSv+pkEvaaYci//VpsPI8u/GtZ+GI/2XZ6cGH1JdByEkFPu0W
	NwsDn4fuqxDDAlm92CYGeFZcrsJNExShC4f/HV8eu9FZwcYk+Vtk+uFv1W3ccvPszqIayadFb8lJv
	vKPyGGqFXD0c7PgNOXw/Cpe7Q43LRJ8jSpXSWajwUAuRKM950ghD4V25ZuCsUdQBY2zxya8caOJrT
	IhL4pk9v/PG21Sko3TbtOU/FKbEtjTeuQbwBxPH+teP+nzNBksHKaihx8aJs4m+fS1WDGdKCAVTgM
	ljvji0ug==;
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLE0I-00000005IA1-1NwM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 05:44:13 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 8 May 2026 13:43:23 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 8 May 2026 13:43:23 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Conor Dooley" <conor@kernel.org>
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
In-Reply-To: <20260507-mural-moocher-ad6e07ef8ae0@spud>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083136.175-1-lizhi2@eswincomputing.com>
 <20260507-mural-moocher-ad6e07ef8ae0@spud>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <22d09a07.7cfd.19e061cacea.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgBnCXP8d_1ppNgXAA--.6687W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEBDGn8vxER1gAAsy
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_064408_377332_1BCE42C1 
X-CRM114-Status: GOOD (  23.37  )
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

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQ29ub3IgRG9vbGV5IiA8
Y29ub3JAa2VybmVsLm9yZz4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wNS0wOCAwMToyNDowMiAo5pif
5pyf5LqUKQo+IOaUtuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTog
YW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpldEBnb29n
bGUuY29tLCBrdWJhQGtlcm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCByb2JoQGtlcm5lbC5v
cmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2QHZnZXIu
a2VybmVsLm9yZywgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcsIG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVA
Zm9zcy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrLCBtYXhpbWUuY2hldmFsbGll
ckBib290bGluLmNvbSwgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBuaW5neXVAZXN3aW5jb21wdXRp
bmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9j
aGlwcy5jb20sIHByaXRlc2gucGF0ZWxAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBlc3dp
bmNvbXB1dGluZy5jb20KPiDkuLvpopg6IFJlOiBbUEFUQ0ggbmV0IHYxIDEvMl0gZHQtYmluZGlu
Z3M6IGV0aGVybmV0OiBlc3dpbjogcmVmaW5lIGRlbGF5IG1vZGVsIGFuZCBIU1AgcmVnaXN0ZXIg
ZGVzY3JpcHRpb24KPiAKPiBPbiBUaHUsIE1heSAwNywgMjAyNiBhdCAwNDozMTozNlBNICswODAw
LCBsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tIHdyb3RlOgo+ID4gRnJvbTogWmhpIExpIDxsaXpo
aTJAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gCj4gPiBSZWZpbmUgdGhlIEVJQzc3MDAgRXRoZXJu
ZXQgZHQtYmluZGluZyBiYXNlZCBvbiBvYnNlcnZlZCBoYXJkd2FyZSBiZWhhdmlvcgo+ID4gYW5k
IGNsYXJpZnkgdGhlIG9yaWdpbmFsIGRlbGF5IG1vZGVsIGZvciBldGgwLgo+ID4gCj4gPiBUaGUg
cHJldmlvdXMgYmluZGluZyB1c2VkIGFuIGVudW0tYmFzZWQgZGVmaW5pdGlvbiBmb3IKPiA+IHJ4
LWludGVybmFsLWRlbGF5LXBzIGFuZCB0eC1pbnRlcm5hbC1kZWxheS1wcy4gUmVwbGFjZSBpdCB3
aXRoIGEKPiA+IHJhbmdlLWJhc2VkIG1vZGVsIHVzaW5nOgo+ID4gCj4gPiAgIC0gbWluaW11bTog
MAo+ID4gICAtIG1heGltdW06IDI1NDAKPiA+ICAgLSBtdWx0aXBsZU9mOiAyMAo+ID4gCj4gPiBU
aGlzIGJldHRlciByZWZsZWN0cyB0aGUgYWN0dWFsIGhhcmR3YXJlIGltcGxlbWVudGF0aW9uLCB3
aGljaAo+ID4gc3VwcG9ydHMgMjBwcyBncmFudWxhcml0eSBkZWxheSBzdGVwcyBpbiB0aGUgTUFD
IFJHTUlJIGludGVyZmFjZS4KPiA+IAo+ID4gVGhlIHR4L3J4IGludGVybmFsIGRlbGF5IHZhbHVl
cyBhcmUgY2xhcmlmaWVkIGFzIE1BQy1zaWRlIHByb2dyYW1tYWJsZQo+ID4gZGVsYXkgY29tcG9u
ZW50cyBhcHBsaWVkIG9uIHRoZSBSR01JSSBjbG9jay9kYXRhIHBhdGgsIHJlcHJlc2VudGluZwo+
ID4gdGhlIGVmZmVjdGl2ZSBkZWxheSBzZWVuIGF0IHRoZSBNQUMgaW50ZXJmYWNlLgo+ID4gCj4g
PiBUaGlzIGRvZXMgbm90IGNoYW5nZSB0aGUgaW50ZW5kZWQgaGFyZHdhcmUgc2VtYW50aWNzLCBi
dXQgYWxpZ25zIHRoZQo+ID4gYmluZGluZyB3aXRoIHRoZSBhY3R1YWwgaGFyZHdhcmUgaW1wbGVt
ZW50YXRpb24uCj4gPiAKPiA+IFRoZXNlIHByb3BlcnRpZXMgYXJlIG9wdGlvbmFsIGFuZCBvbmx5
IHJlcXVpcmVkIHdoZW4gTUFDLXNpZGUgZmluZQo+ID4gdHVuaW5nIGlzIG5lZWRlZDsgb3RoZXJ3
aXNlIGRlbGF5IGFsaWdubWVudCBpcyBwcm92aWRlZCBieSBQSFkgb3IKPiA+IGJvYXJkIGRlc2ln
bi4KPiA+IAo+ID4gRGVwZW5kaW5nIG9uIHRoZSBzZWxlY3RlZCBSR01JSSB0aW1pbmcgbW9kZSwg
ZGVsYXkgYWxpZ25tZW50IG1heSBiZQo+ID4gcHJvdmlkZWQgYnkgdGhlIFBIWSAoZS5nLiByZ21p
aS1pZCkgb3IgYnkgYm9hcmQvTUFDLXNpZGUgY29uZmlndXJhdGlvbi4KPiA+IFdoZW4gUEhZIG9y
IGJvYXJkIGRlc2lnbiBhbHJlYWR5IHByb3ZpZGVzIHRoZSByZXF1aXJlZCBkZWxheSwgdGhlc2UK
PiA+IE1BQy1zaWRlIHByb3BlcnRpZXMgbWF5IGJlIG9taXR0ZWQuIFdoZW4gTUFDLXNpZGUgZmlu
ZSB0dW5pbmcgaXMKPiA+IHJlcXVpcmVkLCB0aGV5IHNob3VsZCBiZSBwcm92aWRlZCB0byBkZXNj
cmliZSB0aGUgaW50ZXJuYWwgUkdNSUkKPiA+IHRpbWluZyBhZGp1c3RtZW50Lgo+ID4gCj4gPiBB
ZGRpdGlvbmFsbHksIGV4dGVuZCB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIEhTUCBzdWJzeXN0ZW0g
cmVnaXN0ZXIKPiA+IGxheW91dCB1c2VkIGJ5IHRoZSBNQUMgZ2x1ZSBsb2dpYy4gVGhpcyBpbmNs
dWRlcyBleHBsaWNpdCBUWEQgYW5kIFJYRAo+ID4gZGVsYXkgY29udHJvbCByZWdpc3RlcnMgdG8g
ZW5zdXJlIGRldGVybWluaXN0aWMgaW5pdGlhbGl6YXRpb24gYW5kCj4gPiB0byBvdmVycmlkZSBh
bnkgcmVzaWR1YWwgY29uZmlndXJhdGlvbiBwb3RlbnRpYWxseSBsZWZ0IGJ5IGJvb3Rsb2FkZXJz
Lgo+ID4gCj4gPiBBZGQgcmVmZXJlbmNlIHRvIHRoZSBFSUM3NzAwWCBTb0MgVGVjaG5pY2FsIFJl
ZmVyZW5jZSBNYW51YWwsCj4gPiBDaGFwdGVyIDEwICgiSGlnaC1TcGVlZCBJbnRlcmZhY2UiKSwg
UGFydCA0IGZvciBiYWNrZ3JvdW5kIG9mIHRoZQo+ID4gSFNQIENTUiBibG9jazoKPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9lc3dpbmNvbXB1dGluZy9FSUM3NzAwWC1Tb0MtVGVjaG5pY2FsLVJlZmVy
ZW5jZS1NYW51YWwvcmVsZWFzZXMKPiA+IAo+ID4gVGhlcmUgYXJlIG5vIGluLXRyZWUgdXNlcnMg
b2YgdGhpcyBiaW5kaW5nLCBzbyBubyBBQkkgaW1wYWN0IGlzCj4gPiBleHBlY3RlZC4KPiA+IAo+
ID4gRml4ZXM6IDg4OGJkMGVjYTkzYyAoImR0LWJpbmRpbmdzOiBldGhlcm5ldDogZXN3aW46IERv
Y3VtZW50IGZvciBFSUM3NzAwIFNvQyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGkgTGkgPGxpemhp
MkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gPiAtLS0KPiAKPiBXaGlsZSB0aGlzIGlzIHYxLCBpdCdz
IHJlYWxseSB2OCBhbmQgdGhlcmUgc2hvdWxkIHRoZXJlZm9yZSBiZSBhCj4gY2hhbmdlbG9nIHRo
YXQgZXhwbGFpbnMgd2hlcmUgbXkgYWNrIGFuZCB0aGUgbmV3IGNvbXBhdGlibGUgd2VudC4KPiAK
ClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkJhc2VkIG9uIEpha3ViJ3MgZmVlZGJhY2sgb24gdGhl
IHByZXZpb3VzIHY3IHNlcmllcywgSSBwbGFuIHRvIHNwbGl0IHRoZQpjaGFuZ2VzIGludG8gdHdv
IHNlcGFyYXRlIHNlcmllczoKCi0gYSBzbWFsbGVyIGZpeCBzZXJpZXMgaW50ZW5kZWQgZm9yIG5l
dCwKLSBhbmQgYSBzZXBhcmF0ZSBldGgxIGZlYXR1cmUgc2VyaWVzIGludGVuZGVkIGZvciBuZXQt
bmV4dC4KCkFmdGVyIHRoZSBzcGxpdCwgdGhlIHNjb3BlIGFuZCB0YXJnZXQgdHJlZXMgb2YgdGhl
IHR3byBzZXJpZXMgd2lsbCBkaWZmZXIKZnJvbSB0aGUgb3JpZ2luYWwgY29tYmluZWQgc2VyaWVz
LCBzbyBJIHBsYW4gdG8gcmVzdGFydCB0aGUgcmV2aXNpb24KbnVtYmVyaW5nIGZyb20gdjEgZm9y
IGJvdGggc2VyaWVzLgoKVGhlIGFkZGl0aW9uYWwgY29tcGF0aWJsZSBzdHJpbmcgYW5kIHRoZSBl
dGgxLXNwZWNpZmljIERUIGJpbmRpbmcKZXh0ZW5zaW9ucyB3aWxsIGJlIG1vdmVkIGludG8gdGhl
IHNlcGFyYXRlIGZlYXR1cmUgc2VyaWVzLCBhbmQgSSB3aWxsCnJlZmxlY3QgdGhpcyBpbiB0aGUg
djIgY292ZXIgbGV0dGVyLgoKVGhlIERUIGJpbmRpbmcgY2hhbmdlcyBpbiB0aGlzIGZpeCBzZXJp
ZXMgdjEgYXJlIHNpbXBseSBleHRyYWN0ZWQgZnJvbSB0aGUKcHJldmlvdXMgdjcgc2VyaWVzIGFz
IHBhcnQgb2YgdGhlIHNwbGl0LgoKU2luY2UgdGhlIHNlcmllcyBoYXMgYmVlbiByZXN0cnVjdHVy
ZWQsIEkgd2lsbCBkcm9wIHRoZSBwcmV2aW91cwpBY2tlZC1ieSB0YWdzLgoKSSB3aWxsIGFsc28g
ZG9jdW1lbnQgdGhlIHJlYXNvbiBmb3IgZG9pbmcgc28gYW5kIHRoZSBpbXBhY3Qgb2YgdGhlIHNw
bGl0CmluIHRoZSB2MiBjb3ZlciBsZXR0ZXIuCgpJZiB5b3UgdGhpbmsgdGhlIGJpbmRpbmcgY2hh
bmdlcyBhcmUgc3RpbGwgZWZmZWN0aXZlbHkgdW5jaGFuZ2VkIGFuZCB0aGUKcHJldmlvdXMgQWNr
ZWQtYnkgY2FuIHN0aWxsIGFwcGx5LCBJIGFtIGhhcHB5IHRvIHJldGFpbiB0aGVtIG9yIHJlLWFw
cGx5CnRoZW0gYXMgYXBwcm9wcmlhdGUuIE90aGVyd2lzZSBJIHdpbGwgYXNzdW1lIGEgZnJlc2gg
cmV2aWV3IGlzIHByZWZlcnJlZC4KClBsZWFzZSBsZXQgbWUga25vdyB5b3VyIHByZWZlcmVuY2Uu
CgpUaGFua3MsClpoaQo=

