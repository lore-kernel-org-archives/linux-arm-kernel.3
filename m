Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F42606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 21:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=imAbYQWk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frurcEEY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iZPro0Zetz+CfLgJB9N6QxpD/1Z6TlyduqwjCEpWEDA=; b=imAbYQWkib6G8N9sHXwM/ldN3T
	hkHNis5QwHAapvGWF7cSFuzNkWQq8MPdrTsDNO72dFpa+6Tjf2oCH2ip9FORpq4o038+Xs9spbBsr
	hztpQI6FRVmRTekL0fFWWJmN34gXPa/PndkXlhj67oNZiCUJ5K28DULxDqYIqIw53LsHODSG9+Z3Y
	AYZWmd9eshoHy9UTb2Yi4in2FJie/Aw1zAqkJ6NYkk+YktgZdA19mThHaeHjqoI0Nge8xmVlgd1yB
	6w76AP/FJjsdZYtIOy4m58LkDj0Z5IxmclG49reboXyDPH46kSHjLRzLJPdkoqc8tMQ9q8KAalQ58
	q/TlbDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLp22-00000005oo7-3yIj;
	Tue, 27 Oct 2026 21:48:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLp22-00000005oo1-250n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 21:48:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5A7243F2F;
	Tue, 27 Oct 2026 21:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F37F1F01825;
	Tue, 27 Oct 2026 21:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793137713;
	bh=iZPro0Zetz+CfLgJB9N6QxpD/1Z6TlyduqwjCEpWEDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=frurcEEYXOjzDEHQAq29BDBpzxuur7lknBF06mjH2ouf6yf1jbsOG87mTDnHD9Iq9
	 FBvEbozbz7L6dTDak0dBzX4S333EiTHlQHphpv2Y/nqS0P+m6j6tidyznWz8feoifE
	 V6TCaEO/yhxN58AM8FtIfCVGwChnhXjJltgNlFDmyjtICbDgdGVs0Ik3U4fjlsdNRZ
	 PqwlsEjMIcYoJIZciLGWZM+nIV8w+uKqMUHouanS/pTrSQNjFE4JFN5AEJ9RRj0tHM
	 FGsHndDLwJXRZt67DVrhZLY4USBQs2T/dHJEZnkXlbLi4bGzDnAnt/6lkm+4EDlvM4
	 zVp+21+x0Natw==
Date: Tue, 27 Oct 2026 16:48:30 -0500
From: Rob Herring <robh@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	stefandoesinger@gmail.com, krzk@kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/24] dt-bindings: net: Add ZTE ZX279128S Ethernet
 switch
Message-ID: <20261027214830.GA1267186-robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-18-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-18-ghahramani.navid@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 08:20:57AM +0100, Navid Ghahremani wrote:
> Describe the switch, receive interrupt and per-port PHY modes and MAC
> addresses.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  .../bindings/net/zte,zx279128s-gmac.yaml      | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
> new file mode 100644
> index 0000000000..fcbdbafa76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/zte,zx279128s-gmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZTE zx279128s Ethernet switch
> +
> +maintainers:
> +  - Navid Ghahremani <ghahramani.navid@gmail.com>
> +
> +description:
> +  The ZTE zx279128s has a five-port gigabit Ethernet switch with a traffic
> +  manager, a buffer manager and a DMA engine that connects it to the CPU.
> +  Each port is described by a child node of ethernet-ports and becomes its
> +  own network interface, with the MAC address given in that node.
> +

Use the ethernet-switch.yaml schema here.

> +properties:
> +  compatible:
> +    const: zte,zx279128s-gmac
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: The traffic manager's interrupt, which signals frames
> +      received for the CPU.
> +
> +  ethernet-ports:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^port@[0-4]$":

ethernet-port is preferred for new bindings.

Rob

