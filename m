Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C6ACAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H43jQh2/OR4og+peubxGV8dFkGR0ES1D/EW+GQmVya0=; b=46MPqy1mUAvoTWYIEqSjoJt4Uf
	9qe4G5dEcq0igDxDo4w2dY6B2HZJ/Uq0nLbrP2rQVqoY65ZXisVccEA1d4+OKI18E6Qko5d/5d1L4
	M8RegJuojHbKWS49edZdS2Tcwm8SCqKiR9RNVCMaHIERBbBM3H/hodTtUt4pECgJmik4LmKkyNQDN
	r4umHgrgt4Qh0InI+cgz0QMvZ7AkRQawKunxxMbSKHZwKsrdq9yldPCVWGoS6owRGxFJPLs+Vh6E7
	OP1LFrFed1EX9EBtMexi+ur6s/IOVdWJNGNTCcoEPagAuMR41nhRhlZnd/ccTeIrdtcq/RJDaZBfz
	GNrmm4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5r0-00000003Wlo-09GT;
	Mon, 15 Sep 2025 09:50:34 +0000
Received: from l-sdnproxy.icoremail.net ([20.188.111.126] helo=azure-sdnproxy.icoremail.net)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5qw-00000003Wl7-2KBP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:50:32 +0000
Received: from weishangjuan$eswincomputing.com ( [10.12.96.155] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 15 Sep 2025 17:50:01 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.155]
Date: Mon, 15 Sep 2025 17:50:01 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6Z+m5bCa5aif?= <weishangjuan@eswincomputing.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com, rmk+kernel@armlinux.org.uk,
	faizal.abdul.rahim@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
	boon.khai.ng@altera.com, 0x1207@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	emil.renner.berthing@canonical.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v6 1/2] dt-bindings: ethernet: eswin: Document for
 EIC7700 SoC
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <50496bf2-1d10-4d89-addb-f4fe774497d9@kernel.org>
References: <20250912055352.2832-1-weishangjuan@eswincomputing.com>
 <20250912055612.2884-1-weishangjuan@eswincomputing.com>
 <50496bf2-1d10-4d89-addb-f4fe774497d9@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <45afe6bc.1302.1994cc80846.Coremail.weishangjuan@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgA31pRJ4cdoWlTRAA--.24971W
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/1tbiAQEGEGjG7f
	gnDAACsE
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_025030_769329_E5F7AFAD 
X-CRM114-Status: GOOD (  11.77  )
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

