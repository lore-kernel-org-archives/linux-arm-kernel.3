Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE71CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+TxpN+8v3D/wFUbqbHk8ljRzYJDzRbfCfOGr2ucmQ8=; b=z5lSAH2/EBi2zS4Ve/XDlBpUF8
	w78+5dZ71iJjDaBs0klBYoNsv0eyJVE5C+6cxDptTzmswqIkS5qqKzIcXs02md6Oxed7kiPzyW90E
	zx7qqOcZ+Fs2KHyFjPpMGKCvhA9Bw+QjDHLP2fjroan2JPF4aAiKZgPkMlH+ZcQh6b9hWjIiT97FQ
	Ols1uX1rkp+0+UYwDREXBgmaiAXTN7NenhLMP/1EL0Aw/yPEd+YJ6N/NhyOxvCekXNeoHpSryc76O
	dLtVNeCQqpn52jkOruJIdozxdWvQtJNu49QVBK4JTwly2R+RUcBu2N6Rsd4Y4SMtGgS/7Xa35h686
	2aWor/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gHS-00000007ADN-1Dw0;
	Fri, 17 Oct 2025 08:57:46 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gHP-00000007ABE-0aeF;
	Fri, 17 Oct 2025 08:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=0I00pQnbY1u48SLSbfkjT/kC6CPcVg5dby2NqOBL3+k=; b=B
	CNdO21oTuVDDYpNEGDxqBTpsymKzpM4FzG/XkmpdVAk9FZEHsrHwtoFzZBBsj6si
	w7FLyqTo7h1hEPjRZqZUHKJqUkReB0k5FyxNNWSTls0p+d/8FjzRUdF3/twcUef8
	JkMF4RsTTxEu8yC4QwDVohHV862zRxhK0WwwmR9LcA=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Fri, 17 Oct 2025 16:56:38 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 17 Oct 2025 16:56:38 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Maud Spierings" <maud_spierings@murena.io>
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
	andy.yan@rock-chips.com, devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
	heiko@sntech.de, jernej.skrabec@gmail.com, jonas@kwiboo.se,
	knaerzche@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re:Re: [PATCH v8 2/2] MAINTAINERS: Add entry for Innosilicon hdmi
 bridge library
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <040d8fe8-da2f-4aa5-a2c3-1aec0cf2e8f0@murena.io>
References: <20251016083843.76675-3-andyshrk@163.com>
 <040d8fe8-da2f-4aa5-a2c3-1aec0cf2e8f0@murena.io>
X-NTES-SC: AL_Qu2dAvqSvksi7iKcZekfmUgWjuw/WsG1v/Ul1YBSP556jC/r8zkjQUF9DEnN7/uOLACpsBq9WjdwxuR2UoVeWLsLcVeD6Y6TtCYHViqiBA2GRw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <671fc19.84e3.199f162a66c.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgAnDpjGBPJodsENAA--.5725W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gTpXmjyAwEUgwACss
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_015743_487907_CD1ECE94 
X-CRM114-Status: UNSURE (   9.72  )
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

CgpIZWxsbyBNYXVk77yMCgpBdCAyMDI1LTEwLTE3IDE1OjU4OjIyLCAiTWF1ZCBTcGllcmluZ3Mi
IDxtYXVkX3NwaWVyaW5nc0BtdXJlbmEuaW8+IHdyb3RlOgo+SGkgQW5keSwKPgo+PiBGcm9tOiBB
bmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+IAo+PiBBZGQgZW50cnkgZm9yIElu
bm9zaWxpY29uIGhkbWkgYnJpZGdlIGxpYnJhcnkKPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkg
WWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gLS0tCj4+IAo+PiAobm8gY2hhbmdlcyBz
aW5jZSB2MSkKPj4gCj4+ICBNQUlOVEFJTkVSUyB8IDggKysrKysrKysKPj4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTCj4+IGluZGV4IGY5Zjk4NWM3ZDc0NzkuLjBhZGNmYjFjMjY0YTEgMTAwNjQ0Cj4+
IC0tLSBhL01BSU5UQUlORVJTCj4+ICsrKyBiL01BSU5UQUlORVJTCj4+IEBAIC0xMjI5OSw2ICsx
MjI5OSwxNCBAQCBNOglTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KPj4gIFM6
CU1haW50YWluZWQKPj4gIEY6CWRyaXZlcnMvcG93ZXIvc3VwcGx5L2lwNXh4eF9wb3dlci5jCj4+
ICAKPj4gK0lOTk9TSUxJQ09OIEhETUkgQlJJREdFIERSSVZFUgo+PiArTToJQW5keSBZYW4gPGFu
ZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiArTDoJZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+PiArUzoJTWFpbnRhaW5lZAo+PiArVDoJZ2l0IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vbWlzYy9rZXJuZWwuZ2l0Cj4+ICtGOglkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2lubm8taGRtaS5jCj4+ICtGOglpbmNsdWRlL2RybS9icmlkZ2UvaW5ub19oZG1pLmgKPj4gKwo+
PiAgSU5PVElGWQo+PiAgTToJSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPj4gIFI6CUFtaXIgR29s
ZHN0ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+Cj4+IC0tIAo+PiAyLjQzLjAKPgo+SSBiZWxpZXZl
IHRoaXMgcGF0Y2ggc2hvdWxkIGJlIHNxdWFzaGVkIGludG8gdGhlIHBhdGNoIHRoYXQgYWN0dWFs
bHkgCj5jcmVhdGVzIHRoZSBmaWxlcyBsaXN0ZWQgaW4gdGhlIE1BSU5UQUlORVJTIGVudHJ5LCBs
aWtlIEkgZG8gaGVyZSBbMV0uIAo+Q2hlY2twYXRjaCBzaG91bGQgYmUgY29tcGxhaW5pbmcgYWJv
dXQgcGF0Y2ggWzEvMl0gaWYgSSdtIG5vdCBtaXN0YWtlbiwgCj53aGVuIHlvdSBydW4gYGI0IHBy
ZXAgLS1jaGVja2AuCgpXZSB0YWxrZWQgYWJvdXQgc29tZXRoaW5nIHNpbWlsYXIgaGVyZVsyXe+8
mgpNYXhpbWUgYmVsaWV2ZXMgdGhleSBzaG91bGQgYmUgc2VwYXJhdGUgcGF0Y2hlcywgCkFuZCBJ
J3ZlIHNlZW4gbWFueSBtZXJnZWQgY29tbWl0cyBpbiB0aGUga2VybmVsIGFyZSBhbHNvIGhhbmRs
ZSBNQUlOVEFJTkVSUyBlbnRyeSBhcyBzZXBhcmF0ZSBwYXRjaGVzCgoKWzJdaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcm9ja2NoaXAvM3lncW5qNGlkZXk3dTRtN2x0bHY3cG5maGtrdmNl
cG1wZmRpamRzemN0YWVvcHEza3lAcXRlZzMzY29tamwzLwoKPgo+TGluazogCj5odHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNTEwMDktbWF4MjUwMTQtdjQtMS02YWRiMmEwYWEzNWZAZ29j
b250cm9sbC5jb20vIAo+WzFdCj4KPktpbmQgcmVnYXJkcywKPk1hdWQK

