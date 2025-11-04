Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41291CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAuVS14PXGuwKAVdIeUzthBpC3pHGphyXJqDEVQxYjE=; b=HqdytGrk3RTIpuCv6fDtNEdQfp
	1hZcVaI7fkGWye8qOOwCbHQn2dUIRC4kITJnzRB37o15Uj1ro9Sr9sdgTtpE0dwen7pwXQ7ZMEi1b
	Bife5YHNy5Ajm073JqBzhFbz4c5o8+BdJdV7Z44nYE7XN+pbBJ4vdShTnRBmhSysXuc8eguXB1Ii4
	211B9VUwjsoujl5OSUMBGlc3euEhDsI49Q+SxE58PpdM/agXckb63u8b55FTVgR3Hy52nv1/lRTuB
	xqzFC4H7LtzrYDy3VT5ac3ZMRyi3brrkUfA6K5sd5y6L8QCVqrJW0N64NjIvaXGrbHPmnSeoKIoc+
	GrOAKJIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIHM-0000000BzmD-06eH;
	Tue, 04 Nov 2025 14:45:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIHK-0000000Bzm2-2h8o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:44:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B717A601EC;
	Tue,  4 Nov 2025 14:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6700FC116B1;
	Tue,  4 Nov 2025 14:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762267497;
	bh=f3ejIycn0AXi0bJGiQdaeyg6Sqpx9krTgJjt1ejgngc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ML8ntpJwL93/nZj6RydMzvMxZYQVpOl093ecp98vQxmG2b22iCv5EsEoLI/M13NU2
	 rjd/UnzDD1IwN56bEhNu1a7VDRdzxzZrXyKqWLDotI0434wOzylBTJRYD3j6CPQ90z
	 ewJWRrCLKascYZ2jsFR6NjAUeKP4PHuCaFNCzdOmz6JJeQVrJ+UXouKcCwkkOQOQDw
	 j2BxkKS7wbaF4BOoaouw90MS6hyCmAEVMB1BmI/Ets/5Ea2ttLyViFflbQoPtfCd46
	 hhJBS+cJDNuD0sd8OnCUichavzge9coCn+vWZLENPvdaN0LBdn5zkNXhuIyMfUbjE0
	 wS7Wxz4EinAFw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vGIHM-000000003dT-0Dlb;
	Tue, 04 Nov 2025 15:45:00 +0100
Date: Tue, 4 Nov 2025 15:45:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx8-isi: Drop unused module alias
Message-ID: <aQoRbFfo8jTdJZiT@hovoldconsulting.com>
References: <20251102234438.8022-1-laurent.pinchart@ideasonboard.com>
 <aQnRsVPq1ndQrLr_@hovoldconsulting.com>
 <20251104143636.GD27255@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104143636.GD27255@pendragon.ideasonboard.com>
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

On Tue, Nov 04, 2025 at 04:36:36PM +0200, Laurent Pinchart wrote:

> How about the following commit message ?
> 
> 
> media: imx8-isi: Drop unneeded module alias
> 
> The imx8-isi driver has a module alias named "ISI". This is not
> required, as there is no reason to load this module through an alias:
> the device is probed through OF, and the module has never been named
> "ISI". Drop the alias.

Looks good. Feel free to add my:

Reviewed-by: Johan Hovold <johan@kernel.org>

