Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80808C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 04:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym8bShvMR0/XgGYUzNS+yMcBMiYlCn28ZC+AfCdVr0o=; b=HX8VFjeJwVm9sQSgC+T40JJJiU
	xUbkKaBuYFoc8O/JgSRpCJfmBIhx+NUPTDTyCl71rYg7KzThkVcg3hbbbREWdqdm2ej0u3ja0KilK
	IoWAzButqPuD5FU7oVYxCvR4Y6VdeyqiouQz4d8Nrb00KXaps0jcbkeENFeEGr6zxneX7jR9bBezK
	wryWIYktmhc/B+HJqLuyx14uKQDndcc/xdgMhECGfZPYHm+/mOjzScN/HzdF7sGnL7IeHlzZvzL4T
	UQcXm2liSCEtqel76Vts0Rxs+a+HaLVjGdMIQfnBTGG9Q3oBkqq3+dt6WofiQMD3s3155htVKS3WP
	2aIogXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJbW-0000000Evga-0rvI;
	Sat, 26 Sep 2026 04:01:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJbV-0000000Evg8-0HGX;
	Sat, 26 Sep 2026 04:01:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23F1F6022C;
	Sat, 26 Sep 2026 04:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F42C1F000FF;
	Sat, 26 Sep 2026 04:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395295;
	bh=ym8bShvMR0/XgGYUzNS+yMcBMiYlCn28ZC+AfCdVr0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F47S8sH7mkF/YnJgEU4cNr1xfbihtqSoERgC6ZEC8e3qRLo9ytzfkp+TZKVkzQbs8
	 p7gXRgSPajgC+2NJIRFLLL4ENaulWZR8HqVvNRMeW1kcIbN1smf/Bc4p3ma5+E3ro1
	 NDrTD4pb5zQDdwLwljeeqza578DuNYzY3C4C6l7PDFlBTM0QujnFBd2XoU4yZgYl9i
	 LyVpO3SYd0BjZMyb6hPCocAVHGh08GsXjZqLFr5QBo/5G1GQHftoQmBVLWlO1ybpjp
	 8Zj6tLtuVKk0MdCMnGyxOR/XqPC4GEZQu5yxopY8mz4BIhDUqdDmfxve90DBY0nQ7f
	 rjIq+Q0MIw+iA==
Date: Sat, 26 Sep 2026 06:01:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 10/16] phy: rockchip: usbdp: Add missing mode_change
 update
Message-ID: <grlhnslyhggwmajaxrtkdlbbvjlylk5bckwmao2bo42xgebtth@k3rptwhxyuzp>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-10-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-10-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:57PM +0200, Sebastian Reichel wrote:
> rk_udphy_set_typec_default_mapping() updates the available modes,
> but does not set the mode_change as required. This results in
> missing re-initialization and thus non-working DisplayPort.
> 
> Fix this issue by introducing a new helper to update the available
> modes.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

