Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2501AFD374E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kqdio3QnQeSgdyfFl+OnQQkHMmqCS4nQHqPQrg9pHM=; b=jea+E6R1PYTGJrHiaWHWqxqcoH
	VIfiqhrZu4s1K83OAUPfxWI5DQK47u1Ytt++9uxAkUC2Ow9IqZI+mFCICz1ulWPRCiDGDZb6PPWcb
	KGP+L1DDSKYBinvG6oS7inJbP6vfQIaKiWVT4vw9gJ8JZIvzbAh9ljZBisblQBqhSbuyQsx468YFC
	FmmENCbNPC373wvZQIVDEui+UB0Ggar1ZRDsHI6pbloRNEYJq8NRRAyDTdDkqf+Rsi4/qUkqNGwnx
	QtcvBV0R/sD9GojvyHpW4FjrmunIarEPAagLxHE27up251DyddhjKWE5uu+yc8MrK6G6RGqwGezXL
	XUxiIvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEtB-000000045es-0VbU;
	Wed, 25 Feb 2026 13:25:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEt7-000000045eU-2ouo;
	Wed, 25 Feb 2026 13:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC53F43A43;
	Wed, 25 Feb 2026 13:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDCCC116D0;
	Wed, 25 Feb 2026 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772025912;
	bh=mAJmjo+WQ/SOXuG5lH3nrurqWJdwbMc7DVrXQkrzHxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txZoV1Y3dtStZsn0jFEESEMRE0e9n40zHXs2eDyL+aEe3v0J4kZH5JZY4/BwDZrPt
	 YCr/U29ofvF2l41r1S3ULn95YgOu/14MdV8VsTNQUn147LOKhKA0H+mGYQETV5du0q
	 HIQASwuvoTbmSG2xXDie5cNiXSLR4opcEmIBSNwlNpMaYj98DtjbNP1Fyp+pMAcyj9
	 b9eaoW2RC6rd2LLcfQs5O29mqyqzP+rmCo0eZOjLs9v8D6C7OcLNtpuP9hN7O7Ys6i
	 FhIRZeQy+BT4M5QLia7tUEsjtqdt+Xbw+Ey13rjfzhpAom5nc8AI4p2JDQQWHRzxKA
	 AYQZezb5wqRng==
Date: Wed, 25 Feb 2026 18:55:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] PCI: mediatek-gen3: add power control support
Message-ID: <knddbvl6qti4pyaphudrmhbx7jm245tsmpa37snk4frtphcuz2@am6aatvc6hbr>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_052513_804817_AC9A0651 
X-CRM114-Status: GOOD (  25.21  )
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

On Wed, Feb 25, 2026 at 03:22:17PM +0800, Chen-Yu Tsai wrote:
> Hi folks,
> 
> This series adds power control support to the MediaTek PCIe gen3
> controller driver. This allows proper modeling of WiFi and NVMe
> adapters in the device tree and control over their power supplies.
> 
> Patch 1 through 4 are cleanups and minor improvements to the driver.
> 
> Patch 5 adds power control support using the new pwrctrl API to the
> PCIe controller driver.
> 
> Patch 6 adds the WiFi and BT power supplies for the MT8195 Cherry design.
> This is actually a M.2 E-key slot, but support for that is still WIP [1].
> And even with it merged, support for the USB side still needs to be
> figured out.
> 
> We can either merge this as is for now, and do another conversion later,
> or just keep this one out. However this is still an improvement over
> the current device tree, in which the power for the slot is always on
> using a pinctrl setting.
> 
> Patch 7 adds the M.2 M-key NVMe slot found on MT8195 Dojo Chromebooks.
> This change actually makes use of the M.2 pwrseq driver.
> 

Thanks a lot for doing this! I'll also try to get the Key E support for v7.1.

For the whole series,

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> Please have a look.
> 
> 
> Thanks
> ChenYu
> 
> [1] https://lore.kernel.org/linux-pci/20260224-pci-m2-e-v5-0-dd9b9501d33c@oss.qualcomm.com/
> 
> Chen-Yu Tsai (7):
>   PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with
>     dev_err_probe()
>   PCI: mediatek-gen3: Add error path for probe and resume driver
>     callbacks
>   PCI: mediatek-gen3: Split out device power helpers
>   PCI: mediatek-gen3: Disable device if further setup fails
>   PCI: mediatek-gen3: Integrate new pwrctrl API
>   arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB power
>     supplies
>   arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe slot
> 
>  .../dts/mediatek/mt8195-cherry-dojo-r1.dts    |  38 ++++
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      |  47 +++--
>  drivers/pci/controller/pcie-mediatek-gen3.c   | 185 +++++++++++-------
>  3 files changed, 183 insertions(+), 87 deletions(-)
> 
> -- 
> 2.53.0.414.gf7e9f6c205-goog
> 

-- 
மணிவண்ணன் சதாசிவம்

