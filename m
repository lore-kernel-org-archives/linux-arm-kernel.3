Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6855BCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 21:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21q3frG5dqsfzhzDGUSQ2foZqGYT+5Kd243FESgXfYg=; b=bml2evUWXZmbgUI5EsDfVp7Di0
	V4cYqRnWC/9qHUtfXsp4pnd4Vh5lWLzbX0S/2UGICb8eOp9dO2gjU3kqIR2fVYtDRohfX5ZDPXn99
	eS5VTLcLhG+oho+F8N+daSqlk6DTeQQwDj/zyZab8il+Kd2wvwmPNLi5xDQ+GFH7Us9YCKPzDOg19
	MUS48TSJ/kQTCfTSaksW3XZVEAgO+V02ZCNm0rJBYKoiRp41SpwQGq39fFnz231vqXhT10mBN8hd/
	20nuuFcww3t/73i+bWAEAkrwNYoCYh8x29HLKAYm+yLx71+LBG0Gu/GEpDW1lHn8EpQiBv39enum1
	G5tyhPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsnf-0000000FpW9-1ylI;
	Wed, 03 Jun 2026 21:06:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsnd-0000000FpW2-3K4c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 21:06:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4ACD60138;
	Wed,  3 Jun 2026 21:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A893D1F00893;
	Wed,  3 Jun 2026 21:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780520812;
	bh=21q3frG5dqsfzhzDGUSQ2foZqGYT+5Kd243FESgXfYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nydNbfnm6Q5PM5n4h1PYamx+MAScoZSsjbgXa+PidSrdlv9limWwAAs3w1gBxgW3/
	 E2eDdyXoSqKK97c/sq0583UeeMRLETMOdukT3NfBOxopHZbugjnQcuX3EzwPciOpkr
	 YL0jB0WM3VW5Q73BK4TcFxQCXcu21BGcy9UIisT4THSEErXd1SnwKHO8Xym6Xof1y4
	 CVNXDJDN/VjIWvoU2mY4RlYK9vIMPKtgAqbUU1Y6hoDv9ejbMyW+5ooj6Y6ThM3vtS
	 WMofj3ch2GU28t6P4s7QXSFiP2onkVdUaEJky1Qel8NaKg7Iermv4Jy6sNxJEYxdTJ
	 AR7+TlBkLkgAQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Document SVE constraints on new hwcaps
Date: Wed,  3 Jun 2026 22:06:27 +0100
Message-ID: <178048736181.314885.11070346483704289867.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-arm64-elf-hwcaps-sve-cleanup-v1-1-07b0cedfc6fa@kernel.org>
References: <20260522-arm64-elf-hwcaps-sve-cleanup-v1-1-07b0cedfc6fa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 22 May 2026 18:50:28 +0100, Mark Brown wrote:
> Two of the SVE hwcaps added for the SVE features in the 2025 dpISA did
> not explicitly call out their dependency on SVE in the ABI documentation.
> Do so.
> 
> While we're here reorder the SVE and fature specific ID registers for
> HWCAP3_SVE_LUT6 which did have the SVE dependency but listed it second
> unlike the other SVE specific ID registers.
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64: Document SVE constraints on new hwcaps
      https://git.kernel.org/arm64/c/f20f8fe086b2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

