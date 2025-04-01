Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9B9C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWIgb8ek7mrzJPNvi2KI6SXuhbTila7RYElz0byuE0w=; b=o/k/Y6hjKV6aub/tD6KUcgUHIG
	+8RDalzApuby0fshKKT0y7P7Z+U+zCkthbOqSwmXBGQ4BvMEwD3yEy4ncoNKq7bIzk8Q/Z7ndwokj
	aKKwrkrqCyGLHaCok8lUBegn0Ikpd4FX1zq0RLwn5v2BJkcUzZjcV706gWuCve0WkL3peQSCekfDz
	6WpkB4Rd6Zp0eINQ9S8zggbh3djh6Yh2qFLov8GVzY5dTglnHGQX/yUcJiB6D/JTgSqGxSe7kTHo1
	KRqnREqopQ8VjHSBUPyoQeacAvn986OW+Ip+ByBGLTBEDLu2V7WizzG3OPkUu6497EJlDTqxF6uqm
	5jyG5o5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZ4z-00000002f4z-0JD0;
	Tue, 01 Apr 2025 10:42:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYeO-00000002bFE-2wGl;
	Tue, 01 Apr 2025 10:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743502519;
	bh=uSEEol9Q1BqptFXl0kpmi2WWWI6BRh3I2IU4ZiUjqYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m/sa6pGMfQJfCTngM6W+uqGsIc6c64XTaC9Vh2Zci9ls06SImtA9+ep2EKBbG1YAC
	 TCvbQZSwns2IoR6tVw/8bgK95nY3at3oA6/97K8p3s8MzVUSErEIDlz2hwzd5Z77tT
	 GnT9aIhNWsyWb2DyLgshyWPNIKDtEY2E76/Nbd5FsvXCnX6eU/0o7rBx98fmya8Fh5
	 AfhvBKLKyxG2vmetPaCLWpLqZb8qYdLCWIf+HQHlfYZciedbRbmGnJYmqOlyqzMan2
	 JevP6/ZbvTlEwCJoXAjkbzDYOttz+Xd9DJA6cvyk/Gw5PYD3CI3p9xr14vb4tT4OzF
	 MoIUK/xnIbDqw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AE4C17E0FC1;
	Tue,  1 Apr 2025 12:15:18 +0200 (CEST)
Message-ID: <bc61a69f-7040-4063-91e6-132d6eea252f@collabora.com>
Date: Tue, 1 Apr 2025 12:15:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] pinctrl: mediatek: Add pinctrl driver on mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yong.mao@mediatek.com,
 Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com,
 Andy-ld.Lu@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
 <20250401054837.1551-4-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250401054837.1551-4-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_031520_886860_FDFA625B 
X-CRM114-Status: UNSURE (   6.99  )
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

Il 01/04/25 07:48, Cathy Xu ha scritto:
> From: Guodong Liu <guodong.liu@mediatek.com>
> 
> Add pinctrl driver support for MediaTek Soc mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




