Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B31C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhPCODwV4M9IEAWp7osVik1lEx7HK68MeB5e3sxNp74=; b=QaONbgNg6qoPfPMHT63xEeeOyF
	246WX2yI4/2HM16hwDnBh1lhMbrHXdfNTldj90meZL3pTD86bpSlQ6m810mjqNwySIxs6QdG5Vl+m
	zlzrBfVHQ2YXYM9HyNea4yubvcIg3AxKKJSSiu5j/+AvIBGBXGdNxY+t+ubn1CrGkXWpdOvSt+HoT
	mxQpOSLJLYBVFAxsRXNKuzu2wSlnRj8K6mFN+lQSAzBjAFmGebPbujxn3LifdSqb4d3Jz2yF055/T
	G9kKysmHsiN/yWH1DbHMCiV6Jo9yc2AHizNyJKc96BMlEhkd1iQ4Iah0erVaeblJkUXzO/29q94VB
	fr+hKKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiJR-0000000APiZ-2brj;
	Thu, 27 Mar 2025 08:10:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiFc-0000000APAF-1tPl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8C55438B0;
	Thu, 27 Mar 2025 08:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7075DC4CEDD;
	Thu, 27 Mar 2025 08:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743062768;
	bh=B7XsPMUikiiUOfex4giQRc56miOT8KNuSiIxK6PkfJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtWAvwZ+rVqCvVzCQuIzPIUU+/jhNYMXjCW/Blkl3htiOXOSSTVOdlao0pyRG66SO
	 5hMvSMLo1Tcnn6VnENmX0Xmlip/o4wqIplf8XRp9iyhVn84cF3JC10FztXAUOoXDUA
	 2ZLtaa6+tm60K0tada+x8TddPNA5FboWFkADT5+H+EHmqEzuJkpeTFnpXCzyyV45BT
	 bO3+o8IF00cNju+ZjfqcFmBGevVXhKeTj2aXyevPyte/ZqAcyxSRpnoq+POsmh2Ng1
	 SEZfpp3WOnWrUPCf1mrrI4Y2xd/Ua/p5W0c3J89JEF6Z2to4BskT113b5bvwJLdo9a
	 IXmgE3fmWSlwQ==
Date: Thu, 27 Mar 2025 09:06:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	lee@kernel.org, sre@kernel.org, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 06/11] dt-bindings: mfd: atmel: Add
 microchip,sama7d65-gpbr
Message-ID: <20250327-muscular-antique-caterpillar-6be7ad@krzk-bin>
References: <cover.1742936082.git.Ryan.Wanner@microchip.com>
 <57a9f2ef94005bc7bb450fe073fb594fe7d5c2e1.1742936082.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <57a9f2ef94005bc7bb450fe073fb594fe7d5c2e1.1742936082.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_010608_509077_14B8362D 
X-CRM114-Status: UNSURE (   8.84  )
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

On Wed, Mar 26, 2025 at 08:35:39AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
>  Add SAMA7D65 GPBR compatible to DT bindings documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml          | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


