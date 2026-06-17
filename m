Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E3CCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NH6hocZNylot+M4XVVVgASnxnSv/8JW5bdpWIVIZHYU=; b=j/4VlmxsCGpso/gWQvxHBBIy//
	WkWvcrzsRy8T1QUTRaxD5rhg+1AF1U5sVNGRxpaatLW5FjxlJLZctyT06QeokwQEExeZgvlyeTmY3
	v+OSODJbFgcag74G0QJ6k/C2PslD/DMXLSU1n0JUmQw7/R+xCbQnU0FcwPN/sbDknHaYXe3VEcY29
	7GE2jCKrxWbuQMuZLG7SBHiw+7lEQCCUiVAWUzF3/Br9aN9aGMA6Pqw5nBil4/poAM0JQ0odvCJqz
	6toIqE2O0iFOBk528z7ZDBa0HJoetb0FBX7RDO8+KjVaD7+cYfsI6n0GIVieT1bQu5675SsjZ84hB
	8Bm3l3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlbk-0000000Gsp7-1tuM;
	Wed, 17 Jun 2026 08:26:48 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlbi-0000000Gsoh-0hJ2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 08:26:47 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963f63fe025so1372381241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 01:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684805; x=1782289605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NH6hocZNylot+M4XVVVgASnxnSv/8JW5bdpWIVIZHYU=;
        b=Xu9uOHVqccL6KSy7Kz6455kSFPLgmy4AB7scSyW7+PArDSszw6PEqHDVY8Yxo35V8V
         6VwgUv/kQBqNMi7wAoztYxsH5JcUeN9I5QciDGtboBezcvTvaFXGNuRJicAL9hdDR6PL
         N3wk3dGqLOnEPWFFQSPDRX+g5God2nnXiAFcSC1iPbgLvInalVw/d7h0TTTR/iG7WwlL
         px6X2u8Im1qSntqMWED7M+qnRJrQLQhBtzk/Tm8StgfEDTXAS0nN23PYOnZ8t0QxkAFC
         1oKWtbjevOzqHxGRmUzkm7nmlSVcSGRJ3vUb/zuf6PLPyMoJHvBohGs8zS3R3BBa9JKs
         RjJg==
X-Forwarded-Encrypted: i=1; AFNElJ+fXwKDHZtEMB5E91mNs/3wHefRyzTLXVPY4PK0y6IoU0cBvKJngjaK23PnT8sjBowOpLrWK//4VXwUee6/sA6s@lists.infradead.org
X-Gm-Message-State: AOJu0YzjxFH0aOR7wwjy78v+sJjZb0B0q2GyzIfjKynQo24k5TuET6Le
	IAQLSux4r2itx830jMXYj2kXpDVh9f/oPCzuUrzkgpEjp1U0sGUgm9y4JnyFbcM/
X-Gm-Gg: Acq92OH2vWkk0882gp54IJPKD9QitEqgiqOfT0d4t49T/rECmapwnL+A73Z6fMGceV4
	mCGw76IdpMGzCRD4hScN1ZNQDBzEbfDgh0Txt5sFThgpMRDjP39ayMhxSQQbGCUZDcIgdvBZxYG
	xPXG04XwwcVd+PmV8Qg9vsl045FZKqNJ5P12ASCHl6WPC6kHUyPh9tMJ5gEyw5KFpPiRg/zlEg6
	aRn2y06tP6TeraXyaLfFn7mIMDiX8owCq5dTjN6QEmycvhcht8HTS1C9rslenh7Rdy5NOPuEAzJ
	hJot9JYIF8CsMWV44D/U3bmsw+keyX2WyncsxtGseaesKwBJBABr1fS47u3fehd1zczzGTgLqG5
	PxRwmbnMtJsCJS1uI080dn/pN+VAIhC07fBEKaa4dNuMEIVaYsAfl70bBYX+HhWEmtZcdFR1bbP
	bTx5PwUkrlOKU8bMKzkkmaTRBKQx7j9dfWrtLOadhIM1rNFuJLFw==
X-Received: by 2002:a05:6102:3f4d:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-7246d105146mr1305570137.24.1781684804613;
        Wed, 17 Jun 2026 01:26:44 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966ce8dceccsm2437894241.6.2026.06.17.01.26.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 01:26:44 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6cfd17e9250so2228090137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 01:26:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8yl5oNYCFKzRWYtuY8nKBl4nuTyI/vxOrraEmDd8mjGLVYnflLt6dHGJiWWGvF3mDdzWJyPxV1f63oTuI8JbaW@lists.infradead.org
