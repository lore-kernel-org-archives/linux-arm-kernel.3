Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC71C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 19:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=897nWdDMR5s7sr3ZosjyTiM3i97guJ+Ngr+CJQ8f+1g=; b=SexWSKe8Sd0uHoBLLDNBBVECw0
	8eQGPLXpeYwELUM37Xsc3nawN+wIgohTiuiAdLHxmiLMMi6XTsLYQ7NnYu7Aqn6rNPipuJVfrU8uV
	m7LSkxx3O3lxcgk902Er1BjGwOpikJCb8M8uTsKZm1wJRvCrDL9VimOCKFXNwLipFv9Dx6ru1OPdu
	youQ5hMIsx1ELqTUjOUr4cK9GqDZNu2oS8GSa3SJHdxc73am77Fyaou0NYbs2noosGx5/eQspdYZY
	iHIno/gTByoqdLt2F5YIHW4Xwju0EIMs0EPR4vNo+X5dXfXRzEKIuw9XPOWpv9A4PaMLtoJFG+obw
	6lht+TiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGj8-0000000GYG0-0DCB;
	Thu, 05 Jun 2025 19:58:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGgy-0000000GY3E-2v68;
	Thu, 05 Jun 2025 19:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1188844363;
	Thu,  5 Jun 2025 19:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47A9C4CEE7;
	Thu,  5 Jun 2025 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749153359;
	bh=wYtujNZwrORBCml224vf1c045Haw3Rm1isqHefy1T1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVXFmX60Jk5VMgy/abCJ8UhgesIewd9czM3aEeMdI13hTpT/Z6fM8m5QMkugX/Z0Q
	 0mMEntK83i2kUMlFY0l/ajqLq5mmhSIZ4BWnB1qKDkT3iTxMMygeRFYxgDyyzgFWe1
	 Q3QQMB1j71mwunm6ktI3JZ7dxns3b+1AoyJ7Lpcm6C3a6R11HDxDWmXxXivNOvLV8I
	 UhZZrc1gtulmwZn2UOZku17pxNh70+wi+9jWCakID0I5i/uyZczBtnaGj/GAJ4HxA0
	 gh0eFyv1DJ7T7+QzfF7rDTsoQXuRJyvDbDX9Mu3YIDByv9xq1t/qAgM+7qPUXTyY3y
	 OXRUN/H43733w==
Date: Thu, 5 Jun 2025 14:55:57 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
Message-ID: <20250605195557.GA3133706-robh@kernel.org>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
 <20250527222040.32000-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527222040.32000-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_125600_750414_4EE03328 
X-CRM114-Status: GOOD (  12.52  )
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

On Wed, May 28, 2025 at 12:20:37AM +0200, Christian Marangi wrote:
> Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> minor difference on some function group.
> 
> Make the PHY LEDs, pcie_reset and PCM SPI function dependent of the
> compatible and define the different group for AN7583.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../pinctrl/airoha,en7581-pinctrl.yaml        | 297 ++++++++++++------
>  1 file changed, 207 insertions(+), 90 deletions(-)

I think this should be a separate file because the condition parts are 
so big.

Rob

