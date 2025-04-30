Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285F1C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajhOxA0iLtPGZthYkQtI8A6lcJYtYBFoJkVbhPTNhMI=; b=HLDcGFpL0Pbig6mO+0DPO/rZcO
	h4UX1zn7WHG5NndJwbUtGknjdtAiT+uSh5n73RqZCMmD96py7YKE1IDPYJ4wztwiScyBFcgjgiBGY
	HRtsli0p8MDDHq8pPry1p6BWAtGvwKAPjdwhwIR6OO4RhivjG7VZqBScoWmWtOYihxBcGbDUFhWs+
	AVe2HcNhUVklP8p+LK1tyr4AHPXthP+DJQ3uZAGMcJKEU7D1t5yk3HZEJaiogM8ILKVUlZ878GBPK
	XG9xAzLbpYhQPnHAMO7YykL3x5+91NRsN4xY7r49WtFlBdaxvHXEiWDBHGkZwQpJau6TChplTMM2Y
	xy3BIyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7c9-0000000D1Dn-0xIp;
	Wed, 30 Apr 2025 13:36:41 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7ZW-0000000D0ni-2KXw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:33:59 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso9984281a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1746020038; x=1746624838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajhOxA0iLtPGZthYkQtI8A6lcJYtYBFoJkVbhPTNhMI=;
        b=Vr1OZzl79sd9EjTsLG8RhpxXoDVD/J71SkLc6SaDSUD74IjSJ+mMUYOBSV71CyZlRv
         j5NXF4v1RwXO/awg5K02/mmG3BeMYX16JBLTIgtREHF+X/Te6VDFfyQXaIrzzigb1DnN
         +fHjpgLM9srUGyDn2IZzlEFmbG2dm07Wkojgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746020038; x=1746624838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajhOxA0iLtPGZthYkQtI8A6lcJYtYBFoJkVbhPTNhMI=;
        b=uxojek0b8vOrn8pfukAxtOKQI0xbn4evESJcwPRkcG4mKgYyLs6HSpjQSps3PJUSur
         /mDCfGUE+24o/acIPZc2ptf1vnox1D9yI5YRyEn0JHAJeGw+PGhvU125gT2jH/5bB5o/
         +TYwKbp/dYuVyMxFjWnjRkgQz+e8JdRJhYOrYiaWcQHy1nwWKvMqrKedSWSMuuYU5CY3
         5lydnf4dmwpIsRhfxV9Ao/VyrdxW45z5pajJBAzEQe0PqfVopebi9f7cExmDcewO8g1n
         twGO5fdZlQak+kGIDsRlvAqZWaBZAQRezQRDqtzHtpY9vu4hLSFPQ7z6IavD0pnCf3jy
         g8ew==
X-Forwarded-Encrypted: i=1; AJvYcCW7Mhtk9EtzQG8DYTIlw10tFzShThPtF8im7nyfnIQkAKflP428MIJA/umbUV1Hd1X0Lje8//nqwKmY9zUx1N4v@lists.infradead.org
X-Gm-Message-State: AOJu0YwLfV8qqeMtPlOVOWagz+tj+34+EE98h2sNtnckQdFRE1ludfsA
	jeIBivEe+XyAR5znVJx/BxIXblujm1fGMhIgvRdh4RvxOqdrEugY6hge2wFMHTb3Zya4MtsEgqy
	6q1yzJfxmMSBdBrXfrSJ4TXYvmoJZLBwbMiEsFg==
X-Gm-Gg: ASbGncsT19Xb3Ibhzoo8Rtf/Ae7FV39RO2hmDWJs+5dZtQrNFvEJ0bdTlZgKyvQqul+
	rv651tUbSbCpmSD9vqcSG4W7X+YloavN3PYxi6n1Q2T91Mxe/pnw4yEUfB7rwdggm7t7EuTWJ0F
	wSRI1fnVLaGs+MZE2l644G4piRc8M/O/h23+Rt+LtIwRQbXL5J1D+LdjA=
