Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED9FD73091
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGVNvdmyPLrnuQm0vrwWKMvtO9uoE5KBnFIp8YQuxgI=; b=pnOPyoAtRsc7pZ5/nWuPNyDB9i
	1WMYaKq67uZt1KPUMUS36B3Kl7W8M82NwiD6+dzAtH1jeYa9mDG1J7JYbM0MtoctuLzZB7cT8XEPx
	ro8Sr5t7rMTfOf1l6776wwjpYLsVV6/mb7tNvW9nSOAL162z8iWZBEGtODoovBBg7lBZnqLOELfqU
	UECTIGzC/j1ppDuOsgqLiJXqaDwyhdIO+WCAtHVeu9mH18U1OF81xY7kVMfJmZtswvjL51mR2jVG/
	sDowlol6jooUiGDtty9iumKvXeGVDK/4endO8s6elMmO210kJ7LhebjynG3g2gxE1ZzRY8eWWPG5x
	PI9E87Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92HS-00000003X2o-1bFz;
	Sat, 04 Apr 2026 14:47:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92HP-00000003X2T-3640
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 14:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F239344449;
	Sat,  4 Apr 2026 14:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F677C19421;
	Sat,  4 Apr 2026 14:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775314038;
	bh=wkWsq3wOxvvGHQk5g9AdcPeG8Kmz14QfgWPiPSY/fAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgWB8CvrnBabd/PPFTftEM8Yg4ce7Bnp5i35nCClv52Fol4A5/jbB0PR04WD4D5nx
	 OZ2mTONoFKKP91Q5Bb3d0CUgEm553zGSmU5/qFMxjD6MKaD1df3y+AmdN5rTgL1kjZ
	 x2F/zt4suiuQB1Fq+NvvHpgMld8/IVU7q85yds8LTwwKOQdzf+WpJOgzYjuEXHSBOz
	 m3masDW9xk0r2292SJ79A4GOBHboGlVxErafkxqh/biq5bsP9qsGLouFD2m/avjxjY
	 LMe2uTJmkZdCNUaF/FBkCCdrKxOAx+lGKBCZMVpLbt6atGPBpLVZrqKfV45a3+fJem
	 wCqBTw0AfzJqQ==
Date: Sat, 4 Apr 2026 16:47:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/4] i.MX arm dts changes for v7.1
Message-ID: <20260404-thoughtful-placid-boobook-da26da@quoll>
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
 <20260330141444.3789193-3-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330141444.3789193-3-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_074719_798887_BAB5EF2A 
X-CRM114-Status: UNSURE (   6.83  )
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

On Mon, Mar 30, 2026 at 10:14:38AM -0400, Frank Li wrote:
> Frank Li (24):
>       ARM: dts: imx35: rename emi to emi-bus to fix CHECK_DTBS warning
>       ARM: dts: imx35: rename i2c clock-names to ipg
>       ARM: dts: imx35: remove simple-bus 'usbphy'
>       ARM: dts: imx51-ts4800: rename fpga@0 to fpga@0,0
>       ARM: dts: imx51-babbage: rename at45db321d@1 to flash@1
>       ARM: dts: imx53: drop fallback compatible "dlg,da9052"

This, just like arm64 pull, breaks users without explanation. You use
incorrect terms in that commit msg which might mean you did not perform
proper analysis of compatibility. Commit claims compatibility string is
not comaptible and as proof brings dtbs_check warning. So the sole
reason is the binding. What if binding is wrong?

Commit msg must explain that.

I looked at the drivers and it looks 100% compatible, so commit msg is
clearly wrong and this might affect users of DTS.

Please resend pull without this commit.

Best regards,
Krzysztof


