Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA84C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 06:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2PM5a+UZWdJ+WhQDBOum09NcVM/9sTxmNiXpKbmfKk=; b=QVWRxzepHMSH+JEk86totqI8Eq
	nTXJizXAwIScCw+jRssmxGUoOSMwvYmYFRm3rCDk8d83EwFQDh1QgtYkvKr/FxHQXy8eMEfNhVxMt
	HK8hDNMsVTm0aOuHWrOVcjHlHh41xw+iAn1rJPOOelXDaSosdEEDfowF/bcW6E5yMxLJ43tem+K+O
	HnW/jB6W8Zey1M86OfhNh+qN98im4MQT2cjS1NWrIXYPbsCTJClKfHyJSNPDI21C7/OCszoIvYYSg
	iw/fcntIE27qXJI5rrqLSB/YwZJRnITO2IqyDHKbEZQTIX7kWmr5YCawy2tHPGzWWXp1MQSO3WWXn
	t7UkmlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vs1-00000008ebA-2fzJ;
	Mon, 31 Aug 2026 06:51:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vrz-00000008eau-3k6N;
	Mon, 31 Aug 2026 06:51:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02A0060120;
	Mon, 31 Aug 2026 06:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489971F000E9;
	Mon, 31 Aug 2026 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788159110;
	bh=P2PM5a+UZWdJ+WhQDBOum09NcVM/9sTxmNiXpKbmfKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GrfCzTmLRK/rsL/k2jvm2HUYovq/c1GNWmqevw5OxuJVfi4pGmIo5FBWfrOTlFlKl
	 Xiren5WGynHp951w6f7iWfuC0KZMsggLkqQRVsPUgUMdlNC0ArHvw9l5xeXKS36+Q2
	 xMJ29REWyGB2YcPS4HbYz72EmvnOwR6oMPbNK42XdKKus59mm+g/Gm12DbUGPTNyRl
	 5YjNPcxL1vhW5lTlisgw19t4o300liF+y2TiRwpiPBFzudIfnC1qz50+0JAtprzAN6
	 4DeNtWZjBjRkBkkJ4rYlHkd4FixCwX5mkzbnPx25M2WXl/EIh7zJJqMTJCRhCw8Z9U
	 fplQKdUVjqdJQ==
Date: Mon, 31 Aug 2026 08:51:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
Message-ID: <20260831-elastic-turquoise-puma-f032fc@quoll>
References: <20260827122127.18874-1-ansuelsmth@gmail.com>
 <20260827122127.18874-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827122127.18874-2-ansuelsmth@gmail.com>
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

On Thu, Aug 27, 2026 at 02:21:20PM +0200, Christian Marangi wrote:
> +
> +examples:
> +  - |
> +    #include <dt-bindings/phy/phy.h>
> +
> +    phy@1fc7f000 {
> +        compatible = "airoha,an7583-pcie-gen3-phy";
> +        reg = <0x1fc7f000 0xfff>,
> +              <0x1fc7e000 0xfff>,

Sashiko has a valid point here.

This should reflect real hardware, not current driver. It is very, very
unlikely that hardware designers designed a block of 0xfff size or 0x4

> +              <0x1fc30044 0x4>,
> +              <0x1fc35030 0x4>;

Best regards,
Krzysztof


