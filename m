Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4570CC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijg0/G4k3xh8Yw3bo8j+9+jAARDjxauQ+Z230AwZCwA=; b=mTiA3TWvbuBslMWEfqzC/9aJb4
	SV28XTx36N2wSHkJm7vyMTq/SVAMIitXZVto71ipNDxJHOgQQwhtkZKSRAgOMovsEhnhsAP3V97EV
	ZoyH/x9vgsHyIRdoxCz+MdEbGKvnXkLcavCHjpdvexJAn169J0n7Wf4bdK2oipJFAA4uhBkZzrXHJ
	xuVPqqt9M6Vu2XBsY6vOQAA9RM8T0cBiyF9q6xcLw9lmmcJgb5RW5gJRB8H8iNp5EUNnnqYlUJN6i
	+4C1ib4BBh1PO4hv0B7YQ91HZGcj4fMWOnXNd7ubwhCVj/jmrZXQCnsZizwsNbsSq7/xWYSpJ5mxv
	u0OeNIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzjt-00000008r6W-2ysY;
	Wed, 02 Jul 2025 15:51:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxV5-00000008SH4-48Ub
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 13:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ijg0/G4k3xh8Yw3bo8j+9+jAARDjxauQ+Z230AwZCwA=; b=lpcKZAqOtBvnNMuSbcrpm1Bdp5
	0/LQ42sLUQqjti/tnRHgPnmR51Rney+fGW5CPLmB5F6yvPHoWNinR1ehiLUQ1i0rT8bZEflgkqTCv
	t13KY1U3Rm/XZGweQEPsrRFCtxQINMDO/Iqh8a+c3IyLPc90lcYr8lDRPMCcU9G4lzG/Ixe0elXDN
	HaHC6RwgBO+OuM52JI36SN1erNCmOk+L12vwta3rdE1u2vwONWNoIn/jzOvRtLqJRVe1iUx7MWZX/
	rqPKUy8oEDZvQJFla/zlxuGcj+BOE2I5zM3gRsCB4w+au6996Ydj/l1n+u4jMZLYqsKvzPMXH7h5Z
	ZFcPLOVw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxV2-00000007Pcu-2fhq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7006945D34;
	Wed,  2 Jul 2025 13:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A598C4CEED;
	Wed,  2 Jul 2025 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462862;
	bh=slisvBvEmCIr7Kjcl8tWxBfosNKCVxrrtq3pQ2cJ8Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KZgZ3cCs8WlBsb/oRaNpWq+WQaDmMwVh0+ZxhVgdK2KHRbcyjZIQLgdCt9TtHSLXL
	 hlpbJQ5bmxBZJC/7wc+yPLLcSnkVyI8YRntTKhH727JPauseLBG2j549biE0vFYawm
	 Kp1TYqCD2/VckZNBVIUzMG+cUzoB2lVrw9I4RYagIotsPqMmCKY4B3J7P9T2yBZReY
	 ZripjSJsV75cz6igrXk1+ZLSkyFuXdMr+HhDq0rQsRB3v1PLgmVYgUQPx64LsoRjyo
	 ttBByorZMKPDjlxLNlyfCll1l91abFTnVJBlhDDuvTJDneXpFlMTdIb+RiGedb3bz1
	 vJAer7cDA6kIw==
Date: Wed, 2 Jul 2025 18:57:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 00/10] PCI: EP: Add RC-to-EP doorbell with platform
 MSI controller
Message-ID: <roskp2zsjohrgll464u4jtbulzjid523u3yvgciifwiuoygv5t@7f7cj4wfy2y7>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_142745_110113_2D57D0C2 
X-CRM114-Status: GOOD (  51.23  )
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

