Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA66FCD0CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 07:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dm8nloxB7a4lKdtN1G1u7tvNf+IRoiVYTRO2+aKqP90=; b=07pr1l7i4UcqEBV6ba2uevAXP9
	Ij9h1dPISrX5puxn3qsUiouQx4xAY8dQPwyOeNvcQI8/fIh+nCide2XDz2MQE33C+Mf1R6lz/org8
	FVVRQZ96lyzSUiEp43g8q894ebCRH+Qjpe52eAH0BQGp4iPGVqD0uX3I8uZuwkVFxVYcv+sdNXmnn
	FJPksMJEjNq5W7TiIJGkzjFzWI+5UNZsETebLsP9jBrmQXnQTMvuKZUfKP5bNezB4PDC1OyfbuQtj
	BmXJq5WHRyAUZ9Di1aVVtNfFgCAtILgJEVKCvJEbb00yTwX54IC0jG/TnIVStd87aPSpkJbOSmS8s
	INZg5wHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2llR-00000007xvr-1cRM;
	Wed, 18 Mar 2026 07:56:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2llP-00000007xvB-3Jxe;
	Wed, 18 Mar 2026 07:56:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C278A401D9;
	Wed, 18 Mar 2026 07:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17259C19421;
	Wed, 18 Mar 2026 07:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773820582;
	bh=Dm8nloxB7a4lKdtN1G1u7tvNf+IRoiVYTRO2+aKqP90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onwpR3ksvKHwW/w02b0cYAKyTnkIypaEko8bIAFKGYiNL0wVPIYy2H95Y0/EKbe6f
	 Prpkct0J74uqCe6SuShrUHOhkieG6yzsOgh9Fy3E9FloSNCgGfyjr8R2Cs/WP2irnC
	 2aIa/quFcNZmHy0pGXepzxhz1BYeTHNRYKxYjrxsZSCELcoPOx0Xfbcqb0rC+88ODK
	 yhMzgwtXQAGDYBneLD7fWAl2/rr8ioMkCDtz9loBgoFzIupTdgyU4Ew+z9McKAyfTk
	 pyXBe09Z1sLBesr62KzwstrePteZ0qB5qsSkyrXQcfDLiDacac8GEbKK6kRftRfGBA
	 cS1PRZzpR2fNg==
Date: Wed, 18 Mar 2026 08:56:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gray Huang <gray.huang@wesion.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, naoki@radxa.com, jonas@kwiboo.se, 
	chaoyi.chen@rock-chips.com, i@chainsx.cn, michael.opdenacker@rootcommit.com, 
	inindev@gmail.com, quentin.schulz@cherry.de, andrew@lunn.ch, alchark@gmail.com, 
	pbrobinson@gmail.com, nick@khadas.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Khadas Edge 2L
 board
Message-ID: <20260318-spicy-wasp-of-prosperity-9ad730@quoll>
References: <20260317090731.600787-1-gray.huang@wesion.com>
 <20260317090731.600787-2-gray.huang@wesion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317090731.600787-2-gray.huang@wesion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_005623_849701_57BBC6B1 
X-CRM114-Status: GOOD (  11.97  )
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

On Tue, Mar 17, 2026 at 05:07:30PM +0800, Gray Huang wrote:
> The Khadas Edge 2L is a single board computer based on the
> Rockchip RK3576 SoC.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


