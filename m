Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796C7C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R1kkmooatXPBMzictkwlIDbcsIe5z1f370eafMweyI=; b=t2oF/rvo8hFDqj0wlvHd8QAnr4
	2blSQ4FQotplEI7lmS9JO4R94S8cL+4SsFTwoIU+aV+5wMxUixGArf4Jx9SZsCKe2yNSKaqgnw9DM
	f/J/FZPbtbCBoHwfC65FVcGSyOrT9peVXzaCXxXVPsGL09DN5ttPGFpPjRyozL7AeQViq/XnmlWIF
	O0VpmR2WDtTDEvAwoD45aEDCxydv53nY5933KrJT2Pxzp0I5aCF+Hp2ht9+Jicm66vlLJ1XGrJILn
	d6RXBFdE1wzwPnNA5wNzOFjy4jMuKXPwEjz89AGpeB0UJBxQ5lCBtzMx6DDauQzTCO+6ampzwm/y/
	dgV30IzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlJk-0000000BUnc-3mfW;
	Thu, 26 Jun 2025 12:03:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkVW-0000000BMiE-2UVF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 11:11:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC8C51063;
	Thu, 26 Jun 2025 04:10:47 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F1673F63F;
	Thu, 26 Jun 2025 04:11:04 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:10:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 1/4] firmware: arm_scmi: Add debug decrement counter
Message-ID: <aF0qwawoMKBCH-Ux@pluto>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-2-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-2-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_041106_666381_A6048E1E 
X-CRM114-Status: UNSURE (   6.18  )
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

On Thu, Jun 19, 2025 at 12:20:01PM +0000, Philip Radford wrote:
> Create scmi_dec_count function to decrease any of the Arm SCMI
> debug counters
> 

I agree on Dan's comment, other than that, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

