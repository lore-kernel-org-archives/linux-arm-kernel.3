Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFEEC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMJE4hNbjphW0GvkigJLBEzXqY1LqCjd/zuEvelbozM=; b=G6FR8AF7VP0EWuzfYkkqpEM8o4
	uYaNdk3xX4jdmoak+BWgajRpypITVhh3OrIfxjSK0NkZ1VK3WGkC34RdoD5sCmpMZJC4hbHylfFjx
	v3gCkjhG+veS3FaawB34Xd7nu71VZrBJRvXTwilEfcvthF0kg0TQvR3hqVjGlpYzvtW7iyRDKlpBq
	oS2pYmNsV4FeMFSZQw89DrJFjrWt+ZiZze35XbPCgzCIr9W7Kw2TroZRDbpjUu79S+uPjI1Lnb0AI
	s5Jr/UlqqVv8dvA3hRvdnr0Mil/fhQoe5J9CHFMl4A8gPKJXIu8LXOS5iHFT3/DcV5No8kvdptF9S
	/QMse5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wPR-00000004paW-1BBC;
	Tue, 22 Sep 2026 09:03:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wPP-00000004pZJ-3zwD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 09:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sMJE4hNbjphW0GvkigJLBEzXqY1LqCjd/zuEvelbozM=; b=B5EEUP1KptTxn5RJ992+4qQFrd
	rXUTeYuDpSNu8Wxhu/zqucmJnv9dOx0cwJO7oN5fr0ft1W9AyiVFKtqz3PLzbeuCNGE9+ou/ttl0A
	ubKrcSTASEwgSoEC9qopSlsBLBF8K2W6eXJDP+LL8h9fHW5e08EeeUaMNvsbnqfqsUHpC9cKrWyaW
	9rHMfRBiMgODuTVduaTNGIdJdM4VGqXeLvQpRlW7ldBA5mH33dJEQVAgo9Jta9icKPCHUnAbYntMQ
	tcqIWD6qt1fB5oXq+fpg9/MJv4mHAnzbLopqT1i6/YYVG1QLIuO1fnShqxaRNcN9KfSfIMMbODewV
	4IKjdKkQ==;
Received: from m16.mail.163.com ([117.135.210.3])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wPM-0000000DKCt-11id
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=sMJE4hNbjphW0GvkigJLBEzXqY1LqCjd/zuEvelbozM=; b=e
	r9AjLnnLYALemIC2MdYQiKsDylh2yKtRFp1tzUhGSrgiJV4PbY5vs4DZt7Sd/XIZ
	hB5tvgBvP+zdnfbYSXB3+MkiZKJ4wqyAAeFnD9ET05UPPdB64719VMt2K8gX8jlA
	08dDlknEf7R9T+I5ZZ4hVq11QJcckS0/dAhYvEDHoM=
Date: Tue, 22 Sep 2026 17:02:23 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Linus Walleij" <linusw@kernel.org>
Cc: longzhao@ambarella.com, "Arnd Bergmann" <arnd@arndb.de>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Jerome Brunet" <jbrunet@baylibre.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, "Lee Jones" <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re:Re: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAD++jLkZ9F3_KQwGDZyKaFYBzO9PXVq+5v8geFE+oOM47KmagQ@mail.gmail.com>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <CAD++jLkCNkcf-gn0FgvLZZTibLUvbKaH6L+=nRqkNZr2iKFqsQ@mail.gmail.com>
 <39641ec4.7a73.1a0c848bfa4.Coremail.zl020895@163.com>
 <CAD++jLkZ9F3_KQwGDZyKaFYBzO9PXVq+5v8geFE+oOM47KmagQ@mail.gmail.com>
X-NTES-SC: AL_Qu2SAvyduE8v5SWRZukcn0wRhug/UMa4u/sm3YNXc84FpwPw5QMjZmNDNHL32tKTBxilqxOseRpTx8lTXqZ3SWk2S31eMJkw9vz6qHwtgQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <14afb3f3.803a.1a0c85a1b75.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gygvCgD3PyYfRLJq18cVAA--.40048W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxh9f0GqyRB-tfAAA3E
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_100325_066991_8B7C5FF0 
X-CRM114-Status: GOOD (  10.96  )
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

SGkgTGludXMsCgpJIHNlZSwgdGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gCkkgd2lsbCBh
ZGQgdGhlIGBBc3Npc3RlZC1ieTogTExNYCB0YWcgaW4gZWFjaCBwYXRjaCBmb3IgdGhlIG5leHQg
cmVzcGluLgoKQmVzdCByZWdhcmRzLApMb25nIFpoYW8KCkF0IDIwMjYtMDktMjIgMTY6NTI6NTIs
ICJMaW51cyBXYWxsZWlqIiA8bGludXN3QGtlcm5lbC5vcmc+IHdyb3RlOgo+T24gVHVlLCBTZXAg
MjIsIDIwMjYgYXQgMTA6NDTigK9BTSB6bDAyMDg5NSA8emwwMjA4OTVAMTYzLmNvbT4gd3JvdGU6
Cj4KPj4gTm8gTExNIHdhcyB1c2VkIGZvciBjb2Rpbmcgb3IgdGVzdGluZy4gRGlmZmVyZW50IGRl
dmVsb3BlcnMgYXJlIHJlc3BvbnNpYmxlIGZvcgo+PiBkaWZmZXJlbnQgcGFydHMgb2YgdGhlIGNv
ZGUuIExMTSB3YXMgb25seSB1c2VkIHRvIHBvbGlzaCBjb21taXQgbWVzc2FnZXMuCj4+IENvdWxk
IHlvdSBhZHZpc2Ugd2hldGhlciBJIHN0aWxsIG5lZWQgdG8gZGlzY2xvc2UgdGhpcz8KPgo+V2Ug
YWRkIGl0IGV2ZW4gaWYgaXQganVzdCB1c2VkIGZvciBjb21taXQgbWVzc2FnZXMsIHdlIGRvbid0
IHJlYWxseQo+ZGlmZmVyZW50aWF0ZS4KPgo+TWF5YmUgdGhpcyBpcyB0byBjb2Fyc2UgYnV0IGl0
J3Mgd2hhdCB3ZSBoYXZlLgo+Cj5UaGUgdGFnIGRvZXNuJ3QgcmVhbGx5IG1lYW4gbXVjaCwgaXQg
anVzdCBtZWFuICJhbiBMTE0gd2FzCj5pbnZvbHZlZCB3aXRoIHNvbWV0aGluZyByZWxhdGVkIHRv
IHRoaXMgcGF0Y2giLCBpdCBjb3VsZAo+aGF2ZSBiZWVuIHVzZWQganVzdCBmb3IgdGVzdGluZyBv
ciByZXZpZXcuCj4KPlNpbmNlIHdlIGhhdmUgU2FzaGlrbyByZXZpZXdpbmcgZXZlcnl0aGluZyBJ
IGd1ZXNzIGluIHRoZW9yeQo+d2Ugc2hvdWxkIGV2ZW4gYWRkIGl0IGlmIHdlIGxvb2tlZCBhdCB0
aGUgU2FzaGlrbyByZXZpZXdzLAo+YnV0IG5vYm9keSBkb2VzIHRoYXQuIFNvIGl0J3MgYSBiaXQg
YXJiaXRyYXJ5LiBOb2JvZHkncyBnb25uYQo+YmUgdXBzZXQgYWJvdXQgZWl0aGVyLCBpdCdzIGp1
c3Qgc29tZSBoZWxwZnVsIG1ldGFkYXRhLgo+Cj5Zb3VycywKPkxpbnVzIFdhbGxlaWoK

