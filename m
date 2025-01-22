Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3705C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iggc30VO3vxn3I7iwTqbBB/8+RKuOaN34DS/e/thApU=; b=VlN1Al6OiY+Ftm8OOKVVMrtXmK
	mFLU8L/Rn53EnHyE9sZ1o/3JNoez1XFrcvHWpuYm329u3Vjt9NhptwSgIF8QnEDuxdksLRksVH1m3
	PnFWXb92hqtjKaCufjHi95m9p32lFl1UX8h+WXbm1QkZtLZkvjuLt1lfA8Pl9eXJohwx4zJHrV2qr
	BThZRKEJlKwWo907NGxpDb8y0jm4Z2IvYh9//RMfpoxM5twf1h78vdlGQSv6NcDXz7vo+pGVHiXGU
	Y43dV2gS8lYkdxt2vukrv7aMlK05Ao/WDKkxEeVcvJEXWhwm5s6T7ZGgY/nhwkjeriA/I2hjnF+ST
	n7bJQcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXRW-00000009qrU-1PoM;
	Wed, 22 Jan 2025 09:54:38 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXQE-00000009qXi-0beZ;
	Wed, 22 Jan 2025 09:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=PqQdaUqkdHlGiWWk3ENJJX61puJuMPc09OfIxsrMZEs=; b=T
	1R5vCYt57r1hKOy3PId1QVHcS8cS+SzuQWsYZr3M3wYG5nvSSrH4PJ3A0O7YUa8s
	ec3im7UzT3Yej69OE7rofptTY4lS6cc5Okd9LA8E+SCujnpa+PZVNI2wh9fUthX5
	2BvrXZpYKH96vyZqByoAXhRnLi+7dnX0pX99MDKUTg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Wed, 22 Jan 2025 17:52:48 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 22 Jan 2025 17:52:48 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
	detlev.casanova@collabora.com, daniel@fooishbar.org, robh@kernel.org,
	sebastian.reichel@collabora.com,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v12 11/13] dt-bindings: display: vop2: Add missing
 rockchip,grf propertie for rk3566/8
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <c6ee51bf-e264-44d6-8e22-f50a30848237@kernel.org>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103446.2528212-1-andyshrk@163.com>
 <20250122-quaint-heavenly-herring-c92c32@krzk-bin>
 <6ccc6e2.6afc.1948d580c9c.Coremail.andyshrk@163.com>
 <c6ee51bf-e264-44d6-8e22-f50a30848237@kernel.org>
X-NTES-SC: AL_Qu2YBfmYtk0t7iWdZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jCrr+CUnVkFMJFbsweeONhCLrheYTj1O48h1bZN6b5Mb/2NnfBECzszXPSE30hsDtA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7869aa80.6ec2.1948d6dc3ae.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgDH7_Pwv5Bng8pcAA--.18456W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQPcXmeQtfaqlwAFsk
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_015318_559266_3B0433F5 
X-CRM114-Status: UNSURE (   6.70  )
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

CkhpCgpBdCAyMDI1LTAxLTIyIDE3OjQzOjM0LCAiS3J6eXN6dG9mIEtvemxvd3NraSIgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj5PbiAyMi8wMS8yMDI1IDEwOjI5LCBBbmR5IFlhbiB3cm90ZToK
Pj4gCj4+IEhpCj4+IEF0IDIwMjUtMDEtMjIgMTY6MDM6MDAsICJLcnp5c3p0b2YgS296bG93c2tp
IiA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPj4+IE9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0IDA2
OjM0OjQ0UE0gKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+Pj4+IEZyb206IEFuZHkgWWFuIDxhbmR5
LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4+Pgo+Pj4+IFByb3BlcnRpZSAicm9ja2NoaXAsZ3JmIiBp
cyByZXF1aXJlZCBmb3IgcmszNTY2LzguCj4+Pgo+Pj4gRml4IHR5cG9zLgo+Pj4KPj4+IFdoeT8g
V2hhdCB3ZSBzZWUgZnJvbSB0aGUgZGlmZi4uLgo+PiAKPj4gVGhpcyBwcm9wZXJ0eSBpcyB1c2Vk
IGluIGR0cywgc2VlIHZvcCBkdCBub2RlIGluIHJrMzU2eC1iYXNlLmR0c2ksCj4KPgo+VGhpcyBp
cyBub3QgdGhlIHJlYXNvbiB0byBtYWtlIGl0IGEgcmVxdWlyZWQgcHJvcGVydHkuCgpUaGUgQ2xv
Y2sgUG9sYXJpdHkgb2YgUkdCIHNpZ25hbCBvdXRwdXQgaXMgY29udHJvbGxlZCBieSBHUkYuCiAK
Pgo+QmVzdCByZWdhcmRzLAo+S3J6eXN6dG9mCg==

