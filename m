Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832C3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcJEOhbvCHCPywLJMxvhzKCsXAEyQWrsIolLVRdMOb8=; b=e4tgKHbsTFW7bdslsoqS+i3k8z
	MV7sztAM8GIlcFgES/8Zacba6Lc0HrTOHHyGYNDALCiDIPHmGyOjL4eolLsIwTBDFsMXpjt1j7aAF
	iJS+dy+OhL0kj6LdJejOxrI6q0EYMi67d6aLR0inmmL/0sQC8k9qjTxbinosRWaH5JI2HcHvrm/j2
	vNHuIX9rc9O0/wrhxTGr7vCLsSS1FKdhb5Vdrds2eQepQkNKJSO5ZsH3eBkSaEbK6GuPH+wkbTQzo
	3PyWGidU1tTkVe4eG4Ggn2Ai0g0QdR/5lLDz6gquBGwlQAFMF7pvg2rKbleiSduzDzlZ0sTVyMN5z
	iJn0iCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueabf-00000005DyM-2hzb;
	Wed, 23 Jul 2025 14:38:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZoU-00000005694-1eWj;
	Wed, 23 Jul 2025 13:47:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCB745C62DD;
	Wed, 23 Jul 2025 13:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F62EC4CEE7;
	Wed, 23 Jul 2025 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753278437;
	bh=mDf9hGRa+hZOj+1JrXcwZtqq2caWcW+UkVVFTPkikUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0tkOPL1ASB54sO5jqP7x9+WdFZC59SO7sY4RYhnU5AOW06Ba11S8nQQgcq/qvy4K
	 tjCVdaZHfYr/pr6eLE8g4wP20uUvKGTwjop/mcO/8AXyGkuJPZZQr9czN5VblY+3XI
	 pVPrVn27a7B+PCMPPmV1dDk2XopBsMfwzV6lyjQInjWCLgjDbC+PiQA5oG9oyqnKXy
	 jV1U2nW78n2WeNNLtScDG+Qos/tnaEFoYK4TAZY/mmmGmmHu9kf6KYQRIu+mIRIpsM
	 zfmU5Bvr/rW1PGGADs+SVjUydWW3De9gkmOZNLGZBqcqkFabZXtbFv64FMAOihOOlv
	 10o65FCTGsWng==
Date: Wed, 23 Jul 2025 08:47:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: linux-arm-kernel@lists.infradead.org, Yao Zi <ziyao@disroot.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: i2c: i2c-rk3x: Allow use of a
 power-domain
Message-ID: <175327843600.2144777.12217048091920354736.robh@kernel.org>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
 <20250723085654.2273324-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723085654.2273324-3-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_064718_472674_F93E457A 
X-CRM114-Status: GOOD (  14.11  )
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


On Wed, 23 Jul 2025 08:56:44 +0000, Jonas Karlman wrote:
> The I2C controllers in most Rockchip SoCs are part of power domains that
> are always powered on, i.e. PD_BUS or PD_PMU. These always powered
> on power domains have typically not been described in the device tree.
> 
> Because these power domains have been left out of the device tree there
> has not been any real need to properly describe the I2C controllers
> power domain.
> 
> On RK3528 the I2C controllers are spread out among the described
> PD_RKVENC, PD_VO and PD_VPU power domains. However, one I2C controller
> belong to an undescribed always powered on power domain.
> 
> Add support to describe an optional power-domains for the I2C
> controllers in Rockchip SoCs.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: Update commit message
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


