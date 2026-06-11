Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E280CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vzZhenHbPwepLaH1jkQZbPxGq+tZ5ZGXbuy3+e6Nifc=; b=FxeDajRrvH+NFI
	/33wkLpEYgHnAGeeVSVOSgbC0ZGZP1lVMy5yxixXZIxp+W7AH5Haw5e+0ytVD81YomDoefcBuzQyt
	doizJU4Rv4/kMaRC1XRrr1rn3hfQLnH1phVn0Z5nYJaVXR7krVMtvBNB6MGEkLAMb5Cfx7M329taD
	HWned3VVei0cAzyPZU2PH1uK/ROMToH60jsFfkP4yzXWUYWCOSDhPPEs+Q+GHA/dBA47BJc3r+WQs
	uych/bny9Yfvj/w4Gwv6RwSr3bjwFkRbrjnxmmzcPdGvs72b4g54P4lTnzFkW1G8kF2eBprj5eaHl
	qGTiDAOl8FvB98880Dag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi5c-00000009kHS-2H5r;
	Thu, 11 Jun 2026 16:17:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi5c-00000009kHH-0jNL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 16:17:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C410601DF;
	Thu, 11 Jun 2026 16:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BCE1F00893;
	Thu, 11 Jun 2026 16:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781194627;
	bh=vzZhenHbPwepLaH1jkQZbPxGq+tZ5ZGXbuy3+e6Nifc=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=OVWTFu/TSFSg3ELJDdAbFWDbM3Hi3TSeZBAet0Vz8UDsfS2ektb+YAEPPbmblPwgl
	 DaP6LK0Jv5gePb7DFx5uE/iMovoFan/dVPOtRNqvPnWnb4hckPobwj3ThuIBecXtYx
	 bNnuTlAH4OOh9zIN6Ialc5WjVVg7BJL0Jn8lSGXGEHXpP1OERyuyzKIgr7iC390ULw
	 WRe1d5T+9TM0no5xmVJ6ZUr1Ca7M9yIrZJYdK3i9oz31MF3AHvm9rPEZ0XEfDMR6Rr
	 E+0SA/LOnuK7tXPVC7zNwXlNElGaWfL6wuK84JCGkOO3Iko/rt05q8ToLPQMx0vO4g
	 f/f1k/l3o+f6g==
Date: Thu, 11 Jun 2026 11:17:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pci@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linusw@kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"moderated list:PCI DRIVER FOR MVEBU (Marvell Armada 370 and Ar...),linusw@kernel.org" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] PCI: mvebu: Use fixed-width interrupt masks
Message-ID: <20260611161705.GA486072@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526044016.1025613-1-rosenp@gmail.com>
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

On Mon, May 25, 2026 at 09:40:16PM -0700, Rosen Penev wrote:
> Use u32-typed BIT and GENMASK helpers for PCIe interrupt register
> masks.  This keeps inverted masks in the same width as the registers
> and avoids truncation warnings on 64-bit compile-test builds.
> 
> Fixes this and similar warnings:
> 
> drivers/pci/controller/pci-mvebu.c:316:21: error: implicit conversion from
> 'unsigned long' to 'u32' (aka 'unsigned int') changes value from
> 18446744069414584320 to 0 [-Werror,-Wconstant-conversion]
>   316 |         mvebu_writel(port, ~PCIE_INT_ALL_MASK, PCIE_INT_UNMASK_OFF);
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: remove sys_to_pcie change
>  drivers/pci/controller/pci-mvebu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
> index e568528bad85..f5a3f7370552 100644
> --- a/drivers/pci/controller/pci-mvebu.c
> +++ b/drivers/pci/controller/pci-mvebu.c
> @@ -57,9 +57,9 @@
>  #define PCIE_CONF_DATA_OFF	0x18fc
>  #define PCIE_INT_CAUSE_OFF	0x1900
>  #define PCIE_INT_UNMASK_OFF	0x1910
> -#define  PCIE_INT_INTX(i)		BIT(24+i)
> -#define  PCIE_INT_PM_PME		BIT(28)
> -#define  PCIE_INT_ALL_MASK		GENMASK(31, 0)
> +#define  PCIE_INT_INTX(i)		BIT_U32(24 + (i))
> +#define  PCIE_INT_PM_PME		BIT_U32(28)
> +#define  PCIE_INT_ALL_MASK		GENMASK_U32(31, 0)

This looks like something that could be an issue in dozens of drivers.
Is it?  If so, I'd prefer to fix them all at once in a single patch
instead of a slow trickle.

