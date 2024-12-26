Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1238AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 00:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvqCUwKVTzYMhdJqzWkqyXvwsvG0AIMbePI763uVLm0=; b=Yy6ZebvP9IWatkbHLMJ+qFMpvw
	ATbG2rybs3Z2Wj9IZrwWigxTOR+LBAXEWIZ5Te+2gNkmOPtIxSsEXHyOJ6UFrrzKLL3qn78Ikm753
	yQfQzBTbjUDEmn328GOlkwZBk1hqFISA2XSNrYALjmLPwkMGqlyZv3JNghy0oAx4lDyc7352QHQwZ
	F+Cj1wwEzjA/9TbvNym/6fMWTZpFSHdZW5E//2El8tM0DM8VTDTFZ2WsaMjL0wC7+UoTkCM2IZFv0
	GhbhZb1XG8p1F7OOvt9xBKvlLn0Y4XayXhQ+1HSygeOGTwXe7sGFSiBVvATTC1a/+EG3kQPZE0VxJ
	rx2170+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQbvc-0000000EYUS-3Sqn;
	Thu, 26 Dec 2024 00:40:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQbuQ-0000000EYIG-1aqR;
	Thu, 26 Dec 2024 00:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vvqCUwKVTzYMhdJqzWkqyXvwsvG0AIMbePI763uVLm0=; b=BF8ZUKmcSGmiiBWE8iopcALx4c
	gNQGI3iY+f7IR0v8nHOSAelarKX3GGPAIe5hl0CM+ZU+9JpsoAL/5m1O7g63WNh9Zy3ebRI98vgTa
	+lIQwrWLABC71rGx0oyJIh75TqZU8zPUVtqpNKhhuglyLATI+vauvvBVJV/cysNufCQ56lhNYuP0y
	WYGjqvNfA9JHNXtkUUd9iZXnn7ddNmFhNVnXcR0ONYVDRZNKZBfodMhJ77bfDipRKE43SHXkeSIBO
	bZgt64EtNv36sYxvD/z5Jfz6Lufi1AvbID9ulD+nqTuMl//QUm12f9O1HQY9Vth0vXUOlc+QdW76q
	7Y1b5mAQ==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tQbuL-0004LM-FN; Thu, 26 Dec 2024 01:39:21 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 03/17] dt-bindings: mmc: rockchip-dw-mshc: Add rk3562
 compatible string
Date: Thu, 26 Dec 2024 01:39:20 +0100
Message-ID: <13860713.uLZWGnKmhe@phil>
In-Reply-To: <20241224094920.3821861-4-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-4-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_163926_431240_0AD5942C 
X-CRM114-Status: GOOD (  13.14  )
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

Am Dienstag, 24. Dezember 2024, 10:49:06 CET schrieb Kever Yang:
> Add RK3588 compatible string for SD interface.

	^ this still says rk3588

> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index 06df1269f247..772f592291bf 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -38,6 +38,7 @@ properties:
>                - rockchip,rk3328-dw-mshc
>                - rockchip,rk3368-dw-mshc
>                - rockchip,rk3399-dw-mshc
> +              - rockchip,rk3562-dw-mshc
>                - rockchip,rk3568-dw-mshc
>                - rockchip,rk3588-dw-mshc
>                - rockchip,rv1108-dw-mshc
> 





