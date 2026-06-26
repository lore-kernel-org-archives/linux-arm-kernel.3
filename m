Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B815BCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 06:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=gK6bUQyhuPqdzY+3YuHAcHcZN2
	WVqukGU79FkRj25HR+kSqq4dcSCLv3w2nNwyBiQbIQi+IG9ZUaBwsJkv9YFDU1X2K+EQGmk04n+78
	CXRhG4qUCYdO0zecc1ZEtFyXVibLCpH7VJn8000H46L5yESgs87g5DYS1qJaU/42/4Y42RmYMXvQy
	Z7+TsPMfn/7r8bFRJYZQVxbpnxygReT420fYL63hxr2w3l6HoAQNXewiCmhrLlyMmaCGdJwpySqzk
	mtZPqjlKXV0pZ0UXvpFWxDRJbKVKER/gfQw06mH10l9+71yE1bMZx1+rLYOUmpizeIhuP19Ed4Bhc
	sl7YqNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd0Wp-0000000AdKh-3QMl;
	Fri, 26 Jun 2026 06:59:07 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd0Wn-0000000AdKI-3PBO;
	Fri, 26 Jun 2026 06:59:06 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0515868B05; Fri, 26 Jun 2026 08:59:00 +0200 (CEST)
Date: Fri, 26 Jun 2026 08:59:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: sven@kernel.org, kbusch@kernel.org, linux-nvme@lists.infradead.org,
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, j@jannau.net,
	neal@gompa.dev, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, baijiaju1990@gmail.com
Subject: Re: [PATCH v2] nvme-apple: Use acquire/release for queue enabled
 state
Message-ID: <20260626065900.GA11368@lst.de>
References: <20260618021543.3866850-1-hanguidong02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618021543.3866850-1-hanguidong02@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_235905_999724_AE546BD7 
X-CRM114-Status: UNSURE (   7.66  )
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


