Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F739CA5FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 02:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lgWi2/IB05y1ovgJrX8WbRx++hxUi3VzmiykuLRpPM=; b=msyHv8omBJUFCkLWHvW5UdAHRf
	uaWbgfWxHL7E39p/Zshqn+mQvSRVGLs/+APe+HUEENdfFE5f3JbAGx3FTkFMutbV9toZNxMtahmU1
	md5cW2o5xmiadhQBqFyRbXqsvIwmJ0OKfuLbq5PQiSiMJDpoCftDx3Pe94ifE1j3rM7pBAHOc32zM
	Xa1DMgwlbs01vLKM0DJrl+VL4mPei7CyAa7mpdADWRqWRH5p42R7yLjRvsp0y6jKTMh4sC7afgJ3j
	e7YYybG8v3KgY9N9kIr1m8sdsgD4Z1hM6gayUWAjvHgRI3T11j8gGzZNv9qY5oS+yDKDbUCacPaDw
	u8t5B1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhI5F-0000000GS5B-17xy;
	Sun, 18 Jan 2026 02:00:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhI5C-0000000GS4f-1D5r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 02:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D71CC40057;
	Sun, 18 Jan 2026 02:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836D4C4CEF7;
	Sun, 18 Jan 2026 01:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768701601;
	bh=FtOo0L3HifSIJ+5XkW0NZr9NZ2kybiEIkSrdj2Pr72U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gL4dgnpqh+r2yxGfutgxcqivh6xUBnPlybffBO26X1vT8DgOQNIDekFpX1zmCzCQ8
	 wiHMJg8yfv/9BmT3QyGzObqm2aHWiTjBwdeuUkYoRhKWBXTG8oFaiKMG8R6sbuUXzX
	 he/DQ903SiMomx1mGRBxdDN5uenWLHzERsZkA78/jyDR9NwffboqFkzMQ9z5bcJ77Y
	 7P6X0RyG+TAKpDVYigQRX/p/KoH8kmh79r7g4iQLyT4KAxASL7/UBvIdOCvayHpzsf
	 5/rX2IkbUVOycki7C23Fmpzr2IMP0SVcA9NQ/PR1hyOYwyoe90eGN0KAmfcRm+EQrx
	 zrfbSm2dUOvkw==
Date: Sun, 18 Jan 2026 09:59:56 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tom Zheng <haidong.zheng@nxp.com>
Subject: Re: [PATCH v3] arm64: dts: imx93-11x11-frdm: Add MQS audio support
Message-ID: <aWw-nArlfnG4PjQp@dragon>
References: <20260113075002.561453-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113075002.561453-1-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_180002_348181_32344925 
X-CRM114-Status: UNSURE (   9.40  )
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

On Tue, Jan 13, 2026 at 09:50:02AM +0200, Daniel Baluta wrote:
> Enable Medium Quality Sound (MQS) output on the i.MX93 FRDM 11x11 board
> by adding sound card description and enabling sai1 and mqs1 dts nodes,
> together with necessary clocks and pinmux.
> 
> This supports audio playback via SAI1 DAI which is connected to the MQS1
> block.
> 
> Co-developed-by: Tom Zheng <haidong.zheng@nxp.com>
> Signed-off-by: Tom Zheng <haidong.zheng@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Applied v3 instead, thanks!

