Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0157C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 03:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezxQvwOxGuSpFi0s3YyWCMCyQtN11Wbd88jyJxOLJ2M=; b=2dy0g5PDz/4N5ux2NdaKxVSnv+
	yRn/WNHr0aVo76gK+l/WIoBhioENVnKoinvwPvda31LyV4XZrhkqDZkNghLDvWSo/QuM31glrKj9R
	46MkKD05Z8igmHwjhjNFv6AmbqcV/qKRciLBx5oSRe2Q+0EgwrOhuhACwmdC1sQnS2aaUiv6cgWMP
	BIlMU5pIVMamxhgisxZGKztxLQ+wVARpACbh5omBUlU2A9km3qbNEzB6jGoRvQUqYcmh0QPpd4Ty5
	j0BGEpwsEHHGsXme6FmgiYftSWVn4S7K4mn/7FN6tohMKaLPXmn6VMKTeA9mL1ItlArXjao/tyVjo
	o0Iu5WBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkCzx-0000000Bouq-3BIy;
	Mon, 26 Jan 2026 03:10:41 +0000
Received: from azure-sdnproxy.icoremail.net ([52.229.168.213])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkCzu-0000000BouM-3VzS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 03:10:41 +0000
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 26 Jan 2026 11:10:12 +0800 (GMT+08:00)
X-Originating-IP: [10.10.96.205]
Date: Mon, 26 Jan 2026 11:10:12 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Min Lin" <linmin@eswincomputing.com>
To: "Bo Gan" <ganboing@gmail.com>
Cc: "Andrew Lunn" <andrew@lunn.ch>, "Krzysztof Kozlowski" <krzk@kernel.org>,
	=?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
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
In-Reply-To: <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
 <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <73ea5619.2b71.19bf847c80d.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TQJkCgAXiy0U23Zp0gsGAA--.1374W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAQETCWl2RY0XlgABsN
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_191039_049729_4B7F25F3 
X-CRM114-Status: GOOD (  26.50  )
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

