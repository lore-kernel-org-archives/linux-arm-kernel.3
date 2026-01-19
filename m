Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53133D29C43
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ey93INS060xp59cljOsib2mU2TZmeYKGtq0Zyyk7uA=; b=e3qIz4WEZi0iccXLd6Xe2mLG7x
	ovDN/EOXyB/HIHl44bOg3JQ4L4yyWkjBI5PEmc+lZJ4RGMfG8PhfVo9OQQRQoCzdZBzYOscIJZzHg
	3+IuAfYGT5QNVC9TFaBjN9iPqlXbgrvUJOffX72uA8tjtgqv9CHBGPdpflZp6/mJF7ZM+dDctapH6
	+grTggqwQvnKkSOxVFw/4CvlngFS8nkDnTeNLO83DaB3I0Lzi/EVXhhS5idxv4Ig/Zf8bpXt+xwm0
	AQ/rcD3twocuKVV6BGEHWxW4JeGq05QEuWpYU1Yo980sAZsroliVD5M3kDnENN0tR2RTyzOsYxt0Y
	p20h2fyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsVr-00000002Ywl-3NLc;
	Mon, 19 Jan 2026 16:53:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsVn-00000002YvE-45OM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8ey93INS060xp59cljOsib2mU2TZmeYKGtq0Zyyk7uA=; b=Ns5uPjYYuisNpWVl/jrQL0tvD8
	cOd0N10pBKJixWJsZknI3wkhlR9cBOsqKYFiHVmRk95ctFWOFmpBx0ebOLQaXpKr+195TgBprPNFw
	juh6rfEbZQf1oeXfAMn01hHZKRa1a7gUJ16x+YWv4n5eKqFRIjTb74yF8Ar1xp5Jzwq7w08uvNG46
	f3b8N1UYOWxLtVRYgnjHWYYKqJtL5n6jniLVn3qZ9xbvyflvT9LS5PnNXxkH2UszXNbPjlI8Dir49
	I4E7i+kg7BPwakblNXac1LlwR6CjRuE2vH1QvkWUBiBlwa9kVmshqbznOCEal18F1J0U5qJoP37Uw
	/BlXY7gw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsVj-0000000Capq-3miO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:53:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EE1F497;
	Mon, 19 Jan 2026 08:53:42 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC76C3F632;
	Mon, 19 Jan 2026 08:53:47 -0800 (PST)
Date: Mon, 19 Jan 2026 16:53:45 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, "Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
Message-ID: <aW5hmb9tyw1Gv388@pluto>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_165352_244408_FF0D848D 
X-CRM114-Status: GOOD (  22.67  )
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

On Sat, Jan 17, 2026 at 02:02:28AM +0100, Marek Vasut wrote:
> Document new property arm,no-completion-irq . This optional property
> is intended for hardware that does not generate completion interrupts
> and can be used to unconditionally enable forced polling mode of
> operation.
> 
> With this property set, such implementations which do not generate
> interrupts can be interacted with, until they are fixed to generate
> interrupts properly.
> 
> Note that, because the original base protocol exchange also requires
> some sort of completion mechanism, it is not possible to query SCMI
> itself for this property and it must be described in DT. While this
> does look a bit like policy, the SCMI provider is part of the
> hardware, hence DT.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: arm-scmi@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: s@mean@&t and limit poll transport to mailbox/shmem only
> V3: - Reformat the commit message, expand property description to
>       explicitly spell out this is hardware description.
>     - Rename property from arm,poll-transport to arm,no-completion-irq
> V4: - Update first paragraph of commit message and property description
>     - Add RB from Rob
> ---
>  .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index be817fd9cc34b..d06cca9273c48 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -146,6 +146,13 @@ properties:
>        this platform. If set, the value should be non-zero.
>      minimum: 1
>  
> +  arm,no-completion-irq:
> +    type: boolean
> +    description:

Shouldn't these two points have to be swapped as per Sudeep and Rob
suggestions ?

    description:
	....
    type: boolean

> +      This optional property is intended for hardware that does not generate
> +      completion interrupts and can be used to unconditionally enable forced
> +      polling mode of operation.
> +
>    arm,smc-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -379,6 +386,9 @@ then:
>      - shmem
>  
>  else:
> +  properties:
> +    arm,no-completion-irq: false
> +
>    if:
>      properties:

With the above corrected, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

