Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3554C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx5O7QgFeS4XNbgOvdiA5cLBwi1giF+DaQiIpnAqFGM=; b=v4mMOlHmOtlX1SbH3vCZWKi307
	0nzHzSv/5ITu/BMAWNnRKFwvUWFgP9bC/DewlkkvR2JYX1IunMFWtTVW4/q5xQQu+HOGpBPPOMGOy
	6S24lc7UKgCv0B1S+jMX+io0t421TUZalVqZwab5TwBwCOOoeNN2jvvEJtKDbc8KdhdjMCCYVPoxc
	7uLzis6deteYvu6bi/Oo84z8dQtfUaRp2x2fcPRJc9UgyjlNzbxFGF0nHybsBqnvYrybNuodxIWv8
	h2rkdA6DojsQV9HUDgBmfcXbrR4weNgfqaGeao2yAf9V6RDxk/hDuZBw5GZwkvWPexeVFWIXiDhCt
	qSj3fvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUcm-0000000CsWx-1m7A;
	Mon, 24 Feb 2025 09:19:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUG0-0000000CmhV-3qya;
	Mon, 24 Feb 2025 08:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CCF05C4CD7;
	Mon, 24 Feb 2025 08:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11564C4CEE6;
	Mon, 24 Feb 2025 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740387367;
	bh=xynIidDgpFBJhwX+rR7LTSuhkkTdXt9jQlEjIf656u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0KVRt9H3ECd8N6iv+XzErxMGS+7KbCRuMJUu+bQMYbTnnPHwLcuWiUTIUxllT1QE
	 RNtw+Szf2Z0laWEeTI3RBd+YjTiMgOJpEkNatKEWUAsX8gPTlbVs+PJO+i2LHoKqgW
	 xRVb97fzyaAnQ3W7spRTcxyEEzpiTHGpCvQHcBkkJxhu4J7Z3GDJ5MWimoLpdibh+L
	 JeZd+LI4viRzL2Zc7a4wG9YVhyXHPpm/XJcfL14/Y117GDC+ExglNclxm12adh3E0x
	 VWtE/qavf6qxZzv+Afn4YFlss1vzH7k0IpmU5kX0X7J/QqALHccZ/eohy9ECzjfXAw
	 FQJrOswTPLMJQ==
Date: Mon, 24 Feb 2025 09:56:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file
Message-ID: <20250224-curly-cyber-spaniel-efdc39@krzk-bin>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_005609_033577_9D1B18B8 
X-CRM114-Status: GOOD (  16.06  )
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

On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC has a USB controller PHY, which acts as an
> intermediary between a USB controller (typically DWC3) and other PHYs
> (UTMI, PIPE3). Add a dt-binding schema for it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml

You have undocumented dependencies which prevent merging this file.
First, dependencies have to be clearly expressed. Second, you should
rather decouple the code from header dependencies, otherwise this cannot
be merged for current release (just use clocks with long names, without IDs).

> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
> new file mode 100644
> index 000000000..7d879ec8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Exynos2200 USB controller PHY
> +
> +maintainers:
> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> +
> +description:
> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
> +  (typically DWC3) and other PHYs (UTMI, PIPE3).

Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml

I think there is no PHY between DWC3 and UTMI/PIPE. There is a PHY
controller (so the samsung,usb3-drd-phy.yaml) which we call here the
phy.


Best regards,
Krzysztof


