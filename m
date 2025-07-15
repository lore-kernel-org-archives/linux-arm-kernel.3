Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8708C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0PiieK9xPE7f7RvZwq8oYFH6QE+456GzBNIaRwrnIaw=; b=W963kcQYkVr9JU
	mEKuEk1ZmpBoYed+hAvIG56i1/NfHUqbOGL0iqDhEUAMBDip8vsRp7UhxeQIUzQQp3ErxirJ787ke
	V9J6ClN0/XIQn+D77yFvCYJ/bBv4sfIWTdSWIfQPekBmQ5Z9KqD3HodFqTfoVSBmAuSDuF79ch8Dh
	dPR5cRgs8XSHQcAx3KNpYL0//JHpVD+/cWQ24mNmXwQfV6dwGDmPEmd3ocorZdT/KZ6uafJwgbfWp
	185qU+0Rr/hHtCOP432foeblncSlxhOx3eA4xahmJtZqiXA98QXEXG2aQMZbEuDmpTMO/M6Yi57Uy
	rbhx/VGEriIvaDJQgpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl7G-00000005yVY-3MiC;
	Tue, 15 Jul 2025 19:15:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhmt-00000005d78-3uwb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 15:41:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B35261465;
	Tue, 15 Jul 2025 15:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9445C4CEE3;
	Tue, 15 Jul 2025 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752594107;
	bh=5b56qrNXj/OfNJ271j1G/qJdm0poMtreLVVNIaR5qWg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=em5tJsihWZBOan5zIsQ+cSPCgN/Rzp4PaCrte3ake8mi3AWxsjrrCK82IG5RHPyd3
	 QNuI2jxfMyfWMgyviwYRD5CjVdfWzVtyF9fUoMjIPN4q8876pn6mtbVehydcJoUA4B
	 WUwoUbvxn6ip1JsTZTzJce5dAE+IYh9+ZgOBl3XzUfOlprqkrzlFDRLdGyINL/cJX1
	 KmGccngAWOPzR+MRfSAvKVgFTFM2L8FUVYtxkYAEds6vLp3H7gliyxIIQIfpYv8WY5
	 J/mLGzM5se86kFo2Q8RqS4AxPDLGe37gOLscWUJNDFq1gzFiNI0OhvEEEohYvd6R73
	 CSVVVH/eWhvNQ==
Date: Tue, 15 Jul 2025 10:41:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 08/10] PCI: Add FMT and TYPE definition for TLP header
Message-ID: <20250715154145.GA2461632@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715034320.2553837-9-jacky_chou@aspeedtech.com>
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

On Tue, Jul 15, 2025 at 11:43:18AM +0800, Jacky Chou wrote:
> According to PCIe specification, add FMT and TYPE definition
> for TLP header. And also add macro to combine FMT and TYPE to
> 1 byte.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  include/uapi/linux/pci_regs.h | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

I don't think these definitions are relevant to uapi users, so they
could go in drivers/pci/pci.h, similar to the existing PCIE_MSG_*
definitions.

Please follow the style of PCIE_MSG_*, including the brief spec
citations and /* */ comments.

Not sure we need *all* of these; it looks like you only use:

  PCI_TLP_TYPE_CFG0_RD
  PCI_TLP_TYPE_CFG0_WR
  PCI_TLP_TYPE_CFG1_RD
  PCI_TLP_TYPE_CFG1_WR
  PCI_TLP_FMT_3DW_NO_DATA
  PCI_TLP_FMT_3DW_DATA

> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index a3a3e942dedf..700b915e00f5 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -1230,4 +1230,36 @@
>  #define PCI_DVSEC_CXL_PORT_CTL				0x0c
>  #define PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR		0x00000001
>  
> +/* Fmt[2:0] encoding for TLP Header */
> +#define PCI_TLP_FMT_3DW_NO_DATA		0x0  // 3DW header, no data
> +#define PCI_TLP_FMT_4DW_NO_DATA		0x1  // 4DW header, no data
> +#define PCI_TLP_FMT_3DW_DATA		0x2  // 3DW header, with data
> +#define PCI_TLP_FMT_4DW_DATA		0x3  // 4DW header, with data
> +#define PCI_TLP_FMT_PREFIX		0x4  // Prefix header
> +
> +/* Type[4:0] encoding for TLP Header */
> +#define PCI_TLP_TYPE_MEM_RD		0x00 // Memory Read Request
> +#define PCI_TLP_TYPE_MEM_RDLK		0x01 // Memory Read Lock Request
> +#define PCI_TLP_TYPE_MEM_WR		0x00 // Memory Write Request (Fmt must be with data)
> +#define PCI_TLP_TYPE_IO_RD		0x02 // IO Read Request
> +#define PCI_TLP_TYPE_IO_WR		0x02 // IO Write Request (Fmt must be with data)
> +#define PCI_TLP_TYPE_CFG0_RD		0x04 // Config Type 0 Read Request
> +#define PCI_TLP_TYPE_CFG0_WR		0x04 // Config Type 0 Write Request (Fmt must be with data)
> +#define PCI_TLP_TYPE_CFG1_RD		0x05 // Config Type 1 Read Request
> +#define PCI_TLP_TYPE_CFG1_WR		0x05 // Config Type 1 Write Request (Fmt must be with data)
> +#define PCI_TLP_TYPE_MSG		0x10 // Message Request (see routing field)
> +#define PCI_TLP_TYPE_MSGD		0x11 // Message Request with Data (see routing field)
> +#define PCI_TLP_TYPE_CPL		0x0A // Completion without Data
> +#define PCI_TLP_TYPE_CPLD		0x0A // Completion with Data (Fmt must be with data)
> +#define PCI_TLP_TYPE_CPLLCK		0x0B // Completion Locked
> +#define PCI_TLP_TYPE_CPLDLCK		0x0B // Completion with Data Locked (Fmt must be with data)
> +#define PCI_TLP_TYPE_FETCH_ADD		0x0C // Fetch and Add AtomicOp Request
> +#define PCI_TLP_TYPE_SWAP		0x0D // Unconditional Swap AtomicOp Request
> +#define PCI_TLP_TYPE_CMP_SWAP		0x0E // Compare and Swap AtomicOp Request
> +#define PCI_TLP_TYPE_LOCAL_PREFIX	0x00 // Local TLP Prefix (Fmt = 0x4)
> +#define PCI_TLP_TYPE_E2E_PREFIX		0x10 // End-to-End TLP Prefix (Fmt = 0x4)
> +
> +/* Macro to combine Fmt and Type into the 8-bit field */
> +#define PCIE_TLP_FMT_TYPE(fmt, type)   (((fmt) << 5) | ((type) & 0x1F))

This looks like it might be controller-specific and could go in
pcie-aspeed.c.

