Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB1AF357DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 07:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpAZLsZ7bbRWK/DzNtzK+5rgRdDsIBdRGWQF+VVE76w=; b=drJ1itDpSO8OGuJK0xb94AzPlZ
	tTrfm9zWnkdIdlcO1FvMASsg5PhM0pq+UQLMO81oNkCgUWsTesE3vn6w9o/6Ht772TxwN6ViEMzyz
	lX/upytpOzWi+vAApi9tmhGFXwmnaAWSCqrK5z91oMyn7e3qRT0JHy8seyCNBGfSQT3T/RYGGiThV
	GucoHz6AJNL8ayd8M2ZCLHo4N45FukQ1wnj0/nEed/hcXhNCCoUEhOwIZ/sphvNSb3qYkrtWaoWMz
	FHq3xdmUWvBChC0tkUziO+Q3wCOFr0f/mPBjWjpAlCg+3hgnB8qQcBRRU1uWYyZBlRoChZjrDnYIj
	a52zW4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9d8-00000003Rf5-3yQ6;
	Wed, 25 Feb 2026 07:48:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9d7-00000003Rew-3Sfp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 07:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB14560054;
	Wed, 25 Feb 2026 07:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170C3C116D0;
	Wed, 25 Feb 2026 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772005700;
	bh=mOZbZ1ZqqE+eiu5h8/XxBvggL38kFHopNnfib2JdFRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2YCJK4UUb2ecASZN/fhJ0zl6u+XmlAuBCkCUGFOOKXxrgpE1+9Z9n8fs0r5/DDTA
	 Ve/426cjDO9S6b6DXTf4xedXh2d+mY2wzmTZ68Ryre+E96FKxo84JlB+dEjfrM1qLN
	 DYdYYzqTAJrhxsONSCxxGFxUNi5ySzJze87rDm3lqCpsaAfPou2bGD9pVZt7dEiElt
	 D8Hv7CmP2sMQx+aENu1iKkUqqrgeil+xFea6ZTiQ1VIlke0b8xc6B9JD319kPgZh09
	 kXc1ry3fQtFo1CkBsS1ufSO8KUvp1rWRzXhq/oENVJCbrtKC85GiClzDeVRppEFCoh
	 K9bqmtNXDr2lA==
Date: Wed, 25 Feb 2026 13:18:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, u-kumar1@ti.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH v2] soc: ti: k3-ringacc: include platform_device header
Message-ID: <aZ6pQMGJn99ZLWyb@vaman>
References: <20260220070242.470060-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220070242.470060-1-s-vadapalli@ti.com>
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

On 20-02-26, 12:32, Siddharth Vadapalli wrote:
> Users of "k3-ringacc" APIs may not necessarily be platform devices. Such
> users therefore will not include "platform_device.h", resulting in
> compilation warnings for the APIs declared in "k3-ringacc.h" which assume
> inclusion of "platform_device.h" by its users.
> 
> Fix the compilation warnings by including the "platform_device" header
> file, which should ideally have been included since commit under Fixes.

Which tree is this intended to get picked by?

-- 
~Vinod

