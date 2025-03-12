Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F7C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFkntQNWHxmiEjDTxQvLxHKmM7sLvNBerEp4BmEUJ+0=; b=13IvoQBeRLh5/Azs6hhj6sCZZw
	oqgAEmETBrp7hXySMupXHRYPesdo62BsxVlA1pi0rVc+3w8yy60qt+UJBY/+4VVLy1bJk1edIHYjC
	1hbhQ/A70u6FCad5T4IzMQBR+okWNdvW5qKzZW6HiJilfOPr+LkVXR+2nQOkmBK9Zq52vdbkadfuw
	1d5MoQdDqy/URHoiXQAhYHuoUGxFKajGWDqPq7dONdbijsHDpZE/PCLBIUkAxdzCGe6y6hdhH3vrw
	246SxwicSJyBlbrkzOyIaCG7WsHHKZlftjP/89al1as0vNXgoKPuj8XKvOGnxfk8pni1D5jajTi9U
	pFuRsDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNPz-00000008kbe-2kHh;
	Wed, 12 Mar 2025 14:50:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLxo-00000008XwW-1mu8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7B115C0E0E;
	Wed, 12 Mar 2025 13:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE87C4CEE3;
	Wed, 12 Mar 2025 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741785455;
	bh=q6dHWY/sgNPDiH0VHzYcttxpIZaPa92meReul5KP29Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OR5xSFxe1jq7JdfBvNZY3RH4RT2Rpt0GBysRIAKWCcgWDO/T0M9nGomYJsyKliHXf
	 zwYE2ek7UIs6azTnHoHuXIFXe5qcuNrX/4b3pId3eG7LH4hpAI0zETkDBPaBHmZiV8
	 6jlQ2lmmnqQ90aOnqy45rHUwE6yeTmVUSj8zDIXXfkzyK9FF0YKt1XIrizGjptW4VZ
	 YzbSWg995YF6M9BFPaCILQPrHoMdZEXr3qsNekjIlhRSrreKvGM/Vwr1neJYnamf8c
	 HeXzGOpZoUUaUWme2UmGz/s1f9HwxO/pemGX6mzhI8gFtbu9cC8PX9kWoFDLzKHkb9
	 GmqxPe2zq7lOw==
Date: Wed, 12 Mar 2025 08:17:34 -0500
From: Rob Herring <robh@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	git@amd.com, harini.katakam@amd.com
Subject: Re: [PATCH net-next V2 1/2] dt-bindings: net: xlnx,axi-ethernet:
 Modify descriptions and phy-mode value to support 2500base-X only
 configuration
Message-ID: <20250312131734.GA505165-robh@kernel.org>
References: <20250312095411.1392379-1-suraj.gupta2@amd.com>
 <20250312095411.1392379-2-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312095411.1392379-2-suraj.gupta2@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_061736_578524_B6CFA5BC 
X-CRM114-Status: GOOD (  18.45  )
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

On Wed, Mar 12, 2025 at 03:24:10PM +0530, Suraj Gupta wrote:
> AXI 1G/2.5G Ethernet subsystem supports 1G and 2.5G speeds. Modify
> existing binding description, pcs-handle description and add
> 2500base-x in phy-mode for 2500base-X only configuration.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  .../devicetree/bindings/net/xlnx,axi-ethernet.yaml       | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml b/Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml
> index fb02e579463c..977f55b98f31 100644
> --- a/Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml
> +++ b/Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml
> @@ -9,10 +9,12 @@ title: AXI 1G/2.5G Ethernet Subsystem
>  description: |
>    Also called  AXI 1G/2.5G Ethernet Subsystem, the xilinx axi ethernet IP core
>    provides connectivity to an external ethernet PHY supporting different
> -  interfaces: MII, GMII, RGMII, SGMII, 1000BaseX. It also includes two
> +  interfaces: MII, GMII, RGMII, SGMII, 1000BaseX and 2500BaseX. It also includes two

Please re-wrap at 80.

>    segments of memory for buffering TX and RX, as well as the capability of
>    offloading TX/RX checksum calculation off the processor.
>  
> +  AXI 2.5G MAC is incremental speed upgrade of AXI 1G and supports 2.5G speed.
> +
>    Management configuration is done through the AXI interface, while payload is
>    sent and received through means of an AXI DMA controller. This driver
>    includes the DMA driver code, so this driver is incompatible with AXI DMA
> @@ -62,6 +64,7 @@ properties:
>        - rgmii
>        - sgmii
>        - 1000base-x
> +      - 2500base-x
>  
>    xlnx,phy-type:
>      description:
> @@ -118,8 +121,8 @@ properties:
>      type: object
>  
>    pcs-handle:
> -    description: Phandle to the internal PCS/PMA PHY in SGMII or 1000Base-X
> -      modes, where "pcs-handle" should be used to point to the PCS/PMA PHY,
> +    description: Phandle to the internal PCS/PMA PHY in SGMII or 1000base-x/
> +      2500base-x modes, where "pcs-handle" should be used to point to the PCS/PMA PHY,

And here.

>        and "phy-handle" should point to an external PHY if exists.
>      maxItems: 1
>  
> -- 
> 2.25.1
> 

