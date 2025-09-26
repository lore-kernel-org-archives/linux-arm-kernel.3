Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2901CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 21:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeliLO8ZX90mVaMXxxRnYo//0RR0ygnkpRiTVxlGOsI=; b=dFxm8DtUAgm5A1VjdQMR+ImpHc
	dzAn7KOkB67nkOCu/zVobxlHxNFXHzG9a7V0YUzHTluigXs79UMDeqXbEVIdoY9WRK5jjShGTISQZ
	yriL7xixtwlTEUpf0fT8cQfLAIxmLWtUcn8ndIRiHJURc+XO3rhZeHP1J1T13hyfiqQlgwYt5z9tP
	rqErrN/dEUNPnb5SKIAFMlGKQhQW9qReTU9mKINJMoYiqa2+mhAbLXGp5DuPrJAihUUMhbwPnpRe5
	G71SI2NVzi9frkFvi27jAMU1aSAmEb92koF8nw+TZQK+G3KD4IUW1F05r28Q19y3gp8sE4uplfd3H
	++CDd3wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FmM-00000004aKQ-1RBU;
	Fri, 26 Sep 2025 21:14:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FmL-00000004aJJ-10wd;
	Fri, 26 Sep 2025 21:14:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD73361F79;
	Fri, 26 Sep 2025 21:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A175C4CEF4;
	Fri, 26 Sep 2025 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758921296;
	bh=WEqmaCU0BUDs5OjoAtWYAf0UL/AzG1dPeDjq72rC0sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XE4nCsRfeX1KRU9BbescvWUhEXzKjBfCTlQiq6RXU4SjCmO+CQ6EG7NOgkP2TF+fw
	 jsFFtzi37veH+wot+rXL5XNBcur565rL2r2nuiOEZXPduUvMNBslnqnrg0jC2sK9y1
	 auFrD1H9xCn/yrjBF5+c8a1lD8q6Kdozz+bu7kTuEZzg0lyoG7lmCWM+xkjh43xfkv
	 dvT2YloG43TShqbBJ22bTVF9QQRZkvYgx3l/gK3C74JvpJ8MmpulthRWQw7C69m3Es
	 j6EdGhc1d0p5ViH3czbtK09JFZN86sCYAupvTSlyYHoKGNdUQubXwgDO7voiOqqvtl
	 cfXXFL6YjDb7A==
Date: Fri, 26 Sep 2025 16:14:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, upstream@airoha.com,
	Ryder Lee <ryder.lee@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 Airoha AN7583
Message-ID: <175892129219.1571962.13823264512166648033.robh@kernel.org>
References: <20250925155330.6779-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925155330.6779-1-ansuelsmth@gmail.com>
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


On Thu, 25 Sep 2025 17:53:08 +0200, Christian Marangi wrote:
> Introduce Airoha AN7583 SoC compatible in mediatek-gen3 PCIe controller
> binding.
> 
> This differ from the Airoha EN7581 SoC by the fact that only one Gen3
> PCIe controller is present on the SoC.
> 
> The compatible have -gen3 tag as the Airoha AN7583 SoC have both GEN2
> and GEN3 PCIe controller and it's required to differentiate them as
> different schema are required for the 2 PCIe Controller variant.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> Changes v3:
> - Add review tag
> - Add comments for compatible inconsistency
> Changes v2:
> - Fix alphabetical order
> 
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


