Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5250C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyZA+ecio8dgqAefqnzmsKi9pbcS8BSqqmIH/9UMq/w=; b=F0mgr5QL3TYZcO/DCNU6lEEtG5
	pdgfT2LkCDOIGCFaNawV6fnhOkw7o5WwStnicZqt/gawGTb2ZW0LRhYjHdsXgBW8fB3kcgVpmw1Qa
	U1XFWsswL+6fAOX87KQWBKq7e4/MAsLswjpiV49YpmdsvfK0m870l+A5JrFzPPxEf8jAwqxlz2Jnd
	BpDJJ1iV9quaVZtWpdIiX+4UtWEsMPEQqu41ZwAibJSEeXks9ntk+UIUtaOwnQYIZktD4hI+csDDJ
	fIZ3lK7v1/4Z2NAAjZtZedDu9qvtjSlzsh2Frgn81l1f3PtXgoEV1xopAWPfJVGpuxQ512225C2dI
	ogxHgi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22sP-0000000GnoQ-2Vu0;
	Thu, 03 Sep 2026 08:32:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22sL-0000000Gnnx-3BLZ;
	Thu, 03 Sep 2026 08:32:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED51E4E414E3;
	Thu,  3 Sep 2026 08:32:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCFBE602B8;
	Thu,  3 Sep 2026 08:32:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A82EF11C791C9;
	Thu,  3 Sep 2026 10:32:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788424364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IyZA+ecio8dgqAefqnzmsKi9pbcS8BSqqmIH/9UMq/w=;
	b=xmDQLfySV8a8MBc++crCZBbfP5E4IQF3AUhjAkH7pJHYZhs81ZtmJmArLA4/0O8f+u9NNp
	FWpMxYVhjvG/sV7K8d8kqYx9eRtJpUzkQjUsZaZDvImEOA8jVPrp3J+09KHvidWEIzThxF
	o1GzTpj7Pkbqd7EhjL1AlKn7+MAx6xryY0chcP9ouGvAQoS1UINYTI0NHO/ME5ZpDlAYWh
	NkzB+AEvQrZvH16vItAtNer7BMLl6v5PVRRsoVuS22DK7K+Ldd0GQPFv3uTl3LlJViHMv8
	FVNgZAI0stK1y6Z4MGFkbsbDiuEJ+BxV2d/vgr1Bg3hCmBF3LstSmarP78PpuQ==
Message-ID: <0dec5462-f6d5-4ef9-9d02-5fdf7f3090a0@bootlin.com>
Date: Thu, 3 Sep 2026 10:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 01/10] net: stmmac: move XPCS lifetime
 management to platform drivers
To: Coia Prant <coiaprant@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org
References: <20260901150111.141037-1-coiaprant@gmail.com>
 <20260901150111.141037-2-coiaprant@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260901150111.141037-2-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_013249_943585_24FC059F 
X-CRM114-Status: GOOD (  31.39  )
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

Hi again,

On 9/1/26 17:01, Coia Prant wrote:
> The current XPCS creation logic in stmmac_pcs_setup() is problematic
> for several reasons.
> 
> First, if a device tree specifies a "pcs-handle" but no select_pcs()
> callback is provided by the platform driver, the created XPCS is never
> used. The phylink framework requires select_pcs() to actually return
> the PCS to the core, so the pcs-handle property becomes effectively
> useless without the matching callback. This is confusing for developers
> who expect that specifying a pcs-handle in their device tree should be
> sufficient to enable the PCS.
> 
> Second, and more critically, when stmmac_pcs_setup() fails to create
> an XPCS (either because no pcs-handle is present and no pcs_mask is
> configured), it falls through to the else branch and leaves
> priv->hw->xpcs as NULL. This will silently override any XPCS that a
> platform driver may have already set up during its own initialization,
> for example in a pcs_init() callback or during probe. The platform
> driver has no way to prevent this override because the common code
> runs unconditionally after the platform-specific initialization.
> 
> After commit 93f84152e4ae ("net: stmmac: clean up
> stmmac_mac_select_pcs()"), the common code no longer falls back to
> priv->hw->phylink_pcs if select_pcs() is not set. This change
> reinforces that each platform must manage its own PCS life cycle
> explicitly, but the XPCS creation code in stmmac_pcs_setup() was not
> updated to match this new expectation, leaving a gap where platform
> drivers have no clean way to take control of XPCS creation.
> 
> Address all of these issues by introducing pcs_init() and pcs_exit()
> callbacks in plat_stmmacenet_data. These callbacks give platform
> drivers full control over when and how the XPCS is created, configured,
> and destroyed. The common stmmac_pcs_setup() and stmmac_pcs_clean()
> functions are simplified to just call these callbacks, removing the
> confusing and error-prone XPCS creation logic from the common code.
> 
> Platforms that do not need an XPCS simply leave the callbacks as NULL
> and no change in behavior occurs. Platforms that do need an XPCS can
> now create it with the exact configuration they require, including
> wrapping it with custom phylink_pcs_ops when necessary.
> 
> Existing platform drivers (intel, rzn1, socfpga) are updated to use
> the new callbacks by moving their XPCS creation and cleanup logic into
> pcs_init() and pcs_exit(). In their pcs_exit() implementations, the
> pointer to the destroyed PCS is explicitly set to NULL to avoid
> dangling pointer references.
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 44 +++++++++++++++++--
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  7 ++-
>  .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  |  7 ++-
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  7 ++-
>  .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 37 +++-------------
>  5 files changed, 61 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index f5f9fa67ecd77..fd5f01c8941c1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -603,13 +603,47 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
>  	plat->mdio_bus_data->needs_reset = true;
>  }
>  
> +static int intel_mgbe_pcs_init(struct stmmac_priv *priv)
> +{
> +	struct fwnode_handle *devnode, *pcsnode;
> +	struct dw_xpcs *xpcs = NULL;
> +	int addr;
> +
> +	devnode = dev_fwnode(priv->device);
> +
> +	if (fwnode_property_present(devnode, "pcs-handle")) {
> +		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
> +		xpcs = xpcs_create_fwnode(pcsnode);
> +		fwnode_handle_put(pcsnode);
> +	} else {
> +		addr = ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
> +		xpcs = xpcs_create_mdiodev(priv->mii, addr);
> +	}

Sorry I had a second look at that after a good night's sleep, and actually here
we may regress. The original logic checked for "pcs-handle" presence, then
for the pcs mask, but if no PCS is found we didn't error out, we returned 0.

This is making it mandatory to have a PCS. Please handle gracefully the "there's no
PCS" case :(


Maxime


