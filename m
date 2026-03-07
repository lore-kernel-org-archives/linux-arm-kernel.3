Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D780F55103
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35n0oUdbFU2uUhq1/nGIeFdhYFxhXIU62aCFgqP56TM=; b=C3lp9PVIAT+4WJcMqy5zkjAUe4
	m+5J37OeZhktRvkK5WTVdQolmyLUpgXuHdqXMZ3W2q23K0mZC9wLXG2EM3DgPdAmS3h5/cfe/m/BG
	DbUilqSUlhfi/y5NL4q+kNn/cLmeiZkMxr64KQIhW/pQjisCTUvizj4G9UXB3pjBXDNhsDc0DEee8
	qsoQJoByes7c8sBBu3fbC9u3njdytVUlaD/g5n6BCR1Hgm0AxxdRTfCqimH6BNMHEM6nUOAtZwCWL
	xKMxKhiY+moaTVTZ8klbEA58BpRAR6c0T/AFVL72iM+0Q/F7QbXdr5gtL1sovJ0Om6iIFvWVZNlIz
	pMNBnzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyuz5-00000005NC1-2whc;
	Sat, 07 Mar 2026 16:58:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyuz2-00000005NBZ-1FK1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 16:58:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A47F640860;
	Sat,  7 Mar 2026 16:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA06CC4AF09;
	Sat,  7 Mar 2026 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772902711;
	bh=/n8/OpMY+6dULbiTfTC5ROSM1gs9LvfF4qTCbwCFEcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ecpkkt0PlRrKOIFW+Dny3SbYijVlDJsO6IZth3SXkg2fSF/SGrGQ7Ac1LmB0eNXUa
	 /tO10qlEmU/Ie1G1CY/Q92PPEJwPu6h2gT1Eaf1VC1xeac1otwZ6LJrZ2h3iOp/ZJE
	 Ov4yPz5UMFTlcIpzpS8AvPJjC/UL1+qENzOq8d5YZwX0j1LtAJoMJ6TlryQtpvWeig
	 THZO7zWDA8dn7XbrZtHKDP+GAB51espZpzJNyZ++DGCpdCGLL63k7DCLQgMjGRM2Np
	 DHINR1+/YUkDj8mHRnSPQG0ZZrWwfccNkyj6dDIYUYNPl0z2bmdnOEp/XxWpHUUMge
	 d3RVJ+vQufZBg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Juan Yescas <jyescas@google.com>, Amit Sunil Dhamne <amitsd@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260302-max77759-fg-dts-v2-1-12f1109a6fee@linaro.org>
References: <20260302-max77759-fg-dts-v2-1-12f1109a6fee@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 fuel gauge
Message-Id: <177290270852.40662.10572796737662873762.b4-ty@kernel.org>
Date: Sat, 07 Mar 2026 17:58:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_085832_378686_C2D994EB 
X-CRM114-Status: UNSURE (   5.46  )
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


On Mon, 02 Mar 2026 12:35:22 +0000, André Draszik wrote:
> On Pixel 6 (and Pro), a MAX77759 companion PMIC for USB Type-C
> applications is used, which contains four functional blocks (at
> distinct I2C addresses):
>   * top (including GPIO & NVMEM)
>   * charger
>   * fuel gauge
>   * TCPCi
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 fuel gauge
      https://git.kernel.org/krzk/linux/c/3d7bd20e026687db513887e4d066121cb0a49852

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


