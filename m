Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86704C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 06:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCJf3RdMRIDtsyVFtsT7i6n1XVBxH7JnaQG1mSyRKT0=; b=uNOkbmw+uFt/E2/7DhU8LPZZ8W
	cjSR0f4df4UCQt+Th5j0fX6EFbt6SwbdChHWa7G93SdI9f8jdZhdgfruFONkaYOXn6I7R+mk161sY
	LJSGrK7zVL8o4c6mBN9xL745Cu1ofKT2KReiu690K3T3OFHqB1iRh+xfdV4omwj5Sgq0he8AbO2yJ
	Rmp8OuXzOkpblqNMIcAc7AELea12WGwjAMq79UY0YThTzZWK9oFGsNU4vJetzLed6GPmb7oiYQxWx
	dMAcesMgTvscZ+CzchkJCQcuENtxzLL/3fobbDycdbdyCIzrtHfwD96OfJVENLAEMIoPFXe0Dlyvr
	gpAd49Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6Vj-00000006P3q-2qyc;
	Wed, 12 Feb 2025 06:46:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6U5-00000006ObF-3dgL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 06:44:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF933A40FA2;
	Wed, 12 Feb 2025 06:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505EEC4CEDF;
	Wed, 12 Feb 2025 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342672;
	bh=Sv9qNL+TN5TjV7dcAh3uCs0tMgt7UdZj63e5XWo0KJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfUXC0BLirlUXBWTvvt0AJzcvF0lHh9wK8R5XaaS+Wl1kkpJ1p251RZ3KuZMnnY4H
	 hHF8g/BHY2ZqEwg9csC76QN/ORdw2gqcmxpwnGKXUNr7EfLik3ayZfaTyNrgtOMGeZ
	 fzH8JvLwuIsqof/UnySBYsbry++vdHDaZ0rj+ifOdJovO0mB6MaYCwdT37ZzMu/me9
	 jqVmmb+GaMwFC1+WfvFoUnehxg6umOkJp3dt7Dwzhm2OYDPWrkVF5t5g43esQPvnAF
	 WaI4tfXxlwkLNy1xuEfxlIuY0638gIUBdtffuu/kBnld5maDpljDOqAn5E4L1lx3nU
	 jhNIek9FoKY+w==
Date: Wed, 12 Feb 2025 07:44:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: eajames@linux.ibm.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Message-ID: <20250212-copper-tortoise-from-hyperborea-8dddcc@krzk-bin>
References: <20250212014711.2181865-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212014711.2181865-1-jammy_huang@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_224433_962475_A208D1AB 
X-CRM114-Status: UNSURE (   9.80  )
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

On Wed, Feb 12, 2025 at 09:47:11AM +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  v5:
>   - Don't put additional changes in this commit.

But it fails then, right? I asked for justification or separate commit,
depending on what is really hapenning here.

Are you sure you tested this? I am pretty confident it will fail :/.

Best regards,
Krzysztof


