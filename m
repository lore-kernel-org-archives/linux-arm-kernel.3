Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACC1C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1R8DjT6IWhZddPF9ppriYcIPoUIeXndNSl4I9OG62+M=; b=bfrZG519qQGRbQbN2txlNGC21B
	R63qLVRsS7uxPtjFZzlTYcI/wGSwDlr3q2Nlt2aamYmaeQHN8fK/p2fkYtAEK3DJsyfy1hWC9divd
	XuK69blhnUrA+0s3LmFL1DXoKNaCxrF1Oi1UQSeXEvpkEu4UHyO07zu1fi3ZthnAcVnvB5ZKTvxJ+
	W93t8Av5rt1DCkV/4FtXZZEVXetEAnvoie7l52PV5nRLogGMyjRHdt8ykHWEE2Yp3P/uJvFePn4EG
	7lWX+97s2SJgbrU4TbBHlrNXqLNdiID/E2CwdDn1FKKIB0a/LspXMcpIeNRldMu7lorvvcZLRe2s7
	VxDsySGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcFG-00000009N9u-32Qw;
	Wed, 19 Aug 2026 09:06:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcFA-00000009N8m-2swD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Aug 2026 09:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1R8DjT6IWhZddPF9ppriYcIPoUIeXndNSl4I9OG62+M=; b=oK6jCQbVd5hRb3dRblKgRzFyN7
	3uajD7Kohy/em68aL/HGO9Fz5T6cmSEM7ilVjHaRw51LySxPW29Prc5/5J+o8r+vaHYNwQ5IQbmuC
	GiYBMT9cmRsAB0qRrwDJS6g0eroTmKb17t114PQmYuY3v7JqRmGkmsnQG8JNIZJK7SXLQTzgZlwmp
	pzdGm9bmob/D0v/fpcsZRcLx7MdiepJwZO/o7Q6mcbIK7trVCJdarDgJqKHo2v54wWc2yeOsmpON2
	NJkl7U/9m+LobQmCuOQowcsSOwv4TAjLlXFZHfKi7HWoYz/PsxM2tnNzLxXr9YVtMxrB9xEcv6oxb
	QgC0QVhA==;