On Mon, Jun 09, 2025 at 12:34:12PM GMT, Frank Li wrote:
> ┌────────────┐   ┌───────────────────────────────────┐   ┌────────────────┐
> │            │   │                                   │   │                │
> │            │   │ PCI Endpoint                      │   │ PCI Host       │
> │            │   │                                   │   │                │
> │            │◄──┤ 1.platform_msi_domain_alloc_irqs()│   │                │
> │            │   │                                   │   │                │
> │ MSI        ├──►│ 2.write_msi_msg()                 ├──►├─BAR<n>         │
> │ Controller │   │   update doorbell register address│   │                │
> │            │   │   for BAR                         │   │                │
> │            │   │                                   │   │ 3. Write BAR<n>│
> │            │◄──┼───────────────────────────────────┼───┤                │
> │            │   │                                   │   │                │
> │            ├──►│ 4.Irq Handle                      │   │                │
> │            │   │                                   │   │                │
> │            │   │                                   │   │                │
> └────────────┘   └───────────────────────────────────┘   └────────────────┘
> 
> This patches based on old https://lore.kernel.org/imx/20221124055036.1630573-1-Frank.Li@nxp.com/
> 
> Original patch only target to vntb driver. But actually it is common
> method.
> 
> This patches add new API to pci-epf-core, so any EP driver can use it.
> 

Frank, thanks for your persistence in pushing this series, really appreciated!
I've left some comments, but no real blocker.

Unfortunately, I don't have access to my endpoint setup right now. So I'll go
ahead with the Tested-by tag from Niklas once my comments are addressed.

- Mani

