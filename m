Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86149C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 03:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqTaH49lbOylR7t9Chlho0r1oCb5eVX5QIgYxMrF3N0=; b=IH2+BFiYTKxgSv62qYUiNeGAcq
	yUW+HAehdyDXqW50ZeAposTjR8CTJB/ckCPas5aNgcGAgfXbOI7x/wYUo8E7jXqXEcmhl0nt5FpPB
	b52DvmA/9i61n3WmM6fB9QBz1EDigBhkFmleMfqcheA4lFRjNxG32qyWk2vuBfX3wKx1ZHYf0YLfr
	fgxG4HESXtqWIGkLZXWeXd5zst/rOVOvY73er1F1ehgcj5mYmFsXektF5IJyq0p2ZPhvlh1fuCJC/
	Lvmx20L96vJFswRNW+kIo89/LF4jlIZmaNSIsEVMi7RCF93YiqWJOafqct2x6Upsozt/kP3y3kM7F
	0vnD/UOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toaFa-0000000FKL8-08cD;
	Sun, 02 Mar 2025 03:44:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toaE2-0000000FKAR-3Erc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 03:42:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36FE55C06E5;
	Sun,  2 Mar 2025 03:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C38FC4CEE2;
	Sun,  2 Mar 2025 03:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740886965;
	bh=IYvdJFccA3LUSxGP+VKKzb51QaP82ywJ2G8axSjP68A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ek7mtFbupwId0+cjvOY0Vei9e3TnyfaHVXNgylbQ9k4zhTqThOLZmwKS8W7pYeB+J
	 ZIzxnWNfMp3oMHH8+HqJAh2e0+hjJ9TFVObtT8KgaScVyBUPnnBSPKrmg+6/c29+Yv
	 yn2AHe4sBGc2LUBKjluGL6LCc2RZV7u+CKpumpu/cyTyhQ0GelHbXE0Z9b2lARCGRQ
	 PZciJUwCo+8VIgoc/SMYzDb3DkY5Euy+fgZmcBJb7f3TUxetabF3daaCENrHFJ+Nqo
	 RVRG9fN1ud5nIcyYX+MYbTzWK+U1+YedeacVjxX0R7i3WlfY+n4ukoLlEBAd1cG0bH
	 cNHNA3hnXS1IQ==
Date: Sun, 2 Mar 2025 03:42:21 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa
 <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>, Guillaume Stols
 <gstols@baylibre.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Dumitru
 Ceclan <mitrutzceclan@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>, Alisa-Dariana Roman
 <alisadariana@gmail.com>, Ramona Alexandra Nechita
 <ramona.nechita@analog.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <20250302034221.3c70c95f@jic23-huawei>
In-Reply-To: <a3c579cc96b35cae04f6090d98c7672c48fa8347.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
	<a3c579cc96b35cae04f6090d98c7672c48fa8347.1740421248.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_194246_921134_52DCEDD8 
X-CRM114-Status: GOOD (  13.10  )
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

On Mon, 24 Feb 2025 20:33:46 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
> drivers avoid open-coding the for_each_node -loop for getting the
> channel IDs. The helper provides standard way to detect the ADC channel
> nodes (by the node name), and a standard way to convert the "reg",
> "diff-channels", "single-channel" and the "common-mode-channel" to
> channel identification numbers used in the struct iio_chan_spec.
> Furthermore, the helper checks the ID is in range of 0 ... num-channels.
Needs update.

> 
> The original driver treated all found child nodes as channel nodes. The
> new helper requires channel nodes to be named channel[@N]. This should
> help avoid problems with devices which may contain also other but ADC
> child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
> string didn't reveal any in-tree .dts with channel nodes named
> othervice. Also, same grep shows all the in-tree .dts seem to have
> channel IDs between 0..num of channels.
> 
> Use the new helper.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
Otherwise looks good to me.

Jonathan

