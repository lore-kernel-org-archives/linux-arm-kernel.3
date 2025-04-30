Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEC5C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 03:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtsFXATNoShqTVkbay8QH27/CZbtOqHUZhXlCbT05hw=; b=LV2fGBgJkwgUZphxX5NB//+eOn
	XZAsahvF8snXSyxLy3rdV/XffRqQuCMMZpYsxjY7P+dNn1d4MkMvcUZKxUrnT8D92xN8vlif8C7Ul
	TYNhyNWo8LC9Gs50ofwP/RnlA+/fsOq4MOKllJwplJr+ywW8um3DGfYph9dl5MKDTfyYQC1U26Ziy
	D49XeaUxjnxvdi32/ycr5aszvXfqS4IU7QV2yOdZdZC8sjjlvdScD8mydmcGwp+YRkOEHPFrnxUH5
	2mSe1MLYUsvq51M3sJFInttzZLzNQ7MruTNV8hbzetUX6oLTCEJJcuqg15OIZIZ7DavPzcpvC/xoD
	xFrRF9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xlL-0000000BZ1s-2CPT;
	Wed, 30 Apr 2025 03:05:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xjO-0000000BYt7-2baD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 03:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FtsFXATNoShqTVkbay8QH27/CZbtOqHUZhXlCbT05hw=; b=M4KWY0dwxIMQNCgwRub36T+yRP
	JPVHnkzcYFgB1IWAXu8KUip49s4lLsIkucAGvMXgIKSdOyuI4uzT9+YvlN9AceCQDA7viEXSCpjMs
	tOjpcxRf8ldbSb8B6pgBzdTSV8MjgMs/ux7lr1qlFnqMvuWuZ/ZRDFsSkMvRCtaR4cMT/XX0Gt6N3
	ol05TudfnuyOGqlNMbzww16vOeY+Dt4MUDoO7++/HTBZH2vhO+kJrLXlvSbDnmpzn0WZOh8HFNPMc
	P8tV3yHyUjaBaOjpeaOnFWWs9om1pmL5NyJsRhuEH1GGavJ4Kc0ZUD+RnNeS+Rk0y5B/6kYjje2tY
	2TugXjJQ==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9xjI-0000000DedV-31vM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 03:03:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22438c356c8so74124905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 20:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1745982200; x=1746587000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtsFXATNoShqTVkbay8QH27/CZbtOqHUZhXlCbT05hw=;
        b=VEtJhOwRjw3mzv8Z6UCuJwp/ihZHkqs46ieaWW434WjUchJ6wxaOlgSCf2DnPojOtA
         lKMBwkcf+JYhhO4xC5Sc+NELsbwdpzmxmsgTPIqTcqZKfyRHwlbBKyhcXO4PwpAdmJ5O
         75nrfakJxT5a4VFeSA7tsyI6DazDTVaJPoug4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982200; x=1746587000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtsFXATNoShqTVkbay8QH27/CZbtOqHUZhXlCbT05hw=;
        b=Zdh8rj14kzakoUFbzKTBFKDTCYWClTTzAXKI/A06K5fhh3ka3xPDYzrgIgjz4QIeDf
         7kEXXdPmfhStCxkHi2iB9FuUZGucfAYP8rYX+YNoTe5/FC7IoB5vM3mW5Lm/9C9ZuG9G
         24IU2Ff1Z16ebetX5e8ndcnVREoDdSTvLYMy0BZorEM2QaFZav8/o2yN08FBAANLoKVH
         TY0TdnzHZrq9iBPKynG7sbbRQA38LxE+e9cYJ1T2C3Ep9TwcB2P4NPNEYffTs/CxOeIc
         eYkhr/bUSyuhzXUdR0RdlUsdK/p9mJeSR8rvYMFX9bJLNFo3DPBVdKSzJJBxDDZbZtSt
         8lqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5l0/0pQibiti++Xk6kt3wfsnU20Js2hio3m/q3kstf5IZ7QwReXTVS3h3lIkOOpUIM+0bKcDxh42gEcZUFAEu@lists.infradead.org
X-Gm-Message-State: AOJu0YxVyOdAblXjwQi+kreIGrwyJ9PoyDKaTeEDg1fllvNSiw6UNFEH
	2ZngS5BUlFos8D+1fHFvU+ntBSQLoyvULZGpXXuuinElW5/Tlhi1tK5XFggbPiJJbC8YinU5Pco
	Cb9b8+R5ArUONMWi9oBbLyCr4PDAh2sPpuo34cg==
