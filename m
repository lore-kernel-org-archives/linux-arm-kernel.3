Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8914EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lGNGBbyMCD75p6dCKO3apkP06sLNCHOySPvGUmT+7M=; b=dSuUqG2xVDb81yTsTxOQicNEqn
	5kYTpvC/qxROBuq+UUk782vQtoN6HkMu0sBfkfw7FzsMWXaZyrcRH09jdVNxbOoLKQNIoDEtN1TCW
	QcvLRbo16k8cypWax/S3Wq385Xqbj4z85KWOI7xo2dl6m4ABBjjV89/CV+imadqQDCNbUpHR70zeK
	WQ4zeQT844XgA2aOYUlcMmxCMr8l+IduIcIffUOZ0Vr9PXygMDu0+Gk3rwfPtK0rvn00KCZdQ0qsu
	MZizZAs7Oa02zYYPy3+OIXZMFo3ug4mMtZKpO9iKuKWZQh3HAjIEHKwORRX+Uubj48rb3LkzurcRS
	ToLLHIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2not-00000009rOl-3Dnj;
	Thu, 10 Apr 2025 09:03:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nUG-00000009mtD-0Gtg;
	Thu, 10 Apr 2025 08:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/lGNGBbyMCD75p6dCKO3apkP06sLNCHOySPvGUmT+7M=; b=uVQOKEw4d8WibbYYpCax6pBQvj
	rwa4ehZAeOcGxnNXZKddKIeD+I5ZOJbNAn2a6pd+TL+sbgMsDujSjG8lLLDstT7Jp12Z6SMWbSp3M
	LJiLaSzvVHegTRfdDpgV9KR2UbafL+oPuGOdZY7buhPfXPPAw6kng0J+CtFDEYQFAWB8GwTHPu+UU
	24TDQSw4k1X10YgTrxq/QGK0WAbKan+95jpiJhV+Z1v3obJk1otKgPObPW6JnMSlw/c2DwnanYUUh
	ThT1+2/BXfpbvv7lNOJ8BbVyeiN8+TAPxxck867kIr1g9w+Mw6xZQOFY6kSppDYOxsM8VxjCbS59I
	FJ5kVPgw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nTv-0002qP-VF; Thu, 10 Apr 2025 10:41:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Konstantin Shabanov <mail@etehtsea.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] (drm/rockchip): Consistently use rk3399 registers consts
Date: Thu, 10 Apr 2025 10:41:44 +0200
Message-ID: <174427445691.820310.17501284948552457054.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250403064740.4016-1-mail@etehtsea.me>
References: <20250403064740.4016-1-mail@etehtsea.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_014216_105041_C310AADD 
X-CRM114-Status: UNSURE (   9.33  )
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


On Thu, 03 Apr 2025 06:47:39 +0000, Konstantin Shabanov wrote:
> As rk3399 has its own registers definitions, update related structs to
> use them.
> There are no changes in behaviour as updated constants values are the
>  for rk3288/rk3368/rk3399 chips.
> 
> 

Applied, thanks!

[1/1] (drm/rockchip): Consistently use rk3399 registers consts
      commit: d74cc229cfbbc5a96139825c297f34accd670bce

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

