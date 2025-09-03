Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5AECA1010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=x3WyPe8tzcvkjPJMTuyLmMzJxuLJegDqZyREtGdOCyA=; b=iX96XEDpV/CNzz
	Iq5N1vyb7KVwqU0Znp/JgydXwNi4EjWXSooWLyLoPfWI3gAPRtgQQCxbPJSos4triq8aAxOeu1RoS
	6XRpAngSJFTyXRjWAlTj28sqF3X2UEcVeYEhK8R7A6/TEIvQerM9tt3nz7GTpYCciwxT3K4q28eev
	ergD40soT6UsmujBMDBG8wnNg+c3opNf1+hi5mw+rccv65fxZEIUyH+NQ/PQ1yjSnX6iHjk4aGylJ
	8cZZQmpmYleImyatSyNgWurgxdsHjb2+y1W6Big5hJZ8VqyCvZYzov9FZT7UHKzcwuSN2UgIASalp
	D4R2UVf3lkUHKety9u6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzRC-00000008FYL-0IAj;
	Thu, 04 Sep 2025 02:10:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utw1O-00000007nqT-2nO6;
	Wed, 03 Sep 2025 22:32:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 568336024F;
	Wed,  3 Sep 2025 22:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB75C4CEE7;
	Wed,  3 Sep 2025 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756938724;
	bh=0zNxbRiK/0aMy5wdBnW9WCgQpg46kf3uIF2gp8dwHmQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Nrz9NKhMC5qUarkd7J+XDkSpZDWKsfS09dlIk7Cm6jJKudqb+qGchlrAH1B3u2qBH
	 NxOy+gtbBuB6w0bqYYfEWi6QfniE4omkp5oXpUbC7VLbCjyLivl1eW2YWrxQSCgOQn
	 VgGPsYF3+fxTUZ6f1T5fgq3F9L1J6DD5DIIzMXE1D8K+S5CpeYQAtX21OXz4pK8HK3
	 ucbSC3pRXndnyQYZVRe5JXO5apjS3rw8iMp5mtKLM4kbwKatUSPZcMYOaY0aSJMEtt
	 hOUFxBzIzmltmb5JpiQmUMLEbEuVkvToIWP1FFS3F4jtQfq9Hm+T16ydICw5SgYNLz
	 oybtOg+x53FlA==
Date: Wed, 3 Sep 2025 17:32:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org,
	kishon@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 08/10] PCI: Add FMT and TYPE definition for TLP header
Message-ID: <20250903223202.GA1235935@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901055922.1553550-9-jacky_chou@aspeedtech.com>
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

On Mon, Sep 01, 2025 at 01:59:20PM +0800, Jacky Chou wrote:
> According to PCIe specification, add FMT and TYPE definition
> for TLP header.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/pci/pci.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 34f65d69662e..45d47d6c4f53 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -81,6 +81,18 @@ struct pcie_tlp_log;
>  #define PCIE_MSG_CODE_DEASSERT_INTC	0x26
>  #define PCIE_MSG_CODE_DEASSERT_INTD	0x27
>  
> +/* Format of TLP; PCIe r5.0, sec 2.2.1 */

Please update to PCIe r7.0.

> +#define PCIE_TLP_FMT_3DW_NO_DATA	0x00 /* 3DW header, no data */
> +#define PCIE_TLP_FMT_4DW_NO_DATA	0x01 /* 4DW header, no data */
> +#define PCIE_TLP_FMT_3DW_DATA		0x02 /* 3DW header, with data */
> +#define PCIE_TLP_FMT_4DW_DATA		0x03 /* 4DW header, with data */
> +
> +/* Type of TLP; PCIe r5.0, sec 2.2.1 */
> +#define PCIE_TLP_TYPE_CFG0_RD		0x04 /* Config Type 0 Read Request */
> +#define PCIE_TLP_TYPE_CFG0_WR		0x04 /* Config Type 0 Write Request */
> +#define PCIE_TLP_TYPE_CFG1_RD		0x05 /* Config Type 1 Read Request */
> +#define PCIE_TLP_TYPE_CFG1_WR		0x05 /* Config Type 1 Write Request */
> +
>  extern const unsigned char pcie_link_speed[];
>  extern bool pci_early_dump;
>  
> -- 
> 2.43.0
> 

