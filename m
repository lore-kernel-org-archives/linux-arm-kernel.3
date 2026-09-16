Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F71C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFaDAPKfM2HmPMVbVkz7VrTW3XXo+f0MOpGfLpNabmg=; b=32Yhl0ve3jCx+9jYth9Snj/HRO
	BuXE0vYxcgpXG0oaV/jwbsGC12IHheAANo58vU51eg2/PTXUz83DlSbMu2H/wVpf+z4azsntKOA+l
	G9WGjQpPz6urwA6/egEQMZ19O+O74y1Ibrk8nNYPqRbEfW8ZS2Sc/rZLr/F8/HLB9LT+boLidplXj
	iJHXkN1eHR9A7/oBYwnfP1PzYbWVS3h7+Q38UIx0s8CAiszjfCAfJyhna88/bfkqOJpsKNgUjlHFl
	ZzwP9I5SCunh1c+13FhSpuk2BGSdlT5O8aWPtdXGFZ1N0F3jKri0ZlnG9KIqpBFD6bfxiNN8a8S9N
	bZd4Cn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hZk-00000008KBf-35vZ;
	Wed, 16 Sep 2026 04:48:52 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hZi-00000008K9v-19UB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=KFaDAPKfM2HmPMVbVkz7VrTW3XXo+f0MOpGfLpNabmg=; b=D
	Wvr+AeFfbMpnUxum/pll/sqRn3+yDlqhRA616exB2sNt9nRSGPk/j2bj+4h1woZC
	7/w432cqSyQOQ2PGWAuyU4y1dUItBDCBaItKjzolGn/Alf5bucUzcrF5wO3XygL2
	LkjPgSciKgYJUS989PjlelRAC4MF94HxT3ABNxZ+R0=
Date: Wed, 16 Sep 2026 12:47:38 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
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
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, "Lee Jones" <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v7 08/15] gpiolib: regmap: add write_data_after_dir
 quirk
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <aqlfJ3PnFib1smnV@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
 <aqlfJ3PnFib1smnV@ashevche-desk.local>
X-NTES-SC: AL_Qu2TC/mYu0gu7iifY+kcn0wRhug/UMa4u/sm3YNXc+gGgS7rxD0iflpxF2DKzOe1GTqXuzGSbTdPyMZYULtmxAyHsDsqPgM1X0Q8/rJ0pQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <20ea407c.4010.1a0a88ab987.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iCgvCgD334NqH6pq2mBHAA--.23889W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxgsnmGqqH2vUjgAA3c
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_214850_770954_BDFB68F3 
X-CRM114-Status: GOOD (  12.50  )
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

SGkgQW5keSwKCk9LLiB2OCB3aWxsIGlnbm9yZSBib3RoIGdwaW9fcmVnbWFwX3NldCgpIHJldHVy
bnMsIHNhbWUgYXMgYmVmb3JlLgpPbmx5IHRoZSBleHRyYSB3cml0ZSBmb3IgdGhlIFBMMDYxIHF1
aXJrIHN0YXlzLgoKQmVzdCByZWdhcmRzLApMb25nIFpoYW8KCkF0IDIwMjYtMDktMTUgMjM6MDc6
MTksICJBbmR5IFNoZXZjaGVua28iIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+
IHdyb3RlOgo+T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgMDc6MTU6MzhQTSArMDgwMCwgTG9uZyBa
aGFvIHZpYSBCNCBSZWxheSB3cm90ZToKPgo+PiBTb21lIGNvbnRyb2xsZXJzIGlnbm9yZSBkYXRh
LXJlZ2lzdGVyIHdyaXRlcyB3aGlsZSBhIGxpbmUgaXMgc3RpbGwgYW4KPj4gaW5wdXQuIE9wdGlv
bmFsbHkgd3JpdGUgdGhlIG91dHB1dCB2YWx1ZSBhZ2FpbiBhZnRlciBzd2l0Y2hpbmcgdGhlCj4+
IGRpcmVjdGlvbiwgbWF0Y2hpbmcgdGhlIGV4aXN0aW5nIFBMMDYxIGJlaGF2aW91ci4KPgo+Li4u
Cj4KPj4gLQlncGlvX3JlZ21hcF9zZXQoY2hpcCwgb2Zmc2V0LCB2YWx1ZSk7Cj4+ICsJcmV0ID0g
Z3Bpb19yZWdtYXBfc2V0KGNoaXAsIG9mZnNldCwgdmFsdWUpOwo+PiArCWlmIChyZXQpCj4+ICsJ
CXJldHVybiByZXQ7Cj4KPkkgdGhpbmsgdGhhdCB0aGlzIG1pZ2h0IGxlYWQgdG8gcmVncmVzc2lv
bnMgd2hlbiB0aGUgZW5kIGRyaXZlciBqdXN0IGxlYXZlcwo+dGhlIG91dHB1dCBpbiB0aGUgcHJl
dmlvdXMgc3RhdGUgaW4gY2FzZSBvZiBlcnJvcnMuIEluIGFueSBjYXNlLCBldmVuIGlmIHRoaXMK
PmlzIGEgY29ycmVjdCB1cGRhdGUsIGl0IG5lZWRzIHRvIGJlIGRvbmUgc2VwYXJhdGVseSB3aXRo
IHRoZSBqdXN0aWZpY2F0aW9uCj50aGF0IHNob3dzIHRoYXQgYWxsIGN1cnJlbnQgdXNlcnMgd29u
J3QgaGF2ZSByZWdyZXNzaW9ucyBvciB0aGUgcmVncmVzc2lvbiBpcwo+YWN0dWFsbHkgYSBmaXgg
b2YgdGhlIGJlaGF2aW91ci4KPgo+PiArCXJldCA9IGdwaW9fcmVnbWFwX3NldF9kaXJlY3Rpb24o
Y2hpcCwgb2Zmc2V0LCB0cnVlKTsKPj4gKwlpZiAocmV0KQo+PiArCQlyZXR1cm4gcmV0Owo+PiAg
Cj4+IC0JcmV0dXJuIGdwaW9fcmVnbWFwX3NldF9kaXJlY3Rpb24oY2hpcCwgb2Zmc2V0LCB0cnVl
KTsKPj4gKwkvKgo+PiArCSAqIGdwaW8gdmFsdWUgaXMgc2V0IGFnYWluLCBiZWNhdXNlIHBsMDYx
IGRvZXNuJ3QgYWxsb3cgdG8gc2V0IHZhbHVlIG9mCj4+ICsJICogYSBncGlvIHBpbiBiZWZvcmUg
Y29uZmlndXJpbmcgaXQgaW4gT1VUIG1vZGUuCj4+ICsJICovCj4+ICsJaWYgKGdwaW8tPndyaXRl
X2RhdGFfYWZ0ZXJfZGlyKQo+PiArCQlyZXR1cm4gZ3Bpb19yZWdtYXBfc2V0KGNoaXAsIG9mZnNl
dCwgdmFsdWUpOwo+Cj5UYWtpbmcgdGhlIGFib3ZlIGludG8gYWNjb3VudCBJJ20gbm90IHN1cmUg
aWYgd2Ugd2FudCB0aGUgaW5jb25zaXN0ZW5jeSB3aXRoCj50aGUgYWJvdmUuIFBlcmhhcHMgYWxz
byBpZ25vcmUgdGhlIHJldHVybmVkIHZhbHVlIGZvciBub3c/Cj4KPj4gKwlyZXR1cm4gMDsKPgo+
LS0gCj5XaXRoIEJlc3QgUmVnYXJkcywKPkFuZHkgU2hldmNoZW5rbwo+Cg==

