Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA38C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 08:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gm6Wlvw+VzITh5O1cBkw2+PlLaeotnGOuShcWGJ0QUA=; b=JTpX36MgfTEwLoRUKHyPkMBzAn
	ipzt3EuO34x+JzGXvqbRaUxNLx56sPhGSP3wzujKM03E5drPs/NWtQ191iz1obpsVqIiJzjGTkp64
	Mh3HAfzN9KlAYrL8ETp3SuL8lZ40kN/x+Cc/knxTdm6aFlGKhnmo2BeJdn+dImqxeRhbXuWZMvS9u
	GXpNpoQXbTUdt0/GotEF/8Y7h/w1qCO7tJDVCMTVYN/zRftJSg8s+Hr803MkynXasSwxePeewJztL
	xdX+dJLDovFtIjHgty5Dvm8EhLSCycuSlZvg6cP1ZJcOeQYToSD9lK+YsC3fSgg2sgEoG2p+IVMDI
	4Rek7q9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjDxd-0000000HHeT-2ZS7;
	Sat, 15 Feb 2025 08:55:41 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjDw2-0000000HHOH-0S5G;
	Sat, 15 Feb 2025 08:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=N3TP0XibWw2sSwmbnWxyiBXX521K29MQWltvdhdqFko=; b=g
	mrEmFMcIQTVpIkMt/OeTHqV6Js/AAZNIgPYFRAZ/+TE/ak6p5CflJqLdcDvSQaCz
	q7pFx+7umEdrTjjrrUI2WMusdTQlGQIinES4+R13rSmXVGGtxwxPSzb30jXxgUYt
	caarbArFJVBCV2UL2iPE5shDqH91gvYNNyW9QksY0Y=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Sat, 15 Feb 2025 16:53:50 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 15 Feb 2025 16:53:50 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Lucas Stach" <l.stach@pengutronix.de>
Cc: "Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Damon Ding" <damon.ding@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: Re:[PATCH 1/2] drm/rockchip: vop: remove redundant condition check
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250207182247.215537-1-l.stach@pengutronix.de>
References: <20250207182247.215537-1-l.stach@pengutronix.de>
X-NTES-SC: AL_Qu2YC/qbtk4o5iKdbekfmkcVgOw9UcO5v/Qk3oZXOJF8jCrr9gYOYUFMLFHZ4OeODhqPrheYUAFq0M9dZ69DWLMbMhyTfrz/fSbtNYlGctFb7Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <64ed50b3.23b5.19508d0663a.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgDXPwAeVrBnwGJpAA--.21151W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hT0XmewSqmjvQABsH
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_005402_464614_917E3C73 
X-CRM114-Status: UNSURE (   6.23  )
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

CkhpIEx1Y2Fz77yMCgpBdCAyMDI1LTAyLTA4IDAyOjIyOjQ2LCAiTHVjYXMgU3RhY2giIDxsLnN0
YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPkluc3RlYWQgb2YgY2hlY2tpbmcgdGhlIHNhbWUg
dGhpbmcgdHdpY2UgaW4gYSByb3csIGZvbGQgdGhlIHNlY29uZAo+Y29uZGl0aW9uIGludG8gdGhl
IGZpcnN0IGNsYXVzZS4KPgo+U2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVu
Z3V0cm9uaXguZGU+CgogIFJldmlld2VkLWJ5OiBBbmR5IFlhbiA8YW5keXNocmtAMTYzLmNvbT4K
CgpUaGFua3MKCj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3Zv
cC5jIHwgNSArKy0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
ZHJtX3ZvcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwo+
aW5kZXggNTc3NDdmMWNmZjI2Li43ZjVmYmVhMzQ5NTEgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCj5AQCAtNzMzLDExICs3MzMsMTAgQEAgc3RhdGlj
IHZvaWQgdm9wX2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+IAo+
IAlXQVJOX09OKHZvcC0+ZXZlbnQpOwo+IAo+LQlpZiAoY3J0Yy0+c3RhdGUtPnNlbGZfcmVmcmVz
aF9hY3RpdmUpCj4rCWlmIChjcnRjLT5zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkgewo+IAkJ
cm9ja2NoaXBfZHJtX3NldF93aW5fZW5hYmxlZChjcnRjLCBmYWxzZSk7Cj4tCj4tCWlmIChjcnRj
LT5zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkKPiAJCWdvdG8gb3V0Owo+Kwl9Cj4gCj4gCW11
dGV4X2xvY2soJnZvcC0+dm9wX2xvY2spOwo+IAo+Cj5iYXNlLWNvbW1pdDogMjAxNGM5NWFmZWNl
ZTNlNzZjYTRhNTY5NTZhOTM2ZTIzMjgzZjA1Ygo+LS0gCj4yLjQ4LjEKPgo=

