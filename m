Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36742FD45F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 03:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9pzA0KKk9pAydgPApXyHsI9MmCEVWk3nfMnXSs0C2o=; b=TkzOyiMkP1sOlk944qyDlUkbIO
	27tX/vldV2FspksO5PIjnmd28b8Jaoif1DrHBq5Av/DkPiDL5gzPPGmyihzoO9KbVZbdc3GpWI3+U
	ISqH3AhetCffrrTz1XP7JYwCkaEDVw5Qh+cpT8HI/aUecapiHBsK4fk+JnryHBLlki62BsYtCUK0E
	hOn8W0qx8Y2y+wxVcSYBlHC1GQlOZWT/8pJ03zIsH3NmwBnUW2NMTMHf/WKtCcHvGxnqD9m9nsAJx
	U4mpTccmpNvdVMekzODms/4D+3QTkLDqZOHaAWgie0/ql4uOuAgCJDDrV8v4wZUzgydWX7G8XAKj3
	/+sFmOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRvf-00000005JOO-2GMI;
	Thu, 26 Feb 2026 03:20:43 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRvc-00000005JNF-0nrT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 03:20:42 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Thu, 26 Feb 2026 11:20:02 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Thu, 26 Feb 2026 11:20:02 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com,
	dongxuyang@eswincomputing.com, ganboing@gmail.com,
	pritesh.patel@einfochips.com
Subject: Re: Re: [PATCH v2 0/2] net: stmmac: eic7700: fix EIC7700 eth1 RX
 sampling timing
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <5f99968ec561631852bfa72aea95a100dcad5324.camel@ziswiler.com>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <5f99968ec561631852bfa72aea95a100dcad5324.camel@ziswiler.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6137cd6a.4859.19c97f5eb67.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgBn_HDiu59pn6YDAA--.351W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEKDGmfJIYS1AAAsX
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_192041_194063_A4ED3685 
X-CRM114-Status: GOOD (  11.92  )
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

