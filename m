Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7E0C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8TKtX8+1z8+FgOghcUw4tz/UUo1RHZst3BBTMNbWMQ=; b=xzPFruAps/dXEf/voYwwi6He0Y
	/CGSq87XZkMSXv+hVo3WDLemLyX/A/qfgzJXG2P+AuhHa+i6C+sQA8a28hCsllnlNXJzmG0Koqap6
	U669C/i6pgLBi4GuauTDwBUo9s6GI9HMbZxZcGGYzXg2VQJDGvuDRajg62qOXcuxflltGG+4ZviPM
	4th171NMPjMH5gswsvnhQmgbLWc3PGWk9eDoGAbe6jIJnqRkIIsxCqZ25AkjGo5Y4luOc/5IR69un
	qbO2roWhXER3rsP0VIrr3tzZdzUkOHaNYg11GkTd6nvbe73epHyyw8jwoK1B6NGEKmDJ8RRCoIJF1
	tIXthUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlQn-0000000BVyj-0npC;
	Thu, 26 Jun 2025 12:10:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkdB-0000000BNRP-2oGZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 11:19:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50BC21758;
	Thu, 26 Jun 2025 04:18:43 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5C8A3F63F;
	Thu, 26 Jun 2025 04:18:59 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:18:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and trace
Message-ID: <aF0soSDaBE7-1UnA@pluto>
References: <20250619122004.3705976-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-1-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_041901_747160_0EFAB885 
X-CRM114-Status: UNSURE (   5.78  )
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

On Thu, Jun 19, 2025 at 12:20:00PM +0000, Philip Radford wrote:
> Hi all,

Hi,

as mentioned offline, please rebase V2 on sudeep/for-next/scmi/updates
and add proper version diffs summary all-over.

Thanks,
Cristian

