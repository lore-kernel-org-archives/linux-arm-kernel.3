Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713BFFD8FC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SI6oTr2lrww2PHy9trM6Yl4K+Vs4TMBop0sr7HkwHc=; b=bBpuIfGMgEpJlyiYo9B6no+GXB
	4EQUCrt01cDLYp2Q/b3ZZTi2zHXxUUGaCMqvlBxZCNcWbhMtvAGYdcqE3TLd67Q/Luse9UQ2TrXqH
	EPDQzN3P5bWieRI9Jlk4ubnswG01/lsr7n0mvj7W2oqzWBHjZDUkP0nXzLPdJU39Uf2ZyZtjQLZzE
	TvmPI+dccxcER1qOzKSkWBQPbtJbO50BLQOTKwRy5Xm9ntDTu853qjxX8BWDZt85CJQoGvLENRAXs
	fD+R1oW/3oSPc2vig5tLjUAaYJW5BOgrRyXdwvnvCmTBkMxNhZvK322ZLCpPlyMsp7elAnYDEvqOt
	Cokxj4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvclt-00000006ODD-2AUS;
	Thu, 26 Feb 2026 14:55:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvclr-00000006OCk-0k1r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:55:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 282EC153B;
	Thu, 26 Feb 2026 06:55:12 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE8FB3F73B;
	Thu, 26 Feb 2026 06:55:17 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mike Leach <mike.leach@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2] MAINTAINERS: Change e-mail address for reviewer
Date: Thu, 26 Feb 2026 14:55:06 +0000
Message-ID: <177211769498.1377329.10916889049327400138.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226141354.638962-1-mike.leach@arm.com>
References: <20260226141354.638962-1-mike.leach@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_065519_279791_B42CA7DE 
X-CRM114-Status: UNSURE (   5.08  )
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


On Thu, 26 Feb 2026 14:13:53 +0000, Mike Leach wrote:
> My e-mail address for linux work is changing to mike.leach@arm.com
> from 1st Jan 2026. Update MAINTAINERS file accordingly
> 
> Updated .mailmap file accordingly.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Change e-mail address for reviewer
      https://git.kernel.org/coresight/c/87c266bb30dc

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

