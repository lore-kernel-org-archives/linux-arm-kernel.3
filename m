Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B78C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXHrRP7wRXkgYn+9Dq4V50dhi93D5rjlFJXd8dS4V2E=; b=nUdvcedZIq8Gdu++YQ6VyfvpgT
	qeS7cAdwyMEqc/28aYumcxqVOyG92cRGRno0w8y4Lt2XIdv1K9PUlkUBaAzpAMRHIbbOpoQmLqaHb
	8ZchfjpVG88bZel06v9+EgWJAD6FZeF52tmO4g/SFGyGm6Z5zOq4cn7c6NnMDDdjDdm25mrv600eU
	p0ZBDgfeAUvIqZHhf8FVU9NW7gHERQJkZgUz26gzaAlRH/NyhFEQg96mu7mJgjcHqc8NWUBT+HyRM
	/UnvQ+YG/5EdnssSTiD+4DwiuYV8IZsJ7R8c1j2glEM3NNUNLMhHDlz/X2FFOGbV8Cnc7QwyLZjtp
	DchFSkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieiz-0000000CMw1-31iG;
	Thu, 13 Feb 2025 19:18:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidlv-0000000CBqs-0Yha;
	Thu, 13 Feb 2025 18:17:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1F720A4286D;
	Thu, 13 Feb 2025 18:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C31C4CEE4;
	Thu, 13 Feb 2025 18:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739470630;
	bh=jqUXucE5Y4nnB+VCTZkmpXrxMC8l+mi2tGy84H4NNcY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NNm6iLA/2zFOZ5gGKKqqyEklXzhKkN6DF7zk9/SE0CPtzhKVxtg7H6b5iDX1uul80
	 +fjTtwk3SAHwZf6kXRtTo0+46PRebIOlPubE681TCKxKWypKRoN4H0G/s3mW2EQm8N
	 UaAPnKrsP9F+4gUQ3t+AqeNKzVpmTjOKVr4h/+oqwKeeF9bLKF/5m0eXMBXf586emD
	 AbjNWbxyRcUkSASnjgSMe/FY1sLGdb//Pt44OoS3oTZHFn/Va5+zCSVWeZkJA5teaS
	 wkdGyLyosLv2TOMSN1hViIeZyGI2Z9ZidAuk1LJWhbl0R1z5zNU5hXZQwbvgs3iji6
	 3PiAIHk+cSvKg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, heiko@sntech.de, 
 Damon Ding <damon.ding@rock-chips.com>
Cc: dmitry.baryshkov@linaro.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250205105157.580060-1-damon.ding@rock-chips.com>
References: <20250205105157.580060-1-damon.ding@rock-chips.com>
Subject: Re: [PATCH v7 0/4] Add eDP mode support for Rockchip Samsung HDPTX
 PHY
Message-Id: <173947062734.294083.3270476483137876424.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 23:47:07 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_101711_239660_670E51E3 
X-CRM114-Status: UNSURE (   4.90  )
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


On Wed, 05 Feb 2025 18:51:53 +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=927102
> 
> Damon Ding (4):
>   phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and
>     ROPLL_REF
>   phy: phy-rockchip-samsung-hdptx: Supplement some register names with
>     their full version
>   phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all
>     registers
>   phy: phy-rockchip-samsung-hdptx: Add eDP mode support for RK3588
> 
> [...]

Applied, thanks!

[1/4] phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and ROPLL_REF
      commit: 2947c8065e9efdd3b6434d2817dc8896234a3fc0
[2/4] phy: phy-rockchip-samsung-hdptx: Supplement some register names with their full version
      commit: f706024107204cb0b640bac35ea47e7b91b8c71f
[3/4] phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all registers
      commit: 2dc8224e3758c5d6387786ea1d74d2d510149b1a
[4/4] phy: phy-rockchip-samsung-hdptx: Add eDP mode support for RK3588
      commit: 8f831f272b4c89aa13b45bd010c2c18ad97a3f1b

Best regards,
-- 
~Vinod



