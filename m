Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423A1C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlHuK7sAVWr7ztPPqfiAU5v0J17k8qzfkK0cYJ/qQfY=; b=Z6CAdUEFC8rXX5fbWjcLLPntC5
	l+/qPFCuMmkvgRvWBMRQh32wNQq5qQVbFXotT8N+lV1axXKl58jmKaSF7scHgNnBKa4OOGEhTrRMV
	grWXLVp6jtJyI8fHf3FJI83uKSFepabboVK0d2m57Kadd3N65gFGZglT4kUP7dQ9moFqlLyNyEj8D
	m1QxlN2gUVED+R8uN0TB3P2GsTQPMUuAPHS5K9LjGKQNjWLz1DdcoKDvHBOSBEWY+7F956FT+iUpP
	ZeJAJZoYKMKQl0PWXnLu3FEbXAZxGEO7KyHu6X53MLlDhShpQcNHQJgFucwrWANlSDzW7YU+/21VQ
	oqxtRU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w6z-00000004jFt-04g1;
	Tue, 22 Sep 2026 08:44:25 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w6w-00000004jB5-2RtU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=SlHuK7sAVWr7ztPPqfiAU5v0J17k8qzfkK0cYJ/qQfY=; b=M
	ZgZR9J/wm84kMpIZJWRkd1y6Qt62vu+ADp2EyCdHchxPTKVD6TulKbLvpMpxEOGT
	qclozviUVzrb+pyBYOxsqr1OIgQMhw6bFHy+NetVNaUsIN+oXTet8aicXMo/AyFS
	Q0xYdY6JI4ugK2CIYhoEn582YpF9d0B6z+ZdlAXjoQ=
Date: Tue, 22 Sep 2026 16:43:25 +0800 (CST)
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
Subject: Re:Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAD++jLkCNkcf-gn0FgvLZZTibLUvbKaH6L+=nRqkNZr2iKFqsQ@mail.gmail.com>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <CAD++jLkCNkcf-gn0FgvLZZTibLUvbKaH6L+=nRqkNZr2iKFqsQ@mail.gmail.com>
X-NTES-SC: AL_Qu2SAvyduU4r4ymfYekcn0wRhug/UMa4u/sm3YNXc84FpwPw5QMjZmNDNHL32tKTBxilqxOseRpTx8lTXqZ3Ry5OjzbKoVDkBi/GtP4C7w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <39641ec4.7a73.1a0c848bfa4.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gygvCgDX_zquP7JqF8AVAA--.40051W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxQ5Cs2qyP66lrgAA34
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_014423_066608_E6263D64 
X-CRM114-Status: UNSURE (   9.23  )
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

SGkgTGludXMsCgpObyBMTE0gd2FzIHVzZWQgZm9yIGNvZGluZyBvciB0ZXN0aW5nLiBEaWZmZXJl
bnQgZGV2ZWxvcGVycyBhcmUgcmVzcG9uc2libGUgZm9yIGRpZmZlcmVudCBwYXJ0cyBvZiB0aGUg
Y29kZS4gTExNIHdhcyBvbmx5IHVzZWQgdG8gcG9saXNoIGNvbW1pdCBtZXNzYWdlcy4gQ291bGQg
eW91IGFkdmlzZSB3aGV0aGVyIEkgc3RpbGwgbmVlZCB0byBkaXNjbG9zZSB0aGlzPwoKQmVzdCBy
ZWdhcmRzLApMb25nIFpoYW8KCkF0IDIwMjYtMDktMjIgMTU6MzA6NDYsICJMaW51cyBXYWxsZWlq
IiA8bGludXN3QGtlcm5lbC5vcmc+IHdyb3RlOgo+SGkgTG9uZywKPgo+T24gVHVlLCBTZXAgMTUs
IDIwMjYgYXQgMToxNeKAr1BNIExvbmcgWmhhbyB2aWEgQjQgUmVsYXkKPjxkZXZudWxsK2xvbmd6
aGFvLmFtYmFyZWxsYS5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPj4gVGhpcyBzZXJpZXMgYWRk
cyBtaW5pbWFsIEFtYmFyZWxsYSBDVjc1IHN1cHBvcnQgZm9yIGVhcmx5IGJyaW5nLXVwIHdpdGgK
Pj4gYSBzZXJpYWwgY29uc29sZTogRFQgYmluZGluZ3MsIFJDVCBjbG9ja3MsIHBpbmN0cmwsIFBM
MDYxIEdQSU8gdmlhCj4+IGdwaW8tcmVnbWFwLCA4MjUwX2R3IFVBUlQgcXVpcmtzLCBBUkNIX0FN
QkFSRUxMQSwgQ1Y3NSBFVksgRFQsIGFuZAo+PiBNQUlOVEFJTkVSUy4KPj4KPj4gVGhpcyBpcyBh
IHNpbmdsZSB1bmlmaWVkIHNlcmllcy4gUGxlYXNlIGFwcGx5IHZpYSB0aGUgU29DCj4+IHRyZWU7
IHN1YnN5c3RlbSBtYWludGFpbmVycyBhcmUgQ2MnZCBmb3IgdGhlaXIgcGllY2VzLgo+Pgo+PiBH
UElPIGRhdGEgcGF0aCB1c2VzIGdwaW8tcmVnbWFwIHdpdGggdHdvIGxheW91dHMgKEFSTSBQcmlt
ZUNlbGwgYW5kCj4+IEFtYmFyZWxsYSkuIElSUSBzdGF5cyBhIGN1c3RvbSBQTDA2MSBpcnFjaGlw
OiBhIGxpbmVhciBkb21haW4gaXMKPj4gY3JlYXRlZCBhZnRlciBncGlvX3JlZ21hcF9yZWdpc3Rl
cigpLCBhdHRhY2hlZCB3aXRoCj4+IGdwaW9jaGlwX2lycWNoaXBfYWRkX2RvbWFpbigpIHZpYSBn
cGlvX3JlZ21hcF9nZXRfY2hpcCgpLCBhbmQgdGhlCj4+IGNoYWluZWQgaGFuZGxlciB1c2VzIGdw
aW9fY2hpcCBhcyBjaGlwIGRhdGEuIGdwaW8tcmVnbWFwIGdpcnEgYW5kCj4+IHJlZ21hcC1pcnEg
YXJlIG5vdCB1c2VkLgo+Cj5Zb3UgcGF0Y2hzZXQgaXMgYmlnIGFuZCBjb21wbGV4IHlldCB5b3Ug
ZG8gcXVpY2sgcmVzcGlucy4KPgo+VGhpcyBpbmRpY2F0ZXMgeW91IG1pZ2h0IGJlIHVzaW5nIGFu
IExMTS4KPgo+SXQgaXMgcmVxdWlyZWQgYnkga2VybmVsIHByb2NlZHVyZXMgdG8gZGlzY2xvc2Ug
dGhpcwo+d2l0aDoKPgo+QXNzaXN0ZWQtYnk6IExMTQo+Cj5hZGRlZCB0byBlYWNoIHBhdGNoLCBp
ZiB0aGlzIGlzIHRoZSBjYXNlLgo+Cj5Zb3VycywKPkxpbnVzIFdhbGxlaWoK

