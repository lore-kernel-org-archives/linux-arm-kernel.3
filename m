Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881A7C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx9mdXP3XTnYGREHZQM7KH3I/4ZOVb5wZj75Qk9B47Y=; b=4SGqkX9tbNHsuRJ/mbl46q9KwN
	gqNq27a7Q+xiTaNpA/JnNdwKtSv3joEpJIInxQ0wNJg1YEUqLK8JKi+PFCzqN0polYmAU0WIWfMGe
	BCzjXEc8zBuB4fXH2liTgFV+zZoc9AJyMSKOlFP+zqm2THlIEA8DqirRyWMC944xU6ZmEiHo6/jKI
	mPBm9rZzmz4+t/GdwXVjbd9SxujMC1B2R4PCEuO/82J2s/Cf924mC/YBZp6hGyxWpKpLWVE45Tn+o
	cFGmebkbpY7JANNvk+PXBGTEk3x8vx7K2PhViIgLAP/0Rv3DeP6YI4hRNAPsgH8pAFBadyrXpsdKz
	6mGZt9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3EY-00000004fOw-0e5T;
	Tue, 08 Jul 2025 07:59:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35Y-00000004dL8-0TJX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8ED8B5C60FF;
	Tue,  8 Jul 2025 07:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B661EC4CEED;
	Tue,  8 Jul 2025 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961003;
	bh=XacCg/pWwY0SSi8ng2IgCqBPKaxCukK1XmMQWs135yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDdV7w3twz3NWsBoHo6KNql/vvPCHZe3XbFqCc1ZOPS8Ueze9S97eLF+LJh7Xe88/
	 3JM75pI782wgmDYJ6BUEhIbgtUp2/7xbZPw3K9180EAEt89kPIAeEcqJv8B1ze6WVZ
	 q/LoKNeeV4eb3zEH9eVKQf+fuHAb1P8dHjdapDqTJpfNsE/hs3tllMfu328o9PJTsJ
	 UgUS4CdDif74FHqsWC9S0xvJyg9dCjAMIowJHwLThkDmtp3cI9eV1rtUsnd4gFCpN6
	 UTRtHpvg0QGJ5yOBfYQKPgPr8jxAGJIZHurW1j1ZpA7PdlYPiMyKKov/pOJde+LbXW
	 aY2KQ9fu3FQBQ==
Date: Tue, 8 Jul 2025 09:50:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, horms@kernel.org, 
	jacob.e.keller@intel.com, u.kleine-koenig@baylibre.com, hkallweit1@gmail.com, 
	BMC-SW@aspeedtech.com
Subject: Re: [net-next v3 1/4] dt-bindings: net: ftgmac100: Add resets
 property
Message-ID: <20250708-termite-of-legal-imagination-826a9d@krzk-bin>
References: <20250708065544.201896-1-jacky_chou@aspeedtech.com>
 <20250708065544.201896-2-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708065544.201896-2-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005004_192203_124984BA 
X-CRM114-Status: GOOD (  14.81  )
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

On Tue, Jul 08, 2025 at 02:55:41PM +0800, Jacky Chou wrote:
> Add optional resets property for Aspeed SoCs to reset the MAC and

s/Aspeed SoCs/Aspeed AST2600 SoCs/

> RGMII/RMII.

... because ? It was missing? Incomplete? You changed hardware?

Make the commits useful, explain WHY you are doing, not repeating WHAT
you are doing. What is obvious from the diff. You already got this
feedback with other patches.

> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/net/faraday,ftgmac100.yaml       | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index 55d6a8379025..a2e7d439074a 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Faraday Technology FTGMAC100 gigabit ethernet controller
>  
> -allOf:
> -  - $ref: ethernet-controller.yaml#
> -
>  maintainers:
>    - Po-Yu Chuang <ratbert@faraday-tech.com>
>  
> @@ -35,6 +32,11 @@ properties:
>        - description: MAC IP clock
>        - description: RMII RCLK gate for AST2500/2600
>  
> +  resets:
> +    maxItems: 1
> +    description:
> +      Optional reset control for the MAC controller

Drop description, redundant and obvious form the schema. It cannot be a
reset for anything else than MAC controller, because this is the MAC
controller. It cannot be "non optional" because schema says it is
optional.

Write concise and USEFUL descriptions/commit messages, not just
something to satisfy line/patch count.

Best regards,
Krzysztof


