Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3876ED3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 22:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoC5MetU5++U8xywEJHsiiPAUOeuA7DRDg6f6+8w3m0=; b=ZSGH74PYz0fn5G23V9B5jJguqy
	xZ15ukTZafsgDehvKGYF19D4/sAKJJX3AvO3i4iKnKwBvpMVXnIpfwijGIf/fNfrgBwJz/eidQ/TY
	CSeU9Yo0QGRQtT8+3ejSUQKaGs/KI9/vB76CGSPs0ULIeiyhncbi3YFDwApR1NTQulZvqbNNn9TiZ
	+Fmu6SJqY9Xb/vCfxNwC5wj53QfeTT/uNbnWOkFsaHgLf+F9k/H/7OHuI90uojWAzijwKsATRc20P
	/72ZxqkHFhsLHNCfoT8V/98ywQdvbs5MF0Bg7V4ToZ5wPt5G9PTom6rfjb18p6JY5T3V4i/vIk13V
	/MJ68XLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAchQ-00000001TZH-2cqH;
	Mon, 11 Nov 2024 22:15:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbTq-00000001H6y-1vEJ;
	Mon, 11 Nov 2024 20:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DAFEA40A8D;
	Mon, 11 Nov 2024 20:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE0AC4CECF;
	Mon, 11 Nov 2024 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731358669;
	bh=Vsculgs7Z2DtlbXQPus53rVTFwNMcZTM30kdcyNrxZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKcGOJqAZTiVuiHiGlhpO0305iuMJGMklWGz1UntIF80Sy23zZLSotBn/7Jq24R2a
	 XSitOtv9kdeFlM4pu/pG2lgbzWSQOqOwkPW3Ki30N9qD6lYEAf2xUCLapN2ZAuE3N7
	 Cg9BsrNPfuBrEtIBdXrkB730q1LS0F4LJ8xUuR7g9knGz2cScH5KCTQztfUVbjGSpO
	 CitmJOed7+G0idfPhzFfq9yWe4+j2CuQRU1Epb8ICZQhDZz3HzTk5PW3ia8nyJx54z
	 IqyXqMFkh+1QhtSKOOjFGBKirSHgBMvHski49uZLghi8HawtlRSAbhHGOQNie/Fhih
	 9cZFg/dnRnchw==
Date: Mon, 11 Nov 2024 14:57:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ondrej Jirman <megi@xff.cz>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3 v3] dt-bindings: arm: rockchip: Add Xunlong Orange Pi
 5 Max
Message-ID: <173135828350.1935626.3279818343954125790.robh@kernel.org>
References: <20241111045408.1922-1-honyuenkwun@gmail.com>
 <20241111045408.1922-5-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111045408.1922-5-honyuenkwun@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_125750_595532_141E2A7D 
X-CRM114-Status: GOOD (  12.19  )
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


On Sun, 10 Nov 2024 22:53:25 -0600, Jimmy Hon wrote:
> Add devicetree binding for the Xunlong Orange Pi 5 Max board.
> 
> The Orange Pi 5 Max is a single board computer powered by the Rockchip
> RK3588 similar to the Orange Pi 5 Plus.
> 
> Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>




