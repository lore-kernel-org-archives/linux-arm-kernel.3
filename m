Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE05C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qk+S1cHfnfHxFjIJjHJ4ccWAMWO2ZP19H3Ul48WvpRk=; b=M/KrXW59zw53kdOjIvG97Bz3ly
	b23kc4Cxp2XvNUnsZ3vdJINIxBBPhsF0kmNK3KszHceK9/Ff8/6HfNuuf7ji6nDl8alTGNDGBE4Sv
	earhIMbDCX7N5L56REefxkOnT9sJyLcPFex06vPfIellCYX04rICyPb59NfaI9dC/DVPi0vYM2Pyo
	wKRhwDtqnGDCV1qpuUMb2FiFpyGR0w/bt/vDfEBgAd7X0HqzHX6NezKa/cpX2N3kzyXs9vLrGuyV4
	MJY+ETE8J37LGG8uN8OotR+uVD78wyOJT0ZBrAPezVvax9nB10W/d8ghKDNTbwKxUTRVniPZuUIYY
	K4sA4ojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xu1-00000008yHR-1Mal;
	Mon, 31 Aug 2026 09:02:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xtz-00000008yH0-1rFP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:02:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F05EC4140B;
	Mon, 31 Aug 2026 09:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8D21F000E9;
	Mon, 31 Aug 2026 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166922;
	bh=qk+S1cHfnfHxFjIJjHJ4ccWAMWO2ZP19H3Ul48WvpRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Owdxdr+gcBh1zf9PJ5z5jRG6a+rJTSv+40kJ0NYpFEb5hWCxEDiUzEiAH5NIcITgJ
	 8w0HNSMyjpYUPj0N4rn0WU/RojR5BTsD34ioPva62wqJf5SQ6R7Dkw9O0NqovplcWo
	 A9N+iTUxqnIOy/WEIIYxlWaRzRfKHHHNAZFNmNXKvNUtFigAKRYQ2YiLtL+CdQYjVX
	 qTw1QGQrDhkb4MXbjT3q6cFuChV2F9HICg9JDM3agDPNGZVVQSDG2GtZhOgT8YyGYq
	 ni+/ylmoSnbhCUSREoCU4G48WxDYD6NfgRmNv43dsH6RXQfJGQUiQhAyU4i6mkTLZz
	 rNymuabMUJvGA==
Date: Mon, 31 Aug 2026 11:01:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: generic-ohci: Document ST
 STM32MP2 SoC compatibles
Message-ID: <20260831-judicious-incredible-aardvark-baa48a@quoll>
References: <20260828155647.353877-1-marex@nabladev.com>
 <20260828155647.353877-2-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828155647.353877-2-marex@nabladev.com>
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

On Fri, Aug 28, 2026 at 05:55:45PM +0200, Marek Vasut wrote:
>    interrupts:
> @@ -215,6 +220,22 @@ allOf:
>          clocks:
>            minItems: 1
>            maxItems: 3
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp23-ohci
> +              - st,stm32mp25-ohci
> +    then:
> +      properties:
> +        clocs:

typo

> +          minItems: 2
> +          maxItems: 2

Instead these two list clocks with description

Best regards,
Krzysztof


