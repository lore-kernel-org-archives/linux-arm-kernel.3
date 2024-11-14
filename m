Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2AFD6A254
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 22:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s13xgOYjkxvD5SoWSViCz2QfBYJbkhyM4pVqs1+EBG4=; b=jj1HczQK6Z/0/+BLRkkeWBqViV
	TDN3KIrye0OFUgtBl2xAJhMSIA/KrlUy4ZlZ3Nkt3HV82rsa0JPqiLGlCK6I3tEvTGl77aOB7iikP
	EzNqXX/7AhITJMk3IA7km+6aZJMWqYbq4x9Bl/Db/KuEplRZe3NAmkl8j8nuBv23HeDON+aGB3JGx
	19Qk9l9igUKfdUzAr+oK+cJAVibMtOpa1FtckcMyZRIFIZxfFaxLip4mw3onjssKvDTsr7avHWSTT
	1xAjbxYcFwacAOFRSbc1NJ3NX/KTypx9j5tKcj44lwbFA1wwCthnHoCe5mfEGihDxf1bnFbU/OrUL
	P6upMgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiYc-000000010wm-18vp;
	Thu, 14 Nov 2024 22:43:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiVo-000000010VC-2z0E;
	Thu, 14 Nov 2024 22:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C019F5C1127;
	Thu, 14 Nov 2024 22:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A196AC4CECD;
	Thu, 14 Nov 2024 22:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731624027;
	bh=q+dgoQrtOgKVilV2nVsbgAYQbJrn9GgLDKGPgYV2pDc=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=jtVWwzYFOpJ/mB2Fa/mloq4oMS5Ir56qJWbEJZ9Twwar0LaFkh95AowpZF8iCrCQd
	 F5pEAvNrhBpZmWIiS9ptJQYx5LjZq7iKb4UjO8kmCw6QIIqjaypemN3Rc6Rk7mlQ3K
	 uFPAqZKNYEcdi7+rUvWEbkcDzA2wS9GN0tGhBzJ06RpzBBFug/XhkfcNfhbGTip3Re
	 g7xzzMprUniwI5qruvRrKGr/+ZKV6JhwuQjQzv8l6tzyzgMZUl8luQwsEGt2wuMkcM
	 NQ3MBC6axxq99EM16xbEjn4nDTWvX4pccd/uNsaznxIm9rF29zcN3fg0rmcJepAVo3
	 anI0qsoPILy4A==
Message-ID: <b473d92cc353b1cf58169410236e4c51.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112230443.1406460-4-jan.dakinevich@salutedevices.com>
References: <20241112230443.1406460-1-jan.dakinevich@salutedevices.com> <20241112230443.1406460-4-jan.dakinevich@salutedevices.com>
Subject: Re: [PATCH v5 3/3] clk: meson: a1: add the audio clock controller driver
From: Stephen Boyd <sboyd@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 14 Nov 2024 14:40:25 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_144028_794543_1279E7E9 
X-CRM114-Status: UNSURE (   8.66  )
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

Quoting Jan Dakinevich (2024-11-12 15:04:43)
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 7cb21fc223b0..49f2086bc773 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -133,6 +133,20 @@ config COMMON_CLK_A1_PERIPHERALS
>           device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>           controller to work.
> =20
> +config COMMON_CLK_A1_AUDIO
> +       tristate "Amlogic A1 SoC Audio clock controller support"
> +       depends on ARM64
> +       select COMMON_CLK_MESON_REGMAP
> +       select COMMON_CLK_MESON_PHASE
> +       select COMMON_CLK_MESON_SCLK_DIV
> +       select COMMON_CLK_MESON_CLKC_UTILS
> +       select REGMAP_MMIO
> +       imply RESET_MESON_AUX

Should be 'depends on RESET_MESON_AUX'

