Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A285CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 11:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faQlt4wzpzeq/vBlzcvlciv94cb4w4oobEarKxLngy4=; b=s74X5QSxH+s4ELWmiHO3/6C32n
	Zai2/kwsWuNQ/32dwaCiRxPwfsSTQUsedNkDsUrtY3cxC4bHD/AQobID++M+d+9HfsZwkSf+FaVov
	k23Ffiq6Z8pCtGymsQ2mzFVHrt5qRDK6vR+sVhq1GwDxqdZuJQiDbYiF6TZ8JE5wU2ijwfTwaVZ/+
	YFLzmxQzvy5WoWYRIESMpCRKx61CBls5t3WszjAdjdmnis4tKFtmx4wTn4AhVlp/Mf1LWcfmO8vJw
	Ih2PGMuvdXTP+0VpKt12+onqsm082oJjzbwZZiS2Zg8FU7O4lV09NVWkJ0obnZjTI5RBaA+OHbUIa
	NfA65YKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vER0y-00000004453-2El8;
	Thu, 30 Oct 2025 11:40:24 +0000
Received: from mail-m3276.qiye.163.com ([220.197.32.76])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vER0v-00000004441-0P9S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 11:40:22 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27c991459;
	Thu, 30 Oct 2025 19:40:09 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	krzk+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org
Subject: Re: [PATCH v5 0/6] arm64: introduce Black Sesame Technologies C1200 SoC and CDCU1.0 board
Date: Thu, 30 Oct 2025 19:40:07 +0800
Message-ID: <20251030114007.302401-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
References: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a34eb076a09cckunmfa5af3e9529ec2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQh1LVh9OSUxIQk8dTBhJSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gPnL0vVagk/5UFB+p/JNDJiKvhJ1wzpnY2+li5CQGpu3IxOchi4ILmP6HFrfxtGcPUFVGo5jn+Yw1c8MBi91Eu9I58aflsvqzcGqDubg4L/XHPJDr0ScMhhjnrXt9mzgaS04BHNzH9DYufY2VDhci19hGulxYzMkSuhHlTu0SDo=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=faQlt4wzpzeq/vBlzcvlciv94cb4w4oobEarKxLngy4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_044021_616827_427D6A3B 
X-CRM114-Status: UNSURE (   4.72  )
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

Hi Krzysztof,

Gentle ping on this series. It's been two weeks since v5 was posted.

This version addresses the DTS coding style and property ordering issues
from our previous discussion [1]. Following Arnd's suggestion [2], the MMC
patches have been removed and will be submitted separately.

Patch 2/6 (arm bindings) already has your Reviewed-by. The remaining
patches (Kconfig, DTS, defconfig, and MAINTAINERS) are ready for review
when you have time.

Series: https://lore.kernel.org/lkml/20251016120558.2390960-1-yangzh0906@thundersoft.com/

[1] https://lore.kernel.org/lkml/179f19c0-d9fc-4efb-bc78-8dc1e7505b13@kernel.org/
[2] https://lore.kernel.org/lkml/09b1318e-21dc-4354-8733-866b70696295@app.fastmail.com/

Thanks,
Albert


