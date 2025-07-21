Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DACC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 02:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCn2fymLq9Cp97mTe0VFqyCwSznom7KPVY7EfdsdBII=; b=pioGj04R+OcQ7qvUISZn0Jy0Qp
	uGfh70OaaVd6OnoZNHk8CvjEkZF6IvjxDPvj8K6bEneINVaqRcg9+yKUmFDVgBZywJjIRd/ueb9wO
	LVpTnxAMWOpL2E2c7hr0g0bY/R5JmwcLT52e6TF1LCxyqqYvW+jN/rSsJbY4MypuXkEIVjg7ErEXO
	SojOVkj1OX2KE2Ale7m1MAnL/VL/6pOh4/UE03m02G2vdC9G/nQPqHQYwkEXECjigud3UP7KtqXxw
	RaUqsDiny0iz63HQQwl0f4SlZUVKCmJgSDL1YrZkqKmZXkrAmZlwUmBipVVGAqDlqqtd4y1iYspL6
	dfvq2Ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgUb-0000000G1CC-1E3d;
	Mon, 21 Jul 2025 02:43:05 +0000
Received: from azure-sdnproxy.icoremail.net ([4.193.249.245])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgSA-0000000G11q-48lc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 02:40:37 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Mon, 21 Jul 2025 10:40:01 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Mon, 21 Jul 2025 10:40:01 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
	jszhang@kernel.org, jan.petrous@oss.nxp.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	boon.khai.ng@altera.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: [PATCH v3 2/2] ethernet: eswin: Add eic7700 ethernet
 driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
 <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
 <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgB3jg+BqH1oA9a0AA--.9408W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEKDGh9GfATSQABsh
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_194035_198446_4E092CA2 
X-CRM114-Status: GOOD (  15.46  )
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

