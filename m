Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1264C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BhpQZoAXGVHhCY2yPQOy2cprPNEspiRapZr8208ImA=; b=mVKhM/Dt92kWg5GFz2eF0iBifW
	V7ZmazE2d4DNiRGFdSotVwhK7jzYlJtCSn/dkER3EAEU5qfdtY5dZOfvNlYpM4hCXV9jRGdg9tkHD
	Uebjf9g5iMCxOfEFU7qZwgGct0WjD4aXD1We1270dV8QrqJpRQ36dbW/yV4AbkOdbTyP04uwilwsU
	gAjlMhXIYkBmE/2sTX/qv8ljEn4PNrix9TEdVQ3FRdsDoYtdvN2y568J29M5otcRN4Bedh79EVKq/
	ueS45gbobY9VXi9HKNFppLHXl1W7cRXL8CPlcId6/9BcOYi27fs1y5SFV/lJt0rMM18kXbaU7EGf/
	pgv4DTRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bvH-00000001prW-3N7P;
	Mon, 21 Sep 2026 11:10:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bvG-00000001prM-3piH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1BhpQZoAXGVHhCY2yPQOy2cprPNEspiRapZr8208ImA=; b=PdpWLBMRKh/GgmjznBM+1jVfpo
	GzzA/NqIye9zOiuw9YefhMXp1XVyGnxZZY8NpiDrCtSkYBw2XRjRDtGnCfSZZryfH8trorzcGRnnN
	Prs/527qUXx5kdJ0bDTQ/XXTBPp0z+NIwKOW9cJDz+qgWG8cI/v43m+5Th1H/jhFwqdbpnC0mt0QA
	+CoSWPuyCBQRgoRcNKEatqQ6r2oWlNM0woNkvfSCYY8NBQb+CXp+8/KwAA3kR3apJksHW/cM5EUYe
	7NSACExjde3guPTPFa84iYtFEAqa12gL2dU6kv0w71MzIuvCuMuwTBxWKIwvMoxVD8rIpv24Wd5Zo
	55iLxrmw==;
Received: from mail-proxy25229.mail.163.com ([103.129.252.29])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8bv7-0000000CApd-0U6B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=1BhpQZoAXGVHhCY2yPQOy2cprPNEspiRapZr8208ImA=; b=e
	+cHLb2EsoCJmyv5IQM9q0sqiir1Lv71mBv80vQnaKLgpB66FeKfHDB22f4OxAXsT
	YlEkv1c5YP+QgfMfc3gFGTFXs/blWnWK4cAhKXR1FQtwWLlZDbUifAVtv52YRxA6
	VyiDIwOpZjj1P+MtR2DXrhnthimjQTFHDMsLDQarek=
Date: Mon, 21 Sep 2026 19:08:48 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: longzhao@ambarella.com,
	"Long Zhao via B4 Relay" <devnull+longzhao.ambarella.com@kernel.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Jerome Brunet" <jbrunet@baylibre.com>,
	"Linus Walleij" <linusw@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, "Lee Jones" <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
	"Arnd Bergmann" <arnd@arndb.de>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re:Re: [PATCH v8 00/18] Ambarella CV75 SoC minimal bring-up
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAMRc=Mf-0oLOPZsPboE0dzOGE2AzNE0LXmv9fcmgWO47FtGu1g@mail.gmail.com>
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <CAMRc=Mf-0oLOPZsPboE0dzOGE2AzNE0LXmv9fcmgWO47FtGu1g@mail.gmail.com>
X-NTES-SC: AL_Qu2TC/WTt0Ep7iiZZukcn0wRhug/UMa4u/sm3YNXc+oEoxnL1BEgV2ZqNGrf3+6vEQOojDKXWThy0/tgZolRgdClO9P1d1YqDPcyYtmcnA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <c90c1c.9973.1a0c3a77d36.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZSgvCgD3d8BAELFqlexLAA--.37435W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxgAbjGqxEEAmzQAA3x
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121054_210948_C879CB90 
X-CRM114-Status: UNSURE (   6.01  )
X-CRM114-Notice: Please train this message.
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

