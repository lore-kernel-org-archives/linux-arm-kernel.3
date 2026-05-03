Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39338FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lquLlMxx26BK1MjiYbriC2wHnJG0WT6UWKpRtkYw8Ik=; b=4fNlYHoGtIYiKW4FlH3a1e66tX
	Kf6ivywX6JVbmead8d2oFUrfv8184Z4nnF/rNQioC/x/dnX9XdcR+RAUWrcvqxBZPT5ydN1ahA9Hp
	Ba6D0URikYt+mre65oNnFW7XRe5HqG10on8SYGoh9F53fpTcn06UQ5GAYN3GXo2LgNAxTaNfYXaho
	kLDubHdE8moiAwooSITB5buQHopMxAbcPKo0mX7B568eYsKuoJCWRKdlSvUJec955WY7Ie0lCyDjw
	w715GALp4tNBYkyJySF++AaDNlSm8MjaTn885ZL47Z5GqkeUET5s/JiReuic2VYHDP+rHIDQeICFj
	k4OHAw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJa4c-0000000BLNd-45eE;
	Sun, 03 May 2026 16:53:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJa4Z-0000000BLMs-3ShI;
	Sun, 03 May 2026 16:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25C7C43D13;
	Sun,  3 May 2026 16:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61020C2BCB4;
	Sun,  3 May 2026 16:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777827219;
	bh=1Etpq6wnGwOr5oR0u0952ST5kV6ZQp1I+Y9KByQY0Vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghW9LrpCOgQpUpZ6bt35gv9JaxPFBItxyJkeSUdmr8HmMdSQ81CCNedzh4qF8kb2U
	 xNtoEOXtZ2L+CCm/4a2hUqrGZ0BbqTTjSqKIQLVOsxTAlOEOumoxBmQcW6ZELL7okp
	 Wbn7S7zmfJN05INga6GyQ3euRVkhtXVPm6dYGHp3quwMW5zVRCZGTAcLC8mKpNXIi0
	 fI/Al4q2y9c+CjhZIh99gUltSQIq3yNK2HqDOrpmtMlJNN4B9Tn22fQbEty0fPLUGR
	 fAHzLWtr1EN9cGIh2HW45tymrTpfP30G/+Ot9WyRXIIJJ9EeiC9j56VqTem5wkFdU6
	 eIyrz1g5Rfu8A==
Date: Sun, 3 May 2026 22:23:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Parshuram Thombare <pthombar@cadence.com>,
	Swapnil Jakhade <sjakhade@cadence.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v22 6/8] phy: freescale: Add DisplayPort/HDMI Combo-PHY
 driver for i.MX8MQ
Message-ID: <afd9juuQh8OB6SEw@vaman>
References: <20260424-dcss-hdmi-upstreaming-v22-0-30a28f89298d@oss.nxp.com>
 <20260424-dcss-hdmi-upstreaming-v22-6-30a28f89298d@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-dcss-hdmi-upstreaming-v22-6-30a28f89298d@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_095339_886065_B40C8EB7 
X-CRM114-Status: UNSURE (   7.29  )
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

On 24-04-26, 11:07, Laurentiu Palcu wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> 
> Cadence HDP-TX PHY could be put in either DP mode or
> HDMI mode base on the configuration chosen.
> DisplayPort or HDMI PHY mode is configured in the driver.

Hi,

Please consider if this can be split from rest of the series and posted
as phy driver

Also sasiko has flagged some issues, please take a look https://sashiko.dev/#/patchset/20260424-dcss-hdmi-upstreaming-v22-0-30a28f89298d%40oss.nxp.com

-- 
~Vinod

