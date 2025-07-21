Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32343C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 02:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mu+psXm4a8pHTFufZrsupRhFrPOuAN9lxwXRU+6O3+s=; b=nlrvVMN161osTai4CwZco9GAul
	G4+w/TG89DGGCGc6VusvVI8F//IZ67XzPQ2EXyfzq7m0x5dXKKETBJNXZfE3F7oUR5RhKGqqSb1Lr
	VNeOHHFb9/3o+h7aQo+P0AWvwB1QCv/uGb8WLnOiZzUw4AT0nK80l4GLAJKvWxvXMs/TD5QoWmHnW
	ClyjKZh+AU+B5SXWT2aUHU7irDV/vsdurRLf+P/NQycITBIv/brEufBmCBB7ZhVpvHGVPIKkYXYpS
	wpbSzyEWUksfNxskaqnbt1Pg27YjZQACppYMS3GY0rif23tMvSGNSAzxcd37vt9gHC0mOhXPIvIdv
	4A95NCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgEq-0000000Fzfk-2vth;
	Mon, 21 Jul 2025 02:26:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgCQ-0000000FzFa-0MkM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 02:24:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3D46A527B9;
	Mon, 21 Jul 2025 02:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DF1C4CEE7;
	Mon, 21 Jul 2025 02:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753064655;
	bh=Ey6VShtfZEI9G10TSvqYxJSr1SHPPAJkj0cWVnFBhY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uP2Kb3kEMoxEK+Y94nnm1CQ6pjPH0emUGltasa7oGvg0BiC3LNNn+JD2A93+C95Ve
	 nM3K7P29BMxKp2cHfpLe6DZGkW5STaxcW9V9/pLFkoac6EG1fhzNmd0HmMhI5Ru9Og
	 JOrdXtBMk6HB+6KkbtBKVhM2GDOo6HzNDmHf8D7oxMeI93E+HQeg7JmqG9t5zMpn4u
	 jCWsKnr/i8HNxHSdRUAmCXUaqx1Ao+iHC7AnWZH3BVkJ8/yvq/Kgjwpykw9voXKlPa
	 ynk0WKITPYItow0lwdTq5SQaFa0lZVypLkhwKiKszink4Sle5JLdNLPQqd+xAnCewo
	 mFyw5MvQNccvA==
Date: Mon, 21 Jul 2025 10:24:10 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Xu Yang <xu.yang_2@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: chipidea: imx: Add a missing blank line
Message-ID: <20250721022410.GA299578@nchen-desktop>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
 <36d1c961-319e-4457-bdc1-69f8b6bed33e@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36d1c961-319e-4457-bdc1-69f8b6bed33e@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_192418_191446_5E1788E4 
X-CRM114-Status: GOOD (  14.90  )
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

On 25-07-16 17:46:26, Dan Carpenter wrote:
> Fix a checkpatch warning:
> CHECK: Please use a blank line after function/struct/union/enum declarations
> 
> Reported-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 0b8b980409bc..3d20c5e76c6a 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -1118,6 +1118,7 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
>  	else
>  		return 0;
>  }
> +
>  static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)
>  {
>  	return 1;
> -- 
> 2.47.2
> 

-- 

Best regards,
Peter

