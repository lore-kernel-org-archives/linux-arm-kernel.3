Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C655CFD8740
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTJEU+MRi+8t+EYVxiihKbMngUgDkyHYYoCTjTsQNF4=; b=Ovax70V0FZ8Mj80fLoxbYouZrr
	FPTdC2tB1aTP6ZYLcK/opbuzflCL52MHOb0LNAXzS+n8DjUitxH+0Y7wO1BuKMTZQ1SW0WP1LEjY6
	1gFUEB7hWNutQxuf/rrPUDpxU+gq4xgSa/aTijeyWBEYbIq5DOp/Jc7o7yxv3xNGdag/YvOs3oO/I
	v3eEPUDUx8EFa6U0ajx8SlMhBd3XwmHwS29ZVeWdsiIp4jsq0KYuP1q3XRmt8UJ5HFJ8yGFAo0DAV
	67j7kg0i35GdlQs4R+XhwE68fOgtBZ9gg1D5daAKaoow4ArDLoGXxf7KLXfw0mXf8ZGBm37UvSxGc
	MSoi6ohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sb8-000000068NG-01tT;
	Tue, 17 Mar 2026 11:28:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sb6-000000068Mh-3Nyo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E08D60128;
	Tue, 17 Mar 2026 11:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1290C4CEF7;
	Tue, 17 Mar 2026 11:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773746908;
	bh=4py1MVzG7VKGzhA3K9QBQHZ0QJsQyv4qAQ3ZBFkYMcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UFmUT6utUb8CIpSQdAQP+tV4gjFL2+nZIL16gGOW1R3a4Ut53NTCQcsKCpCOM+frD
	 tDYD/s96rf5TfrSCu3c/gOd1nmqsJdq7JJVF2gWYFChlRCk3PtGHfmfkXM4mTAS1ac
	 uweLjqzXSBJVD/Tp42D2FuHhKwLU5lcts+eOOVwa5zwkvhu62AT5K2RbMEqikdfhjM
	 dK3GoJZ3Y9v9mXINHd+hha0BKSIlfQ4e7FJB2MUhgOnv4Xnsy5ZMiQ/YQph0eVUOh5
	 Zt6tHZZIcHulDuTk7ZKh3zVJIHuVSd6YcEeaSaNjtH3C6HVUN1IObEprMTVflceVIc
	 Zhu5FqNm+9KwA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, michal.simek@amd.com, radhey.shyam.pandey@amd.com, 
 Abin Joseph <abin.joseph@amd.com>
Cc: git@amd.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260309033444.3472359-1-abin.joseph@amd.com>
References: <20260309033444.3472359-1-abin.joseph@amd.com>
Subject: Re: [PATCH v5] dt-bindings: dma: xlnx,axi-dma: Convert to DT
 schema
Message-Id: <177374690462.337210.3827619168842658001.b4-ty@kernel.org>
Date: Tue, 17 Mar 2026 16:58:24 +0530
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


On Mon, 09 Mar 2026 09:04:44 +0530, Abin Joseph wrote:
> Convert the bindings document for Xilinx DMA.
> No changes to existing binding description.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: xlnx,axi-dma: Convert to DT schema
      commit: 2d5c2952b972be1cc87c215a2636d208b5e483d4

Best regards,
-- 
~Vinod



