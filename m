Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F0DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WNA6XL5ePnboysrPE+Dr6WobR/NnMEUJhhNDKl0jrE=; b=dGy+OXRhqw3GkRoo1My81CPb6s
	eSdinablnsErdFPo6g9uz5NJJsfEuQvM1Pknp6SZzKlvbxPNFKOuOdteiDx3KjNtL26UUX5cuxAjX
	P+1IyjJEuQsVRkDnJtyPBGkVizXcO5pXgqTTaBz11LSx5J4FBQr3CUlNBhkLD1i/YDWz/+JLtfReM
	vmr5RDD0WjIn1dTZq4a1Yl4WKyAkleb0nafCc9PAf7rwaxUvB7ju/6FhkJYP86CXHhw/cd8GRJxQc
	wwb+HFzf5KsqBKUuecQDmzbHwrdivOniAGlpYoWsGd+2Wf84y+6XvTG3GVVkbG40+dv4wE66MeMgG
	Nngsiq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiszP-0000000EWBD-1gJX;
	Fri, 14 Feb 2025 10:32:07 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisvy-0000000EV9f-1hYX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 10:28:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D9DA441FE;
	Fri, 14 Feb 2025 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739528911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WNA6XL5ePnboysrPE+Dr6WobR/NnMEUJhhNDKl0jrE=;
	b=PdWtCLGk2DkpKx2ZqMxJ4eNfXAGOEVOJdJHRNqbGGIpDrqwU5Srh9KL25DVX4dUgAmCIb5
	W8+XF6dZy5zZJmYEAkZsePloSODQz2DF3HmM944MS61SuMBrqVXOJD1U58qV2iZ6D0hQfd
	XwJJJ0xdabc4veUwCtgw4jqHGIQX4GQh91Edm/vluCyHmeicJBBSNPLgfmclf44ZSrLcB1
	GxexAo8TtmRSW4zrGSbnnNd8/gy6Kf/lMPXqgBhaIYddE+lj1J59nMitV7lKi3LvAWdmfP
	ok9phtuEDP0aUagn9QpZ/JGpmesIZvYDvlyD2UpuPrfVko7Tbrm+YHSpB2zV7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-renesas-soc@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032: Drop snps,dw-apb-uart
 compatibility
In-Reply-To: <e290dd28ecb68b4e164172a905da18a5a2d438a1.1739525488.git.geert+renesas@glider.be>
	(Geert Uytterhoeven's message of "Fri, 14 Feb 2025 10:42:04 +0100")
References: <cover.1739525488.git.geert+renesas@glider.be>
	<e290dd28ecb68b4e164172a905da18a5a2d438a1.1739525488.git.geert+renesas@glider.be>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 14 Feb 2025 11:28:29 +0100
Message-ID: <87cyfkq0qa.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrdduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdelkedrudeijedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhin
 hhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_022834_582389_7B7D6BE4 
X-CRM114-Status: GOOD (  15.08  )
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

Hello Geert,

On 14/02/2025 at 10:42:04 +01, Geert Uytterhoeven <geert+renesas@glider.be>=
 wrote:

> make dtbs_check:
>
>     arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: serial@40060000:=
 compatible: 'oneOf' conditional failed, one must be fixed:
> 	    ['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] =
is too long
>     ...
>
> As per commit 72b0505f0830df95 ("dt: serial: Add Renesas RZ/N1 binding
> documentation"), the RZ/N1 UART is a modified Synopsys DesignWare UART.
> The modifications only relate to DMA, so you could actually use the
> controller with the Synopsys compatible string if you are not using DMA,
> but you should not do so.  Hence the first three UARTs (which don't
> support DMA) were added with a "snps,dw-apb-uart" fallback, to use the
> existing Synopsys DesignWare UART support.
>
> Since support for the RZ/N1-specific compatible value was added to the
> driver a long time ago (commit 2ff5fa7f742ab0c6 ("serial: 8250_dw: Add
> compatible string for Renesas RZ/N1 UART") in v4.19), the extra
> compatible value can be dropped safely.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Alternatively, the bindings[1] could be augmented with an extra section:
>
>     - items:
>         - enum:
>             - renesas,r9a06g032-uart
>             - renesas,r9a06g033-uart
>         - const: renesas,rzn1-uart
>         - const: snps,dw-apb-uart     # RZ/N1 without DMA
>
> and perhaps extra logic to prohibit the dmas property when both
> renesas,rzn1-uart and snps,dw-apb-uart are present.

I must say that I prefer this secondary approach, which feels more
accurate. I won't block the one that your proposed below for sure, but I
feel like it is more relevant to add this third entry in the bindings
rather than removing it from the DT. Either way, fine by me.

>
> Given the complexity of the latter, I went for the simple solution.
>
> [1] Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml

Thanks,
Miqu=C3=A8l

