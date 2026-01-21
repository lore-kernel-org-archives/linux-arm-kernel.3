Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2247EC44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+MZILzqIwQZsr+/HxUiszqs8x1r2kJoh6/zTOUpqV8=; b=U0d9fQ7aW9kfaHL9qEgkn9fZO/
	tk0EO/HrYYYtlafJP83S7vlYC+ekT33plzfv2Vz0DulhBq+PsM9mydi6jQ7gN9Vvmm/TTwMDX9o48
	A7PAhmHb+uhDGA5TX8btsw2rYeJz83BzpKYMDw/dDNqpvpeynkuA0pG60gjHI8F2nlEPf02fwPfzI
	AU21l+Zb9DKnyXaWiV10mLxBk5R/xoTbA0akhcEQ04YqrfRv7LbSBLh0uWVIPUuYUgJ7JmSytH4Ah
	yDbVHfyxUBy5PV6abLtkcz85JPEUUiRTSDJaSU3InCu5miRa60H5yByu++icP76VqxJYOyBHb/hYw
	hUTrYcng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTwh-000000057aR-0OBx;
	Wed, 21 Jan 2026 08:52:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTwf-000000057Zq-3fzm;
	Wed, 21 Jan 2026 08:52:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85B8A6011E;
	Wed, 21 Jan 2026 08:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC87C2BCAF;
	Wed, 21 Jan 2026 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768985527;
	bh=a7GuYbQi91bFNi5fdQT6m/29FoHbwePMR8kcPjdcIK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D0swohfIYZ4NCVOzsmpT65ziy1qTE6oACqwGoPsD75BpvF1uAmkymFcTrCXkOLYft
	 zw2PeCOEOy0MJiYARFYbClrl8n1kvB+aXsBXDmhgst63tEAM+UIOAUpMDmkEww9KwG
	 g8OACrw0yG3Bg3v1jSJqImuBIuOsTrfMh4yHRiTsICxz9/DoOsaKsMQPkCJhN4+YvC
	 aQFjuXMsCAlxFGv4iGfD733SO9zicNeGZeh6tUrECa0fIzcFaPqJIB2GWKFhhnBKEu
	 qY7HqLLem70UabJB3tppFvRY9yZ/DezY3XxAulPJdcsWEBQxmEkvA5ph7FKnGInGUD
	 Nyj39Vg/uOOrQ==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, 
 festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260120111646.3159766-1-xu.yang_2@nxp.com>
References: <20260120111646.3159766-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: set platform driver data
Message-Id: <176898552285.1268719.14817988483305710497.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 14:22:02 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Tue, 20 Jan 2026 19:16:46 +0800, Xu Yang wrote:
> Add missing platform_set_drvdata() as the data will be used in remove().
> 
> 

Applied, thanks!

[1/1] phy: fsl-imx8mq-usb: set platform driver data
      commit: debf8326a435ac746f48173e4742a574810f1ff4

Best regards,
-- 
~Vinod



