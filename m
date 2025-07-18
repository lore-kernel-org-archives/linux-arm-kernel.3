Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34159C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 07:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkpooDp0pHS2pj5YgivfPVsOSTnUugeM76tApBgOq7w=; b=CTlHhPBnFl3U0RINGojjNlBev5
	/z0uS/FpkRlJVe8JRdGXnvILT7kJkA0x7WQf6ock+Psbttrgxu1c7ILxP3VPu50QMmF1h20PjzQA6
	zDug0meozYKiLCjlfoEcFoWJGyplDUC9TPXIwt5q+uoaeIQfaE1MO4I8+lgKcjYwUhdGwziAJNsJg
	eaHa2CZKFVyxNvrsXIJsKp+sfHGdeLvifMs+7ADeVE9nMF7EyXqg1WPv0xjWSjWOothp3VlEKMOyD
	VHaM4NMSLCgHjZILWLqmWc+EUyOq4Wn2+ievfYgkbo8l32S3g2LFTKI47BjqgrFTrPpBNEQLkyPn/
	76RrEQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucf7Z-0000000Bpt4-1F65;
	Fri, 18 Jul 2025 07:03:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceq8-0000000BnnO-3GYf;
	Fri, 18 Jul 2025 06:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752821102;
	bh=rY4Qy9sf+xg1IIqd/YNXIMBrQbKyfG5E8mpuyIxuqao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ijSkO/PqPs62ftE0q1ebPwWbfqsWPZjemGSWGWLynSyAc0ydZ2dxvH+DvO2qf1Cg0
	 qXdy8rEkQ6Etklld+YxiCyb5aSq+HXfchkPWRF3/yJzxQ1UIAXTtVTWY65p8wOtfRH
	 f0MJCB+g4e3Xkv9ibFQofbVNGBNDZVyAPSLCg68FFiLvEg4tYai0AYGIrIzw+Bftum
	 fve5X/yUBu+mCe1unbNSGkfl1pu6HwssPfppXGZ3vSozMQZ78niIzaGBjS5QG+KifY
	 GGaBFBGKfX9R64+k5/8t9/XA+IthMNsKXkGZM6w0FFsXrVi3EM7LTOcud8iBOgFVNk
	 6VYAHXbUNsa9A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CCE2817E1541;
	Fri, 18 Jul 2025 08:45:01 +0200 (CEST)
Message-ID: <709a6ca5-cba8-42b0-bbfb-0da278a17e01@collabora.com>
Date: Fri, 18 Jul 2025 08:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] pinctrl: mediatek: Add pinctrl driver on mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>,
 Axe Yang <Axe.Yang@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
 <20250711094513.17073-4-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250711094513.17073-4-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_234504_998470_0E83B54A 
X-CRM114-Status: UNSURE (   6.11  )
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

Il 11/07/25 11:44, Cathy Xu ha scritto:
> Add pinctrl driver support for MediaTek Soc mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



