Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDB1D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERjgxJ4DrFwJo/Np58ujiRLeDjjvc9H/Rm0raqGusbU=; b=jFBi5LklTwqTBb0TwIur90MEAI
	0/FG8mjF3oTF9mM5TJpFTR1OkxCu0MLjmP8MrAGdnCL3MOZMUZYGhw8I3b/g/cHGUF/mihgYcJcgN
	eXRwpV/xObkUxFRnDNB3sw0lGZwLE18Gn+bg0+qIsNJdVM+kV+XPA80+Sr6qxrIRo3Wdnb4TpmoN/
	7ymSdRSGnW+qsdFWF2d2lFC+BhVip/U9n99elZAp6GvzKgXkZAJ2SepS+l6QL7vUH5GBkF7xsDSkH
	8ecaCGuqSjpSst5xHl2jsjMcsTpMHPer/xZIaV/dEfmj8qxKhkpXmUcKpSw9kZ3jn/dU0wx8s+f5x
	nk1jtwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MOu-00000004HKE-1g0L;
	Fri, 25 Oct 2024 15:38:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MAN-00000004EJO-163S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 15:23:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F5D75C5541;
	Fri, 25 Oct 2024 15:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAE7C4CEC3;
	Fri, 25 Oct 2024 15:23:53 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id C11375FC74;
	Fri, 25 Oct 2024 23:23:51 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chris Morgan <macroalpha82@gmail.com>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Ryan Walklin <ryan@testtoast.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
Subject: Re: (subset) [PATCH v3 0/7] ASoC: add Allwinner H616 audio codec
 support
Message-Id: <172986983176.724831.16448231120068380568.b4-ty@csie.org>
Date: Fri, 25 Oct 2024 23:23:51 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_082355_380113_BA514A5B 
X-CRM114-Status: GOOD (  13.24  )
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

On Wed, 23 Oct 2024 20:56:56 +1300, Ryan Walklin wrote:
> V3 of this patch adding support for the Allwinner H616 (and variant)'s audio codec. Some clarification of comments, particularly regarding the clock driver changes, and a small fix for the device tree binding (apologies I forgot to re-run dt_binding_check on V2). Review comments otherwise addressed and reviews noted.
> 
> Changelog v1..v2:
> - Reordered patches to group ASoC changes
> - Corrected PLL_AUDIO clock dividers to match values from manual and vendor SDK.
> - Remove PLL_AUDIO_4X clock from the device tree binding (not used in the driver).
> - Restrict TX-only DMA changes to the H616.
> - Change the codec name to fit into the 16 char limit.
> - Move the codec (and spdif) blocks in the H616 DTSI to restore address-order.
> - Add board enablement (and power/GPIO changes for RG35XX to support speaker amp).
> 
> [...]

Applied to dt-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[6/7] arm64: dts: allwinner: h616: Add audio codec node
      commit: 3eef85034c96f61b54809e24d4b7f29a336701ae
[7/7] arm64: dts: allwinner: h313/h616/h618/h700: Enable audio codec for all supported boards
      commit: 86a8f1aef9702f730c824aa96ae24ffa1b401988

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


