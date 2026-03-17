Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852BCF3380C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEVYbSVdu+Jfl09GsX/kKoF7bHVJIjqf2BuR4Hu/TWA=; b=swdM8pF5e0xEdlv0GLqc2doqot
	TQ6LiqHRwzBGSAOIkChUST6Gb1LADTz3W9DEQAo3iZofTXUnBB8XLVLk+pbXvqdhb72BFuPg92s0B
	BC6oZX6Phh98VvQ39dwOAaFSUIUwwQROCcKsezpeXWYYRyKNNEySYsKdLS2pc+udIO7j35MuUh/YK
	WJbTzrDfORC13B90GPj28pNN2OS0cDs9smv2lWxLvhKrHCFBk3ECgf2O0PwkmJEpOCPQO4TNIOqMq
	uARHMu9KnrF9Rgj4ykhMVwKqiN/M/CbMWHcNQZoGSA6R5j2kO9zH5Xt1BMUM2iFaoMiB7yt8jve2a
	SZS8RCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OyP-00000005aJ6-42Bo;
	Tue, 17 Mar 2026 07:36:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OyO-00000005aJ0-2qkX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:36:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9DCF60018;
	Tue, 17 Mar 2026 07:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A0BC4CEF7;
	Tue, 17 Mar 2026 07:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773732975;
	bh=Qq89Pmdj56EFCjOfiinOGyRZnsS+PTrnq6MvF7LJ5go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JOjMu3GV1ibKvqfY0AMwZNo7cMJ2M5bCFG16ZmtkPg5K1Azg7TRd7LsKVQfj5aK0Q
	 +5thSkqx52o6KgOXPL1sDcqaVAT8Am3r0kofWuV79uWafHi15w5KYDm1mc3YUjBgar
	 SLjmTJlMA2Fdl7JMt1KD6ozGfazT1rqi5UeaWD83fy/g9qCSfyeW8kOZvNDLoc6OAC
	 tN7NmgCMstCTB0UBboHn9AFzn7X0G0Fbk48G+OILZ2NMpqw153o868cU0wC6J9ynZJ
	 h7Jmgnbw4THlyWd2b/Di4xqml0P1jyrir628dU3um4YQLYE4ZTxGDTyO1K2T93+MA6
	 q8r9hFbCLoQLA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	liviu.dudau@arm.com,
	lpieralisi@kernel.org,
	linusw@kernel.org,
	Debbie Horsfall <debbie.horsfall@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com
Subject: Re: [PATCH] arm64: dts: zena: Refactor Devicetree nodes
Date: Tue, 17 Mar 2026 07:35:12 +0000
Message-ID: <177373285049.3793081.14756631972932068572.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311173948.3478931-1-debbie.horsfall@arm.com>
References: <20260311173948.3478931-1-debbie.horsfall@arm.com>
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

On Wed, 11 Mar 2026 17:39:48 +0000, Debbie Horsfall wrote:
> Move the SRAM node into the SoC node. Move the memory node out of
> the include to make it customizable for each platform variant.
> 

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/1] arm64: dts: zena: Refactor Devicetree nodes
      https://git.kernel.org/sudeep.holla/c/021915c7885f
--
Regards,
Sudeep


