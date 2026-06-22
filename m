Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAD2CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37JW7K3sg07SL4BlJiD2RoB54WDCii+ode2jFNVJxNo=; b=hmPivHl8XnVI7wJ5eZm+MyRYE6
	hSlfpWUOPloBAxsxPjZnib2jp1359wiCmw+DqgHPTjlIKaEpYluGG6L8Cq90VeWZ0QcDJkammiSrO
	TDij8fXrvFTGiJC+VFAEcWrjDjiNSa85WpXKuViQEDT4dautVAimGIhasQRTm44JTYmwKaLyH19on
	D+EEBqMSU/D03vr4zcQwnJYtgSGnFvh8RF2HqNdLAfwaMefQOgBly+8T1AHJR6/tTsBszny1/Y5L8
	Fza6ImSwX6EUQ0k9gx0kkMgcbl1/PInep/IEB2syZ4SmVnLyF6DMw724N9TcNJxtR5FnWg0uECH8H
	ibsEJKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaYT-00000004iNw-1dPa;
	Mon, 22 Jun 2026 09:02:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaYR-00000004iNq-4BCu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 09:02:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F38940644;
	Mon, 22 Jun 2026 09:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8061F000E9;
	Mon, 22 Jun 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782118975;
	bh=37JW7K3sg07SL4BlJiD2RoB54WDCii+ode2jFNVJxNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k2zzXMRbaAgtx4A9VTmvyk+GhkLCzkMlCr6+OXPPplDlPFcqL2XHR9tBZW8Vwazty
	 ihfQXyTKWaxxIn7Wx9qxA6RkKgO2VY4SPbwCxP+kE8hzBZgWnfvr0kIZOvZznfk+as
	 qjijR9aaZPZpY7J9wYgjhaIs0L0qGbJ+wi/1+qdFyCMClpeHUh2pt1V9IWps/MBoB0
	 LLE54H8slDEVL3JlZVAnW/08m6oEKuFva/dJBe0GaI6+MvYYtcv1xWqLNg5u3hV/cR
	 MBn0nbBxaaRcMBT6iaLT2FV9FfhVAqHr4wvPRQJaL4LDs5hJb43gejFx85KQAScnpC
	 SXg+TcGUpEwwA==
Date: Mon, 22 Jun 2026 11:02:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] arm64: dts: cix: sky1: add audss cru
Message-ID: <20260622-dramatic-worm-of-radiance-adf731@quoll>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
 <20260622022520.3127103-5-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622022520.3127103-5-joakim.zhang@cixtech.com>
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

On Mon, Jun 22, 2026 at 10:25:20AM +0800, joakim.zhang@cixtech.com wrote:
>  
> +		audss_cru: clock-controller@7110000 {
> +			compatible = "cix,sky1-audss-cru";
> +			reg = <0x0 0x07110000 0x0 0x10000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
> +				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
> +				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
> +				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
> +			clock-names = "x8k", "x11k", "sys", "48m";
> +			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
> +			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;

> +			status = "okay";

Drop.

> +		};
> +

Best regards,
Krzysztof


