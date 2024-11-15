Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88985D6DDEA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 08:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuOf4CwmqJYmD29P7/wy+8heP6lOHZeRXWcCPC4zo3k=; b=qJbLQtubTOeucbc53u59hW2C7j
	8aMLBUhugLjvZ3t+xfBtX+q0M02eu5GpF6IulXSMg0HwkAbYgWpMW/tCAO6tJcV7Z9foBfz9WKBVP
	wmgjPanh6iOLSgtOFTX0vbiN3iRNjogaWUYZ5/jLWRclNsaowQ9xU/IBEwiZRJHXropsgvrWL208Q
	Ug/5fkIuOGBELxetglH7ObEeIZqJqC8fsimjFuuTXKSvzOgmri9+TMIhBwsYbUH9Cwu02EWtZNY2O
	jybYXWZbpIZTxjUZ8BA7KAukKn6ZoiRvXqn7tDjyVrcOB8EwLJUrjjX1BBXll6ouir9c9uPoWwpVc
	cIfp3C2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBrfm-000000021qA-27ux;
	Fri, 15 Nov 2024 08:27:22 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBrer-000000021gR-2MSL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 08:26:26 +0000
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 014DE2C1435;
	Fri, 15 Nov 2024 09:26:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1731659180;
	bh=ddyxbqxMF4oFoUnh8kdfqjS/EgpzWIB8AfoREuHj214=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2vwKLTnRedZtouBv7ykR8mVjofKq/jjctu8ciEhMsAxCR/rScmyH+Uvqor2b7qfu
	 Omz7FxHMijGktUpxZocWS1X2I+SP3bRoYzuSq+VFxZU9CbUHOGgIgYiEysX30c7uKc
	 NIJ/f8Id/s1JBmXCphPlJpNidMcmiesQ4FG1MtSaXt/gJEAxR1ZFQnReeG3VD033OF
	 FuEBXfAXa6lebusYJs1bwvVgFEQXQhQo8v1RSbNCBNMF3voS70+e8j+yj671riozv7
	 SfBDB3TobT/NGDoLEC8Shd8spTjbNLigVytSDleNd+gwjxijUSXBKVIusk2hm8gFUU
	 tzoDm/T87s4fA==
Date: Fri, 15 Nov 2024 09:26:18 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com,
	kernel-team@android.com
Subject: Re: [GIT PULL] iommu/arm-smmu: Updates for 6.13
Message-ID: <ZzcFqvfa6BoFBiE0@8bytes.org>
References: <20241114171808.GA24017@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114171808.GA24017@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_002625_812136_97D11058 
X-CRM114-Status: UNSURE (   6.83  )
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

On Thu, Nov 14, 2024 at 05:18:09PM +0000, Will Deacon wrote:
>   git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-updates

Pulled, thanks Will.

