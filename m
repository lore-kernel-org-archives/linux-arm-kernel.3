Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E996DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/8OslG9fyPcNfx21E3tjr7ML1CwTdkUB4L89YR2Fno=; b=Pt5SrY0mMuwNVi5fUQJeyyuhF3
	z7TflZrgqZuUL73Xrm5ByOF1mjlXYyRSrUiEWpzsKGZVFco9Dk9U9ra/hi/3Tx/m13HgFEtyPfXWl
	E+QKVkdVADzQ/HuNH9cC+nN2vl2FG+WWqK//CbAN3fVp7Ebqo4NyXEB/4QW4DHKrksXQZ+98aCSro
	sB6kbcbjCd2BwYn8bNiSM79nOazpxSMPveDAslxhGVPS5iZ+SdIn6hyWC5qlwAdQny3zQ4Js0Hoxt
	IEezTMUaDUeUqOKg4kJNbaky8tUHocUAJrC4HfaIDLTmkPpNmj3ko0Qf5icep9KrDXjeOn1giLfkd
	3HM7oMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjzg-00000003uYL-2Mz2;
	Mon, 10 Mar 2025 20:45:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjjH-00000003sRM-3NJm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 20:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D9FB5C0501;
	Mon, 10 Mar 2025 20:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E9CC4CEE5;
	Mon, 10 Mar 2025 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741638481;
	bh=jrIUTRkOVwF4DrP6Op5FQkTYRiWzZRjfoY/yn1onSOU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BxTlFGHFoOW0phWUqgQyWBIzCHGcDhnWX71cIrTi/V6o/OiL21j07oJLCGyw+KM9b
	 3ReRfXP2z6sHkLW/fYS14usJ4jMUA8tFPVNPUAhN+ZxdAfy1XPr0YAmsmYh3s+qBui
	 l2Wg09MH9ZYmq/RERxrvpEx04dsu66PALYPHHmAaXl1yEKkjMIGzESQeeRoKto5vB9
	 uudFqXko3mnxN3db9MwQRFSZksb8SB6QtcJFypy/s9kCh1WO+iV5BSZT1OZ5cpY3tx
	 6Lr2DFTSxmYrDwDKk7SRg7EUIcKe4UbqK4DBQxh9+NErcIzOCq2Ql/DTx8UkrUkQ8x
	 2uGVdAQ1eUAzg==
Date: Mon, 10 Mar 2025 20:27:38 +0000
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
Message-ID: <20250310202738.13301548@jic23-huawei>
In-Reply-To: <cover.1741610847.git.mazziesaccount@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_132803_960675_14602FA0 
X-CRM114-Status: GOOD (  19.01  )
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

On Mon, 10 Mar 2025 14:53:50 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> Support ROHM BD79124 ADC.
> 
> This series adds also couple of IIO ADC helper functions for parsing the
> channel information from the device tree. There are also new helpers
> included for iterating and counting firmware child nodes with a specific
> name.
> 
> Series does also convert couple of drivers to use these helpers. The
> rzg2l_adc and the sun20i-gpadc are converted to use the new ADC helper.
> 
> The gianfar driver under net and the thp7312 under media/i2c are added as
> first users of the newly added "named child node" -helpers.
> 
> There has been some discussion about how useful these ADC helpers are,
> and whether they should support also differential and single ended channel
> configurations. This version does not include support for those - with the
> benefit of reduced complexity and easier to use API.
> 
> NOTE: Patches 4,5,9 and 10 are untested as I lack of relevant HW.
> They have been compile tested only.
This probably wants an update.  Also, 00/10? There are only 8 that I can see.

Jonathan

