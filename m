Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD84DF513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9BOU1UGmIiJA8QJdhNKtCSwDtMb06bj8cAR65dey8w=; b=E+XUxY6hPn6DTbzM3xMDJgcidh
	5gBxkrjITTruT12SQk6mLrKiqUaZkSu3RyCVOtFIJJ/FCpWYH65yiypUlnnGRqWq+k9pKeHg8TfNR
	Pm7cLlJKS5rmjUK7+h+7T6GYcSkRJtfIVTIAnoMjT0sWxBAUj0H3Bu/+KGPlV0fdOtPnRfkvN+u0M
	Sp4OTbQQQ5DcPMTUfTw8WcHBANa+86lfPr1eB5NNFVynpUmQs68SIJDN3KhUMBQ0Vh1jGwI1hlpdZ
	JtjOB3MG28Q9aV0x+yrRq3fJUaNFYKiDiyF1zZNxqV5jcrlLIO+ox2m6WsIi9CuJABFZb3oWMprvL
	Sai5RVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJ5G-00000002mpu-13cx;
	Fri, 06 Mar 2026 00:30:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJ5C-00000002mpf-2MvP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 00:30:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06A6F600B0;
	Fri,  6 Mar 2026 00:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D49C116C6;
	Fri,  6 Mar 2026 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772757021;
	bh=vmwInn4SskmODHI1zr76dOW2u1eZLDAg1ejAi8dpHnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgXwyVFo+Emg12wFLR/syV9eMcecLnNwpIHV4W1evV5VsMhIuOrpQJzt8FLE0erVO
	 +mjO1bgKYA0kFwyiY+BJNT453FdxOf5GhdRx+a5NnNBNiLUdxqYvioe1YTMDwIkdna
	 GH2WxnIj4lXR/P4gyY6MZmBUZC9a0lQEImh0AhmfAIfZ8m94RJ3cfK7M/XkEnWVWtD
	 VLBuOSph5JXU9D/i4l3nlJY6Rmk8BLrDezGG8EpRewP0KDaOwMgh45OLFGA0DZCCDH
	 uQptw3s+ingmJ1IGSXaIqQg5zNI3MnHv1yCbQqI0PU1O03l7s5+87M0rx6lNuLag5A
	 6qpfdWdggNbTA==
Date: Thu, 5 Mar 2026 18:30:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Thomas Gleixner <tglx@kernel.org>, Sven Peter <sven@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, asahi@lists.linux.dev
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: apple,aic2:
 Add AICv3
Message-ID: <177275702044.855774.12868970786032244233.robh@kernel.org>
References: <20260223-irq-apple-aic3-v3-0-2b7328076b8d@jannau.net>
 <20260223-irq-apple-aic3-v3-1-2b7328076b8d@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-irq-apple-aic3-v3-1-2b7328076b8d@jannau.net>
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


On Mon, 23 Feb 2026 21:42:46 +0100, Janne Grunau wrote:
> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
> in its base functionality. It can use the same device tree bindings as
> AICv2 so add it to the AICv2 bindings.
> This interrupt controller is used on all Apple SoCs starting with M3 up
> to at least M5.
> The only apparent difference is the increased IRQ config offset. Apple's
> device tree codes this new offset as property of the "aic" node but the
> value stayed constant for all SoCs with "aic,3". Since the SoC specific
> compatible "apple,t8122-aic3" will be used in the driver this offset can
> remain a driver implementation detail.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  .../bindings/interrupt-controller/apple,aic2.yaml  | 30 +++++++++++++++-------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


