Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F97C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4+I7dQKUeqgbjsd8AZYxUQ0+P1SiGloGLynhGyTXdc=; b=4a4+pJYW437ObUu6yIjMCte2xw
	QqrqBG85gfsCQqm4Ve7U8ZvSBVrSeZebzjx99ZiWn2lypNTqwuzhVtf6tL3i5odgF20By6WyEdLqf
	InwN9YSxFOrmAKngzE2XDneceSPJd1TOQRjgxHtMPtHHuZMsFLhHCCblZvSpQO5Qg6E3sQQM0OySD
	dLUDAWZAU0JtKor65HwaP7JKmWWT6Jj6b904uQ7IGsF7k7dCsphrRbRTeHmsmwLWw5Xl3frZ1JMhw
	WWNo6aAAOQx5GJJtn/iYOzgqAB55RzJ8hf2Ns9Do70MzwiAYPyj4osWtgYlSXkpyAPr++CHbu2sy8
	yYt4Y1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRW-0000000DRSw-2qlR;
	Thu, 19 Jun 2025 15:44:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSByM-0000000CgDG-3Hrr;
	Thu, 19 Jun 2025 09:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C9F64A6D6;
	Thu, 19 Jun 2025 09:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426C3C4CEEA;
	Thu, 19 Jun 2025 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750326857;
	bh=liBrC581olewIxjbEjqmezkc4FAvhL6bE6utTt8dFjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5pcnnELNdgWWTpUPqvWO/Rjn59mzJal3u0PTtDti6dHWFKIeZ9bYaddL+4kJYJsY
	 +imfxJt+pi3/S79q8A25sV833O7pajN7iYJR4F8wzkP04ZeRLpzC2N26SF0XiYQyzz
	 0SXoZguPVAbHYQ1idOBHeuHxYh8hXzLDqWYiF4dSpWcFtp8R4QdGnLfQUu3CSUjR6D
	 xTXQIFzHKKXhYyB5/rzqzgdG9vKqbHPdS6ccjWvYPtlTeKNieMbs80rtW0ls0Hyvm0
	 XwsTe6eYbyGy2gWPm3phDYEtrviPH+8L+0qMtYrwUfu6XqQHSJsXFjKL9z46UICmKN
	 z+oIUFNTFph8g==
Date: Thu, 19 Jun 2025 11:54:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, Daniel Semkowicz <dse@thaumatec.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v3 1/5] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
Message-ID: <20250619-unselfish-gorilla-of-joy-13fb93@kuoka>
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
 <20250618-rk8xx-rst-fun-v3-1-081f02d3d348@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618-rk8xx-rst-fun-v3-1-081f02d3d348@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_025418_843028_04979717 
X-CRM114-Status: GOOD (  16.32  )
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

On Wed, Jun 18, 2025 at 12:32:40PM GMT, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The RK806 PMIC allows to configure its reset/restart behavior whenever
> the PMIC is reset either programmatically or via some external pins
> (e.g. PWRCTRL or RESETB).
> 
> The following modes exist:
>  - 0; restart PMU,
>  - 1; reset all power off reset registers and force state to switch to
>    ACTIVE mode,
>  - 2; same as mode 1 and also pull RESETB pin down for 5ms,
> 
> For example, some hardware may require a full restart (mode 0) in order
> to function properly as regulators are shortly interrupted in this mode.
> 
> This is the case for RK3588 Jaguar and RK3588 Tiger which have a
> companion microcontroller running on an independent power supply and
> monitoring the PMIC power rail to know the state of the main system.
> When it detects a restart, it resets its own IPs exposed to the main
> system as if to simulate its own reset. Failing to perform this fake
> reset of the microcontroller may break things (e.g. watchdog not
> automatically disabled, buzzer still running until manually disabled,
> leftover configuration from previous main system state, etc...).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


