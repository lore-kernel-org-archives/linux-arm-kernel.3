Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1F2FD374E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRDcAGIhNAmxUixDfMCD/YPDga7MErDQb4TaP1vYkkY=; b=HtYhRi+XA8cyfrOFhlqK67YWfL
	gariT/8m0e2FT8+B9oXlWtmATCoTnW8A9jQRl1hVD0EssO/YCBiR+ObDaDhtigAiFB9ei3D5nXUiV
	Is16iz56uUylV4JxzEckbJYB6s8EbU/RSWH5F4PiMDY5N0NDX+ZFcWLyk+4NpkiqlVpDvfwMUbFz4
	izCI+L9WQBHl9IkBfmdmqEP6XH8PRF15OTbwL1n+JJ2wDR1+bMgN7MU+vfXaTN4atXEr89oRAfbpv
	UbFOXUzJZ4gByIZ+0CO4fT0f23446G5uneWFaB5YyDzV29PQ6w/8VHA3XLD8XndEs7zCW2IyLLD6U
	Ejy093qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEnF-000000044hM-0eAV;
	Wed, 25 Feb 2026 13:19:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEnB-000000044fy-1JH3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 13:19:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E81D6432DE;
	Wed, 25 Feb 2026 13:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E71C116D0;
	Wed, 25 Feb 2026 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772025544;
	bh=5riuDhoRH89LPwoWwriVShczWVODF9iwBss2N5Jcg44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rotTWz+eL4ZazqHfyQ1TRb5+ivzSTKrvyxPSUUrUGXHIbAE0TOvU7cT0nrZtY+Bu3
	 uoCtzh+VAZvKkuRzWvrFHDZcm+tG8SPpAlOyMg6J+n3xGCiXdcsSiCoMEuIy8SIa0P
	 zE3zBle5o2aOqd3Z214PeDyjfdnB92ALBKktjf0ilvLaOf1vObFdhN8n6vRSyPDo5N
	 dULX/2tX5bxNL9AHr91IeXBqAx91FlXb5rt/Y/iSuvrNNREJiqdNsew+ozt9gL/Uel
	 5XdxiRbLSQGZXoOzGi9jtWSWZDWNCZqHhtDtCXtkNL1lKxh5VZOLMpIq3Oi0Kzjmin
	 MFZbq0EeBdwwg==
Date: Wed, 25 Feb 2026 18:48:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com, 
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 00/12] pci-imx6: Add support for parsing the reset
 property in new Root Port binding
Message-ID: <iswqrdkb6gcoa62wy2hf7zv4pdeafhvcijvvbqhg6lafphrpwc@cpghj7h6zf5s>
References: <20260225105523.748775-1-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225105523.748775-1-sherry.sun@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051905_394985_7037486C 
X-CRM114-Status: GOOD (  35.12  )
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

On Wed, Feb 25, 2026 at 06:55:11PM +0800, Sherry Sun wrote:
> This patch set adds support for parsing the reset property in new Root Port
> binding in pci-imx6 driver, similar to the implementation in the qcom pcie
> driver[1].
> 
> Also introduce generic helper functions to parse Root Port device tree
> nodes and extract common properties like reset GPIOs. This allows multiple
> PCI host controller drivers to share the same parsing logic.
> 
> Define struct pci_host_port to hold common Root Port properties
> (currently only reset GPIO descriptor) and add
> pci_host_common_parse_ports() to parse Root Port nodes from device tree.
> Also add the 'ports' list to struct pci_host_bridge for better maintain
> parsed Root Port information.
> 
> The plan is to add the wake-gpio property to the root port in subsequent
> patches. Also, the vpcie-supply property will be moved to the root port
> node later based on the refactoring patch set for the PCI pwrctrl
> framework[2]. 
> 
> The initial idea is to adopt the Manivannan’s recent PCIe M.2 KeyE
> connector support patch set[3] and PCI power control framework patches[2],
> and extend them to the pcie-imx6 driver. Since the new M.2/pwrctrl model is
> implemented based on Root Ports and requires the pwrctrl driver to bind to
> a Root Port device, we need to introduce a Root Port child node on i.MX
> boards that provide an M.2 connector.
> 
> To follow a more standardized DT structure, it also makes sense to move
> the reset-gpios and wake-gpios properties into the Root Port node. These
> signals logically belong to the Root Port rather than the host bridge,
> and placing them there aligns with the new M.2/pwrctrl model.
> 
> Regarding backward compatibility, as Frank suggested, I will not remove
> the old reset-gpio property from existing DTS files to avoid function
> break.
> 
> For new i.MX platforms — such as the upcoming i.MX952-evk will add
> vpcie-supply, reset-gpios, and wake-gpios directly under the Root Port
> node.
> Therefore, driver updates are needed to support both the legacy
> properties and the new standardized Root Port based layout.
> 
> [1] https://lore.kernel.org/linux-pci/20250702-perst-v5-0-920b3d1f6ee1@qti.qualcomm.com/
> [2] https://lore.kernel.org/linux-pci/20260115-pci-pwrctrl-rework-v5-0-9d26da3ce903@oss.qualcomm.com/
> [3] https://lore.kernel.org/linux-pci/20260112-pci-m2-e-v4-0-eff84d2c6d26@oss.qualcomm.com/
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>

