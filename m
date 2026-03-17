Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84242F3380C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJ4Kztid11Ihf/pYzoj9EseWqsUdE69LWKmwPcCh6xA=; b=b+ktYG6OlrQg5h3Av6SyzgVthx
	p5YaVcLaYaumwW4p+3hOn96mjowvS9ERF25KbZ9SovCv2cNIANcGjoP/2bjC/nuE+f51FTstVcyI6
	7FwarCj9mmP83YQ7hyZTqqQC2Q3yIZgN4urfGceUekwktmKHQLf8u4mGcaNceWXLGRiSWxkBJrLSt
	qdlhN1ESqemg/fbyxLoVLqM3VyAHcnhmNJMUome0fOvWtA7M6SV9GBhtIc/wD4DziAa0hT480qvIj
	5mxz/0nXoLAaEa4WsjVHbKLgLwIZALhL83wZ8x+1jnBe4Jgk/ggjTfPI8/rmHhjxrottrxTwUp1bN
	eowSzw4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P2V-00000005abo-42q5;
	Tue, 17 Mar 2026 07:40:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P2U-00000005abf-1TgU;
	Tue, 17 Mar 2026 07:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C19C560103;
	Tue, 17 Mar 2026 07:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E401FC4CEF7;
	Tue, 17 Mar 2026 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773733229;
	bh=HSM1mqZ60fsrIPA8vhvonH7caBlWD6pJ/37Voo8FQRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXwVjQuh+z/pNt5yjO/MJnRfqXCpwmvPve+OpkL9gmp19ezPb8PIQBImoz4RV1u/K
	 72F03OpIR5q7dHLHVMdqWE7iGqJSv/WbJ1y3uhmVRhml+MW3pvYO89ddC0xYl1mdkk
	 VI45j0FMMlqF7vZ8KSs26reL1V7ZF2ZCmLp32iPOX4aFY1WfU+4KQgbToLD7g1ZTBe
	 fNz1E4Dq054ALb8RcsXzu324ATDmjwmeabC8nO8we/HC9/aRQluI5WDQZvlx1ofzrE
	 wX4FSVJT6YMeVHXILnI3zQ1q7etNMUAqV5W56WLA/rF/s7z3kUPQ2u4xUhyvY0ctnk
	 EqI+RReBMIX+w==
Date: Tue, 17 Mar 2026 08:40:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniele Briguglio <hello@superkali.me>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: rockchip,rk3588-cru: add I2S
 MCLK output to IO clock IDs
Message-ID: <20260317-maize-peacock-of-teaching-d8ab90@quoll>
References: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
 <20260316-rk3588-mclk-gate-grf-v1-1-66fb9a246718@superkali.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-rk3588-mclk-gate-grf-v1-1-66fb9a246718@superkali.me>
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

On Mon, Mar 16, 2026 at 02:06:31PM +0100, Daniele Briguglio wrote:
> 
> The following gate clocks are defined:
>   - I2S0_8CH_MCLKOUT_TO_IO (bit 0)
>   - I2S1_8CH_MCLKOUT_TO_IO (bit 1)
>   - I2S2_2CH_MCLKOUT_TO_IO (bit 2)
>   - I2S3_2CH_MCLKOUT_TO_IO (bit 7)

We see that in the diff. No need to repeat, because it makes your small
change unnecessarily big. There is no benefit in writing tons of obvious text.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


