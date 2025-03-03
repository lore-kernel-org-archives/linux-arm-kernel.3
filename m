Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA91C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doPqy6ie4HQRHLzrAudzDUL2D+bKDnURpAm9UOHuPeY=; b=V4p+tkKo8/1a7xGJUkibHZPsLd
	JmzkyhjTePLVwlWVDZOiwn01KGYkTLqv/9CSrbrqS4MJbET34U4Ln21AT0CtT0V2oLEpvpHJ5GhY3
	P19FGxK6n7q4q/toU6ZV+sWYAorfbF7s29TgZJ1Wr0IUjDoidcHOzXQWREzXn7hstIP4eU4rTMdcP
	5d+qcNAG5Q/T7YoSVPXsHh4cX/EGYaidWxS6QqX/tmDzOq6OE1HeWge5FVrIg1lFkPtbyXDp1aTYK
	9jwlJP6vF0+BnzlJB2VHWuNDvYt5X2IqINYLE2Dvr5yPlX0kY7rShXqixLXVn7Rm3T/cgPiz1i6/I
	YlYIX+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6TB-000000011vo-33dk;
	Mon, 03 Mar 2025 14:08:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp63k-00000000xtQ-08Yu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:42:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D8EA61206;
	Mon,  3 Mar 2025 13:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047F0C4CED6;
	Mon,  3 Mar 2025 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741009334;
	bh=+x1M0xAUI4i6rAatwBpVulw/4Yee7AfTm/reCel12kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/3Va+tqsKURLRutURqRLBVl02bfAmE7iHrtGF7WMJiNUwLhJa+bVlcydar2210jE
	 12a3bOgqHwzYuXRPpzirSZzwt7958Ko1HzV4PyIYLNSbCEBZx9ZWlXjqEBeBDKO9h7
	 /0bL6T0JRy6kKjLYJCfsyvMCBomt/xVw2Hr6hPyDSs5q2IsDqyNme1IA2sJ1K8WMRe
	 iNlwaPd4jyh/dlqN3fHgEz5Uxunmv9/xgx2N5fRq9cYUNyD+roSWIbrL0KdyBHqV0A
	 YWH0kSdrL+ZSNX5/jtYSXDAuSrCcWwGCLOJBk8JigpBETC1TsUeKJEIwn8ltiIonLw
	 tL7Mo9HQzQeWA==
Date: Mon, 3 Mar 2025 13:42:09 +0000
From: Simon Horman <horms@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Meghana Malladi <m-malladi@ti.com>, Diogo Ivo <diogo.ivo@siemens.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Add ICSSG FW Stats
Message-ID: <20250303134209.GU1615191@kernel.org>
References: <20250227093712.2130561-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227093712.2130561-1-danishanwar@ti.com>
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

On Thu, Feb 27, 2025 at 03:07:12PM +0530, MD Danish Anwar wrote:
> The ICSSG firmware maintains set of stats called PA_STATS.
> Currently the driver only dumps 4 stats. Add support for dumping more
> stats.
> 
> The offset for different stats are defined as MACROs in icssg_switch_map.h
> file. All the offsets are for Slice0. Slice1 offsets are slice0 + 4.
> The offset calculation is taken care while reading the stats in
> emac_update_hardware_stats().
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

Reviewed-by: Simon Horman <horms@kernel.org>