RGVhciBLcnp5c3p0b2YgS296bG93c2tpLAoKSSBhbSB3cml0aW5nIHRvIHNpbmNlcmVseSBhcG9s
b2dpemUgZm9yIG9taXR0aW5nIHlvdXIgIlJldmlld2VkLWJ5IiB0YWcKaW4gdGhlIHY2IHBhdGNo
IHNlcmllcyB3aXRob3V0IHByb3ZpZGluZyBhbiBleHBsYW5hdGlvbi4gVGhpcyB3YXMgYW4gb3Zl
cnNpZ2h0Cm9uIG15IHBhcnQsIGFuZCBJIHRydWx5IHJlZ3JldCBhbnkgaW5jb252ZW5pZW5jZSBv
ciBmcnVzdHJhdGlvbiBpdCBoYXMgY2F1c2VkLgoKVGhlIHJlYXNvbiB3aHkgSSBkaWRuJ3QgYWRk
IHRhZ3MgaXMgdGhhdCBJIG1hZGUgbW9kaWZpY2F0aW9ucyB0byB0aGUgZGVzY3JpcHRpb24KaW4g
dGhlIFlBTUwgZmlsZS4gRHVlIHRvIHRoZXNlIGNoYW5nZXMgdGhhdCBhbHRlciB0aGUgY29udGVu
dCB5b3UgaGF2ZSBwcmV2aW91c2x5CnZpZXdlZCwgSSBiZWxpZXZlIHRoZXNlIG1vZGlmaWNhdGlv
bnMgbWF5IHJlcXVpcmUgYSByZSBleGFtaW5hdGlvbiBhbmQgdGhlcmVmb3JlCnNob3VsZCBub3Qg
YmUgcmV0YWluZWQgd2l0aG91dCB5b3VyIGNvbmZpcm1hdGlvbi4KCkkgdW5kZXJzdGFuZCB0aGF0
IHdoZW4gc3VibWl0dGluZyB0aGUgcGF0Y2gsIEkgc2hvdWxkIGNsZWFybHkgc3RhdGUgdGhlIHJl
YXNvbi4KSSBoYXZlIGNhcmVmdWxseSByZWFkIHRoZSBzdWJtaXNzaW9uIGd1aWRlbGluZXMgYW5k
IHdpbGwgZW5zdXJlIGZ1bGwgY29tcGxpYW5jZQp3aXRoIHRoZSBwcm9jZXNzIGluIGFsbCBmdXR1
cmUgY29udHJpYnV0aW9ucywgaW5jbHVkaW5nIHByb3BlciB1c2Ugb2YgYjQgYW5kIGNsZWFyCmNv
bW11bmljYXRpb24gb2YgY2hhbmdlcy4KClRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZSBhbmQg
Z3VpZGFuY2UuCgpCZXN0IHJlZ2FyZHMsClNoYW5nanVhbiBXZWkKCgo+IC0tLS0t5Y6f5aeL6YKu
5Lu2LS0tLS0KPiDlj5Hku7bkuro6ICJLcnp5c3p0b2YgS296bG93c2tpIiA8a3J6a0BrZXJuZWwu
b3JnPgo+IOWPkemAgeaXtumXtDoyMDI1LTA5LTEyIDIxOjE0OjI0ICjmmJ/mnJ/kupQpCj4g5pS2
5Lu25Lq6OiB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tLCBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZywgYW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBl
ZHVtYXpldEBnb29nbGUuY29tLCBrdWJhQGtlcm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCBy
b2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBtY29xdWVsaW4uc3RtMzJAZ21h
aWwuY29tLCBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tLCB5b25nLmxpYW5nLmNob29uZ0Bs
aW51eC5pbnRlbC5jb20sIHZsYWRpbWlyLm9sdGVhbkBueHAuY29tLCBybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51aywgZmFpemFsLmFiZHVsLnJhaGltQGxpbnV4LmludGVsLmNvbSwgcHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tLCBpbm9jaGlhbWFAZ21haWwuY29tLCBqYW4u
cGV0cm91c0Bvc3MubnhwLmNvbSwganN6aGFuZ0BrZXJuZWwub3JnLCBwLnphYmVsQHBlbmd1dHJv
bml4LmRlLCBib29uLmtoYWkubmdAYWx0ZXJhLmNvbSwgMHgxMjA3QGdtYWlsLmNvbSwgbmV0ZGV2
QHZnZXIua2VybmVsLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fu
b25pY2FsLmNvbQo+IOaKhOmAgTogbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWluQGVz
d2luY29tcHV0aW5nLmNvbSwgbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbSwgcGlua2VzaC52YWdo
ZWxhQGVpbmZvY2hpcHMuY29tCj4g5Li76aKYOiBSZTogW1BBVENIIHY2IDEvMl0gZHQtYmluZGlu
Z3M6IGV0aGVybmV0OiBlc3dpbjogRG9jdW1lbnQgZm9yIEVJQzc3MDAgU29DCj4gCj4gT24gMTIv
MDkvMjAyNSAwNzo1Niwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbSB3cm90ZToKPiA+
IEZyb206IFNoYW5nanVhbiBXZWkgPHdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20+Cj4g
PiAKPiA+IEFkZCBFU1dJTiBFSUM3NzAwIEV0aGVybmV0IGNvbnRyb2xsZXIsIHN1cHBvcnRpbmcg
Y2xvY2sKPiA+IGNvbmZpZ3VyYXRpb24sIGRlbGF5IGFkanVzdG1lbnQgYW5kIHNwZWVkIGFkYXB0
aXZlIGZ1bmN0aW9ucy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogWmhpIExpIDxsaXpoaTJAZXN3
aW5jb21wdXRpbmcuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogU2hhbmdqdWFuIFdlaSA8d2Vpc2hh
bmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbT4KPiAKPiBUaGVyZSBpcyBubyBleHBsYW5hdGlvbiBv
ZiBkcm9wcGluZyB0aGUgdGFnLiBQbGVhc2UgcmVhZCBDQVJFRlVMTFkKPiBzdWJtaXR0aW5nIHBh
dGNoZXMuCj4gCj4gQ29tcGFyaW5nIGFsc28gZmFpbHM6Cj4gCj4gYjQgZGlmZiAnPDIwMjUwOTEy
MDU1MzUyLjI4MzItMS13ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tPicKPiBVc2luZyBj
YWNoZWQgY29weSBvZiB0aGUgbG9va3VwCj4gLS0tCj4gQW5hbHl6aW5nIDU1IG1lc3NhZ2VzIGlu
IHRoZSB0aHJlYWQKPiBQcmVwYXJpbmcgZmFrZS1hbSBmb3IgdjY6IGR0LWJpbmRpbmdzOiBldGhl
cm5ldDogZXN3aW46IERvY3VtZW50IGZvcgo+IEVJQzc3MDAgU29DCj4gRVJST1I6IENvdWxkIG5v
dCBmYWtlLWFtIHZlcnNpb24gdjYKPiAtLS0KPiBDb3VsZCBub3QgY3JlYXRlIGZha2UtYW0gcmFu
Z2UgZm9yIHVwcGVyIHNlcmllcyB2Ngo+IAo+IEkgYW0gbm90IGdvaW5nIHRvIHJldmlldyB0d2lj
ZSwgc28geW91IGNhbiBkcm9wIG15IHRhZyBhZ2FpbiB3aXRob3V0Cj4gZXhwbGFuYXRpb24uCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo=

