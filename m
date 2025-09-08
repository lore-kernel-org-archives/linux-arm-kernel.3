Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068DACAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EF7HYYakpjft9NB35kDZMTTQSaA0d6L7zjHJnSI+Sk=; b=yq0+aIaMvdvlUJbzlXdmmXbBby
	lmMKt/uv9i+ohgLzrj9aU+BMntHDZzdjE0gYFP6r+Djlqi4F4BssbWV/DvPLli215jVUZQxYwfBnE
	BvVEV8XIRCa8b6W/y4S4v6/qTdYrqcoPepKIXaTEiw8M8ZwAubOyqTZrlpU93BCyG+XL+8XXT+Iv7
	9QqADkDFCjNuOw8GHOJcQ/JBFkS+G2K6xNgfGToiOu5+XTvSgU8rsO++zzcIfe3lKThg4M2on254e
	OjZn19SBYWhva/eS4M7KfxUgMPk90wCgV4bl5WcHvZs5rx4WxsRQxv32LaJb9rli6nzixG9C9MqO4
	GHVDi5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvb9v-0000000H4nD-0V7u;
	Mon, 08 Sep 2025 12:39:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaB7-0000000Ghxm-2sYk;
	Mon, 08 Sep 2025 11:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757331414;
	bh=I6Ct7QSfsb2a9mw4d/2CXNoZn43ncDeWvUzisVJqmmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JNQqV+Vnjs1Dxd1EtX4PPTlKmtQwxCDb/AQgr8shMEFalu8USKWWhlJsPwZsVd4tK
	 gAiFpxVnuYm7yRt0XtVeHIbJAWTLopQRL2GYFWTHlJ8ouEriWtaZKvkR04T0QmCPBw
	 CR1usZ2oOFpAfkxZOgJ+IDXpPg1+aqMbVEsnOk+WfDg/cnXIugkfalEh/Et4NRGmud
	 rDuVIVRrxJtTdR1kBrS63nW2H/YRw7PNQOrF7xhCf5eMLPcwifMBAfLsmWEfaNaJ+T
	 C0ZyXXat54wei7+pXSgw3VcLeSemvIfVVyv7JG3eeuBJwr/XcbPiPGuUi67C8ftwRm
	 DPbUAegLYxVFw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4787517E0DD7;
	Mon,  8 Sep 2025 13:36:54 +0200 (CEST)
Message-ID: <104d8128-26fb-4eb6-ac3f-3abbb35245b2@collabora.com>
Date: Mon, 8 Sep 2025 13:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] Input: mtk-pmic-keys - MT6359 has a specific
 release irq
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
 <20250905-radxa-nio-12-l-gpio-v3-1-40f11377fb55@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-1-40f11377fb55@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_043657_909630_990DC481 
X-CRM114-Status: GOOD (  11.36  )
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

Il 05/09/25 13:51, Julien Massot ha scritto:
> Support for MT6359 PMIC keys has been added recently.
> However, the key release event is not properly handled:
> only key press events are generated, leaving key states
> stuck in "pressed".
> 
> This patch ensures that both key press and key release events
> are properly emitted by handling the release logic correctly.
> 
> Introduce a 'key_release_irq' member to the 'mtk_pmic_regs',
> to identify the devices that have a separate irq for the
> release event.
> 
> Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Please clarify the commit title.

Input: mtk-pmic-keys - Use platform data for release irq support

...or something like that.

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

