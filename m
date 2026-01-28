Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F15D35678
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 05:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXG0L22qXs1DF+kKrTmU2+1euU1VrkVIwRndNbthQ5k=; b=q5DdXdQKoyXkfKMz1JusRioZn5
	A7Sk2mQ60Mi0vHdNl/cHqmMYN11DN8urcaFD67tPCLYeKOi/NGcTo7GdNKx5WBDlc3WdmjldQR4SV
	GIYAT6Fn9vlNN/Add+UlZOATSHbsTVt8F/Q4YgSHj2lTyRhvgcO7fJh+fozwV7G4QH9Zob0fqXell
	0HSmPX76uAJDVrDnqb7+U4HV5RWmECtm2K6aL3CvJE3gUVidVJYsAnK5MOJQLbqHuLDaxmLOk7UBW
	yGffLnOeSLU+W6LjGAmMtST9KyYuFAm7J2+x0md2Ev4wrp+WcfM1ly/RGYjrjeN/bwj5IrZRDoTRt
	yrZ9dhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkyQl-0000000FVQJ-3PbG;
	Wed, 28 Jan 2026 05:49:31 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkyQW-0000000FVHA-1YUy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 05:49:18 +0000
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 28 Jan 2026 13:48:59 +0800 (GMT+08:00)
X-Originating-IP: [10.10.96.205]
Date: Wed, 28 Jan 2026 13:48:59 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Min Lin" <linmin@eswincomputing.com>
To: "Bo Gan" <ganboing@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	"Andrew Lunn" <andrew@lunn.ch>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	=?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <973f2b4b-bf8d-4a77-a27a-47495bc21ff8@gmail.com>
References: <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
 <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
 <73ea5619.2b71.19bf847c80d.Coremail.linmin@eswincomputing.com>
 <aXeydXuWEMDz-yVM@shell.armlinux.org.uk>
 <32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com>
 <973f2b4b-bf8d-4a77-a27a-47495bc21ff8@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5c835fe9.2d60.19c0325df03.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TQJkCgBXoa1Lo3lphmAAAA--.141W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAgEBCWl46QEQVgABs1
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_214916_667948_F2CAF8EF 
X-CRM114-Status: GOOD (  22.62  )
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

