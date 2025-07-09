Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FE7C83F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXBM8dLrdYEuexmX3f5LO6gxbkHjFdtBFeGvDAvqutM=; b=uPPDXQFvqWBvttsvsomeFxsPV1
	AhE+I17uWUa5NqHiV8nwV3qDlaxcfvUTe4sVaP7V5U2/dVDjr+C7tThyJs5prtVlFYZ6U7sQx7GW7
	HbLMWIzv63/p7JpHE+83zFVxUhTi+4xjRqY5B0eaok7EL1B6KDV/CBcJjA9zkFUDPvZRSP6voKyfB
	UYyivHK3fZ/SA6+QAvXvfQ7+7blS738IzXS8Vf5T+WTXXBp8dEXQeE4BFNLEKdf3TmkgAcn0FDpi+
	5ReYUWoqilMKXgRvhpFGtIXHyf/Xw4S/3jxeAjfTF+0pcbbR/f3JXrIUvj4s5Fn9O9TcUTpmxPYn0
	Atc4tDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFR-00000009fjN-3vgO;
	Wed, 09 Jul 2025 19:14:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXAI-00000009Ebt-0Fv4;
	Wed, 09 Jul 2025 15:56:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5004AA54832;
	Wed,  9 Jul 2025 15:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408B2C4CEEF;
	Wed,  9 Jul 2025 15:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752076617;
	bh=O/H+N3TO1iyF42W90FkvMaPdy1iyg2L5o65UAMgY4T0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k4SMq1lDl0t/cpPFrA7uow796FMW7GCeKwtQrN5wEi5zXBiXSwxFeWIdMUbzVd5U8
	 /tblIRlrJdfQKZdoPr64vHfpPgtdz3fhQFrMloKf7NMXZuE34W2HxGhgEcNfmHMSZY
	 tq861hDUdrgazQaM7yKEeYXZflRhGBK75t5WX5mWhufldFDQzMfW4AOxp7jfLxl5h0
	 O8ezv6cLXuzwzFIBfudhF8WWA8f5GaL8f1aQH9vOLfSmq60HHZMSfuyDc9fNtc45pT
	 IP9aiI2TJCh67BTt8KnMuziAjKBMiYg6I6WH8b7cANgamtSjfRZhFslDKYecXU1Qn+
	 rdOkyQBZs4YNQ==
Date: Wed, 9 Jul 2025 16:56:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 s.hauer@pengutronix.de, zhiyong.tao@mediatek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: Add support for MT7981
Message-ID: <20250709165644.7614ac41@jic23-huawei>
In-Reply-To: <20250709-industrious-marigold-snake-5a3eb5@krzk-bin>
References: <20250708220405.1072393-1-olek2@wp.pl>
	<20250708220405.1072393-2-olek2@wp.pl>
	<20250709-industrious-marigold-snake-5a3eb5@krzk-bin>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_085658_166678_E91C21A5 
X-CRM114-Status: GOOD (  24.01  )
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

On Wed, 9 Jul 2025 10:27:50 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Wed, Jul 09, 2025 at 12:04:03AM +0200, Aleksander Jan Bajkowski wrote:
> > The temperature sensor in the MT7981 is same as in the MT7986.
> > Add compatible string for mt7981.
> > 
> > Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> > ---
> >  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml   | 4 ++++
> >  1 file changed, 4 insertions(+)  
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
Picked up this patch for the togreg branch of iio.git. Initially pushed out
as testing as other stuff on there needs some test build coverage.
> 
> <form letter>
> This is an automated instruction, just in case, because many review
> tags are being ignored. If you know the process, just skip it entirely
> (please do not feel offended by me posting it here - no bad intentions
> intended, no patronizing, I just want to avoid wasted efforts). If you
> do not know the process, here is a short explanation:
> 
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
> However, there's no need to repost patches *only* to add the tags. The
> upstream maintainer will do that for tags received on the version they
> apply.
> 
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
> </form letter>
> 
> Best regards,
> Krzysztof
> 


