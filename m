Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34EAC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzjgdiXNQn2lVM94vvC1YOjh1DnAuEwZM6OUPbLdXjw=; b=yVsCyjA14AKrxpYqxFNBazYAf8
	dUOSbQcKGZUnNGQyv1xnZ5GqQXH5vF7ykkKpc2mxDtFhcrMrv21h/Ktu971UA8TQDXPrJ81Dn+VF0
	eF2RGuMslvRI46qkV/9w/1uoqJ2XHvC5jDtDzlA0lOVbUbHDPx3B3ioYsF/KnC8SkOcwf3eZqgeYv
	qYf6fIX+yV1Vye/pTxPcnBiNdKY8+lk6WHxTckDW1uE30cwaNur0x813OUke0xFq0RyiJQkmz1Nhl
	8cbrYtDvB28X2FY5rKePTpY+0hJkKVKTM8qh8gV2Dz0l3haFQxSYnHhWbhLcOvk4ZNdzCjjgm03j5
	aJ/u98Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2mn-0000000Ba5y-2kuG;
	Fri, 28 Feb 2025 16:00:25 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to2VO-0000000BVoY-3BlX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=QzjgdiXNQn2lVM94vvC1YOjh1DnAuEwZM6OUPbLdXjw=; b=JLtXwvZY9rod+vN/
	6zix4+Vc9e0yIA9MhNtdoGNIHovyFlBBn8P4lF9sMuFQ9qVwfCWkNPBpfz15TMrGpY6Vo7/Cezb9L
	ox2oOdEjwzmJTvgPqUezZT6aN9i0pYPsJmEEFp4PsBXl+nudrh8B+fvMxDR792jSBLMOdHLiTFF3L
	DihJk7VwIfSzKhdRAWh8/+U4jT2ywSaj1DsNVTUnNAJ8LCPNJpA8KZc5yXU2vdavYnbbyV1d8G+Cy
	PzWqlc7Qn7IrthdfZqlZbNpXS6rc2FdK6Rjsjr+N/jzMAtGZD91OfXNTsRUED08EwU7q90hbm5zT4
	UxVAQ7K8X2/euUVlxA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1to2VD-001g24-2A;
	Fri, 28 Feb 2025 15:42:15 +0000
Date: Fri, 28 Feb 2025 15:42:15 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, p.zabel@pengutronix.de,
	deller@gmx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Message-ID: <Z8HZV3RuIeTtcd3a@gallifrey>
References: <20241226022752.219399-1-linux@treblig.org>
 <gugwtvw6qqknstlscr4hxfrvcgfa4gfwwgxdosr24mf7huk433@oh7axkbesrjs>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <gugwtvw6qqknstlscr4hxfrvcgfa4gfwwgxdosr24mf7huk433@oh7axkbesrjs>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 15:40:47 up 296 days,  2:54,  1 user,  load average: 0.01, 0.02,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_074226_790379_1C6491B3 
X-CRM114-Status: GOOD (  12.76  )
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

Hi All,

* Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> On Thu, Dec 26, 2024 at 02:27:45AM +0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > Hi,
> >   This set removes a bunch of functions in ipu-v3 that
> > have been unused for a long time (since 2012-2017).
> > 
> >   No changes to functions are made, just full deletions.
> > 
> >   Build tested only.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > 
> 
> 
> For the series:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Could this be picked up for drm please?

Thanks,

Dave

> -- 
> With best wishes
> Dmitry
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

