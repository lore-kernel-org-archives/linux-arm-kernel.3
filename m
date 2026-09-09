Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2813BC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQc+Uc9CXTyrtR8l5K6ylLrvmXTF+T5Q3He3R+s5NIw=; b=RDvS7GxBk8kdfFTeS0mQFRBzT1
	ao1bxatbQBMNSxUdXV640YwvVBFJMTigaBkcMVNvZ/6wQYCY12y4CTDHVUlNFVXQeQpVU+IjiebMm
	xlxzpddP31vksECJ88UthzOKu2BMdL93tPU+7QElrB3mR48asw2lYl2aFW+XxS9i5Mf+bdsc0Ebn4
	LaPBOxVXrLjfFnm8S2hmBeaDYSeu3d4gEEzErfOBUTVsnQBRYUbawa2FSayjDH8H6nlX8upAAPOLw
	kHi+4KGKWeiFijJ9KlKkLCQ7jBKfca4F95YTarwd00gwQYYGBUksRlZ19qGITWCSVbFbiBm3hOFNa
	YP3USn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CYc-0000000Axa0-0Bjv;
	Wed, 09 Sep 2026 07:17:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CYY-0000000AxZr-3vaO;
	Wed, 09 Sep 2026 07:17:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 473DC601FD;
	Wed,  9 Sep 2026 07:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03131F00A3A;
	Wed,  9 Sep 2026 07:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788938238;
	bh=HQc+Uc9CXTyrtR8l5K6ylLrvmXTF+T5Q3He3R+s5NIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TyOSDITnqL09whZ9Qxy6HEuAumowpSXOCY2gC/KkM0WG4ZCV2Yr0RiZp9HAratldc
	 bt427rgNrENsanlMeq/E8ExIVLGScRc0zDtqlinlmcpavbN9pg4Z+FvK+oYEHwfFlI
	 Dsdb3FzSkS59Arm4JbLPEtzB/vy6FtMiafvR53gdvohoAs7rfYKepCDGhm6u++O/dv
	 ICV2O/7bJiQAGhlF6DN0wLkGz1xuyjEZwuhbIgeW8lYoBJrV8hQjbcQPweROIAEnYI
	 jQy+oQBM5PHzCw6qfZ/C9hWhDbiJGl9Ki7fV9DCSaAjE31mefL/W1ybm020HqGhG1V
	 /BE8iMO7qLBXw==
Date: Wed, 9 Sep 2026 09:17:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clk: sun60i-a733-ccu: Add Allwinner
 A733 support
Message-ID: <20260909-illegal-organic-mammoth-5daf5d@quoll>
References: <20260905-a733-clk-v3-0-50f238f39c78@pigmoral.tech>
 <20260905-a733-clk-v3-1-50f238f39c78@pigmoral.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260905-a733-clk-v3-1-50f238f39c78@pigmoral.tech>
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

On Sat, Sep 05, 2026 at 12:45:30AM +0800, Junhui Liu wrote:
> The CCU and R-CCU (PRCM) modules provide clocks and reset functions for
> the Allwinner A733 SoC. The clock architecture of the A733 is evolved
> from the A523, though the root clocking strategy transitions from a
> static oscillator frequency in the Devicetree to the "hosc" clock, which
> is determined by choosing from three possible frequencies (19.2MHz,
> 24MHz, or 26MHz) by the RTC hardware, and finally feeds the CCU and
> R-CCU.
> 
> Additionally, the MCU_CCU module found in previous designs is removed
> from the A733, and the clock tree is expanded with more clock outputs
> to support new functional modules.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/clock/allwinner,sun60i-a733-ccu.yaml  | 107 ++++++++
>  .../dt-bindings/clock/allwinner,sun60i-a733-ccu.h  | 290 +++++++++++++++++++++
>  .../clock/allwinner,sun60i-a733-r-ccu.h            |  39 +++
>  .../dt-bindings/reset/allwinner,sun60i-a733-ccu.h  | 129 +++++++++
>  .../reset/allwinner,sun60i-a733-r-ccu.h            |  23 ++
>  5 files changed, 588 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


