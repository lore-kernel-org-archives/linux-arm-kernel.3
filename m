Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0209C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 01:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUD0Sy3VhZJAzgihNTL/cXLCw+pDjPZESUcsvePLwok=; b=EZPw7hjiK4mnRvm63KJzsRhhYM
	p16ooWZ9sAD2u09T8QWJxeLueH4dj+tnTsVUTrrxw6xeQKppJL1J3K32bzSmF/LuRRQ/VLLQ8LT8h
	xRXDFWFUMR+M57XTxs3Udcs+Ynd+WdE/eqrXLt2nEN4p6PV41BQX1d0Pw+cfYOQdxemoUQMgoyxL3
	/Qo3uFXOG5SKkdBLwFiOaa48lRbAo0LZIi1paSbhqh/dXAZbhYwimVN50DiFTy3hqyKz/AH0XQwSS
	lbUwo624mtupIBmKR1D28hNMJy2D8y+CSa8WZNf2wlyWc/Lh+qaCjbDJZfYL3MUPFWK0JxIdy6BVM
	BGrTIbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdLV-00000006hNl-1o6o;
	Wed, 05 Mar 2025 01:14:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcAz-00000006ZoR-1b2c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 23:59:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3AC5A46119;
	Tue,  4 Mar 2025 23:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A67C4CEE5;
	Tue,  4 Mar 2025 23:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741132792;
	bh=5vebJ/S6i6XoH7Ih3sw4US3bddCoPmMlMYzqb9x3KTs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RtSW+I3Ctq7wSxMG0NAtscyoIiYM4RXmN1i93BhNwxpRwGinmq2nVauLNqKC4T6sB
	 BYCYcWlG1Uc5rlc9+BNoLByAL10sDbxYSTNUtpW4J5KUiLomE82JcVdg36LiZ6O7xR
	 yW20OF2brH22gRBVjM6aeFatYrIDeUnAX8KsvLwjS9CIqhp2oBREQ6U0jdxT4XKYTr
	 8JwpFdahKF4U9a4Q79MPkp+eGBnQs1OIj7VidvfBfY3t6gVl7l/L4VNfi0bDeMtAhC
	 lGd6m1thv4NWb59F/QVzHJzkZH2FtuWm6wNxQvrYnSeiTuimfcHEeXC00qChG+T6Hx
	 KQV41tocstFZw==
Date: Tue, 4 Mar 2025 23:59:29 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa
 <nuno.sa@analog.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, Matteo Martelli
 <matteomartelli3@gmail.com>, Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <20250304235929.1a8f23f8@jic23-huawei>
In-Reply-To: <eaede287-658d-4c23-b217-5bc8053e64ed@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
	<23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
	<0de7b0ac-eca5-49ba-b1b3-f249655f3646@baylibre.com>
	<1b308a10-9622-47f9-b489-bd969fbdfc34@gmail.com>
	<6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com>
	<9180ff11-888b-453d-9617-4b3a0fb38d91@gmail.com>
	<20250302032054.1fb8a011@jic23-huawei>
	<eaede287-658d-4c23-b217-5bc8053e64ed@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_155953_552739_4424DB8E 
X-CRM114-Status: GOOD (  31.19  )
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

On Sun, 2 Mar 2025 14:54:16 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> On 02/03/2025 05:20, Jonathan Cameron wrote:
> > On Thu, 27 Feb 2025 09:46:06 +0200
> > Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> >   
> >> On 26/02/2025 18:10, David Lechner wrote:  
> >>> On 2/26/25 12:28 AM, Matti Vaittinen wrote:  
> 
> ...
> 
> > So today the situation is we have all the options in tree and we aren't
> > really in a position to drop any of them:  
> 
> Sure. I am only really interested whether we want to prefer some 
> approach for (majority of) new drivers. Furthermore, I believe there 
> will always be corner cases and oddities which won't fit to the 'de 
> facto' model. That doesn't mean we shouldn't help those which don't have 
> such 'oddities' to work with some generic code.
Absolutely but we also can't apply this to existing drivers that don't
work quite that way.  So if we want to make more use of it we end up
providing variants long term.

> 
> > Hindsight is a wonderful thing.  I'm not sure on what policy we should have
> > gone for, but now we are kind of stuck with this slightly messy situation.  
> 
> Sorry if my comments came out as criticism. 

No problem - that was just me being wistful about wanting a crystal ball :)

> It was not intention, I just 
> try to justify the helpers by trying to think what new drivers should 
> prefer.
> 
> > Helper wise if it expands usefulness we may want a bool parameter to say
> > if we skip the missing or not + make sure a max expected channel is provided
> > (might already be - I didn't check!)  
> 
> This far it only had (optional) maximum channel ID for sanity checking 
> (useful for callers which use the ID to index an array). The bool 
> parameter would also require a parameter specifying the number of 
> expected channels. That'd make 3 parameters which may be used or unused.
> 
> I don't think I saw existing code which would have used these 
> parameters. It might be cleaner to add new APIs when we get such 
> use-cases. That should simplify the use for current cases.
That's fair enough.   Ultimately my guess is we'll end up with a complex
internal function and a bunch of wrappers that elide the majority of
the parameters.  We can get there once it's needed though!

Jonathan

> 
> Thank You for the long explanation of current system + the history :) I 
> appreciate your guidance!
> 
> Yours,
> 	-- Matti
> 