SGkgQm8gR2FuLAoKCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlcy0tLS0tCj4gRnJvbTogIkJvIEdh
biIgPGdhbmJvaW5nQGdtYWlsLmNvbT4KPiBTZW5kIHRpbWU6V2VkbmVzZGF5LCAyOC8wMS8yMDI2
IDEwOjM4OjI4Cj4gVG86ICJNaW4gTGluIiA8bGlubWluQGVzd2luY29tcHV0aW5nLmNvbT4sICJS
dXNzZWxsIEtpbmcgKE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4gQ2M6ICJBbmRy
ZXcgTHVubiIgPGFuZHJld0BsdW5uLmNoPiwgIktyenlzenRvZiBLb3psb3dza2kiIDxrcnprQGtl
cm5lbC5vcmc+LCDmnY7lv5cgPGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20+LCBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZywgYW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQu
bmV0LCBlZHVtYXpldEBnb29nbGUuY29tLCBrdWJhQGtlcm5lbC5vcmcsIHJvYmhAa2VybmVsLm9y
Zywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRkZXZAdmdlci5r
ZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbSwg
YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBwaW5r
ZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5j
b20KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDEvMl0gZHQtYmluZGluZ3M6IGV0aGVybmV0OiBl
c3dpbjogYWRkIGNsb2NrIHNhbXBsaW5nIGNvbnRyb2wKPiAKPiBIaSBNaW4sIFJ1c3NlbGwsIEty
enlzenRvZiwKPiAKPiBPbiAxLzI2LzI2IDIyOjE0LCBNaW4gTGluIHdyb3RlOgo+ID4gSGkgUnVz
c2VsbCwKPiA+IAo+ID4gCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlcy0tLS0tCj4gPj4gRnJv
bTogIlJ1c3NlbGwgS2luZyAoT3JhY2xlKSIgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPiA+PiBT
ZW5kIHRpbWU6VHVlc2RheSwgMjcvMDEvMjAyNiAwMjoyOTowOQo+ID4+IFRvOiAiTWluIExpbiIg
PGxpbm1pbkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gPj4gQ2M6ICJCbyBHYW4iIDxnYW5ib2luZ0Bn
bWFpbC5jb20+LCAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4sICJLcnp5c3p0b2YgS296
bG93c2tpIiA8a3J6a0BrZXJuZWwub3JnPiwg5p2O5b+XIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcu
Y29tPiwgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGFuZHJldytuZXRkZXZAbHVubi5jaCwg
ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3Jn
LCByb2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9y
ZywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIGxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20sIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgbmluZ3l1QGVzd2luY29t
cHV0aW5nLmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCB3ZWlzaGFuZ2p1YW5A
ZXN3aW5jb21wdXRpbmcuY29tCj4gPj4gU3ViamVjdDogUmU6IFJlOiBbUEFUQ0ggdjEgMS8yXSBk
dC1iaW5kaW5nczogZXRoZXJuZXQ6IGVzd2luOiBhZGQgY2xvY2sgc2FtcGxpbmcgY29udHJvbAo+
ID4+Cj4gPj4gT24gTW9uLCBKYW4gMjYsIDIwMjYgYXQgMTE6MTA6MTJBTSArMDgwMCwgTWluIExp
biB3cm90ZToKPiA+Pj4gRHVlIHRvIGNoaXAgYmFja2VuZCByZWFzb25zLCB0aGVyZSBpcyBhbHJl
YWR5IGEgfjQtNW5zIHNrZXcgYmV0d2VlbiB0aGUgUlgKPiA+Pj4gY2xvY2sgYW5kIGRhdGEgb2Yg
dGhlIGV0aDEgTUFDIGNvbnRyb2xsZXIgaW5zaWRlIHRoZSBzaWxpY29uLgo+ID4+Cj4gPj4gTGV0
J3MgYW5hbHlzZSB0aGlzLgo+ID4+Cj4gPj4gCVRYQyAvIFJYQwlUWEMgLyBSWEMKPiA+PiBTcGVl
ZAlDbG9jayByYXRlCUNsb2NrIHBlcmlvZAo+ID4+IDFHCTEyNU1IegkJOG5zCj4gPj4gMTAwTQky
NU1IegkJNDBucwo+ID4+IDEwTQkyLjVNSHoJCTQwMG5zCj4gPj4KPiA+PiBUaGUgcmVxdWlyZWQg
c2tldyBmb3IgVFhDIGFuZCBSWEMgYXQgdGhlIHJlY2VpdmVyIGlzIHNwZWNpZmllZCB0byBiZQo+
ID4+IGJldHdlZW4gMSBhbmQgMi42bnMgaXJyZXNwZWN0aXZlIG9mIHRoZSBzcGVlZC4gVGhlIGVk
Z2Ugb2YgdGhlIGNsb2NrCj4gPj4gaXMgYWxzbyBpbXBvcnRhbnQ6IHRoZSByaXNpbmcgZWRnZSBp
bmRpY2F0ZXMgdGhlIGxvd2VyIDQgYml0cywgYW5kCj4gPj4gdGhlIGZhbGxpbmcgZWRnZSBpbmRp
Y2F0ZXMgdGhlIHVwcGVyIDQgYml0cy4KPiA+Pgo+ID4+IEF0IDFHIHNwZWVkLCB3aXRoIGEgIjQg
dG8gNW5zIiBza2V3IGluIHRoZSBjaGlwLiBJZiB0aGlzIGlzIGFjY3VyYXRlLAo+ID4+IHRoZW4g
aW52ZXJ0aW5nIHRoZSBjbG9jayBhbmQgYWRkaW5nIDFucyBvZiBhZGRpdGlvbmFsIHNrZXcgYnkg
c29tZQo+ID4+IG1lYW5zIChQQ0IgdHJhY2UsIG9yIGF0IHRoZSBNQUMgb3IgUEhZKSB3aWxsIGdp
dmUgdGhlIHJlcXVpcmVkIGNsb2NrCj4gPj4gYXQgdGhlIHJlY2VpdmVyLgo+ID4+Cj4gPiAKPiA+
IFllcywgdGhhdCdzIGV4YWN0bHkgdGhlIGNhc2UuCj4gPiAKPiA+PiBUaGUgdGltaW5nIHRhYmxl
IGluIHRoZSBSR01JSSBzdGFuZGFyZCAoMy4zKSBhbGxvd3MgZm9yIFRjeWMgKHRoZQo+ID4+IGNs
b2NrIHJhdGUpIHRvIGJlIHNjYWxlZCwgYnV0IHRoZXJlIGlzIG5vIGFsbG93YW5jZSBmb3Igc2Nh
bGluZwo+ID4+IFRza2V3UiAodGhlIHJlcXVpcmVkIDEgdG8gMi42bnMgc2tldy4pIFRoaXMgc2tl
dyBwYXJhbWV0ZXIgaXMKPiA+PiBmaXhlZC4KPiA+Pgo+ID4+IFNvLCBhdCB0aGUgb3RoZXIgc3Bl
ZWRzLCB5b3UgYXJlIGNvbXBsZXRlbHkgdW5hYmxlIHRvIG1lZXQgdGhlIHRpbWluZwo+ID4+IHNw
ZWNpZmljYXRpb24sIHdoZXRoZXIgaXJyZXNwZWN0aXZlIG9mIHRoZSBjbG9jayBpbnZlcnNpb24u
IEluIGVmZmVjdCwKPiA+PiB0aGUgb25seSBzcGVlZCB0aGF0IHlvdSBjYW4gbWVldCB0aGUgc3Bl
Y2lmaWNhdGlvbiBpcyAxRy4KPiA+Pgo+ID4gCj4gPiBUaGUgdGltaW5nIHRhYmxlIGluIHRoZSBS
R01JSSBzdGFuZGFyZCgzLjMpIHNheXMgdGhlIG1heCB2YWx1ZSBvZiBUc2tldwo+ID4gZm9yIDEw
LzEwMCBpcyB1bnNwZWNpZmllZC4KPiA+IFF1b3RhdGlvbjoibm90ZTE6IC4uLixGb3IgMTAvMTAw
IHRoZSBNYXggdmFsdWUgaXMgdW5zcGVjaWZpZWQuIgo+ID4gCj4gPiBJIHRoaW5rIGZvciAxMC8x
MDAsIHRoZSAiNCB0byA1bnMiIHNrZXcgaW4gdGhlIGNoaXAgZG9lc24ndCBicmVhayB0aGUKPiA+
IHN0YW5kYXJkLiBBdCAxMC8xMDAgc3BlZWRzLCBpdCBtZWV0cyB0aGUgdGltaW5nIHNwZWNpZmlj
YXRpb24gd2l0aG91dAo+ID4gaGF2aW5nIHRvIHRvIGFkZCBjbG9jayBpbnZlcnNpb24uCj4gPiBJ
biBwcmFjdGljZSwgaXQgd29ya3MgYXQgMTAvMTAwIHNwZWVkcyBpbiB0aGUgcmdtaWktaWQgcGh5
IG1vZGUuCj4gPiAKPiA+PiBUaHVzLCBJIHRoaW5rIHRoaXMgaXMgc29tZXRoaW5nIHRoYXQgbmVl
ZHMgYSBsb3QgbW9yZSB0aGFuIGp1c3QgImRvCj4gPj4gd2UgbmVlZCB0byBpbnZlcnQgdGhlIGNs
b2NrIi4gWW91IGFsc28gbmVlZCB0byBwcmV2ZW50IDEwTSBhbmQgMTAwTQo+ID4+IGJlaW5nIHN1
cHBvcnRlZCBJTUhPLgo+ID4+Cgo+IAo+IEkgaGFkIGFuIG9mZmxpbmUgZGlzY3Vzc2lvbiB3aXRo
IFlhbyBaaSBhbmQgb3RoZXJzIHJlZ2FyZGluZyB0aGlzLiBXZSBmZWVsCj4gbGlrZSB0aGUgcHJv
cGVyIHdheSBmb3IgRVNXSU4gdG8gZGVhbCB3aXRoIHRoaXMgYnJva2VuIGV0aDEgaXMgdG8gaGF2
ZSBhCj4gZGlmZmVyZW50IGNvbXBhdGlibGUgc3RyaW5nIGp1c3QgZm9yIGV0aDEsIHdoZXJlIGl0
IGNhbiBiZSBhc3NvY2lhdGVkIHdpdGgKPiBwbGF0Zm9ybSBkYXRhIHdpdGggcXVpcmtzIHRvIGRv
IGVzd2luLHJ4LWNsay1pbnZlcnQgYXQgMUcuIFRoZSBwcm9wZXJ0eSBpcwo+IHRoZXJlZm9yZSBu
b3QgcmVxdWlyZWQgdG8gYmUgZXhwb3NlZCBpbiBEVC4gKFByZXRlbmQgaXQgY29uZm9ybXMgdG8g
c3BlYwo+IGZvciAxRykuIE5lZWQgY29uZmlybWF0aW9uIGZvciAxME0vMTAwTSwgdGhvdWdoLiBJ
IGRvdWJsZSBjaGVja2VkIExpbiBNaW4ncwo+IGNsYWltLCBhbmQgaW5kZWVkIHRoZSBzcGVjIHNh
eXMgIkZvciAxMC8xMDAgdGhlIE1heCB2YWx1ZSBpcyB1bnNwZWNpZmllZCI6Cj4gaHR0cHM6Ly9j
b21tdW5pdHkubnhwLmNvbS9wd214eTg3NjU0L2F0dGFjaG1lbnRzL3B3bXh5ODc2NTQvaW14LXBy
b2Nlc3NvcnMvMjA2NTUvMS9SR01JSXYyXzBfZmluYWxfaHAucGRmCj4gCj4gVGhvdWdodHM/CgpJ
IGFncmVlIHdpdGggeW91ciBhcHByb2FjaC4KClJlZ2FyZHMsCkxpbiBNaW4KCg==

