Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12E0F3ED50
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 17:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzkNJjGPGbrfyoiWxyUiNakpp3BFzvMTp1pGC4Fff9g=; b=EUVgXWbt7xUu0Zd1Hi/Gv+3xiD
	TBVjhGh3AzK4DxSZzKJsJ2pIzQi/w6J1RY03O31mo0/LVURRmOr8wD3PUxU9VoX4EAKeZCeVtlUvP
	Up9Yj6OrTbvW5LMJh1Cf+CndgJ79xgKO66nfzT8Efmg5x9HAav54/1qzsCscaHNMDIyxR/JRzdSKN
	sft35OeIXiQvLVWLEpwNXiRmpqWsZCoDDrRJs/ZIUzT+wNXSK3y3EigtWOxWljIeHq9tgepI8E72E
	DUhOiejNHqXWPtcj1oBtpaMXMdCclzSau0MAVgWCwLch/0p/V7d97cGycwfP7DkcAMbuFhXj+0tLP
	NCO0+sLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBcKm-0000000DgbG-3Net;
	Sat, 11 Apr 2026 17:41:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBcKl-0000000Dgaz-3xTo;
	Sat, 11 Apr 2026 17:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 110A96015B;
	Sat, 11 Apr 2026 17:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5F8C4CEF7;
	Sat, 11 Apr 2026 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775929286;
	bh=/DQ7HVNRXx7m8000Zg8l40K+eA6BYCD8ejkHrrjEhvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWMe6+nMFoOGF2h+dtgHyWlmSQoPQjWvj9zanstYdWqXw2g+jZKO13PFK6frgUTj8
	 mQOrOgQk4gZm/cxm/6StK2WEHTBgtIwURY1mNPAbtL5LNRZJTPUNEk9IonpglI/YdN
	 c/zyGX73BjQMt/IZAoOdSkzJxcOUYNJ9UOHb22dyUOod8O3h2i7QNpqvbcjhBqRhWZ
	 QYHAeRFeL/39EzdU5MfMwebB84NWSl7HE/BRv2JI9vc6juBJejyziW9dMtSSICOJCR
	 yYdoazp1mDLrtM5PBtOJodUQUjWhtuEfMNu/2h5Z05fbeQ5l+sXd/ULHatW8MpU2p2
	 qMKm0NSkmAp4g==
Date: Sat, 11 Apr 2026 18:41:21 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] mailbox: prefix new constants with MBOX_
Message-ID: <20260411-malachite-phoenix-of-discourse-bdf44a@sudeepholla>
References: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
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

On Fri, Apr 10, 2026 at 02:49:12PM +0200, Wolfram Sang wrote:
> Commit 89e5d7d61600 ("mailbox: remove superfluous internal header")
> moved some constants to a public header but forgot to add a mailbox
> specific prefix. Add this now to prevent future collisions on a too
> generic naming.
> 
> Link: https://sashiko.dev/#/patchset/20260327151112.5202-2-wsa%2Brenesas%40sang-engineering.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> This patch improves the above mentioned commit which already sits in
> -next. It is not really a fix but it probably is still a good idea to
> apply it before rc1 to avoid confusion.
> 

Agreed and makes sense to have the mailbox namespace for these macro.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

