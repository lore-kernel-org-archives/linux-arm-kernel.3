Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23985CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfAXXx1CJ6TSjqeW+mrfldmHh9X0zU0bdX8mXNm+FG0=; b=MjEh2F1B5Ehu0QiWDxihrMgmNp
	9Q2Q7AAT2ASA4xtfQ3LL07xqq8fdfAfG1f/381st589gKz6GoVFXV9H7UXE+46cdUUWKXlLOVUai+
	oREEimW3seWXKS/XY+Gazq82rA/C3LTaNpDyQWWV9l4uYubBJqJdINrWv774sBk/zVvR4l4NArxvs
	iP7Gin9gozir8d/CLSv6VZgJrVtNJ8pBlG/LU1tK1khgaSyT4mG4k/UtU7evMlCFUyB7N5C5iWMob
	5XgkiZIh9OFMlmo5m0p6LjQ26L+/ggUuGVLF9OhVKtY8mtYB053hCOBVUD9FP0RoxY16P5ftTGjuj
	eNLOT15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYK1-00000008lNA-2nLu;
	Thu, 11 Jun 2026 05:51:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYJz-00000008lMu-2ySN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:51:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC3E5418DD;
	Thu, 11 Jun 2026 05:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620D91F00893;
	Thu, 11 Jun 2026 05:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157078;
	bh=DfAXXx1CJ6TSjqeW+mrfldmHh9X0zU0bdX8mXNm+FG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TvoNd8jxPrFVrI2JGUDycYfwOPfr6PlMZSRBoAqNUDx1sQIfP63vVTszEqZiQORlt
	 UR4zOSK1VG9t4aASu1bH6yXYQfXEINJyHICHrE3UXXrkTjG9FAdKX7FHHa3+mYsYcW
	 xluOuxNuE4VjTGK6JyhuBXLDRH7pLIs0BynE5Ag7aEYo3PrrmukhruT0VazRVLvgy3
	 D+5M55gy8SRQ+eJ4je8bR747BHFOkWTwzn/QjN34o/tG+7D5D5uQcmmmJn++3Zd4Sr
	 qI7ddCHHqzXJ9bE+3M7rpl2xBbq3wIWP0RtHlzMOjVregzUxE0koBX9afi1GCnZdkI
	 IAvmdt0YB9flw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
In-Reply-To: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
Subject: Re: (subset) [PATCH v4 0/3] Reserve eDMA channels 0-1 for V2X
Message-Id: <178115707400.468137.2385832019756326414.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 11:21:14 +0530
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


On Wed, 11 Feb 2026 17:28:23 +0800, Joy Zou wrote:
> 
> 

Applied, thanks!

[1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask property description
      commit: 75b28d74f90c79e788e0e86caf0173fc0b2e92aa

Best regards,
-- 
~Vinod



