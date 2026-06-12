Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05720CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 20:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cNLNgKkcl8y9XOjsHZbmwTHwlAMKwujnNeJuX5MyOM=; b=qhxDA1DXIJD/070fJcQgWnDj4C
	8J6wd9X7fjBEgYscsSxXtKBLBRo1eDn3KDbnYbc1YsqgviTQtzfgXLQe4O6Oc/1NNMx5+vtka3HQv
	jRaefnlMX2iPQY2gTI2Z23ocLu1fLyr4k+IH4cjYnQU4oqXw4om7P68fnanEOj5EYfvz4ZbfV271J
	zeeFpnPufSR1rROpLdauqqruTc0Lqs2YTmuydLUHhWxYJwSIEmivrfahi8yeYF9/QVrZlkwBX8jpc
	H8gNst8sMNF304Vwri6KR3PF8bH1EtC25SDSuLbDD8GC12dsRZDsgVTfwvgzZs0tSGincxTGguu3A
	ItlLaIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY83z-0000000BWGB-234a;
	Fri, 12 Jun 2026 20:01:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY83y-0000000BWFz-1wjj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 20:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D41F7400E9;
	Fri, 12 Jun 2026 20:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76031F000E9;
	Fri, 12 Jun 2026 20:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781294469;
	bh=6cNLNgKkcl8y9XOjsHZbmwTHwlAMKwujnNeJuX5MyOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H14Rv8QIWLqMP5DKAKGLXtlhlq3IhYgWWJ6DqMIRiuBuURhTpCog/S9xltrF1bRv7
	 l4Kec9HrjhQHQpafmFP65nTJnZgD5g0fkkxmPgXvxLRp7Oon4CobbdefGMepHu/DWr
	 WuO/0iRij4UTgHdWeZhIeWh+Oi4T6+zINU8JzBc74X8nfSyNVPH34nS1ZNkHM7rPOA
	 gAAFEW14575TMb5lZWOXngy2vHBwGa1OSvR3OYGYY7w1Vq8JCobMte7yuCvOi9KzYg
	 EJOeDpKKT+scHphKNlQc8ZQs+xroSlIvgPAlvze0zsyNeP8i6SLw7HVfaWWbVPd78W
	 /DKIR6ILAjPuA==
Date: Fri, 12 Jun 2026 21:01:02 +0100
From: Simon Horman <horms@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
	rogerq@kernel.org, pmohan@couthit.com, afd@ti.com,
	basharath@couthit.com, arnd@arndb.de, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	pratheesh@ti.com, j-rameshbabu@ti.com, vigneshr@ti.com,
	praneeth@ti.com, srk@ti.com, rogerq@ti.com, m-malladi@ti.com,
	krishna@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next 0/3] Introduce HSR/PRP HW offload support for
 PRU-ICSSM Ethernet driver
Message-ID: <20260612200102.GN671640@horms.kernel.org>
References: <20260611123636.376577-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611123636.376577-1-parvathi@couthit.com>
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

On Thu, Jun 11, 2026 at 06:03:25PM +0530, Parvathi Pudi wrote:
> Hi,
> 
> This series introduces HSR and PRP protocol HW offload support for
> ICSSM-Prueth driver.  HW offload support for HSR/PRP is implemented using
> dedicated HSR/PRP firmware running on 2 PRU cores(PRU-ICSS) as a "DAN"
> available in AM57xx, AM437x and AM335x.

Hi Parvathi,

There is AI-generated review of this patch-set available on
https://sashiko.dev

I would appreciate it if you could look over that with a view
to addressing any issues that directly affect this patch-set.

