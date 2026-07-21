Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23C2C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NzLnpEpcxO5DD6T26b2jUHl7f+urYYWu7UR8jPYSDY=; b=JOF2Oix6LDMyJZkoKzCj64T6cv
	ke8Hawx+iXPWPO0xxO8E12E48ZC6bt2dlJlkFWAGdmM1o8h3T/3LWnPvgqqSlbyF8ES1IVPGI5J7Y
	wjL+riu/jDzP3oF+Ov8s+ZpIn5S+VXH4gnay01WTSC27xSvp8Mx61FjSuPA/1Ky63VeJQg5MjSBsc
	Mnoo1hW9ESlH8UqxSQgMyW96BSLuciez43nu988fFg3iPWnbgjGmiaUeaAjjYLoSK9xbI5n/C3Qfq
	yEmmVzMMmoAMdIJKKLP9bjT1S3qkyP3hbu+CYKAebiHxVod0JPUTXrBmICrBglXdMXWnqPZKF4Ugx
	zaK2rhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCB8-00000009lyj-2u4G;
	Tue, 21 Jul 2026 15:14:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCB5-00000009lxC-1Eqk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 15:14:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ceaf8a1265so113919565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784646878; x=1785251678; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0NzLnpEpcxO5DD6T26b2jUHl7f+urYYWu7UR8jPYSDY=;
        b=pfCJH8QlFGyPPe43LKztV475MjDqcMA7209/t/3LtJmr6S3/5YcQVR7t77fkcq5nKF
         fnmL13xunNJIDVI97sGMTQcWhCP0FqSUzmRq3VSKuAo0SlO4FiYtQabIZpZ9X+KF3NcV
         pszEILtD75+pnVuutZREhFPM0O4hWUweqIEf05esjSUYdbMeUPSshSRL0oqph9kDcWR2
         e/WBdvRUQJ/We1SD1wyIyzcFdlrKcdsNhyqtzm48oWRrk909cY9vfICHdYH/YV6nNmLF
         jFdmz5T9vz/vN7DAkZN0qTt00SuV39/3VQJKEGeMNbI7Jgew/Ty9Tkr/TI6WAAdeBeZK
         bAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646878; x=1785251678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0NzLnpEpcxO5DD6T26b2jUHl7f+urYYWu7UR8jPYSDY=;
        b=ewC1lhZrvaCaOYm1yiJuvCfCiqUw7QEtXlCMei+VSBX3Bfcvw9ETg9Ik2OhGQV/sVC
         6d1C5LxFI/sdQGQtN9hC7R1aHJ1BI6KhyXRll8cV0tQt4DqGb8eXpYd8KcG1RWVqyu5i
         iSty7KXGQgC0Rjp9PoBn4iMHYSW1DbSfxHLijOUflN668/tYODEDbygsseRpaEvs6LRm
         SzwZ/NEH41XyYHQCmjN/ZsB1SuMMPiR7p35WleG/sPZXBNDuTONhwgNHGAsEgiyzq0P9
         wNV4AI/acIBW0jRmsNhWCGlxc2ff89dEpce24k6T+zGI2K+uPdL7pYUIWPYEHIm3FnKV
         GuqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4ODbfVZ2WwBX7Ng7nBqqPe9RgQX2MFFLijzHX3L4oCWXsvMMftahmfz0+RKipv0Ji3ZHvyV60vhOfIy/C3dF5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9yJK44QnZstLCEOAyzbC2+Sr3grNxtO0w+OIQyyPrJxT9oU3b
	gGij3+XI/vp/SthkRCn3l1ioFSmPDVxAzAyUVoCLyZLuswjIF+2cdi5lX9uOwujmwak=
X-Gm-Gg: AR+sD11oXPgwX3wZIPiMeJLWU97dNmEP4Fxr5e5Xsn0Mtte1NMKyMW0zmaSQsiTE4WF
	4SUVJQw4HLFnx/sN8OiZZ2/s2H1AigCls5Au7TujFhPhIusRggFQiP608V5TczyPWeOR6J9zGzj
	VN/CxARaF+1CS6FsKaxJXjTuw73zPl02FpqP3NmK+goc3R2jgjKHBj/YKkckEoSbMdRIBNv7Dp3
	CNYCD0ArEmS612s8AJxxsOLpzVgFQfKY4NEfDjmfkDG03F7Z5zLFZKtzIY/no7SSojKDK+LTOmi
	cGionVNcbJGAz2BBwMBFQJnQh1+mZGboKkwtxWO1EAyoBwdDLP1NntpFIDPwfmRvMS/pYHlSH77
	SBBhntV9LSMk039QKz7aL931EcgQ+5IxqaP5WdzQVRQ0IzPP2vPRpPw+ynpv9EkcvEF0fuy6rpc
	mStn0MDA==
X-Received: by 2002:a17:902:f681:b0:2c9:a9c0:80b6 with SMTP id d9443c01a7336-2cf34a48e5dmr210192335ad.34.1784646878053;
        Tue, 21 Jul 2026 08:14:38 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d5fc:59b3:7d06:7bd9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ef6asm78278065ad.9.2026.07.21.08.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:14:37 -0700 (PDT)
