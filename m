Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A902C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TYgTPD1ZHabhdjSEtz+/kYdK/AmjwGoo1oqUCw0CEo=; b=IGgB7pP2vxUZaoDb7+E9NUKid1
	tcSXiEoFrkVfnq0A6D23SQC7MHxty46eAj45ihQps6aWvYA4Q/eTQeYqJr5k7Wm9Vh+NbR8nKKjdO
	fBSShLLMq529wwj5MDSEQTUV2ygv7VPFnOJbLp17A/oiBstM18thACQuexptpK5wA/4YMwugP5Yob
	hKawkI6/kWVQxWNcvvN7piSvu2+hAm9eIN0u7uIMKy5sSUaE0gOJnz/uv1IezzPKtUqYCN9weCRO0
	B+4Y7stBgBJxtWvXtdJ9FVR1VafNFeCTMXX62IBQotevK9wfL/n8isSsVQYbXdMHRNy/CbSnGN+iW
	UnUnEoow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttkTe-0000000Hatf-2QUM;
	Sun, 16 Mar 2025 09:40:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttkRx-0000000HaIy-0RcC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 09:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4B4D5C4596;
	Sun, 16 Mar 2025 09:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F122C4CEDD;
	Sun, 16 Mar 2025 09:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742117907;
	bh=IfQEydlLkB/SwiGc+oQAak2koasoTaF6BMIlt7gzGgs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kbEwkAIESdXZMWtrTIoTAH6bpMFDi0sreEWPRFDN//Vt4pQTw7EVzyyTmktQmC7fz
	 VHJNELiNsPGlujkXGKfiZfOojPiNz6Clu+Fih36MVubORIJP9FPGhC2VzgGxkeDrF3
	 +h8dxf0jDeLK9mFWI51D5w8ssRihSjiUmsdPCcKO82u3g9Hadp/O4h2b+fdL4Sz1JP
	 8ZQtR/aiD9EkxwoH4AgZGiCzIENJdvPzP5BJjqY/UeFbw1r0GFlY3BZC9QVU6NsYT3
	 7WSNY3ELng4JXyZzlfmKK5mXwhgkW5PkVQJv+pyMCdz9d+vo2ODEFIx41lkkSotpjb
	 iFjkj6I3SB/XA==
Date: Sun, 16 Mar 2025 09:38:12 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa
 <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>, Guillaume Stols
 <gstols@baylibre.com>, Dumitru Ceclan <mitrutzceclan@gmail.com>, Trevor
 Gamblin <tgamblin@baylibre.com>, Matteo Martelli
 <matteomartelli3@gmail.com>, Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <20250316093752.0eacaa16@jic23-huawei>
In-Reply-To: <c8899e8c535a1d93cd7588b7c160eb0fae5d26d2.1741849323.git.mazziesaccount@gmail.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
	<c8899e8c535a1d93cd7588b7c160eb0fae5d26d2.1741849323.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_023829_193318_489F1A84 
X-CRM114-Status: GOOD (  13.48  )
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

On Thu, 13 Mar 2025 09:18:18 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> There are ADC ICs which may have some of the AIN pins usable for other
> functions. These ICs may have some of the AIN pins wired so that they
> should not be used for ADC.
> 
> (Preferred?) way for marking pins which can be used as ADC inputs is to
> add corresponding channels@N nodes in the device tree as described in
> the ADC binding yaml.
> 
> Add couple of helper functions which can be used to retrieve the channel
> information from the device node.
I suspect we'll need the addition of an optional trailing timestamp
channel at somepoint. But we can add that when we need it as only
matters for drivers doing iio_push_to_buffers_with_timestamp()

Otherwise no additional comments from me.

