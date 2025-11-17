Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC81CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 22:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOwQQPw709f6u0OhFmcef2L0Hokzaw4IOMiGJuQrAEU=; b=0KcXswiKjVPkAeqSKaluzfeo0W
	G/1AmH6s3taU3in0RCLAJ7p3ayCs75eiy9EATKYMDr7U5sJ6I6i4WaiJ7yKIReuuV/EgrwjlSD2OM
	T8MqgVUNNJaJEPjyZAyc2HYgwHJ8dhFhd52ACpfE7s7wJDJe6mZvf7y10wIKCRjRRh4brMgNJIVPy
	BRf70yj3sldwNIOBFI9E0vBtEAh4RKWgNn2a6lOoBqlwAv/pdLmwRbOzF5RR3OD99ifO9Rwi8RHwH
	38QDveuldca0tF3wRFyVrAi7r18Ka0xTuntO4nayHwJ5UWeRf9igSlO39FRHHD8FgG7KUmK8OebUk
	cCvpBGAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7NI-0000000GvYE-2Nwc;
	Mon, 17 Nov 2025 22:07:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7NG-0000000GvXe-3ApU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 22:07:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE219418D4;
	Mon, 17 Nov 2025 22:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15404C4AF0C;
	Mon, 17 Nov 2025 22:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763417221;
	bh=/rwLjEJrq5xh81nSd6zHZcteNgx1DtiJlrIi/MwXBk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKLWwRAFVmZjOd0q+7anlRlVUfGcGVWQ8HgzqxKk18ux2korH2ONGhexM5HtqWAQZ
	 mY9rKFTMI97Kp10F/F+jVsH/NiA86PFuct16Q6yaQcx3Y4OchRRQ9/3F+7uOIXXSIX
	 lSxYq5O6roloXU779M64lg2hnP1T3P6+mQEZV4t2TXlcJStbTOCz38aJOGvUQX07U6
	 Uw0sq9g2LShXdKts0BrGfgNxkHkKNQiz5hZtymY9CeTBG+Vn7tA9aMw+M3c53oei+d
	 xXQaPKi/VKD8uht6kS485Ep5YRw6PcSYw/+KbIGDmCr/GSQeczeFxYAxfiz3TbBx6x
	 COweWDwjujNOQ==
Date: Mon, 17 Nov 2025 16:06:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: nicolas.ferre@microchip.com, conor+dt@kernel.org,
	romain.sioen@microchip.com, linux-kernel@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org,
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH 1/2] dt-bindings: arm: at91: add lan966 pcb8385 board
Message-ID: <176341721849.806024.3609760961005351120.robh@kernel.org>
References: <20251117125709.102013-1-horatiu.vultur@microchip.com>
 <20251117125709.102013-2-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117125709.102013-2-horatiu.vultur@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_140702_835596_2F22D2D9 
X-CRM114-Status: UNSURE (   8.90  )
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


On Mon, 17 Nov 2025 13:57:08 +0100, Horatiu Vultur wrote:
> Add documentation for Microchip LAN9668 PCB8385
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


