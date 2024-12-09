Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD69E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q54hqglvs3EEjlWUnywKhs/WmG6gqbTT96DE4HuistY=; b=hWDsZRr0x2Em0V6QHRvPrBQkcz
	tBOl/WcgNcs9ZIq0EPsqGWB76aTDmdmAzU2T1hgSS/SWFpbXpidY1plaBIpQhBJGTpU9nwcTapVqf
	xwhDIvJoXV7/l0lUvxk24fZfDEcdxYR4LReQMdXTkKbYxzT1nOqsqnf/26LJIxGmP1fMNbvaHOmyL
	0DfqxTs5CG10fL7k9YfBOyApc0evQbdTP3/eXRQILNLBBoiHMHLUyL0FvOMJsODPAH2cN1/udWywd
	P7o3u93XVQjWgK0SHL+gdMFDopB5shZf0ew6qGXB+sCZj47fPR3l3ESMea4QEVbT6d234Wx3FsCK4
	DhRTMaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdN9-00000007q0c-2S3r;
	Mon, 09 Dec 2024 13:00:23 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd0y-00000007jar-20JQ;
	Mon, 09 Dec 2024 12:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=oaL4vuqyJPqCzrebAYqJ4BkKXX75wUQalceWFIYVX60=; b=b
	oDnxdIyak6k6oTFpXzAmrmXKbA2F8nEQZWEJlImrUoivFyfnGozddxf8Us5jd9J4
	pQm1mG6ASENox8K5fWqasZSYnDWUqq+KhoZNvvyolOPvwfrVbBgyLJl93HktG3Jf
	fzadG2fD5OL7CbsvrHmUbNmQ8ZYIP7kzGTstiDeA98=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Mon, 9 Dec 2024 20:37:16 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 9 Dec 2024 20:37:16 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com, 
	detlev.casanova@collabora.com
Subject: Re:[PATCH] arm64: dts: rockchip: Enable HDMI display for rk3588
 Cool Pi GenBook
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20241209122943.2781431-3-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209122943.2781431-3-andyshrk@163.com>
X-NTES-SC: AL_Qu2YAfufuEAo4CWcYukZnEobh+Y5UcK2s/ki2YFXN5k0tCTI0SYQW29KGUD2y86DDiKsoAirUQVL5MpFRpJHY45Pr/VWJbfCvfnScnDgjI4d
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5818dffa.ba85.193ab6c868c.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgDXj7585FZnANI6AA--.45284W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hGwXmdW4xo5UwACsN
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043728_813354_69AD319A 
X-CRM114-Status: UNSURE (   6.50  )
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

