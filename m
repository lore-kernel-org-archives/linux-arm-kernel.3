Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0136AE94627
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 02:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2A6Z+4V54PUBGvJkvXTcDCp1//Xt/2lpbnfpRZwod4=; b=JR/fKeEAZJ/AcvZZqcexvCI3Lg
	Pe4fdG6j/GdvlfHXS13Y3HVHJiCSEa+FgqfrPxx6iKS9jyE0sYFYbPhm4Pr/izohzyRQSPCcl/sZZ
	jcFrHnAH0vnm3auu+mk8lD+0KCHoDKtZaj7gGUs98zlBMycmkpLXsVzkiuObAXhBIB/iBVVT+MY5C
	u0F0GTcCaFMh/5qs/XHYYEaTarGTpCxuaiLkcTzA3/YwGqQ3ekdcOkvg46q3zatPCNvStp3pZ/s7S
	xH7OO8aDKNEHc/Y6yHvgLXHfd1KH3NbzsE0/N3PQghaZSgs9ct0kXBhtuWYnbPF+YQg4s3pRh1RZb
	w9R1zezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdQx-0000000GKO5-3dUC;
	Tue, 10 Feb 2026 02:24:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdQw-0000000GKNj-0NUc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 02:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69FC342A3D;
	Tue, 10 Feb 2026 02:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D93AC116C6;
	Tue, 10 Feb 2026 02:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770690297;
	bh=qvzkgIsUupXyFBmx94KHEIrSTpQoQW9SEGt5veYFylE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpUfiCWNb0vIktuuKWDP6Fl3XWl+f+zThcHDJq4SLtV6wjdRsodxX3StIrah3IjVS
	 lLyr/fNF07JG/tVAe3JyNDP2l68nIHnCI29Y73uRuwfYi/M1xI/P4IOUx4WzRgu20e
	 8jNRqleE6NsTtCQbEAkUggssnnhuL5fDWEq36grrGmUiivUIYhJzVTaEfMQor9D1ut
	 +zXBzGcxexfCOSQcM5MCcLZJu3Sfrp6XkU80bj3OHmkI8Bbx0cDfu0RfDDNa6hfqC7
	 NeozwEYjDFXg8tQA+dE3mf1zu4yfP9Mx3c1BLVHy3pSVSnIFKIsRNnjpLlyOiP1c7I
	 uvZYNzwPcyA2w==
Date: Mon, 9 Feb 2026 20:24:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: introduce nxp,imx-dwc3
Message-ID: <177069029377.2355609.7155450591040552968.robh@kernel.org>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-1-ebd9b9b77049@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-1-ebd9b9b77049@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_182458_152797_D68B1797 
X-CRM114-Status: GOOD (  11.25  )
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


On Fri, 06 Feb 2026 18:18:49 +0800, Xu Yang wrote:
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-child
> relation. The new binding is used to describe flattened usb controller
> node. It's a copy of the legacy binding fsl,imx8mp-dwc3.yaml with the
> needed modifications.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v3:
>  - rename file name as nxp,imx-dwc3.yaml
>  - rename compatible as nxp,imx*-dwc3
>  - remove status property in example node
>  - remove select block
>  - modify commit message
> Changes in v2:
>  - reorder compatible property
> ---
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |   2 +
>  .../devicetree/bindings/usb/nxp,imx-dwc3.yaml      | 123 +++++++++++++++++++++
>  2 files changed, 125 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