Date: Tue, 21 Jul 2026 09:14:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 REPOST] remoteproc: imx_rproc: Invoke the callback
 directly
Message-ID: <al-M2xoMM9P_DKK_@p14s>
References: <20260721-imx_mbox_rproc-v5-1-6386a2cf8524@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-imx_mbox_rproc-v5-1-6386a2cf8524@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_081439_359879_32B66B60 
X-CRM114-Status: GOOD (  33.93  )
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

On Tue, Jul 21, 2026 at 04:09:06PM +0200, Sebastian Andrzej Siewior wrote:
> The imx-mailbox driver moved the callback invocation into the threaded
> IRQ handler. This means the callback is invoked in preemptible context
> and there is no need to schedule the kworker for the
> imx_rproc_notified_idr_cb() invocation.
> 
> This was tested with the rpmsg-tty driver on imx93.
> 
> Remove the workqueue handling and invoke the imx_rproc_notified_idr_cb()
> callback directly.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Jassi - can you pick this up?

> ---
> This change was tested on a im93 board with rpmsg-tty driver.
> 
> v4…v5: https://lore.kernel.org/all/20260703-imx_mbox_rproc-v4-1-67b10560a861@linutronix.de/
>   - Repost
>
> v3…v4: https://lore.kernel.org/r/20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de
>   - The mailbox bits are part of v7.2-rc1. This is just a repost of the
>     imx_rproc driver which is left.
>    
> v2…v3: https://lore.kernel.org/r/20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de
>   - Forward the error in imx_mu_generic_tx() to the caller (new patch
>     #1)
>   - Extend the patch description a bit for for "Start splitting the IRQ
>     handler" to briefly explain why callbacks are moved to the threaded
>     handler.
>   - Drop imx_mu_con_priv::pending. The primary handler wakes its
>     threaded handler. Once the handler is woken, the pending flag must
>     be set and there is no need to set/ clear it.
>   - Avoid the double clk_disable_unprepare() if
>     devm_mbox_controller_register() fails.
> 
> v1…v2: https://lore.kernel.org/r/20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de
>   - Using correct register to enable RXDB event.
>   - Update commit description for the "threaded interrupt", "unmasks the
>     interrupt" => "masks the interrupt event".
>   - Add a shutdown field so that the interrupt does not unmask the
>     interrupt if it has been already disabled because the channel is
>     about to be shutdown.  A possible race mentioned by sashiko.
>   - Use devm_pm_runtime_enable(). This should avoid a possible race
>     sashiko mentioned.
>   - Use devm_of_platform_populate().
> ---
>  drivers/remoteproc/imx_rproc.c | 33 +--------------------------------
>  1 file changed, 1 insertion(+), 32 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7662ebd9d2f49..e18ae33a5cf85 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -24,7 +24,6 @@
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
>  #include <linux/scmi_imx_protocol.h>
> -#include <linux/workqueue.h>
>  
>  #include "imx_rproc.h"
>  #include "remoteproc_internal.h"
> @@ -115,8 +114,6 @@ struct imx_rproc {
>  	struct mbox_client		cl;
>  	struct mbox_chan		*tx_ch;
>  	struct mbox_chan		*rx_ch;
> -	struct work_struct		rproc_work;
> -	struct workqueue_struct		*workqueue;
>  	void __iomem			*rsc_table;
>  	struct imx_sc_ipc		*ipc_handle;
>  	struct notifier_block		rproc_nb;
> @@ -892,21 +889,11 @@ static int imx_rproc_notified_idr_cb(int id, void *ptr, void *data)
>  	return 0;
>  }
>  
> -static void imx_rproc_vq_work(struct work_struct *work)
> -{
> -	struct imx_rproc *priv = container_of(work, struct imx_rproc,
> -					      rproc_work);
> -	struct rproc *rproc = priv->rproc;
> -
> -	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
> -}
> -
>  static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
>  {
>  	struct rproc *rproc = dev_get_drvdata(cl->dev);
> -	struct imx_rproc *priv = rproc->priv;
>  
> -	queue_work(priv->workqueue, &priv->rproc_work);
> +	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
>  }
>  
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
> @@ -1271,13 +1258,6 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>  
> -static void imx_rproc_destroy_workqueue(void *data)
> -{
> -	struct workqueue_struct *workqueue = data;
> -
> -	destroy_workqueue(workqueue);
> -}
> -
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1305,17 +1285,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		priv->ops = dcfg->ops;
>  
>  	dev_set_drvdata(dev, rproc);
> -	priv->workqueue = create_workqueue(dev_name(dev));
> -	if (!priv->workqueue) {
> -		dev_err(dev, "cannot create workqueue\n");
> -		return -ENOMEM;
> -	}
> -
> -	ret = devm_add_action_or_reset(dev, imx_rproc_destroy_workqueue, priv->workqueue);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to add devm destroy workqueue action\n");
> -
> -	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
>  
>  	ret = imx_rproc_xtr_mbox_init(rproc, true);
>  	if (ret)
> 
> ---
> base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
> change-id: 20260529-imx_mbox_rproc-7d512f5a6f78
> 
> Best regards,
> -- 
> Sebastian Andrzej Siewior <bigeasy@linutronix.de>