Please do not send next version before closing or even giving a window.

- Mani

> ---
> Changes in V6:
> 1. Drop the pre-allocate pci_host_bridge struct changes in dw_pcie_host_init()
>    and imx_pcie_probe().
> 2. Parse Root Port nodes in dw_pcie_host_init() as Frank and Mani suggested.
> 3. Move the imx_pcie_parse_legacy_binding() from imx_pcie_probe() to
>    imx_pcie_host_init(), so that dw_pcie_host_init() parse Root Port first, if
>    no Root Port nodes were parsed(indicated by empty ports list), then parse
>    legacy binding.
> 4. Add device pointer parameter for pci_host_common_parse_ports().
> 5. Add NULL pointer check for reset gpio in imx_pcie_parse_legacy_binding().
> 
> Changes in V5:
> 1. Add the Root Port list(pci_host_port) to struct pci_host_bridge for better
>    maintain parsed Root Port information.
> 2. Delete the pci_host_common_delete_ports() as now the Root Port list in
>    pci_host_bridge can be cleared by pci_release_host_bridge_dev().
> 3. Change the common API pci_host_common_parse_ports() pass down struct
>    pci_host_bridge *. 
> 4. Modify dw_pcie_host_init() to allow drivers to pre-allocate pci_host_bridge
>    struct when needed.
> 5. Allocate bridge early in imx_pcie_probe() to parse Root Ports.
> 
> Changes in V4:
> 1. Add common helpers for parsing Root Port properties in pci-host-common.c in
>    patch#2.
> 2. Call common pci_host_common_parse_ports() and pci_host_common_delete_ports()
>    in pci-imx6 driver.
> 3. Use PCIE_T_PVPERL_MS and PCIE_RESET_CONFIG_WAIT_MS instead of magic number
>    100 in patch#3 as Manivannan suggested.
> 4. Use "PERST#" instead of "PCIe reset" for the reset gpio lable in patch#3.
> 
> Changes in V3:
> 1. Improve the patch#2 commit message as Frank suggested.
> 2. Add Reviewed-by tag for patch#1.
> 
> Changes in V2:
> 1. Improve the patch#1 commit message as Frank suggested.
> 2. Also mark the reset-gpio-active-high property as deprecated in
>    imx6q-pcie DT binding as Rob suggested.
> 3. The imx_pcie_delete_ports() has been moved up so that the
>    imx_pcie_parse_ports() can call this helper function in error handling.
> 4. Keep the old reset-gpio property in the host bridge node for the
>    existing dts files and add comments to avoid confusion.
> ---
> 
> Sherry Sun (12):
>   dt-bindings: PCI: fsl,imx6q-pcie: Add reset GPIO in Root Port node
>   PCI: host-generic: Add common helpers for parsing Root Port properties
>   PCI: dwc: Parse Root Port nodes in dw_pcie_host_init()
>   PCI: imx6: Add support for parsing the reset property in new Root Port
>     binding
>   arm: dts: imx6qdl: Add Root Port node and PERST property
>   arm: dts: imx6sx: Add Root Port node and PERST property
>   arm: dts: imx7d: Add Root Port node and PERST property
>   arm64: dts: imx8mm: Add Root Port node and PERST property
>   arm64: dts: imx8mp: Add Root Port node and PERST property
>   arm64: dts: imx8mq: Add Root Port node and PERST property
>   arm64: dts: imx8dxl/qm/qxp: Add Root Port node and PERST property
>   arm64: dts: imx95: Add Root Port node and PERST property
> 
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 32 ++++++++
>  .../arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  5 ++
>  arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        | 11 +++
>  .../arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |  5 ++
>  arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi     |  5 ++
>  arch/arm/boot/dts/nxp/imx/imx6sx.dtsi         | 11 +++
>  arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts       |  5 ++
>  arch/arm/boot/dts/nxp/imx/imx7d.dtsi          | 11 +++
>  .../boot/dts/freescale/imx8-ss-hsio.dtsi      | 11 +++
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts |  5 ++
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |  5 ++
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 11 +++
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  5 ++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 11 +++
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 10 +++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 22 ++++++
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 10 +++
>  .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    | 22 ++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  5 ++
>  .../boot/dts/freescale/imx95-15x15-evk.dts    |  5 ++
>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 10 +++
>  arch/arm64/boot/dts/freescale/imx95.dtsi      | 22 ++++++
>  drivers/pci/controller/dwc/pci-imx6.c         | 76 +++++++++++++++----
>  .../pci/controller/dwc/pcie-designware-host.c |  8 ++
>  drivers/pci/controller/pci-host-common.c      | 58 ++++++++++++++
>  drivers/pci/controller/pci-host-common.h      | 15 ++++
>  drivers/pci/probe.c                           |  2 +
>  include/linux/pci.h                           |  1 +
>  28 files changed, 384 insertions(+), 15 deletions(-)
> 
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

