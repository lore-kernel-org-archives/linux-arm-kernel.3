Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EB8CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOQaM4cvAE5UnPx8CcCrUCIg+9KFXbBy462/uQ6g8D8=; b=MSJT2n7Fo2ugGbZ3mZiRvmQ+ks
	PW7UcwePkPlpm4StcBxZxngkvvDOyTRVlZnFcOM4uss6p+vRn+i6cWaZphToR8gehFTBmKGeHtslZ
	bN4Kj68dnOUtL3OUvn3CGVTrt8Swml1RE8fC/x2Qvjg4h/39b8RaaN2l5v57nNs3D61ye1263Svfh
	7AB9kAJYmFxVp7CvgbEeeSOefXE1lkEa3DLQfUNMW8XkFva2bPM5NlvMk7s6RpGJ2KG9Hg2RW+m+d
	2eOF9edXQLJbeT6fKJZlxjKUumJqZ0uVmCjxcCc9/5DyM/46r0lgMy9yCfWW9IpTprkkhigBtBtd3
	Sd4eeBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby2a-000000063ms-0QlD;
	Tue, 23 Jun 2026 10:07:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby2W-000000063mQ-1g13
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 10:07:34 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wby2D-0002tm-Be; Tue, 23 Jun 2026 12:07:13 +0200
Message-ID: <39a5d53d-2eb9-4f72-aca9-95def11edf25@pengutronix.de>
Date: Tue, 23 Jun 2026 12:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260623100554.735080-1-ben.dooks@codethink.co.uk>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20260623100554.735080-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_030732_468588_3386276A 
X-CRM114-Status: GOOD (  22.63  )
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



On 6/23/26 12:05 PM, Ben Dooks wrote:
> The dwc3_imx_glue_ops is not used outside this file, and technically this
> is the dwc3-imx8mp driver so whilst making this static to avoid the
> following warning, rename it dwc3_imx8mp_glue_ops to distinguish it from
> the other driver which also has dwc3_imx_glue_ops.
> 
> Fixes:
> drivers/usb/dwc3/dwc3-imx8mp.c:176:22: warning: symbol 'dwc3_imx_glue_ops' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 1cf96540b66e..bc61a89b66b1 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
>  		pm_runtime_use_autosuspend(dwc->dev);
>  }
>  
> -struct dwc3_glue_ops dwc3_imx_glue_ops = {
> -	.pre_set_role   = dwc3_imx_pre_set_role,
> +statc struct dwc3_glue_ops dwc3_imx8mp_glue_ops = {

Typo


> +	.pre_set_role   = dwc3_imx8mp_pre_set_role,
>  };
>  
>  static int dwc3_imx8mp_probe(struct platform_device *pdev)
> @@ -266,7 +266,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  		goto put_dwc3;
>  	}
>  
> -	dwc3->glue_ops = &dwc3_imx_glue_ops;
> +	dwc3->glue_ops = &dwc3_imx8mp_glue_ops;
>  
>  	if (dwc3->dr_mode == USB_DR_MODE_HOST)
>  		pm_runtime_dont_use_autosuspend(dwc3->dev);

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


