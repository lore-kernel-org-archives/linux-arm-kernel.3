Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF94C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSnK+tGLzOWeekjL5TeeYdJemxI7tjGh7Q37W3QHv34=; b=mhcfnb4GkdqCxpaewHX/PGG80p
	ncTljmv6mNF+pr6L69rOy+q7UaEScDrO3gwvYRL/SVhMnWmLqEjoNhdT7y2RVc7LkAM+lH+47gSQL
	VOuxuc0vB8UrjdLSF2GLTKNByuywP0yU4zBeFilJ3qfVtmQs0U02UXqVPKC2Bcl4sZZRDzHf29F1w
	8g7eCHEj/eIh9uYNx5ewWT8x+4dR/FZN6ZGWTy+O+lxnsCPc8772kW7SEVj2DV1zQA6Vo+ekWI3be
	isys/JCccWJijRccJiBvBCQg8ZkKKD0PNMNugYSSaKICTA5zw8jhbSU0LzGMqdGTXWr8P/e2CgOEw
	PHqWqpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGWO-0000000Fq5Q-46yx;
	Fri, 27 Jun 2025 21:22:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGTY-0000000FpfH-0fg1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FC6345CA8;
	Fri, 27 Jun 2025 21:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D82C4CEE3;
	Fri, 27 Jun 2025 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059150;
	bh=DJo/Xw/Bqco4vBD6Mqkh+C8Ix5OPOEQ1fzty/x4dnyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQD4SIMFHjE7kHEjfbyq8Bv9jRE3HgswR1vZshITIExP2INHjVXbvpQjvn/cMhU2k
	 yTVaVahdRv/vWLPArfKV1XPJiIWWwt+HMY/k05nw4CuTX3XKYL5kepGomHutsXuOSF
	 elS3CPQ9zaP+SnJZrxHBFwvojxvhvz1y4eZw9bthfI5YTUl0ib81mTB6fGG+1yfR2h
	 6LSlcDATwYmPn5eJZItgVH3aUPfUqOSr9XCjhT2Z2QKNoE6gwEpcGSDm1cbKVpq5Aj
	 +KWf5WXxSOW/Q5iPVmQU+dzLty/ZZGeXxaLryvfb9alyGhPZLGbeU69ho8KIbpozyc
	 xsRljQdH2oBWg==
Date: Fri, 27 Jun 2025 16:19:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: usb: convert lpc32xx-udc.txt to yaml
 format
Message-ID: <175105914924.160757.6319015774337763114.robh@kernel.org>
References: <20250625214357.2620682-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625214357.2620682-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_141912_215823_6B4B54F9 
X-CRM114-Status: GOOD (  12.33  )
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


On Wed, 25 Jun 2025 17:43:53 -0400, Frank Li wrote:
> Convert lpc32xx-udc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lp32xx.dtsi.
> - remove usb-transceiver@2c at examples.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2
> - update commit message by add "additional changes"
> - add clocks to required list
> ---
>  .../devicetree/bindings/usb/lpc32xx-udc.txt   | 28 ----------
>  .../bindings/usb/nxp,lpc3220-udc.yaml         | 54 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/lpc32xx-udc.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/nxp,lpc3220-udc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