X-Gm-Gg: ASbGncv24tVK05OP/nBeP0br6Jia47lIpZ0pLydnsblYh22ju8XeNvv5f0ipNZvEjjW
	t+v/3iBe/oCRMZxUOaVk0aW4wrc33O/myQRKcUNdlswClM2/n1azUNxHo6ygnxpo6RP3I3bcXi8
	Gl42o16WGXuG/7E6sGt2spdjrlphUBKYmZJzvbse4LOP+hbFmMBXoTeZU=
X-Google-Smtp-Source: AGHT+IHWYkcIquDI14ZP8nSc+0ia5OdshYR2d5iL7cj8Ucq5COtov48MTjtXrFOaO18tlx5e/iPOZ1TfkjF00Ry6HrM=
X-Received: by 2002:a17:902:e80c:b0:21f:85af:4bbf with SMTP id
 d9443c01a7336-22df34d60ebmr23401035ad.20.1745982200362; Tue, 29 Apr 2025
 20:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250414-spi-dma-v2-1-84bbd92fa469@amlogic.com>
In-Reply-To: <20250414-spi-dma-v2-1-84bbd92fa469@amlogic.com>
From: Da Xue <da@lessconfused.com>
Date: Tue, 29 Apr 2025 23:03:09 -0400
X-Gm-Features: ATxdqUHPbISbrbEOxVf_PPZYjEH_HG4hR4i1yA1A-Bal6nglQ_Jfu1FJL1hoW6U
Message-ID: <CACdvmAheh-nV=nevH6sodZFOwxJzbsPnQJvvEprAd27BaCsSYA@mail.gmail.com>
Subject: Re: [PATCH v2] spi: meson-spicc: add DMA support
To: xianwei.zhao@amlogic.com
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sunny Luo <sunny.luo@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_040326_676504_EDE3C446 
X-CRM114-Status: GOOD (  42.34  )
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

On Mon, Apr 14, 2025 at 2:30=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add DMA support for spicc driver.
>
> DMA works if the transfer meets the following conditions:
> 1. 64 bits per word;
> 2. The transfer length must be multiples of the dma_burst_len,
>    and the dma_burst_len should be one of 8,7...2,
>    otherwise, it will be split into several SPI bursts.
>
> Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Changes in v2:
> - Make formatting adjustments and code optimizations according to Neil's =
suggestions.
> - Remove two special DMA trigger modes that are not fully implemented.
> - Link to v1: https://lore.kernel.org/r/20250408-spi-dma-v1-1-3c38be62c09=
c@amlogic.com
> ---
>  drivers/spi/spi-meson-spicc.c | 241 ++++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 220 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.=
c
> index df74ad5060f8..6b9137307533 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -21,18 +21,26 @@
>  #include <linux/interrupt.h>
>  #include <linux/reset.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/dma-mapping.h>
>
>  /*
> - * The Meson SPICC controller could support DMA based transfers, but is =
not
> - * implemented by the vendor code, and while having the registers docume=
ntation
> - * it has never worked on the GXL Hardware.
> - * The PIO mode is the only mode implemented, and due to badly designed =
HW :
> - * - all transfers are cutted in 16 words burst because the FIFO hangs o=
n
> - *   TX underflow, and there is no TX "Half-Empty" interrupt, so we go b=
y
> - *   FIFO max size chunk only
> - * - CS management is dumb, and goes UP between every burst, so is reall=
y a
> - *   "Data Valid" signal than a Chip Select, GPIO link should be used in=
stead
> - *   to have a CS go down over the full transfer
> + * There are two modes for data transmission: PIO and DMA.
> + * When bits_per_word is 8, 16, 24, or 32, data is transferred using PIO=
 mode.
> + * When bits_per_word is 64, DMA mode is used by default.
> + *
> + * DMA achieves a transfer with one or more SPI bursts, each SPI burst i=
s made
> + * up of one or more DMA bursts. The DMA burst implementation mechanism =
is,
> + * For TX, when the number of words in TXFIFO is less than the preset
> + * reading threshold, SPICC starts a reading DMA burst, which reads the =
preset
> + * number of words from TX buffer, then writes them into TXFIFO.
> + * For RX, when the number of words in RXFIFO is greater than the preset
> + * writing threshold, SPICC starts a writing request burst, which reads =
the
> + * preset number of words from RXFIFO, then write them into RX buffer.
> + * DMA works if the transfer meets the following conditions,
> + * - 64 bits per word
> + * - The transfer length in word must be multiples of the dma_burst_len,=
 and
> + *   the dma_burst_len should be one of 8,7...2, otherwise, it will be s=
plit
> + *   into several SPI bursts by this driver
>   */
>
>  #define SPICC_MAX_BURST        128
> @@ -128,6 +136,23 @@
>
>  #define SPICC_DWADDR   0x24    /* Write Address of DMA */
>
> +#define SPICC_LD_CNTL0 0x28
> +#define VSYNC_IRQ_SRC_SELECT           BIT(0)
> +#define DMA_EN_SET_BY_VSYNC            BIT(2)
> +#define XCH_EN_SET_BY_VSYNC            BIT(3)
> +#define DMA_READ_COUNTER_EN            BIT(4)
> +#define DMA_WRITE_COUNTER_EN           BIT(5)
> +#define DMA_RADDR_LOAD_BY_VSYNC                BIT(6)
> +#define DMA_WADDR_LOAD_BY_VSYNC                BIT(7)
> +#define DMA_ADDR_LOAD_FROM_LD_ADDR     BIT(8)
> +
> +#define SPICC_LD_CNTL1 0x2c
> +#define DMA_READ_COUNTER               GENMASK(15, 0)
> +#define DMA_WRITE_COUNTER              GENMASK(31, 16)
> +#define DMA_BURST_LEN_DEFAULT          8
> +#define DMA_BURST_COUNT_MAX            0xffff
> +#define SPI_BURST_LEN_MAX      (DMA_BURST_LEN_DEFAULT * DMA_BURST_COUNT_=
MAX)