SGkgQm8gR2FuCgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiAiQm8gR2Fu
IiA8Z2FuYm9pbmdAZ21haWwuY29tPgo+IFNlbmQgdGltZTpTYXR1cmRheSwgMjQvMDEvMjAyNiAx
Mjo1NzoyMwo+IFRvOiAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4KPiBDYzogIktyenlz
enRvZiBLb3psb3dza2kiIDxrcnprQGtlcm5lbC5vcmc+LCDmnY7lv5cgPGxpemhpMkBlc3dpbmNv
bXB1dGluZy5jb20+LCBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgYW5kcmV3K25ldGRldkBs
dW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpldEBnb29nbGUuY29tLCBrdWJhQGtl
cm5lbC5vcmcsIHJvYmhAa2VybmVsLm9yZywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBr
ZXJuZWwub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWNv
cXVlbGluLnN0bTMyQGdtYWlsLmNvbSwgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwgcm1r
K2tlcm5lbEBhcm1saW51eC5vcmcudWssIGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20sIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZywgbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWluQGVz
d2luY29tcHV0aW5nLmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCB3ZWlzaGFu
Z2p1YW5AZXN3aW5jb21wdXRpbmcuY29tCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAxLzJdIGR0
LWJpbmRpbmdzOiBldGhlcm5ldDogZXN3aW46IGFkZCBjbG9jayBzYW1wbGluZyBjb250cm9sCj4g
Cj4gSGkgQW5kcmV3LAo+IAo+IE9uIDEvMjMvMjYgMTE6NDMsIEFuZHJldyBMdW5uIHdyb3RlOgo+
ID4gT24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMDI6NDc6MThBTSAtMDgwMCwgQm8gR2FuIHdyb3Rl
Ogo+ID4+IEhpIEtyenlzenRvZiwKPiA+Pgo+ID4+IE9uIDEvMjMvMjYgMDI6MDcsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6Cj4gPj4+IE9uIDIzLzAxLzIwMjYgMDg6MzksIEJvIEdhbiB3cm90
ZToKPiA+Pj4+PiBJIGFzc3VtZSB0aGUgYWRkcmVzcyBvZiB0aGUgaW50ZXJmYWNlIGlzIGZpeGVk
LiBTbyB5b3UgY2FuIGp1c3Qga2V5Cj4gPj4+Pj4gb2ZmIHRoYXQgdG8gZGlzdGluZ3Vpc2ggdGhl
IHR3byBpbnN0YW5jZXMuCj4gPj4+Pj4KPiA+Pj4+PiBTaW5jZSB0aGlzIGlzIGFuIGludGVybmFs
IHByb3BlcnR5LCBub3QgYSBib2FyZCBwcm9wZXJ0eSwgaXQgaXMgbm90Cj4gPj4+Pj4gY2xlYXIg
aXQgYWN0dWFsbHkgYmVsb25ncyBvbiBEVC4KPiA+Pj4+Pgo+ID4+Pj4+ICAgICAgICBBbmRyZXcK
PiA+Pj4+Cj4gPj4+PiBJTU8sIHRoZXkgc2hvdWxkIGJlIGluIERUIHRvIHByb3ZpZGUgbWF4aW11
bSBmbGV4aWJpbGl0eS4gVGhlIFNvQyAuZHRzaQo+ID4+Pgo+ID4+PiBUaGlzIGlzIG5vdCB0aGUg
cHVycG9zZSBvZiBEVC4gUGxlYXNlIHJhdGhlciB1c2UgYXJndW1lbnRzIGluIHRlcm1zIG9mCj4g
Pj4+IERUIHJ1bGVzIChzZWUgZG9jcywgcHJlc2VudGF0aW9ucykuCj4gPj4+Cj4gPj4gQW55IGV4
YW1wbGVzPyBsaW5rcz8gVGhhbmsgeW91IGZvciB5b3VyIHBhdGllbmNlLgo+ID4+Cj4gPj4gSSdk
IHNheSBpZiB0aGUgYm9hcmQgLmR0cyBuZXZlciBvdmVycmlkZXMgdGhlIGVzd2luLHJ4LWNsay1p
bnZlcnQsIChFLmcuLAo+ID4+IHRoZSBTb0MgLmR0c2kgaGFzIHJ4LWNsay1pbnZlcnQsIGxhdGVy
IHRoZSBib2FyZCAvZGVsZXRlLXByb3BlcnR5LydzIGl0KQo+ID4+IHRoZW4geWVzLCBpdCBjYW4g
YmUgdHJlYXRlZCBhcyBzb21ldGhpbmcgaW5oZXJlbnQgdG8gdGhlIG1hYywgYW5kIHRoZW4KPiA+
PiAidXNlIGFyZ3VtZW50cyBpbiB0ZXJtcyBvZiBEVCBydWxlcyIuIEkgd2FzIHRoaW5raW5nIGFi
b3V0IHVzZSBjYXNlcyBsaWtlOgo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIz
MDcxNDEwNDUyMS4xODc1MS0zLXNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tLwo+ID4gCj4gPiBZ
b3VyIGRldmljZSBzaG91bGQgYmUgY29tcGxpYW50IHdpdGggdGhlIFJHTUlJIHN0YW5kYXJkIGJ5
Cj4gPiBkZWZhdWx0LiBUaGVyZSBzaG91bGQgbm90IGJlIGEgRFQgcHJvcGVydHkgdG8gYXNrIGl0
IG5pY2VseSB0byBmb2xsb3cKPiA+IHRoZSBzdGFuZGFyZC4KPiA+IAo+ID4gUHJvcGVydGllcyBs
aWtlCj4gPiAKPiA+IG1vdG9yY29tbSx0eC1jbGstYWRqLWVuYWJsZWQ7Cj4gPiBtb3RvcmNvbW0s
dHgtY2xrLTEwMC1pbnZlcnRlZDsKPiA+IG1vdG9yY29tbSx0eC1jbGstMTAwMC1pbnZlcnRlZDsK
PiA+IAo+ID4gYXJlIGZvciBicm9rZW4gYm9hcmRzIHdoaWNoIGJyZWFrIHRoZSBzdGFuZGFyZCBh
bmQgcmVxdWlyZSB0aGUgTUFDIGRvCj4gPiBhbHNvIGJyZWFrIHRoZSBzdGFuZGFyZCBzbyB0aGF0
IGV2ZXJ5dGhpbmcgd29ya3MuIFdlIHNob3VsZCBub3Qgc3RhcnQKPiA+IG91dCB3aXRoIHRoZSBh
c3N1bXB0aW9uIHlvdSBuZWVkIHRvIHN1cHBvcnQgYnJva2VuIGJvYXJkcyB3aGljaCBpZ25vcmUK
PiA+IHRoZSBzdGFuZGFyZC4KPiAKPiBNeSByZWFkaW5nIG9mCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzMwOGI2NzYuMmQwMy4xOWJiMGNhZWJlZC5Db3JlbWFpbC5saXpoaTJAZXN3aW5j
b21wdXRpbmcuY29tLwo+IGlzIHRoYXQgdGhlIGV0aDEgTUFDIGlzIGFscmVhZHkgYnJlYWtpbmcg
dGhlIHN0YW5kYXJkIGF0IFNvQyBsZXZlbCwgYW5kCj4gdGhlIGJvYXJkcyBjYW4gdW4tYnJlYWsg
aXQgb3IgYnJlYWsgaXQgZXZlbiBtb3JlLiBIZW5jZSwgZXZlbiBmb3IgcHJvcGVyCj4gZGVzaWdu
ZWQgYm9hcmQsIFNvQyAuZHRzaSBzdGlsbCBuZWVkcyBlc3dpbixyeC1jbGstaW52ZXJ0IChmb3Ig
KmV0aDEqKS4KPiBGb3IgYnJva2VuIGJvYXJkcywgdGhleSBtYXkgcmVxdWlyZSBlc3dpbixyeC1j
bGstaW52ZXJ0IGZvciAqZXRoMCosIGV2ZW4KPiB0aG91Z2ggU29DIGRvZXNuJ3QgbWFuZGF0ZS4g
Rm9yICpldGgxKiBicm9rZW4gYm9hcmRzIG1pZ2h0IGhhdmUgdG8KPiAvZGVsZXRlLXByb3BlcnR5
LyBpdCBhbmQgdXNlIGVzd2luLHR4LWNsay1pbnZlcnQgb3Igc29tZXRoaW5nIGVsc2UuCj4gSXQn
cyBjbGVhcmVyIHRvIGhhdmUgYWxsIHRoZXNlIHBhcmFtZXRlcnMgdmlzaWJsZSBhbmQgZXhwbGlj
aXQgaW4gRFQuCj4gCj4gRVNXSU4sIHBsZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZy4KCkR1
ZSB0byBjaGlwIGJhY2tlbmQgcmVhc29ucywgdGhlcmUgaXMgYWxyZWFkeSBhIH40LTVucyBza2V3
IGJldHdlZW4gdGhlIFJYCmNsb2NrIGFuZCBkYXRhIG9mIHRoZSBldGgxIE1BQyBjb250cm9sbGVy
IGluc2lkZSB0aGUgc2lsaWNvbi4KVGhlIFJYIGNsb2NrIG11c3QgYmUgaW52ZXJ0ZWQgc2luY2Ug
aXQncyBub3QgYWJsZSB0byBtYXRjaCB0aGUgUkdNSUkKdGltaW5nIG9ubHkgYnkgYWRkaW5nIHJ4
LWludGVybmFsLWRlbGF5LXBzIG9uIHRoZSBNQUMgYW5kIDJucyBkZWxheSBvbiB0aGUgUEhZLgpT
bywgeWVzLCBldmVuIGZvciBhIHByb3Blcmx5IGRlc2lnbmVkIGJvYXJkLCBldGgxIHN0aWxsIHJl
cXVpcmVzCmVzd2luLHJ4LWNsay1pbnZlcnQuCgpUaGlzIGlzIGEgY2hpcC1sZXZlbCBkZWZlY3Qs
IGFuZCBpbmRlZWQsIGl0IGJyZWFrcyB0aGUgUkdNSUkgc3RhbmRhcmQgYXQKdGhlIFNvQyBsZXZl
bC4KCkZvciB0aGUgVFggb2YgZXRoMSwgdGhlcmUgaXMgYWxzbyBhIHNrZXcgYmV0d2VlbiB0aGUg
VFggY2xvY2sgYW5kIGRhdGEgb24KdGhlIE1BQyBjb250cm9sbGVyIGluc2lkZSB0aGUgc2lsaWNv
bi4gVGhpcyBza2V3IGhhcHBlbnMgdG8gYmUgYXBwcm94aW1hdGVseSB+Mm5zLgpUaGVyZWZvcmUs
IHdlIGNhbiBjb25zaWRlciB0aGF0IHRoZSAybnMgZGVsYXkgb2YgVFggaXMgcHJvdmlkZWQgYnkg
dGhlIE1BQywKc28gdGhlIFRYIGlzIGNvbXBsaWFudCB3aXRoIHRoZSBSR01JSSBzdGFuZGFyZC4K
CgpSZWdhcmRzLApMaW4gTWluCg==

