Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9ADCA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13uyK1WLkkJWQnCXhwaNVxQ4g+5FLa3gYjiKyQUA6aA=; b=2hnZOugi9fTqrVMUhj5j3Xgm2+
	yzApdJk20mzXPK/VafL3RDpHbtmG5uAUfEklfDFCy0c8KrgL+c29grbRhJ63kT4Pj/4KhwRm+1y7z
	PDwHyxAiTOyHeniIQMRwXgkh1bwMME0wuFFe7dJ4PUOlDv2QxZaZruoNaBJ+UJqREC67dmDWX3Svr
	4wgiVgHde8AhmKvIyhVOSFdZM+rXmwWrpl7zOp9rHugJ601HiGoL4hogXO/BLg+ZWQpZCboPm6cUC
	nwvJcQhZx7UnPU5Ec0xkIwKkUu3MW+JQI6uSqRVZ/PtBY6//pANgtGIlBgvQqOvGhhNPqiVD2OBab
	kkG37uAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqn-00000002I4Y-21yg;
	Fri, 22 Aug 2025 11:22:29 +0000
Received: from azure-sdnproxy.icoremail.net ([4.193.249.245])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHfc-00000001IVH-3tPZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 02:38:27 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 22 Aug 2025 10:37:50 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 22 Aug 2025 10:37:50 +0800 (GMT+08:00)
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
Subject: Re: Re: Re: Re: Re: Re: [PATCH v3 2/2] ethernet: eswin: Add eic7700
 ethernet driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <bad83fec-afca-4c41-bee4-e4e4f9ced57a@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
 <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
 <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
 <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
 <6b3c8130-77f0-4266-b1ed-2de80e0113b0@lunn.ch>
 <006c01dbfafb$3a99e0e0$afcda2a0$@eswincomputing.com>
 <28a48738-af05-41a4-be4c-5ca9ec2071d3@lunn.ch>
 <2b4deeba.3f61.1985fb2e8d4.Coremail.lizhi2@eswincomputing.com>
 <bad83fec-afca-4c41-bee4-e4e4f9ced57a@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3261748c.629.198cfa3bc10.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgB3jg8A2KdoOMjBAA--.11545W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQECDGinSfUNAAABsx
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_193825_150136_3A256F55 
X-CRM114-Status: GOOD (  22.17  )
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

