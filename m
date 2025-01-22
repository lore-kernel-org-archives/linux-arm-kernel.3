Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03ECC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGjlnM2VULoNhxOw4I4PWNKPXTBzM78eZrGmh25C4bU=; b=Ckzungo0GuvlyhSteU7BrP+YfF
	+XGGyrcg6OjWtc/vLLxw+VmJMqc9aIsVQ3t1swIXZ/VTE4HzvFVVXjiUprHRE4IV7LAHJ6WWxg+1T
	wTDqo/bca2NG82uqegXyz4SzGx+3MeR2U6rubfXGkK4nrKx6AizD9iCE6FnOtUSgjHlXiOm8Z1qCs
	YT0TewQj/CmZ8feu4PXoKmFnHFcrNTp4wG44M9hDSC+e1+LqbBXEWpXIgwqsUmbUEWpw5NdUypuZO
	QdTDrN1q7DcurK7ukjg/CIHefmQ2fNq3VmP+Ve7wzwyBvExTX/iG0b7lWufxKsCP26nCDDaEq8oqr
	lX0eIbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taX4Q-00000009nVj-3CFH;
	Wed, 22 Jan 2025 09:30:46 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taX38-00000009nHO-2ggK;
	Wed, 22 Jan 2025 09:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=H00FnMznIWJYmbnYuG8IMJ8qP5oUolnuSyMtcLYErrM=; b=T
	283zZMu8grfBe68CmPjz3lAQtMZkby8Pxb/9ZF9ab43KP4qSF9m5IXwerd1UxKHT
	arvQyd/DRnwUR7G0/zKFEbYXqrVRtLyW/KEtURU7c1YNgXH0ISiMCeNHwabx7COX
	yfxbLYchVeoGawqV5PsNU2TjhSxkWXkKXF4J08nY5E=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Wed, 22 Jan 2025 17:29:05 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 22 Jan 2025 17:29:05 +0800 (CST)
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
In-Reply-To: <20250122-quaint-heavenly-herring-c92c32@krzk-bin>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103446.2528212-1-andyshrk@163.com>
 <20250122-quaint-heavenly-herring-c92c32@krzk-bin>
X-NTES-SC: AL_Qu2YBfmYt0kv4ySbZekfmkcVgOw9UcO5v/Qk3oZXOJF8jCrr+CUnVkFMJFbsweeONhCLrheYTj1O48h1bZN6b5MbMYJR3vOT7FDdj3CPoysF1Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6ccc6e2.6afc.1948d580c9c.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgDnD_RhupBn98RcAA--.18267W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g-cXmeQsrGf6gACsc
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_012927_046785_BCF153B3 
X-CRM114-Status: UNSURE (   4.25  )
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

CkhpCkF0IDIwMjUtMDEtMjIgMTY6MDM6MDAsICJLcnp5c3p0b2YgS296bG93c2tpIiA8a3J6a0Br
ZXJuZWwub3JnPiB3cm90ZToKPk9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0IDA2OjM0OjQ0UE0gKzA4
MDAsIEFuZHkgWWFuIHdyb3RlOgo+PiBGcm9tOiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlw
cy5jb20+Cj4+IAo+PiBQcm9wZXJ0aWUgInJvY2tjaGlwLGdyZiIgaXMgcmVxdWlyZWQgZm9yIHJr
MzU2Ni84Lgo+Cj5GaXggdHlwb3MuCj4KPldoeT8gV2hhdCB3ZSBzZWUgZnJvbSB0aGUgZGlmZi4u
LgoKVGhpcyBwcm9wZXJ0eSBpcyB1c2VkIGluIGR0cywgc2VlIHZvcCBkdCBub2RlIGluIHJrMzU2
eC1iYXNlLmR0c2ksCmJ1dCBub3QgcmVxdWlyZWQgaW4gdGhlIGJpbmRpbmcuCgo+Cj5CZXN0IHJl
Z2FyZHMsCj5Lcnp5c3p0b2YK

