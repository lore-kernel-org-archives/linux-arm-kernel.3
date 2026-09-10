Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A09C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUX5+gLyZAnP+hET6uf/pLlFw8Zwibdi/KIZTVJajXU=; b=waQw4aeW5TG6Th4mK2Kj6RYKrn
	zbdWMgzhYifds+YKLU4F46NwDeki2w1bfb3p21gOQTXXT2JJNydi/uUEvc4pUuMAfc/HwKmyO+WcO
	LXX0OKlMYxJZrKA40dYlOgvt+7J+STbvVKv2K07EeStpdJy38NXEO3FXl4lcU/ao74ZDg8ZQmF2Vq
	fgehqwXU5kFfvMN3+MHwwUHZDm8H/Bbgj74fRikANzNzOQQOkyj1SJAQqnV2mwvhDuGV6dIRKLE1M
	C9wrfvxDoNU4iI3jiusLCeaswMYwdyob3oGNU4cGYkkgNlZRu3whLsNItqXkI8VN+5VtOul9VrsgT
	8TzQwwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ezU-0000000EW9J-1He7;
	Thu, 10 Sep 2026 13:39:00 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ezR-0000000EW8V-32hf;
	Thu, 10 Sep 2026 13:38:59 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hgf0B2FPgzKnVM;
	Thu, 10 Sep 2026 15:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789047530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KUX5+gLyZAnP+hET6uf/pLlFw8Zwibdi/KIZTVJajXU=;
	b=AVM5p1SVJTMybgY83sDrM8ghcdxBl9w7DmaxUYlPh5qWX7HHkdbzsQylsQRLzy0cOFPU9D
	+Bxff/k8aRv7Ddt0x0in+04pTa5VfvYDCoVn3EhR4+kB6a0ZEtIFNK8YCjbuYY3GCVuS3n
	yESj7lYVCqsYZ/mI2Sup5xhke19KMsez3MoRrNHaH6m6LRaaeF2EfEg8LqT1sPQXLhNgY5
	L6smBxrBrwnnSIpfNAHRa5cWybNrhb9S6bkh8KH+4lU7z9dzhvVkqvG0tn4UEBQen5953v
	tEYxajEOSWBdZF9rOTAMhbsHH6HTepUZl4s26b8y4ZDR1vp5K81HXruopDqxGw==
Date: Thu, 10 Sep 2026 15:38:43 +0200
From: Zakariya Hadrami <zkh@mailbox.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, zkh1@proton.me
Subject: Re: [PATCH v4 4/4] ARM: dts: mediatek: Add basic support for Amazon
 ford board
Message-ID: <aqKxMgAI4bPNx78kzjYD05-zkh@mailbox.org>
References: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
 <20260909-mt8127-amazon-ford-basic-v4-4-e9af5c420ab1@mailbox.org>
 <ab00e8c8-cbc2-4fe1-8900-f169aeab5a98@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab00e8c8-cbc2-4fe1-8900-f169aeab5a98@collabora.com>
X-MBO-RS-META: bxmk3mkmxrb34g5mrb17nipnddazm3fu
X-MBO-RS-ID: d3b653577f41815733c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063857_913039_A81C944F 
X-CRM114-Status: GOOD (  11.47  )
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

On Thu, Sep 10, 2026 at 11:29:55AM +0200, AngeloGioacchino Del Regno wrote:
> >diff --git a/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts b/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts
> >new file mode 100644
> >index 000000000000..8edad5482de2
> >--- /dev/null
> >+++ b/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts
> >@@ -0,0 +1,54 @@
> >+// SPDX-License-Identifier: GPL-2.0
> >+
> >+/dts-v1/;
> >+#include "mt8127.dtsi"
> >+
> >+/ {
> >+	model = "MediaTek MT8127 Amazon Ford";
> 
> Please be friendlier with whoever reads this model string :-)
> 
> 	model = "Amazon Fire 7 2015 (Ford)";
> 
> that's better, isn't it?

My bad, sorry!

This and the missing space in watchdog compatible fixed in v5.
Link to v5: https://patch.msgid.link/20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org

Thank you very much!

> 
> After applying the proposed change,
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Cheers,
> Angelo
> 
> >+	compatible = "amazon,ford", "mediatek,mt8127";
> >+	chassis-type = "tablet";

-- 
Best regards,
Zakariya

