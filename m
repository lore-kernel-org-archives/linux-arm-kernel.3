Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2546C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUlQozRRVxIy7X3DmStVniHwMEag07GaVK8WjeTWxaY=; b=a+a9Aod02UWFbEvAaUW+anRHU7
	g+40p1qwcHkA6l5nULVZ8uNGcYFY34mVLZa6XdhVdTucwALciZ74RB9go0/3Y5AziZwl+eVvXIuv7
	d1LK3Zojja4CpOjs1Kh7ux4pXJNk3u0luJK+X2klZk0tPao2Mjwz6f7MugG/p5o9zADDWj/4+dQq7
	MwVhEbfu3sKocpBnAjgbrEsSVwkLqqz67TXgwcZZMLRGkWEd4nDUjhLkwggKqpCBdDI3OAm7O3fw4
	rhRuL0tPrxxchosKjy5hyy6Il9pQpsD6DWElkp5AznQAhCLRzkX0SwImWHxOKzkk2rUp0WkuukJtx
	fyb2C+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9j0i-0000000B1ua-1HDo;
	Thu, 24 Sep 2026 12:57:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9j0h-0000000B1u4-1M0A;
	Thu, 24 Sep 2026 12:57:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB40F43B07;
	Thu, 24 Sep 2026 12:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833721F000FF;
	Thu, 24 Sep 2026 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790254630;
	bh=ZUlQozRRVxIy7X3DmStVniHwMEag07GaVK8WjeTWxaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L7joRz8keKhlVO2OyuUWnvkJSz9Jl0fpRMsvh6pWMjYrDWi+LfLyr6uIPjFyklQvk
	 DgUF4f3/pVyA4wcME4cJuRKqI0Hy2vjGIoPhqH5nLVZ8SGTW4luIQl3BsZ4HXICzSU
	 CV9UJfXLec0FnESyT5OdxY2dyK2PmHz42/lkz1K0h0cPVEckK2ArFeDdkHI0folmXZ
	 lC38qX46t1aOBmpRHoBbie6tIeyoO5iEy9Um8uczsFzSgjQI0XTN0yAXPtw0FpavxL
	 RgpFM/LlZNqMZY8tVgvV81CdUZslJAXUmDr4+fskf3cv6POsAG6XqxeNaHIFhdNjjI
	 NWmnGci9DEwrw==
Date: Thu, 24 Sep 2026 14:57:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] dt-bindings: soc: amlogic: Add clk-measure
 compatible to support more SoCs
Message-ID: <20260924-rugged-devious-fennec-f3742c@quoll>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
 <20260920-more-socs-to-support-clk_measure-v2-2-224382a429e8@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-2-224382a429e8@amlogic.com>
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

On Sun, Sep 20, 2026 at 06:25:04PM +0800, Chuan Liu wrote:
> Add clk-measure compatible for amlogic A5, A4, S7, S7D, S6 and A9 SoCs.
> 
> Although the clk-measure IP itself has little hardware difference across
> SoCs, the clock inputs connected to the clk-measure block vary between
> SoCs. Therefore, it is difficult to fall back to the configuration used
> by previous SoCs.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


