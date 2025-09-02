Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F89CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsntUH/YQCGnGhUQTrBEQe5j+i1ISI/ihikW8Sddcus=; b=aLkSkwxfsupW46/LFLvsnGpozn
	d1tD8ViiuSmvjBcZd0STcvhwiZaSlrDEIz4oCpXFzfQpEquRYj4pcPSAZXEkxvMRCFup47maV+YjY
	y317WANjKjdQyiP9X3NrhFZ9HsAahk/l9zKV45nMxcSwTKyPza1o9R5OFhJN/Swfz3IzIcE5vaSjY
	HnMIQ3BsYUuS6gsNrwdhbXGjb8C5znE2selUSW6SmmmRx8FZLpzf7zRotDtefS3l5vFEF9lgBHHjV
	kj2oHBsWp6MaCeF9DkohDUVHuOW8wOnk2cxFVj6udCB9Ti2YJgKMB0lmeth699yWWK/nj+jWNwRXb
	thc6ZAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLxM-0000000FtMm-2jXj;
	Tue, 02 Sep 2025 08:01:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLrs-0000000Fr7t-0kZ2;
	Tue, 02 Sep 2025 07:55:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6D9D4330B;
	Tue,  2 Sep 2025 07:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9FAC4CEF8;
	Tue,  2 Sep 2025 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756799750;
	bh=fGhLLwdCedmb+/WPqlL245TpagpYHJiGJoMQWGa2fHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bOkBWf+syJfTDnMKxIgzan3/kkMFxM1aVMv+RSJbTkuKOZIQrMSiMiSz7TNzb/W9r
	 HklilaSAMpDzzfPhjsillI34OGFmDeV+RAL8efOr2wJJYSfu2jXKWl5htarNBHL/i8
	 RV+l08rI8yY6hbZL+0QU9j/8HQ8+cyDlmm7zSiXXJ6S0//PPfEANm9aPmyi9a1k8rz
	 j85gpapJ606lRIKboiz5GA/OrCpHWFNABLCPLxpnY5o/AsiONvChZqXbwSHh8XVwgd
	 yCSoy3Zgf1vl20t0JGqxGkVNwFFik/6KZW/Cv2Cj+PQC57uT93Nk9UlqE8wkikQolg
	 vFZycSq/3NOxw==
Date: Tue, 2 Sep 2025 09:55:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Diederik de Haas <didi.debian@cknow.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Collabora Kernel Team <kernel@collabora.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 3/7] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rk3588 variant
Message-ID: <20250902-piquant-secret-moose-06c4b6@kuoka>
References: <20250616-rk3588-csi-dphy-v3-0-a5ccd5f1f438@collabora.com>
 <20250616-rk3588-csi-dphy-v3-3-a5ccd5f1f438@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-rk3588-csi-dphy-v3-3-a5ccd5f1f438@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005552_237402_815FC860 
X-CRM114-Status: GOOD (  16.11  )
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

On Mon, Sep 01, 2025 at 10:47:44PM +0200, Michael Riesch wrote:
> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
> Add the variant and allow for the additional reset.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 50 +++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 9ad72518e6da..e37c9fd74788 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -21,6 +21,7 @@ properties:
>        - rockchip,rk3326-csi-dphy
>        - rockchip,rk3368-csi-dphy
>        - rockchip,rk3568-csi-dphy
> +      - rockchip,rk3588-csi-dphy
>  
>    reg:
>      maxItems: 1
> @@ -40,11 +41,15 @@ properties:
>  
>    resets:
>      items:
> -      - description: exclusive PHY reset line
> +      - description: APB reset line
> +      - description: PHY reset line

That's changing the order, before first was the phy....

> +    minItems: 1
>  
>    reset-names:
>      items:
>        - const: apb
> +      - const: phy

Although here first was apb? Quite confusing.

Anyway "phy" reset for "phy" is pretty non-informative, please give some
useful name.

> +    minItems: 1

Best regards,
Krzysztof


