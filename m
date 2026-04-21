Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B433F94CA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ni1iBMzVYNVRR/bJsdX3ctQwuS8aUMtC/A2Fbuayo4k=; b=lheJqGc9xPMxTRXBiJE+fC059U
	00yiwvTp4qcLiRjJ7xx+khu8Ovcnnm4JzGgi0raq/rLBRMFUtepUgZk7qAT2s2E5dZY66Wrkyqxzh
	OpVqBA+lS2ba9FOJPOGS4cADBxgZqjr3PwVxluzXsDyOuIStoa/dWOEf9Gcdw7RnkAUPV+/zO3+JS
	VbiowJWvH6lJq36bnmBPnvuk6Ugr95lX78eXpGiQb5rC00x4XWMCurO0nPUvh7U4wiHy3VT4QSOyp
	g3rYOY3vBgDuaqFZ4m6PhA3xmf0kDvGPxigC/xPEnqj4bSfhAUGzgKk5q3scP+dn05mtjJF5RYCNc
	6qmRsRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFG0v-0000000935b-3iKV;
	Tue, 21 Apr 2026 18:40:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFG0s-0000000934j-3Ysc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:39:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 278E240144;
	Tue, 21 Apr 2026 18:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA0EC2BCB0;
	Tue, 21 Apr 2026 18:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776796798;
	bh=50mQHD7FkIRq1YWjICck6T5+Oufmi7QsAhgPHeR0pvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVpdSQ+RtzY6DXBIz5P+utA5Jm+7IvW1PJQT0HkIe/aJYAxaBs6mx5s7PC1H/eCxB
	 ikORpKU+Q5q4nBMfp1sFBgudE5UUmEDscUk7yz0HcDBbRxu/Ay1JridC4AKWyz16aC
	 44Qadg1bUgmus5YzYKdBb4gszgRrBK6hFXg/jwT2Kl51bCFQL44nfEVJ9d9VekL5ft
	 f7LuIifWK+dT8Rsll3YKDiRc8V2+EYyLn6JcXJTXz9usahPwOjSo/h41ryystRCAx7
	 uVlNZUwaZvV7BLC01XAAJUXzXL7YDQXDDbTUGYw/7PlgI7H8acD+u8h8awdRl2xnRW
	 3rhxJIhuN8cEA==
Date: Tue, 21 Apr 2026 13:39:55 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Message-ID: <20260421183955.GA1448377-robh@kernel.org>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-2-d72762253163@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-upstream_pinctrl-v7-2-d72762253163@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_113958_930212_DA8D8D18 
X-CRM114-Status: GOOD (  16.18  )
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

On Thu, Apr 16, 2026 at 03:29:44PM +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
> 
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
> 
> Disallow legacy child nodes that are not present on AST2700, including
> p2a-control and smp-memram. The latter is unnecessary as software can
> access the scratch registers via the SCU syscon.
> 
> Also allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU0, and add an example illustrating the SCU0 layout,
> including reserved-memory, interrupt controllers, and pinctrl.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 113 +++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> index a87f31fce019..215ff59b38ea 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> @@ -46,6 +46,17 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  memory-region:
> +    items:
> +      - description: Region mapped through the first SSP address window.
> +      - description: Region mapped through the second SSP address window.
> +      - description: Region mapped through the TSP address window.

blank line

> +  memory-region-names:
> +    items:
> +      - const: ssp-0
> +      - const: ssp-1
> +      - const: tsp
> +
>  patternProperties:
>    '^p2a-control@[0-9a-f]+$':
>      description: >
> @@ -87,6 +98,7 @@ patternProperties:
>              - aspeed,ast2400-pinctrl
>              - aspeed,ast2500-pinctrl
>              - aspeed,ast2600-pinctrl
> +            - aspeed,ast2700-soc0-pinctrl
>  
>      required:
>        - compatible
> @@ -156,6 +168,30 @@ required:
>    - '#clock-cells'
>    - '#reset-cells'
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: aspeed,ast2700-scu0
> +              - const: aspeed,ast2700-scu1

More simply expressed as:

contains:
  enum:
    - aspeed,ast2700-scu0
    - aspeed,ast2700-scu1


> +    then:
> +      patternProperties:
> +        '^p2a-control@[0-9a-f]+$': false
> +        '^smp-memram@[0-9a-f]+$': false

