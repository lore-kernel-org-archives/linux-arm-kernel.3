Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8459FCD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 06:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQ7iIKGL0BGLyRSKSjNnDs/7mUwI6/ERAzpdHSV1fgc=; b=fWYu6+zQsIRayiP+xYrrqTudkY
	swvZZwqDp4LYQm9mQbAD42Wwt59sGk8WYxA3gYv9KK3y+xZhWB60QR9wlZkAm7uO8Ab1Y4BFh5zB5
	4+XMzb7VnUokHoc05gg6kqqQBMUKzs6UziZScEnKovAW+0MUYs0DRtSNvq0b3TVauywn+9HAbKLD4
	DCXQOYLcShSS/ZRNzAnVP1TCthPRsx4WXSaT2YLz6x1FZm/2S/C9PWojXSLhLBWVHvWTv7/btaVOj
	fv0nQHe1X1Xk5ke2v4oSerfPNsVPSeDVHO8mSritCktCjOVBUV1ISmO2EAt1HpStdShGh0kCXL3SD
	ZsPcbWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPao9-00000003idH-2fl2;
	Wed, 20 May 2026 06:53:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPao7-00000003icS-3jWk;
	Wed, 20 May 2026 06:53:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 8A7AA40481;
	Wed, 20 May 2026 06:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D56F71F000E9;
	Wed, 20 May 2026 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260011;
	bh=yQ7iIKGL0BGLyRSKSjNnDs/7mUwI6/ERAzpdHSV1fgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G61aUJR1cx0mQolYLl+yLbzPUScb5mYq3Gmp0PAMJ3pNpCvyaRIvr+wg0/Oc6SeT5
	 65ga2GQ82m5NUhagstnAh+5uaAU91srRTH2SWRgAMBwBw5WzLqfya2gaR/LLXdfx48
	 Zjr2AWKO/qdtsU6CM6HFNIL0E3/uD8bUvekDAJdW2Xo5kuyirbupqTxQNNC9U4tXAW
	 zBPuXl7vs3+t7bHj461XKTr8snyao/EQ481P1DSJpFKJZwR2O+kjgT0OhPaC2pwnFl
	 v99WoGfyqkEzmONXpeOmsqzwZ3RLaAGCpoEb2tM5bA3iezfyTzaPof+WPY9aPvwAgx
	 f5N2RSz4ir6Eg==
Date: Wed, 20 May 2026 08:53:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 2/6] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
Message-ID: <20260520-prudent-merry-chachalaca-6cbae2@quoll>
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
 <20260519220813.28468-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519220813.28468-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_235331_948363_9B14859C 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 20, 2026 at 12:08:07AM +0200, Christian Marangi wrote:
> Add PHY cell property for Serdes port selection. Currently supported only
> for Airoha AN7581 SoC, that support up to 4 Serdes port.
> 
> The Serdes port can support both PCIe, USB3 or Ethernet mode.
> 
> The available Serdes port can be selected following the dt-binding header
> in [2].
> 
> [2] <include/dt-bindings/soc/airoha,scu-ssr.h>
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/clock/airoha,en7523-scu.yaml     | 9 +++++++++

The bindings header should be squashed here as I asked previously.

Best regards,
Krzysztof


