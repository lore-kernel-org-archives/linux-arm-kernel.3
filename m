Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9248DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OE53f+PpyVT0Fk31g8KAdp81l7g3N8MhlvrA9gb3X40=; b=iUn3hRNMatfrPnOqxH8/K3d8/w
	Ih+Nq5L9EZQ6g5jXyRkgY+rf/vyCSOMqiy7BHr4YjrRxysiBSw03v/xaZnh3Jk94g757DpL/K3BWS
	/YYlqmC2oz0V+1MlrTW+XEcKOVN2nxLqJCLR+ZO5am+ZHdaObTwLvZdYi1vWvrO+L6/yAgebAm+AI
	UdW5rtMXxLcICafE/2RufGx8ggaHO5/tcoeN6GSTLUQ+g8/85GjwmGpo4HQ5Vmzu9HMaOkz0W+xNe
	r7ChoPJflezffeU+8gFRe+AWwr/m5KSSe1SR7msBw6SHmBw97lm9RGr9RyKZxwxieKfknRT0PUt0t
	4FtXCm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4J0-0000000FdwM-0t36;
	Wed, 12 Aug 2026 08:27:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Ix-0000000FdwB-3SkG;
	Wed, 12 Aug 2026 08:27:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9091A41662;
	Wed, 12 Aug 2026 08:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041781F000E9;
	Wed, 12 Aug 2026 08:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786523238;
	bh=OE53f+PpyVT0Fk31g8KAdp81l7g3N8MhlvrA9gb3X40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vm5008ItZcq74yFnDL5ETN/l+/Es9qN/gurjHQdvGIex7jYRanh/T9d8HFCdnm41C
	 RbZyl31znakaCMeicT9FdqMijxrYN6h/TrMx44A0ai8Y/yQNQS4J1K0p+cPCJ6PJVE
	 Iqqs3i+W1FHt36Eh246oBYvi6jxrOKvQxxQO2iuB0J3duh8tGMh/rF8pet+EgBDkIo
	 6lSxsxmzbZ8rvr24j5w2EoXurvPbG9d88oVSTD5A0/v8Yn7W+I078uNBluNQb9DDU3
	 0HU31a7krS7AAiFDSoq2m6kICKgBsQ5Dwycia9fLn3yegNpgQ87l190Uw3K5UbDvIs
	 sbdG/l3/QJngQ==
Date: Wed, 12 Aug 2026 09:27:13 +0100
From: Will Deacon <will@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
Message-ID: <anwuYYxLFbtDmmHx@willie-the-truck>
References: <20260812002728.2283079-1-irogers@google.com>
 <20260812052417.2361040-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812052417.2361040-1-irogers@google.com>
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

On Tue, Aug 11, 2026 at 10:24:15PM -0700, Ian Rogers wrote:
> This patch series adds an uncore Performance Monitoring Unit (PMU) driver
> for Broadcom AXI system and VideoCore VPU performance monitors found on
> Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through 5).

Why are you sending four versions of this patch series, at -rc7, each in
reply to the previous one? Nobody is going to review that.

Will

