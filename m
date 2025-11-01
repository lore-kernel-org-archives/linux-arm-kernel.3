Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8667CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 14:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tIBzY4dTmapvVnf3dQUMP0/UgkhXhQTrB0U4inhZGg=; b=wT/S+/dOJalY8uFxYvez/5BYeU
	4sbmru4ncQfuR/qUb3ODuKBTvocWYJDzuuNOYZkkaS8E37WgnlhlxcbgLOjjzH7mTcuwLtbdkFj9G
	P4FomlKB/hvmO4Cgsmc27YUgDPyxE/4MQtz3Hxc/0IDp+ajC9YazlGNhBy97wcfgoE7pRNG43du8F
	bQQQ8TgwcOoi3vhilb7Kr/8Y3NRqmJP0wWdwxRCnYjKhyRHZmv7lm5ThW605T2GgvlJvtjtklj96X
	/wO4JRDXqG4otopYLTROoZNPNLI3tL/sfNJ1krZorPmSS0HcQA1lvrh80XEpxDtjhOgZL/PgS24Ul
	r2bBjwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFC99-00000007oft-1fvi;
	Sat, 01 Nov 2025 13:59:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFC97-00000007ofi-2Urp;
	Sat, 01 Nov 2025 13:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B7F3601EF;
	Sat,  1 Nov 2025 13:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF889C4CEF1;
	Sat,  1 Nov 2025 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762005595;
	bh=m7C3U3qzThf33XwoRsd1OWSRs7f7Z7SEULSpUd0++FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=midrRS9rdrC+XyGBuprUT4byWe1Zbx/aHwRVsM+laKgkIPY7Hx0MJsydN9UB+Mv1u
	 LbjwBJ0uN6ZNQlsengRus2AVi7f6atWT6IJu7UjpqkpWDAZamMvSWB3BNNYmUwAmmy
	 zR9gHFpHDvN6JJxI4WpQYjKhQsgMlRV4KOVeQIQNqQtdNRtbw5Z5AJtWih8S9HhBbb
	 392hKPrCZIEMqw4uzD3aHXmWt084ouHdWBexpDvcUYuupitHWxQ80xCGsYj1Q50qJi
	 cTIpw3gZ3ylkPAMmbZC1FX7GqXEHUDAHY5CZ3pHoTgurhIc0I2X1DvN70aD/U529w2
	 pp8HI2n2Tgf8Q==
Date: Sat, 1 Nov 2025 19:29:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v4 0/9] PCI: dw-rockchip: add system suspend support
Message-ID: <cf6zumlp4iiltglu7bbrpdeysaznrkyvlemwl4lxwkfjkgux7a@wl37bxilsprx>
References: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
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

On Wed, Oct 29, 2025 at 06:56:39PM +0100, Sebastian Reichel wrote:
> I've recently been working on fixing up at least basic system suspend
> support on the Rockchip RK3576 platform. Currently the biggest open
> issue is missing support in the PCIe driver. This series is a follow-up
> for Shawn Lin's series with feedback from Niklas Cassel and Manivannan
> Sadhasivam being handled as well as some of my own changes fixing up
> things I noticed.
> 
> In opposite to Shawn Lin I did not test with different peripherals as my
> main goal is getting basic suspend to ram working in the first place.

Wouldn't it break users who have connected endpoint devices and suspend their
platform? I don't want to have an untested feature that could potentially cause
regressions, just for the sake of getting basic system PM.

But if your goal is to just add basic system PM operations for CI testing, then
I would suggest you to do something minimal in the suspend/resume path that
don't disrupt the operation of a device.

But this also should be tested with some devices for sanity.

- Mani

> I
> did notice issues with the Broadcom WLAN card on the RK3576 EVB.
> Suspending that platform without a driver being probed works, but after
> probing brcmfmac suspend is aborted because brcmf_pcie_pm_enter_D3()
> does not work. As far as I can tell the problem is unrelated to the
> Rockchip PCIe driver.
> 
> Changes since PATCHv3:
>  * https://lore.kernel.org/linux-pci/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
>  * rename rockchip_pcie_get_ltssm to rockchip_pcie_get_ltssm_status_reg
>    in a separate patch (Niklas Cassel)
>  * rename rockchip_pcie_get_pure_ltssm to rockchip_pcie_get_ltssm_state
>    in a separate patch (Niklas Cassel)
>  * Move devm_phy_get out of phy_init to probe in a separate patch
>    (Manivannan Sadhasivam)
>  * Add helper function for enhanced LTSSM control mode in a separate patch
>    (Niklas Cassel)
>  * Add helper function for controller mode in a separate patch
>    (Niklas Cassel)
>  * Add helper function for DDL indicator in a separate patch
>    (Niklas Cassel)
>  * Move rockchip_pcie_pme_turn_off implementation in a separate patch
>  * Rebase to v6.18-rc3 using new FIELD_PREP_WM16()
>  * Improve readability of PME_TURN_OFF/PME_TO_ACK defines (Manivannan Sadhasivam)
>  * Fix usage of reverse Xmas (Manivannan Sadhasivam)
>  * Assert PERST# before turning off other resources (Manivannan Sadhasivam)
>  * Improve some error messages (Manivannan Sadhasivam)
>  * Rename goto labels as per their purpose (Manivannan Sadhasivam)
>  * Add extra patch for dw_pcie_resume_noirq, since I've seen errors
>    during resume on boards not having anything plugged into their PCIe
>    port
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Sebastian Reichel (9):
>       PCI: dw-rockchip: Rename rockchip_pcie_get_ltssm function
>       PCI: dw-rockchip: Support get_ltssm operation
>       PCI: dw-rockchip: Move devm_phy_get out of phy_init
>       PCI: dw-rockchip: Add helper function for enhanced LTSSM control mode
>       PCI: dw-rockchip: Add helper function for controller mode
>       PCI: dw-rockchip: Add helper function for DDL indicator
>       PCI: dw-rockchip: Add pme_turn_off support
>       PCI: dw-rockchip: Add system PM support
>       PCI: dwc: support missing PCIe device on resume
> 
>  drivers/pci/controller/dwc/pcie-designware-host.c |  13 +-
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c     | 220 ++++++++++++++++++----
>  2 files changed, 198 insertions(+), 35 deletions(-)
> ---
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
> change-id: 20251028-rockchip-pcie-system-suspend-86cf08a7b229
> 
> Best regards,
> -- 
> Sebastian Reichel <sebastian.reichel@collabora.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

