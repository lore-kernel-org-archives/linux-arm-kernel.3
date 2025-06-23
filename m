Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55ADC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUOansBOJmvnkcEZqO7KuEOy43CI6wTZaKlZ/WmlueQ=; b=uS5cD0DjxOdXFkP+0t6kB/wHuJ
	4ql2O6PjJ4asLoYJzjyPC2V5yTXKn47sQfd3aYh70j0DIoEEwg22D+2IlDp+Ksgb1YjKJ0hiq4s6l
	272mdbA9KMmpzcQ/OFBK2pfB+RbDW/kAnnWXVmy9ATTkzLhL0lz0+nkuxzpIFessf4O93wDCbFMHj
	BsNKXwyB3axydGrcpAVwetLRCMYRiF6XP6/DfTU9JqduFZXho06/L97esT2YioFlP8a0lMaYTLVqo
	Y13/pOihy9xhN+7ffJEYFo1In9XL8dJimUgOE+rPmaMMtLoem13HPvTKItE1yFPKcl4z1KS/05gpB
	xWFRb0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcrn-000000023KL-39Wh;
	Mon, 23 Jun 2025 08:49:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTce3-0000000214w-2vrk;
	Mon, 23 Jun 2025 08:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667714;
	bh=BVqyDTmiCEkrBVIJgwDyuX0wGNoR5DAzI5LXVrpra9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=edcb6j8Z3c/hA370Bv1g0g0X9v6ea0lu3zioME18VSKt6blqD+VzSR13tUiZk9edy
	 BwIott1YjJoA2XA2u8XqaqLADyXYfqEnoNC+ll18uRFN/Sc5dO8Bi7sTwbn+1mS3r0
	 mDu3BGLYfwcNMOh/Jx+HA3cOFXUMPXBNr1z0GQGI3SYRKXsftVOYs3HoM0x7sOgE3t
	 F4x0PI2xuRljZg6RH33+3HXfw/mS2oDpnZZaccO11Tu63wmKyg3QQmKF3/V11gUSn2
	 b1PhQwp342cSMQMGdY/Yhr4h8JntkzGwtpbyacXMIdcaO7ddRwjHaBefFm6cIOkh6Q
	 /qnHxtwAl4jOw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81C3B17E156D;
	Mon, 23 Jun 2025 10:35:13 +0200 (CEST)
Message-ID: <41a90422-6137-4bdc-b268-29f420ed50aa@collabora.com>
Date: Mon, 23 Jun 2025 10:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: serial: mediatek,uart: add MT6572
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-1-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-1-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_013515_901443_10D2650A 
X-CRM114-Status: UNSURE (   6.48  )
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

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for serial on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



