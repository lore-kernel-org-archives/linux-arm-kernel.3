Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E559C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jG32Oauz2hDV9q2BpFy552F2Ma60RDkGby0ei11tRlQ=; b=tK+4Adb399pTsZ951W7kxL2h5I
	4cO0/rR4Tm8fPS1W9ngTR7DaCceCX4MnrlKrBSN/b3N1atAjaxoGPhv0wYxZFmBncmc087bVAXmBz
	bYpKAIHlIUC54HotFoeu3TtyTvVMVyfpS0mwU7ZYEdZghPbyPa9U43lRVBupd8w/JN9IxmEJLYFkj
	13gAM8UjIbHaGpyTws3911yqRF8bEe7GLWet1h99tTwPe+6A0KtuWhXAJNa6rHVVuh1PyO+9MVtVT
	P7XAKJgLg0riFdzP7un62ciUdtRqV5SQpsao/kKNpwzks4CayCm7lLtWkw1R84pTKVSVn0LUNg8pf
	0nlaNj8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzYj-00000005omN-2Ypa;
	Tue, 11 Mar 2025 13:22:13 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzX5-00000005oOg-0IyH;
	Tue, 11 Mar 2025 13:20:32 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-523fa0df55dso2493008e0c.1;
        Tue, 11 Mar 2025 06:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741699229; x=1742304029; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG32Oauz2hDV9q2BpFy552F2Ma60RDkGby0ei11tRlQ=;
        b=M1O+kmD45LjpV5IZqCeP38ExO8w8HrhapuFakMsWJw9XUDpJRpI7jRoztdvjWX3hMt
         OHP66llp8YH4mm9ldFDlR77nfegNazoIjHydhSxwY4kpIiN8MTnfV3MOtlAaUG3rQCh/
         EjF0yYYSx4gM0lkBiqj07UjoAJBI23yXmQIUAJTZtQ/CWNYP5drlu0h4RZV9YY5894YN
         buRuULiIk79mUDlUk6edqF6/x4L87dMkScT2XzngYOSBHwgtSn2F8DSygw4rQv4tTV4i
         YDVr3FSQvzD0ut0Jb+rNPbRVRF6cXmy06hciLD7GvKlgzjI4ClYrUAP8decXHsG2Q7Y5
         Op/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741699229; x=1742304029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jG32Oauz2hDV9q2BpFy552F2Ma60RDkGby0ei11tRlQ=;
        b=DfdHDCYacsRrjf4NO4TDVBr/1IuKiOPvvqhUSaHYNHK5MXgPdG+4MOJILAW8Cy2rjo
         9ss51ftfd3RiOvkKLFNEmh+fqMVAqG6Hqre68PoSrpPeN/pnkkihtsKp+Jmpuiwzbcb8
         VbmBBUsrcZsVBpzWK//0ngsgqQh49NGVnzUdmDk88Ksv4QBoueFD5aCVqUnf4za3AEA3
         +AeqOfYzbLEK/dK3yJKf71keXgd7udaVh7e6X+Bmb8XbHjMoF6HlqSQU+9MUMNgUc1fW
         p40WVBLeo90hKOiE6BX5LL76qhvQdT6sF8jJY74xNN9fFMZxqAqbWzr28eK1yQada+Hi
         GLjA==
X-Forwarded-Encrypted: i=1; AJvYcCVNal3p5DcqKCIsCnMrRCkq95ScvObMW4wX3mR4R+aYLs3emsAqC/7o8KPwUOcZsvf79c7QAopHT9XFKIk=@lists.infradead.org, AJvYcCXsdBJE4FnjvA+p+I9ubavX513c2nr6ktDc7zgBHlvZE/orW8Ow4x/TM5iQUFIjN1qqEHCgda5vffMRjZp2msrb@lists.infradead.org
X-Gm-Message-State: AOJu0YzZZvwsU0pmr8Nb9guZp5UXvE1z50ouoF5COcuWR2XIk1wNF56+
	PdjPXKVqeu/2lOMsjp9aKAwvVi0EMdIthFRuQ72q951hoHS7kC1LVveOf3zjrJSTQm5v2Ok0EiL
	MqI0d10TJIxNNWsUFW1bYN649ejA=
X-Gm-Gg: ASbGncvffplKSXAVVKF2/hWvQogh0t7yODK6IyzjvloDM+tZ99xwVVzQBv0c3dXe+6D
	j+Esy6NdzTY4a9DwljzgytZ+OrXKxXWPAfZxsglgqtKr+7dI7vD2M1JXDDsdZooZdamBv8XvOhI
	ERsWcHX0HdUsy/1IwOqeU3fx4G+A==
