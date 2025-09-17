Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88000CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ORRWF3ehe06z2U8kPJ72pc4OuCoqDr1BGKeTAFsMnI=; b=4iyn5a6+CHvfSwoTOn2LXCXYpT
	8JlYAm7UqFuNI09vJ3mco1hI2AptRH3ULNBGQpvhCDkDEqz8fa/Kc7+OK4kdQJynrgXY0Zc6hXjXq
	EaB8lj0ZPe2ooeO292NH9ZIz+v02UiAm3MBywhUI/9rlBozR+3Tg5A8FSuGW8NJfYE68IPbpnlYUY
	Rz9dMtyMpwXCBm/PiVE+HQZtoAJjDSyRxJ+mvD/m2IdPz6aIzGQMXAbC61ndTcnh7vFvTpFRJ9OEV
	u7Cg8A8tRv79NJsopgTYujYHxHJsU7lI/IFozdpFhXlxrjtELHJIgBlfymUPwHZtiBnFetb/2vhwL
	JOt2TEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymTf-0000000ARtb-1Kkg;
	Wed, 17 Sep 2025 07:21:19 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymTc-0000000ARrU-2SF6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:21:17 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV5W1bycz9sxf;
	Wed, 17 Sep 2025 09:00:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11XSx90_uVxX; Wed, 17 Sep 2025 09:00:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV5W0cBKz9sxd;
	Wed, 17 Sep 2025 09:00:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D2F708B766;
	Wed, 17 Sep 2025 09:00:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fs-jRcZF6hG5; Wed, 17 Sep 2025 09:00:14 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BAFE8B763;
	Wed, 17 Sep 2025 09:00:13 +0200 (CEST)
Message-ID: <c7b767f3-168e-41dd-8c72-3d40f766c018@csgroup.eu>
Date: Wed, 17 Sep 2025 09:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 06/18] dt-bindings: net: dp83822: Deprecate
 ti,fiber-mode
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
 <20250909152617.119554-7-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-7-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_002116_788556_C41B0DD5 
X-CRM114-Status: GOOD (  12.36  )
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



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> The newly added ethernet-connector binding allows describing an Ethernet
> connector with greater precision, and in a more generic manner, than
> ti,fiber-mode. Deprecate this property.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   Documentation/devicetree/bindings/net/ti,dp83822.yaml | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,dp83822.yaml b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> index 28a0bddb9af9..dc6c50413a67 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> @@ -47,6 +47,9 @@ properties:
>          is disabled.
>          In fiber mode, auto-negotiation is disabled and the PHY can only work in
>          100base-fx (full and half duplex) modes.
> +       This property is deprecated, for details please refer to
> +       Documentation/devicetree/bindings/net/ethernet-connector.yaml
> +    deprecated: true
>   
>     rx-internal-delay-ps:
>       description: |
> @@ -141,7 +144,12 @@ examples:
>           tx-internal-delay-ps = <1>;
>           ti,gpio2-clk-out = "xi";
>           mac-termination-ohms = <43>;
> +        mdi {
> +          connector-0 {
> +            lanes = <1>;
> +            media = "BaseF";
> +          };
> +        };
>         };
>       };
> -
>   ...


