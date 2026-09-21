Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB898C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+YlNT04wuL7W5HJgKLHPJrW8rii6yAHjR27a80KkNw=; b=IhCu58ezIJbCrxDFa3lp9E9wDn
	qmC8llPIrM7uKf8hgg51prTlGJl7Q2zJ+cQ0/jfXB9g8GQAzLhRO3CFM7/x+LObD8g/aMgp/s9yXD
	qK9YjaO0Nz4IsQz/eTrcL7njEKo7kQrZbapbfSGd5IMc6uO0/Ll5OXZbls/4eHdqeJoShmU4b70xU
	OIF4XE0OKfn8+oD0/JEJ1mkom1GNcM+V8S+dWLPT9v4Y4iZYa8u1fPr3F9smYXBj2OLMxScHvqArb
	AdPOrPRTVnFxHlZmC77rUCcav8cPqZn4hrdAtnef2poYM3BwkYn6WlpAsm0o0nVih2QiVg+1Ovbw3
	EelZ2DCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lmE-00000003UQQ-3YWK;
	Mon, 21 Sep 2026 21:42:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lmC-00000003UP5-0Gjh;
	Mon, 21 Sep 2026 21:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=3+YlNT04wuL7W5HJgKLHPJrW8rii6yAHjR27a80KkNw=; b=fLz4pkLblNBR0y/c78KP+DzbWd
	QxeTaz7QHEAFVco7GZdSpbjgufOdVbAExtVEtfcxiGibW4RLM4YgHG2pPKOGcNJtXP8ZSdkbxyW6h
	rHuwPGEx7wTvTBzHviOv2R9oVD3oChfQ54RuNddw65vUsKdyitbXXfzOx+Lq1EHtUlEYuvj4j/PxX
	RgxeAzYIc4CPL+AzqqbJ1NGp9KoRPP2gJDWs+capzZ5929s3VjMBLFvsqT0z8qZhKqozqo5L/Fqpu
	TFWGrLdOfoYqxCIOSkXXBXcAxuYh82QEEQTEIf09Y+pOQd54VWRT3VpCQtDXqGlEJHdceT3uULgLW
	4sTYCLpQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@flipper.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Set gpioN aliases on RK3576
Date: Mon, 21 Sep 2026 23:42:02 +0200
Message-ID: <179002692015.1033956.17489310377805341851.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914-rk3576-gpio-aliases-v1-1-ce5f86f9ae0e@flipper.net>
References: <20260914-rk3576-gpio-aliases-v1-1-ce5f86f9ae0e@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_144216_131148_BC7272B3 
X-CRM114-Status: GOOD (  10.80  )
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


On Mon, 14 Sep 2026 12:47:15 +0400, Alexey Charkov wrote:
> With no alias, the OS is free to number the GPIO chips arbitrarily, such
> as in probe order, which is what Linux kernel's rockchip_gpio_probe() does
> if its of_alias_get_id(np, "gpio") fails.
> 
> This results in GPIO chip numbers arbitrarily shuffled in userspace,
> causing confusion and pain.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Set gpioN aliases on RK3576
      commit: c818f4a85a40c12a5536d6016395a7eff5b44f8a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