SGkgTWFyY2VsLAoKVGhhbmtzIGZvciBzaGFyaW5nIHRoZSBkZXRhaWxzLgoKMS4gSSBjaGVja2Vk
IHlvdXIgbG9nIGFuZCBub3RpY2VkIHRoYXQgdGhlIGtlcm5lbCBjbWRsaW5lIGFscmVhZHkgaW5j
bHVkZXMKICAgImNsa19pZ25vcmVfdW51c2VkIi4gVGhlcmVmb3JlLCB5b3VyIGlzc3VlIGRvZXMg
bm90IGFwcGVhciB0byBiZSB0aGUKICAgc2FtZSBhcyB0aGUgb25lIHByZXZpb3VzbHkgcmVwb3J0
ZWQgYnkgQm8gR2FuLgoKMi4gSSBhbHNvIHZlcmlmaWVkIHRoYXQgdjYuMTkuMiBhbHJlYWR5IGNv
bnRhaW5zIHRoZSB0d28gZU1NQyBmaXggcGF0Y2hlczoKICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL0NBUER5S0ZxY015TS09eCsyRldOTGhIWT1ndTVBcEhOUFFocDB4QktESkdyN0JoRXg0
UUBtYWlsLmdtYWlsLmNvbS8KICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBUER5S0Zy
a0VaRHVNYkdwZnhpc21jeD12SmtTU0tfWGJ0Qjc2MitzVUZvY3VwVDYzd0BtYWlsLmdtYWlsLmNv
bS8KCiAgIEEgbGlrZWx5IGNhdXNlIGlzIHRoYXQgdGhlIGVNTUMgRFRTIG5vZGUgaXMgbWlzc2lu
ZyB0aGUgQVhJIGNsb2NrIGRlZmluaXRpb24uCiAgIFBsZWFzZSByZWZlciB0byB0aGUgRFRTIHVw
ZGF0ZXMgaW4gdGhlIGZvbGxvd2luZyBwdWxsIHJlcXVlc3QgZm9yIHJlZmVyZW5jZToKICAgaHR0
cHM6Ly9naXRodWIuY29tL2Vzd2luY29tcHV0aW5nL2xpbnV4LW5leHQvcHVsbC8yMAoKMy4gSW4g
YWRkaXRpb24sIHBsZWFzZSBjaGVjayB3aGV0aGVyIENPTkZJR19HUElPX0RXQVBCPXkgaXMgZW5h
YmxlZCBpbiB5b3VyCiAgIGtlcm5lbCBjb25maWd1cmF0aW9uLiBTaW5jZSBHTUFDIGlzIGJ1aWx0
LWluIGJ5IGRlZmF1bHQsIGl0IGRlcGVuZHMgb24KICAgR1BJTyBiZWluZyBhdmFpbGFibGUgZHVy
aW5nIGVhcmx5IGluaXRpYWxpemF0aW9uLgoKSG9wZSB0aGlzIGhlbHBzIG5hcnJvdyB0aGluZ3Mg
ZG93bi4gUGxlYXNlIGxldCBtZSBrbm93IHdoYXQgeW91IGZpbmQuCgpCZXN0IHJlZ2FyZHMsClpo
aSBMaQoKCj4gLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQo+IOWPkeS7tuS6ujogIk1hcmNlbCBaaXN3
aWxlciIgPG1hcmNlbEB6aXN3aWxlci5jb20+Cj4g5Y+R6YCB5pe26Ze0OjIwMjYtMDItMjEgMDI6
Mzc6NTcgKOaYn+acn+WFrSkKPiDmlLbku7bkuro6IGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20s
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVt
QGRhdmVtbG9mdC5uZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9i
aEBrZXJuZWwub3JnLCBrcnprK2R0QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5l
dGRldkB2Z2VyLmtlcm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4uc3RtMzJA
Z21haWwuY29tLCBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tLCBybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51aywgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnCj4g5oqE6YCBOiBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5j
b21wdXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVh
bkBlc3dpbmNvbXB1dGluZy5jb20sIGRvbmd4dXlhbmdAZXN3aW5jb21wdXRpbmcuY29tCj4g5Li7
6aKYOiBSZTogW1BBVENIIHYyIDAvMl0gbmV0OiBzdG1tYWM6IGVpYzc3MDA6IGZpeCBFSUM3NzAw
IGV0aDEgUlggc2FtcGxpbmcgdGltaW5nCj4gCj4gSGkgWmhpIExpCj4gCj4gU29ycnksIHRvIHN0
ZWFsIHRoaXMgdGhyZWFkLCBidXQgSSBkbyBoYXZlIGEgcXVpY2sgcXVlc3Rpb24gY29uY2Vybmlu
ZyBFdGhlcm5ldCBvbiB0aGUgRUlDNzcwMC4gRXZlcnkgdGltZSBJCj4gZW5hYmxlIGdtYWMwIGlu
IHRoZSBkZXZpY2UgdHJlZSBteSBFQkM3NzAwIHN0b3BzIGJvb3RpbmcgKGUuZy4gU0QgY2FyZCBp
cyBubyBsb25nZXIgZGV0ZWN0ZWQpIHdoaWxlIEV0aGVybmV0Cj4gZG9lcyBzZWVtIHRvIGF0IGxl
YXN0IGdldCBkZXRlY3RlZC4gVGhpcyBoYXMgYmVlbiBzZWVuIHVzaW5nIG5leHQtMjAyNjAyMTks
IHN0YWJsZSB2Ni4xOS4yIFsxXSBhcyB3ZWxsIGFzCj4gNi4xOC4wLXJjNiBbMl0uIEFueSBpZGVh
IHdoYXQgY291bGQgYmUgZ29pbmcgd3Jvbmc/Cj4gCj4gSSBhZG1pdCBzbyBmYXIgSSBvbmx5IGRv
IGhhdmUgb25lIHNpbmdsZSBFQkM3NzAwIGF0IGhhbmQgd2hpbGUgd2FpdGluZyBmb3IgZnVydGhl
ciBoYXJkd2FyZSB0byBhcnJpdmUuCj4gCj4gVGhhbmtzIQo+IAo+IFsxXSBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3YvbWV0YS1yaXNjdi9wdWxsLzYwMQo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20v
ZXN3aW5jb21wdXRpbmcvbGludXgtbmV4dC90cmVlL2Rldi90ZXN0LXVwc3RyZWFtLXY2LjE4LXJj
Ngo+IAo+IENoZWVycwo+IAo+IE1hcmNlbAo+IAo+IFtzbmlwXQo=

