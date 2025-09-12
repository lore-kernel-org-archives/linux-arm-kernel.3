Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B959CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 02:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgAr41Ne/JkgaIvER2ZusbcigbEtg046hVZyTQc/Ne4=; b=uWYr0mq8HC0MKqgbgx7bTGMz4B
	99QnGQdcwt0OI2AWo+nZWio79fiLBuU1xyIr5Cwgk0eRL9axA662S0aRXIUV/zvkhPlVmlDNkVhm3
	HH/ODaNWlExfvupjk5wIhGINmFgoe5EFQZ/TXxqCKR4nIEKaDUeRRvFIPCvsUJCtWVnkiFR27qVoO
	rLXNOWzQoGU+sO2/O4H18+rVb5oyHyvzIdtAkgM4hBSEs7ly9CUsyEMIEhdKCq16NtnUtGgNsGFkj
	dyrMyTgHOOvOsOLyZ7v5iEO7l+MPignTllr3dJx4omuASL+CSS8oKZNERZng4iF03jcnTN6wbxp9t
	IEuRyF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtgM-00000006Ywb-3dpx;
	Fri, 12 Sep 2025 02:38:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtgM-00000006Yw2-05ha
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 02:38:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69110601AF;
	Fri, 12 Sep 2025 02:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9681AC4CEF9;
	Fri, 12 Sep 2025 02:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757644717;
	bh=JD55iuZQFxBzspgKnX6WhVjBbiN7P9Nc9vdzLa++7FE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XI/LykuWaR/JGkpXjoc6hWS5+G9ljGridwEunJWmn9Okgi3khmEtKchT7zzdSKwuu
	 gQui+is4Ru2VXhVtgU1D26yXGsLeH/vWHim6XxBDRhPg4uL9f6F0v5cSVz+xDx+EKG
	 Az/0faeU4rBINtw4caWIK/6S2bV5pmqNvY7cD2sWrgmXr7REETiwpxa1sV8y6u5gp+
	 BGABvv5x+6REnPghr9maqaFS3s4b2mFKueudHnMgNhvvBcQP+0LUCbzdUo/Ir9In+q
	 F4SOAyKOoxgBxHV1TxLKMOy5U7BXy6Nhcg5sNqg4duIlt2Ds83FwRechRqIj/oCKxZ
	 JdAY00P6ooyFw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Petr Vorel <petr.vorel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alex Elder <elder@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/1] ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM
Date: Thu, 11 Sep 2025 21:38:34 -0500
Message-ID: <175764471181.3066893.17551247684653242505.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250829165031.110850-1-petr.vorel@gmail.com>
References: <20250829165031.110850-1-petr.vorel@gmail.com>
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


On Fri, 29 Aug 2025 18:50:31 +0200, Petr Vorel wrote:
> CONFIG_USB_EHCI_MSM was removed long time ago in v4.14-rc6
> 8b3f863033f9f ("usb: host: remove ehci-msm.c").
> 
> 

Applied, thanks!

[1/1] ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM
      commit: 3e23fc50890d3f04ec8e3670c6927eb239930136

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