> Previous v2 discussion here.
> https://lore.kernel.org/imx/20230911220920.1817033-1-Frank.Li@nxp.com/
> 
> Changes in v19:
> - irq part already in v6.16-rc1, only missed pcie/dts part
> - rebase to v6.16-rc1
> - update commit message for patch IMMUTABLE check.
> - Link to v18: https://lore.kernel.org/r/20250414-ep-msi-v18-0-f69b49917464@nxp.com
> 
> Changes in v18:
> - pci-ep.yaml: sort property order, fix maxvalue to 0x7ffff for msi-map-mask and
> iommu-map-mask
> - Link to v17: https://lore.kernel.org/r/20250407-ep-msi-v17-0-633ab45a31d0@nxp.com
> 
> Changes in v17:
> - move document part to pci-ep.yaml
> - Link to v16: https://lore.kernel.org/r/20250404-ep-msi-v16-0-d4919d68c0d0@nxp.com
> 
> Changes in v16:
> - remove arm64: dts: imx95-19x19-evk: Add PCIe1 endpoint function overlay file
> because there are better patches, which under review.
> - Add document for pcie-ep msi-map usage
> - other change to see each patch's change log
> About IMMUTABLE (No change for this part, tglx provide feedback)
> > - This IMMUTABLE thing serves no purpose, because you don't randomly
> >   plug this end-point block on any MSI controller. They come as part
> >   of an SoC.
> 
> "Yes and no. The problem is that the EP implementation is meant to be a
> generic library and while GIC-ITS guarantees immutability of the
> address/data pair after setup, there are architectures (x86, loongson,
> riscv) where the base MSI controller does not and immutability is only
> achieved when interrupt remapping is enabled. The latter can be disabled
> at boot-time and then the EP implementation becomes a lottery across
> affinity changes.
> 
> That was my concern about this library implementation and that's why I
> asked for a mechanism to ensure that the underlying irqdomain provides a
> immutable address/data pair.
> 
> So it does not matter for GIC-ITS, but in the larger picture it matters.
> 
> Thanks,
> 
>         tglx
> "
> 
> So it does not matter for GIC-ITS, but in the larger picture it matters.
> 
> - Link to v15: https://lore.kernel.org/r/20250211-ep-msi-v15-0-bcacc1f2b1a9@nxp.com
> 
> Changes in v15:
> - rebase to v6.14-rc1
> - fix build issue find by kernel test robot
> - Link to v14: https://lore.kernel.org/r/20250207-ep-msi-v14-0-9671b136f2b8@nxp.com
> 
> Changes in v14:
> Marc Zyngier raised concerns about adding DOMAIN_BUS_DEVICE_PCI_EP_MSI. As
> a result, the approach has been reverted to the v9 method. However, there
> are several improvements:
> 
> MSI now supports msi-map in addition to msi-parent.
>   - The struct device: id is used as the endpoint function (EPF) device
> identity to map to the stream ID (sideband information).
>   - The EPC device tree source (DTS) utilizes msi-map to provide such
> information.
>   - The EPF device's of_node is set to the EPC controller’s node. This
> approach is commonly used for multi-function device (MFD) platform child
> devices, allowing them to inherit properties from the MFD device’s DTS,
> such as reset-cells and gpio-cells. This method is well-suited for the
> current case, as the EPF is inherently created/binded to the EPC and
> should inherit the EPC’s DTS node properties.
> 
> Additionally:
> 
> Since the basic IMX95 LUT support has already been merged into the
> mainline, a DTS and driver increment patch is added to complete the
> solution. The patch is rebased onto the latest linux-next tree and
> aligned with the new pcitest framework.
> 
> - Link to v13: https://lore.kernel.org/r/20241218-ep-msi-v13-0-646e2192dc24@nxp.com
> 
> Changes in v13:
> - Change to use DOMAIN_BUS_PCI_DEVICE_EP_MSI
> - Change request id as  func | vfunc << 3
> - Remove IRQ_DOMAIN_MSI_IMMUTABLE
> 
> Thomas Gleixner:
> 
> I hope capture all your points in review comments. If missed, let me know.
> 
> - Link to v12: https://lore.kernel.org/r/20241211-ep-msi-v12-0-33d4532fa520@nxp.com
> 
> Changes in v12:
> - Change to use IRQ_DOMAIN_MSI_IMMUTABLE and add help function
> irq_domain_msi_is_immuatble().
> - split PCI: endpoint: pci-ep-msi: Add MSI address/data pair mutable check to 3 patches
> - Link to v11: https://lore.kernel.org/r/20241209-ep-msi-v11-0-7434fa8397bd@nxp.com
> 
> Changes in v11:
> - Change to use MSI_FLAG_MSG_IMMUTABLE
> - Link to v10: https://lore.kernel.org/r/20241204-ep-msi-v10-0-87c378dbcd6d@nxp.com
> 
> Changes in v10:
> 
> Thomas Gleixner:
> 	There are big change in pci-ep-msi.c. I am sure if go on the
> corrent path. The key improvement is remove only 1 function devices's
> limitation.
> 
> 	I use new patch for imutable check, which relative additional
> feature compared to base enablement patch.
> 
> - Remove patch Add msi_remove_device_irq_domain() in platform_device_msi_free_irqs_all()
> - Add new patch irqchip/gic-v3-its: Avoid overwriting msi_prepare callback if provided by msi_domain_info
> - Remove only support 1 endpoint function limiation.
> - Create one MSI domain for each endpoint function devices.
> - Use "msi-map" in pci ep controler node, instead of of msi-parent. first
> argument is
> 	(func_no << 8 | vfunc_no)
> 
> - Link to v9: https://lore.kernel.org/r/20241203-ep-msi-v9-0-a60dbc3f15dd@nxp.com
> 
> Changes in v9
> - Add patch platform-msi: Add msi_remove_device_irq_domain() in platform_device_msi_free_irqs_all()
> - Remove patch PCI: endpoint: Add pci_epc_get_fn() API for customizable filtering
> - Remove API pci_epf_align_inbound_addr_lo_hi
> - Move doorbell_alloc in to doorbell_enable function.
> - Link to v8: https://lore.kernel.org/r/20241116-ep-msi-v8-0-6f1f68ffd1bb@nxp.com
> 
> Changes in v8:
> - update helper function name to pci_epf_align_inbound_addr()
> - Link to v7: https://lore.kernel.org/r/20241114-ep-msi-v7-0-d4ac7aafbd2c@nxp.com
> 
> Changes in v7:
> - Add helper function pci_epf_align_addr();
> - Link to v6: https://lore.kernel.org/r/20241112-ep-msi-v6-0-45f9722e3c2a@nxp.com
> 
> Changes in v6:
> - change doorbell_addr to doorbell_offset
> - use round_down()
> - add Niklas's test by tag
> - rebase to pci/endpoint
> - Link to v5: https://lore.kernel.org/r/20241108-ep-msi-v5-0-a14951c0d007@nxp.com
> 
> Changes in v5:
> - Move request_irq to epf test function driver for more flexiable user case
> - Add fixed size bar handler
> - Some minor improvememtn to see each patches's changelog.
> - Link to v4: https://lore.kernel.org/r/20241031-ep-msi-v4-0-717da2d99b28@nxp.com
> 
> Changes in v4:
> - Remove patch genirq/msi: Add cleanup guard define for msi_lock_descs()/msi_unlock_descs()
> - Use new method to avoid compatible problem.
>   Add new command DOORBELL_ENABLE and DOORBELL_DISABLE.
>   pcitest -B send DOORBELL_ENABLE first, EP test function driver try to
> remap one of BAR_N (except test register bar) to ITS MSI MMIO space. Old
> driver don't support new command, so failure return, not side effect.
>   After test, DOORBELL_DISABLE command send out to recover original map, so
> pcitest bar test can pass as normal.
> - Other detail change see each patches's change log
> - Link to v3: https://lore.kernel.org/r/20241015-ep-msi-v3-0-cedc89a16c1a@nxp.com
> 
> Change from v2 to v3
> - Fixed manivannan's comments
> - Move common part to pci-ep-msi.c and pci-ep-msi.h
> - rebase to 6.12-rc1
> - use RevID to distingiush old version
> 
> mkdir /sys/kernel/config/pci_ep/functions/pci_epf_test/func1
> echo 16 > /sys/kernel/config/pci_ep/functions/pci_epf_test/func1/msi_interrupts
> echo 0x080c > /sys/kernel/config/pci_ep/functions/pci_epf_test/func1/deviceid
> echo 0x1957 > /sys/kernel/config/pci_ep/functions/pci_epf_test/func1/vendorid
> echo 1 > /sys/kernel/config/pci_ep/functions/pci_epf_test/func1/revid
> ^^^^^^ to enable platform msi support.
> ln -s /sys/kernel/config/pci_ep/functions/pci_epf_test/func1 /sys/kernel/config/pci_ep/controllers/4c380000.pcie-ep
> 
> - use new device ID, which identify support doorbell to avoid broken
> compatility.
> 
>     Enable doorbell support only for PCI_DEVICE_ID_IMX8_DB, while other devices
>     keep the same behavior as before.
> 
>            EP side             RC with old driver      RC with new driver
>     PCI_DEVICE_ID_IMX8_DB          no probe              doorbell enabled
>     Other device ID             doorbell disabled*       doorbell disabled*
> 
>     * Behavior remains unchanged.
> 
> Change from v1 to v2
> - Add missed patch for endpont/pci-epf-test.c
> - Move alloc and free to epc driver from epf.
> - Provide general help function for EPC driver to alloc platform msi irq.
> - Fixed manivannan's comments.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (10):
>       PCI: endpoint: Set ID and of_node for function driver
>       PCI: endpoint: Add RC-to-EP doorbell support using platform MSI controller
>       PCI: endpoint: pci-ep-msi: Add MSI address/data pair mutable check
>       PCI: endpoint: Add pci_epf_align_inbound_addr() helper for address alignment
>       PCI: endpoint: pci-epf-test: Add doorbell test support
>       misc: pci_endpoint_test: Add doorbell test case
>       selftests: pci_endpoint: Add doorbell test case
>       pci: imx6: Add helper function imx_pcie_add_lut_by_rid()
>       pci: imx6: Add LUT setting for MSI/IOMMU in Endpoint mode
>       arm64: dts: imx95: Add msi-map for pci-ep device
> 
>  arch/arm64/boot/dts/freescale/imx95.dtsi           |   1 +
>  drivers/misc/pci_endpoint_test.c                   |  82 ++++++++++++
>  drivers/pci/controller/dwc/pci-imx6.c              |  25 ++--
>  drivers/pci/endpoint/Makefile                      |   1 +
>  drivers/pci/endpoint/functions/pci-epf-test.c      | 142 +++++++++++++++++++++
>  drivers/pci/endpoint/pci-ep-msi.c                  |  90 +++++++++++++
>  drivers/pci/endpoint/pci-epf-core.c                |  48 +++++++
>  include/linux/pci-ep-msi.h                         |  28 ++++
>  include/linux/pci-epf.h                            |  21 +++
>  include/uapi/linux/pcitest.h                       |   1 +
>  .../selftests/pci_endpoint/pci_endpoint_test.c     |  28 ++++
>  11 files changed, 459 insertions(+), 8 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20241010-ep-msi-8b4cab33b1be
> 
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

