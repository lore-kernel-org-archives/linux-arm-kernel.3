Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9D0C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 04:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ad1foQTOYEXLcLgFQr70P3Xj3nYeLN3dA9t+EM+hdhM=; b=CWLknX2o5BD4TaZy704Q9apFIu
	Vr9Ton67F5d/L5ijCGTID7YKlZsRYp04q5dNEKohmNZLYB/b4oRVUXO2RrjFVQ5Bk8Xf47SDj4uQA
	QnFQkDLlLWpDIhHKqvcM4QE0a9PmPlY2yL0Tc3D86W6jP54GSg4bWMsbgPf2h3iD2Q/YhKtsVKiCV
	Kt2GaLx7mHYy/KAtV1zoucyq2xVLlZkBW36ZtNS87n34wZ21FbMU75cMVr42yO9K5opQxcofDn62P
	AVreptWerTe8URPEE4vj76kHWG8iIR+lHF8t8ttvd+IEBeU+cp0gcCWR8PWssqSOVodzvOzIj5eGh
	G8OCnN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rzW-00000004AVh-030X;
	Tue, 22 Sep 2026 04:20:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rzU-00000004AVY-2FDs
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 04:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Message-ID:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ad1foQTOYEXLcLgFQr70P3Xj3nYeLN3dA9t+EM+hdhM=; b=jO5IoXPqfutffYjCFMWBTe+S1N
	d3oI2xTLkPDfudGw45ktPxPqgSZVopo9pW2Y3J0+R5yz92UN30ze3AR9Z1KYsPf/fuEJ0i/eCHkNA
	bRfTm2Pdwg6tz2wlY9b1si+exxAjZBLe6KOfezCods7j3yfihvq8Jp9W3EQ6u9s6B4+kQWfm4liaL
	imzf+0HxdZK7kyLNOZ+FLyG80TUV5cRbwNmqF8b/WdEW74AseOSLff0sX8Wgg4Y7WiKljNo9/ukZB
	RCgh0GfE4jiww+rkM4YNvw1SXfqEw9gmYh+KxlnvsgoLLgloB9NaLlMKHcpwZW7HPdITy0ab4yCTo
	cbKhGS/A==;
Received: from m16.mail.163.com ([117.135.210.5])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rzQ-00000006uyh-0Lh9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 04:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ad1foQTOYEXLcLgFQr70P3Xj3nYeLN3dA9t+EM+hdhM=; b=W
	H5CGQT7XIildbReuFWgF+cx7krTqSVujXM9OadX60oIyUIQn/KxvC6NoGQNPDoQ6
	Euvsdpsk4u5+2MPnNPVi0AIAaYL86fGg1VLMFirppLIo2Wb0zdk/Mofg5lJ61IDy
	gqK7T8VWSKJtv+7y87YaaYr1iISs7ryKsgMu1R72ow=
Date: Tue, 22 Sep 2026 12:19:04 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Michael Walle" <michael@walle.cc>
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
	"Linus Walleij" <linusw@kernel.org>,
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
In-Reply-To: <DLL07DMYQ9EN.3I5OQJ93M8J1O@walle.cc>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <DLL07DMYQ9EN.3I5OQJ93M8J1O@walle.cc>
X-NTES-SC: AL_Qu2SAvyev08v4iacYukcn0wRhug/UMa4u/sm3YNXc8IFsjzg4iUlVkNgBVjUyuKtIgyxmweLaAZBxvZ/ZKZCuTITU4LEoOcwLgmvwt6CaA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <523f60f4.3f39.1a0c756b94f.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hCgvCgDXf+K4AbJquzFMAA--.1123W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxRi1J2qyAbiL5AAA3B
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_052020_663900_CFED9586 
X-CRM114-Status: UNSURE (   4.18  )
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

SGkgTWljaGFlbCwKClNvcnJ5IGFib3V0IHRoYXQuIFRoZSBzZXJpZXMgc3RhcnRlZCBhcyBTb0Mg
YnJpbmctdXAgYW5kIHRoZSBUby9DYyBsaXN0CndhcyBmcm96ZW4gZnJvbSB0aGF0LiBncGlvLXJl
Z21hcCB3YXMgYWRkZWQgbGF0ZXIgYW5kIEkgZGlkIG5vdCByZS1ydW4KZ2V0X21haW50YWluZXIg
b24gdGhvc2UgcGF0Y2hlcywgc28gSSBtaXNzZWQgeW91IGFzIHRoZSBncGlvLXJlZ21hcAptYWlu
dGFpbmVyLgoKWW91IGFyZSBDYydkIGZyb20gbm93IG9uLgoKQmVzdCByZWdhcmRzLApMb25nIFpo
YW8KCkF0IDIwMjYtMDktMjEgMjA6NDY6NTQsICJNaWNoYWVsIFdhbGxlIiA8bWljaGFlbEB3YWxs
ZS5jYz4gd3JvdGU6Cj5PbiBUdWUgU2VwIDE1LCAyMDI2IGF0IDE6MTUgUE0gQ0VTVCwgTG9uZyBa
aGFvIHZpYSBCNCBSZWxheSB3cm90ZToKPj4gVGhpcyBpcyBhIHNpbmdsZSB1bmlmaWVkIHNlcmll
cy4gUGxlYXNlIGFwcGx5IHZpYSB0aGUgU29DCj4+IHRyZWU7IHN1YnN5c3RlbSBtYWludGFpbmVy
cyBhcmUgQ2MnZCBmb3IgdGhlaXIgcGllY2VzLgo+Cj5XZWxsLCBub3QgcmVhbGx5LiBJIHdhc24n
dCBDQydlZCBvbiBhbnkgb2YgdGhlIGdwaW8tcmVnbWFwIHBhdGNoZXMuCj4KPi1taWNoYWVsCg==


