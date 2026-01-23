Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BE3D72368
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCxEDZ1fr3n/f4NkfiMVSfrHEnYkdcSQlaoo5wWCwKI=; b=Ns4hmks0QT+Os+tDXooEngT3Kv
	PqrTPWuSFc/nAFD4BO1Y9mhNQE/iS3tydKUnt9/88pIwP2UG5z+j5yXVGu1MwJ5GAs3/VtKENp98+
	lhCEFedTPNKvm3IIPw0X9UpuPA+ZfPPFZYfkBUht5WaRo125gOSQF56jauNOETQRn5rcyNBh+MBuf
	Pez0PX45sB0p6xhTGgCPm3sVig1wbEdZYrNtbkpytAzUW95TgSTbBRqrg8sDFcv7pyFS1/VmIjQHd
	bipruDD1uJXGYKmyFeIk6vm+IRQcscBDGoNIXOSRG26NS/QmS297H4TeykWLQyOFFTR6ST+xdqEsm
	5DonC2kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDqc-00000008ceE-1Adg;
	Fri, 23 Jan 2026 09:52:58 +0000
Received: from azure-sdnproxy.icoremail.net ([4.193.249.245])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDqY-00000008cd2-1E5x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:52:57 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 23 Jan 2026 17:52:28 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 23 Jan 2026 17:52:28 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Bo Gan" <ganboing@gmail.com>
Cc: "Andrew Lunn" <andrew@lunn.ch>, devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <29b8c4d2.3704.19bea44fe53.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgCn+2zcRHNpGxgFAA--.1620W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEQDGlyUQwdaAABsu
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015254_530698_CE778DE3 
X-CRM114-Status: GOOD (  17.62  )
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

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQm8gR2FuIiA8Z2FuYm9p
bmdAZ21haWwuY29tPgo+IOWPkemAgeaXtumXtDoyMDI2LTAxLTIzIDE1OjM5OjI5ICjmmJ/mnJ/k
upQpCj4g5pS25Lu25Lq6OiAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4sIOadjuW/lyA8
bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbT4KPiDmioTpgIE6IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVkdW1h
emV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9iaEBrZXJuZWwub3JnLCBrcnprK2R0
QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcs
IHBhYmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tLCBhbGV4YW5kcmUu
dG9yZ3VlQGZvc3Muc3QuY29tLCBybWsra2VybmVsQGFybWxpbnV4Lm9yZy51aywgbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBuaW5neXVAZXN3aW5j
b21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFA
ZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20KPiDkuLvpopg6
IFJlOiBbUEFUQ0ggdjEgMS8yXSBkdC1iaW5kaW5nczogZXRoZXJuZXQ6IGVzd2luOiBhZGQgY2xv
Y2sgc2FtcGxpbmcgY29udHJvbAo+IAo+IEhpIEFuZHJldywKPiAKPiBPbiAxLzIyLzI2IDE5OjE5
LCBBbmRyZXcgTHVubiB3cm90ZToKPiA+Pj4gWW91IHNheSBpbnRlcm5hbC4gU28gdGhlIHNrZXcg
aXMgZml4ZWQsIGl0IGlzIGEgcHJvcGVydHkgb2YgdGhlCj4gPj4+IHNpbGljb24/IElmIHNvLCB3
aHkgYSBEVCBwcm9wZXJ0eT8gV2h5IG5vdCBqdXN0IGhhcmQgY29kZSBpdCBpbiB0aGUKPiA+Pj4g
ZHJpdmVyPyBTaW5jZSBpdCBpcyBpbnRlcm5hbCwgZGlmZmVyZW50IGJvYXJkcyBzaG91bGQgbm90
IG5lZWQgaXQgc2V0Cj4gPj4+IGRpZmZlcmVudGx5Pwo+ID4+Pgo+ID4+IFRoYW5rcyBmb3IgdGhl
IHF1ZXN0aW9uLgo+ID4+Cj4gPj4gRUlDNzcwMCBoYXMgdHdvIEV0aGVybmV0IE1BQ3MuIE9ubHkg
ZXRoMSBoYXMgdGhpcyBpbnRlcm5hbCBSWEMvUlhEIHNrZXcsCj4gPj4gZXRoMCBkb2VzIG5vdC4K
PiA+Pgo+ID4+IFNvIHRoaXMgaXMgbm90IGEgY2hpcC13aWRlIGNvbnN0YW50IHRoYXQgY2FuIGJl
IGhhcmRjb2RlZCBpbiB0aGUgZHJpdmVyLgo+ID4+IFdlIG5lZWQgYSB3YXkgdG8gZGlzdGluZ3Vp
c2ggdGhlIHR3byBNQUMgaW5zdGFuY2VzLCB3aGljaCBpcyB3aHkgdGhpcyBpcwo+ID4+IGRlc2Ny
aWJlZCBwZXItcG9ydCBpbiBEVFMuCj4gPiAKPiA+IEkgYXNzdW1lIHRoZSBhZGRyZXNzIG9mIHRo
ZSBpbnRlcmZhY2UgaXMgZml4ZWQuIFNvIHlvdSBjYW4ganVzdCBrZXkKPiA+IG9mZiB0aGF0IHRv
IGRpc3Rpbmd1aXNoIHRoZSB0d28gaW5zdGFuY2VzLgo+ID4gCj4gPiBTaW5jZSB0aGlzIGlzIGFu
IGludGVybmFsIHByb3BlcnR5LCBub3QgYSBib2FyZCBwcm9wZXJ0eSwgaXQgaXMgbm90Cj4gPiBj
bGVhciBpdCBhY3R1YWxseSBiZWxvbmdzIG9uIERULgo+ID4gCj4gPiAgICAgIEFuZHJldwo+IAo+
IElNTywgdGhleSBzaG91bGQgYmUgaW4gRFQgdG8gcHJvdmlkZSBtYXhpbXVtIGZsZXhpYmlsaXR5
LiBUaGUgU29DIC5kdHNpCj4gY2FuIHByb3ZpZGUgc29tZSBzYW5lIGRlZmF1bHRzLCBhbmQgdGhl
IGJvYXJkIHZlbmRvciBjYW4gbGF0ZXIgb3ZlcnJpZGUKPiB0aGVtIGlmIHRoZSBtYWMvcGh5IHJl
cXVpcmVzIGZ1cnRoZXIgdHVuaW5nLiBBcHBseWluZyBzdWNoIHR1bmluZyBieQo+IHRoZSBhZGRy
ZXNzIG9mIE1BQyBzZWVtcyBtZXNzeSBhbmQgaXQgaGlkZXMgdGhlIHBhcmFtZXRlcnMgdXNlZCBi
ZWhpbmQKPiBkcml2ZXIuIFRocm91Z2ggRFQsIGV2ZXJ5dGhpbmcgYmVjb21lcyByZWFsbHkgY2xl
YXIuCj4gCj4gSSBhc3N1bWUgdGhpcyBpcyBub3QgdW5jb21tb246IEUuZy4sIHN0YXJmaXZlL2po
NzExMDoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA3MTQxMDQ1MjEuMTg3NTEt
My1zYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbS8KPiAKPiBCVFcsIG5vIG5lZWQgdG8gd29ycnkg
YWJvdXQgYmFja3dhcmQgY29tcGF0LiBFU1dJTiBoYXNuJ3QgY2hlY2tlZC1pbiBhbnkKPiBEVCBm
b3IgZXRoIHlldC4gQXMgeW91IGFuZCBSdXNzZWxsIHNhaWQsIHRoZXkgbmVlZCB0byBkbyBpdCwg
cHJvbnRvLgo+IApZZXMsIHRoaXMgY2FuIGJlIGhhcmRjb2RlZCBmb3IgZXRoMSwgc2ltaWxhciB0
byB3aGF0IGlzIGRvbmUgaW4KZHdtYWMtbG9vbmdzb24xLmMuCgpIb3dldmVyLCBjb25zaWRlcmlu
ZyBFSUM3NzAyLCB3aGljaCBpbnRlZ3JhdGVzIHR3byBFSUM3NzAwIGRpZXMgYW5kIHRodXMKaGFz
IGZvdXIgTUFDcyBpbiB0b3RhbCwgd2UgYmVsaWV2ZSBkZXNjcmliaW5nIHRoaXMgdmlhIERUUyBp
cyBtb3JlCmFwcHJvcHJpYXRlLiBXZSBhcmUgY3VycmVudGx5IHdvcmtpbmcgb24gdXBzdHJlYW1p
bmcgdGhlIERUUyBzdXBwb3J0IGZvcgpFSUM3NzAyLgoKV2l0aCB0aGUgRFQgYXBwcm9hY2gsIHRo
ZSBpbnRlcm5hbCBSWEMvUlhEIHNrZXcgY2FuIGJlIGRlc2NyaWJlZCBleHBsaWNpdGx5CmZvciBn
bWFjMSBhbmQgZ21hYzMsIHdpdGhvdXQgcmVxdWlyaW5nIGNoYW5nZXMgdG8gZHdtYWMtZWljNzcw
MC5jIHdoZW4KYnJpbmdpbmcgdXAgRUlDNzcwMi4KCkFzIEJvIEdhbiBhbHNvIG1lbnRpb25lZCwg
dGhlcmUgYXJlIHZlbmRvcnMgaGFuZGxpbmcgc2ltaWxhciBpbnRlcm5hbApxdWlya3MgdGhyb3Vn
aCBEVCBjb25maWd1cmF0aW9uLgoKLS0KTGkgWmhpCg==

