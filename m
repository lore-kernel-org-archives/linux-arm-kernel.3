Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F33BCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+v9UdC3WeSsimkvLm7OPSPWh0Nm4kcvIj5kzanuUhQ=; b=uMcc4gahq92UVUswnTNbzBhC4T
	c624TkeleI7FfR4iETKuAgdISDp2lTwAwK7maCZWbDmJ3G7GEOjqbh0uVAtRTAQJ5ShApyaJp6tts
	s9p1zAcmmhPzK0fdx7CoBWUk4Qj5MAO/cUqMGQmKCqr8WHOVsm0hOz5k9GkQO3WcxqnjFrPWcz/j8
	fkmLZ4H/goSco/jytSWFBU/M5Bdm3o28dP9eQM7CeXVepfyXaAnAxJDD/L4XJOzTXT5S0DwBqP5p7
	lqK19YFogirn4Gx61uKJmp9hG1Gs7QZIAGvUXtbi5s5evqxhqzlEkkOUScBspugom5bqhs8pYImwG
	8oarvYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrLx-00000005hvE-1vT0;
	Wed, 30 Sep 2026 10:15:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrLv-00000005huJ-2KHz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:15:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBCB4600D4;
	Wed, 30 Sep 2026 10:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4308E1F000FF;
	Wed, 30 Sep 2026 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763354;
	bh=2+v9UdC3WeSsimkvLm7OPSPWh0Nm4kcvIj5kzanuUhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VG5b7MNdnIeobZc1HIBo3JFB5v7phc+A+upIBve5/3mfft29cZxXSeioIEpmjv4Pk
	 vm3eMEmYkvkFHLo+jA03GHay8fXFo2kvNZh6iYHaKiuV//8eeKcfFQow6HvHj+7mU0
	 R9J36+qboE9T/a7SX7Lm6rEgzZ2gdhSt6R0BDtG8cBH6YGwxet7Xh0aUHvCb3+jp7F
	 47XG7b6x6nFzgJfdTQJeuqgDfzvkNjkbF/lTe+MX41yRG1pv5Q1UIT5zozera6RTtF
	 ikKakkXa3EJM4q+4wLpPB9ro2ErkBb+dECGpvkTDvUKoZn9LW33D+SKiv/uBqJVLEi
	 n22RAXP7/6BRA==
Date: Wed, 30 Sep 2026 12:15:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner
 B288
Message-ID: <20260930-elk-of-strongest-reverence-da4495@quoll>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-9-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927151016.186493-9-pmazzini@gmail.com>
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

On Sun, Sep 27, 2026 at 04:10:13PM +0100, Pablo Mazzini wrote:
> Add the MMC and eMMC compatibles.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


