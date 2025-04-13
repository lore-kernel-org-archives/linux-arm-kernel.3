Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0435EC369B1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 15:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ett+VizRhadybfgCz9Z9BwiUIHEbMf+I7ZtCJycORfI=; b=SaMRdP3cmEcMeUEbhcupz8PgUm
	1wzkmfZ7kAh2z2n0Ibh08SYq/AD4arpBST6xEXSpoOYlAQnjzLfrbVDIXoTcCYthOCIyn+Qe4rhaV
	OL97rGkJgl4eIVsYcIHxell52quxM5GA690qRRvoxEVZsC74weA59X5INzpQ0jmRlWOZJDpphtlyh
	ZWrprvnAy8IOgH6jQQgI1gXpT/9XcuHoO8G0tcV3+YKq7uYt/04qkETjWNymh6DjOOevbZXVGByVr
	H5LKZ2JuzB6GB6GCSSbwCjKm3YfRGR0pRz6/11H7l1Bx+2AhT9WH/2QbwpCUCIeDm1wFHfyXTS1be
	W6klYfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3z7b-0000000HJls-2zlZ;
	Sun, 13 Apr 2025 15:19:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3z5l-0000000HJf0-0LJh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 15:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2AF51A4020F;
	Sun, 13 Apr 2025 15:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232A3C4CEDD;
	Sun, 13 Apr 2025 15:17:51 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 0DCE75F939;
	Sun, 13 Apr 2025 23:17:48 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>, Rob Herring <robh@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250214220247.10810-1-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
Subject: Re: (subset) [PATCH v3 0/5] ASoC: sun4i-codec: add headphone
 dectection for Anbernic RG35XX devices
Message-Id: <174455746802.3439512.6704778087672497474.b4-ty@csie.org>
Date: Sun, 13 Apr 2025 23:17:48 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_081753_186943_B4F3C403 
X-CRM114-Status: GOOD (  10.35  )
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

On Sat, 15 Feb 2025 11:02:22 +1300, Ryan Walklin wrote:
> V3 of this patch adding headphone jack detection support to the Anbernic RGnnXX series of handhelds. V3 corrects my misunderstanding of derivation of ALSA UCM file paths, and adds recieved Reviewed-by and Tested-by tags. Thanks to those that have reviewed and fed back on previous versions.
> 
> Original message below:
> 
> This series adds the required device tree bindings to describe GPIOs for jack detection in the sun4i-codec driver, adds support for jack detection to the codec machine driver, and describes the hardware configuration in the RG35XX DTS. The existing speaker amplifier GPIO pin can then be used in concert with jack detection to enable userspace sound servers (via an ALSA UCM configuration) to disable the speaker route when headphones are connected.
> 
> Thanks to Chris Morgan for his assistance putting this series together.
> 
> [...]

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[4/5] arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
      commit: 69714722df19a7d9e81b7e8f208ca8f325af4502

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