Received: from m16.mail.163.com ([220.197.31.2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wwcF6-00000002Do3-3s2v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=1R8DjT6IWhZddPF9ppriYcIPoUIeXndNSl4I9OG62+M=; b=n
	siYxzBEWBxMBYihpoRBFMcjK2KWtCCINQwoXIMX4Rbk850kGPSrYzKknfOev7+Sw
	rBowQ2sfKOXn7dV3RICnnzH0tv5jezw3yGrUgVKBk5+ih0wW0nRq29+wpgT+o55o
	bDIKStGKrQM0h3h+RwfBKRrwCMXQ8ASiHhI/rV0clE=
Received: from zl020895$163.com ( [180.169.129.163] ) by
 ajax-webmail-wmsvr-40-101 (Coremail) ; Wed, 19 Aug 2026 17:04:36 +0800
 (CST)
X-Originating-IP: [180.169.129.163]
Date: Wed, 19 Aug 2026 17:04:36 +0800 (CST)
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
	"Bartosz Golaszewski" <brgl@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Brian Masney" <bmasney@redhat.com>, "Lee Jones" <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: Re:Re: [PATCH v5 05/12] dt-bindings: gpio: pl061: add Ambarella
 CV75 variant
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAD++jLngqGzethEG5Hx+oAPzZoV6rvWNGXYaycFFkDz_dXFz=g@mail.gmail.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-5-7bbb12f0360f@ambarella.com>
 <CAD++jLngqGzethEG5Hx+oAPzZoV6rvWNGXYaycFFkDz_dXFz=g@mail.gmail.com>
X-NTES-SC: AL_Qu2TBf2Yv0os4CKZZulS6DN615F8O5rMxLRDmdYrY+8JiBnj2hsZf1x6Flza4t4S6Qjtskm+L+PiF8ZvJW3f
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7b258258.6f41.1a01943e97e.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZSgvCgDXfy2kcYVqde80AA--.8013W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbCxgSB8mqFcaSWywAA3W
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_100553_709802_ABAE6193 
X-CRM114-Status: UNSURE (   8.56  )
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

SGkgTGludXMsCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpJIGNoZWNrZWQgaXQganVzdCBub3cs
IEFtYmFyZWxsYSBpcyBpbiBKRVAxMDZCTiBhcyBiYW5rIDE2IC8gaWRlbnRpdHkgMHg2OC4gClBl
ciBpbmNsdWRlL2xpbnV4L2FtYmEvYnVzLmggSSBwbGFuIHRvIHVzZSBwZXJpcGhpZCAweDAwMGU4
MDYxCihkZXNpZ25lciAweGU4ID0gSkVQMTA2IDB4Njggd2l0aCBiaXQ3IHNldCwgcGFydCAweDA2
MSkuClRoZSBjb250aW51YXRpb24gYmFuayBpcyBub3QgcmVwcmVzZW50YWJsZSBpbiB0aGUgY2xh
c3NpYwo4LWJpdCBkZXNpZ25lciBmaWVsZDsgcGxlYXNlIHRlbGwgbWUgaWYgeW91IHByZWZlciBh
IGRpZmZlcmVudAplbmNvZGluZy4KCkJlc3QgcmVnYXJkcywKTG9uZyBaaGFvCgpBdCAyMDI2LTA4
LTE5IDE1OjQ3OjA2LCAiTGludXMgV2FsbGVpaiIgPGxpbnVzd0BrZXJuZWwub3JnPiB3cm90ZToK
Pk9uIFR1ZSwgQXVnIDE4LCAyMDI2IGF0IDEyOjMy4oCvUE0gTG9uZyBaaGFvIHZpYSBCNCBSZWxh
eQo+PGRldm51bGwrbG9uZ3poYW8uYW1iYXJlbGxhLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPgo+
PiArICAgICAgcHJvcGVydGllczoKPj4gKyAgICAgICAgYXJtLHByaW1lY2VsbC1wZXJpcGhpZDoK
Pj4gKyAgICAgICAgICBjb25zdDogMHgwMDAwMDA2MQo+Cj5UaGUgMHg0MSBpbiBBUk1zIFBlcmlw
aElEIGlzIGFjdHVhbGx5IHRoZSBKRURFQyBKRVAxMDYKPmltcGxlbWVudGVyIElEICg4IGJpdHMp
Lgo+Cj5TbyB5b3Ugc2hvdWxkIGlkZWFsbHkgc2V0IHRoaXMgdG8gd2hhdGV2ZXIgdGhlIGhhcmR3
YXJlIGVuZ2luZWVycwo+c2hvdWxkIGhhdmUgdXNlZCwgaGFkIHRoZXkgcGFpZCBhdHRlbnRpb24g
dG8gZGV0YWlsLgo+SWYgeW91ciBjb21wYW55IGhhcyBhIGNvbnRhY3QgcG9pbnQgYXQgSkVERUMg
dGhleSBzaG91bGQKPmtub3cgd2hpY2ggaW1wbGVtZW50ZXIgSUQgdG8gdXNlIGZvciBBbWJhcmVs
bGEgZGVzaWducy4KPgo+U2luY2UgQW1iYXJlbGxhIGlzIGV2aWRlbnRseSBhIG1lbWJlciBvZiBK
RURFQyB5b3VyCj5yZXByZXNlbnRhdGl2ZSBzaG91bGQgYmUgYWJsZSB0byBzaW1wbHkgcmVxdWVz
dCBhIEpFUDEwNgo+aW1wbGVtZW50ZXIgSUQgYW5kIGdpdmUgaXQgdG8geW91IGlmIHRoZXJlIGlz
IG5vdCBvbmUgYXNzaWduZWQKPmFscmVhZHksIGJ1dCBJIGtub3cgaXQgY2FuIGJlIGhhcmQKPnNv
bWV0aW1lcyB0byBmaW5kIHRoZSByaWdodCBwZXJzb24gaW5zaWRlIHRoZSBjb21wYW55Cj5idXQg
SSB0aGluayBpdCdkIGJlIHdvcnRoIGdvaW5nIHRoZSBleHRyYSBtaWxlIGhlcmUsIHNheSB0aGF0
Cj50aGlzIGd1eSBmcm9tIHRoZSBrZXJuZWwgY29tbXVuaXR5IHBlcnNpc3RzLgo+Cj5Zb3VycywK
PkxpbnVzIFdhbGxlaWoK

