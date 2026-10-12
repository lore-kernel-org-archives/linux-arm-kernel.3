Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2750CCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=h+gWx/IABU3vfuF4WLNZB9HmpNOUI9aLl9gcRzQY+ag=; b=wfiOtIpIvvxuap
	jb4ih3It4JwRky9W6ncg09PKI2lCnEDLtSdNyD7AujX5wLdGKp9BIsnAvrd0Yg9BKA/5gTYnGo91a
	c6U9o0A9+OMJrqNxq+EYMVPjamUfFuxw/9LeKk+DKjYPP4XYf5s8L9509oBYAWtGHAqClTXcLKPFp
	81p5+KuvUMmDcTLz3p4hiAEXlcYuW3E4dQNqTitK4yvlqZFgc8C2lAV1oVC7rMMSg/dhqQT6V0jcS
	aUMFwZ/zxFFs1iZNpewbq/Wl9c6pjLbWbAo3oUHOTuLiHbohpY0UdXi2D9ULtZeN7Uq8ldHcQrTFB
	ylnmEkH1Ca4zrjZfNAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGO0p-0000000BaYn-3A8M;
	Mon, 12 Oct 2026 21:56:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGO0o-0000000BaYa-3lAv;
	Mon, 12 Oct 2026 21:56:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4240240F19;
	Mon, 12 Oct 2026 21:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96C01F0089B;
	Mon, 12 Oct 2026 21:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791842210;
	bh=h+gWx/IABU3vfuF4WLNZB9HmpNOUI9aLl9gcRzQY+ag=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=NBi1Q1eTZ7MbGFGki1+4M8JBGZNAJnH4suS99EIigC2wNZE5oDgGtKsCev8hKl2W1
	 EL7FAZhjEYY8bENAp0UlZGxJQNJBAfutVc25w+L1VL9gmnT5gZ28ltTg+DhCrS6yNY
	 wDI5IwB7kyOXR0F9BjbHx5Nu4dldkGC39Nd0XwC+Wr4a8gCYXbbGzQIBS2ZosJb5Gc
	 x+U+4mJnfPEWsFrwPJZpj1ajy3DCsdNi+8M/DHPD7Lwz1IkQvyN7hGZ51IF7VqTK92
	 7nd68s9r4PsMcW3uwKN9jIJphjiN7qJK9GnzVz63GslJU2rick0UgD+obnczda6IpR
	 5kbEkHnHDuqpw==
Date: Mon, 12 Oct 2026 16:56:48 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: Update saved Max Payload Size in pcie_set_mps()
Message-ID: <20261012215648.GA1404779@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005124154.2190628-2-cassel@kernel.org>
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

On Mon, Oct 05, 2026 at 02:41:55PM +0200, Niklas Cassel wrote:
> pcie_set_mps() changes the Max Payload Size (MPS) in the Device Control
> register but leaves the copy saved by pci_save_state() alone, so the next
> pci_restore_state() puts back the old value.
> 
> The PCI core does change the MPS of devices whose state has already been
> saved: pci_configure_mps() reduces a Root Port's MPS when a device with a
> smaller MPS Supported is hot-added directly below it (commit 9f0e89359775
> ("PCI: Match Root Port's MPS to endpoint's MPSS as necessary")), and with
> "pci=pcie_bus_safe", pcie_bus_configure_settings() can do the same when
> pciehp calls it after a hot-add.  The Root Port's state was saved when it
> was added and again when portdrv probed it.
> 
> Since commit 3fc686d550f6 ("PCI/ERR: Add support for resetting the Root
> Ports in a platform-specific way"), pcibios_reset_secondary_bus() restores
> that saved state, without saving it first, after host->reset_root_port()
> has reset the Root Port, e.g. during AER recovery or on Link Down with the
> qcom and Rockchip DWC drivers.  The Root Port then goes back to the old,
> larger MPS while the device below it is restored to the smaller one, so
> the Root Port may send TLPs that the device treats as Malformed.
> 
> Update the saved copy of Device Control when pcie_set_mps() changes the
> MPS, like commit 909f7bf9b080 ("PCI: Update saved_config_space upon
> resource assignment") does for BARs.
> 
> Fixes: 3fc686d550f6 ("PCI/ERR: Add support for resetting the Root Ports in a platform-specific way")
> Assisted-by: LLM
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Applied to pci/mps for v7.4, thanks!

> ---
> This fix was originally sent out as part of my RFC series:
> https://lore.kernel.org/linux-pci/20260930145017.1356088-6-cassel@kernel.org/
> 
> But sending this fix as a separate patch, as the fix is really unrelated
> to the rest of the series, so it could be picked up independently.
> 
>  drivers/pci/pci.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8cc6a89130b5..f3b82eb7bfaf 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1736,6 +1736,24 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
>  	pcie_capability_write_word(dev, PCI_EXP_SLTCTL2, cap[i++]);
>  }
>  
> +/*
> + * Update the saved copy of the Device Control register after changing it, so
> + * that pci_restore_state() doesn't put back a stale value.  Device Control is
> + * the first register saved by pci_save_pcie_state().
> + */
> +static void pcie_update_saved_devctl(struct pci_dev *dev, u16 clear, u16 set)
> +{
> +	struct pci_cap_saved_state *save_state;
> +	u16 *devctl;
> +
> +	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_EXP);
> +	if (!save_state)
> +		return;
> +
> +	devctl = (u16 *)&save_state->cap.data[0];
> +	*devctl = (*devctl & ~clear) | set;
> +}
> +
>  static int pci_save_pcix_state(struct pci_dev *dev)
>  {
>  	int pos;
> @@ -5983,8 +6001,12 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
>  
>  	ret = pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
>  						  PCI_EXP_DEVCTL_PAYLOAD, v);
> +	if (ret)
> +		return pcibios_err_to_errno(ret);
>  
> -	return pcibios_err_to_errno(ret);
> +	pcie_update_saved_devctl(dev, PCI_EXP_DEVCTL_PAYLOAD, v);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(pcie_set_mps);
>  
> -- 
> 2.55.0
> 

