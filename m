Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F51C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmFwast/mDqq84MT3N47d9iv+SkoP0eGv4aYSQvlvMU=; b=3c2V3QTdpdk3Vz1/KllCqirtth
	AZmIbuEM7qgQHgyStxL0c5jCdQsk1nTegkreupyH7/UuWcNzcvUZIe9FBfKlGuKRi/0ZgoAhsBUVe
	YZlASuCsOeYJPd+3Gu/bgEeiHrn8MHt/ZIN3PMphOLk2kvd4f+QRlgVg6/hOfYO4KCjfgC1e+wzU9
	wE/c3ZE+1q239Yh14PUafg3qf1GqKJvQZezgQfUciol7OSPoJSzEPvx1DxkLAOP7zx9EU573mv/HE
	LBz3QcpyrmmjppBcyobiQIN6YdIY2s2iEAE/x1a0xrgPqVdhhY1AFvSTxoNDrv2/gB8fm57wi57MR
	4L9PHfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUwY-00000000ARh-2Ukx;
	Mon, 10 Feb 2025 14:39:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUsW-000000009Fb-37uw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 14:35:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A0315C5846;
	Mon, 10 Feb 2025 14:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B93C4CED1;
	Mon, 10 Feb 2025 14:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739198115;
	bh=XcHJif2FfnwAjAbH7baaX4yilC2v5vnNJYy1PFC2dr8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KqXSf3jxdv1BjMeENVN1I84vhH53dlRaeGCEoz3u4I+4L8YlFqZo+NfubU5dr1pRz
	 yw5tBwiU7NzeOEounrDA6MqfRsmXv8vpuw3O2smhmCWxjuXiNBuwghioUnHu3aZJb6
	 WbD5M7QghXYbVsoWDDtrWw6cRCd3eq4Z6ljpiugcR5zwLH6Zpg280oQnzefC2poblC
	 zr9ER9OT/yerqrg6MUw/sKSFTEmvzV+Fx6rG2ZStTJN1hRd1kOUTE5XEqsJVmaxQ61
	 CXX8DgwfjfvwYowbxAAI1yogJoiCtkIxNYk05vQvUDjyCsmwnVJuEUtAg2sUQYunMq
	 C3NCU3q+mfwKQ==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Stefan Wahren <wahrenst@gmx.net>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250205091455.4593-1-wahrenst@gmx.net>
References: <20250205091455.4593-1-wahrenst@gmx.net>
Subject: Re: [PATCH] dmaengine: fsl-edma: Add missing newlines to log
 messages
Message-Id: <173919811383.71959.2258535246777923144.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 20:05:13 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_063516_832109_F84CEC1F 
X-CRM114-Status: UNSURE (   5.35  )
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


On Wed, 05 Feb 2025 10:14:55 +0100, Stefan Wahren wrote:
> Not all log messages have a newline at the end. So fix it.
> 
> 

Applied, thanks!

[1/1] dmaengine: fsl-edma: Add missing newlines to log messages
      commit: 1c4c8609d498173382913b8ef6a105f3e6ff3472

Best regards,
-- 
~Vinod



