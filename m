Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A74BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LwAmJbKt177l9O7ODjbAxhQ60y8QQaTJ9lrKQOfZOI=; b=EKQi2QH1o710cK+upOK7RBxK5F
	I//vazJ+FqRNYym1/kWpi2SwHMQhmzeGSM9V/oQRswENHwclyfqLf5/pOhZrFshrG/zn87OcNEL0o
	WMT+8Z3OVzsAiEDtLx7y+lty4hJ2MjsEY+QujHE90kYYsl8aPUQBw5+x0ilJ41fFtljPjxy1pF0Ms
	J/impyaGVq/9TM3RPS5aVtNTD4fL7pjnr9W+5IHSj1Ynn+faXwat2yggcNnhB/rop9DJlgmteIdXM
	8ebRm0IMFL9n7sws6rpEmaJMmAdBuJgaGjGwqRcgp+NjshOpy+UAIYGqa84obfLa6Sca7oS6wrWLg
	Lsc3W0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttWH1-0000000GhLl-2Qdw;
	Sat, 15 Mar 2025 18:30:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttWFK-0000000GhFb-3DKI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 18:28:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DFC6EA48ADD;
	Sat, 15 Mar 2025 18:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9C5C4CEE5;
	Sat, 15 Mar 2025 18:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742063309;
	bh=sMKrjH62WoD/khslIsrraD1DRdosmW6hiDuN4h1CExc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=snXASOq1cllJq1YTzDr4qDVX4xo/lxUHFZy5n9suL0QxsZkZAUZM1i5zZk7uoKn7T
	 eignihiclaj4hs8EJ/v/qppGcHX1leERoUdOm5BnAe9COVUk4TU1nIOxfVikm3jJXU
	 cI3Z65HXbPpPiiO0hOr6iK+tqdnelXHSD+UtsANAzhNECjS0JeNnMsw01WeDCX6G88
	 swbZ/gbJerFL1k7OXCVQT4mB/8nD5xZ+19cgx4+r2Ml+M8WU5KmcOB49pBvjQheG5s
	 vB9stQQLN3SggAUGmT3zLZ+Gu5LpJpFodH/523FaWEeSGqSa3yDhi4aOGRr5Eiv6As
	 DDxjAIvVTxcbw==
Date: Sat, 15 Mar 2025 18:28:06 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org, Rob Herring
 <robh@kernel.org>, Herve Codina <herve.codina@bootlin.com>, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Nuno Sa <nuno.sa@analog.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Claudiu
 Manoil <claudiu.manoil@nxp.com>, devicetree@vger.kernel.org, Marcelo
 Schmitt <marcelo.schmitt@analog.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Lars-Peter Clausen
 <lars@metafoo.de>, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-iio@vger.kernel.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Eric Dumazet <edumazet@google.com>, Conor
 Dooley <conor+dt@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Trevor Gamblin
 <tgamblin@baylibre.com>, Ramona Alexandra Nechita
 <ramona.nechita@analog.com>, Paul Elder <paul.elder@ideasonboard.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Matteo Martelli
 <matteomartelli3@gmail.com>, Guillaume Stols <gstols@baylibre.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, David Lechner <dlechner@baylibre.com>, Chen-Yu
 Tsai <wens@csie.org>, Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH v6 00/10] Support ROHM BD79124 ADC
Message-ID: <20250315182806.653bd71c@jic23-huawei>
In-Reply-To: <e685d31c-8cdc-4732-b3a8-8e70a6f82578@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
	<20250310202738.13301548@jic23-huawei>
	<e685d31c-8cdc-4732-b3a8-8e70a6f82578@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_112830_946022_408CDF71 
X-CRM114-Status: GOOD (  22.08  )
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

On Tue, 11 Mar 2025 07:49:35 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> On 10/03/2025 22:27, Jonathan Cameron wrote:
> > On Mon, 10 Mar 2025 14:53:50 +0200
> > Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> >   
> >> Support ROHM BD79124 ADC.
> >>
> >> This series adds also couple of IIO ADC helper functions for parsing the
> >> channel information from the device tree. There are also new helpers
> >> included for iterating and counting firmware child nodes with a specific
> >> name.
> >>
> >> Series does also convert couple of drivers to use these helpers. The
> >> rzg2l_adc and the sun20i-gpadc are converted to use the new ADC helper.
> >>
> >> The gianfar driver under net and the thp7312 under media/i2c are added as
> >> first users of the newly added "named child node" -helpers.
> >>
> >> There has been some discussion about how useful these ADC helpers are,
> >> and whether they should support also differential and single ended channel
> >> configurations. This version does not include support for those - with the
> >> benefit of reduced complexity and easier to use API.
> >>
> >> NOTE: Patches 4,5,9 and 10 are untested as I lack of relevant HW.
> >> They have been compile tested only.  
> > This probably wants an update.  Also, 00/10? There are only 8 that I can see.  
> 
> That's odd.
> There should be 10 in total. And the 4, 5, 9 and 10 was updated.
> 
> 9/10:
> https://lore.kernel.org/all/1c4b9b4ceb1995bce76a0ddef0e04ad0d1d81190.1741610847.git.mazziesaccount@gmail.com/
> 
> 10/10:
> https://lore.kernel.org/all/ab79cf4415d21ff2854fee4f4189fac555c30b7a.1741610847.git.mazziesaccount@gmail.com/
> 
> Perhaps it's because of the "net-next" in subject?
> 
Nope. My filters broke the series up into different directories.

Thanks,

Jonathan

> Yours,
> 	-- Matti


