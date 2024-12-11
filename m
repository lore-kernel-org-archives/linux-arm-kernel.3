Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D45E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBKkhU1F+iR1K5WGuefriUORSR21qlAgbGOK7zM1jXw=; b=PGgmkSUUF5+BbtX1gcg8XPyxoT
	N98weOZLhr78I4DmZZ3MpM0NmX3YwwYNZLECAH4sAU1gaNehjRUhPx5LPbo/lcv21pkXaJHVKSCDU
	wdRScxW2D7imKrsn9vCQJZZYXkmHRqZJd3TKFDaWcIhdASe5R+4B0/pj4KW9DcGKgyLOFC4r5WxKD
	sxQW/MjE+1tm6c1sz4eAMO0n+JgIZVRjPU2YGDEIfGuL1unR01QInpT1/36RUJD+qU8YwjTmKL14C
	OZrKmhLbxr9yTVcejLnA8+VTyBybIzfh3UDa+/Ga+0hGvgNR1KhXhPyqt7wLYyEBPdgnE+bbMfSxF
	CbZ2hfDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPPl-0000000FQA3-3NKl;
	Wed, 11 Dec 2024 16:18:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPO3-0000000FPuE-0nhY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25086A40D00;
	Wed, 11 Dec 2024 16:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF74CC4CED2;
	Wed, 11 Dec 2024 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733933790;
	bh=j2B3ZtPsIlaH71L3BYRm5WtzVOJ9jt5Yl7z8kPRgOdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M82ykkTd8xjXRBwSvWgQovHqKWlZUbMY2TEBisgB0McMvaiPso85PERd3Sx7gelo5
	 VHI80/ks0UgHnBkhWiHc86S902zVg6c0ieJWLHbMgIxteqtQJvEOpdSsrw/tUafqac
	 YRTwagblJNFGQtiocFm69/QlFpoKGPL6o9O3QZcxO9X5EwZXLYqAH5rlPp3Ty/hE2I
	 yiHX6Y+0wdmiYA7uqd9br0Ov3p2OSG3gXcn8qqJZ5RUXJC5os+uxj6vl0/+LVr/zMt
	 btgd9rOsANTwZRvkQWOSrRxrAN84KFO1UP+ck3ILnl/mBK+edWo8S4ePiAyBabIJrv
	 zeA1cp0Dnmrvg==
Date: Wed, 11 Dec 2024 10:16:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v3 04/13] dt-bindings: serial: atmel,at91-usart: add
 microchip,sama7d65-usart
Message-ID: <173393378758.3240340.14434192091992606298.robh@kernel.org>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <05baeeda872ab06d4d84718c535453b787740876.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05baeeda872ab06d4d84718c535453b787740876.1733505542.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_081631_292482_559B4904 
X-CRM114-Status: UNSURE (   7.93  )
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
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, arnd@arndb.de, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, conor+dt@kernel.org, linux-spi@vger.kernel.org, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-serial@vger.kernel.org, claudiu.beznea@tuxon.dev, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Fri, 06 Dec 2024 12:59:49 -0700, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add SAMA7D65 USART compatible to DT bindings documentation.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


