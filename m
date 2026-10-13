Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48029CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hp1dTw3hRxiZBvSzxIR3eaRSSMR6S7lRt7/KxcL7YmU=; b=yOsYRdiYT7mWe5jnDNOjZW9fzr
	WFizD+Duy9Dl4gpHRVyMpax6TKXqxPBLMAGQqUkvezEWSphm3optbjKCu3ZDcvepWxxsqna095mO1
	nltPXGIE3Ns8jHvdqZkPooykT73GGTBNQ6am2iX1kOVMwHDHQxWUZ2eIF6QTMUTItoNjSUogQA3GU
	2gMXqvqNgX+EImCwh5a3OK/aHRRg30CQbmakIeCB3One99u05qHFwyUIhsjeSn8uPmbpqR53uonEz
	BwFUeewdKf7zl86DhOCudcxD5tlWW+6JGMyAZtpV+mhubR38D7zWoZqsZmiQC4tg9QWoQn3vGA/ly
	BRLztc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgh8-0000000Dlg5-1U8P;
	Tue, 13 Oct 2026 17:53:46 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgh5-0000000DleU-0QRR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=hp1dTw3hRxiZBvSzxIR3eaRSSMR6S7lRt7/KxcL7YmU=; b=O
	WFaVuM93IWPWVHz1DROYW7egfZ3MO/d1MdS/gA7+Jxi5NWJd4PoZrmiHx15AKVZ2
	4UM4Cwvntj02QhgfOh2yUzLuhNFwL2fTm+PsC0+Y4zrcQoHKQKUn5ibm288MEAes
	5R0lW7gOOP+J72R9BCZBMfN7yGrWIPetla+gvN6Ux0=
Date: Wed, 14 Oct 2026 01:51:46 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Linus Walleij" <linusw@kernel.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, longzhao@ambarella.com,
	"Arnd Bergmann" <arnd@arndb.de>,
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
Subject: Re:Re: Re: [PATCH v8 04/18] dt-bindings: pinctrl: add Ambarella
 CV75 pinctrl
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAD++jLmrQwAT1Sb8HGgoM8x48rN9-pPT2RB1GE18h5YA7c4CwQ@mail.gmail.com>
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com>
 <CAD++jLmKF5XxHsJX29sdXC_6JHKn-7HkE=N+TKtk5xODtQj3_w@mail.gmail.com>
 <b2256847-3ec1-47e8-ac79-ceca86eb09e7@kernel.org>
 <CAD++jLkrXXg9xrhAZ8HETc5Qcv5BbkY-ibjvzBmE5WZVqDEGWQ@mail.gmail.com>
 <a0eca34d-5eb2-4730-b8c7-0f2302bcf265@kernel.org>
 <CAD++jLm=T-U07vAVCogMnfOfkDf=i9QhGGc8ok2N-ZUh50WLNA@mail.gmail.com>
 <56dc6c05-7fd6-43de-bc62-c353ae1dbcc3@kernel.org>
 <54b55ad7.9d3a.1a135b09587.Coremail.zl020895@163.com>
 <CAD++jLmrQwAT1Sb8HGgoM8x48rN9-pPT2RB1GE18h5YA7c4CwQ@mail.gmail.com>
X-NTES-SC: AL_Qu2SA/WavEEr4CaeZekdnUoTj+Y/XMK0uvwk1YdVc8gEnjjMwxonRUZAE2Xr9+a2LgydoDuVWhh8yd55fo9x/FIZB3Lpfw2lhbgiuZUShQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <69bf6d9d.a86d.1a1366451f1.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eygvCgD3NyGyb85qV71XAA--.16978W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7hJWx2rOb7KL3QAA3C
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105343_519686_82A6CD5D 
X-CRM114-Status: UNSURE (   5.23  )
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

CkF0IDIwMjYtMTAtMTQgMDA6Mzg6NDAsICJMaW51cyBXYWxsZWlqIiA8bGludXN3QGtlcm5lbC5v
cmc+IHdyb3RlOgo+T24gVHVlLCBPY3QgMTMsIDIwMjYgYXQgNDozNuKAr1BNIHpsMDIwODk1IDx6
bDAyMDg5NUAxNjMuY29tPiB3cm90ZToKPgo+PiBXb3VsZCB0aGlzIHdvcms/OiBJIHNlbmQgYSBz
dGFuZGFsb25lCj4+ICJkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBhZGQgQW1iYXJlbGxh
IiBwYXRjaCB0byBSb2Igd2l0aCBvbmx5Cj4+IHRoZSB0d28gbGluZXMgaW4gdmVuZG9yLXByZWZp
eGVzLnlhbWwsIGFuZCBkcm9wIHRoYXQgaHVuayBmcm9tIHRoZQo+PiBTb0Mgc2VyaWVzLiBPbmNl
IHRoZSBwcmVmaXggaXMgaW4gbGludXgtbmV4dCwgdGhlIHZlbmRvci1wcmVmaXgKPj4gd2Fybmlu
Z3Mgc2hvdWxkIGJlIGZpeGVkLiBUaGUgcmVtYWluaW5nIGV4YW1wbGUgbWF0Y2hlcywgc3VjaCBh
cwo+PiBhbWJhcmVsbGEsZHJpdmUtc3RyZW5ndGgtc3lzY29uLCBzdGlsbCBuZWVkIHRoZSBzZXBh
cmF0ZQo+PiBHUElPL1VBUlQvcGluY3RybCBiaW5kaW5ncy4KPgo+VGhhdCB3b3JrcyBmb3IgbWUg
YW5kIHNvbHZlcyBteSBwcm9ibGVtIHNvIGdvIGFoZWFkLgo+Cj5Zb3VycywKPkxpbnVzIFdhbGxl
aWoKClNlbnQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MTAxNC1jdjc1LXByZWZp
eC12MS0xLWZlOTVlZDU2Nzg4MEBhbWJhcmVsbGEuY29tCgpCZXN0IHJlZ2FyZHMsCkxvbmcgWmhh
bwo=

