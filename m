Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70957E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0Um3kpVEp51YNVlHFf8u/ssJiNkGddOOlqYslvGToM=; b=D7jtfHYTbKzmSJbpsF7P2Q/4ct
	1dq+GU9yNEFbRJ/4fAMPGzbXlSZiZEoJPC2xrkJStQwh4l3+bo3pC83AkN47kB+Rm2kq6MgDgoAnu
	LuFxwJ7y2Su2Wy+S0KMyuAQjjtqY2Y7U8blhqCqyQBtlk4xgas+XTEZy/9FgE0goQeCCJqcXwA+pQ
	2uLGBx76fgysr/FzSk3mcyNu1nXcN+WCIDGHZGTDQP9kNR+IEXZRTzZ5YvZiqM2+EM5dlLRrW1XMy
	O5F/m+225evweoVFVRe12gXmAiVJCYiN9JApIXU8PhQ30Egi72amCz5ok1M4wxfhJp6ghjRrRedue
	WtQtTM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKeH-00000005HFh-15Zs;
	Mon, 13 Jan 2025 13:38:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKd2-00000005Gwj-17Ze;
	Mon, 13 Jan 2025 13:37:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59B1F5C4C8C;
	Mon, 13 Jan 2025 13:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8046C4CED6;
	Mon, 13 Jan 2025 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736775434;
	bh=lELgVVZb/aNmH72dj1QI2MDg3lY+QkcKnIks+qVNCmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oL1faxh27U483scWPa82dvzfcB7nPievQ/2cqmZAX72B6L6xxWLJ5XFiftrOBEZNT
	 1qGEIz+BysMyIiDe65PgvYW0Xzt8RFbTm9ivWWZCnCHPajeZrYtq98uyekQmJmfpd8
	 9SiKQYYQrVJaCFbK1dD0jIpWocGI9P0+QbHRKRDcgbx0oPjAX+vwAkDtAKX/bkCCdO
	 66DGsXOV0Mp1PLUCQMJNEUuTyzDdkBcjcsWD6RHQUzun2dW3nAZ5j7QCYBPL5PDVXO
	 TRTsFT5oJ++osepNhNz7dZdvYewkkLmh/AZz0hypNYD3BAiaP414bd7aCZnYdt1zen
	 OfljdjI4zh5CQ==
Date: Mon, 13 Jan 2025 07:37:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: francesco@dolcini.it, aisheng.dong@nxp.com, kishon@kernel.org,
	airlied@gmail.com, devicetree@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, kernel@pengutronix.de, tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org, tzimmermann@suse.de,
	festevam@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org,
	dri-devel@lists.freedesktop.org, shawnguo@kernel.org,
	agx@sigxcpu.org, frank.li@nxp.com, linux-kernel@vger.kernel.org,
	s.hauer@pengutronix.de, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, simona@ffwll.ch, mripard@kernel.org,
	imx@lists.linux.dev, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v8 06/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller command sequencer
Message-ID: <173677543230.1686186.45544377121474108.robh@kernel.org>
References: <20241230021207.220144-1-victor.liu@nxp.com>
 <20241230021207.220144-7-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230021207.220144-7-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_053716_346478_F7355A09 
X-CRM114-Status: UNSURE (   8.06  )
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


On Mon, 30 Dec 2024 10:11:54 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller contains a command sequencer is designed to
> autonomously process command lists.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8:
> * No change.
> 
> v7:
> * No change.
> 
> v6:
> * No change.
> 
> v5:
> * No change.
> 
> v4:
> * Replace "fsl,iram" property with standard "sram" property. (Rob)
> 
> v3:
> * New patch. (Rob)
> 
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


