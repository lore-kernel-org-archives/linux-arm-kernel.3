Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57E4D73E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLJbHIpUir3eGVK15CFVIyUaD+S3uj54VVCiyqBmyfg=; b=jNceCJC80EaFNnwe0kFDxg8/yk
	l5/A1ba4qzrl019VSmFpE7kamQM36f8k7/kfzDLGnKSbWRolcrzO+OCtrqeBiIaikwC5pDNUBt1Nj
	9gvNDKa3T2NmPgnh2NAxgXI93kD3IPDc2k3zwulCvot9sIEN33aM7mGlVnZBDZLu80BZl125SKXNo
	LWbqRiGoESp+BE3XkMOkRceKYUF5w8BS2d4EnzYEoRFrjVpsqTYnL+CDUNJQpr3ZD9qZSht4+IV6O
	oFpYOD/Nfp/EWFknlZhWAtvNbYz+9Uya1FBYSuoPhcpr0z0KWUreofygLpEo/hFMVfcJ9dwwbgrL3
	0sys7i6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWU9-00000000UR9-41cL;
	Thu, 29 Jan 2026 18:11:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWU7-00000000UQf-1t0Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 18:11:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19C8244013;
	Thu, 29 Jan 2026 18:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D144CC4CEF7;
	Thu, 29 Jan 2026 18:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769710275;
	bh=3Au9COKP+vRsf+RlNddoz8B4QzP+leArD8miTuKlC1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gm2MrgTISL7NlkFAsK1t2vtt8JUCr14uepW9AgHCbfWVGiTdOZ7INDSBNzJrZKHGN
	 +5JXllxrpHZBd4m5KLFEQL9gxFceakknubpmtc00iVn1azvi0HVsjqSs17IW9t3f4q
	 z1adpmfG9ynlgkQqe9Nt5SB33ArDiJZaOf8KEiePWHOFjMqkMVXwo3/rmq86X/+nYt
	 JSSk4WFTYEBV6I7tI+o1ex5zBOXjfMv6pb73xd/Bk1FFJ6+88Qp6afDuLNxg9lLg5K
	 Wb//99Lgn2tdGhKVybVdKFaKCcf3PSib+eTeJRKjeizoijP9F+8kQ/smqftFe6IcLg
	 rVV3a2xELSS3w==
Date: Thu, 29 Jan 2026 12:11:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: mani@kernel.org, kwilczynski@kernel.org, shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	hongxing.zhu@nxp.com, linux-pci@vger.kernel.org, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, krzk+dt@kernel.org, frank.li@nxp.com,
	l.stach@pengutronix.de, lpieralisi@kernel.org, conor+dt@kernel.org,
	bhelgaas@google.com, s.hauer@pengutronix.de
Subject: Re: [PATCH V2 01/10] dt-bindings: PCI: fsl,imx6q-pcie: Add reset
 GPIO in Root Port node
Message-ID: <176971027369.1393650.10286669434894758293.robh@kernel.org>
References: <20260123021445.3782170-1-sherry.sun@nxp.com>
 <20260123021445.3782170-2-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123021445.3782170-2-sherry.sun@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_101115_504097_52B0D6C4 
X-CRM114-Status: GOOD (  10.85  )
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


On Fri, 23 Jan 2026 10:14:36 +0800, Sherry Sun wrote:
> Update fsl,imx6q-pcie.yaml to include the standard reset-gpios property
> for the Root Port node.
> 
> The reset-gpios property is already defined in pci-bus-common.yaml for
> PERST#, so use it instead of the local reset-gpio property. Keep the
> existing reset-gpio property in the bridge node for backward
> compatibility, but mark it as deprecated.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