RGVhciBBbmRyZXcgTHVubiwKVGhhbmsgeW91IGZvciB5b3VyIHByb2Zlc3Npb25hbCBhbmQgdmFs
dWFibGUgc3VnZ2VzdGlvbnMuCk91ciBxdWVzdGlvbnMgYXJlIGVtYmVkZGVkIGJlbG93IHlvdXIg
Y29tbWVudHMgaW4gdGhlIG9yaWdpbmFsIGVtYWlsIGJlbG93LgoKCkJlc3QgcmVnYXJkcywKCkxp
IFpoaQpFc3dpbiBDb21wdXRpbmcKCgo+IC0tLS0t5Y6f5aeL6YKu5Lu2LS0tLS0KPiDlj5Hku7bk
uro6ICJBbmRyZXcgTHVubiIgPGFuZHJld0BsdW5uLmNoPgo+IOWPkemAgeaXtumXtDoyMDI1LTA3
LTE1IDIxOjA5OjE3ICjmmJ/mnJ/kuowpCj4g5pS25Lu25Lq6OiDmnY7lv5cgPGxpemhpMkBlc3dp
bmNvbXB1dGluZy5jb20+Cj4g5oqE6YCBOiB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29t
LCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVkdW1hemV0QGdv
b2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9iaEBrZXJuZWwub3JnLCBrcnprK2R0QGtlcm5l
bC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsIGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBtY29x
dWVsaW4uc3RtMzJAZ21haWwuY29tLCBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tLCBybWsr
a2VybmVsQGFybWxpbnV4Lm9yZy51aywgeW9uZy5saWFuZy5jaG9vbmdAbGludXguaW50ZWwuY29t
LCB2bGFkaW1pci5vbHRlYW5AbnhwLmNvbSwganN6aGFuZ0BrZXJuZWwub3JnLCBqYW4ucGV0cm91
c0Bvc3MubnhwLmNvbSwgcHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tLCBp
bm9jaGlhbWFAZ21haWwuY29tLCBib29uLmtoYWkubmdAYWx0ZXJhLmNvbSwgZGZ1c3RpbmlAdGVu
c3RvcnJlbnQuY29tLCAweDEyMDdAZ21haWwuY29tLCBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tLCBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIG5p
bmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1pbkBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtl
c2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbQo+IOS4u+mimDogUmU6IFJlOiBbUEFUQ0ggdjMgMi8y
XSBldGhlcm5ldDogZXN3aW46IEFkZCBlaWM3NzAwIGV0aGVybmV0IGRyaXZlcgo+IAo+ID4gPiA+
ICsJZHdjX3ByaXYtPmRseV9wYXJhbV8xMDAwbVswXSA9IEVJQzc3MDBfREVMQVlfVkFMVUUwOwo+
ID4gPiA+ICsJZHdjX3ByaXYtPmRseV9wYXJhbV8xMDAwbVsxXSA9IEVJQzc3MDBfREVMQVlfVkFM
VUUxOwo+ID4gPiA+ICsJZHdjX3ByaXYtPmRseV9wYXJhbV8xMDAwbVsyXSA9IEVJQzc3MDBfREVM
QVlfVkFMVUUwOwo+ID4gPiA+ICsJZHdjX3ByaXYtPmRseV9wYXJhbV8xMDBtWzBdID0gRUlDNzcw
MF9ERUxBWV9WQUxVRTA7Cj4gPiA+ID4gKwlkd2NfcHJpdi0+ZGx5X3BhcmFtXzEwMG1bMV0gPSBF
SUM3NzAwX0RFTEFZX1ZBTFVFMTsKPiA+ID4gPiArCWR3Y19wcml2LT5kbHlfcGFyYW1fMTAwbVsy
XSA9IEVJQzc3MDBfREVMQVlfVkFMVUUwOwo+ID4gPiA+ICsJZHdjX3ByaXYtPmRseV9wYXJhbV8x
MG1bMF0gPSAweDA7Cj4gPiA+ID4gKwlkd2NfcHJpdi0+ZGx5X3BhcmFtXzEwbVsxXSA9IDB4MDsK
PiA+ID4gPiArCWR3Y19wcml2LT5kbHlfcGFyYW1fMTBtWzJdID0gMHgwOwo+ID4gPiAKPiA+ID4g
V2hhdCBhcmUgdGhlIHRocmVlIGRpZmZlcmVudCB2YWx1ZXMgZm9yPwo+ID4gPiAKPiA+IAo+ID4g
TGV0IG1lIGNsYXJpZnkgdGhlIHB1cnBvc2Ugb2YgdGhlIHRocmVlIGVsZW1lbnRzIGluIGVhY2gg
ZGx5X3BhcmFtXyogYXJyYXk6Cj4gPiAgIGRseV9wYXJhbV9beF1bMF06IERlbGF5IGNvbmZpZ3Vy
YXRpb24gZm9yIFRYRCBzaWduYWxzCj4gPiAgIGRseV9wYXJhbV9beF1bMV06IERlbGF5IGNvbmZp
Z3VyYXRpb24gZm9yIGNvbnRyb2wgc2lnbmFscyAoZS5nLiwgVFhfRU4sIFJYX0RWLCBSWF9DTEsp
Cj4gPiAgIGRseV9wYXJhbV9beF1bMl06IERlbGF5IGNvbmZpZ3VyYXRpb24gZm9yIFJYRCBzaWdu
YWxzCj4gCj4gTWF5YmUgYWRkIGEgI2RlZmluZSBvciBhbiBlbnVtIGZvciB0aGUgaW5kZXguCj4g
Cj4gRG8gdGhlc2UgZGVsYXlzIHJlcHJlc2VudCB0aGUgUkdNSUkgMm5zIGRlbGF5Pwo+IAoKWWVz
LCB0aGVzZSBkZWxheXMgcmVmZXIgdG8gdGhlIFJHTUlJIGRlbGF5LCBidXQgdGhleSBhcmUgbm90
IHN0cmljdGx5IDJucy4gVGhlcmUgYXJlIGEgZmV3IHBvaW50cyB0aGF0IHJlcXVpcmUgZnVydGhl
ciBjbGFyaWZpY2F0aW9uOgoxLiBSZWdhcmRpbmcgZGVsYXkgY29uZmlndXJhdGlvbiBsb2dpYzoK
ICAgQXMgeW91IG1lbnRpb25lZCBpbiB2ZXJzaW9uIFYyLCByeC1pbnRlcm5hbC1kZWxheS1wcyBh
bmQgdHgtaW50ZXJuYWwtZGVsYXktcHMgd2lsbCBiZSBtYXBwZWQgdG8gYW5kIG92ZXJ3cml0ZSB0
aGUgY29ycmVzcG9uZGluZyBiaXRzIGluIHRoZSBFSUM3NzAwX0RFTEFZX1ZBTFVFMSByZWdpc3Rl
ciwgd2hpY2ggY29udHJvbHMgdGhlIHJ4X2NsayBhbmQgdHhfY2xrIGRlbGF5cy4gSXMgdGhpcyB1
bmRlcnN0YW5kaW5nIGFuZCBhcHByb2FjaCBjb3JyZWN0IGFuZCBmZWFzaWJsZT8KMi4gQWJvdXQg
dGhlIHBoeS1tb2RlIHNldHRpbmc6CiAgIEluIG91ciBwbGF0Zm9ybSwgdGhlIGludGVybmFsIGRl
bGF5cyBhcmUgcHJvdmlkZWQgYnkgdGhlIE1BQy4gV2hlbiBjb25maWd1cmluZyByeC1pbnRlcm5h
bC1kZWxheS1wcyBhbmQgdHgtaW50ZXJuYWwtZGVsYXktcHMgaW4gdGhlIGRldmljZSB0cmVlLCBp
cyBpdCBhcHByb3ByaWF0ZSB0byBzZXQgcGh5LW1vZGUgPSAicmdtaWktaWQiIGluIHRoaXMgY2Fz
ZT8KMy4gRGVsYXkgdmFsdWVzIGJlaW5nIGdyZWF0ZXIgdGhhbiAybnM6CiAgIEluIG91ciBwbGF0
Zm9ybSwgdGhlIG9wdGltYWwgZGVsYXkgdmFsdWVzIGZvciByeF9jbGsgYW5kIHR4X2NsayBhcmUg
ZGV0ZXJtaW5lZCBiYXNlZCBvbiB0aGUgYm9hcmQtbGV2ZWwgdGltaW5nIGFkanVzdG1lbnQsIGFu
ZCBib3RoIGFyZSBncmVhdGVyIHRoYW4gMm5zLiBHaXZlbiB0aGlzLCBpcyBpdCByZWFzb25hYmxl
IGFuZCBjb21wbGlhbnQgd2l0aCB0aGUgUkdNSUkgc3BlY2lmaWNhdGlvbiB0byBzZXQgYm90aCBy
eC1pbnRlcm5hbC1kZWxheS1wcyBhbmQgdHgtaW50ZXJuYWwtZGVsYXktcHMgdG8gdmFsdWVzIGdy
ZWF0ZXIgdGhhbiAybnMgaW4gdGhlIERldmljZSBUcmVlPwoKPiA+ID4gewo+ID4gPiA+ICsJCWVp
Yzc3MDBfc2V0X2RlbGF5KGR3Y19wcml2LT5yeF9kZWxheV9wcywgZHdjX3ByaXYtPnR4X2RlbGF5
X3BzLAo+ID4gPiA+ICsJCQkJICAmZHdjX3ByaXYtPmRseV9wYXJhbV8xMDAwbVsxXSk7Cj4gPiA+
ID4gKwkJZWljNzcwMF9zZXRfZGVsYXkoZHdjX3ByaXYtPnJ4X2RlbGF5X3BzLCBkd2NfcHJpdi0+
dHhfZGVsYXlfcHMsCj4gPiA+ID4gKwkJCQkgICZkd2NfcHJpdi0+ZGx5X3BhcmFtXzEwMG1bMV0p
Owo+ID4gPiA+ICsJCWVpYzc3MDBfc2V0X2RlbGF5KGR3Y19wcml2LT5yeF9kZWxheV9wcywgZHdj
X3ByaXYtPnR4X2RlbGF5X3BzLAo+ID4gPiA+ICsJCQkJICAmZHdjX3ByaXYtPmRseV9wYXJhbV8x
MG1bMV0pOwo+ID4gPiA+ICsJfSBlbHNlIHsKPiA+ID4gPiArCQlkZXZfZGJnKCZwZGV2LT5kZXYs
ICIgdXNlIGRlZmF1bHQgZGx5XG4iKTsKPiA+ID4gCj4gPiA+IFdoYXQgaXMgdGhlIGRlZmF1bHQ/
IEl0IHNob3VsZCBiZSAwcHMuIFNvIHRoZXJlIGlzIG5vIHBvaW50IHByaW50aW5nCj4gPiA+IHRo
aXMgbWVzc2FnZS4KPiA+ID4gCj4gPiAKPiA+IFRoZSBkZWZhdWx0IHZhbHVlIGlzIEVJQzc3MDBf
REVMQVlfVkFMVUUxCj4gCj4gQnV0IHdoYXQgZG9lcyBFSUM3NzAwX0RFTEFZX1ZBTFVFMSBtZWFu
PyBJdCBzaG91bGQgbWVhbiAwcHM/IEJ1dCBpJ20KPiBub3Qgc3VyZSBpdCBkb2VzLgo+IAoKVGhl
cmUgaXMgYSBxdWVzdGlvbiB0aGF0IG5lZWRzIGNsYXJpZmljYXRpb246ClRoZSBFSUM3NzAwX0RF
TEFZX1ZBTFVFMCBhbmQgRUlDNzcwMF9ERUxBWV9WQUxVRTEgcmVnaXN0ZXJzIGNvbnRhaW4gdGhl
IG9wdGltYWwgZGVsYXkgY29uZmlndXJhdGlvbnMgZGV0ZXJtaW5lZCB0aHJvdWdoIGJvYXJkLWxl
dmVsIHBoYXNlIGFkanVzdG1lbnQuIFRoZXJlZm9yZSwgdGhleSBhcmUgYWxzbyB1c2VkIGFzIHRo
ZSBkZWZhdWx0IHZhbHVlcyBpbiBvdXIgcGxhdGZvcm0uIElmIHRoZSBkZWZhdWx0IGRlbGF5IGlz
IHNldCB0byAwcHMsIHRoZSBFdGhlcm5ldCBpbnRlcmZhY2UgbWF5IGZhaWwgdG8gZnVuY3Rpb24g
Y29ycmVjdGx5IGluIG91ciBwbGF0Zm9ybS4KCj4gCUFuZHJldwo=

