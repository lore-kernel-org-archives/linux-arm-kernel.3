Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D62C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X93/neFWkuUL/xy0r997S7zxdoD3uLflWBVwgmhbDa4=; b=qDJOqZiWw6KDAuaK3J0eF1sL8I
	pqDHtGau/06ck4EATD8RyWcO22qchUg/YqHNPmvttQ4IFDEQgBmPf0P9Gtlc8MxYA8nKndLrMGMO7
	Z7Ln98ESD4L57+m6OuyRVTxcWiU/F5sX3fc14dSa8XoFiJEszCL3bnbJ8S1XagAq75rPna6gKfY68
	uToGl7lC7IslNY3GSOdXLfvH3kp/wnhwzViKy/OlRW/h53LrmO2RaWfNfxkSHf1uVihvlMNPQyyWX
	Ly8Dvum1rGi8UyfalKUNScvFys9dzWYU/3L+XxLzMmQ/2eMyu17HZer/9vLF7u/U8ZGGd3Q+tPBCW
	uX1rKprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlM3-0000000BVIw-2tDi;
	Thu, 26 Jun 2025 12:05:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkZb-0000000BMsO-3fO6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 11:15:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AF781758;
	Thu, 26 Jun 2025 04:15:01 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF9713F63F;
	Thu, 26 Jun 2025 04:15:17 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:15:15 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add xfer_inflight counter
Message-ID: <aF0rw1D6QXGrCdmU@pluto>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-3-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-3-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_041519_951579_3F331AB8 
X-CRM114-Status: UNSURE (   7.19  )
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

On Thu, Jun 19, 2025 at 12:20:02PM +0000, Philip Radford wrote:
> Added an xfer_inflight counter to the debug_counters struct
> to record the current number of inflight xfers
> 
Hi,

nitpick around the commite message.

Add a counter to the debug_counters struct to record the current number
of outstanding inflight xfers.

...note also the full-stop :P

With this:

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