ClNvcnJ5LCBwbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guCgpBdCAyMDI0LTEyLTA5IDIwOjI5OjEy
LCAiQW5keSBZYW4iIDxhbmR5c2hya0AxNjMuY29tPiB3cm90ZToKPkVuYWJsZSBoZG1pIGRpc3Bs
YXkgb3V0cHV0IG9uIENvb2wgUGkgR2VuQm9vay4KPgo+U2lnbmVkLW9mZi1ieTogQW5keSBZYW4g
PGFuZHlzaHJrQDE2My5jb20+Cj5MaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQx
MDI4MTIzNTAzLjM4NDg2Ni00LWFuZHlzaHJrQDE2My5jb20KPlNpZ25lZC1vZmYtYnk6IEhlaWtv
IFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4tLS0KPiAuLi4vcm9ja2NoaXAvcmszNTg4LWNv
b2xwaS1jbTUtZ2VuYm9vay5kdHMgICAgfCA0OSArKysrKysrKysrKysrKysrKysrCj4gMSBmaWxl
IGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcm9ja2NoaXAvcmszNTg4LWNvb2xwaS1jbTUtZ2VuYm9vay5kdHMgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OC1jb29scGktY201LWdlbmJvb2suZHRzCj5pbmRleCA2
NDE4Mjg2ZWZlNDBkLi45ZWMyMzc0YzZjZGZhIDEwMDY0NAo+LS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9yb2NrY2hpcC9yazM1ODgtY29vbHBpLWNtNS1nZW5ib29rLmR0cwo+KysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1ODgtY29vbHBpLWNtNS1nZW5ib29rLmR0cwo+QEAg
LTcsNiArNyw3IEBACj4gL2R0cy12MS87Cj4gCj4gI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2xlZHMv
Y29tbW9uLmg+Cj4rI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3NvYy9yb2NrY2hpcCx2b3AyLmg+Cj4g
I2luY2x1ZGUgInJrMzU4OC1jb29scGktY201LmR0c2kiCj4gCj4gLyB7Cj5AQCAtMzUsNiArMzYs
MTcgQEAgY2hhcmdlcjogZGMtY2hhcmdlciB7Cj4gCQlncGlvcyA9IDwmZ3BpbzEgUktfUEMwIEdQ
SU9fQUNUSVZFX0xPVz47Cj4gCX07Cj4gCj4rCWhkbWktY29uIHsKPisJCWNvbXBhdGlibGUgPSAi
aGRtaS1jb25uZWN0b3IiOwo+KwkJdHlwZSA9ICJhIjsKPisKPisJCXBvcnQgewo+KwkJCWhkbWlf
Y29uX2luOiBlbmRwb2ludCB7Cj4rCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaTBfb3V0X2Nv
bj47Cj4rCQkJfTsKPisJCX07Cj4rCX07Cj4rCj4gCWxlZHM6IGxlZHMgewo+IAkJY29tcGF0aWJs
ZSA9ICJncGlvLWxlZHMiOwo+IAo+QEAgLTEzNiw2ICsxNDgsMjggQEAgdmNjNXYwX3VzYl9ob3N0
MDogdmNjNXYwX3VzYjMwX2hvc3Q6IHZjYzV2MC11c2ItaG9zdC1yZWd1bGF0b3Igewo+IAl9Owo+
IH07Cj4gCj4rLyogSERNSSBDRUMgaXMgbm90IHVzZWQgKi8KPismaGRtaTAgewo+KwlwaW5jdHJs
LTAgPSA8JmhkbWltMF90eDBfaHBkICZoZG1pbTBfdHgwX3NjbCAmaGRtaW0wX3R4MF9zZGE+Owo+
KwlzdGF0dXMgPSAib2theSI7Cj4rfTsKPisKPismaGRtaTBfaW4gewo+KwloZG1pMF9pbl92cDA6
IGVuZHBvaW50IHsKPisJCXJlbW90ZS1lbmRwb2ludCA9IDwmdnAwX291dF9oZG1pMD47Cj4rCX07
Cj4rfTsKPisKPismaGRtaTBfb3V0IHsKPisJaGRtaTBfb3V0X2NvbjogZW5kcG9pbnQgewo+KwkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX2Nvbl9pbj47Cj4rCX07Cj4rfTsKPisKPismaGRwdHhw
aHlfaGRtaTAgewo+KwlzdGF0dXMgPSAib2theSI7Cj4rfTsKPisKPiAmaTJjNCB7Cj4gCXN0YXR1
cyA9ICJva2F5IjsKPiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPkBAIC0zNDcsMyArMzgx
LDE4IEBAICZ1c2JfaG9zdDFfeGhjaSB7Cj4gCWRyX21vZGUgPSAiaG9zdCI7Cj4gCXN0YXR1cyA9
ICJva2F5IjsKPiB9Owo+Kwo+KyZ2b3Agewo+KwlzdGF0dXMgPSAib2theSI7Cj4rfTsKPisKPism
dm9wX21tdSB7Cj4rCXN0YXR1cyA9ICJva2F5IjsKPit9Owo+Kwo+KyZ2cDAgewo+Kwl2cDBfb3V0
X2hkbWkwOiBlbmRwb2ludEBST0NLQ0hJUF9WT1AyX0VQX0hETUkwIHsKPisJCXJlZyA9IDxST0NL
Q0hJUF9WT1AyX0VQX0hETUkwPjsKPisJCXJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaTBfaW5fdnAw
PjsKPisJfTsKPit9Owo+LS0gCj4yLjM0LjEK

