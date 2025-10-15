Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C4BCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHXBuqaRnLu9UqsNLGv8ihfOtoiq+ld9+oH+hd8QAm4=; b=lu3Y0Ac5fqg6Qd9g4jYXKpeLLU
	YvlABmuXn5F4s0dk20vVEFFfUcjNcFrJaIPu+qIuL7tmqN5ehyJAwyohMNXbuMxNaUrz8jFsbMHLY
	D2xcmSfcClP17ureO8zRlwMLsRFOVtNRXZnBZ80PkYD0UMzamTJ1q3/glRM6DMiJ8yeHYz+jgKTgt
	E/ibLTGGp0tBRm/gBTijP9a6kEeyhGdGX7LXLbud5+kyX0QrJ4b7pHBuCg7B1DlKK+6S+c5Tyjx50
	AF3bk9kLXMDnxDX2CPDn+XblLpLNX+83d6KJX0ukUxmXKChrmGXGzifxA8BGtSos+IyOxaHJxSU5x
	EcdkNgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v922Z-00000001n0h-0nDW;
	Wed, 15 Oct 2025 13:59:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v922W-00000001n0G-060p;
	Wed, 15 Oct 2025 13:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7FC2416F1;
	Wed, 15 Oct 2025 13:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F20AC4CEF8;
	Wed, 15 Oct 2025 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760536779;
	bh=DwUHoZqWcYMyz1nussrz3FQ3Rsn+co8/zERGpsHFIEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9i78eep6JNFh+dgLuDlH5N5/XKr7p8sX9bdlHGb5p84TEWW/KHf6y4gPJ/+pSDAG
	 jX//HgZzYp7+gI4qlRNXZZHMTsK44rlSr6m4/q5mq6s1H86Ifo7126uS/LyyO8apTw
	 sV5uRoUjUJtIrz/1FdXmRQgBeOZ6w/mvj+ij6SRXuTKfait1Dz0CgjpIYJR033Yy79
	 B2CfEoZ2ilfxIDuJ5mHK7kW29ZvLTVTWhIJYAm7QvnXpSsr7GVoRXWGidQT2bPOc6X
	 0d5zfxS3obmsutrDBfpq6hEAsWba+gs+4IorVyAMbFH0XyW+pFGzPsHCx6KIpNNO98
	 +CQ6h501WN8SA==
Date: Wed, 15 Oct 2025 08:59:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, upstream@airoha.com,
	linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/5] dt-bindings: PCI: mediatek: Convert to YAML schema
Message-ID: <176053677610.3299416.10324456171470635844.robh@kernel.org>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
 <20251012205900.5948-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012205900.5948-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_065940_083296_3366FC35 
X-CRM114-Status: GOOD (  11.30  )
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


On Sun, 12 Oct 2025 22:56:56 +0200, Christian Marangi wrote:
> Convert the PCI mediatek Documentation to YAML schema to enable
> validation of the supported GEN1/2 Mediatek PCIe controller.
> 
> While converting, lots of cleanup were done from the .txt with better
> specifying what is supported by the various PCIe controller variant and
> drop of redundant info that are part of the standard PCIe Host Bridge
> schema.
> 
> To reduce schema complexity the .txt is split in 2 YAML, one for
> mt7623/mt2701 and the other for every other compatible.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/pci/mediatek-pcie-mt7623.yaml    | 164 +++++++++
>  .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ----------------
>  .../bindings/pci/mediatek-pcie.yaml           | 318 ++++++++++++++++++
>  3 files changed, 482 insertions(+), 289 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


