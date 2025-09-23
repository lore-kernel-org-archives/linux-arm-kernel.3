Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382B2CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 03:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKjJjUJFFbk7Ak+Tf4z4jgGW1f5LOmkcdWZKxun+c30=; b=oBJJPH5+EWbNb4T/3GyM5L3jG+
	guQ0iv0PvzqUCIftu9aNmDlOcqPLXcLc9ZLJr3oGuPfaIQ2WbXrIcswsF29GjE+pkNBwLDcnyEHxN
	mI4+YL2tWz5Ajyx921GRSvXb1gzmboQZk8Xsz3Sjoh9QRVpjbALmKeYtzF2ic5mxDuPFqq26OGyjh
	7PsxB3a1IxsX3Ukl4mTcBHuhVSlqo+bD0YCI8SXJPax3qJWB9Iiyt8XT50KVkDaGMpdaox43Y18JP
	VBrrgsq1ciZbaivHzeQ8i30aUUC4mp+4bYdLwJ1XXXggER7bvRoujssxZ2nKhzzFa9bVy5MYdOhDc
	jwSScpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tMi-0000000CBlN-0T8S;
	Tue, 23 Sep 2025 03:06:52 +0000
Received: from l-sdnproxy.icoremail.net ([20.188.111.126] helo=azure-sdnproxy.icoremail.net)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tMd-0000000CBka-3kwy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 03:06:49 +0000
Received: from weishangjuan$eswincomputing.com ( [10.12.96.155] ) by
 ajax-webmail-app2 (Coremail) ; Tue, 23 Sep 2025 11:06:08 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.155]
Date: Tue, 23 Sep 2025 11:06:08 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6Z+m5bCa5aif?= <weishangjuan@eswincomputing.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	yong.liang.choong@linux.intel.com, anthony.l.nguyen@intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, jan.petrous@oss.nxp.com,
	jszhang@kernel.org, inochiama@gmail.com, 0x1207@gmail.com,
	boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v7 2/2] ethernet: eswin: Add eic7700 ethernet driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aMw-dgNiXgPeqeSz@shell.armlinux.org.uk>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918090026.3280-1-weishangjuan@eswincomputing.com>
 <aMw-dgNiXgPeqeSz@shell.armlinux.org.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <30080c70.16e1.199748921d3.Coremail.weishangjuan@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgDHZpWgDtJoo9vXAA--.25976W
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/1tbiAgEOEGjRel
	QTIgABs6
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_200648_110220_CD6CA8AD 
X-CRM114-Status: GOOD (  25.26  )
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

