Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E9CC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+V5eSBDbzKtHwctRP6JpHMZNOan/yuE7PM+fC538Ag=; b=zhnOL4yTYtInSVKuVgalzRr+yH
	1iVVB7rM7thypTb1m5OHcooBWwL+OblL7MaRDykXfP+tPbQR02GrRgM/opVd7K0ft7TZ1Mmvmolpz
	NHsV6/ppthcAfpZzDQgAImmsVvew14GHreB/U+H/LvPskmHeyx4lCFAE0gJuViRw4b6JwsZJ8YBSH
	gGe3bXJ8ItT1RopSk7FO2wvXvVnT/qd5YtR/+UvLSDEEyOLoyrWs3WcWqZkrXdATKLZJ+jcBzQner
	aoq0UfN41hPHkDtWWbop1F+Bn2PLZ9hVS5un5mXttSGHHkxeaq5Oh4aK92WZs1Vh68wX0imCDQQ0/
	3WBtKPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLzf-0000000ELHp-44ul;
	Thu, 16 Jan 2025 09:16:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLwv-0000000EKhL-3lwi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 09:14:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tYLwa-00058V-Lt; Thu, 16 Jan 2025 10:13:40 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tYLwZ-000ECZ-0Y;
	Thu, 16 Jan 2025 10:13:39 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tYLwZ-00031z-0H;
	Thu, 16 Jan 2025 10:13:39 +0100
Message-ID: <1f143d85c24d4691299072d582142f36c018c878.camel@pengutronix.de>
Subject: Re: [PATCH] PCI: mediatek-gen3: Remove leftover mac_reset assert
 for Airoha EN7581 SoC.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>,  Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Rob Herring <robh@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 16 Jan 2025 10:13:39 +0100
In-Reply-To: <20250115-pcie-en7581-remove-mac_reset-v1-1-61c2652e189f@kernel.org>
References: <20250115-pcie-en7581-remove-mac_reset-v1-1-61c2652e189f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_011401_928330_50826F70 
X-CRM114-Status: GOOD (  14.88  )
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

On Mi, 2025-01-15 at 18:58 +0100, Lorenzo Bianconi wrote:
> Remove a leftover assert for mac_reset line in mtk_pcie_en7581_power_up()=
.
> This is not armful since EN7581 does not requires mac_reset and
              ^ harmful

> mac_reset is not defined in EN7581 device tree.
>

> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/co=
ntroller/pcie-mediatek-gen3.c
> index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..0f64e76e2111468e6a453889e=
ad7fbc75804faf7 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -940,7 +940,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_p=
cie *pcie)
>  	 */
>  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
>  				  pcie->phy_resets);
> -	reset_control_assert(pcie->mac_reset);

Is it ok to keep the mac_reset assert in mtk_pcie_power_down() ?

>  	/* Wait for the time needed to complete the reset lines assert. */
>  	msleep(PCIE_EN7581_RESET_TIME_MS);
>=20
> ---
> base-commit: d02e16e4e05d5d2530a4836ca92318c6a6b21b01

I can't find this commit, which tree is it on?

regards
Philipp

