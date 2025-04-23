Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5586C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=889diwO9PL1y9ETu/yua/lKy33nZelj3yWdSXwg/JkA=; b=1o//fnic3B9f6AbGE/fUWQ8Bof
	UDOvyvchAdMjUF3rEqx07IGsyACpRyKrNgCY/rE+aK3q7u5sp7cX2FPF9jNxCuxHz4vPfiWPzXNd5
	fla7BFBLzhFRhct7nBOlEdmwSLkUuhhsJixjcGuUi1WC4JAvV3dUPA1mdgc72EUcL2UF/l2HX2T4Q
	HYIjit4d1rlYsLQTtfPProAJ0A7oXpOvSWpx8tnClMLTDoGKm813WgSiSpf7Zl79QBK9yJGR9XLf1
	lk+Pz3Z8ve4yR2mEb2SjSvkK03VUqolJIt8oQ5zoTnKyZFom63oZSQUPP8qvXtrkvFaod8v01CKCi
	oflwNlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8U-0000000BNQa-2eP8;
	Wed, 23 Apr 2025 17:43:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cID-0000000B0mq-0p8K;
	Wed, 23 Apr 2025 15:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 66259615ED;
	Wed, 23 Apr 2025 15:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3897C4CEE2;
	Wed, 23 Apr 2025 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423144;
	bh=uXGY1VAD0ezdy/ybNS4JN/GqOzUTWI23//dv6QmQUdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0f0eh/2LvsfL4iutKlrnN7chSnjyw9pMqdFl73WtrDzgT2ZydtvcA8ApMRrfVIYy
	 0CZgrRPJS++EmO8LsVSliQHDPcJ4RjdLHd80VCSoQOqGK2G/sxQPoZ0XojLkat0gbl
	 X9euuD1yjltFR9FrI4sj7wt/r4snbcmpPCPgsfGpPE6QkuX0XI/6o5kEQETPqu2/NC
	 34NzBeNuKsBs5HwcJNh7E93sOIpOuLw5h5wZ4lGRL6HeCBSSF4EK6B1Vxc96zgxjOV
	 XwqUIMgq4hiEEAgxXOvGPFodHikCT0z4VCIUYX0Ma0thcWjIropdyYMZw+iZRxy4cb
	 R0dclULDW9zZA==
Date: Wed, 23 Apr 2025 10:45:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 eKTH8D18
Message-ID: <174542314188.576994.12974029497689302557.robh@kernel.org>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-2-wenst@chromium.org>
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


On Mon, 21 Apr 2025 18:12:39 +0800, Chen-Yu Tsai wrote:
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
> 
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
> 
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Reworded commit message
> - Dropped the enum for the new compatible string entry
> - Dropped constraint on I2C address completely
> ---
>  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


