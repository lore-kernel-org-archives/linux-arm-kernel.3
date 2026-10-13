Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4BDCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHKvPJxtOUe89VmDsqkmUm9POoFOuKBVafdlaQIcGVE=; b=3Z2gs5KjjZtoPmC65FOGf+ycEn
	wBhKeMpDYH/x5ETsvWwnQvQ96kp/b0u+oAyuRMxTd8nNbjitvSsprBnJE5NcTsIWa+YL7P7qVBf3N
	s+/L56VNQCC/961FfonWlyplP9jxM1xF3dAo2vQAlM0Jyf5C00VixInrqh2QEuIpe3aqMM6ku6f2+
	e/Du6967A24p9lAzomBIxf76NzyFwF3jfonUhgfJ0RmFp3LmKFAZcE0G+4UobzzOdNZi6fxzQ82VS
	GWxNFNzuWRI4hy1UkG36uEDEXsDWYXADr6XzX8/eFKBGcoOYmtNq8XVN81yUP6pacziEN91Mz/X4g
	rNyHGTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgLk-0000000DhB5-100B;
	Tue, 13 Oct 2026 17:31:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgLi-0000000DhAc-1SQW;
	Tue, 13 Oct 2026 17:31:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86A76602C3;
	Tue, 13 Oct 2026 17:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01E91F000FF;
	Tue, 13 Oct 2026 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791912697;
	bh=XHKvPJxtOUe89VmDsqkmUm9POoFOuKBVafdlaQIcGVE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=A8e7KvJHDPjWetHiC45tXKu6DgRn2R9/Fi3zyt1eYV+vaIef17ec+TB7oamk9o2yP
	 Kz1eDq3I3e94inordlmeMtKpf99yPQTqbY9XzdTXCogYvZMSN+U5KAA1WiFvZ0FTTF
	 XriyxG0pVV4hG3FuCzekqqJgs2lLZElmtdb6XuYFNiJRh2n/9z9Fl25x558URDauly
	 SL+aZ6+aAs1c5qtijehAFuLHA8eZvQQyXv5yTS5espatyyTP/0zDacJ4WItNZL+++l
	 Nc0CG9w/98QYBpWpFPNGp2m0Jr+NVOPmaFUMMCLnLMGO4/TFr+9PeJt0n0P9ZBX+7B
	 5Fe/tJ+ax26EA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 08/10] PCI: dw-rockchip: Set broken L1SS resume flag
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-8-fbabcca9921b@collabora.com>
References: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
 <20260908-rockchip-pcie-system-suspend-v6-8-fbabcca9921b@collabora.com>
Date: Tue, 13 Oct 2026 23:01:26 +0530
Message-Id: <179191268696.12828.12282510519182218823.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=mani@kernel.org;
 h=from:subject:message-id; bh=sECM7/KBFpScFHSC/sEOxRcyil3uarzd9RUU7Zeyc5o=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqzmrxbGKarqI/Q7fz3/e7A2/n23V+EU8Dis+QA
 DRqwIdT222JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas5q8QAKCRBVnxHm/pHO
 9StMB/9t742KOafibx5/hcaZnnnDfkKBK6ODJNOTNS+zB5XOmgSqbqLfEynB/EaXH7Z1IVSesF5
 JcO/kJVggvuUWjtG+Bz7pq3s/tWpHaBxVAXoWuoKPnzmZQUAxKIs9OySekQtCeEv2jIssn1+lTY
 KlTKniY+QRLln2AfEHM6pjaYKbkpeZS5bKg5jeWKpCBAZGmDgrP0xDuf9dtI0jPuHRFLj9glYb5
 F7nYF1s5WgEouqemlBHXoBFYsw76/UKAXjSO00Rp9rQo2/HndAffJbpqdn0wqbYG62fw9CxE/+E
 1Zj5tn15AtSsua4cVxmMS67MPLmYSJpc6j36ta1eNVRTUPvg
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

On 2026-09-08 16:51 +0200, Sebastian Reichel wrote:
> Setup the broken_l1ss_resume flag, so that pci_suspend_retains_context()
> returns false on the Rockchip platform allowing PCIe peripheral device
> drivers to act upon.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 17530507e41b..47d9cab909bc 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -458,6 +458,21 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void rockchip_pcie_host_post_init(struct dw_pcie_rp *pp)
> +{
> +	/*
> +	 * During system suspend, the Rockchip RC driver effectively powers off
> +	 * the controller. If the link is in L1SS and the endpoint asserts
> +	 * CLKREQ# to exit L1SS, the time required to wake the system and
> +	 * restore the PHY/REFCLK may exceed the L1SS exit timing
> +	 * (L10_REFCLK_ON + T_COMMONMODE), resulting in Link Down (LDn) and a
> +	 * reset of the endpoint. Set this flag to indicate this limitation to
> +	 * client drivers so that they can avoid relying on device state being
> +	 * preserved during system suspend.
> +	 */

This comment is redundant, please drop.

- Mani


