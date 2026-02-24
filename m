Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3892DF4BB6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qAY0D0swS3EFqTom0J6zOazxUck7e72iwDaHtkzEAQ=; b=isDf3bvsP5sftsC/IN6+yfr2bn
	jbI//1IiH9RRB/h5df/1QdLTi8EIz1/E/bbtcmTbv2p6xqBRY5VTaB2SmF9xNtWMhQbWSFvkyOB/n
	7VyewISuREZY0qLHrr44ZnroUIsuhnPaCKyK2LXc9qey4UGKkPs0cgU+bfNfoq1MrQe45jCNuhP5f
	azwl0lieLASYFY6OrS57j2X3eD7dOve2m2u7cXOLEvDXNstknzFn8e41iDWhcQ8WSukpRhokH1rWA
	fYd3VJ3dltRkSFmpeFLeu4Ql/Q84/e7usVRJ5/A6khONrFYOVgNmrOnC2TUwgzFePI2SnExWfa7xT
	GsUvBtZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwnD-00000002bNW-2pxz;
	Tue, 24 Feb 2026 18:05:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwnB-00000002bMm-27WP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 18:05:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DEB5408FF;
	Tue, 24 Feb 2026 18:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72029C116D0;
	Tue, 24 Feb 2026 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771956352;
	bh=oDA6UJNQcyFpalFPlNTdTB6nBaNvITv3rMdDCBmeZT4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Are0fmoVRYQ/dX/iYZMCs437W5x1/OPW6XfOpHTZ1rS700kv5dBVpZqFYFf5RH6CF
	 V2a19cvi+jHmuriX2gxHcDJ+G7cgVmyjBSqTx83LjdSaF23mWk9VFXBamFy7lfogFO
	 ao3ifCXPhN/UJGVneJ0CPKg15X//bg9lSBCGL1jSfjYqE6ZJT5hWfpc5wFNJPwbJQm
	 9u+yDrEIbP9yB68F1+hWzDo5kTfPMuhK1qmdwSWMHoskltWXJgDT3IaxZf9Xf/oKhg
	 J9gsYLJBhEXVKsthXe4W/3QW2NGeF2Wve1ZjmNwx6BXEkevARe8pADxXFogQ6NUxbv
	 lYBJfEMZRdfyg==
From: Chen-Yu Tsai <wens@kernel.org>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20260219215524.468142-1-rdunlap@infradead.org>
References: <20260219215524.468142-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] drm/sun4i: fix kernel-doc warnings in
 sunxi_engine.h
Message-Id: <177195635023.133983.103201374012158795.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 02:05:50 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_100553_577409_A4A36FA8 
X-CRM114-Status: UNSURE (   8.10  )
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

On Thu, 19 Feb 2026 13:55:24 -0800, Randy Dunlap wrote:
> Correct the kernel-doc notation, add a missing struct member comment,
> and add a missing "Returns:" function comment to eliminate kernel-doc
> warnings:
> 
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:116 Incorrect use of
>  kernel-doc format: * @mode_set
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:125 struct member 'mode_set'
>  not described in 'sunxi_engine_ops'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:144 struct member 'list'
>  not described in 'sunxi_engine'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:168 No description found
>  for return value of 'sunxi_engine_layers_init'
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: fix kernel-doc warnings in sunxi_engine.h
      commit: 645186bf86932c6b9deed2e564cffd09576ba9a4

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


