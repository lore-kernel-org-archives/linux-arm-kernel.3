Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BB7D25955
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FuA/oa5qikBVbmktFQblCerGh/L3C1BRLg+j+XNqYs=; b=0dTeW7fBFk2S/2gS7MoLrxxzlo
	bEsDEsV5om5Ae4dFdNwHUMXrKb8EYYNmwDvRFh5fZ+6iNY8DWyjvOYwWShST90KqoZSUdY5usDHXh
	nGnwRiy9lozDFLHLbNl6tc1ZZE2ff/pl4B8pFSZx5NaqPIahAjrLl0oB6Bcb/OyKwupyB2lJ/JCnO
	Dgx0gFiKXtIIt/iojzHYHhewUwoeLVoKN+IQ1mUVm7OJQ3TthOzkKDwluFvE7hM+FJ4/4a32GMVLF
	OLJxsUHd6ep8lp7ujMlh0iQgy/SHlL58IpEK8Ync6btHW7aRUMZ555Bs2O5GotVlNi1ybu3pU99qc
	CgaybBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkd9R-0000000Djlz-0Kdf;
	Tue, 27 Jan 2026 07:06:13 +0000
Received: from azure-sdnproxy.icoremail.net ([52.229.168.213])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkd9M-0000000DjlZ-0cZT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 07:06:11 +0000
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Tue, 27 Jan 2026 15:05:48 +0800 (GMT+08:00)
X-Originating-IP: [10.10.96.205]
Date: Tue, 27 Jan 2026 15:05:48 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Min Lin" <linmin@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
	"Bo Gan" <ganboing@gmail.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <d010a6b8-5bf0-40ff-8e76-18362a238d50@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
 <0d54ddca-9270-40a5-aa82-d8a7b65027ff@gmail.com>
 <1a622916.2d28.19bb105feab.Coremail.lizhi2@eswincomputing.com>
 <d010a6b8-5bf0-40ff-8e76-18362a238d50@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <203bb660.2c91.19bfe45d677.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TQJkCgAXiy3MY3hpcrAGAA--.1516W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAgEACWl3l4EXtwABsj
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_230608_562230_17220755 
X-CRM114-Status: GOOD (  11.97  )
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

SGkgQW5kcmV3LAoKVGhhbmsgeW91IGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gcmV2aWV3IHRoZSBw
YXRjaC4KCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlcy0tLS0tCj4gRnJvbTogIkFuZHJldyBMdW5u
IiA8YW5kcmV3QGx1bm4uY2g+Cj4gU2VuZCB0aW1lOlRodXJzZGF5LCAyMi8wMS8yMDI2IDIxOjI3
OjM0Cj4gVG86IOadjuW/lyA8bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbT4KPiBDYzogIkJvIEdh
biIgPGdhbmJvaW5nQGdtYWlsLmNvbT4sICJSdXNzZWxsIEtpbmcgKE9yYWNsZSkiIDxsaW51eEBh
cm1saW51eC5vcmcudWs+LCBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgYW5kcmV3K25ldGRl
dkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpldEBnb29nbGUuY29tLCBrdWJh
QGtlcm5lbC5vcmcsIHJvYmhAa2VybmVsLm9yZywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitk
dEBrZXJuZWwub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwg
bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbSwgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwg
bGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBuaW5n
eXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tLCBwaW5rZXNo
LnZhZ2hlbGFAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20K
PiBTdWJqZWN0OiBSZTogUmU6IFtQQVRDSCB2MSAxLzJdIGR0LWJpbmRpbmdzOiBldGhlcm5ldDog
ZXN3aW46IGFkZCBjbG9jayBzYW1wbGluZyBjb250cm9sCj4gCj4gPiBXZSBhbHNvIGludGVuZAo+
ID4gdG8gdXBzdHJlYW0gY29tcGxldGUgRFRTIGZpbGVzIGZvciBFSUM3NzAwIHNvIHRoZSBiaW5k
aW5ncyBjYW4gYmUgdmFsaWRhdGVkCj4gPiBhZ2FpbnN0IHJlYWwgaGFyZHdhcmUuCj4gCj4gSSBz
dWdnZXN0IHlvdSBwcmlvcml0aXNlIHRoaXMuIEFSTS1TT0MgaXMgcHJldHR5IGZsZXhpYmxlIGZv
cgo+IGFjY2VwdGluZyB3b3JrIGluIHByb2dyZXNzIHN1cHBvcnQgZm9yIG5ldyBTb0NzLiBBbGwg
eW91IHJlYWxseSBuZWVkCj4gaXMgZm9yIHRoZSBib2FyZCB0byBib290IHRvIGEgbG9naW4gcHJv
bXB0IG9uIGEgc2VyaWFsIHBvcnQgdXNpbmcgYW4KPiBpbml0cmFtc2ZzLiBTbyB0aGUgLmR0c2kg
YW5kIC5kdHMgZmlsZSBjYW4gYmUgdmVyeSBzbGltLCBDUFVzLCBtZW1vcnkKPiBhbmQgVUFSVHMu
Cj4gCj4gT25jZSB5b3UgaGF2ZSB0aGF0IG1lcmdlZCB5b3UgY2FuIHdvcmsgb24gdGhlIG90aGVy
IGRyaXZlcnMsIHRoZWlyCj4gYmluZGluZ3MsIGV0Yy4KPiAKVGhlIGVpYzc3MDAuZHRzaSBhbmQg
ZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cyBhcmUgYWxyZWFkeSBpbgp2Ni4xOS1yYzYu
IEFzIHlvdSBzYWlkLCBpdCBvbmx5IGluY2x1ZGVzIENQVXMsIG1lbW9yeSBhbmQgVUFSVHMgcmln
aHQKbm93LiBJdCBoYXMgYmVlbiB2ZXJpZmllZCB0byBiZSBhYmxlIHRvIGxvZ2luIHByb21wdCBv
biBhIHNlcmlhbCBwb3J0CnVzaW5nIGFuIGluaXRyYW1mcy4KQmVzaWRlcywgdGhlIHJlc2V0IGRy
aXZlciBmb3IgZWljNzcwMCBoYXMgYWxyZWFkeSBiZWVuIG1lcmdlZCBpbiB2Ni4xOS1yYzYuCgpC
ZWNhdXNlIHRoZSBkZXZpY2UgZHJpdmVycyBzdWNoIGFzIEV0aGVybmV0IHJlbHkgb24gdGhlIGNs
b2NrIGRyaXZlciwKb3VyIHBsYW4gaXMgdGhhdCBvbmNlIHRoZSBjbG9jayBkcml2ZXIgaXMgYXBw
bGllZCwgd2Ugd2lsbCBhZGQgb3RoZXIKZGV2aWNlIG5vZGVzIHN1Y2ggYXMgRXRoZXJuZXQgYW5k
IGVNTUMgaW4gdGhlIG5leHQgdXBzdHJlYW0gcGF0Y2gKb2YgdGhlIERUUy4gSXMgdGhpcyByZWFz
b25hYmxlPwoKUmVnYXJkcywKTGluIE1pbgo=

