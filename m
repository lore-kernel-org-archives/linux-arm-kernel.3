Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E331E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 06:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ompl6/K2meAS/eUbiMbr0hfHQHeRh2D2IiRt/Iqs+7Q=; b=YCJOmoxFsCrgZ8hIapRXjgMiX0
	dwtnrywvrdkgddnpfkmJl4j0VOSopJi/sQ18n9wXfjeawLhWeiiIUfFzt5LJqeqT0FW+YsvH9HfO7
	xrcBOC+qTAXsEg1s3SOvE3lTlR3xsKk43CX6R9mPMRU5JJ19FxyuHHL3Yrkq5SCvd2pQkFtYStakn
	nuFphUlBVyu5qYhkwtQX4chvvhSIpJD6ppP/+aRJjEO5LKF7klyOpryV5aJX184Rfdrw8X0rf5ARq
	M5Y5xcPLR+W3plQ2xaH6U1FaTzgebbtumhSR5RYGQzpWv6qfZZibOnu02WC88nuhvq7GpoPCr2FbE
	sWg0SqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPFtN-00000007vcG-1U4i;
	Sun, 22 Dec 2024 06:56:45 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPFsA-00000007vWx-3T99;
	Sun, 22 Dec 2024 06:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=JPam1UosXoRANgd65uJafytqpORJCez2pxTKbdxqKjA=; b=B
	y4kbP06lFH4wziQ2BzZgVe/OXIbTQU8mTg6Pea9Be3sOHZJcn0eqa6d/835tu6U4
	LPLrMBbMmQ4dTQ6Ndnqze/akPqTcsgAIQSOrWOOCx69YnlQ+FVq5zCEsC/LqIxeu
	PTsKTCsyVSii39uIrGw5SpEOalJUGBB8Zbw4ZVsNp8=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-138 (Coremail) ; Sun, 22 Dec 2024 14:55:09 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sun, 22 Dec 2024 14:55:09 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: dsimic@manjaro.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, krzk+dt@kernel.org, 
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH] arm64: dts: rockchip: aliase sdhci as mmc0 for
 rk3566 box demo
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <24438615.ouqheUzb2q@diego>
References: <20241221104920.4193034-1-andyshrk@163.com>
 <24438615.ouqheUzb2q@diego>
X-NTES-SC: AL_Qu2YBvSev00r7yCdZ+lS0zJw2L5KLrXQ55RVgP4ISMMety/k0AwKZFNTPmLdzeSuBBU8bSamSy4cOyxnpFvN
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <19b62068.1082.193ed25f901.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iigvCgD3f8_Nt2dnJY1FAA--.19992W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g69XmdnqqGdTwAEsi
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_225531_303239_B3CDFC2C 
X-CRM114-Status: GOOD (  15.25  )
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