X-Google-Smtp-Source: AGHT+IHbzPeyJtSRyKZO2Vl0Bhsgs4DAx2IroFrsEz3RFT0nCQ9OG827L6aMMdnhNikRttLwYZXOzLzgBnKVihMBAyY=
X-Received: by 2002:a17:90b:584f:b0:2ee:e945:5355 with SMTP id
 98e67ed59e1d1-30a333020b2mr4073447a91.19.1746020037617; Wed, 30 Apr 2025
 06:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250414-spi-dma-v2-1-84bbd92fa469@amlogic.com>
 <CACdvmAhEXstEBdaiktU4n-R6M6mYiBnSx15ZJfb1FOKGD7Zfaw@mail.gmail.com> <b202538e-5520-48ce-a957-034c0ce7beb1@linaro.org>
In-Reply-To: <b202538e-5520-48ce-a957-034c0ce7beb1@linaro.org>
From: Da Xue <da@lessconfused.com>
Date: Wed, 30 Apr 2025 09:33:46 -0400
X-Gm-Features: ATxdqUFHYK_nvBUpmd79vpJx2UJLfO_GZ6NdPKb9rFzoLu69sqOWtWG7sM5p8mU
Message-ID: <CACdvmAhcCUTFBrMkgrnt03iY4=siSiYKU9Ss4M-+HT-h6wphWA@mail.gmail.com>
Subject: Re: [PATCH v2] spi: meson-spicc: add DMA support
To: neil.armstrong@linaro.org
Cc: xianwei.zhao@amlogic.com, Mark Brown <broonie@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sunny Luo <sunny.luo@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_063358_606700_70CDEBF1 
X-CRM114-Status: GOOD (  44.72  )
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

