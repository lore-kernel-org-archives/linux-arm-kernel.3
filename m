Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F60F3D603
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKdZ/CLFWwRFebVOvpmsQYitvwGD/Kh9v9tJtuHFIqQ=; b=U+v1ZHjxK8LFiI/tOSGcBMGdMP
	FphbpdXKDka503zxfMsGU3yxvT4piIH9nD5J2LoHOBk84AzL5Mq33wGMVtn4yhpA1LFD/b37kK/Oy
	fljdIot8/ybe+wo4rhwnXJvEizV0U4Ft4WA4apNtnORACeReme9It167+7DENweejxZi+slclPZkd
	edl2cDzypAxExepxX5CIxPQ9DWaAXt4DJNyq0cR2G/ayiEZIvikFAD4rzeV89Dp3ahFl7CRouwIX9
	ydpJLVSP7y5uYy0mLl42TkM/cXXbcK+fLOvtCYRv2V/+iqyftepdCS3kD+agS7C7atilGi2BSonGF
	m4qbdXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6q6V-00000009yhp-2dVS;
	Sun, 29 Mar 2026 13:23:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6q6O-00000009yga-1Dtv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 13:22:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA105600AE;
	Sun, 29 Mar 2026 13:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BE7C19423;
	Sun, 29 Mar 2026 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774790571;
	bh=ovSEObgeRsjslMxSegbqTaXP9AY03Bd+E9w45gtnMZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ch0n749c2exxPRXJhPWOg9Y2Aq5QzOirVWOjSpDk7/qFt/zla8VNq0oNEySTgE7la
	 tkMW/LaZ5uZ6SO7tAs0MeevDvCRcWmFLdza0BFTRxrMgpRFXeJWoqpiSye1eH06uQn
	 /JgCyXb5cwuyHoEzhg+aOFVFarTg8p+bXGTJpOEDeRfDje54m+0dSse4CY/Uox4lI9
	 Rvy3R9+KQjZlEUPm3vxFkmH1D5s53M23fWoDzsj2QCJvom75FjvYlhPorLdFN1qThD
	 ZmPgrgRk+PK3hilQCDVfCMBZKJZWXYb4a+AJ6VhMFOCMxKUUP4d6G6bh56ttnQXAfd
	 +YKcnKGqvFhow==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
References: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
Subject: Re: [PATCH] arm64: dts: allwinner: enable h616 timer support
Message-Id: <177479056948.84952.5705441423668653540.b4-ty@kernel.org>
Date: Sun, 29 Mar 2026 21:22:49 +0800
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

On Sun, 29 Mar 2026 13:43:04 +0200, Michal Piekos wrote:
> Add support for timer by reusing existing sun4i timer driver.
> 
> H616 timer is compatible with earlier sunxi timer variants and provides
> both clocksource and clockevent functionality. It runs from 24 MHz
> oscillator. It can serve as broadcast clockevent for wake up from idle
> states.
> 
> [...]

Applied to sunxi/dt-for-7.1 in local tree, thanks!

[1/1] arm64: dts: allwinner: enable h616 timer support
      commit: c755e39836ec492b0bc210fd96c2b720b5b4a690

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


