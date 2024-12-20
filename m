Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94751E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3JTp4Zchb3YCGv/vAr9PA/1W4TWzDvDI93nASElA8Q=; b=stuQQTzt3wCThM3uSC4ckXQ41y
	xuf9ftkSNJNMe+Ir4pC+JlKSZawzwoEKqJ/UT4Ks6SuCyfkRfiODijnWKkk47xLf179vEY2ThRKBx
	VIVsw6e3frLEO/Bwe2up7Uc+JuWn0MGGTra98Za1dolyEWrBhwD6rkfzW6fyeeqbjr0Z2SYPk69WV
	kQIUUiobKHmNm73y2CxgnhAE+uqtyLDhRyd8JZwck9HsxAdX36RSqXvQJ9XuhqohzkTxlspcNCiYx
	11BzFvB0Yk+m5cN/9iYL7o8vqcNUu0jgIZ+rxzhq5MJs8F2IalLDVwkZTI2z8sCxPZ7MtE1BlQ+fs
	vKxtZCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaxR-00000004iMZ-1qTw;
	Fri, 20 Dec 2024 11:14:13 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOabc-00000004e5V-1XmQ;
	Fri, 20 Dec 2024 10:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=pRDaXkTGjX7R3KLIOZ+hFg8hT1FPiVLyVpMN6D7XCbA=; b=F
	Xwh9XBChvVKvR3dLL7C8uBH0fqJhI5MtshgW9B3PmthsG6Wb4KNWuTetOAhCuZf/
	UBqP+y7mPl4u9dqIxUbs8j6z3wAxclx9hea0cN3l8ezTLWADEpdNVBPFHiLGycwk
	TsjpkTYP5A2xGH7VsucEGo4i+OKW/ZkrKphltYyQI4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-138 (Coremail) ; Fri, 20 Dec 2024 18:51:11 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 20 Dec 2024 18:51:11 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
	joro@8bytes.org, heiko@sntech.de, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH] dt-bindings: iommu: rockchip: Add Rockchip RK3576
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <172721001667.289647.10163147936752673484.robh@kernel.org>
References: <20240920094947.7566-1-andyshrk@163.com>
 <172721001667.289647.10163147936752673484.robh@kernel.org>
X-NTES-SC: AL_Qu2YBvqSvkAs5yORY+lS0zJw2L5KLrXQ55RVgP4ISMMety/k0AwKZFNTPmLdzeRN0FVvuJIZPp+skrPvdt2I
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <662c9716.a714.193e3b15aac.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iigvCgD3f88fTGVn9wlFAA--.16687W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQW7XmdlQ8qU3gABsJ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_025140_733483_7886E993 
X-CRM114-Status: UNSURE (   5.29  )
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

CnBpbmcKCkF0IDIwMjQtMDktMjUgMDQ6MzM6MzcsICJSb2IgSGVycmluZyAoQXJtKSIgPHJvYmhA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPk9uIEZyaSwgMjAgU2VwIDIwMjQgMTc6NDk6NDAgKzA4MDAs
IEFuZHkgWWFuIHdyb3RlOgo+PiBGcm9tOiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5j
b20+Cj4+IAo+PiBKdXN0IGxpa2UgUkszNTg4LCBSSzM1NzYgaXMgY29tcGF0aWJsZSB0byB0aGUg
ZXhpc3RpbmcgcmszNTY4Cj4+IGJpbmRpbmcuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFlh
biA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+IC0tLQo+PiAKPj4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9yb2NrY2hpcCxpb21tdS55YW1sIHwgMSArCj4+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4gCj4KPkFja2VkLWJ5OiBSb2IgSGVycmlu
ZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+Cg==

