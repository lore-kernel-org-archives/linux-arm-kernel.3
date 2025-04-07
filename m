Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350BEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 02:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72ED1ETj5TNm96Y8ef67UN8/SxRcjwp7diw/thOQEZk=; b=kaYB5sHbhfG+nUKTH4CKh0ntRX
	VzQn6TodYSYKiY5AkwnSAEZ4ZDhR1WYkKkuRyvwYf8UReoeimNVyfESvlGRjuuxSzmmUry0fcyN3+
	o2L9aIilNzaVlJ0+QBAuEWvBcq6yMg083Y3v4+7O18oZYsNj0tDiCOROJfaLcPOLE6R0Vp+w3ddf0
	f1NyVrKga1bHCwr0ng6fobU+YE2QVRMrDffcYp1p1HHJl8NEZCdrDuyB7MrdcXNh+Mve+HuQe1Jhu
	mvQmGyWp/wZnTpksvF3D0/EoVt+0i2BUftNCfiRe/BJKWBj74DI5udNWSWIgs8jzgNZbLZMJcYRLM
	fsgmsthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1c42-0000000GBnt-2Jxn;
	Mon, 07 Apr 2025 02:18:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1c2G-0000000GBcE-1o12;
	Mon, 07 Apr 2025 02:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C8475C3AF7;
	Mon,  7 Apr 2025 02:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0528C4CEE3;
	Mon,  7 Apr 2025 02:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743992186;
	bh=3rHspDM4Z5rVXG4tA5JfDXRtzhVtLN/iGOYarrS7OaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nd3On4L0RRnfdW4UpVrVDTfvgyoJBRLKLksqf40lOGeFMZEr6wCgvvEyslc82DDDc
	 Uw8fHsH92SfvGU6SrO3I+pspMWlDmu6D9YZ5d39BgBuIBet+Df/f4Ae2eaqAKjrlPZ
	 rM25M+WsfVymcB8XLe4/GHJQqM8OZlrYH4zHeU7/NJIAV5kZiOJ8XAtT+RxjvR2+Xr
	 25EKDktVGqKHqZ9vi4OXiB++uepdgzQQ1Jl260KCrLKjXX3a/wcLdz0rHaVTx7LfGv
	 MPLEiibWo6n66Hd1vg7oXL6WyxEsuMiv7JzqfWLQrnba5W9EgQVTEnYkkQduMiLaJT
	 s5mn1ZsHglNAg==
Date: Mon, 7 Apr 2025 02:16:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	bleung@chromium.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	nfraprado@collabora.com, kernel@collabora.com
Subject: Re: (subset) [PATCH 0/2] Use ChromeOS DT hardware prober with MT8192
 Spherion trackpads
Message-ID: <Z_M1dti05ZUeTfrG@google.com>
References: <20250318102259.189289-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318102259.189289-1-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_191628_679436_E2D5822B 
X-CRM114-Status: UNSURE (   8.51  )
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

On Tue, Mar 18, 2025 at 11:22:57AM +0100, Laura Nao wrote:
> This series marks the trackpads for the Google Spherion variants as
> "fail-needs-probe" and makes them compatibile with the ChromeOS DT hardware
> prober.
> 
> Laura Nao (2):
>   platform/chrome: Add support for Google Spherion in HW prober
>   arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as
>     fail-needs-probe
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: Add support for Google Spherion in HW prober
      commit: 8dc528bed728ca0b887d9d5edecbcf23d7fed5a4

Thanks!

