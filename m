Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D04E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 06:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+xPTo+WvRIpNk8h+xq8buhAx2Jn6O/6zVkIkwD39V4=; b=ideksp+HTDItoYzjRPQ1dermpW
	CaJQo0NXzmdAOc11HnWmC+06DdMm2qqFmS8m3WJZ3NjvLwCfId1pQayntm9VhEJhQMmWYqNrGWUrb
	dtmGapEqsdkTKkbNCrFpZs9wSQhsjjdn0/sFzjLbJ3w1T0z9mssND/nl0y5Ev9Frrs/awYsn4noF/
	bHpuWaDAa/3yRz5oFgRoUu1qRcnF8RS3WSwcc4+6K4kC69e1eDKtNbQGXCfxPvxBjyUQcHtdcb680
	npiU0sFP55uMp91MJ5ayhH+jdX77LhJkljfttbGniysn+x2WqLqYMliL1hizGN5wG6+uKsDvYmQzU
	01ZY8S+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPFe8-00000007uqS-0hbx;
	Sun, 22 Dec 2024 06:41:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPFcQ-00000007ue6-4457;
	Sun, 22 Dec 2024 06:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3B4EA405A9;
	Sun, 22 Dec 2024 06:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5982AC4CECD;
	Sun, 22 Dec 2024 06:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734849554;
	bh=nIOy5NCy3gDF4Qi+nRoagjQkpM+p9VfglSZHcEXfLYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3rrlRR9PQsPOivUhgeYNC0FseGfba6OJjMQHSF3zyLNJys2QlXAEpUmIn9E7jkWI
	 4BzgvZjLs7O2ZIyyUnw2YyxVEeBOLgG31jS0uP46ZUXz/+fPqvIAPzrcBuCedcOBWO
	 fvvHJLAnICDeUFdcEoqaXngpnLHerAkZR8My8HJG1w8Go0XHdgvs3cF0w2PwrJWFBs
	 upgkkP8pEDtQJsEReW26CLZtEQg6FxLuoi7fcJv5Nx5FdtGXcYP3YyZslRCUHudLpG
	 Dxyyhjpp8SAGIU+QLdHHVARKMwiiqi89ayuKs2y5ESTw6gj7eGnshnm90Yjy2PV5ve
	 rq9G3oRKr4O8A==
Date: Sun, 22 Dec 2024 07:39:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Simon Xue <xxm@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: PCI: dwc: rockchip: Add rk3576
 support
Message-ID: <n4iwrjmgtpetajccfsaz2nqv2g2of6md4moyus7vdwfcp6tgt2@4qe7qkvjrix2>
References: <20241220101551.3505917-1-kever.yang@rock-chips.com>
 <20241220101551.3505917-3-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220101551.3505917-3-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_223915_089872_638F5B5A 
X-CRM114-Status: GOOD (  13.99  )
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

On Fri, Dec 20, 2024 at 06:15:46PM +0800, Kever Yang wrote:
> rk3576 is using dwc controller, but use msi interrupt instead of its,
> so the msi-map is not required, and need to add a new 'msi' interrupt name.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2:
> - remove required 'msi-map'
> - add interrupt name 'msi'
> 
>  .../devicetree/bindings/pci/rockchip-dw-pcie-common.yaml      | 1 +
>  Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml   | 4 +---
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> index cc9adfc7611c..e5e1a2c7ae05 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> @@ -81,6 +81,7 @@ properties:
>        - const: msg
>        - const: legacy
>        - const: err
> +      - const: msi

ABI break without clear reasons.

Best regards,
Krzysztof


