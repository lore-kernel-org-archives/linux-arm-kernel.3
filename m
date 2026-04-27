Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5F3FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wDi86DBGFFDicdMwVwodaJ4uPfC4ZZxvDNMLoig8ns=; b=sgbp5KegLMKyEWy3iCoDBXxr4O
	krbTPSzl8VGaJxq259B3DmRzbYJVFdn/FxQreWjaHFYCbSZWWrpSNThfwiWN9+REFDB44NFEljWwx
	qgdbZT4l+D146g2DpZKZCK9ls2LaoQTxaTUnSzd0iu+bKgWQpjpWd5ydGtMTxkPXhRyrM+mbCOepB
	HndMdXi8RXrxONrd2ga4yKMCx3GfH1o9RFkJNRk1TKGpX5s4rzbsAsapG4MVSBknPlS/qrCEHeEHS
	HduraDCdP0AKyibHdgz8Kws2GeFX24YzwMGGC1rwVkKSwIVSSubhCzPavKSCIyd+ErzC4+rlr9yyt
	uRakP0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNtC-0000000HBr3-49Ye;
	Mon, 27 Apr 2026 15:28:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNtB-0000000HBqI-1FXc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8812B40A60;
	Mon, 27 Apr 2026 15:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CACC2BCB4;
	Mon, 27 Apr 2026 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777303728;
	bh=S7DErCvcDgU3Py7arDgFr4qgCbyyAMW6Q9f787JepIA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kAM/1+A4OaCXK71DHHmcizGEwp0yUfLv6HksjEL25/MiP8Tw/PlJY26PIf0KXPUvs
	 2Ey438DhAr8cDc4mHuQriK0+4r7MPLskgMMp69f9E5zeq96CT3HyGvJ59MdsHTWzD1
	 ekDqPck94/ma2pZlqMTiIMoMfAVZyBTSbtOZiw2wfqGkFAn8zjRIxjzklD+op1YhhX
	 r6hcUQERgiaqg33f/nokLIaTtsJ/qK5BSCWoOUGdNdyOkggQSQ7tk+9yVXAaU4YbhC
	 pp5ECCQTt/w4mO5t3FLibASfBn/lAZMMv9Ii4mpD/uxEIBJ9TYDQENaHkJ5wpUgZTG
	 Nciad1eBWRjpA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 0/7] soc: sunxi: sram: Add H616 SRAM support
Message-Id: <177730372628.346868.12505267805077002543.b4-ty@kernel.org>
Date: Mon, 27 Apr 2026 23:28:46 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_082849_364643_8BEB2993 
X-CRM114-Status: UNSURE (   8.63  )
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

On Wed, 25 Mar 2026 00:43:48 +0800, Chen-Yu Tsai wrote:
> The Allwinner H616 has two switchable peripheral SRAM regions:
> 
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
> 
> [...]

Applied to sunxi/drivers-for-7.2 in local tree, thanks!

[1/7] dt-bindings: sram: Document Allwinner H616 VE SRAM
      commit: 5b7f39687b173f042cb9530bcee5f5805020bffd
[2/7] dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
      commit: 775c75e4ae2b0277b5e55644f9890afef4dedee9
[3/7] soc: sunxi: sram: Const-ify sunxi_sram_func data and references
      commit: 7765752f528b5b516d8cdf94faaabcba935dff41
[4/7] soc: sunxi: sram: Allow SRAM to be claimed multiple times
      commit: 67890da74dd1b85a47769561bfc6e0c542762d45
[5/7] soc: sunxi: sram: Support claiming multiple regions per device
      commit: be99eb936b4ffffbf87d34c4a202e15c05b30417
[6/7] soc: sunxi: sram: Add H616 SRAM regions
      commit: b708294322745ce30035d960a1118b4b8d857120

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


