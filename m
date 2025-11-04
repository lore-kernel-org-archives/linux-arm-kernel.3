Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1D6CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMrV0kkBUvcC2YSTxGrMfMhO1FmoKqVvwIgiTKba3Ko=; b=EaGp4UJ/fJ9O1GVUVYGMAcImaK
	Y938LwTvsYlNRNrxZV6q5OyBc6QeEohuPMYD4kdIUrxVLXpwN6yNKvs0tAcH2mLqrgJlVGGAWllUn
	6g72RU9BRTYePmsbZtLe5tJN43zKojPJm2NgHXl3hyH42ArNsCrkqh8KynoHyKgG5R1x1yZ4IiuKg
	hcVQ1YdW4SpMXmB4kWpUEZ/2ctvMxBtjjYwa4bB8ooxCEdZVy6GSPQTJaT6tdITwyBT6VgvG6KzAV
	U4TQbKd/ntUhPiRmwf89UJ7j6mjdmEq/sgO+ggC+hltL3tdQ/OIa5V1KbVWaqf6xqn2z1kScqeLZs
	0i+2Uskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCHl-0000000BPKe-2CUc;
	Tue, 04 Nov 2025 08:21:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCHl-0000000BPKT-065d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:21:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06354601F4;
	Tue,  4 Nov 2025 08:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB78C4CEF7;
	Tue,  4 Nov 2025 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762244429;
	bh=6jABtiP9twriCAafB7qhdYkC2NWk+AwMtjQZTn4C2Rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/UtMIYUTCw7UuAF9ifUV2bMlp41aMmcBIUBJORgkZB30LLHmuz5KXhEbbzN934YZ
	 GQhbh+pgeMaaScX3k5Osd9TsIcCBB97MDUtjBNcwPx/VGrSntzG9+96E7QGOZjzlFY
	 bgNFFIar+xKpx2US5yb1If682qFHgNMo/EXBhKSIHVSLgHrDhTCGc/qCmo9kecprat
	 3u4T/P2Qu0Bc83QpxNpHqVmkhIFEX+2KaHtsWYKUO/9gY2zu/iwIDLgxB9WiraWnDk
	 xQynuOYpwwzR9HH05orJUGrVbMH7tqbDr8fiNUIbilQ7Kpy6eaoh2IkY0uge3aR2eM
	 ErY0lNpemZBGA==
Date: Tue, 4 Nov 2025 09:20:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v3 0/4] Add AST2600 RGMII delay into ftgmac100
Message-ID: <20251104-dangerous-auk-of-order-6afab2@kuoka>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
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

On Mon, Nov 03, 2025 at 03:39:15PM +0800, Jacky Chou wrote:
> This patch series adds support for configuring RGMII internal delays for the
> Aspeed AST2600 FTGMAC100 Ethernet MACs. It introduces new compatible strings to
> distinguish between MAC0/1 and MAC2/3, as their delay chains and configuration
> units differ.
> The device tree bindings are updated to restrict the allowed phy-mode and delay
> properties for each MAC type. Corresponding changes are made to the device tree
> source files and the FTGMAC100 driver to support the new delay configuration.
> 
> Summary of changes:
> - dt-bindings: net: ftgmac100: Add conditional schema for AST2600 MAC0/1 and
>   MAC2/3, restrict delay properties, and require SCU phandle.
> - ARM: dts: aspeed-g6: Add ethernet aliases to indentify the index of
>   MAC.
> - ARM: dts: aspeed-ast2600-evb: Add new compatibles, scu handle and
>   rx/tx-internal-delay-ps properties and update phy-mode for MACs.
> - net: ftgmac100: Add driver support for configuring RGMII delay for AST2600
>   MACs via SCU.
> 
> This enables precise RGMII timing configuration for AST2600-based platforms,
> improving interoperability with various PHYs
> 
> ---
> v3:
>  - Add new item on compatible property for new compatible strings
>  - Remove the new compatible and scu handle of MAC from aspeed-g6.dtsi
>  - Add new compatible and scu handle to MAC node in
>    aspeed-ast2600-evb.dts
>  - Change all phy-mode of MACs to "rgmii-id"
>  - Keep "aspeed,ast2600-mac" compatible in ftgmac100.c and configure the
>    rgmii delay with "aspeed,ast2600-mac01" and "aspeed,ast2600-mac23"
> v2:
>  - added new compatible strings for MAC0/1 and MAC2/3
>  - updated device tree bindings to restrict phy-mode and delay properties
>  - refactored driver code to handle rgmii delay configuration

That's b4 managed change, so where are the lorelinks? Why are you
removing them?

Since you decided to drop them making it difficult for me to find
previous revisions, I will not bother to look at background of this
patchset to understand why you did that way and just NAK the binding.

Next time, make it easy for reviewers, not intentionally difficult.

Best regards,
Krzysztof


