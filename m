Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FB6E9D401
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e58MEUNG7hgSPneeDaVleE1xXmh/YuPEME0VFk/6XQ=; b=jcQrXyLPPHjmjK97yYLgcbUXHy
	VQoJjXkI/Ilf1WYlVZpiGAn4h6CUpUss9dQ3JUT0DjD5vumLK2x1NvE5KhQ7xq/XYX8MtsUOV9KML
	bZg7h/vVUUIbiQR6eccEWAvcZ30Xg/1r5+P9n7ucevwWHF32JNQmdVWWQ3UKRHZBBSsuBeloKf90w
	KFeknC61I75OKG+rVTFeWnT22xg4hHvunyv77xV3KD+EfG6ASqQl6NpYvniznUHOwIJBrOIpzOqa1
	h7/ojgZ7pHk4vuYFdQK74t2HtABwpOEWPDy8F//TGZtzbNJkI0NgdETomc+mGJQ88aIAUxtjRlfIq
	ITy3ynJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnefZ-00000008eHe-36Rj;
	Wed, 04 Feb 2026 15:19:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnefX-00000008eHB-0lPt;
	Wed, 04 Feb 2026 15:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22F774178F;
	Wed,  4 Feb 2026 15:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0D7C4CEF7;
	Wed,  4 Feb 2026 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770218390;
	bh=N4W2OOT8cuSzttgJEnK8vKEf+348a62A9tEzp7vo3Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9ulbJ6qOpc4xNBiJGXL8gkDbLeGEd9b7MOQttgU3G5s9yvqUco6mWldHw0DI10Qx
	 qIa3MBBLsXyDetRivVLC+l2HpKSSKc85yMDDtitbiWO+dXBHwwMRW9O9tu1vTjTw7W
	 FnQXOQkBzj3yUQcYxA1mpyPreGmT5m+BF8h73uGo4s6jY6qQ4HJa0ax7JmtMfKYNEW
	 /r2v1a16eeQvATA0t5Js9VLcsUR6RyaAKe9Ac0k32w0fXgOfWZn6sKyYuitFqUaxKs
	 tg5T2PvEgkk+rA2Om+HiRuymg55ForoA9r2S1ADvOt7BJn5IpvSjYpCOQkaIilUW+a
	 JHmoJwk1e1tFA==
Date: Wed, 4 Feb 2026 20:49:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>,
	Joy Chakraborty <joychakr@google.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
Message-ID: <aYNjkj0RYh3VszTn@vaman>
References: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_071951_238144_38ECC03D 
X-CRM114-Status: UNSURE (   8.11  )
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

Hi Geert,

On 27-01-26, 20:12, Geert Uytterhoeven wrote:
> The Google Tensor SoC USB PHY is only present on Google Tensor G5
> (Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent asking
> the user about this driver when configuring a kernel without Google
> Tensor SoC support.

I have three patches for this :-) Looking at it, I prefer Arnd's
approach and not to depend on unknown symbol.

-- 
~Vinod

