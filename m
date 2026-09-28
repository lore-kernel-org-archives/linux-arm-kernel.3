Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D64CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HvM9WxqXZZ1iC7kzUTEKYdXSdg1X/jUsoYSpL/vx2Q=; b=F8HIKkGJvcIZbhVpFUaPGMvZm8
	IQVe1As+ZJFTbTw08MsPz7mpAnGK50SVB0HKcScXSz0TEB1QZmnczQUlRZSlgnPzNToeLBoCReYWG
	dl8FgKTHpTL9sdcyE4orZhsKIarhI3a9+PTPkJdQTgPOTS7hS4rkWurBm4B9o71foNImpbW+3Rk/C
	oHk4GBt1fEA1vCZF0vujhPUpAfWVpfphiMVHEFvKTNkKlultXDhoSALlWfF1Iodviy3w9bo7ovd4g
	+dZshpVYMrEeu0aNSRHsB4vaAp89FUOwRTHLv/Ct3VBL8CEjP8Stw1GeHF+g8hQy6802bpxWtSxqR
	DmKfTRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG5D-00000001K6N-3qku;
	Mon, 28 Sep 2026 18:28:11 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG5B-00000001K5h-0I7A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 18:28:10 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id F2EDCC0000F8;
	Mon, 28 Sep 2026 11:28:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com F2EDCC0000F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1790620088;
	bh=UVPMZhvqMrthXlyLMMQxYdzI0vXhxPmHZ965qly+dGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fn748EIJiEDh2Xy/473H5+Q+w4en7SVO4XkIF1OIDtnfyxqklAhVjjvc2HWkL4eQP
	 Yx8bJTV6RuU1eG+SlvhDKSrvM9Jl6tuQp7drUEyIJ10moNchhJxvu9Z546O9e5c4aC
	 kwvEf3zHvgrgEM0gALM27U4vGe2KGR4ss3BB2wO8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 95C99ACC;
	Mon, 28 Sep 2026 11:28:07 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: broadcom: rename pl330 DMA nodes to dma-controller
Date: Mon, 28 Sep 2026 11:28:07 -0700
Message-ID: <20260928182807.1269041-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921015634.1044454-1-rosenp@gmail.com>
References: <20260921015634.1044454-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_112809_182553_1DE9473E 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Sun, 20 Sep 2026 18:56:34 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Each PL330 device node in the Cygnus, HR2, and Northstar Plus dtsi files
> was named dma or dma@<addr>, which does not follow the generic
> recommended node name for DMA controllers (dma-controller).
> 
> Rename them accordingly. The phandle labels (dma0/dma) are preserved,
> so existing references via &dma keep working.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

