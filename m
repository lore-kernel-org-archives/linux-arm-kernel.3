Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A70C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31lc0Hm8aHyC6iFXcq58NZ2CDu7adfKfWG4Z4EDrupk=; b=vXNHtqDqM9pHv3PxweUAlvyi2u
	GmmVvVM2JaTqUgebRUBiJKOua9MFOGo81RmwylA2f/q3FiRfKVLgTEgZKJuSf6fcVWmJi3LSMCxWI
	zWa6yOtQdgZSeqESJnAwoGTncH16fzbFxgiJknBQMudx3QY9ltqkZDhm+ZhJ7ue3/2tsWNV8fYi6t
	dX3XpyJHIQx+DkSjF/gmdLvQyoq3nSUetYJrhfaxRlxhzb+L9QI/X70NJ5MflqP9WFJLIJhD4aMEi
	dmX+aFbx23VAmh754AwGtA7T3sktdifNld2jr/u7o5JRH5qq8qSp6NIUJ488d6r/ToKiSznaC5H1U
	9dRw6VWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZ40-00000004xlD-2NL8;
	Wed, 23 Jul 2025 12:59:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYbE-00000004ucX-3ZVa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12517601E3;
	Wed, 23 Jul 2025 12:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2952DC4CEF5;
	Wed, 23 Jul 2025 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753273771;
	bh=H6F5gXttlgPhOq8r2chWAjHRxUTZr7MdXRmPzdRcOAs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=edEDMIX2ZkPn5lG+/a6IvQSzigNYqJgaVZN/MC3rues6KWkTHtN79AWtKopHBoR/s
	 S61sH3d3WfjtEjaJXnnpAbbjQCJUdaMj8hxuOvETm3GCnAxnIRyUki4ySELqan3JzE
	 fxQ4o3yiDsfMqqImoKcpg6hp050BrdEehZCsRSEq5YG3DhuVrmClORju56mSqOixgW
	 pis+0zWS4Kpu6YnnVVtZAsnQb8qS2ktz1c3zYxLRZ9MWOVr7SqiTkO/M//lCAr7+kd
	 6ls/6cE+mHDlW2Y96FnoNwJ8tb3/8jCy+62ZsEmiQICWBjQDJf7vWitbOUt1qJcA81
	 wmUM8YlY9dh3A==
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250702222616.2760974-1-robh@kernel.org>
References: <20250702222616.2760974-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: Convert brcm,iproc-sba to DT schema
Message-Id: <175327376877.189941.1348733436012583946.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 17:59:28 +0530
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


On Wed, 02 Jul 2025 17:26:15 -0500, Rob Herring (Arm) wrote:
> Convert the Broadcom SBA RAID engine binding to schema. It is a straight
> forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: Convert brcm,iproc-sba to DT schema
      commit: ec896de28c9ad1a4155c518588d9153c454abd39

Best regards,
-- 
~Vinod



