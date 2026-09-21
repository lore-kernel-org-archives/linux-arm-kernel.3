Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5839EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4liZ14THFBbmN0BGtw1acIhCbedsr31KR7f3ynsmuI=; b=3vltjGim+piHUIglTQ7Nd9i6P1
	fGRbNJSFG+JKsSj/M2FbJpCacpPla3RMiDpdcCK1VEA672xIgolOgau+5SVJyLXTiQATWWEtwBU2V
	lXOsSuC/G3aEP/V80i7iwGpHOoNuzdu/l98CyQS/x5vZDKFzTbgSkGT5da267ZA/Z2znl3ywSg2Vo
	SeRHvHZpSZpq/rnTqlRkcoYuKPlvBignxLrffidLWGFO94yI7zoHxYBwNtyRleYSfSqROxCIisMnw
	+ciEjkqGjiyo3LOKL9w3v1oarsPUO5BAW/8+hCZBnRkPbCPdNWrrhb5W8bqIUbECCW0wGrlUpCy2g
	t7T+ouRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lvZ-00000003VPc-24gY;
	Mon, 21 Sep 2026 21:51:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lvX-00000003VPG-3DOU;
	Mon, 21 Sep 2026 21:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=j4liZ14THFBbmN0BGtw1acIhCbedsr31KR7f3ynsmuI=; b=C/VoKAnYoViJsLPq6M2KfEq/2l
	yj3Pxhx4N4KTa+gD9o+wnO6sW7Y8smzmG3yJuwnsGIl9NkZLhf0KM1U5Nc1rxBEwvlpqpcA8u6iA1
	4mVUNb2aVlUhmcqZDt1jCZBvQkmWhR/4SWduTuhkrWUqY5huztGkCU/X+69KkAlsDC24NKT1y6gbC
	eV9x5XXP4z+GNNlIJPJXJhNHiWKA0AwGemidSjcZ11RTnPg7/w5caDqVnxULkB0uM+ZWcMSA5/nuF
	2KM4vLsO9gHCHTNI5rShUQfpSgOF/E/u7WJKerxRgQo+4ZSpHasM9Mo+UQ8RW8Fof5V44WQ6rf+22
	RvEJK6/w==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lvU-00000005flc-3NGk;
	Mon, 21 Sep 2026 21:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=j4liZ14THFBbmN0BGtw1acIhCbedsr31KR7f3ynsmuI=; b=YTN6YR/z0jFiPpwVnyatzy/Yga
	b/ntgapdGubCzkXTkPBHOGR601vbC8lI95G16qLYg3n28RJjTlVIJKfHrZvwI4sHKm4FK/Q+1ukPZ
	Pi8CK0QzmBjm/fjsyLZo/zwgb8Wk24in9xxFJ8p6FtC5nmb99FmBecxo4nbJMQsFBI4jjXvHsVG8k
	UY3JXdVfgvZGfAAoTVJzuO/DRYOpjHDFCel/Ea1luhz1+Ii1H2qy5gB7hhwOymTILDedQSGLM8hRE
	lyJAbMfSYJlcMrhbibSOTdliNr0tlhfbCPbFc5gqMGCFAmTjZg4wEAu9yQdeucwA9d9M0a2SaH71v
	jEa23Bog==;
From: Heiko Stuebner <heiko@sntech.de>
To: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 ulfh@kernel.org, p.zabel@pengutronix.de, ogabbay@kernel.org,
 zhangqing@rock-chips.com, Jiaxing Hu <gahing@gahingwoo.com>
Cc: royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
 u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [PATCH v13 13/14] arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
Date: Mon, 21 Sep 2026 23:51:33 +0200
Message-ID: <119338490.nniJfEyVGO@phil>
In-Reply-To: <20260915104328.45901-14-gahing@gahingwoo.com>
References: <20260915104328.45901-1-gahing@gahingwoo.com>
 <20260915104328.45901-14-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_225152_911034_D5BF802C 
X-CRM114-Status: GOOD (  21.59  )
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

Hi,

