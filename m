Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158DDCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHEi2IY9t8j4VUD5pXpKWRwVTXZV6XPsVkyBBkU+X0I=; b=Pim4M0o77f2zBPpAaQnxIG13oW
	YQsJQiYDYD3nKebhLC2zbTkx1/tzAL5HLhGmkzhKtx5P8vnbByGgKRyXVTw3Bd3cXkdLBdnpVdGjn
	8SkKbfs6mEY/Q8gYDMgDXUtHXKIeKQTytG6rpYFit/R0LtRMIcRUIC9jiTrIrxPA1L2dCGxkPdDwR
	Xz4A/stelYJpPDeL21N/PEn3Wb+UGJxedRll8arViAzuCEfgl2p2bLhz7PDSd5iU58v772uRIcZ/O
	Z8EQLFqFD+YpiYvlWXJKDpuW1a5jceH3nHDTs45HpKfUxur5YZkg8tYOwRG+gm7Tg5R3nx9cW/8b2
	Mdm0e2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3fX-0000000Gmud-3v8J;
	Thu, 21 Aug 2025 11:41:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0y3-0000000GIsT-1zNe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:48:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FD7A168F;
	Thu, 21 Aug 2025 01:48:10 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 523EE3F63F;
	Thu, 21 Aug 2025 01:48:17 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:48:15 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, peng.fan@oss.nxp.com
Subject: Re: [PATCH RFC v2 5/7] pinctrl: Delete
 PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
Message-ID: <aKbdT3D7YgBvkSc5@pluto>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <bbe178af-62d9-4ac1-b089-09a7ab14d36b@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbe178af-62d9-4ac1-b089-09a7ab14d36b@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_014819_546959_35905129 
X-CRM114-Status: GOOD (  10.93  )
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

On Sun, Jul 20, 2025 at 02:39:09PM -0500, Dan Carpenter wrote:
> The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
> be expressed in terms of ohms.  But the pinctrl-scmi driver was
> implementing it the same as PIN_CONFIG_OUTPUT and writing either a
> zero or one to the pin.
> 
> The SCMI protocol doesn't have an support configuration type so just
> delete this code instead of fixing it.

Wouldn't this risk to break any deployed system which already happen to
misuse this ? I am thinking especially of the guys who have actively
developed this driver and the related SCMI server, like EPAM and NXP ?

+CC Peng@NXP

Thanks,
Cristian

