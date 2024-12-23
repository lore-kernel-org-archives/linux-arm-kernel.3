Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C990E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jn/pZjekXbO1MZ2q+3QG7c8VYU/0V/edDBwXlWNf1VQ=; b=jXBqqWjDOikHzkR+nrNx1Wd0Hj
	jOkD5RIjxrRiDcgG+YwX50j0HJ7yOoJ9pMuQc9RQCZ8dgHTDqbjLtKHBR+PIbOhTnvzUYip9Yir2k
	Fbk+KoeOPhBk0/5zfiCh5P7d25iCXEaWH6qVP7f74+FE5tNPOZ5bHMS/QpZuaJno/87asNnzTf7Fm
	GmCbERX4z9Pk4Zvt9ebFKIAz92lg0GHNhV0dNRKZ4NXJlVzKvNXu5yaRkTIk0QLMbkUUW0up1ppS+
	/J7ExwMS/fdcz3UZ0XIMvnCmycCRB31FVSlatEJLJt/Uwa0M6VywOzwh/ZWDiHFVmYmPyJmC5su+b
	k3GgHItg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhax-00000009zjM-16yF;
	Mon, 23 Dec 2024 12:31:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhZl-00000009zeD-0xft;
	Mon, 23 Dec 2024 12:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52271A40CF1;
	Mon, 23 Dec 2024 12:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA429C4CED3;
	Mon, 23 Dec 2024 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734957019;
	bh=6nXbrL1gwIytwF5O4XWcHKIPCE3bZ8kGnps/owl0hCU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Nx6bZ0N7x9kx21ITNGRYUptWqADRtrtEc4CBIHp1Xvaxrr6eECiGHwPb3xejQFZaH
	 XxpAF9MuZFAqDe+xlJtkB9vH9AtesxBtCEckTZON9jjmenbNOlB3RbN2bh+pgJ2orJ
	 7hNt3RFqWznstdgwtEzvm0Tx335YFql2Vwn6ws8DfeqjpOZZ17SvCkLusIL8yZ3F0w
	 UDIBaDhZTiosKMOt+l49dUUliqaYavE80CtjMdwp0cSWH4fmv1nHpWj984tkUXDr6f
	 xU60eoVFgX3QPWuZ5L0zbkyNHYlX9Z4FiuUGntG7hPcvcsC4IFicjveCTieJx3nKwA
	 KKtMsrlNto5eQ==
Date: Mon, 23 Dec 2024 06:30:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, heiko@sntech.de, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Simon Xue <xxm@rock-chips.com>, 
 linux-rockchip@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
To: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20241223110637.3697974-3-kever.yang@rock-chips.com>
References: <20241223110637.3697974-1-kever.yang@rock-chips.com>
 <20241223110637.3697974-3-kever.yang@rock-chips.com>
Message-Id: <173495701750.480868.16123444058526675248.robh@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: PCI: dw: rockchip: Add rk3576
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_043021_352174_3E7395C1 
X-CRM114-Status: GOOD (  13.31  )
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


On Mon, 23 Dec 2024 19:06:32 +0800, Kever Yang wrote:
> rk3576 is using dwc controller, with msi interrupt directly to gic instead
> of to gic its, so
> - no its suport is required and the 'msi-map' is not need anymore,
> - a new 'msi' interrupt is needed.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v3:
> - Fix dtb check broken on rk3588
> - Update commit message
> 
> Changes in v2:
> - remove required 'msi-map'
> - add interrupt name 'msi'
> 
>  .../devicetree/bindings/pci/rockchip-dw-pcie-common.yaml      | 4 +++-
>  Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml   | 4 +---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml:85:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241223110637.3697974-3-kever.yang@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


