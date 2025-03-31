Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C45C36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 06:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SxjiFMNDpjb1hEpDtvGa86fb4mgdcnTt7Q34cH8VdU=; b=Mu7JU5G4FZVRfvZzr6RUnfW8Fx
	/KFFUWwqwbQ9xcr3w5v4yztTyfNzSHhc+gF/pLjprS72aOJypBr7uPyDWTjSypexeFy8TCghM4mrP
	ubGbwkIen2RFtMpvxaeICQyZ0+IW+Dvy6Swime37wL9xEeTEz97dPKp0gXUbUEcKvPMrKnkNuDHGN
	TVoyEvNX9DSwbmHiOLXilS0LQq1ckhLynI7zkr67S4hQgPIHzsKQuHrl4psFJfvn9IqHaFMLicCd5
	D/N3B/TOZBJNRlB2Bl6b/+Hyxof5SPCgRalcQCLwXRyS+hrYUdfmoZlnqyo6d1KhWdNYsukOPQQ2N
	YYYAlPBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz8yR-0000000H8U6-0aBD;
	Mon, 31 Mar 2025 06:50:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz8wj-0000000H8GP-1vz0;
	Mon, 31 Mar 2025 06:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B05861120;
	Mon, 31 Mar 2025 06:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E4BC4CEE3;
	Mon, 31 Mar 2025 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743403712;
	bh=ftEA5HkR9HKgNZtzyjrtkfCte/96vO2XvKPBChSlxXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlSNfO3dzGoTsrUyJAiKxpFMAj41Kt3P37e+V7vO6XpUDVBH6wBCJhe9XNMDpsq5s
	 qZT/qinvZsOfzYPcW/ifHdmqGctNLOqwAoI9kc5fDTNg4bliRMbo4P+9FTLl/zDLMo
	 GxDidqjcd7N97JJE0clAUSU6EC2H59lYPQt2te2f36jg+Yqa1p2xO8qQ24TFoyWEEr
	 tuG2MrO1wJmaNX6b3/PV1sVS6+AE0/dSJ555cq16MYr/DS3akUb/sc/F8tcN2QA4TL
	 U9gQeWGnjP+ia6QKbwKvnrgJFiHUWof7eUGRkD1iQ9PrFLk7onFlcnlJc4Qo13B9my
	 LSbKcT6ePfhlg==
Date: Mon, 31 Mar 2025 12:18:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: krzk@kernel.org, kishon@kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	zhang.enpei@zte.com.cn, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn
Subject: Re: [PATCH] phy/allwinner: phy-sun50i-usb3: Use dev_err_probe()
Message-ID: <Z+o6uhfMCsqru2v+@vaman>
References: <20250331103257372kkrgDrRRskdABmXRnmbID@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331103257372kkrgDrRRskdABmXRnmbID@zte.com.cn>
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

On 31-03-25, 10:32, shao.mingyin@zte.com.cn wrote:
> >On 28/03/2025 10:02, shao.mingyin@zte.com.cn wrote:
> >> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> >> 
> >> Replace the open-code with dev_err_probe() to simplify the code.
> >> 
> >> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> >> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> >
> >Why are you sending patch-by-patch? Organize your work for the same
> >subsystem into one patchset so we see entire picture at once, not spread
> >onto 10 separate threads.
> >
> >Best regards,
> >Krzysztof
> 
> Dear Krzysztof,
> Thank you for the constructive feedback.
> We apologize for any inconvenience caused.We will regroup the patches 
> targeting the same subsystem into a consolidated series.

Nice, while at it, please see the subsystem tagging style. Here it
should be "phy: allwinner: xxxxx"

-- 
~Vinod