CkhpIEhlaWtv77yMCkF0IDIwMjQtMTItMjEgMjA6NTU6MDIsICJIZWlrbyBTdMO8Ym5lciIgPGhl
aWtvQHNudGVjaC5kZT4gd3JvdGU6Cj5IaSBBbmR5LAo+Cj5BbSBTYW1zdGFnLCAyMS4gRGV6ZW1i
ZXIgMjAyNCwgMTE6NDk6MDcgQ0VUIHNjaHJpZWIgQW5keSBZYW46Cj4+IEZyb206IEFuZHkgWWFu
IDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gCj4+IEZvbGxvdyBtb3N0IG90aGVycyByazM1
NnggYmFzZWQgYm9hcmRzLCBhbmQgdS1ib290IG9ubHkgdXNlIG1tYzAvMQo+PiBhcyBtbWMgYm9v
dCB0YXJnZXRzLCBzbyBhbGlhc2Ugc2RoY2kgYXMgbW1jMC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gLS0tCj4+IAo+PiAgYXJjaC9h
cm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NjYtYm94LWRlbW8uZHRzIHwgNiArKystLS0KPj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+IAo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NjYtYm94LWRlbW8u
ZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NjYtYm94LWRlbW8uZHRzCj4+
IGluZGV4IDQxYjRjZDVhNDIyMC4uN2QwZWVkZjFiZDBkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU2Ni1ib3gtZGVtby5kdHMKPj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NjYtYm94LWRlbW8uZHRzCj4+IEBAIC0xOSw5ICsx
OSw5IEBAIC8gewo+PiAgCj4+ICAJYWxpYXNlcyB7Cj4+ICAJCWV0aGVybmV0MCA9ICZnbWFjMTsK
Pj4gLQkJbW1jMCA9ICZzZG1tYzA7Cj4+IC0JCW1tYzEgPSAmc2RtbWMxOwo+PiAtCQltbWMyID0g
JnNkaGNpOwo+PiArCQltbWMwID0gJnNkaGNpOwo+PiArCQltbWMxID0gJnNkbW1jMDsKPj4gKwkJ
bW1jMiA9ICZzZG1tYzE7Cj4KPnNvcnJ5LCBidXQgdGhhdCB3b24ndCBiZSBwb3NzaWJsZSA6LSgg
Lgo+Cj5UaGUgb3JpZ2luYWwgYWxpYXNlcyBmb3IgdGhlIG1tYyBvcmRlciB3ZXJlIGFkZGVkIG92
ZXIgMiB5ZWFycyBhZ28KPihub3ZlbWJlciAyMDIyKSBhbmQgYmVjYW1lIHBhcnQgb2YgdGhlIEFC
SSB0aGVuLgoKWWVzLCAgdGhlIHBhdGNoIGZvciB0aGlzIGJvYXJkIHdhcyBzdWJtaXR0ZWQgYnkg
bWUuClRoaXMgaXMgYSB0diBib3ggIGV2YWx1YXRpb24gZGVtbyBib2FyZCB0aGF0IHdlIHVzZSBp
bnRlcm5hbGx577yMYW5kIGl0IGlzIG5vdCBzb2xkIHRvIHRoZSBwdWJsaWMuCkkgc3VibWl0dGVk
IGl0IHRvIHRoZSBtYWlubGluZSBiZWNhdXNlIGl0IGlzIHNtYWxsLCBjb21wYWN0IGFuZCBzdHJl
YW1saW5lZCwgaXQgZWFzeSBmb3IgbWUKdG8gdXNlIGl0ICB0ZXN0IHRoZSBtYWlubGluZSB2b3Ay
IGRyaXZlci4gCkkgdGhpbmsgaSBhbSBjdXJyZW50bHkgdGhlIG9ubHkgdXNlciB3aG8gd2lsbCB1
c2UgdGhpcyBib2FyZCBydW4gdGhlIG1haW5saW5lIGtlcm5lbC4KSSdtIG5vdCBzdXJlIGlmIHdl
IGNhbiBsZXQgaXQgZ28uCgoKPgo+SW1hZ2luZSBzb21lb25lIHVzaW5nIHRoYXQgYm9hcmQgd2l0
aCBhIHJvb3Rmcz0vZGV2L21tY2JsazJwMSBwYXJ0Cj5pbiB0aGUgY29tbWFuZGxpbmUgdG8gbW91
bnQgdGhlIG9sZCBzZGhjaS1wYXJ0MSBhcyByb290ZnMsIGJ1dCBub3cKPnlvdSByZW9yZGVyIHRo
ZSBjb250cm9sbGVycywgc28gc28gdGhhdCBjb21tYW5kbGluZSB3b3VsZCB0cnkgdG8gYWNjZXNz
Cj5zZG1tYzEsIHNvIHRoZWlyIHN5c3RlbSB3b24ndCBib290IGFueW1vcmUgYWZ0ZXIganVzdCBh
IHNpbXBsZSBrZXJuZWwKPnVwZGF0ZS4KPgo+QnJlYWtpbmcgcGVvcGxlJ3Mgc2V0dXAgaXMgb25l
IG9mIHRob3NlIGJpZyBuby1nby1zIGluIHRoZSBrZXJuZWwsIHNvCj5zYWRseSB5b3UnbGwgbmVl
ZCB0byBsaXZlIHdpdGggdGhlIGV4aXN0aW5nIG9yZGVyLgo+Cj4KPkhlaWtvCj4KPgo=

