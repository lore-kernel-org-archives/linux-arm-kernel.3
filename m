Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B6CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 21:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIz0f8EnCQM7swgmS4MIO3I75a1gnv87ZKiZGhRpchk=; b=qtpnYvFs7SezO2b/FXYIQCwODb
	L2mnaXIrhNIfWNzD6LMwjtfgDZIFSE9pFAR/5jCk/552cTvKyJRuNbvqkdcohjw4NMHuAYrSFMgvh
	YKPJIjNtfDAtbM8iyAK+4b6KnRBB76oY99CQbct1RmMYOpY5sPgUihEBAqnJGqJbrAjjFteTkTZ67
	vMyoxGMabp0xtCQO8CLRrIqsBFGM5mhrhkv1TaevY5LCEuGL91AU/Wf3wWIKikEsLN61fA8bciI8F
	TJx31qxhmw/uwQmcsCYl1Q9tW7PiSrkEaARa6a1mniGGfuMFtHpqnsKntx3O2nOVm3w8rKjNM8wEY
	KX/h7bUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwnk-0000000DOGl-09Vh;
	Sun, 28 Jun 2026 21:12:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwng-0000000DOGF-2VIE;
	Sun, 28 Jun 2026 21:12:26 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8302BB5;
	Sun, 28 Jun 2026 23:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782681097;
	bh=ESaXuL2QWFgndDHnEoKtcINNlsoWDBoTexSj6ML/vgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNMY3QGK6ZP5FUt4gNS3ai/PAji+4L+mqZHtclVDJKSby8BBNJIMZm4aYYtGZ+P3Q
	 XRO6s54z5MKB8miynknMXF9J+m9poyGs94q0yk60Z9rzxjIpsZCtjGJ5rsrCpzpYp8
	 AEiz03cdXRhC5ZHU/jxpO3vN/bKI1eSnhlDXDfLs=
Date: Mon, 29 Jun 2026 00:12:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: tomi.valkeinen@ideasonboard.com, vkoul@kernel.org, michal.simek@amd.com,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Add Radhey Shyam Pandey as ZynqMP PHY
 maintainer
Message-ID: <20260628211218.GA2943795@killaraus.ideasonboard.com>
References: <20260627162233.2803425-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260627162233.2803425-1-radhey.shyam.pandey@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_141225_083407_BBEA4FB3 
X-CRM114-Status: GOOD (  12.58  )
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

On Sat, Jun 27, 2026 at 09:52:33PM +0530, Radhey Shyam Pandey wrote:
> I am maintaining phy-zynqmp driver in xilinx tree and would like to
> maintain it in the mainline kernel as well. Hence adding myself as a
> maintainer.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Thank you for volunteering.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1705eb823dd0..90dd86437c5c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29645,6 +29645,7 @@ F:	drivers/edac/zynqmp_edac.c
>  
>  XILINX ZYNQMP PSGTR PHY DRIVER
>  M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +M:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Supported
>  T:	git https://github.com/Xilinx/linux-xlnx.git
> 
> base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43

-- 
Regards,

Laurent Pinchart

