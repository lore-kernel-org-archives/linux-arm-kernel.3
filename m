Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B341E81BC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7c5Iz36nXiOUw2znVHTn8jamtOl0QUFsP43IKfvjzog=; b=zdAl+nnA09gd2+eaDVV1ZJflYR
	jW3UnPRJS9DLI6BQ35ptxlkzYEXt3ccneXakYQfCqgyT690F7WxL3YQ25lGKkbqJ9hYLD3pal3XlS
	mf3QIo8zICmbbEvRCPH1SNkGAEQO/vWB5iAIWyF0oWrBnRA4cdT3t4bjFrBR9LFsYpmVbRaZpl40o
	hnxMMy9uMXqb/+rJ4+RHBoep2u6uXDu0+B5KVOSJldUBnTwcFMCDuL/G6WlfFQ5BeMHbthx1+SiIh
	b8QzU8H0HpV/BpEjy08nCv6ccWyGux0ckhhLlvKLeVhMEvGd9tzAyAK+795tZeGT5D3evds/j02lT
	YvtSLsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRDA-0000000FQlZ-3v6S;
	Mon, 09 Feb 2026 13:21:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRD6-0000000FQjB-1S3C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 13:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7c5Iz36nXiOUw2znVHTn8jamtOl0QUFsP43IKfvjzog=; b=xFmpSaJetZJzlzNkKcOMeOkfXO
	eXy91aPdFUZaE5lcIgjeONKcpRewpATzW8QU4rzHOiAiN75s+BepQBxInCSLBT2onPedGfcJOBrhG
	NpaSBIM86Jo5MED9Up9RbTEdf+aRkG1atB+NX7RvPMSS5maYvrTa0+n+B3bopD9nkzfM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vpRCn-006iwq-BF; Mon, 09 Feb 2026 14:21:33 +0100
Date: Mon, 9 Feb 2026 14:21:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: [PATCH v2 1/2] dt-bindings: ethernet: eswin: add clock sampling
 control
Message-ID: <7e593ede-59eb-4316-ab72-949a51c008c6@lunn.ch>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <20260209094801.909-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209094801.909-1-lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_052152_386389_168E6C2B 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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

> The rx-internal-delay-ps and tx-internal-delay-ps properties now use
> minimum and maximum constraints to reflect the actual hardware delay
> range (0-2400 ps) applied in 20 ps steps.


>    rx-internal-delay-ps:
> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +    minimum: 0
> +    maximum: 2400

       multipleOf: 20

Also, 2400 / 20 = 120. Is the real maximum 127 * 20 = 2540?

> @@ -111,17 +129,44 @@ examples:
>          interrupts = <61>;
>          interrupt-names = "macirq";
>          phy-mode = "rgmii-id";
> -        phy-handle = <&phy0>;
> +        phy-handle = <&gmac0_phy0>;
>          resets = <&reset 95>;
>          reset-names = "stmmaceth";
> +        rx-internal-delay-ps = <20>;
> +        tx-internal-delay-ps = <100>;

I would not include them in the example. You are going to get
developers blindly copying this into real DT. A well designed board
should not need delays.

	Andrew

