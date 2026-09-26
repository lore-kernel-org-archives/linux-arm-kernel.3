Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1926C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48zWiXtDbWWPdN5dNR6DkzojdZtrw8czYNDIITV+eRM=; b=MXL4w1OMXWCWolTAdYaz7LRR/N
	wPG0vvysIWXd8Dn41MjpSvSJ6qtDEWW5eCcJ4ZFMyhk8YVvwOgzdt3N91v41b0RsTRJioVBGG0hsh
	YvdmpqyK2oMeL7e2WYM3XWPv5wNfTneFbE9KXoafikjeZlqedsSOsTebZGzGH9wKPtxkYApdWmq0j
	q4UYl3L8F71JOy+Nkh+eL9MtvQmk01MapdKkjucRWj4bSbjLHyvc+pZd9wA6XUv0RmTk8tYbcSkKI
	K6ejEOBFaUAnh4ND2rh4j3MpxwcMTYsXoQsdJraNxI4bAmCTzoweMcwjXZi98ZqTa8tMDsflWbivM
	zhQ6Qnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANHh-0000000F8fO-0ErH;
	Sat, 26 Sep 2026 07:57:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANHf-0000000F8f3-2qGa;
	Sat, 26 Sep 2026 07:57:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FE3A601E4;
	Sat, 26 Sep 2026 07:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EC21F000FF;
	Sat, 26 Sep 2026 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409442;
	bh=48zWiXtDbWWPdN5dNR6DkzojdZtrw8czYNDIITV+eRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P/RiMpMB1uJqiNWk6NfX+xLtn8IyNqDitDt0z7qXTOYFszs71G3Vt3uNHlO2aZ4Q6
	 OP5OHy+OPAibZqyoWFVhq8rqwmMndoMJ32P52Ukx8Wk49HLvaOCx35+IBDEnDSLYHe
	 XMdqCvZBCgInhXjEVrC9YU4gWX9IpU1Js/P5va6tGMMM4U+5mdLbI1hZr/Pwsv/RTz
	 QQGyX6lcM/GG+jKfDLBWA+nYxwBVX/OHBcSX8PyUdSMlH7gvEGOqB9O97WtGHhSLn/
	 +WC35Y6QpousRlaJVak5IP/bnodNx65T7t38PCN2ebOSegLy7yjhwLVpqljI6RjG3Q
	 R4w6sXE8CJUJw==
Date: Sat, 26 Sep 2026 09:57:04 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 3/6] phy: rockchip: usbdp: Rename mode to hw_mode
Message-ID: <tdedujt6ngogtmilpfyfo56bmj2y255ayx2tinhylnstjxbtlv@6r6g7qzasefg>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-3-9ad90a456953@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-3-9ad90a456953@collabora.com>
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

On Tue, Sep 15, 2026 at 05:32:50PM +0200, Sebastian Reichel wrote:
> Rename mode field to hw_mode to make clear that this is the modes
> currently supported by the hardware, but not necessarily requested
> by software. I.e. it is only set by either the USB-C state machine
> or device-tree if the PHY is used in a fixed routing setup.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

