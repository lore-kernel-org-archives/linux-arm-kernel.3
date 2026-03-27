Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9463510ED659
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZZnrGoOBxta8veIVkHHTpb7LbKa2b+0XyjUZCdii3E=; b=3gU80oAioohbnKERjlbRnayZCr
	01spB6oM0r0/YzQdi1fN5MjO5kSi9PwfBsEBTUxMNS2c9o0GFmatxIomH+2jWaWbblXJC+znXacSe
	uUSsVQRX3rn2d4jM5GUh5mkBOUx/HVKswATGtL3r4DQHoPFB5HwOOQyofyT+JNf2lDS2/sWixFUFX
	fKnHfjaZllv2uxHEDd/G+IojllBjcCM4TwqBtp+pJvqj4osMqxlK8XyGahP7xeMxaYiyAzg1I2P4v
	HNMFkUGT8OldttS6NdQ9HQDa/95wdT+CQiqAn6ir4P3bEeth0nFKRKvalIB2l6F9wM/STBdiA0B/9
	wgB1XYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65gP-00000007J3z-38jS;
	Fri, 27 Mar 2026 11:48:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65gP-00000007J3l-1wAH;
	Fri, 27 Mar 2026 11:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9ZZnrGoOBxta8veIVkHHTpb7LbKa2b+0XyjUZCdii3E=; b=RHxh9N9+x9+wIiudzu5RPsnUW2
	Im2xP7ZYKavYPz0PkDUZB16NCaj9u2T0rlgHoP6rUsK7tnzy5gyJzOquGGlODuoIj/YZZAL7eYsWH
	Mv0Xxtlr/uHDfYGPpbCku0EGq9OSvwf//CNqFDKILjbGTeaxUJrgALTbvbsleMqws+erFnlDuTWhq
	Ei3bnHeyjSt2wcTGqoTGCTNDV8LYjN+K65AqCHYnWMFDFUrEHrDuO3M1k6Usr+oARRuLcWs2hAxdi
	UdspG7peLvZjTNruXoA1pcIj7OqhsPDDyN0MDFqSNFnwUMbs7OAtK/VRfVn8UxTw0wpiRHBWx2XVn
	60wuw/1Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65gL-0000000AKmC-0RVk;
	Fri, 27 Mar 2026 11:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C92704436E;
	Fri, 27 Mar 2026 11:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B04C19423;
	Fri, 27 Mar 2026 11:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612131;
	bh=xrRUKmyhPCiuaYTlCMRj3a13WH/c8JFo0ZT68nAbLLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIfAGL5bsDFl/7OUfYvUXfQWmeN1NrUqSkTBeECB7gsq29WEN3+OQF+0c0GnYujOT
	 uxhBvUTXPT28xIjm4jLFPp1hSqEzLgsWhKOhoCdqM9OinatkE1YJcCWk1ToOh/VdbD
	 jt3FhUXqiCjFZ+PTdvo9Tbj/3cG1p+4/XFXHP9bnfT0rwW5SydyjIs8DQ3BOED3CzA
	 fu/D5WyV+2k2vjkto/2Xj0S/8FTBvyuXXsJGfbEnxDOARKBDHjB5+LRshW05LiX2gO
	 WT1Iv0ZWjpaAGcGZwzhS+ZaxuPuDOVu05Q+iXWYKKy0ZYBuU/AmVFAYrHykM6lLEXA
	 TKy8KxLrAPpVA==
Date: Fri, 27 Mar 2026 12:48:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v7.1
Message-ID: <20260327-enthusiastic-narwhal-of-vigor-bb4ac5@quoll>
References: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_114853_557719_FFB4063B 
X-CRM114-Status: UNSURE (   7.31  )
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

On Fri, Mar 20, 2026 at 09:56:38AM +0100, AngeloGioacchino Del Regno wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v7.1
> 
> for you to fetch changes up to 820ed0c1a13c5fafb36232538d793f99a0986ef3:
> 
>   arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count (2026-03-12 13:32:17 +0100)
> 
> ----------------------------------------------------------------
> MediaTek ARM64 DeviceTree updates

Thanks, applied both.

Best regards,
Krzysztof