VGhhbmtzLCBCYXJ0LiAKClBsZWFzZSBxdWV1ZSB0aGUgR1BJTyBwYXRjaGVzIHlvdXJzZWxmIGFu
ZCBwcm92aWRlIGFuIGltbXV0YWJsZQpicmFuY2ggZm9yIHRoZSBTb0MgdHJlZS4KClRoZSBHUElP
IHBhcnQgaXM6CiAgZ3Bpb2xpYjogcmVnbWFwOiBhZGQgd3JpdGVfZGF0YV9hZnRlcl9kaXIgcXVp
cmsKICBncGlvbGliOiByZWdtYXA6IGFkZCBncGlvX3JlZ21hcF9nZXRfY2hpcCgpCiAgZ3Bpbzog
cGwwNjE6IGNvbnZlcnQgcmVnaXN0ZXIgYWNjZXNzIHRvIHJlZ21hcAogIGdwaW86IHBsMDYxOiB1
c2UgSVJRX1RZUEVfTEVWRUxfTUFTSyBhbmQgSVJRX1RZUEVfRURHRV9CT1RICiAgZ3BpbzogcGww
NjE6IHVzZSBjbGVhbnVwIGhlbHBlcnMgZm9yIGxvY2tzCiAgZ3BpbzogcGwwNjE6IHN3aXRjaCBk
YXRhIHBhdGggdG8gZ3Bpby1yZWdtYXAKICBncGlvOiBwbDA2MTogYWRkIEFtYmFyZWxsYSByZWdp
c3Rlci1sYXlvdXQgdmFyaWFudAoKSSB3aWxsIHNlbmQgYSBmb2xsb3ctdXAgZm9yIGdwaW9fcmVn
bWFwX2dldF9jaGlwKCkgd2l0aCB0aGUgbWlzc2luZwprZXJuZWwtZG9jLiBUaGUgcmVzdCBvZiB0
aGUgc2VyaWVzIChjbGssIHBpbmN0cmwsIFVBUlQsIERUKSBjYW4gc3RheQp3aXRoIHRoZSBTb0Mg
dHJlZSBvbmNlIHRoYXQgR1BJTyBicmFuY2ggaXMgYXZhaWxhYmxlLgoKQmVzdCByZWdhcmRzLApM
b25nIFpoYW8KCkF0IDIwMjYtMDktMjEgMTg6MzE6NDUsICJCYXJ0b3N6IEdvbGFzemV3c2tpIiA8
YnJnbEBrZXJuZWwub3JnPiB3cm90ZToKPk9uIE1vbiwgMjEgU2VwIDIwMjYgMDY6MjM6MTkgKzAy
MDAsIExvbmcgWmhhbyB2aWEgQjQgUmVsYXkKPjxkZXZudWxsK2xvbmd6aGFvLmFtYmFyZWxsYS5j
b21Aa2VybmVsLm9yZz4gc2FpZDoKPj4gVGhpcyBzZXJpZXMgYWRkcyBtaW5pbWFsIEFtYmFyZWxs
YSBDVjc1IHN1cHBvcnQgZm9yIGVhcmx5IGJyaW5nLXVwIHdpdGgKPj4gYSBzZXJpYWwgY29uc29s
ZTogRFQgYmluZGluZ3MsIFJDVCBjbG9ja3MsIHBpbmN0cmwsIFBMMDYxIEdQSU8gdmlhCj4+IGdw
aW8tcmVnbWFwLCA4MjUwX2R3IFVBUlQgcXVpcmtzLCBBUkNIX0FNQkFSRUxMQSwgQ1Y3NSBFVksg
RFQsIGFuZAo+PiBNQUlOVEFJTkVSUy4KPj4KPj4gVGhpcyBpcyBhIHNpbmdsZSB1bmlmaWVkIHNl
cmllcy4gUGxlYXNlIGFwcGx5IHZpYSB0aGUgU29DCj4+IHRyZWU7IHN1YnN5c3RlbSBtYWludGFp
bmVycyBhcmUgQ2MnZCBmb3IgdGhlaXIgcGllY2VzLgo+Pgo+Cj5BcyBJIHNhaWQgYmVmb3JlOiB0
aGlzIGJyaW5ncyBpbiBhIGxvdCBvZiBwb3RlbnRpYWxseSBjb25mbGljdGluZyBjb2RlIGludG8K
PmRyaXZlcnMvZ3Bpby8gc28gSSdsbCBuZWVkIGFuIGltbXV0YWJsZSBicmFuY2ggdG8gcHVsbCBv
ciBJIGNhbiBxdWV1ZSB0aGUgR1BJTwo+cGFydCBteXNlbGYgYW5kIHByb3ZpZGUgYW4gaW1tdXRh
YmxlIGJyYW5jaCB0byBvdGhlciB0cmVlcy4KPgo+QmFydG9zego=

