Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D279E8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 13:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IijbA1nUMGZVCVJsOOsaD9hUoN4AjJRX75w3vZKSuuU=; b=ihWqNurHFLWDZsoyAth4BK7+WN
	pnkWPnsuxgEDMkWfCaz5HDMpUoICOsQ9MTZH5WKKOncRsYA6oJgFx8ylvC6dQN9FgMvQm3DCdIwsR
	N0iFH/mDU8uO95tzqKQfXFweL9T4r2TlSWehORCt2pSbloqWRNyCGEA4P53vQtd1n0iBMWlqJJ6SL
	xsx14IsQcQupT7zvhC0DuXcyhKem26DQZ8RnL1RpAOlo/zRU1W/bqyehuhFixytBFZ4Snj+FleVfv
	p725gVvF4PxWb3xgB341F86A/DZt3Zh7RDjy73TLWUXRYAE2jAXnXtl4LmUptBr0qGQVqtz45/hvv
	viZMKwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTxN-00000001ztg-3Rrm;
	Sat, 27 Dec 2025 13:03:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTxL-00000001zt0-2xcK;
	Sat, 27 Dec 2025 13:03:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17AEF4068E;
	Sat, 27 Dec 2025 13:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671A7C4CEF1;
	Sat, 27 Dec 2025 13:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840619;
	bh=Wqwb3o6BSu14O7NzML1JrB6nW276UFpu+/YaOfyV2wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EGuzYqyFOo/fEuMi6ESArC7JhQ029gKEFO0Nikb0Pp/jJ9NoC/YGQwZ23EJPr/HED
	 6pq6Y/B0Ll+IQLJtsE/OpU628KrFOoLft7zmz0d+8Q45VNfpY5Rrfia6jhXBAJXBt+
	 AkHTdDdFR29+ZUWpjUCSqge3PA9yKOHuBYXKC0RkQubDNImw5sVbP/K70bPytfSEN6
	 Upr+eYBubc4GfC/bRdpyCPxyLCQV21dVG3jqM0LqEFPDQxUdm/2RgdwxLXaOiBMvrL
	 u2lKqYAdYJWa+mUfOJ8yQl7o5m9FEnoL44fox0/k4oDOV/FON9rlR3a0WN7g4F3nkw
	 +rpKVmR66G5dg==
Date: Sat, 27 Dec 2025 14:03:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, sjakhade@cadence.com, rogerq@kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add PHY_TYPE_XAUI definition
Message-ID: <20251227-airborne-energetic-kingfisher-adc4fb@quoll>
References: <20251224054905.763399-1-s-vadapalli@ti.com>
 <20251224054905.763399-2-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224054905.763399-2-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_050339_758365_BF05C46C 
X-CRM114-Status: UNSURE (   6.39  )
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

On Wed, Dec 24, 2025 at 11:18:58AM +0530, Siddharth Vadapalli wrote:
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Add definition for XAUI phy type.

What is XAUI?

Your commit msg duplicates subject and is obvious - repeats what is
in the diff. Pretty pointless.

Best regards,
Krzysztof


