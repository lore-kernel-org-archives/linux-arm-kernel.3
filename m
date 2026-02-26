Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A937FD45F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 00:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=P/BRsy5eOTu3RyaW1cREGYL1yetd3sZWbHsGQthCzSU=; b=gIV0tPrwIopjt5
	UBwUAR5OO6qs4EoSzkw78ECjnFbScxfCZFEyMr2bLT1NadAJE0hrytAC5zbMfM+cNXN5tWRMibQOL
	2q7RKa3yw6mqCMBF6kOtcYGY3laG+H/YMUIDUXcVJW1blWzuDzEav4biUrqSU9bCZMH4kWVg7uQjU
	FndxIQp0rIgrpmkY3VxFALXXA5tZRbZvXDBsKOSDO36VPhPSRX8iDnFegL8hSpCbRKmWU1H4tGTMa
	nHCp8v+a4xjkoeWI3DdCxGDMxYNkHB0QOejYPUFBK53Z1EEhKMY/Mj+tkgBPjLADDFYtDnJNQ/CUp
	evBboZfYo7K/1sW8hEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOza-000000057WU-1PuA;
	Thu, 26 Feb 2026 00:12:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOzY-000000057WK-2FpR;
	Thu, 26 Feb 2026 00:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9805C60054;
	Thu, 26 Feb 2026 00:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBE6C116D0;
	Thu, 26 Feb 2026 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772064751;
	bh=SZbKF5LZ0Uxj5izv92WB0gGvM+uY2clH0am/IhAUQjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZuuEX/5nsJRDb87pDiZEk+Bl3zs3sV/IR76IFAEn7XYMguL5oGLr+UfGes1arGTU7
	 t6K7+sBZ0czvpFNzo1h1PmQhwy7pvORAUIDEXQLNttrkDqD5m/Qicy+6nC07hIh6sX
	 rnqNoqhsfNXnw5nTFujE9MZmd7G/xlOh3Ux3VS6z5tVMyIu8s50vo6Wpjv/0t2Gw9z
	 HBktI78WwKedIPUYnxIcY0SLoegCaNzR8hHaf0C+mIrYp5hfHDIvTaCxrew30qJESd
	 lnEpMgGatd4Vb8IdtzfevmFR+B0fb7msOenSntmwCR6D3wRtaUIhAGTrm3thMULkuB
	 qRJ28/tNJp9Uw==
Date: Wed, 25 Feb 2026 18:12:29 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] PCI: rockchip-host: comment danger of 5.0 GT/s
 speed
Message-ID: <20260226001229.GA3794668@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8db835ffe384db63ee598a203751b298ad1cc267.1772057799.git.geraldogabriel@gmail.com>
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

On Wed, Feb 25, 2026 at 07:27:44PM -0300, Geraldo Nascimento wrote:
> According to Rockchip sources, there is grave danger in enabling 5.0
> GT/s speed for this core. Add a comment documenting this risk of
> "catastrophic failure" and discouraging end-users from forcing
> higher speed.

A comment in the code might be useful but doesn't discourage end
users.

> Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> Cc: stable@vger.kernel.org
> Reported-by: Dragan Simic <dsimic@manjaro.org>
> Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index ee1822ca01db..4faf3e29b7d5 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -332,6 +332,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  		/*
>  		 * Enable retrain for gen2. This should be configured only after
>  		 * gen1 finished.
> +		 *
> +		 * Dangerous and may lead to "catastrophic failure", with data loss
> +		 * or worse!
> +		 *

Wrap comment to fit in 80 columns like the rest of the file.

Remove spurious blank line at end.

This should probably be squashed with the first patch; I don't see the
benefit of having them separate.

Why don't we just remove this whole "link_gen == 2" block?  If we
don't want to use it, there's no point in keeping the code.

>  		 */
>  		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
>  		status &= ~PCI_EXP_LNKCTL2_TLS;
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

