Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29902C44514
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJr436MNWU4FHf0Qya4qCGFup/W4Zr7kdLcK7Wvawhs=; b=qIaij+2tlsZ8sNy+dntQFdFRd8
	J5xHsinfyieACZqcAn19UmU/xwJAAXysUbfdNkmqQmT3pfqNSC9Ad551kvdSe8IglGE/wT6JhAqYR
	Nw9W8md6qv9/Pa7Ao6KrQRJ+5XmSj6iD+ALqkKzxzi2O1e6D4WGzWJTALoqbBuveRZFKSsBBLdWXb
	AdjAnjn8ooPZrXRvfIVFeI4GWOCf3vmiiKpHiEsJeEkes2CYWsaTeSj0t0DCOmlVvTLOCRapGk8sM
	bzUnzFD6wDBfNc1IbnwiA+oRhFTV82lVK52fhxJbU8wlMhBE/se1uCqzzZdKP19rcaWb4YkbthCo4
	5hD/ZfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTmM-00000000f6t-10Ga;
	Thu, 16 Jul 2026 21:38:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTmL-00000000f6P-1lIH;
	Thu, 16 Jul 2026 21:38:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1A6D436EC;
	Thu, 16 Jul 2026 21:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A0D1F000E9;
	Thu, 16 Jul 2026 21:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784237880;
	bh=EJr436MNWU4FHf0Qya4qCGFup/W4Zr7kdLcK7Wvawhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nCRJStNDbJR4neX+mwEQgrUPfcgx8XRMSPTjJCOD09jm2uX+VTtGrJoSZFA1Gw+7l
	 ZC+AKoab13Hglb+GWzkJt3wQbWTqx+qeXy/FuklJHxOqskivfQbEL5BPhwIMlxbUIM
	 EkKVHcENsqzR827c9WnHB8mbjhjer7kwwQn2tCvpZBioS6MGA0cUFrcBDu3+Ln0D1D
	 EtE/tNqLqWr+zwbvaWLbMUeiGckbnNWQGg/ikw7j1ffr+GCgTxkPfoaTMuY7ZCpGKg
	 pWa5fYKVDQPsbHIfZqb46Um4w4NJR5Ls5tJxSk6VCEAdK/wmdTdxTvg5zC9c1HdRQ9
	 3kT1EvldR+xPQ==
Date: Thu, 16 Jul 2026 16:38:00 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: PCI: mediatek: Add support for optional
 perstout reset
Message-ID: <20260716213800.GA1472290-robh@kernel.org>
References: <20260708090533.19734-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708090533.19734-1-ansuelsmth@gmail.com>
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

On Wed, Jul 08, 2026 at 11:05:28AM +0200, Christian Marangi wrote:
> Airoha AN7583 have a dedicated reset for PCIe PERSTOUT. Add optional
> support for it in schema.

This is just the standard PCIe PERST# signal? Then it should be in the 
device that gets it or at least the RP node if the downstream device is 
not described. That is how we're handling perst-gpios in anything new.

Rob

