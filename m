Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72806C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 23:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNmqXhGZZ3SwaOV8bqOvV8+pT+SPZVFh4wF6oc2IRlM=; b=bMPJ8FK/a0vVGf9aCs9svsgUfs
	mp4bo5QoFM4VQaR03roz5etsEL31+9euOgt1/FF6FlBPXelg4uf+2z923TMmNeJ3AIX03IAgCk5iK
	HqygdpLa9b6hxySTchRaTEoF6miNtfrwYgDZh1R9pwAFJFme5F9LbOBjqQRIaI2cgiy9ub7zkP6a1
	pImEie5c6zQ1i3HexLNN+9suSQvq1tEgB359uG57PzDfwpDi+sqZ5u6ARqp9izrbcLt+WdNO3mCTZ
	BxHkFpx3dL+HuxPvN58CuzjPbWWZolmqaQLlUGzn3FtI/pjvw4SxgQ2jwg7Tri7RUQU2LY1A0qW5p
	NdfVWjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QmV-00000000a8P-1w3J;
	Sun, 20 Sep 2026 23:17:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QmU-00000000a8E-4B4w;
	Sun, 20 Sep 2026 23:17:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C55F9601F0;
	Sun, 20 Sep 2026 23:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A394B1F000FF;
	Sun, 20 Sep 2026 23:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789946229;
	bh=iNmqXhGZZ3SwaOV8bqOvV8+pT+SPZVFh4wF6oc2IRlM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KXchSqOMRu6y0GF6EJYza2QP88aCzZmwup1XUPGrasdEXOhI6G7OJ14iaK1CWpkJs
	 yqDplcxA/MrOg7wIZwopBhu4eSf0x2hW43ePFgdnb1T8ZMGX4KBu4ZJhbq905a+M2B
	 /QZq8nTfycPwGGIPWRLsEmzwrLZwV0Mx2erm3tVKNSXQuHaPkO0J4Bk/KhqqPUr36b
	 LQQTXQ+wRVrHLNYaYL5uxJlfha8588V9Hp1xwdIzVyqQGtskhuqi/Fwt0mI8+W6MiC
	 nyvSs8D9Mn/PNqMjBa9q4p3DN9FDOlq1/cC3K9rnEI+ARfCKV/s3bGi8ip+Wjn8cPq
	 k9TKIz31I3z4A==
Date: Mon, 21 Sep 2026 00:17:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee
 Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>, Luca Leonardo
 Scorcia <l.scorcia@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 0/3] iio: adc: add mt6397 PMIC AUXADC support
Message-ID: <20260921001702.3a208780@jic23-hlaptop>
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 20 Sep 2026 00:31:50 -0500
Ryan Brue <ryanbrue.dev@gmail.com> wrote:

> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
> reach. On boards built around it that ADC is the only path to the battery:
> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
> boards use have no ADC at all, so without it there is no pack voltage and
> no state of charge.

Hi Ryan,

Please slow down between new versions.  Unless a maintainer is specifically
asking for a quick turn around (sometimes happen very late in a series) at
least a week is typical time to allow multiple reviews to come in
and hence save on effort all round.

Jonathan


