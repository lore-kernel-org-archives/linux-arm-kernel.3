Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DBFCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ngs2H5drVhSSsY3k+1XuymWpnKLMqckm0fPB9uQ+rqU=; b=fU/HIO2wTiIL3XNLKgz5ONnU87
	cyVGItB3Qv6L3P84tZ8Mrwvhm1m9DiGXbNyJAASzc21uaXcOlcxn4nCAG9DWrnBox1Z8lsK3gInIi
	WpIztjjyMAZpivWjhx7UNjtjTQ/oJoGDYIgLj/sgFNDpaOjfJLuLl6DMmlUH0pYByaAq3FUfA/Ihq
	fAcooHK70KBQMFDAuGoA2N8qWLKNX6I4B6S70y8XA5F0J84MaJQjcBzbUTOCQw4/6B3kuUxCU25T/
	a93arc1MUdCDYBj5h77DUZAtI34hWQzVPHrRyg8k6pfOVz0bYp8dcNRO99cvLnqeCrCUG9rRNHz/M
	0iQ1OJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhbb-0000000DruK-2Omv;
	Tue, 13 Oct 2026 18:52:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhba-0000000Drtt-1kyI;
	Tue, 13 Oct 2026 18:52:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87949601FF;
	Tue, 13 Oct 2026 18:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF59A1F00898;
	Tue, 13 Oct 2026 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791917525;
	bh=Ngs2H5drVhSSsY3k+1XuymWpnKLMqckm0fPB9uQ+rqU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=izNyqB47eFZArRZRZNS7dTQBn7NwqycEpAbpoYBJgMJHm+NegzSQJJwS9MSZqK8ml
	 O/n/XnPby62gp/+ntCAkK7UK82X0JjnzHR46YNg4EAdRAyzA9ezr8+TmuN5FKEzBVr
	 omqTZ6m2XYVmBNVdBxfh/aj4Nf16K6MuR/0tBlTl7NNrDa0DSi3KoLSYOmjvbq20sG
	 1qzaP5hmeiCdwv+HFpK7Bk6xNdL17OPUR93hPZ96+DtT22aXWPU9BtrOcyHA9NFAkj
	 LDv543Ch+E5iEcLOjnjzHigokCbH7xyt9ftQHuTec+TrL9mxhxGQyTBVzsiz7Fib/3
	 MaqwfMaUWeA6g==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 10/10] PCI: dw-rockchip: Clear debug buffer before
 entering L2
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
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-10-fbabcca9921b@collabora.com>
References: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
 <20260908-rockchip-pcie-system-suspend-v6-10-fbabcca9921b@collabora.com>
Date: Wed, 14 Oct 2026 00:21:54 +0530
Message-Id: <179191751499.12828.9504625790909143778.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907; i=mani@kernel.org;
 h=from:subject:message-id; bh=lgEh/kHjjKO7vlCJXlboj9R2tBBVF0LjFp0XPpozdIc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqzn3N2W74pXFoa1XfcNm77M+sJBrelI12u1im6
 DOtwTHu2E+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas59zQAKCRBVnxHm/pHO
 9fCPCACKrsGNtItOmtzFMwfvK3S2OTHm0WlhE8B9Bq3QvNwVmHc4MWIAPWgpJJFErQkW+fKFsgS
 OK2nKjCZPQjX1E/GPEviJYaE6jDC21nZTcpEbw3LIKNt65fRGD9BQXrrYAZCC4/T4t+ebJq9elA
 7pKr9kuBovq6rM9zOu4mrf3VXtOy4ocOOnqJoJos1ocBaEr5KtoWUVpWmCFZiz1e4KeEZVEwp+8
 4QpTK3CNffdbl5DyM020BUhChR8dZai2ITRvgPaFK7Vrw5R5g4JpvMj424vp75+gj3wa3KVBWBm
 chKJnVneASzyRoDqKo9o5wqtmiTDxxjfHq7QVoecFMZviPI1
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
> Clear the debug buffer before entering the L2 state to ease debugging
> link training issues on resume.
> 

What is this debug buffer and what value does it provide?

> Cc: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index e675918ba184..a508f4fffd2a 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -77,6 +77,9 @@
>  #define  PCIE_CLKREQ_NOT_READY		FIELD_PREP_WM16(BIT(0), 0)
>  #define  PCIE_CLKREQ_PULL_DOWN		FIELD_PREP_WM16(GENMASK(13, 12), 1)
>  
> +/* General Debug Register */
> +#define PCIE_CLIENT_GENERAL_DEBUG	0x104
> +
>  /* RASDES TBA information */
>  #define PCIE_CLIENT_CDM_RASDES_TBA_INFO_CMN	0x154
>  #define  PCIE_CLIENT_CDM_RASDES_TBA_L1_1	BIT(4)
> @@ -1043,6 +1046,11 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
>  	return ret;
>  }
>  
> +static inline void rockchip_pcie_link_status_clear(struct rockchip_pcie *rockchip)

No inline in .c files, please.

> +{
> +	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_GENERAL_DEBUG, 0x0);
> +}
> +
>  static int rockchip_pcie_suspend(struct device *dev)
>  {
>  	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> @@ -1056,6 +1064,11 @@ static int rockchip_pcie_suspend(struct device *dev)
>  
>  	rockchip->intx = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_MASK_LEGACY);
>  
> +	/* All sub-devices are in D3hot by PCIe stack */
> +	dw_pcie_dbi_ro_wr_dis(pci);

I don't understand the code and the comment. Please explain.

- Mani


