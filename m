Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCAEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 12:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3/qjrfLtWYJDebvoDnNBB0jTi3XIrdnZ0O+aHW2BIM=; b=uSAfC9pWxvUPjEMYRgj//ugrzM
	IZ09wa1dZ8u8EfKZJTygqvA8EI3+j6Wkmr4ZJw+C5nL9M3vU+GyT+h6xdUCIO6lf6aq7FI2IgZTpB
	D1Kg/ZQYv8U3RdZ5GbnHdFtgKP4jLBoEu+sAY9p19S1HTWtxXxSZJs9JuYyAflCixpC15Gt6cVw8P
	TdErvRQPl90lll2cwROrF9/TF3LAPlQWxUh+2PqaiP+bdEe0bA2Q1Unxs/0XbeVLUC4olZuRzuB7p
	0EjVSJeVHXRuMTCcaDjY2LnZZu7j8DtzSv32yTUGL5FY7lwQ7gUpKUgq+xVSgPLmnErYcn2mgDWCN
	+E2GXuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toM6F-0000000Dvfh-1PW8;
	Sat, 01 Mar 2025 12:37:47 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toM4g-0000000DvZk-1t7Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 12:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=P3/qjrfLtWYJDebvoDnNBB0jTi3XIrdnZ0O+aHW2BIM=; b=f/ye+d10lC3QiYvG
	pHW+c2INfQEuEYy1KkYauJBXMemdAujPqVC2eLg3iSKWj7XTsI+cNoLpTAYkJ+3RmUhZGIRIIM929
	K6GXPQ/Ls+1Lg994KqWr2jaxKvAZvstaMENOdvBCSlzmq7zyFi8KAdm3VZULsPfd/dAZnmqh8pERt
	DWYhubypGNXQIgSwx+q2uVk1/s9+0fgnJEhoG9m2iMbzVd4V54SlWxwIgz+GBniDhJtcaKUVrKOJ/
	pHu9Rm80WS2FJVeZkZEU9c7n+6TC4FK5WSKA4k4uZC1hmiTMaNddm87x++XfqJKK6nmsIMeG2EQFv
	FYdB29KiD8dOQXYUIg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1toM4S-001pv8-2I;
	Sat, 01 Mar 2025 12:35:56 +0000
Date: Sat, 1 Mar 2025 12:35:56 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
	deller@gmx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Message-ID: <Z8L_LOkOfRXUAKN6@gallifrey>
References: <20241226022752.219399-1-linux@treblig.org>
 <174082343297.2941786.11452976094065423321.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <174082343297.2941786.11452976094065423321.b4-ty@linaro.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 12:35:40 up 296 days, 23:49,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_043610_482702_6E167D43 
X-CRM114-Status: GOOD (  11.81  )
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

* Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> On Thu, 26 Dec 2024 02:27:45 +0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > Hi,
> >   This set removes a bunch of functions in ipu-v3 that
> > have been unused for a long time (since 2012-2017).
> > 
> >   No changes to functions are made, just full deletions.
> > 
> > [...]
> 
> Applied to drm-misc-next, thanks!

Thanks!

Dave

> [1/7] gpu: ipu-v3: ipu-ic: Remove unused ipu_ic_task_graphics_init
>       commit: 16e3bf497fb2d379f3d461fa0c85d14de0a3d183
> [2/7] gpu: ipu-v3: Remove unused ipu_rot_mode_to_degrees
>       commit: a52ba18c254c0a3819e632e6371554f1c6f5bd16
> [3/7] gpu: ipu-v3: Remove unused ipu_idmac_channel_busy
>       commit: 4f9c64e95c3510f4a5192bd401de5611c1dd5637
> [4/7] gpu: ipu-v3: Remove unused ipu_image_convert_* functions
>       commit: 96e9d754b35e87a5be2de7dce3c810ffdd769c84
> [5/7] gpu: ipu-v3: Remove unused ipu_vdi_unsetup
>       commit: 27985c86e283e1e5ac8a9809f189f03643a6f5f2
> [6/7] gpu: ipu-v3: ipu-csi: Remove unused functions
>       commit: c687c3147d5de801ed835b077802b68fe85d8a3d
> [7/7] gpu: ipu-v3 ipu-cpmem: Remove unused functions
>       commit: 2800028d5bdee8e9a3cda2fec782dadc32225d8d
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

