Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584EFC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byEEfCh4k6tf1ei/oxgQXIrGO+jggmsx3IBWPRS/rd0=; b=ImpIi+kEHYtKKK0TUJgTJyk0q5
	lwAwhu4egrDPUSBmwzN6naduBdLMZaPwC9/Gywuke4hQ7WVLlg2ylbJFzp9PqdGqSFmBgiKumXcSH
	gZtnjp6bn7tEMt4Az24UWeXMbppQunoZ44c57w9jVeHJmm7but1i+ncvDZ6KNbW5WymginBvcCNz4
	nscuF7QsVBlyhrrJYLiNQmCpWtjDTZiTjqsD/FkiS7YhfgyfGqxGm83v6wRqZdzFspMYvGKbHaol8
	3BfOVugBApdsHseeaBKe+TmKL93FYDbScv1kAPOY25tvKvcndO+zWho3iK0O7ZcZsr03ZRJ0xXOK0
	8Du2mKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ars-00000000Edd-0ExU;
	Thu, 03 Sep 2026 17:04:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Arq-00000000Ed1-2bIo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:04:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 164B460A52;
	Thu,  3 Sep 2026 17:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F861F000E9;
	Thu,  3 Sep 2026 17:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455089;
	bh=byEEfCh4k6tf1ei/oxgQXIrGO+jggmsx3IBWPRS/rd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ARjcVxUN9wjhX/Xop09geMJORhlpOEJIkBXnXNr3F6iGqnA0b7PvsUm41nkqyt1Yh
	 aYiZXzhXiX+LXgL6OXwTbThP5EOX75hqVc8SITrq3s2RXcay3u27cyfnQZnQivl1UU
	 HdteGIWVlt03AK9Vbr07EakqpD4mI0FyWY28+jcn9r49n1Zvea5AmWiGe0GFJJa28u
	 Aps2JYOGwScv+9QODQXnrbj9kE846PZGWvLR3gim43h9K8P+RKjyRAbxWZ3IMd7p4d
	 1IKC1SHOGI8f5yl3U12B9l29gZGw0vkwm9GVBaBFQOVHqRZ6pkAb8L1yfy0nGEjsvg
	 kAtEblfSEujkg==
From: Vinod Koul <vkoul@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>, 
 Vladimir Zapolskiy <vz@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260726102424.547951-1-vz@kernel.org>
References: <20260726102424.547951-1-vz@kernel.org>
Subject: Re: [PATCH] dmaengine: imx-sdma: Remove unused imx_dma_is_ipu()
 inline function
Message-Id: <178845508682.1711546.16165928798179926266.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:46 +0530
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


On Sun, 26 Jul 2026 13:24:24 +0300, Vladimir Zapolskiy wrote:
> The last user of the inline helper function imx_dma_is_ipu() was removed
> by commit bfac19e239a7 ("fbdev: mx3fb: Remove the driver") a few years
> ago, and this helper also can be safely removed.
> 
> 

Applied, thanks!

[1/1] dmaengine: imx-sdma: Remove unused imx_dma_is_ipu() inline function
      commit: be9bb4b4a3c4611ecfbe3d785894a09d331c6f25

Best regards,
-- 
~Vinod