Am Dienstag, 15. September 2026, 12:43:27 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Jiaxing Hu:
> Add the two RKNN cores and their IOMMUs. Both cores are disabled by
> default; boards enable what they wire up.
>=20
> PD_NPU0 and PD_NPU1 are siblings under PD_NPUTOP and hold one core each,
> but the convolution buffer and the DSU sit above them: ACLK_RKNN_CBUF,
> HCLK_RKNN_CBUF and CLK_RKNN_DSU0 belong to the block rather than to either
> core, and PD_NPUTOP already lists all three. Add them to both core domains
> as well, so a core domain switching state has the clocks of the path it
> shares running, and give each core domain the BIU reset that the pmdomain
> driver now cycles once power is on.
>=20
> Each core lists both core domains, its own first, so that a core in use h=
as
> the whole block powered. Whether a single core can reach the shared path
> with the sibling domain off is not something this series establishes;
> listing both is the description that has been tested here. The IOMMU in
> front of each core lists that core's domain only.
>=20
> Label the outer PD_NPU node so a board can attach the NPU rail to the
> domain that gates the block.
>=20
> Clock the NPU inside the voltage its rail is given. CLK_RKNN_DSU0 clocks
> both cores and the CBUF they share, nothing in mainline sets its rate, and
> the block comes up at 786.432 MHz. Rockchip's OPP table for this NPU asks
> 800 mV of its 800 MHz step at the worst leakage bins, and nothing in
> mainline sets the rail either, so a board that follows this DTS runs the
> NPU above the step whose voltage it happens to boot with.
>=20
> On a ROCK 4D with both cores enabled and vdd_npu_s0 at the 750 mV its PMIC
> comes up with, two jobs in flight at once make the second core write sing=
le
> words of its output wrong: the right value with a bit of the accumulator
> set, always the same position in the array. Either core alone is exact.
> Four device trees, same board, kernel and userspace, four passes of 5400
> rows each, every row compared with the same multiply done one row at a
> time:
>=20
>   786 MHz, 750 mV    13 to 20 wrong rows a pass
>   594 MHz, 750 mV    0, 0, 0, 0
>   786 MHz, 800 mV    0, 0, 0, 0
>   786 MHz, 850 mV    0, 0, 0, 0
>=20
> 594 MHz is a divider off GPLL and sits between that table's 500 and 600 M=
Hz
> steps, both of which ask 725 mV at every leakage bin, so it is inside the
> voltage a board that describes no NPU rail already provides.
>=20
> The trade it buys is a core against a clock, and both halves are measured.
> The rate lives in the device tree, so the two clocks cannot share a boot,
> which means this comparison is across boots and has to clear the noise of
> one. Twenty readings of a single arm inside one boot, nothing changed
> between them, span 2.5%; across boots it can only be worse. So the 4.0 to
> 4.2% below clears that floor by under a factor of two, and the 26 to 37%
> clears it by ten. Five runs an arm, the arms alternating inside a boot,
> one warm-up a model discarded, medians of five:
>=20
>   decode tok/s      594 MHz   786 MHz
>   Llama-3.2-1B        17.85     18.60   two cores
>                       11.17     13.77   one core
>   SmolLM2-135M        41.46     43.12   two cores
>                       38.26     41.90   one core
>=20
> Losing 192 MHz costs 4.0 to 4.2% of decode with both cores running. Losing
> a core costs 26 to 37% on the 1B model, at either clock. The rate is the
> cheaper of the two by six to nine times.
>=20
> The two arms cross-check each other: the clock is worth 23% on ONE core
> against 4% on two. With both cores running the bottleneck is no longer the
> clock, which is why this configuration can afford to give up 192 MHz.
>=20
> A core is worth much less on a small model, 2.8 to 7.7% on 135M, where the
> second core's dispatch overhead is not repaid. TTFT moves by under 2%
> either way, so none of this says anything about prefill.
>=20
> An OPP table with the rail attached is the proper answer, and it wants
> driver support this series does not have.

please trim that commit message A LOT :-) .

You're just adding the nodes for the NPU cores, that does
not need a novel-sized commit message.


Additionally, please split this into two commits:
=2D Adding the resets to the power-domains
=2D Adding the nodes for the NPU cores (add pd_npu phandle here too)


Thanks a lot
Heiko




