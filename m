Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C3BFF5110
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRAe76edn5rgzKV1xpngUtqPruglV0Iqw1VDwsXGNv8=; b=OVDOgJo7L3xksbhQLG62NoMhMj
	Z8mbTk0DPWS3yTKrol5Agwazcwn4T39MaiSsKFev7TJ/teABeIbN9KPIpbH83+zr7lD41/s9Io46W
	tx0BtUjafEsyzPJehUPt4PfJCxswyb9DKuG/y5ZheQQvzhYApw5xdbXQl5uOgO2bwHu/iqUlZsM3p
	V3rQW7qNiZ+T1DxTQTAW61/4+BvjN6y6DTaA2sJWHp4UIPrcnzlpf2iIMFxO/XPWgkqbY0hj1RhE4
	BxBHM9FqOF/wL7MDP3033pvIr2hskBWOgnHeEOCt7c0Usp9hSuw4ZEmSY55xAGxXQAxf+klM1xbWp
	OtzJbN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA94Z-00000006mMd-22Dz;
	Tue, 07 Apr 2026 16:14:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA94X-00000006mME-2bdr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:14:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E2114441C;
	Tue,  7 Apr 2026 16:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13B4C116C6;
	Tue,  7 Apr 2026 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578477;
	bh=no4UEZFQcYB0LKd9v3lZJDFUspSbil4sfM/5uLMFUEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXIKxyDg8FURhlgtTqowsilbqLkXsYuAZuqFYFabH7q74VuTTjAvFmqxNqrigBf63
	 rRDNOa89wXQBvJZ3oEA57XyewxylOZxKs38xDAGTaiqmj0/0LHbXBa/yTdN0Resa8b
	 GcnL1cJ832IIXHXIphQsF1WooppBcw0pBH9sRvsDylhROfDNssZzI/2wsq1nCu8JZ0
	 4QdvDnNetX76aLhQUnT9EPsbwk2GB+oDscNDni37HTQergtnXCjPp5pXHhH7jmB7uZ
	 hlBr2mXYmfpLyRQxPlORm+54m9IMCRgoeGyw+NB5yPd4bzamisojoJ4rjPRjRUC3RG
	 fhhrk+Fl18dRQ==
Date: Tue, 7 Apr 2026 11:14:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Piekos <michal.piekos@mmpsystems.pl>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: pinctrl: sun55i-a523: increase IRQ bank
 number
Message-ID: <177557847448.2708408.13454310555266452178.robh@kernel.org>
References: <20260323110151.2352832-1-andre.przywara@arm.com>
 <20260323110151.2352832-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323110151.2352832-4-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_091437_682796_1A334BFD 
X-CRM114-Status: GOOD (  15.54  )
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


On Mon, 23 Mar 2026 12:01:49 +0100, Andre Przywara wrote:
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so we
> need to increase the maximum number of interrupts per pin controller to 11,
> to be able to assign the correct interrupt number for each bank.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


