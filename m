Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA5DCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmNyMES08hLl/lZo50ZMyOt0uk2s5aoOzzYmrsTy+X0=; b=zQxRtzGl6bgXBaAOXBiyntWKOx
	g1Hac1ShC9EaL64PCUNehhArBXrNirhtOKeJt6/fRRgnXc9oJNcAM1VYJhj1BHr0lhkQ2gSNDk73p
	cM9injdqbkjuXF57wqG1AHXvg1promhmUkeVyjV5NQTmcwICZzMtrN6w2t6fwq9iPzOF6vfY5zTbu
	LlL+FUoww3/pYtKLIXy/VObL9lyywfJl7JiXVIH5PtXd/nf7fX/u+vaxtDJemoSwCcAzC3LDxvM8j
	1XHb+C5DU9q4khC9WVzXOMxeyaMl9mpj8y3PffhJTJDDoeXxjXfJEZ6MYkbgOdiFvsQOdlEEXhWjd
	9AtfYpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94Va-00000002JJY-4BaA;
	Wed, 15 Oct 2025 16:37:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94VY-00000002JIR-3V50
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EmNyMES08hLl/lZo50ZMyOt0uk2s5aoOzzYmrsTy+X0=; b=3p/AB+nXcfar0/n95hcIl0eb3B
	sdzT8OKBtQ98To+XFs5Bbtrk+fIwpTM08JgleTkl1NPK6b6w6fZnN6c79KulRIU3jX4kegbCAct57
	VfTnzyW73zdlmfO1jyJbP3T1oAejXdtoubxWxQpPgm9uFOmnvr7qRN9CgJHbKnhbzwAQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v94VJ-00B3LR-0W; Wed, 15 Oct 2025 18:37:33 +0200
Date: Wed, 15 Oct 2025 18:37:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties
 'skew-delay-{in,out}put'
Message-ID: <c2a0f301-ec5e-42d7-9df9-09a852a199ad@lunn.ch>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
 <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_093748_869711_FE733E20 
X-CRM114-Status: GOOD (  11.00  )
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

> I don't recall the reason for this way of defining things, but one reason
> could be that the skew-delay incurred by two inverters is very
> dependent on the production node of the silicon, and can be
> nanoseconds or picoseconds, these days mostly picoseconds.
> Example: Documentation/devicetree/bindings/net/adi,adin.yaml


I'm missing the big picture here, and i don't see an example of these
properties being used. However, since you reference an old networking
example, for RGMII delays....

adi,rx-internal-delay-ps should be deprecated, we now have the generic
rx-internal-delay-ps. The point about using -ps is however still
valid.

However, i would not like to see pinctl DT properties used in place of
rx-internal-delay-ps. How the Ethernet MAC driver implements
rx-internal-delay-ps is left open, so calling a pinctl API to set the
skew is fine by me. And if the real use case has nothing to do with
networking, then i don't care.

	    Andrew

