Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F67BC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCzUubWpI7qbmQBS32q7t9ANxbIzbn/3ILLojBnJFaI=; b=IRZaWbnoDevJrHRIieBQuTXSNQ
	qV0eQOcD+wDydYixZDoejhTPMtS1FbP9mVBL01qpUdrSn0hKAcpDVlyI7AizozipnG6+bg7g3nuGZ
	Emx1qMWYvzG6pNNr06YT7AQFOe0tDiZM6t0HnMVwMtUoynUcJuBs/dSCmyp5aB4Bvds3ePWqoBUck
	lwvZbDiZj5HnHvPdStZzDve1BsLQ/kvNMzpeAfqoX/oowqGxc0UdlnsxkezE2l6e56jjaTVqN6eTz
	jr4NbWpO+dcK5h7hc8uyIoYfrDbwTYGj7kYpfCmTTdJAuo4KsRSw9KXNotQzYY/gE9VgtF3r7H4lM
	c9Zqkrzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLzQ-00000007uOH-1gH6;
	Wed, 26 Mar 2025 08:19:56 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLqu-00000007sqS-3sGD;
	Wed, 26 Mar 2025 08:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ww0BkFy4aWA0YRYiXhyPOQOR4G2Nus3Dw378EDkmqd8=; b=R
	gXrxQ0Kh0sHRTtUVhdTIMLk5EjQc46fR/N7c+l6i772hwD+5qoYZE7LNfGQ2pidY
	b98Z+JZlBaiVh3OCRe+PsPAfu6Mc0EQrEFI6Li1AHFZ1+KxBdpBPKVDWW39ePtlr
	gzBNQPg8JML3FAbw0Xqqd56fPeHXyrd6YbUMlWI+Ck=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-115 (Coremail) ; Wed, 26 Mar 2025 16:10:40 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 26 Mar 2025 16:10:40 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org, hjc@rock-chips.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v2 2/6] dt-bindings: display: rockchip,inno-hdmi:
 Document GRF for RK3036 HDMI
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250326-poetic-happy-peacock-a79d29@krzk-bin>
References: <20250325132944.171111-1-andyshrk@163.com>
 <20250325132944.171111-3-andyshrk@163.com>
 <20250326-poetic-happy-peacock-a79d29@krzk-bin>
X-NTES-SC: AL_Qu2fAPWcuU4v5iabY+kfmkcVgOw9UcO5v/Qk3oZXOJF8jDzp/xADZW1jPVTtweeEIS+ujTi3dDVRxcBmeZlRU6UgfbysO0M0gOJZSe6spqRDuA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <617e3d7f.77d1.195d180e680.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cygvCgD3v8uAtuNnBmmNAA--.58577W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB4cXmfjtY8XaAABs0
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_011109_336371_0A66A6D8 
X-CRM114-Status: UNSURE (   8.66  )
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

CkhpCgpBdCAyMDI1LTAzLTI2IDE1OjU5OjI1LCAiS3J6eXN6dG9mIEtvemxvd3NraSIgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj5PbiBUdWUsIE1hciAyNSwgMjAyNSBhdCAwOToyOTozNlBNICsw
ODAwLCBBbmR5IFlhbiB3cm90ZToKPj4gRnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hp
cHMuY29tPgo+PiAKPj4gSERNSSBvbiBSSzMwMzYgdXNlIEdSRiBjb250cm9sIHRoZSBIU1lOQy9W
U1lOQyBwb2xhcml0eSwgYnV0IHRoaXMgcGFydAo+PiBpcyBtaXNzaW5nIHdoZW4gaXQgZmlyc3Qg
bGFuZGluZyB1cHN0cmVhbS4KPj4gCj4+IERvY3VtZW50IHRoYXQgaXQgaXMgbWFuZGF0b3J5IGZv
ciBSSzMwMzYgSERNSS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkBy
b2NrLWNoaXBzLmNvbT4KPj4gLS0tCj4+IAo+PiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPgo+V2hl
cmUgd2FzIHYxPyBJIGNhbm5vdCBmaW5kIGl0LgoKU29ycnksIEkgZm9yZ290IHRvIG1lbnRpb24g
aXQgOiAiIHRoaXMgcGF0Y2ggaXMgZmlyc3QgaW5jbHVkZWQgaW4gdGhpcyBzZXJpZXMiCgoKPgo+
YjQgZGlmZiAnMjAyNTAzMjUxMzI5NDQuMTcxMTExLTMtYW5keXNocmtAMTYzLmNvbScKPkNoZWNr
aW5nIGZvciBvbGRlciByZXZpc2lvbnMKPkdyYWJiaW5nIHNlYXJjaCByZXN1bHRzIGZyb20gbG9y
ZS5rZXJuZWwub3JnCj5Ob3RoaW5nIG1hdGNoaW5nIHRoYXQgcXVlcnkuCj4tLS0KPkFuYWx5emlu
ZyA3IG1lc3NhZ2VzIGluIHRoZSB0aHJlYWQKPkNvdWxkIG5vdCBmaW5kIGxvd2VyIHNlcmllcyB0
byBjb21wYXJlIGFnYWluc3QuCj4KPkJlc3QgcmVnYXJkcywKPktyenlzenRvZgo+Cj4KPl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj5MaW51eC1yb2NrY2hp
cCBtYWlsaW5nIGxpc3QKPkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcm9ja2NoaXAK

