Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85ACCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+deBbbW7AY9atiWPYAkYMpHhMSI1LaTAQJTDOZuTb9Y=; b=SRlAQzpaimq2lOBeG8V32DxheR
	h7MdDhQo0RC9+e9MvpeRp9GOODZZAybZK5sedFrmE2AjSIZ86duT+FXka9yDS1kkORlMjbOmHlVbo
	TjTwCeD4kf3oiF9ahT19GhyBhbJK7pklgu953I3NL+/ghxGdDp0uRP/Gn47l0nFIwdyP7eeed9zMM
	gsgfkhvU47a0tVWFobKbEiGisN3vL0UxiZWAoIv3SSlFtN4rjnJXRjpFM62bp2DPo5gLGLpOmosbo
	mQOOvrU5ZqjLIvgaPO1JnCAvFFFLlLdcJQuksEda5VPekTE6Uc3FGRdeFIE9xepclk2FP71crA7HL
	iiDv89HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyEg-00000003p13-0oM1;
	Thu, 07 May 2026 12:53:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyEe-00000003p0i-3Xql;
	Thu, 07 May 2026 12:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 002F960181;
	Thu,  7 May 2026 12:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0272BC2BCB2;
	Thu,  7 May 2026 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778158427;
	bh=NDq1yRkDTD9n1Z9MRjKoR/KHoPrasWXZhi/Utqu0UcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N1jGAtff4iiwWK8TKDqlW/GLbEyNu3o3HVgehLHfvadTuXxf0BrWwQYQlSTGU0kWc
	 NRSJH4ZQ9uNyjB5ig8ciNzDaG6IDvDP2IoCHLirfjtUhdGxA03Pwwj6F9mSmDUz5LV
	 +Ll2TquOmBdV1ZWPAFpUHRQ6158JRSd6XZ4VYB2vvsDzZnHCUimBCuFLIUad5x+BaT
	 nbN9iG1eXcXzbe8UKNtLfDju67QwMZ3r2a24adutuhe9CDmdlOYdx9TZJ6JQOT7Cbq
	 3H2ETgluYKH8BwEQW2QtaDyPMzqkMdnE6NZkWsA8omTUdQfmtZdnl6aIDq46kZWVZ6
	 nzmsj+38KEQYg==
From: Lee Jones <lee@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-1-447114a28f2d@aliel.fr>
References: <20260421-add-mcu-fan-khadas-vim4-v4-1-447114a28f2d@aliel.fr>
Subject: Re: (subset) [PATCH v4 1/8] dt-bindings: mfd: khadas: Add new
 compatible for Khadas VIM4 MCU
Message-Id: <177815842272.1844364.17432398965217021542.b4-ty@b4>
Date: Thu, 07 May 2026 13:53:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Tue, 21 Apr 2026 13:49:18 +0200, Ronald Claveau wrote:
> The Khadas VIM4 MCU register is slightly different
> from previous boards' MCU.
> This board also features a switchable power source for its fan.

Applied, thanks!

[1/8] dt-bindings: mfd: khadas: Add new compatible for Khadas VIM4 MCU
      commit: a10878e699567d88267200afdb165107567e0287

--
Lee Jones [李琼斯]


