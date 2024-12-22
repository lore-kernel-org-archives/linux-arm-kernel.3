Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F230CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRa9IasaGaPmRgumOCRmtMLbZmJIszfuqo58vEJfnwQ=; b=3co662r2i6oYodM0hs7TjUDzSx
	s3aA00P2wkjL8CuVgfGh68rs3Xt37t8yjRhVisYXWSJnQ2ZzZtZhY/EPXO4idRWJd+FgbWyVAggFH
	27cw7avr01SHbiJAun/wqOj6y7NobdPVf/tONymZd0UELZ8pb9sDeZB6kmvT43/ctl/rVYjVa7n6h
	s5AC3HMu+2m2d9UN/8j0JS4sKdumi4dW9uY8WszIGCLaIn6tqyoAEFdI4r5gIasa2cH1f9K3JMR7B
	YDwpNeZ48ZJdfNGWqfIFQqTtuFnpI4hLXCm65BtbPVzOQX+jkp5OXm3vy1mLm+DAgX+FwjyFCglB0
	kKtqZC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPOQn-00000008U7N-1c6z;
	Sun, 22 Dec 2024 16:03:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPOPc-00000008U1G-1uZN;
	Sun, 22 Dec 2024 16:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rRa9IasaGaPmRgumOCRmtMLbZmJIszfuqo58vEJfnwQ=; b=k8LD56Hfa/jfHKBukU6elsEoE5
	lWu34KU+POcPjFrv1d+tLtTfp9IUlDAUfn/Rt6ZAXxtTNyeP9paBfvPjZHm4H3silJsfgPZOWd8jY
	M6lWjKJD06r/3Wz4Mwm0XcezqLOqGCwnv81X0KBtBSSFlkRLpZehmd5PYIUqeCCcpn1UvBorns6aO
	UusK8fZ8i5uct2oun8Bx0ksFNRbsNhzv0RCl8WamVJOxAihOAZ+DAw/WUYjAI4+le7UoJWrYKI9LG
	jzw/+cL1+DT8MKC4x8mzzVutJgtDqOqD3L3XWtCri+RTAwX/wiy0/3ZxAdhw6KQ6SJSGO9HlyqVn7
	NF4eO/Hw==;
Received: from i53875adc.versanet.de ([83.135.90.220] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tPOPX-0007d9-JB; Sun, 22 Dec 2024 17:02:31 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/38] dt-bindings: pinctrl: Add rk3562 pinctrl support
Date: Sun, 22 Dec 2024 17:02:30 +0100
Message-ID: <6755532.4vTCxPXJkl@diego>
In-Reply-To: <20241220103825.3509421-5-kever.yang@rock-chips.com>
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
 <20241220103825.3509421-5-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_080236_501914_187137F8 
X-CRM114-Status: UNSURE (   8.58  )
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

Am Freitag, 20. Dezember 2024, 11:37:50 CET schrieb Kever Yang:
> Add the compatible string for the rk3562 SoC.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



