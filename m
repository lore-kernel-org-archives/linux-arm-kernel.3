Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEB7FC592F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZoG2+nssJfvfR/Kr7cZfRfAHIF/UEVtluNJU+Zz8fg=; b=h1hFtaFh5gN7ZBIJgMAzMIGApH
	wTYWZ0m94QwOVkqo2mKvYtbTjPYYrvwdXUFlWW8bK4lBXGuyyTa5/JYK2VM+b/wP0mNMAstIqWefZ
	9mPClbnGKGDlhijXrn2TeTGD//3TmkuhgeHSsxmOXoavICveMhe6vYpilHTTg7VB94g+Y/GYpZqPL
	6arYY/yJf4sESmudoj7968PYYOl6EaVngjUMGwnWbte21wGzn8dPmekJbUcReFfa8j04+wFsVVg40
	FhxQMi4P0Q5FSiSprcht6lCp5OEBCwos0IWRS19EglEY3uTbTztraPn7Eq5w+5R8p/UXaTTkkrfOB
	MbVA3jSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZUY-000000062fS-0dTf;
	Thu, 26 Feb 2026 11:25:14 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZUU-000000062ep-3snY;
	Thu, 26 Feb 2026 11:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=BZoG2+nssJfvfR/Kr7cZfRfAHIF/UEVtluNJU+Zz8fg=; b=b
	vSGtS0ASdA9brQSlySE6g7fNuV3OEfXPIt5YanYIejtVdOLLu4AVTAxok7wEGM89
	yiVlepkf94c4FcSfz621kJn3eVV6txDFd8aFsSh3+UgPf89GBj2ag8azfyU7FWfV
	tvP2cxwWyp6Gu78zN8Qnuv+pQU9RXmBFcsqfpfzJv4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-146 (Coremail) ; Thu, 26 Feb 2026 19:24:48 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 26 Feb 2026 19:24:48 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Chaoyi Chen" <kernel@airkyi.com>
Cc: "Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Heiko Stuebner" <heiko@sntech.de>,
	"Alexey Charkov" <alchark@gmail.com>,
	"Shawn Lin" <shawn.lin@rock-chips.com>,
	"Chaoyi Chen" <chaoyi.chen@rock-chips.com>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Sebastian Reichel" <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] arm64: dts: rockchip: Fix sdmmc pwren pinctrl for
 rk3576-evb2
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260226102052.63-1-kernel@airkyi.com>
References: <20260226102052.63-1-kernel@airkyi.com>
X-CM-CTRLMSGS: JZu7TnBsdXM9MTc3MjEwNTA4NzEwN18xNjg5ZmU5ZjAwMDRiZWY5NTU2Y2MyM
 DQ3YmQ2OWE1Yw==
X-NTES-SC: AL_Qu2cAP2bukgj7iGfZ+kfmUgWjuw/WsG1v/Ul1YBSP556jCzr9zsff3pGG3Dp4sKQJjGPnz6sShppxtxDcKp/T5wNjDi5I4wrNCjoHzy/mNnPfQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <71bf3205.7a33.19c99b1bcb7.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kigvCgBHn2mALaBp8zFtAA--.12630W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7QDtTGmgLYDFEQAA38
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_032511_320500_AEF06987 
X-CRM114-Status: UNSURE (   6.03  )
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

CkhlbGxv77yMCgpBdCAyMDI2LTAyLTI2IDE4OjIwOjUyLCAiQ2hhb3lpIENoZW4iIDxrZXJuZWxA
YWlya3lpLmNvbT4gd3JvdGU6Cj5Gcm9tOiBDaGFveWkgQ2hlbiA8Y2hhb3lpLmNoZW5Acm9jay1j
aGlwcy5jb20+Cj4KPkluIHJrMzU3Ni5kdHNpLCBzZG1tYzBfcHdyZW4gaXMgY29uZmlndXJlZCBh
cyBwYXJ0IG9mIHRoZSBzZG1tYyBwaW5jdHJsLgo+SG93ZXZlciwgb24gdGhlIHJrMzU3NiBldmIy
IGJvYXJkLCBzZG1tYzBfcHdyZW4gaXMgdXNlZCBhcyB0aGUgcmVndWxhdG9yCj5mb3Igdm1tYy1z
dXBwbHkuIFRoZXJlZm9yZSwgd2UgbmVlZCB0byByZWFzc2lnbiB0aGUgc2RtbWMgcGluY3RybCBh
bmQKPnJlbW92ZSBzZG1tYzBfcHdyZW4gdG8gYXZvaWQgY29uZmxpY3RzLgo+Cj5DYzogU2hhd24g
TGluIDxzaGF3bi5saW5Acm9jay1jaGlwcy5jb20+Cj5GaXhlczogODZhODJmN2E3ZWVkICgiYXJt
NjQ6IGR0czogcm9ja2NoaXA6IEFkZCByazM1NzYgZXZiMiBib2FyZCIpCj5TaWduZWQtb2ZmLWJ5
OiBDaGFveWkgQ2hlbiA8Y2hhb3lpLmNoZW5Acm9jay1jaGlwcy5jb20+CiAgIFRlc3RlZC1iee+8
miBBbmR5IFlhbiA8YW5keS55YW5AMTYzLmNvbT4KCgo+LS0tCj4gYXJjaC9hcm02NC9ib290L2R0
cy9yb2NrY2hpcC9yazM1NzYtZXZiMi12MTAuZHRzIHwgMiArKwo+IDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2No
aXAvcmszNTc2LWV2YjItdjEwLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmsz
NTc2LWV2YjItdjEwLmR0cwo+aW5kZXggNmJkYzIzMmFiMjY3Li45OGQ1ZDAwZDYzYjUgMTAwNjQ0
Cj4tLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU3Ni1ldmIyLXYxMC5kdHMK
PisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTc2LWV2YjItdjEwLmR0cwo+
QEAgLTk1MSw2ICs5NTEsOCBAQCAmc2RtbWMgewo+IAlkaXNhYmxlLXdwOwo+IAluby1zZGlvOwo+
IAluby1tbWM7Cj4rCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4rCXBpbmN0cmwtMCA9IDwm
c2RtbWMwX2NsayAmc2RtbWMwX2NtZCAmc2RtbWMwX2RldCAmc2RtbWMwX2J1czQ+Owo+IAlzZC11
aHMtc2RyMTA0Owo+IAl2bW1jLXN1cHBseSA9IDwmdmNjM3YzX3NkPjsKPiAJdnFtbWMtc3VwcGx5
ID0gPCZ2Y2Npb19zZF9zMD47Cj4tLSAKPjIuNTEuMQo+Cj4KPl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj5MaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QK
PkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcm9ja2NoaXAK

