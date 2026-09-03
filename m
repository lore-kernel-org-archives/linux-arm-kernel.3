Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7CDC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld3UdOgdvBnm8A+opQbKY0dHc+fqnHELUYTu0DuqKTk=; b=X9RBftIBTkbp3jfitqMKmtRcir
	GdSMXTp751Em2wOIm9ZgHanpFNrtJDv6uujlq9cMALIVuIL4NxbIk7OJVLG5lVCoLUOQJD1VkGSYd
	hEAf9oRlzFvB7LxH5CSLfSp5Pde+1OdrZxpKdABE06Og1hNeMjTMeZO3jYfaFVEJ8P083OB4XUNLz
	sboCoqFZ/glutOMwtsU9x9Rhi2F6fFCkB/FXy8nyib6yRW0bzS24vJ5c5FgTrG5ygRy2Sl1a05nMa
	0qfaBiA3HgvZowCzY/SasdO8RFW2srQN4dTkvDATrhz/wni9IBbHTumAdoDZ3aPnG+62kX3KIZSw+
	tIzuj90Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DNz-00000000VMn-36bw;
	Thu, 03 Sep 2026 19:46:11 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DNx-00000000VMC-1Dqt;
	Thu, 03 Sep 2026 19:46:10 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1A475C0000FE;
	Thu,  3 Sep 2026 12:46:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1A475C0000FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788464768;
	bh=+URqbLxuDKgSD6CyxEGLNYWoSOkrCtwhEz54gzj0VZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rhV2MIW8RqQnlBJxUwjzAcRDiwg9h/WHeA413q1L6MIdnWTvMjolddE6aFVqhXOKK
	 AtXwFPX/aWJmoAIRoqWLE7mI3SbtTJNrUMSHlV3z5gxd9MJ+6vDxwh4SwddIQlv2Ia
	 N3945bn/2PsDqBw36uvE9o24pgcM5+1impPI1INM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E39C1A9A;
	Thu,  3 Sep 2026 12:46:07 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add compatible
Date: Thu,  3 Sep 2026 12:46:07 -0700
Message-ID: <20260903194607.2038438-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de> <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_124609_349793_3DE8A566 
X-CRM114-Status: GOOD (  14.48  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 10 Aug 2026 13:46:34 +0200, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> and in a c Stepping. There are two separate dts files. The
> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> the d Stepping. The d stepping does not set its own compatible/model
> string but uses "raspberrypi,5-model-b" through its include.
> 
> These two steppings are not compatible. Booting with the wrong dtb file
> causes a crash at boot.
> 
> Add a compatibles string "raspberrypi,5-model-b-d0" together with a
> "bcm2712-d0" string to allow us to distinguish between those two
> steppings.
> 
> Fixes: 44839e2ac8ec ("arm64: dts: broadcom: Add DT for D-step version of BCM2712")
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

