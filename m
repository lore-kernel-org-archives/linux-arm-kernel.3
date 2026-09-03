Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9562C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwwfU6hpks+YXRJ6fCld9MUwDFdNClhk4U3xLbF7LOo=; b=cRWopIanoaNDbPQabz97kKAH52
	tGLzEliqk2X4mIrFOkSZPSU0q6QltdnBMYlAVQTQxSj6jiCpzOpY98OAkCCN/HTYdUIjBZNaDKydl
	fShDr9vWU7gzOQb2DalDFtzxBZcw9ruLBAhCrL0q9uNJemJNLs3XvrxNb5UTLyh6qjSpWBStJhYQu
	YSMFf96H99v1jQrQg7vcK+TUmtgE/kIkLO8zR1hGJsrUN2r4tkS46KbEAE03y9hREFTqMMVSBbtim
	vmjtvA5ha+1CpTVgXRNfgHfKd/5zmn+DsmhTmo6tLXDpkuUmQi9eOXQTIOR4fHg+TaGmTZj+8pZBX
	JLpTKfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x264d-0000000HFPS-0kar;
	Thu, 03 Sep 2026 11:57:43 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x264Y-0000000HFNz-1kKE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=TwwfU6hpks+YXRJ6fCld9MUwDFdNClhk4U3xLbF7LOo=; b=i
	X4QWfdzCIGfg7Ms8Zvw0g05r1YDsVi+LDnWP81i2YQkoCXDVA4W/ZLwgF1b4Ps8o
	7/OtBS09LE6KcDhLST0EbJ7VDcGNmNx2GT1kif/+pBCmUAmTDkTFYwTCygqHW+yx
	baBl36AzpoimswmhjAiCxqYpOEEwG1TWTj41jtNGjw=
Date: Thu, 3 Sep 2026 19:56:17 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: longzhao <longzhao@ambarella.com>, "Arnd Bergmann" <arnd@arndb.de>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>,
	soc <soc@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Linus Walleij" <linusw@kernel.org>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-gpio <linux-gpio@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Brian Masney" <bmasney@redhat.com>, "Lee Jones" <lee@kernel.org>,
	mfd <mfd@lists.linux.dev>
Subject: Re:Re: Re: [PATCH v5 10/12] serial: 8250: add Ambarella UART driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <aplcxoINt0YAjvxL@ashevche-desk.local>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-10-7bbb12f0360f@ambarella.com>
 <aoRpc2RK2_X3CdAi@ashevche-desk.local>
 <162c0385.2c076.1a018b82fa7.Coremail.zl020895@163.com>
 <aplcxoINt0YAjvxL@ashevche-desk.local>
X-NTES-SC: AL_Qu2TCviYuU0s4SCRZekcn0wRhug/UMa4u/sm3YNXc+sEmyb9wCAKQntjBXjy8euBCTqVrACdWgFHxf1WZpRSWZYdwgSvePe0abAvWg2oAg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <709278f9.9699.1a067207b4c.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgD3vyZhYJlquTA_AA--.3357W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxgExomqZYGHZZAAA3b
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_045738_868975_167F93CC 
X-CRM114-Status: GOOD (  11.62  )
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

SGkgQW5keSwKClRoYW5rcyBmb3IgdGhlIGNvbmZpcm1hdGlvbi4gCkkgd2lsbCBrZWVwIDgyNTBf
YW1iYXJlbGxhIGFuZCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGFzIHlvdQpzdWdnZXN0ZWQu
CgpCZXN0IHJlZ2FyZHMsCkxvbmcgWmhhbwoKQXQgMjAyNi0wOS0wMyAxOTo0MDo1NCwgIkFuZHkg
U2hldmNoZW5rbyIgPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj5P
biBXZWQsIEF1ZyAxOSwgMjAyNiBhdCAwMjozMTo1OVBNICswODAwLCB6bDAyMDg5NSB3cm90ZToK
Pj4gCj4+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPgo+PiBUaGlzIGlzIEFtYmFyZWxsYSA4MjUw
LWNvbXBhdGlibGUgSVAsIG5vdCBTeW5vcHN5cyBEZXNpZ25XYXJlLiBXZQo+PiBmaXJzdCB0cmll
ZCA4MjUwX2R3IGFmdGVyIExpbnVzIGFza2VkIHVzIHRvIG1vdmUgdG8gdGhlIDgyNTAgbGlicmFy
eTsKPj4geW91IHRoZW4gdG9sZCB1cyBub3QgdG8gdG91Y2ggODI1MF9kdyBhbmQgdG8gdXNlIDgy
NTBfYW1iYXJlbGxhCj4+IGluc3RlYWQuIFRoYXQgaXMgd2hhdCB0aGlzIHBhdGNoIGlzLgo+PiBC
YWNrZ3JvdW5kOgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yL0NBRCsrakxtNkh6RVUxVE0t
Yz1WdGp2M0ZKRUJlY1ZQN1R5eFNncV9RMHpGLVl3VDZOQUBtYWlsLmdtYWlsLmNvbS8KPj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc2VyaWFsL2FuOEt2dkhXWDBuYUgzWHdAYXNoZXZj
aGUtZGVzay5sb2NhbC8KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc2VyaWFsLzdF
Nzc0MzA1LTM5MjAtNEJCNy1CQTQ2LUUwNzcyRDZCRUQ4NEBhbWJhcmVsbGEuY29tLwo+PiBJIHdp
bGwgYWxzbyBzd2l0Y2ggdG8gdWFydF9yZWFkX3BvcnRfcHJvcGVydGllcygpIGFuZCB0cmltIHRo
ZQo+PiA4MjUwX2R3LWRlcml2ZWQgYm9pbGVycGxhdGUuCj4KPlRoYW5rcyBmb3IgdGhlIHJlZ2lz
dGVyIGRlc2NyaXB0aW9ucywgaXQgd2FzIGhlbHBmdWwuIEFmdGVyIGdvaW5nIHRocm91Z2ggdGhl
bQo+aXQgc2VlbXMgdGhlIHYzIGFzIHlvdSBtYWRlIGl0IGlzIGdvb2QgZW5vdWdoIChzb3JyeSBm
b3IgZ29pbmcgYmFjayBhbmQgZm9ydGgpLgo+V2hhdCBpdCBuZWVkcyBpcyBiZXR0ZXIgY29tbWl0
IG1lc3NhZ2UgZXhwbGFpbmluZyB0aGF0IHdoaWxlIGl0J3Mgbm90IGEgU3lub3BzeXMKPkRXIElQ
LCBpdCB3YXMgbWFkZSB0byBiZSBxdWl0ZSBjb21wYXRpYmxlIHdpdGggdGhhdCAob24gcmVnaXN0
ZXIgbGV2ZWwpIGFuZCBoZW5jZQo+bm8gbmV3IGRyaXZlciBpcyByZXF1aXJlZCwganVzdCBhIHNt
YWxsIHF1aXJrLgo+Cj4tLSAKPldpdGggQmVzdCBSZWdhcmRzLAo+QW5keSBTaGV2Y2hlbmtvCj4K


