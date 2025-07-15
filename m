Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DCCC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xB5EghpbSrv6Sqz4VyNO3FDlKrV5W1SVR1hsXpnBTI=; b=xjxTjsZLgtbCfvtaFXSnbct25F
	8NudFhvnoUtRRh0KzkNwbZS66Iez13K9Nc/D6xdL47UNhbWGUvLFoJpQi1YGAgIf5PDknLwDRQk+O
	HwIcf8qIbmtB7ojjkYRMKt3h8eb62q0zJFxSstebRcskmCHp+xNAsArze86VJ4NRlZ/6/NTZsUIOG
	73+6c60swWyt22TcTCezcXwtUtjgVtpCTN9nYcnqPEHjqhUnb9XJW4CkGimjMoWjuBebFc2MO4cym
	uAvGLkLF8E3K2+xaM5Oh6xj9Hdll0LWox8k9inCNt4qju6McKTph5+VLM9SnK+t83HQcojHEII3bX
	mIqxwvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcPe-00000004lyN-2lpG;
	Tue, 15 Jul 2025 09:57:26 +0000
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net ([165.227.155.160])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubby5-00000004g0F-3gs0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 09:29:00 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 15 Jul 2025 17:28:37 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Tue, 15 Jul 2025 17:28:37 +0800 (GMT+08:00)
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
Subject: Re: Re: [PATCH v3 2/2] ethernet: eswin: Add eic7700 ethernet driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
 <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgA3WxFFH3ZoVkCwAA--.12407W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEEDGh1MO8nDwAAsi
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_022858_212370_CA1543EE 
X-CRM114-Status: GOOD (  15.22  )
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
LTA0IDAwOjEyOjI5ICjmmJ/mnJ/kupQpCj4g5pS25Lu25Lq6OiB3ZWlzaGFuZ2p1YW5AZXN3aW5j
b21wdXRpbmcuY29tCj4g5oqE6YCBOiBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVt
bG9mdC5uZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9iaEBrZXJu
ZWwub3JnLCBrcnprK2R0QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2
Z2VyLmtlcm5lbC5vcmcsIGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnLCBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tLCBhbGV4YW5kcmUudG9y
Z3VlQGZvc3Muc3QuY29tLCBybWsra2VybmVsQGFybWxpbnV4Lm9yZy51aywgeW9uZy5saWFuZy5j
aG9vbmdAbGludXguaW50ZWwuY29tLCB2bGFkaW1pci5vbHRlYW5AbnhwLmNvbSwganN6aGFuZ0Br
ZXJuZWwub3JnLCBqYW4ucGV0cm91c0Bvc3MubnhwLmNvbSwgcHJhYmhha2FyLm1haGFkZXYtbGFk
LnJqQGJwLnJlbmVzYXMuY29tLCBpbm9jaGlhbWFAZ21haWwuY29tLCBib29uLmtoYWkubmdAYWx0
ZXJhLmNvbSwgZGZ1c3RpbmlAdGVuc3RvcnJlbnQuY29tLCAweDEyMDdAZ21haWwuY29tLCBsaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tLCBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1pbkBlc3dp
bmNvbXB1dGluZy5jb20sIGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20KPiDkuLvpopg6IFJlOiBb
UEFUQ0ggdjMgMi8yXSBldGhlcm5ldDogZXN3aW46IEFkZCBlaWM3NzAwIGV0aGVybmV0IGRyaXZl
cgo+IAo+ID4gKy8qIERlZmF1bHQgZGVsYXkgdmFsdWUqLwo+ID4gKyNkZWZpbmUgRUlDNzcwMF9E
RUxBWV9WQUxVRTAgMHgyMDIwMjAyMAo+ID4gKyNkZWZpbmUgRUlDNzcwMF9ERUxBWV9WQUxVRTEg
MHg5NjIwNUEyMAo+IAo+IFdlIG5lZWQgYSBiZXR0ZXIgZXhwbGFuYXRpb24gb2Ygd2hhdCBpcyBn
b2luZyBvbiBoZXJlLiBXaGF0IGRvIHRoZXNlCj4gbnVtYmVycyBtZWFuPwo+IAoKTGV0IG1lIGNs
YXJpZnk6CiAgRUlDNzcwMF9ERUxBWV9WQUxVRTAgKDB4MjAyMDIwMjApIGlzIHVzZWQgdG8gY29u
ZmlndXJlIGRlbGF5IHRhcHMgZm9yIFRYRFszOjBdIHNpZ25hbHMuIEVhY2ggYnl0ZSByZXByZXNl
bnRzIHRoZSBkZWxheSB2YWx1ZSBmb3Igb25lIGRhdGEgbGluZS4KICBFSUM3NzAwX0RFTEFZX1ZB
TFVFMSAoMHg5NjIwNUEyMCkgY29uZmlndXJlcyBjb250cm9sIHNpZ25hbCBkZWxheXMsIHN1Y2gg
YXMgVFhfRU4sIFJYX0RWLCBhbmQgb3RoZXJzLiBBZ2FpbiwgZWFjaCBieXRlIGNvcnJlc3BvbmRz
IHRvIGEgc3BlY2lmaWMgc2lnbmFsIGxpbmUuCk1vcmUgZGV0YWlsZWQgaW5saW5lIGNvbW1lbnRz
IHdpbGwgYmUgYWRkZWQgaW4gdGhlIG5leHQgcGF0Y2jCoHRvIGV4cGxhaW4gdGhlIGJpdCBsYXlv
dXQgYW5kIHB1cnBvc2Ugb2YgZWFjaCBieXRlIGluIHRoZXNlIGRlZmF1bHQgdmFsdWVzLiBJcyB0
aGlzIHVuZGVyc3RhbmRpbmcgY29ycmVjdD8KCj4gPiArCWR3Y19wcml2LT5kbHlfcGFyYW1fMTAw
MG1bMF0gPSBFSUM3NzAwX0RFTEFZX1ZBTFVFMDsKPiA+ICsJZHdjX3ByaXYtPmRseV9wYXJhbV8x
MDAwbVsxXSA9IEVJQzc3MDBfREVMQVlfVkFMVUUxOwo+ID4gKwlkd2NfcHJpdi0+ZGx5X3BhcmFt
XzEwMDBtWzJdID0gRUlDNzcwMF9ERUxBWV9WQUxVRTA7Cj4gPiArCWR3Y19wcml2LT5kbHlfcGFy
YW1fMTAwbVswXSA9IEVJQzc3MDBfREVMQVlfVkFMVUUwOwo+ID4gKwlkd2NfcHJpdi0+ZGx5X3Bh
cmFtXzEwMG1bMV0gPSBFSUM3NzAwX0RFTEFZX1ZBTFVFMTsKPiA+ICsJZHdjX3ByaXYtPmRseV9w
YXJhbV8xMDBtWzJdID0gRUlDNzcwMF9ERUxBWV9WQUxVRTA7Cj4gPiArCWR3Y19wcml2LT5kbHlf
cGFyYW1fMTBtWzBdID0gMHgwOwo+ID4gKwlkd2NfcHJpdi0+ZGx5X3BhcmFtXzEwbVsxXSA9IDB4
MDsKPiA+ICsJZHdjX3ByaXYtPmRseV9wYXJhbV8xMG1bMl0gPSAweDA7Cj4gCj4gV2hhdCBhcmUg
dGhlIHRocmVlIGRpZmZlcmVudCB2YWx1ZXMgZm9yPwo+IAoKTGV0IG1lIGNsYXJpZnkgdGhlIHB1
cnBvc2Ugb2YgdGhlIHRocmVlIGVsZW1lbnRzIGluIGVhY2ggZGx5X3BhcmFtXyogYXJyYXk6CiAg
ZGx5X3BhcmFtX1t4XVswXTogRGVsYXkgY29uZmlndXJhdGlvbiBmb3IgVFhEIHNpZ25hbHMKICBk
bHlfcGFyYW1fW3hdWzFdOiBEZWxheSBjb25maWd1cmF0aW9uIGZvciBjb250cm9sIHNpZ25hbHMg
KGUuZy4sIFRYX0VOLCBSWF9EViwgUlhfQ0xLKQogIGRseV9wYXJhbV9beF1bMl06IERlbGF5IGNv
bmZpZ3VyYXRpb24gZm9yIFJYRCBzaWduYWxzClRoZXNlIHZhbHVlcyBhcmUgZGVmaW5lZCBzZXBh
cmF0ZWx5IGZvciBkaWZmZXJlbnQgbGluayBzcGVlZHM6IDEwMDAgTWJwcywgMTAwIE1icHMsIGFu
ZCAxMCBNYnBzLiBEdXJpbmcgUEhZIGluaXRpYWxpemF0aW9uIG9yIHdoZW4gdGhlIGxpbmsgc3Bl
ZWQgY2hhbmdlcywgdGhlIGNvcnJlc3BvbmRpbmcgZGVsYXkgcGFyYW1ldGVycyBhcmUgc2VsZWN0
ZWQgYW5kIGFwcGxpZWQgdG8gdGhlIGhhcmR3YXJlIHJlZ2lzdGVycy4KSW5saW5lIGNvbW1lbnRz
IHdpbGwgYmUgYWRkZWQgaW4gdGhlIG5leHQgcGF0Y2ggdG8gY2xhcmlmeSB0aGUgbWVhbmluZyBh
bmQgdXNhZ2Ugb2YgZWFjaCBlbGVtZW50LiBJcyB0aGlzIHVuZGVyc3RhbmRpbmcgY29ycmVjdD8K
Cj4gPiArCj4gPiArCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2Rl
LCAicngtaW50ZXJuYWwtZGVsYXktcHMiLAo+ID4gKwkJCQkgICAmZHdjX3ByaXYtPnJ4X2RlbGF5
X3BzKTsKPiA+ICsJaWYgKHJldCkKPiA+ICsJCWRldl9kYmcoJnBkZXYtPmRldiwgImNhbid0IGdl
dCByeC1pbnRlcm5hbC1kZWxheS1wcywgcmV0KCVkKS4iLCByZXQpOwo+ID4gKwllbHNlCj4gPiAr
CQloYXNfcnhfZGx5ID0gdHJ1ZTsKPiA+ICsKPiA+ICsJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91
MzIocGRldi0+ZGV2Lm9mX25vZGUsICJ0eC1pbnRlcm5hbC1kZWxheS1wcyIsCj4gPiArCQkJCSAg
ICZkd2NfcHJpdi0+dHhfZGVsYXlfcHMpOwo+ID4gKwlpZiAocmV0KQo+ID4gKwkJZGV2X2RiZygm
cGRldi0+ZGV2LCAiY2FuJ3QgZ2V0IHR4LWludGVybmFsLWRlbGF5LXBzLCByZXQoJWQpLiIsIHJl
dCk7Cj4gPiArCWVsc2UKPiA+ICsJCWhhc190eF9kbHkgPSB0cnVlOwo+ID4gKwlpZiAoaGFzX3J4
X2RseSAmJiBoYXNfdHhfZGx5KQo+IAo+IFdoYXQgaWYgaSBvbmx5IHRvIHNldCBhIFRYIGRlbGF5
PyBJIHdhbnQgdGhlIFJYIGRlbGF5IHRvIGRlZmF1bHQgdG8KPiAwcHMuCj4gCgpZZXMsIHRoaXMg
Y2FuIGJlIGhhbmRsZWQgc2VwYXJhdGVseSBieSBjYWxsaW5nIGVpYzc3MDBfc2V0X3JnbWlpX3J4
X2RseSgpIGFuZCBlaWM3NzAwX3NldF9yZ21paV90eF9kbHkoKSBpbiB0aGUgbmV4dCBwYXRjaC4g
SXMgdGhpcyBjb3JyZWN0PwoKPiB7Cj4gPiArCQllaWM3NzAwX3NldF9kZWxheShkd2NfcHJpdi0+
cnhfZGVsYXlfcHMsIGR3Y19wcml2LT50eF9kZWxheV9wcywKPiA+ICsJCQkJICAmZHdjX3ByaXYt
PmRseV9wYXJhbV8xMDAwbVsxXSk7Cj4gPiArCQllaWM3NzAwX3NldF9kZWxheShkd2NfcHJpdi0+
cnhfZGVsYXlfcHMsIGR3Y19wcml2LT50eF9kZWxheV9wcywKPiA+ICsJCQkJICAmZHdjX3ByaXYt
PmRseV9wYXJhbV8xMDBtWzFdKTsKPiA+ICsJCWVpYzc3MDBfc2V0X2RlbGF5KGR3Y19wcml2LT5y
eF9kZWxheV9wcywgZHdjX3ByaXYtPnR4X2RlbGF5X3BzLAo+ID4gKwkJCQkgICZkd2NfcHJpdi0+
ZGx5X3BhcmFtXzEwbVsxXSk7Cj4gPiArCX0gZWxzZSB7Cj4gPiArCQlkZXZfZGJnKCZwZGV2LT5k
ZXYsICIgdXNlIGRlZmF1bHQgZGx5XG4iKTsKPiAKPiBXaGF0IGlzIHRoZSBkZWZhdWx0PyBJdCBz
aG91bGQgYmUgMHBzLiBTbyB0aGVyZSBpcyBubyBwb2ludCBwcmludGluZwo+IHRoaXMgbWVzc2Fn
ZS4KPiAKClRoZSBkZWZhdWx0IHZhbHVlIGlzIEVJQzc3MDBfREVMQVlfVkFMVUUxLCB3aGljaCBp
cyB1c2VkIGluIHRoZSBhYnNlbmNlIG9mIHRoZSBEVFMgYXR0cmlidXRlLiBUaGUgcHJpbnQgbWVz
c2FnZSB3aWxsIGJlIHJlbW92ZWQgaW4gdGhlIG5leHQgcGF0Y2guIElzIHRoaXMgY29ycmVjdD8K
Cj4gCUFuZHJldwo=

