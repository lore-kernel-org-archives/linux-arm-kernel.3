Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794E7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqnfohQmjg+XFxtKu3Cbs+pnZE2+X1EUJqdFTgVMJf8=; b=te9MYVxb+oQyFC8ewY6CGfqRn5
	H6IGIimYi+WYNdbxBgq6u1fcmcRq/h/mb8Vyi0SKdI3moWBu1XJsM8BObUsdhcqwMwgLO5nDCoVU4
	bDqwHwU/zVaqt7M6Jlb850lsqjxuWRkmTc1UrSoHW/lwvvhW62qy7sHehAPiQtgkdklgI1X62lb6T
	BjGRCH0GI/0pnS68sUnzf27J/8RZkJARF1RnlyrH+TgUEJuIOLLddCkC7etwMbqAIGJ7IDCkkHBvL
	G5P/baB0gYJXm0bP6HzuHNvXUwmbcneJP43K47oWA2APRYF4t4Ujy2PyLn3QXlTOzqiBDiX8Fuot6
	TrlP9mTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBf6-0000000BySP-0rii;
	Tue, 05 Aug 2025 07:00:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBWL-0000000BwlU-366e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 06:51:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 009A3A55BC7;
	Tue,  5 Aug 2025 06:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167C0C4CEF4;
	Tue,  5 Aug 2025 06:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754376696;
	bh=2vhYiK9y/EgMAQMFYv1KpiYYEmofbXB6Kpl40cFvolU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTsEJoO3F8w2Eo7qxTjajp+cezhSwl9wIMjKbvGSUnrwF3fGDSCpQ+iJMRGaJxRRJ
	 5glHnaCrHEmNtWPuM85Ob6op+nGctz1GYEEMC/+yXbNHEI6n/sp71g14PPEzaR0Opw
	 Zp3HnmHW9SWcghyJP18Fs73OtOqCS4fsYvWMj3rorprS2oKpwnIb42CM8P4vUQxH8T
	 Gj7TfYW+mH3oxA54x/i58s6YMAFuF7Wg2ehXWhG/3FNrfxDOlUivGvWp8BpJho0Vd9
	 65zc7lWrq7XphfKZWu8b+VKbM8N1fdv1eso/f3UMw+l2LfJpUWhZ3KdGIDQcAHaqO7
	 /GEc38pAh9mrw==
Date: Tue, 5 Aug 2025 08:51:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, srini@kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/15] ARM: dts: microchip: sama7g5: add packet tag as
 offset for calib
Message-ID: <20250805-calm-kestrel-of-fame-a7c9b3@kuoka>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
 <20250804100219.63325-6-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804100219.63325-6-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_235137_870929_4CA3433A 
X-CRM114-Status: GOOD (  11.93  )
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

On Mon, Aug 04, 2025 at 03:32:09PM +0530, Varshini Rajendran wrote:
> Add packet tag as offset to access temperature calibration data from otp
> memory for sama7g5.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7g5.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Not only driver breaks users, but also stuffing DTS change in the middle
of patchset instead of postponing it, breaks kernel.

Please learn how SoC trees are handled. This is clearly documented.

Best regards,
Krzysztof


