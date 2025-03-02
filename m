Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CA8C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 03:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB1oDofjBhS4DFEK6OGLBtk/zJ24NUNEUUTMbF/JuZ8=; b=MnAEbvegHWAtVi02G9lvzG8t6a
	GaMse58EefuOJcZN9YUrcQEcXxZvyG4KcASNeuESqrZSw5wx4SjAcxFRnQ6BRN7s6mtCWB9acn+kN
	HnFEHTQmHNOv5PgqcwRJL5bMj+NzC70eXsGpKM+KiOUYPR0cQI9kivtUDR9ILWXA3a3s/GCQ/YUb9
	i/VOLghzAK2bOPHZK+FSsnAUbC7qXdvfoFjH99qc9ozu87AkszGn02+1x31oTF4W3w3X5h0PdowMh
	368+vksP2JLNdqrwefDCHkc4wCkH1dvW243bEzHZ3a5UD4nOsyTqrhp3lYVexqldlLrvpo/zAoyfA
	RIvRW8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toaJt-0000000FKd6-08da;
	Sun, 02 Mar 2025 03:48:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toaIL-0000000FKVy-1ogB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 03:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2492F5C4C2F;
	Sun,  2 Mar 2025 03:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90261C4CEE2;
	Sun,  2 Mar 2025 03:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740887231;
	bh=O1SNm9G2v5Ugd5UySXzu1wFcmNPfiG9j1G7ECdHcH2Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MkCcPaMmrOCyOo9EpJvxcT+v05XO+mjFs+cGtaaPcQlIHiy0ZfmfySc9YoOfmWccy
	 ka+9Yr6T6T6jrWgOTmtJRKb9mZ5y4+u7hP4nA7DyJ1i4CgVuzhFlZ94xIT7Z51f0jn
	 HhDuWVMXpZ/UQlCqV3A6wBkk8vg94H4/HRAeRgvssdXI5KlUEDaBV66fSBD0qRbgXq
	 1KZPcfK+E2eNTkF1MWJf02jhfbP/K910Im0Gpf7+4ySoThmXYbV0DXkK2v1Z9Axv+o
	 +zIZJIBDhxa+muFAFDoma5JEuBhKpojQo8P40D0ZK52twsM3mNyMjj6I0FDiahSZZd
	 z5epcFx/utLWQ==
Date: Sun, 2 Mar 2025 03:46:49 +0000
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
Subject: Re: [PATCH v4 06/10] iio: adc: ti-ads7924 Drop unnecessary function
 parameters
Message-ID: <20250302034649.2d9ec2a4@jic23-huawei>
In-Reply-To: <38d39befcca110132fd4349c87fcb5d7ff51a2c8.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
	<38d39befcca110132fd4349c87fcb5d7ff51a2c8.1740421248.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_194713_567258_0EDD8E16 
X-CRM114-Status: GOOD (  24.59  )
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

On Mon, 24 Feb 2025 20:34:01 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> Device pointer is the only variable which is used by the
> ads7924_get_channels_config() and which is declared outside this
> function. Still, the function gets the iio_device and i2c_client as
> parameters. The sole caller of this function (probe) already has the
> device pointer which it can directly pass to the function.
> 
> Simplify code by passing the device pointer directly as a parameter
> instead of digging it from the iio_device's private data.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Looking again at this function it doesn't seem to be doing anything
useful at all.  It checks the channel nodes are in range, but
does nothing with that data. I'd just drop it entirely.

Ah. I see David suggested the same.

We can't really 'fix' what this was perhaps intended to do now
as what it does has become ABI :(


Jonathan

> 
> ---
> This commit is compile-tested only! All further testing is appreciated.
> ---
>  drivers/iio/adc/ti-ads7924.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
> index 66b54c0d75aa..b1f745f75dbe 100644
> --- a/drivers/iio/adc/ti-ads7924.c
> +++ b/drivers/iio/adc/ti-ads7924.c
> @@ -251,11 +251,8 @@ static const struct iio_info ads7924_info = {
>  	.read_raw = ads7924_read_raw,
>  };
>  
> -static int ads7924_get_channels_config(struct i2c_client *client,
> -				       struct iio_dev *indio_dev)
> +static int ads7924_get_channels_config(struct device *dev)
>  {
> -	struct ads7924_data *priv = iio_priv(indio_dev);
> -	struct device *dev = priv->dev;
>  	struct fwnode_handle *node;
>  	int num_channels = 0;
>  
> @@ -380,7 +377,7 @@ static int ads7924_probe(struct i2c_client *client)
>  	indio_dev->num_channels = ARRAY_SIZE(ads7924_channels);
>  	indio_dev->info = &ads7924_info;
>  
> -	ret = ads7924_get_channels_config(client, indio_dev);
> +	ret = ads7924_get_channels_config(dev);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret,
>  				     "failed to get channels configuration\n");