On Wed, Apr 30, 2025 at 3:43=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 30/04/2025 04:13, Da Xue wrote:
> > On Mon, Apr 14, 2025 at 2:30=E2=80=AFAM Xianwei Zhao via B4 Relay
> > <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> >>
> >> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> >>
> >> Add DMA support for spicc driver.
> >>
> >> DMA works if the transfer meets the following conditions:
> >> 1. 64 bits per word;
> >> 2. The transfer length must be multiples of the dma_burst_len,
> >>     and the dma_burst_len should be one of 8,7...2,
> >>     otherwise, it will be split into several SPI bursts.
> >>
> >> Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
> >> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> >> ---
> >> Changes in v2:
> >> - Make formatting adjustments and code optimizations according to Neil=
's suggestions.
> >> - Remove two special DMA trigger modes that are not fully implemented.
> >> - Link to v1: https://lore.kernel.org/r/20250408-spi-dma-v1-1-3c38be62=
c09c@amlogic.com
> >> ---
> >>   drivers/spi/spi-meson-spicc.c | 241 ++++++++++++++++++++++++++++++++=
++++++----
> >>   1 file changed, 220 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spi=
cc.c
> >> index df74ad5060f8..6b9137307533 100644
> >> --- a/drivers/spi/spi-meson-spicc.c
> >> +++ b/drivers/spi/spi-meson-spicc.c
> >> @@ -21,18 +21,26 @@
> >>   #include <linux/interrupt.h>
> >>   #include <linux/reset.h>
> >>   #include <linux/pinctrl/consumer.h>
> >> +#include <linux/dma-mapping.h>
> >>
> >>   /*
> >> - * The Meson SPICC controller could support DMA based transfers, but =
is not
> >> - * implemented by the vendor code, and while having the registers doc=
umentation
> >> - * it has never worked on the GXL Hardware.
> >> - * The PIO mode is the only mode implemented, and due to badly design=
ed HW :
> >> - * - all transfers are cutted in 16 words burst because the FIFO hang=
s on
> >> - *   TX underflow, and there is no TX "Half-Empty" interrupt, so we g=
o by
> >> - *   FIFO max size chunk only
> >> - * - CS management is dumb, and goes UP between every burst, so is re=
ally a
> >> - *   "Data Valid" signal than a Chip Select, GPIO link should be used=
 instead
> >> - *   to have a CS go down over the full transfer
> >> + * There are two modes for data transmission: PIO and DMA.
> >> + * When bits_per_word is 8, 16, 24, or 32, data is transferred using =
PIO mode.
> >> + * When bits_per_word is 64, DMA mode is used by default.
> >> + *
> >> + * DMA achieves a transfer with one or more SPI bursts, each SPI burs=
t is made
> >> + * up of one or more DMA bursts. The DMA burst implementation mechani=
sm is,
> >> + * For TX, when the number of words in TXFIFO is less than the preset
> >> + * reading threshold, SPICC starts a reading DMA burst, which reads t=
he preset
> >> + * number of words from TX buffer, then writes them into TXFIFO.
> >> + * For RX, when the number of words in RXFIFO is greater than the pre=
set
> >> + * writing threshold, SPICC starts a writing request burst, which rea=
ds the
> >> + * preset number of words from RXFIFO, then write them into RX buffer=
.
> >> + * DMA works if the transfer meets the following conditions,
> >> + * - 64 bits per word
> >
> > Just for clarification, DMA can only send 64-bit words due to hardware
> > design, right?
> > The bit-per-word in spi control register (CONREG) has no effect?
> >
> >> + * - The transfer length in word must be multiples of the dma_burst_l=
en, and
> >> + *   the dma_burst_len should be one of 8,7...2, otherwise, it will b=
e split
> >> + *   into several SPI bursts by this driver
> >>    */
> >>
> >>   #define SPICC_MAX_BURST        128
> >> @@ -128,6 +136,23 @@
> >>
> >>   #define SPICC_DWADDR   0x24    /* Write Address of DMA */
> >>
> >> +#define SPICC_LD_CNTL0 0x28
> >> +#define VSYNC_IRQ_SRC_SELECT           BIT(0)
> >> +#define DMA_EN_SET_BY_VSYNC            BIT(2)
> >> +#define XCH_EN_SET_BY_VSYNC            BIT(3)
> >> +#define DMA_READ_COUNTER_EN            BIT(4)
> >> +#define DMA_WRITE_COUNTER_EN           BIT(5)
> >> +#define DMA_RADDR_LOAD_BY_VSYNC                BIT(6)
> >> +#define DMA_WADDR_LOAD_BY_VSYNC                BIT(7)
> >> +#define DMA_ADDR_LOAD_FROM_LD_ADDR     BIT(8)
> >> +
> >> +#define SPICC_LD_CNTL1 0x2c
> >> +#define DMA_READ_COUNTER               GENMASK(15, 0)
> >> +#define DMA_WRITE_COUNTER              GENMASK(31, 16)
> >> +#define DMA_BURST_LEN_DEFAULT          8
> >> +#define DMA_BURST_COUNT_MAX            0xffff
> >> +#define SPI_BURST_LEN_MAX      (DMA_BURST_LEN_DEFAULT * DMA_BURST_COU=
NT_MAX)
> >> +
> >
> > LD_CNTL0 and LD_CNTL1 are not in this datasheet for GXL
> > (S805X/S905X/S905D). Do they exist on these SoCs and are not
> > documented?
> >
> >>   #define SPICC_ENH_CTL0 0x38    /* Enhanced Feature */
> >>   #define SPICC_ENH_CLK_CS_DELAY_MASK    GENMASK(15, 0)
> >>   #define SPICC_ENH_DATARATE_MASK                GENMASK(23, 16)
> >> @@ -171,6 +196,9 @@ struct meson_spicc_device {
> >>          struct pinctrl                  *pinctrl;
> >>          struct pinctrl_state            *pins_idle_high;
> >>          struct pinctrl_state            *pins_idle_low;
> >> +       dma_addr_t                      tx_dma;
> >> +       dma_addr_t                      rx_dma;
> >> +       bool                            using_dma;
> >>   };
> >>
> >>   #define pow2_clk_to_spicc(_div) container_of(_div, struct meson_spic=
c_device, pow2_div)
> >> @@ -202,6 +230,148 @@ static void meson_spicc_oen_enable(struct meson_=
spicc_device *spicc)
> >>          writel_relaxed(conf, spicc->base + SPICC_ENH_CTL0);
> >>   }
> >>
> >> +static int meson_spicc_dma_map(struct meson_spicc_device *spicc,
> >> +                              struct spi_transfer *t)
> >> +{
> >> +       struct device *dev =3D spicc->host->dev.parent;
> >> +
> >> +       if (!(t->tx_buf && t->rx_buf))
> >> +               return -EINVAL;
> >> +
> >> +       t->tx_dma =3D dma_map_single(dev, (void *)t->tx_buf, t->len, D=
MA_TO_DEVICE);
> >> +       if (dma_mapping_error(dev, t->tx_dma))
> >> +               return -ENOMEM;
> >> +
> >> +       t->rx_dma =3D dma_map_single(dev, t->rx_buf, t->len, DMA_FROM_=
DEVICE);
> >> +       if (dma_mapping_error(dev, t->rx_dma))
> >> +               return -ENOMEM;
> >> +
> >> +       spicc->tx_dma =3D t->tx_dma;
> >> +       spicc->rx_dma =3D t->rx_dma;
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static void meson_spicc_dma_unmap(struct meson_spicc_device *spicc,
> >> +                                 struct spi_transfer *t)
> >> +{
> >> +       struct device *dev =3D spicc->host->dev.parent;
> >> +
> >> +       if (t->tx_dma)
> >> +               dma_unmap_single(dev, t->tx_dma, t->len, DMA_TO_DEVICE=
);
> >> +       if (t->rx_dma)
> >> +               dma_unmap_single(dev, t->rx_dma, t->len, DMA_FROM_DEVI=
CE);
> >> +}
> >> +
> >> +/*
> >> + * According to the remain words length, calculate a suitable spi bur=
st length
> >> + * and a dma burst length for current spi burst
> >> + */
> >> +static u32 meson_spicc_calc_dma_len(struct meson_spicc_device *spicc,
> >> +                                   u32 len, u32 *dma_burst_len)
> >> +{
> >> +       u32 i;
> >> +
> >> +       if (len <=3D spicc->data->fifo_size) {
> >> +               *dma_burst_len =3D len;
> >> +               return len;
> >> +       }
> >> +
> >> +       *dma_burst_len =3D DMA_BURST_LEN_DEFAULT;
> >> +
> >> +       if (len =3D=3D (SPI_BURST_LEN_MAX + 1))
> >> +               return SPI_BURST_LEN_MAX - DMA_BURST_LEN_DEFAULT;
> >> +
> >> +       if (len >=3D SPI_BURST_LEN_MAX)
> >> +               return SPI_BURST_LEN_MAX;
> >> +
> >> +       for (i =3D DMA_BURST_LEN_DEFAULT; i > 1; i--)
> >> +               if ((len % i) =3D=3D 0) {
> >> +                       *dma_burst_len =3D i;
> >> +                       return len;
> >> +               }
> >> +
> >> +       i =3D len % DMA_BURST_LEN_DEFAULT;
> >> +       len -=3D i;
> >> +
> >> +       if (i =3D=3D 1)
> >> +               len -=3D DMA_BURST_LEN_DEFAULT;
> >> +
> >> +       return len;
> >> +}
> >> +
> >> +static void meson_spicc_setup_dma(struct meson_spicc_device *spicc)
> >> +{
> >> +       unsigned int len;
> >> +       unsigned int dma_burst_len, dma_burst_count;
> >> +       unsigned int count_en =3D 0;
> >> +       unsigned int txfifo_thres =3D 0;
> >> +       unsigned int read_req =3D 0;
> >> +       unsigned int rxfifo_thres =3D 31;
> >> +       unsigned int write_req =3D 0;
> >> +       unsigned int ld_ctr1 =3D 0;
> >> +
> >> +       writel_relaxed(spicc->tx_dma, spicc->base + SPICC_DRADDR);
> >> +       writel_relaxed(spicc->rx_dma, spicc->base + SPICC_DWADDR);
> >> +
> >> +       /* Set the max burst length to support a transmission with len=
gth of
> >> +        * no more than 1024 bytes(128 words), which must use the CS m=
anagement
> >> +        * because of some strict timing requirements
> >> +        */
> >> +       writel_bits_relaxed(SPICC_BURSTLENGTH_MASK, SPICC_BURSTLENGTH_=
MASK,
> >> +                           spicc->base + SPICC_CONREG);
> >> +
> >> +       len =3D meson_spicc_calc_dma_len(spicc, spicc->xfer_remain,
> >> +                                      &dma_burst_len);
> >> +       spicc->xfer_remain -=3D len;
> >> +       dma_burst_count =3D DIV_ROUND_UP(len, dma_burst_len);
> >> +       dma_burst_len--;
> >> +
> >> +       if (spicc->tx_dma) {
> >> +               spicc->tx_dma +=3D len;
> >> +               count_en |=3D DMA_READ_COUNTER_EN;
> >> +               txfifo_thres =3D spicc->data->fifo_size - dma_burst_le=
n;
> >> +               read_req =3D dma_burst_len;
> >> +               ld_ctr1 |=3D FIELD_PREP(DMA_READ_COUNTER, dma_burst_co=
unt);
> >> +       }
> >> +
> >> +       if (spicc->rx_dma) {
> >> +               spicc->rx_dma +=3D len;
> >> +               count_en |=3D DMA_WRITE_COUNTER_EN;
> >> +               rxfifo_thres =3D dma_burst_len;
> >> +               write_req =3D dma_burst_len;
> >> +               ld_ctr1 |=3D FIELD_PREP(DMA_WRITE_COUNTER, dma_burst_c=
ount);
> >> +       }
> >> +
> >> +       writel_relaxed(count_en, spicc->base + SPICC_LD_CNTL0);
> >> +       writel_relaxed(ld_ctr1, spicc->base + SPICC_LD_CNTL1);
> >> +       writel_relaxed(SPICC_DMA_ENABLE
> >> +                   | SPICC_DMA_URGENT
> >> +                   | FIELD_PREP(SPICC_TXFIFO_THRESHOLD_MASK, txfifo_t=
hres)
> >> +                   | FIELD_PREP(SPICC_READ_BURST_MASK, read_req)
> >> +                   | FIELD_PREP(SPICC_RXFIFO_THRESHOLD_MASK, rxfifo_t=
hres)
> >> +                   | FIELD_PREP(SPICC_WRITE_BURST_MASK, write_req),
> >> +                   spicc->base + SPICC_DMAREG);
> >> +}
> >> +
> >> +static irqreturn_t meson_spicc_dma_irq(struct meson_spicc_device *spi=
cc)
> >> +{
> >> +       if (readl_relaxed(spicc->base + SPICC_DMAREG) & SPICC_DMA_ENAB=
LE)
> >> +               return IRQ_HANDLED;
> >> +
> >> +       if (spicc->xfer_remain) {
> >> +               meson_spicc_setup_dma(spicc);
> >> +       } else {
> >> +               writel_bits_relaxed(SPICC_SMC, 0, spicc->base + SPICC_=
CONREG);
> >> +               writel_relaxed(0, spicc->base + SPICC_INTREG);
> >> +               writel_relaxed(0, spicc->base + SPICC_DMAREG);
> >> +               meson_spicc_dma_unmap(spicc, spicc->xfer);
> >> +               complete(&spicc->done);
> >> +       }
> >> +
> >> +       return IRQ_HANDLED;
> >> +}
> >> +
> >>   static inline bool meson_spicc_txfull(struct meson_spicc_device *spi=
cc)
> >>   {
> >>          return !!FIELD_GET(SPICC_TF,
> >> @@ -293,6 +463,9 @@ static irqreturn_t meson_spicc_irq(int irq, void *=
data)
> >>
> >>          writel_bits_relaxed(SPICC_TC, SPICC_TC, spicc->base + SPICC_S=
TATREG);
> >>
> >> +       if (spicc->using_dma)
> >> +               return meson_spicc_dma_irq(spicc);
> >> +
> >>          /* Empty RX FIFO */
> >>          meson_spicc_rx(spicc);
> >>
> >> @@ -426,9 +599,6 @@ static int meson_spicc_transfer_one(struct spi_con=
troller *host,
> >>
> >>          meson_spicc_reset_fifo(spicc);
> >>
> >> -       /* Setup burst */
> >> -       meson_spicc_setup_burst(spicc);
> >> -
> >>          /* Setup wait for completion */
> >>          reinit_completion(&spicc->done);
> >>
> >> @@ -442,11 +612,36 @@ static int meson_spicc_transfer_one(struct spi_c=
ontroller *host,
> >>          /* Increase it twice and add 200 ms tolerance */
> >>          timeout +=3D timeout + 200;
> >>
> >> -       /* Start burst */
> >> -       writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + SPICC_=
CONREG);
> >> +       if (xfer->bits_per_word =3D=3D 64) {
> >> +               int ret;
> >> +
> >> +               /* dma_burst_len 1 can't trigger a dma burst */
> >> +               if (xfer->len < 16)
> >> +                       return -EINVAL;
> >> +
> >> +               ret =3D meson_spicc_dma_map(spicc, xfer);
> >> +               if (ret) {
> >> +                       meson_spicc_dma_unmap(spicc, xfer);
> >> +                       dev_err(host->dev.parent, "dma map failed\n");
> >> +                       return ret;
> >> +               }
> >> +
> >> +               spicc->using_dma =3D true;
> >> +               spicc->xfer_remain =3D DIV_ROUND_UP(xfer->len, spicc->=
bytes_per_word);
> >> +               meson_spicc_setup_dma(spicc);
> >> +               writel_relaxed(SPICC_TE_EN, spicc->base + SPICC_INTREG=
);
> >> +               writel_bits_relaxed(SPICC_SMC, SPICC_SMC, spicc->base =
+ SPICC_CONREG);
> >> +       } else {
> >> +               spicc->using_dma =3D false;
> >> +               /* Setup burst */
> >> +               meson_spicc_setup_burst(spicc);
> >>
> >> -       /* Enable interrupts */
> >> -       writel_relaxed(SPICC_TC_EN, spicc->base + SPICC_INTREG);
> >> +               /* Start burst */
> >> +               writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base =
+ SPICC_CONREG);
> >> +
> >> +               /* Enable interrupts */
> >> +               writel_relaxed(SPICC_TC_EN, spicc->base + SPICC_INTREG=
);
> >> +       }
> >>
> >>          if (!wait_for_completion_timeout(&spicc->done, msecs_to_jiffi=
es(timeout)))
> >>                  return -ETIMEDOUT;
> >> @@ -545,6 +740,14 @@ static int meson_spicc_setup(struct spi_device *s=
pi)
> >>          if (!spi->controller_state)
> >>                  spi->controller_state =3D spi_controller_get_devdata(=
spi->controller);
> >>
> >> +       /* DMA works at 64 bits, the rest works on PIO */
> >> +       if (spi->bits_per_word !=3D 8 &&
> >> +           spi->bits_per_word !=3D 16 &&
> >> +           spi->bits_per_word !=3D 24 &&
> >> +           spi->bits_per_word !=3D 32 &&
> >> +           spi->bits_per_word !=3D 64)
> >> +               return -EINVAL;
> >> +
> >>          return 0;
> >>   }
> >>
> >> @@ -853,10 +1056,6 @@ static int meson_spicc_probe(struct platform_dev=
ice *pdev)
> >>          host->num_chipselect =3D 4;
> >>          host->dev.of_node =3D pdev->dev.of_node;
> >>          host->mode_bits =3D SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI_L=
OOP;
> >> -       host->bits_per_word_mask =3D SPI_BPW_MASK(32) |
> >> -                                  SPI_BPW_MASK(24) |
> >> -                                  SPI_BPW_MASK(16) |
> >> -                                  SPI_BPW_MASK(8);
> >
> > This should not be removed. SPI_BPW_MASK(64) needs to be added.
> > Removing bits_per_word_mask causes other code to assume this is an
> > 8-bit only controller.
>
> SPI_BPW_MASK(64) doesn't not exist, it's only a 32bit field, removing it =
is fine,
> the check is done later.

The spi_is_bpw_supported function in include/linux/spi/spi.h checks
bits_per_word_mask.
Without this set, drm_mipi_dbi behavior is changed to 8-bit transfers.

Yeah, the 64 won't work. I didn't check the macro.

>
> Neil
>
> >
> >
> >
> >>          host->flags =3D (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST=
_TX);
> >>          host->min_speed_hz =3D spicc->data->min_speed_hz;
> >>          host->max_speed_hz =3D spicc->data->max_speed_hz;
> >>
> >> ---
> >> base-commit: 49807ed87851916ef655f72e9562f96355183090
> >> change-id: 20250408-spi-dma-c499f560d295
> >>
> >> Best regards,
> >> --
> >> Xianwei Zhao <xianwei.zhao@amlogic.com>
> >>
> >>
> >>
> >> _______________________________________________
> >> linux-amlogic mailing list
> >> linux-amlogic@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>