RGVhciBBbmRyZXcgTHVubiwKVGhhbmsgeW91IGZvciB5b3VyIHZhbHVhYmxlIGFuZCBwcm9mZXNz
aW9uYWwgc3VnZ2VzdGlvbnMuClBsZWFzZSBmaW5kIG91ciBxdWVzdGlvbnMgYW5kIGV4cGxhbmF0
aW9ucyBlbWJlZGRlZCBiZWxvdyB5b3VyIGNvbW1lbnRzCmluIHRoZSBvcmlnaW5hbCBlbWFpbC4K
CkJlc3QgcmVnYXJkcywKCkxpIFpoaQpFc3dpbiBDb21wdXRpbmcKCgoKCgo+IC0tLS0t5Y6f5aeL
6YKu5Lu2LS0tLS0KPiDlj5Hku7bkuro6ICJBbmRyZXcgTHVubiIgPGFuZHJld0BsdW5uLmNoPgo+
IOWPkemAgeaXtumXtDoyMDI1LTA3LTMxIDIxOjMxOjUyICjmmJ/mnJ/lm5spCj4g5pS25Lu25Lq6
OiDmnY7lv5cgPGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20+Cj4g5oqE6YCBOiB3ZWlzaGFuZ2p1
YW5AZXN3aW5jb21wdXRpbmcuY29tLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVt
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
bmNvbXB1dGluZy5jb20sIHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbQo+IOS4u+mimDog
UmU6IFJlOiBSZTogUmU6IFJlOiBbUEFUQ0ggdjMgMi8yXSBldGhlcm5ldDogZXN3aW46IEFkZCBl
aWM3NzAwIGV0aGVybmV0IGRyaXZlcgo+IAo+ID4gPiBZb3UgaGFyZHdhcmUgaGFzIGEgbG90IG9m
IGZsZXhpYmlsaXR5LCBidXQgbm9uZSBvZiBpZiBzaG91bGQgYWN0dWFsbHkKPiA+ID4gYmUgbmVl
ZGVkLCBpZiB5b3UgZm9sbG93IHRoZSBzdGFuZGFyZC4KPiA+ID4gCj4gPiA+IFNvIHBoeS1tb2Rl
ID0gInJnbWlpLWlkIjsgc2hvdWxkIGJlIGFsbCB5b3UgbmVlZCBmb3IgbW9zdCBib2FyZHMuCj4g
PiA+IEV2ZXJ5dGhpbmcgZWxzZSBzaG91bGQgYmUgb3B0aW9uYWwsIHdpdGggc2Vuc2libGUgZGVm
YXVsdHMuCj4gPiA+IAo+ID4gCj4gPiBPbiBvdXIgcGxhdGZvcm0sIHRoZSB2ZW5kb3Itc3BlY2lm
aWMgYXR0cmlidXRlcyBlc3dpbixkbHktcGFyYW0tKiB3ZXJlCj4gPiBpbml0aWFsbHkgaW50cm9k
dWNlZCB0byBjb21wZW5zYXRlIGZvciBib2FyZC1zcGVjaWZpYyB2YXJpYXRpb25zIGluIFJHTUlJ
Cj4gPiBzaWduYWwgdGltaW5nLCBwcmltYXJpbHkgZHVlIHRvIGRpZmZlcmVuY2VzIGluIFBDQiB0
cmFjZSBsZW5ndGhzLgo+IAo+IFNvIGl0IHNlZW1zIGxpa2UsIGJlY2F1c2UgeW91IGhhdmUgdGhl
IGZsZXhpYmlsaXR5IGluIHRoZSBoYXJkd2FyZSwKPiB5b3UgZGVzaWduZWQgeW91ciBQQ0IgcG9v
cmx5LCBicmVha2luZyB0aGUgc3RhbmRhcmQsIHNvIG5vdyBtdXN0IGhhdmUKPiB0aGVzZSBwcm9w
ZXJ0aWVzLiAgSXQgd291bGQgb2YgYmVlbiBtdWNoIGJldHRlciBpZiB5b3UgaGFkIHN0dWNrIHRv
Cj4gdGhlIHN0YW5kYXJkLi4uCj4gCj4gUGxlYXNlIGVuc3VyZSB5b3VyIGRlZmF1bHQgdmFsdWVz
LCB3aGVuIG5vdGhpbmcgaXMgc3BlY2lmaWVkIGluIERULAo+IGNvcnJlc3BvbmQgdG8gYSBib2Fy
ZCB3aGljaCBhY3R1YWxseSBmdWxmaWxzIHRoZSBzdGFuZGFyZC4gVGhlIG5leHQKPiBib2FyZCB3
aGljaCBpcyBtYWRlIHVzaW5nIHRoaXMgZGV2aWNlIGNhbiB0aGVuIGF2b2lkIGhhdmluZyBhbnl0
aGluZwo+IHNwZWNpYWwgaW4gdGhlcmUgRFQgYmxvYi4KPiAKPiA+IFRoZXNlIGF0dHJpYnV0ZXMg
YWxsb3cgZmluZS1ncmFpbmVkLCBwZXItc2lnbmFsIGRlbGF5IGNvbnRyb2wgZm9yIFJYRCwgVFhE
LAo+ID4gVFhFTiwgUlhEViwgUlhDTEssIGFuZCBUWENMSywgYmFzZWQgb24gZW1waXJpY2FsbHkg
ZGVyaXZlZCBvcHRpbWFsIHBoYXNlCj4gPiBzZXR0aW5ncy4KPiA+IEluIG91ciBleHBlcmllbmNl
LCBzZXR0aW5nIHBoeS1tb2RlID0gInJnbWlpLWlkIiBhbG9uZSwgYWxvbmcgd2l0aCBvbmx5Cj4g
PiB0aGUgc3RhbmRhcmQgcHJvcGVydGllcyByeC1pbnRlcm5hbC1kZWxheS1wcyBhbmQgdHgtaW50
ZXJuYWwtZGVsYXktcHMsCj4gPiBoYXMgcHJvdmVuIGluc3VmZmljaWVudCB0byBtZWV0IG91ciBo
YXJkd2FyZSdzIHRpbWluZyByZXF1aXJlbWVudHMuCj4gCj4gWW91IGRvbid0IG5lZWQgdmVuZG9y
IHByb3BlcnRpZXMgZm9yIFJYQ0xLIGFuZCBUWENMSywgdGhhdCBpcyB3aGF0Cj4gdHgtaW50ZXJu
YWwtZGVsYXktcHMgYW5kIHJ4LWludGVybmFsLWRlbGF5LXBzIGRvLiBUaGV5IGNoYW5nZSB0aGUK
PiBjbG9jayBzaWduYWwgcmVsYXRpdmUgdG8gVFggYW5kIFJYIGRhdGEuIFNvIHlvdSBvbmx5IG5l
ZWQgcHJvcGVydGllcwo+IGZvciBUWEVOIGFuZCBSWERWLiBZb3Ugc2hvdWxkIHByb2JhYmx5IGNh
bGwgdGhlc2UKPiBlc3dpbix0eGVuLWludGVybmFsLWRlbGF5LXBzIGFuZCBlc3dpbixyeGR2LWlu
dGVybmFsLWRlbGF5LXBzLiAgSW4gdGhlCj4gYmluZGluZyB5b3UgbmVlZCB0byBjbGVhcmx5IGRl
ZmluZSB3aGF0IHRoZXNlIG1lYW4sIGZvciB5b3VyIGhhcmR3YXJlLAo+IGkuZS4gIHdoYXQgaXMg
dGhlIGRlbGF5IHJlbGF0aXZlIHRvPwo+IAo+ID4gMS4gU2V0dGluZyBhbGwgZGVsYXkgcGFyYW1l
dGVycyAoUlhELCBUWEQsIFRYRU4sIFJYRFYsIFJYQ0xLLCBhbmQgVFhDTEspCj4gPiAgICB1c2lu
ZyB2ZW5kb3Itc3BlY2lmaWMgYXR0cmlidXRlc8KgZXN3aW4sZGx5LXBhcmFtLSouCj4gPiAgICBl
LmcuCj4gPiAgICBlc3dpbixkbHktcGFyYW0tMTAwMG0gPSA8MHgyMDIwMjAyMCAweDk2MjA1QTIw
IDB4MjAyMDIwMjA+Owo+ID4gMi4gU2V0dGluZyBkZWxheSBwYXJhbWV0ZXJzIChSWEQsIFRYRCwg
VFhFTiwgUlhEVikgdXNpbmcgdmVuZG9yLXNwZWNpZmljCj4gPiAgICBhdHRyaWJ1dGVzwqBlc3dp
bixkbHktcGFyYW0tKsKgLCBSWENMSyB1c2luZyByeC1pbnRlcm5hbC1kZWxheS1wcyBhbmQKPiA+
ICAgIFRYQ0xLIHVzaW5nIHR4LWludGVybmFsLWRlbGF5LXBzLgo+ID4gICAgZS5nCj4gPiAgICBl
c3dpbixkbHktcGFyYW0tMTAwMG0gPSA8MHgyMDIwMjAyMCAweDgwMjAwMDIwIDB4MjAyMDIwMjA+
Owo+ID4gICAgcngtaW50ZXJuYWwtZGVsYXktcHMgPSA8OTAwMD47Cj4gPiAgICB0eC1pbnRlcm5h
bC1kZWxheS1wcyA9IDwyMjAwPjsKPiAKPiBOZWl0aGVyLiBEVCBzaG91bGQgbm90IGNvbnRhaW4g
SFcgdmFsdWVzIHlvdSBwb2tlIGludG8gcmVnaXN0ZXJzLiBUaGV5Cj4gc2hvdWxkIGJlIFNJIHVz
aW5nLCBpbiB0aGlzIGNhc2UsIHBpY28gc2Vjb25kcy4gRnJvbSB0aGVzZSBkZWxheXMgaW4KPiBw
aWNvc2Vjb25kcywgaGF2ZSB0aGUgZHJpdmVyIGNhbGN1bGF0ZSB3aGF0IHZhbHVlcyBzaG91bGQg
YmUgd3JpdHRlbgo+IGludG8gdGhlIHJlZ2lzdGVycy4KPiAKPiBBbmQgdGhlc2UgZGVsYXkgdmFs
dWVzIGFyZSB1bmxpa2VseSB0byBiZSBjb3JyZWN0LiBZb3UgYXJlIHVzaW5nCj4gcmdtaWktaWQs
IHNvIHRoZSBQSFkgaXMgYWRkaW5nIDJucy4gWW91IHdhbnQgdGhlIE1BQyB0byBtYWtlIHNtYWxs
Cj4gdHVuaW5nIGFkanVzdG1lbnRzLCBzbyAyMDAgY291bGQgYmUgcmVhc29uYWJsZSwgYnV0IDkw
MDBwcyBpcyB3YXkgdG9vCj4gYmlnLgo+IAoKV2UgcmUtdHVuZWQgYW5kIHZlcmlmaWVkIHRoYXQg
c2V0dGluZyB0aGUgVFhEIGFuZCBSWEQgZGVsYXlzIHRvIDAgYW5kCmNvbmZpZ3VyaW5nIFRYRU4g
YW5kIFJYRFYgdG8gMCB5aWVsZGVkIHRoZSBzYW1lIGhhcmR3YXJlIHBlcmZvcm1hbmNlIGFzCmxv
bmcgYXMgd2Ugb25seSBhcHBsaWVkIGRlbGF5cyAoZS5nLiAyMDBwcykgdG8gVFhDTEsgYW5kIFJY
Q0xLLgpUaGVyZWZvcmUsIGluIHRoZSBuZXh0IHBhdGNoLCB3ZSB3aWxsIGRyb3AgdGhlIHZlbmRv
ci1zcGVjaWZpYyBwcm9wZXJ0aWVzCihlLmcuIGVzd2luLGRseS1wYXJhbS0qKSBhbmQga2VlcCBv
bmx5IHRoZSBzdGFuZGFyZCBhdHRyaWJ1dGVzLCBuYW1lbHkKcngtaW50ZXJuYWwtZGVsYXktcHMg
YW5kIHR4LWludGVybmFsLWRlbGF5LXBzLgpJcyB0aGlzIGNvcnJlY3Q/Cgo+IAlBbmRyZXcK