X-Google-Smtp-Source: AGHT+IH5Ot4qDEn+dcG95GX7rHERBDIZE9g/5SbpzTjYL9a5kZXtGTj07DwxdqUsxTS40Unad1vxI6B/ZQaIH1FxayY=
X-Received: by 2002:a05:6122:3d47:b0:523:dbd5:4e7f with SMTP id
 71dfb90a1353d-52419754983mr2351687e0c.3.1741699228735; Tue, 11 Mar 2025
 06:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <Z82tWYZulV12Pjir@shell.armlinux.org.uk> <E1trIA0-005ntK-FS@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1trIA0-005ntK-FS@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 13:20:02 +0000
X-Gm-Features: AQ5f1JrO_7vudADXigeeN9yXWooM4iHlgYUlKMy4_xyai_AoXvej3y5kzsc7Vh0
Message-ID: <CA+V-a8sCxs4MFZgo0q=0HmpyWXk7hYSGq0awm2YuAFZk+x6BEA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/7] net: stmmac: allow platforms to use PHY tx
 clock stop capability
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, 
	netdev@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_062031_111127_EA75380B 
X-CRM114-Status: GOOD (  19.56  )
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

On Sun, Mar 9, 2025 at 3:02=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Allow platform glue to instruct stmmac to make use of the PHY transmit
> clock stop capability when deciding whether to allow the transmit clock
> from the DWMAC core to be stopped.
>
> Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h     |  1 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++++----
>  include/linux/stmmac.h                           |  3 ++-
>  3 files changed, 15 insertions(+), 5 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/e=
thernet/stmicro/stmmac/stmmac.h
> index d87275c1cf23..bddfa0f4aa21 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -306,6 +306,7 @@ struct stmmac_priv {
>         struct timer_list eee_ctrl_timer;
>         int lpi_irq;
>         u32 tx_lpi_timer;
> +       bool tx_lpi_clk_stop;
>         bool eee_enabled;
>         bool eee_active;
>         bool eee_sw_timer_en;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index fa1d7d3a2f43..6f29804148b6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -457,8 +457,7 @@ static void stmmac_try_to_start_sw_lpi(struct stmmac_=
priv *priv)
>         /* Check and enter in LPI mode */
>         if (!priv->tx_path_in_lpi_mode)
>                 stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_FORCED,
> -                       priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGA=
TING,
> -                       0);
> +                                   priv->tx_lpi_clk_stop, 0);
>  }
>
>  /**
> @@ -1104,13 +1103,18 @@ static int stmmac_mac_enable_tx_lpi(struct phylin=
k_config *config, u32 timer,
>
>         priv->eee_enabled =3D true;
>
> +       /* Update the transmit clock stop according to PHY capability if
> +        * the platform allows
> +        */
> +       if (priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP)
> +               priv->tx_lpi_clk_stop =3D tx_clk_stop;
> +
>         stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
>                              STMMAC_DEFAULT_TWT_LS);
>
>         /* Try to cnfigure the hardware timer. */
>         ret =3D stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_TIMER,
> -                                 priv->plat->flags & STMMAC_FLAG_EN_TX_L=
PI_CLOCKGATING,
> -                                 priv->tx_lpi_timer);
> +                                 priv->tx_lpi_clk_stop, priv->tx_lpi_tim=
er);
>
>         if (ret) {
>                 /* Hardware timer mode not supported, or value out of ran=
ge.
> @@ -1269,6 +1273,10 @@ static int stmmac_phy_setup(struct stmmac_priv *pr=
iv)
>         if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI))
>                 priv->phylink_config.eee_rx_clk_stop_enable =3D true;
>
> +       /* Set the default transmit clock stop bit based on the platform =
glue */
> +       priv->tx_lpi_clk_stop =3D priv->plat->flags &
> +                               STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
> +
>         mdio_bus_data =3D priv->plat->mdio_bus_data;
>         if (mdio_bus_data)
>                 priv->phylink_config.default_an_inband =3D
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index b6f03ab12595..c4ec8bb8144e 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -183,7 +183,8 @@ struct dwmac4_addrs {
>  #define STMMAC_FLAG_INT_SNAPSHOT_EN            BIT(9)
>  #define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI         BIT(10)
>  #define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING      BIT(11)
> -#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY   BIT(12)
> +#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP      BIT(12)
> +#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY   BIT(13)
>
>  struct plat_stmmacenet_data {
>         int bus_id;
> --
> 2.30.2
>

