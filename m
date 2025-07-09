Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BBEC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 11:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjCkMnWqantp9bBive7K745QUtuY2/IUAwBUIHQ/MQ0=; b=tVKLy/ofXqeKYEEqWIw2tpuiww
	qnqnPY5G01X6z+SSrSVN1+P+bZeukFMMyqxTctV1fcE+37ymosz6BcAHIInH0euasI1x9JeBk4+QH
	OjbBnblDSzjF1jBbhzudQTRfk9j7vCyKGD8LBca+sqaj3lYQzd7GSYT6w0r/oEwPtGwZpzZcEfMnm
	OpH7HgB+te7+t2rU8LaCoymLK+alAgMD/3b9sQbJbqhgQmnfVlJk5OXZlGrcocao3ZYMwKzl6p1uX
	KcdKaaqrtqQYZwB/JegU4uayQU7vpkgwRcgHeSiZWYY1n2ddpW6v9Tb2PbD0NKqeuvB01V/rExGcf
	pn4t90wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTRP-00000008ZDu-32hd;
	Wed, 09 Jul 2025 11:58:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRj5-00000008Fiw-2HaT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:08:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFB6B5C5E0F;
	Wed,  9 Jul 2025 10:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D38C4CEF5;
	Wed,  9 Jul 2025 10:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752055710;
	bh=7s0iUf/zVAXVdlRZKllsduSnRK48iQZQiABy4eBpO/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNCtfE1ZQF+nrMLJ47vu5+q2KzZDiM+HPAYnmlcTkf7bTWI8bAV23b9BWED9PiMGJ
	 0/ujVRENMFPP0tEJ5YNwiK4Q7Qfx1MzX6Ub+px+EwN+NH2zhC56EJxRKmCSbQ9E68y
	 Ux+0Ap5Kjk/gJBUT+YcdOecMPeHUQbqfcKRq5M0IRATpMeiPxV7EJlBWvt0q9C1e9v
	 eVKM9q0ltWo7itHx2PWrEOSL7/fDs3CVIH4VBfMe0A+kVrAC7pmKqloiIalhYOJeCK
	 u8KPuZaw4G6r6Q0V4PZhgtEnDks39Cyk+jSYg5m4VKUJU2KltVrhUf+Lh6W0feNpak
	 sNNEfk2MNSGwg==
Date: Wed, 9 Jul 2025 11:08:26 +0100
From: Simon Horman <horms@kernel.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	darren.kenny@oracle.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: thunderx: Fix format-truncation warning
 in bgx_acpi_match_id()
Message-ID: <20250709100826.GT452973@horms.kernel.org>
References: <20250708175250.2090112-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250708175250.2090112-1-alok.a.tiwari@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_030831_618042_50351F25 
X-CRM114-Status: GOOD (  11.76  )
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

On Tue, Jul 08, 2025 at 10:52:43AM -0700, Alok Tiwari wrote:
> The buffer bgx_sel used in snprintf() was too small to safely hold
> the formatted string "BGX%d" for all valid bgx_id values. This caused
> a -Wformat-truncation warning with Werror enabled during build.
> 
> Increase the buffer size from 5 to 8 and use sizeof(bgx_sel) in
> snprintf() to ensure safety and suppress the warning.
> 
> Build warning:
>   CC      drivers/net/ethernet/cavium/thunder/thunder_bgx.o
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c: In function
> ‘bgx_acpi_match_id’:
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:27: error: ‘%d’
> directive output may be truncated writing between 1 and 3 bytes into a
> region of size 2 [-Werror=format-truncation=]
>     snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
>                              ^~
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:23: note:
> directive argument in the range [0, 255]
>     snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
>                          ^~~~~~~
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:2: note:
> ‘snprintf’ output between 5 and 7 bytes into a destination of size 5
>     snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
> 
> compiler warning due to insufficient snprintf buffer size.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
> v1->v2
> No changes. Targeting for net-next.
> https://lore.kernel.org/all/20250708160957.GQ452973@horms.kernel.org/

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>

