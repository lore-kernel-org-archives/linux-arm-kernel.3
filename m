Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D92AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKkJS0TdLMKh/FuZf5olXod0bhkmhbeQm27vipHBZxQ=; b=IsAWywFFYbrcFxpTvaXh8gRr+Y
	Xf9WcPhusCoNRiQ4HxKIn/DIhaSDG/Ic/O6RvXMehfnZ5JI9+FLIxlm8vCm9F7/w9bhVhFvGyImR3
	NesegshmfEAV4siLAzf+JD5i0KTe0c3URMlmnFc9o57W17uCOT1NcRpKk6xk7f2HBOjleoxNrQhdC
	Omp2FhsEdhHffs4Jt7anZPRiezpvmGZUXEPRE3yoS/1F1K7ZgUaovm3PS4ZNnfJzR0zCzdvNd4Gub
	OtBEckL+2nL0Effesqt/8E5GvheINHhGGO3tfW6x+L2AoJ3ROhPTJFNHA/yfgfD/y8sQAjnavFoDe
	GpmFNJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmEtm-0000000BOrc-4870;
	Sun, 23 Feb 2025 16:32:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmEsG-0000000BOkO-1cHl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 16:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A13CD5C6BD5;
	Sun, 23 Feb 2025 16:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82E5C4CEDD;
	Sun, 23 Feb 2025 16:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740328235;
	bh=QfKdiEk49aDWt010gngXbc3vJUxTK0YB03j5djAbuSM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SW7/guI7iN1/8drBB39h5FaVJkqRojBn31+ZtOaZr/aaBcQue6cIy5785HZ3oXljI
	 LlOBYYxYWKHKcJWFJdxoV3zXYKpE0BLR8pTvle0s8Ja5wcFDTffbOAoHN6L5d7Rw+9
	 tqADmqonQH4E9OrvZhopW7RHnGAfOAMS0eoLk11Ofps6vd0nyRaWzA1M95vScL8NMV
	 vFgfnLj5JyEn2y+1mSDcxfSoEFbrVrAumZlqbQzYbURtpuiK/h71NvTqXe8PFG7gcg
	 sAxp72j1ftLeBSd+AZBa+NZ6AiqjX43hcWKBlATuc5AJocQ+atufejV26yCkg1sv90
	 LEF5z7wRlxjeA==
Date: Sun, 23 Feb 2025 16:30:18 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa
 <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 6/9] iio: adc: rzg2l_adc: Use adc-helpers
Message-ID: <20250223163018.2c0290e8@jic23-huawei>
In-Reply-To: <25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
	<25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_083036_475169_A1440B53 
X-CRM114-Status: GOOD (  13.73  )
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

On Wed, 19 Feb 2025 14:31:38 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
> drivers avoid open-coding the for_each_node -loop for getting the
> channel IDs. The helper provides standard way to detect the ADC channel
> nodes (by the node name), and a standard way to convert the "reg",
> "diff-channels", "single-channel" and the "common-mode-channel" to
> channel identification numbers used in the struct iio_chan_spec.
> Furthermore, the helper checks the ID is in range of 0 ... num-channels.
> 
> The original driver treated all found child nodes as channel nodes. The
> new helper requires channel nodes to be named channel[@N]. This should
> help avoid problems with devices which may contain also other but ADC
> child nodes. Quick grep from arch/* with the rzg2l_adc's compatible
> string didn't reveal any in-tree .dts with channel nodes named
> othervice. Also, same grep shows all the .dts seem to have channel IDs
> between 0..num of channels.
> 
> Use the new helper.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

I should have read on.  Definitely more convincing with these usecases.
however drag them to start of series.  Better to add infrastructure
so some use and then on to your new driver.

Looks good to me.

Jonathan


