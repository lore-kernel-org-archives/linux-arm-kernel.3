Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACBAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1gDIaCCHrlRuFYfY9XY5foS5Q5PptiLy6ZE6GGaaoE=; b=A6r9JlqDYCHeeHaDVMg2mxu33I
	AHlVlrkaBfW5BO0i2RrQzO+321qzlD61rMj8XPMbi5tD71c+sZ3wJvqWKhWORtP07KZZQFICSezfI
	Mwq3737LU6j7N7bYaPT7CLNtP+C6nb3jhYEqLnM0huSM3TL7m6IIXesvRQPTwR6HzLfj5vmyyBEx3
	IjWSwqtEm4ikG9i4P9yccca6OgO6T+4sgOACoUGTcV2KQYSAC+bg5/pHI4TwgB/aEcpMist7YzuRo
	vMxGjtkJjjvVmlk/CBw0U15ea7Fib4TaaZjWqUS6FCJPTVFLYSmh9VgZPGZJ3/JEjHwNt3PLgD7Xs
	Rx5VZ+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTwc-000000057XS-0Az8;
	Wed, 21 Jan 2026 08:52:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTwZ-000000057Vu-1sq5;
	Wed, 21 Jan 2026 08:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C132943C9E;
	Wed, 21 Jan 2026 08:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BF3C19422;
	Wed, 21 Jan 2026 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768985522;
	bh=F1Divp1iQY//EJAcHECb5Zq6njuhGj6QCZPRtvomuos=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K2kwRGzN/ESMFFKtDbdSUFHEEU40g+DCA+1adBQDQ4LhGJMkcHUYGuj4MkJgbZU48
	 iV1Dc5vP1Z9cmV36iVX9IsT1peRrN8S6ErRA3EQbs3rugPzZhLRInhGItipFaQQTP1
	 DtZIYNna2JEtlt/G6cao+uty5J/JGN2qeU8LM6sxJYMwfpWEVwfUwf0qDS604GDtIK
	 ZKUTo+0uaDYeeTucqB/JY90xGUX8I6s77+SexDrOP3SUpfqOz5Ulr40tk/0+yXyU1Q
	 x18nsPTY/6XU8QOvh+gLVtc/Ur2XtMEhNVFma7Vo0YUlV3nBvmr1zsMcUMjKyRn+VB
	 9rV7oL2A6u0lg==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, 
 festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260120111712.3159782-1-xu.yang_2@nxp.com>
References: <20260120111712.3159782-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: disable bind/unbind platform
 driver feature
Message-Id: <176898551703.1268719.2573998309118426062.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 14:21:57 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_005203_515198_3A85BF75 
X-CRM114-Status: UNSURE (   5.22  )
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


On Tue, 20 Jan 2026 19:17:12 +0800, Xu Yang wrote:
> Disabling PHYs in runtime usually causes the client with external abort
> exception or similar issue due to lack of API to notify clients about PHY
> removal. This patch removes the possibility to unbind i.MX PHY drivers in
> runtime.
> 
> 

Applied, thanks!

[1/1] phy: fsl-imx8mq-usb: disable bind/unbind platform driver feature
      commit: 27ee0869d77b2cb404770ac49bdceae3aedf658b

Best regards,
-- 
~Vinod