SGkgS2luZywKSSBob3BlIHRoaXMgbWVzc2FnZSBmaW5kcyB5b3Ugd2VsbC4KVGhhbmsgeW91IGZv
ciB5b3VyIHByb2Zlc3Npb25hbCBhbmQgdmFsdWFibGUgc3VnZ2VzdGlvbnMuCk91ciBxdWVzdGlv
bnMgYXJlIGVtYmVkZGVkIGJlbG93IHlvdXIgY29tbWVudHMgaW4gdGhlIG9yaWdpbmFsIGVtYWls
IGJlbG93LgoKQmVzdCByZWdhcmRzLApTaGFuZ2p1YW4gV2VpCgoKPiAtLS0tLeWOn+Wni+mCruS7
ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiUnVzc2VsbCBLaW5nIChPcmFjbGUpIiA8bGludXhAYXJtbGlu
dXgub3JnLnVrPgo+IOWPkemAgeaXtumXtDoyMDI1LTA5LTE5IDAxOjE2OjM4ICjmmJ/mnJ/kupQp
Cj4g5pS25Lu25Lq6OiB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tCj4g5oqE6YCBOiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgYW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBk
YXZlbWxvZnQubmV0LCBlZHVtYXpldEBnb29nbGUuY29tLCBrdWJhQGtlcm5lbC5vcmcsIHJvYmhA
a2VybmVsLm9yZywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRk
ZXZAdmdlci5rZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWNvcXVlbGluLnN0bTMyQGdt
YWlsLmNvbSwgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwgdmxhZGltaXIub2x0ZWFuQG54
cC5jb20sIHlvbmcubGlhbmcuY2hvb25nQGxpbnV4LmludGVsLmNvbSwgYW50aG9ueS5sLm5ndXll
bkBpbnRlbC5jb20sIHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbSwgamFu
LnBldHJvdXNAb3NzLm54cC5jb20sIGpzemhhbmdAa2VybmVsLm9yZywgaW5vY2hpYW1hQGdtYWls
LmNvbSwgMHgxMjA3QGdtYWlsLmNvbSwgYm9vbi5raGFpLm5nQGFsdGVyYS5jb20sIGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20sIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgbmluZ3l1QGVzd2lu
Y29tcHV0aW5nLmNvbSwgbGlubWluQGVzd2luY29tcHV0aW5nLmNvbSwgbGl6aGkyQGVzd2luY29t
cHV0aW5nLmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tCj4g5Li76aKYOiBSZTog
W1BBVENIIHY3IDIvMl0gZXRoZXJuZXQ6IGVzd2luOiBBZGQgZWljNzcwMCBldGhlcm5ldCBkcml2
ZXIKPiAKPiBPbiBUaHUsIFNlcCAxOCwgMjAyNSBhdCAwNTowMDoyNlBNICswODAwLCB3ZWlzaGFu
Z2p1YW5AZXN3aW5jb21wdXRpbmcuY29tIHdyb3RlOgo+ID4gKwlwbGF0X2RhdC0+Y2xrX3R4X2kg
PSBzdG1tYWNfcGx0ZnJfZmluZF9jbGsocGxhdF9kYXQsICJ0eCIpOwo+ID4gKwlwbGF0X2RhdC0+
c2V0X2Nsa190eF9yYXRlID0gc3RtbWFjX3NldF9jbGtfdHhfcmF0ZTsKPiA+ICsJcGxhdF9kYXQt
PmJzcF9wcml2ID0gZHdjX3ByaXY7Cj4gPiArCXBsYXRfZGF0LT5jbGtzX2NvbmZpZyA9IGVpYzc3
MDBfY2xrc19jb25maWc7Cj4gPiArCWR3Y19wcml2LT5wbGF0X2RhdCA9IHBsYXRfZGF0Owo+ID4g
Kwo+ID4gKwlyZXQgPSBlaWM3NzAwX2Nsa3NfY29uZmlnKGR3Y19wcml2LCB0cnVlKTsKPiA+ICsJ
aWYgKHJldCkKPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsCj4gPiArCQkJ
CXJldCwKPiA+ICsJCQkJImVycm9yIGVuYWJsZSBjbG9ja1xuIik7Cj4gPiArCj4gPiArCXJldCA9
IHN0bW1hY19kdnJfcHJvYmUoJnBkZXYtPmRldiwgcGxhdF9kYXQsICZzdG1tYWNfcmVzKTsKPiA+
ICsJaWYgKHJldCkgewo+ID4gKwkJZWljNzcwMF9jbGtzX2NvbmZpZyhkd2NfcHJpdiwgZmFsc2Up
Owo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwKPiA+ICsJCQkJcmV0LAo+
ID4gKwkJCQkiRmFpbGVkIHRvIGRyaXZlciBwcm9iZVxuIik7Cj4gPiArCX0KPiA+ICsKPiA+ICsJ
cmV0dXJuIHJldDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgZWljNzcwMF9kd21hY19y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICt7Cj4gPiArCXN0cnVjdCBl
aWM3NzAwX3Fvc19wcml2ICpkd2NfcHJpdiA9IGdldF9zdG1tYWNfYnNwX3ByaXYoJnBkZXYtPmRl
dik7Cj4gPiArCj4gPiArCXN0bW1hY19wbHRmcl9yZW1vdmUocGRldik7Cj4gPiArCWVpYzc3MDBf
Y2xrc19jb25maWcoZHdjX3ByaXYsIGZhbHNlKTsKPiAKPiBJdCB3b3VsZCBiZSBuaWNlIHRvIHNl
ZSB0aGUgYWJvdmUgY29kZSBjbGVhbmVkIHVwIGxpa2UgSSBkaWQgZm9yIGFsbAo+IHRoZSBvdGhl
ciBzdG1tYWMgZ2x1ZSBkcml2ZXJzIHJlY2VudGx5Lgo+IAo+IEhvd2V2ZXIsIHRoaXMgaXMgbm90
IHRvIHNheSB0aGlzIHNob3VsZG4ndCBiZSBtZXJnZWQgLSBidXQgcGxlYXNlCj4gY29uc2lkZXIg
dGhpcyBpZiB5b3UgZG8gYW5vdGhlciByZXdvcmsgb2YgdGhlc2UgcGF0Y2hlcywgaWYgbm90IGFz
Cj4gYSBmb2xsb3ctdXAgcGF0Y2guCj4gCj4gRXNzZW50aWFsbHksIHlvdSBjYW4gdXNlIGRldm1f
c3RtbWFjX3BsdGZtX3Byb2JlKCksIHBvcHVsYXRlIHRoZQo+IHBsYXRfZGF0LT5pbml0KCkgYW5k
IHBsYXRfZGF0LT5leGl0KCkgbWV0aG9kcyB0byBjYWxsIHRoZQo+IGNsa3NfY29uZmlnIGZ1bmN0
aW9uLCBidXQgYXMgeW91IGRvbid0IHdhbnQgdGhlc2UgbWV0aG9kcyB0byBiZQo+IGNhbGxlZCBk
dXJpbmcgc3VzcGVuZC9yZXN1bWUgKGJlY2F1c2UgcGxhdF9kYXQtPmNsa3NfY29uZmlnKCkgaXMK
PiBhbHJlYWR5IGNhbGxlZCB0aGVyZSksIHByb3ZpZGUgZW1wdHkgcGxhdF9kYXQtPnN1c3BlbmQo
KSBhbmQKPiBwbGF0X2RhdC0+cmVzdW1lKCkgbWV0aG9kcy4KPiAKPiBCb251cyBwb2ludHMgaWYg
eW91IGluY2x1ZGUgYSBwYXRjaCB3aGljaCBwcm92aWRlcyB0aGlzIGZ1bmN0aW9uYWxpdHkKPiBh
cyBsaWJyYXJ5IGZ1bmN0aW9ucyBpbiBzdG1tYWNfcGxhdGZvcm0uYyB3aGljaCBjYW4gYmUgdXNl
ZCB0bwo+IGluaXRpYWxpc2UgLT5pbml0KCkgYW5kIC0+ZXhpdCgpIGZvciB0aGlzIGJlaGF2aW91
ciwgYW5kIGNoZWNrIG90aGVyCj4gc3RtbWFjIHBsYXRmb3JtIGdsdWUgZHJpdmVycyB0byBzZWUg
aWYgdGhleSB3b3VsZCBiZW5lZml0IGZyb20gdXNpbmcKPiB0aGVzZS4KPiAKCkluIHRoZSBjdXJy
ZW50IGVpYzc3MDBfZHdtYWMgZ2x1ZSBkcml2ZXIsIHRoZSByZWdtYXBfcmVhZCgpL3dyaXRlKCkK
b3BlcmF0aW9ucyhmb3IgcGh5X2N0cmwxLCBheGlfbHBfY3RybDEsIGFuZCB0aGUgUlgvVFggZGVs
YXkgcmVnaXN0ZXJzKSlhcmXCoApwZXJmb3JtZWQgZGlyZWN0bHkgaW4gdGhlIHByb2JlKCkgZnVu
Y3Rpb24uIFdvdWxkIGl0IGJlIGNsZWFuZXIgdG8gbW92ZSB0aGVzZQpyZWdpc3RlciBjb25maWd1
cmF0aW9ucyBpbnRvIHRoZSBpbml0KCkgY2FsbGJhY2sgaW5zdGVhZCwgc28gdGhhdCB0aGV5IGFy
ZQphbHNvIHJlYXBwbGllZCBkdXJpbmcgcmVzdW1lKCk/Cgo+IE9mIGNvdXJzZSwgaXQgd291bGQg
YmUgbmljZSBub3QgdG8gaGF2ZSB0byBnbyB0byB0aGUgZXh0ZW50IG9mCj4gYWRkaW5nIGVtcHR5
IGZ1bmN0aW9ucyBmb3IgLT5zdXNwZW5kKCkgYW5kIC0+cmVzdW1lKCksIGJ1dCBzdG1tYWMgaGFz
Cj4gYSBsb3Qgb2Ygd2VpcmRvIGhpc3RvcnksIGFuZCB0aGVyZSB3YXMgbm8gZWFzeSB3YXkgdG8g
bWFpbnRhaW4KPiBjb21wYXRpYmlsaXR5IHdpdGhvdXQgZG9pbmcgdGhhdCB3aGVuIEkgYWRkZWQg
dGhlc2UgdHdvIG5ldyBtZXRob2RzLgo+IAo+IExhc3RseSwgcGxlYXNlIGNvbnNpZGVyIHVzaW5n
ICJuZXQ6IHN0bW1hYzogPHNob3J0ZW5lZC1nbHVlLW5hbWU+OiBibGFoIgo+IGFzIHRoZSBzdWJq
ZWN0IHNvIHRoZXJlJ3MgYSBjb25zaXN0ZW50IHN0eWxlIGZvciBzdG1tYWMgcGF0Y2hlcy4KPiAK
PiBUaGFua3MuCj4gCj4gLS0gCj4gUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1s
aW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCj4gRlRUUCBpcyBoZXJlISA4ME1icHMgZG93
biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEK

