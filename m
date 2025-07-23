Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED7FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yScz7m11w1CgL4gyCO+xM5xM3mLOlhu+Xx1r1wOaY6Q=; b=POMTHnhu900T9xATV2+jnQMCXB
	zo7H1W4IIsVjKkKlLGV2YYyKxtNOfufZVi6caijHaooGnDOuaD9yxrTholJdILN7ydOSTs/4tdMEN
	2ksn/nqUqX33g6Br7CdsI+bCdig3uTx41A+SPVe8vhh6z0WP7KO/13lguLqB00A/DqhaZlSYMJMMJ
	wBhRO2rlJ7izPWnwG+RDVq48BkMUMzCloOHoZd1tx3JFWVp4NDGo0grK63zPvWaJ5DDlvyK8uT7N1
	8DUPL5OjqZdWChf+vhsFh/Ewj+jUo8R17ncDozn1cuVe+scK0cOT/0pBMi4NcjsgntZwVbtqPhJ3M
	SJHZYeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebmB-00000005RNe-3omW;
	Wed, 23 Jul 2025 15:53:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebjj-00000005QxZ-3Sr7;
	Wed, 23 Jul 2025 15:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1340945A2C;
	Wed, 23 Jul 2025 15:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51412C4CEE7;
	Wed, 23 Jul 2025 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753285830;
	bh=q0RdIwl2onvcmCTOyNGzyc8T7XKOzlJKJ3pq4M0YgrQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SmBKNNWav95G3vsgJvAXo6iiufNuKUnjGCOlLlJ6awlSazcT+GVpf/l5k87yZbNFn
	 K3w14Y242PXRz3nw78+h6Bohl6wG5U54VpWGUqdcp902wpdo/m8CZ9QcdbAXqoUkC/
	 E88MH/T5icJwck0NvRSwhX42ciMp0O4yRqq3ubK7dtAfV0yROA1MpfN0wepLgWQH2p
	 pyIZKgqzA8UmZShrY5ukSSCQS83TLa3qcZKjZhtLj10JUjMMS6eHuhtoAd7S5qsi3k
	 g6OXWs2k+9kN0XPOPyAYmdCVHrVdoerUCnEJG5Zsw9QA9QM5ruBrYV7+OvfkZZJipn
	 G9io2fsDkj9ZA==
Date: Wed, 23 Jul 2025 16:50:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: iio: adc: rockchip-saradc: Allow
 use of a power-domain
Message-ID: <20250723165021.4e2dd324@jic23-huawei>
In-Reply-To: <20250723085654.2273324-4-jonas@kwiboo.se>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
	<20250723085654.2273324-4-jonas@kwiboo.se>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_085031_897929_2892CC12 
X-CRM114-Status: GOOD (  19.76  )
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

On Wed, 23 Jul 2025 08:56:45 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> The SARADC controller in most Rockchip SoCs are part of power domains
> that are always powered on, i.e. PD_BUS or PD_PERI. These always powered
> on power domains have typically not been described in the device tree.
> 
> Because these power domains have been left out of the device tree there
> has not been any real need to properly describe the power domain of the
> SARADC controller.
> 
> On RK3528 the SARADC controller is part of the PD_VPU power domain.
> 
> Add support to describe an optional power-domains for the SARADC
> controller in Rockchip SoCs.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Applied to the testing branch of iio.git.

I'll be rebasing on rc1 once available.

Thanks,

Jonathan

> ---
> v2: Update commit message
> ---
>  Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> index 41e0c56ef8e3..f776041fd08f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> @@ -47,6 +47,9 @@ properties:
>        - const: saradc
>        - const: apb_pclk
>  
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      maxItems: 1
>  


