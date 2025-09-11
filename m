Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8710CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0brIWnFOYobsTsOUX6dfrNsuXqDAgzuoKJXRW5URUbM=; b=sC185NQEPk+AeEkkJpx9dOsplu
	B/JtU07KcNBBRakfjBcFFje3TvqN7IdplIg+pQ5827bdLgw6TCkkYOhsunQXSGPXng+sq1g8jByR9
	onYdXVt3fKIGq4PpEdcJ4GolCtcXNDHv3nAPq72dX0SpqkzYw1ECffovNi4GpJiQLhG7/IbftE5yz
	CfzSw+SiIzS6Vsf/dMXBvnRMoQKVjX3puxol5DvWgmNQsac23Zd36AssWRE5G7qdOdLp71WJF7NZA
	M1vNogZs26UE6dQ2yD5kCZRIikwfzPxcoFGUJbaHS/kcYaLC66MnIUYYSU02b8j6xw36Kk4ykmqDl
	Ql/CPMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwm0o-00000004jCB-3VPG;
	Thu, 11 Sep 2025 18:27:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwm0n-00000004jBl-3ndx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E11B6022C;
	Thu, 11 Sep 2025 18:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA234C4CEF0;
	Thu, 11 Sep 2025 18:27:12 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id A2B4F5F752;
	Fri, 12 Sep 2025 02:27:10 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250909170947.2221611-1-wens@kernel.org>
References: <20250909170947.2221611-1-wens@kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: sun6i-rtc: Add A523 specifics
Message-Id: <175761523064.3162090.15869713865549110289.b4-ty@csie.org>
Date: Fri, 12 Sep 2025 02:27:10 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Wed, 10 Sep 2025 01:09:47 +0800, Chen-Yu Tsai wrote:
> The A523's RTC block is backward compatible with the R329's, but it also
> has a calibration function for its internal oscillator, which would
> allow it to provide a clock rate closer to the desired 32.768 KHz. This
> is useful on the Radxa Cubie A5E, which does not have an external 32.768
> KHz crystal.
> 
> Add new compatible-specific data for it.
> 
> [...]

Applied to sunxi/clk-for-6.18 in local tree, thanks!

[1/1] clk: sunxi-ng: sun6i-rtc: Add A523 specifics
      commit: 7aa8781f379c32c31bd78f1408a31765b2297c43

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