The controller should also specify host->max_transfer_size.

> +
>  #define SPICC_ENH_CTL0 0x38    /* Enhanced Feature */
>  #define SPICC_ENH_CLK_CS_DELAY_MASK    GENMASK(15, 0)
>  #define SPICC_ENH_DATARATE_MASK                GENMASK(23, 16)
> @@ -171,6 +196,9 @@ struct meson_spicc_device {
>         struct pinctrl                  *pinctrl;
>         struct pinctrl_state            *pins_idle_high;
>         struct pinctrl_state            *pins_idle_low;
> +       dma_addr_t                      tx_dma;
> +       dma_addr_t                      rx_dma;
> +       bool                            using_dma;
>  };
>
>  #define pow2_clk_to_spicc(_div) container_of(_div, struct meson_spicc_de=
vice, pow2_div)
> @@ -202,6 +230,148 @@ static void meson_spicc_oen_enable(struct meson_spi=
cc_device *spicc)
>         writel_relaxed(conf, spicc->base + SPICC_ENH_CTL0);
>  }
>
> +static int meson_spicc_dma_map(struct meson_spicc_device *spicc,
> +                              struct spi_transfer *t)
> +{
> +       struct device *dev =3D spicc->host->dev.parent;
> +
> +       if (!(t->tx_buf && t->rx_buf))
> +               return -EINVAL;
> +
> +       t->tx_dma =3D dma_map_single(dev, (void *)t->tx_buf, t->len, DMA_=
TO_DEVICE);
> +       if (dma_mapping_error(dev, t->tx_dma))
> +               return -ENOMEM;
> +
> +       t->rx_dma =3D dma_map_single(dev, t->rx_buf, t->len, DMA_FROM_DEV=
ICE);
> +       if (dma_mapping_error(dev, t->rx_dma))
> +               return -ENOMEM;
> +
> +       spicc->tx_dma =3D t->tx_dma;
> +       spicc->rx_dma =3D t->rx_dma;
> +
> +       return 0;
> +}
> +
> +static void meson_spicc_dma_unmap(struct meson_spicc_device *spicc,
> +                                 struct spi_transfer *t)
> +{
> +       struct device *dev =3D spicc->host->dev.parent;
> +
> +       if (t->tx_dma)
> +               dma_unmap_single(dev, t->tx_dma, t->len, DMA_TO_DEVICE);
> +       if (t->rx_dma)
> +               dma_unmap_single(dev, t->rx_dma, t->len, DMA_FROM_DEVICE)=
;
> +}
> +
> +/*
> + * According to the remain words length, calculate a suitable spi burst =
length
> + * and a dma burst length for current spi burst
> + */
> +static u32 meson_spicc_calc_dma_len(struct meson_spicc_device *spicc,
> +                                   u32 len, u32 *dma_burst_len)
> +{
> +       u32 i;
> +
> +       if (len <=3D spicc->data->fifo_size) {
> +               *dma_burst_len =3D len;
> +               return len;
> +       }
> +
> +       *dma_burst_len =3D DMA_BURST_LEN_DEFAULT;
> +
> +       if (len =3D=3D (SPI_BURST_LEN_MAX + 1))
> +               return SPI_BURST_LEN_MAX - DMA_BURST_LEN_DEFAULT;
> +
> +       if (len >=3D SPI_BURST_LEN_MAX)
> +               return SPI_BURST_LEN_MAX;
> +
> +       for (i =3D DMA_BURST_LEN_DEFAULT; i > 1; i--)
> +               if ((len % i) =3D=3D 0) {
> +                       *dma_burst_len =3D i;
> +                       return len;
> +               }
> +
> +       i =3D len % DMA_BURST_LEN_DEFAULT;
> +       len -=3D i;
> +
> +       if (i =3D=3D 1)
> +               len -=3D DMA_BURST_LEN_DEFAULT;
> +
> +       return len;
> +}
> +
> +static void meson_spicc_setup_dma(struct meson_spicc_device *spicc)
> +{
> +       unsigned int len;
> +       unsigned int dma_burst_len, dma_burst_count;
> +       unsigned int count_en =3D 0;
> +       unsigned int txfifo_thres =3D 0;
> +       unsigned int read_req =3D 0;
> +       unsigned int rxfifo_thres =3D 31;
> +       unsigned int write_req =3D 0;
> +       unsigned int ld_ctr1 =3D 0;
> +
> +       writel_relaxed(spicc->tx_dma, spicc->base + SPICC_DRADDR);
> +       writel_relaxed(spicc->rx_dma, spicc->base + SPICC_DWADDR);
> +
> +       /* Set the max burst length to support a transmission with length=
 of
> +        * no more than 1024 bytes(128 words), which must use the CS mana=
gement
> +        * because of some strict timing requirements
> +        */
> +       writel_bits_relaxed(SPICC_BURSTLENGTH_MASK, SPICC_BURSTLENGTH_MAS=
K,
> +                           spicc->base + SPICC_CONREG);
> +
> +       len =3D meson_spicc_calc_dma_len(spicc, spicc->xfer_remain,
> +                                      &dma_burst_len);
> +       spicc->xfer_remain -=3D len;
> +       dma_burst_count =3D DIV_ROUND_UP(len, dma_burst_len);
> +       dma_burst_len--;
> +
> +       if (spicc->tx_dma) {
> +               spicc->tx_dma +=3D len;
> +               count_en |=3D DMA_READ_COUNTER_EN;
> +               txfifo_thres =3D spicc->data->fifo_size - dma_burst_len;
> +               read_req =3D dma_burst_len;
> +               ld_ctr1 |=3D FIELD_PREP(DMA_READ_COUNTER, dma_burst_count=
);
> +       }
> +
> +       if (spicc->rx_dma) {
> +               spicc->rx_dma +=3D len;
> +               count_en |=3D DMA_WRITE_COUNTER_EN;
> +               rxfifo_thres =3D dma_burst_len;
> +               write_req =3D dma_burst_len;
> +               ld_ctr1 |=3D FIELD_PREP(DMA_WRITE_COUNTER, dma_burst_coun=
t);
> +       }
> +
> +       writel_relaxed(count_en, spicc->base + SPICC_LD_CNTL0);
> +       writel_relaxed(ld_ctr1, spicc->base + SPICC_LD_CNTL1);
> +       writel_relaxed(SPICC_DMA_ENABLE
> +                   | SPICC_DMA_URGENT
> +                   | FIELD_PREP(SPICC_TXFIFO_THRESHOLD_MASK, txfifo_thre=
s)
> +                   | FIELD_PREP(SPICC_READ_BURST_MASK, read_req)
> +                   | FIELD_PREP(SPICC_RXFIFO_THRESHOLD_MASK, rxfifo_thre=
s)
> +                   | FIELD_PREP(SPICC_WRITE_BURST_MASK, write_req),
> +                   spicc->base + SPICC_DMAREG);
> +}
> +
> +static irqreturn_t meson_spicc_dma_irq(struct meson_spicc_device *spicc)
> +{
> +       if (readl_relaxed(spicc->base + SPICC_DMAREG) & SPICC_DMA_ENABLE)
> +               return IRQ_HANDLED;
> +
> +       if (spicc->xfer_remain) {
> +               meson_spicc_setup_dma(spicc);
> +       } else {
> +               writel_bits_relaxed(SPICC_SMC, 0, spicc->base + SPICC_CON=
REG);
> +               writel_relaxed(0, spicc->base + SPICC_INTREG);
> +               writel_relaxed(0, spicc->base + SPICC_DMAREG);
> +               meson_spicc_dma_unmap(spicc, spicc->xfer);
> +               complete(&spicc->done);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
>  static inline bool meson_spicc_txfull(struct meson_spicc_device *spicc)
>  {
>         return !!FIELD_GET(SPICC_TF,
> @@ -293,6 +463,9 @@ static irqreturn_t meson_spicc_irq(int irq, void *dat=
a)
>
>         writel_bits_relaxed(SPICC_TC, SPICC_TC, spicc->base + SPICC_STATR=
EG);
>
> +       if (spicc->using_dma)
> +               return meson_spicc_dma_irq(spicc);
> +
>         /* Empty RX FIFO */
>         meson_spicc_rx(spicc);
>
> @@ -426,9 +599,6 @@ static int meson_spicc_transfer_one(struct spi_contro=
ller *host,
>
>         meson_spicc_reset_fifo(spicc);
>
> -       /* Setup burst */
> -       meson_spicc_setup_burst(spicc);
> -
>         /* Setup wait for completion */
>         reinit_completion(&spicc->done);
>
> @@ -442,11 +612,36 @@ static int meson_spicc_transfer_one(struct spi_cont=
roller *host,
>         /* Increase it twice and add 200 ms tolerance */
>         timeout +=3D timeout + 200;
>
> -       /* Start burst */
> -       writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + SPICC_CON=
REG);
> +       if (xfer->bits_per_word =3D=3D 64) {
> +               int ret;
> +
> +               /* dma_burst_len 1 can't trigger a dma burst */
> +               if (xfer->len < 16)
> +                       return -EINVAL;
> +
> +               ret =3D meson_spicc_dma_map(spicc, xfer);
> +               if (ret) {
> +                       meson_spicc_dma_unmap(spicc, xfer);
> +                       dev_err(host->dev.parent, "dma map failed\n");
> +                       return ret;
> +               }
> +
> +               spicc->using_dma =3D true;
> +               spicc->xfer_remain =3D DIV_ROUND_UP(xfer->len, spicc->byt=
es_per_word);
> +               meson_spicc_setup_dma(spicc);
> +               writel_relaxed(SPICC_TE_EN, spicc->base + SPICC_INTREG);
> +               writel_bits_relaxed(SPICC_SMC, SPICC_SMC, spicc->base + S=
PICC_CONREG);
> +       } else {
> +               spicc->using_dma =3D false;
> +               /* Setup burst */
> +               meson_spicc_setup_burst(spicc);
>
> -       /* Enable interrupts */
> -       writel_relaxed(SPICC_TC_EN, spicc->base + SPICC_INTREG);
> +               /* Start burst */
> +               writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + S=
PICC_CONREG);
> +
> +               /* Enable interrupts */
> +               writel_relaxed(SPICC_TC_EN, spicc->base + SPICC_INTREG);
> +       }
>
>         if (!wait_for_completion_timeout(&spicc->done, msecs_to_jiffies(t=
imeout)))
>                 return -ETIMEDOUT;
> @@ -545,6 +740,14 @@ static int meson_spicc_setup(struct spi_device *spi)
>         if (!spi->controller_state)
>                 spi->controller_state =3D spi_controller_get_devdata(spi-=
>controller);
>
> +       /* DMA works at 64 bits, the rest works on PIO */
> +       if (spi->bits_per_word !=3D 8 &&
> +           spi->bits_per_word !=3D 16 &&
> +           spi->bits_per_word !=3D 24 &&
> +           spi->bits_per_word !=3D 32 &&
> +           spi->bits_per_word !=3D 64)
> +               return -EINVAL;
> +
>         return 0;
>  }
>
> @@ -853,10 +1056,6 @@ static int meson_spicc_probe(struct platform_device=
 *pdev)
>         host->num_chipselect =3D 4;
>         host->dev.of_node =3D pdev->dev.of_node;
>         host->mode_bits =3D SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI_LOOP;
> -       host->bits_per_word_mask =3D SPI_BPW_MASK(32) |
> -                                  SPI_BPW_MASK(24) |
> -                                  SPI_BPW_MASK(16) |
> -                                  SPI_BPW_MASK(8);
>         host->flags =3D (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)=
;
>         host->min_speed_hz =3D spicc->data->min_speed_hz;
>         host->max_speed_hz =3D spicc->data->max_speed_hz;
>
> ---
> base-commit: 49807ed87851916ef655f72e9562f96355183090
> change-id: 20250408-spi-dma-c499f560d295
>
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

