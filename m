Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F55C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzOIw+wrBdEXnSH9JiAiSu/zA7y/aaKeIqkEVGXEnbw=; b=Y4i1gj1jUEEi+yUdlPKqSSKXxt
	O1RohPx63eq8WzFduQef4SKG4oHfROjLclGH+M0fQtYNoQ2VZPSh2KUxHIy/iPW1/oOHBxSIG8uX9
	uAXWyIYGg5nmROTs5kOze3oPLzDvCjGUj8M19EAQsbboDh5Ih1ePt3nnmS8zUgttHWNJugcBlwTJX
	7lw8T/gI9qrsvvAG6kMHRmM6zdIogAuRD121qwuCwNqoxChYIRGrD7NtzuPBJkYjLEj7knYCszw3L
	7GPxOka+/9s7NXVgB1uZG2k0fxWvAoOwsPDaSrCzR76uvK8zODQ2vvKhvpo52GgN2Amvo9O1onKkd
	cgp5vWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6rv-000000017OW-1SFQ;
	Mon, 03 Mar 2025 14:34:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6kE-000000016DB-1IxL;
	Mon, 03 Mar 2025 14:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D65A35C59BF;
	Mon,  3 Mar 2025 14:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A38DC4CED6;
	Mon,  3 Mar 2025 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741011969;
	bh=0g9fQWh0Jv15zl9OPaLLQofjM1L8RSDKnVZdipTRZCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AXmZDD4Z9JhXaUrSlitgAjv2ProElafpbv8DEBeM8BFxzkXJaqr7hxgnvWCNxKnXg
	 FpnnEOFIsP87R/dqG0i/j4TOH95iuIhzu3WHBJk239wRqEbMNg2y9dxsV67+PaIbvo
	 01L4IIQpyjRChsYJbNunusnwgpusho9cFVWb77cLG4HN015/DME/JiNlr8wNWxKMU6
	 eVsiPkCMqat8MCAj9PO8x+sKvOtRCVFnfbtwLwHKCb4UDRnoVv5+OD1cj8r3zxSjnI
	 HE87mpYyQ3HaC2xmnZt2ZgCuAe/BijhRSQL8W6R4I2MnmVGrcJBP01yg+yEiJUM2Ca
	 iRG1yvmq7s1qw==
Date: Mon, 3 Mar 2025 08:26:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v3 4/6] dt-bindings: thermal: rockchip: document otp
 thermal trim
Message-ID: <174101196712.1786336.17880487519994518563.robh@kernel.org>
References: <20250228-rk3576-tsadc-upstream-v3-0-4bfbb3b699b9@collabora.com>
 <20250228-rk3576-tsadc-upstream-v3-4-4bfbb3b699b9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-rk3576-tsadc-upstream-v3-4-4bfbb3b699b9@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_062610_413784_246A03C4 
X-CRM114-Status: GOOD (  12.36  )
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


On Fri, 28 Feb 2025 21:06:54 +0100, Nicolas Frattaroli wrote:
> Several Rockchip SoCs, such as the RK3576, can store calibration trim
> data for thermal sensors in OTP cells. This capability should be
> documented.
> 
> Such a rockchip thermal sensor may reference cell handles that store
> both a chip-wide trim for all the sensors, as well as cell handles
> for each individual sensor channel pointing to that specific sensor's
> trim value.
> 
> Additionally, the thermal sensor may optionally reference cells which
> store the base in terms of degrees celsius and decicelsius that the trim
> is relative to.
> 
> Each SoC that implements this appears to have a slightly different
> combination of chip-wide trim, base, base fractional part and
> per-channel trim, so which ones do which is documented in the bindings.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/thermal/rockchip-thermal.yaml         | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


