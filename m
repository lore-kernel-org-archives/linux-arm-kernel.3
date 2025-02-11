Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CDBC021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBmMXCmBdFc/5DeKW+qCy83OgSjBlDScdd4wO/RXdXo=; b=wNXYNxbDzdqgyG0q10ouiqjmIx
	y7Jnmn4fdbOmgjKqpIltbxOhSclQxR2cJdqMyWVtz1EWdSyXyhKmq8pkKwcTOn1EJ1m07aoUy1Bmz
	AA8bAQwzAPieKcEe4KVqkdi9NKEAXFWygO3NPnNqw89D0qFGq52UdHhDhMXtmqq0ogEAIWi4HJl+K
	Vg1QnH76T/4uHerYJKoHqdN8hIxyJCcuii8mid1qliPVukCZ/2+iTDgeqRMJRL3TmgFtiHkMQsq3T
	DKRvzjCHypCCIBtZmGT9/u9QhXTloxu5sJE2zNrV4u5auvmOkash9Yo2xdaXipsUd/uEqNehdGmRc
	YlJsvFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlSB-00000002xvO-1VdE;
	Tue, 11 Feb 2025 08:17:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlPK-00000002xMc-15EI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 08:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PBmMXCmBdFc/5DeKW+qCy83OgSjBlDScdd4wO/RXdXo=; b=XTH6Hl4QU87nywbcXEVEPl2VqB
	+mGSJ9gJPGn7NPUj5dYN5h4Vxub8Xlb6JBTTB9v6r2JCmbany7roKsRLfTE7oFTJl34hiy2zfsH18
	GhPqHZ1lpmfXy1z04YKZBA4Rv5K1WjbeSN59gwn536x0/LwdXRVm53m3h4SDnxySOtx5QrT+eBLM6
	AUhW4Y9aEz/kDmL7bKtiOUfdNuzqHvEbO4i79ixB52+Gkx/raP4x2zfswKZVXeL7VJacJTKnZoUUj
	RdwY+ufCFj4VHtIpvKiFLFK+bOH70j7oMaJ+xiiI/F2s/Pnrxhxg7PrZMNF3LAD9sP0TqiKy9l1UE
	gRury1cw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlPG-00000000WJr-3VjF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:14:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DEB1FA4008A;
	Tue, 11 Feb 2025 08:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5658FC4CEDD;
	Tue, 11 Feb 2025 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739261649;
	bh=unoYhASJ+/qHhx7k6LpCsLJmOJOp+s9rLvwQK25VuZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBS1EdqgQRE1dQVxHta3hdmqDl9duJOx1SHlKeePRtGFaKTmSYVl2oqe6xJA7ipEV
	 Rtdxfn7Y3choQRAgPG6sqXtRlytZLMgwsIHk77CgmlWfzdZJ+qovOYTfipYs+h1Ixm
	 Ggx7V+XAl9SeN2snHQzdPwAMvDXVjOyAyONKszdbnZtah3ZGhpk8FyCBCxrW6/wogA
	 5ljF7Lr4Aoido7bHTHXNx1l1kQQyzDLvsaMb81koA9WrVMgqHw8UaNkiLC58gzduoS
	 lVqVybf+vcva03QcyDKgL6ZhgAqDxdfIyW7wlLqXDWOZJAsijUZGXGIqdKUWnTccsz
	 pQgG986/b9YsQ==
Date: Tue, 11 Feb 2025 09:14:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v2 02/15] dt-bindings: mfd: syscon: add
 microchip,sama7d65-sfrbu
Message-ID: <20250211-therapeutic-futuristic-parakeet-204cae@krzk-bin>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <4cac19e32295c708d72b9fc6ba342b5c961fb6c3.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4cac19e32295c708d72b9fc6ba342b5c961fb6c3.1739221064.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_081411_238738_44379ADE 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: linux-rtc@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, lee@kernel.org, sre@kernel.org, claudiu.beznea@tuxon.dev, p.zabel@pengutronix.de, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 02:13:02PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 SFRBU compatible string to DT bindings documentation
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 51d896c88dafa..727292ffe092e 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -91,6 +91,7 @@ select:
>            - microchip,mpfs-sysreg-scb
>            - microchip,sam9x60-sfr
>            - microchip,sama7d65-ddr3phy
> +          - microchip,sama7d65-sfrbu

You got comment on #1 of your v1, so if you make exactly the same
mistake in other patches then fix it there as well.

Apply v1 Rob's comments to all your patches.

Best regards,
Krzysztof


