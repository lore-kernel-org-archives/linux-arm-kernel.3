Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A76D4A5EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGq6lq6CX8A0vkqW4EaPcUBUnxO3Dn8wywcn5lCiB9Y=; b=20xkWo+eBR0Pzm4g92LE4KApqD
	oYVlxjpPDiHtFlpGbKc5tL8EfegV7Tw+mpJuZZKI19tyhShF2Lf0nkDTDaxqM+ZMcepMLktFyl9Gq
	tJeVX7xhr8NaM5hO58wzc2rXx3HZ95PId3r5FwRG2vzIEGi2AKt8yDHPNacHSv7LtAPIIlZyhDfd0
	9MKZ8WYun8T7m4A3Rdwd0S+8weSQp/mVr1IWY0yJupuNpkVed6v9hAiixq0zjagyWUbZIjmFTE9MG
	1wKHnkoBm9gsmDt2VKikLWRjQr4ugndeNtAqxmUVaFwjD4A0B+sdgAReyyhLrFd30dlgysN12oHud
	wFB5CjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZv0-0000000DUP6-2WLa;
	Fri, 16 Jan 2026 02:50:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZuz-0000000DUOQ-1nvt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 02:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87FB260160;
	Fri, 16 Jan 2026 02:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301A0C116D0;
	Fri, 16 Jan 2026 02:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531832;
	bh=mGq6lq6CX8A0vkqW4EaPcUBUnxO3Dn8wywcn5lCiB9Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mPUDrH5m/i7VJ8eJhQMRp0aA8plTZVx1lHaXswg5cxrmD2OUAxcoJRNvorM1c3A25
	 r+Ojg6h4Th+dS4YtcNFiVXd7ubnvwxwsvC2Rfw1yh6+nQ5SRDyOO1VZ3G2DjK/IMZB
	 S0ouoLeRU30bhpLpuEf2Cr9msvUMy1HbRFFQJBkuAkT1mcIt2cp8XGagLqpniUbjmb
	 Q4MQGfd9UL7LehymhT+dlg2oQ1iBxdOX1Lbub96dRiDT40svtEicpP012a2jjfydaS
	 0mWI8gAX83RrghFMnTVsx9+jiM9ZHFPrA9K7m1CcqNPNCmLz32Ar3Q1VJmGGNfGFZq
	 I78JHOb4Rcy+g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251231-clk-apple-nco-t8103-base-compat-v1-1-6459e65b6299@jannau.net>
References: <20251231-clk-apple-nco-t8103-base-compat-v1-1-6459e65b6299@jannau.net>
Subject: Re: [PATCH] clk: clk-apple-nco: Add "apple,t8103-nco" compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Janne Grunau <j@jannau.net>
To: Janne Grunau <j@jannau.net>, Martin =?utf-8?q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Michael Turquette <mturquette@baylibre.com>, Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Date: Thu, 15 Jan 2026 19:50:30 -0700
Message-ID: <176853183042.4027.16837126295266775570@lazor>
User-Agent: alot/0.11
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

Quoting Janne Grunau (2025-12-31 05:22:00)
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,nco" anymore [1]. Use
> "apple,t8103-nco" as base compatible as it is the SoC the driver and
> bindings were written for.
>=20
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>=20
> Fixes: 6641057d5dba ("clk: clk-apple-nco: Add driver for Apple NCO")
> Cc: stable@vger.kernel.org
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Applied to clk-next