X-Received: by 2002:a05:6102:4b03:b0:632:3bb5:95f1 with SMTP id
 ada2fe7eead31-7246d528766mr1135210137.27.1781684803531; Wed, 17 Jun 2026
 01:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 10:26:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0SJ0q2hcpu+qZCH3eZ5eFDyo8Z964h9DhuSaQ7QdHSg@mail.gmail.com>
X-Gm-Features: AVVi8CfAqddoQorfQ6TrjH19DY2WU_w8lZ69fu1Z-CMFemynEW91v1W75EneBEs
Message-ID: <CAMuHMdU0SJ0q2hcpu+qZCH3eZ5eFDyo8Z964h9DhuSaQ7QdHSg@mail.gmail.com>
Subject: Re: [PATCH 1/3] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_012646_217864_9B1D1CE9 
X-CRM114-Status: GOOD (  29.63  )
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

Hi Marek,

On Wed, 17 Jun 2026 at 05:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
> MSI are handled via GIC ITS. Configure all controller MSI registers
> fully.
>
> Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
> PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
> enable MSI_CTRL_INT bit according to MSI enable state, set both bits
> if MSI are enabled, clear both bits if MSI are disabled.
>
> If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
> deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
> pass through of MSI TLPs onto the AXI bus and then further into
> GIC ITS translation registers.
>
> If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
> with target address of GIC ITS translation registers, and configure
> AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
> GIC ITS. This specific configuration allows handling of MSI via the
> GIC ITS instead of integrated iMSI-RX.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -31,6 +31,10 @@
>  #define DEVICE_TYPE_RC         BIT(4)
>  #define BIFUR_MOD_SET_ON       BIT(0)
>
> +/* MSI Capability */
> +#define MSICAP0                        0x0050
> +#define MSICAP0_MSIE           BIT(16)
> +
>  /* PCIe Interrupt Status 0 */
>  #define PCIEINTSTS0            0x0084
>
> @@ -55,6 +59,16 @@
>  #define APP_HOLD_PHY_RST       BIT(16)
>  #define APP_LTSSM_ENABLE       BIT(0)
>
> +/* INTC address */
> +#define AXIINTCADDR            0x0a00
> +/* GITS GIC ITS translation register */
> +#define AXIINTCADDR_VAL                0xf1050000
> +
> +/* INTC control & mask */
> +#define AXIINTCCONT            0x0a04
> +#define INTC_EN                        BIT(31)
> +#define INTC_MASK              GENMASK(11, 2)
> +
>  /* PCIe Power Management Control */
>  #define PCIEPWRMNGCTRL         0x0070
>  #define APP_CLK_REQ_N          BIT(11)
> @@ -305,6 +319,39 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>         return rcar;
>  }
>
> +static void rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
> +{
> +       struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +       struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +       u32 val;
> +
> +       /* Make sure MSICAP0 MSIE is configured. */
> +       val = dw_pcie_readl_dbi(dw, MSICAP0);
> +       if (pci_msi_enabled())
> +               val |= MSICAP0_MSIE;
> +       else
> +               val &= ~MSICAP0_MSIE;
> +       dw_pcie_writel_dbi(dw, MSICAP0, val);
> +
> +       if (!pci_msi_enabled() || pp->use_imsi_rx) {
> +               /* Clear AXIINTC mapping. */
> +               writel(0, rcar->base + AXIINTCADDR);
> +               writel(0, rcar->base + AXIINTCCONT);
> +       } else {
> +               /* Point AXIINTC to GIC ITS and enable. */
> +               writel(AXIINTCADDR_VAL, rcar->base + AXIINTCADDR);
> +               writel(INTC_EN | INTC_MASK, rcar->base + AXIINTCCONT);
> +       }
> +
> +       /* Configure MSI interrupt signal */
> +       val = readl(rcar->base + PCIEINTSTS0EN);
> +       if (pci_msi_enabled())
> +               val |= MSI_CTRL_INT;
> +       else
> +               val &= ~MSI_CTRL_INT;
> +       writel(val, rcar->base + PCIEINTSTS0EN);
> +}
> +
>  static int rcar_gen4_pcie_enable_device(struct pci_host_bridge *bridge,

FTR, this has a contextual dependency on "[PATCH v2] PCI: rcar-gen4:
Limit Max_Read_Request_Size and Max_Payload_Size to 256 Bytes"
(https://lore.kernel.org/all/20260519195219.189323-1-marek.vasut+renesas@mailbox.org).

>                                         struct pci_dev *dev)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

