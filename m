Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67899EC01A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Gs2RZLpHT3ifgXXfVmwMH7ojJK01k7KkJ79Z9saNdI=; b=upql1fgPz8KqhbscDR6OhhvZ/L
	dv5mrbm2c0yXwpNCKGulg7h/OFgxxHBQ/vzanR6XQ2AbxBumcNlC4gj/txy9UEydU47FBJnJbIbHk
	jrnn9TdIGnXUZRsB76Pkr1V6PWUpaKf48g39uc9utCs04cypUiEDR/Ti+0mYB2HfwBO0UwKoVvX6/
	X8/Vj3+kNBzdS88oFg7NN/MuLauPx65k+rem/Qa1BkFyUo9kiVjrUFgJ+fVqWesd9I8rGMDVrkuCG
	iNMRjWM9LFf2InTPpLrxE7uAmsX/wtfCcS2cIT0K6HE7VYmvKSBtwwryK05JuNbULkSNlmNsAYJOM
	/iX3vd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bBs-0000000GKLC-17Q1;
	Mon, 23 Mar 2026 09:03:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bBn-0000000GKJQ-2WFs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B971F404E8;
	Mon, 23 Mar 2026 09:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02A9C2BC9E;
	Mon, 23 Mar 2026 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774256588;
	bh=IEWz/yDGTqNpb9yF4r5qDEyb/sGLpVM6hsRHTY8svVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EYrZFK5sh4eEIon27+KRCuxRRlO+nCshQb3BJJSDa057fK9I2qx5BaZzEAnJPsDXD
	 OWtaco5xO42HLCMofsfuJI0VUvPfv82XiE4HbrrkqGxbdKQQoepzxUmM2iiVTEr6qR
	 NMDuAFoKsJBNsh/k9uOQ3VpSiYkNctpMtKQzu5b/eCBnB3qylq4ryKQRyCeUsipsft
	 SIsrvYMfmsPGADl3ITVarsrX6obTFGU1W+FOrV83mEyFeXPKm9dlO5uak6vi4diqoG
	 UBMdzDRq7xV9WdeV900A+cP+XDNj1+miTSeg/4E2epFIeO84bXq5Q30Ps9LvSUXXfa
	 ZsoO7G/XnXFpA==
Date: Mon, 23 Mar 2026 14:32:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v13 04/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Message-ID: <ak4ktv4qjmjkiodahqees46gmyt3yabbd3r5f7kcf3ufq3oikm@yirezure7rlh>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
 <20260317-qcom-qce-cmd-descr-v13-4-0968eb4f8c40@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-4-0968eb4f8c40@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_020311_686584_275EDBEB 
X-CRM114-Status: GOOD (  17.62  )
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

On Tue, Mar 17, 2026 at 03:02:11PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the device match data with a flag indicating whether the IP
> supports the BAM lock/unlock feature. Set it to true on BAM IP versions
> 1.4.0 and above.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/dma/qcom/bam_dma.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 8f6d03f6c673b57ed13aeca6c8331c71596d077b..83491e7c2f17d8c9d12a1a055baea7e3a0a75a53 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -115,6 +115,7 @@ struct reg_offset_data {
>  
>  struct bam_device_data {
>  	const struct reg_offset_data *reg_info;
> +	bool pipe_lock_supported;
>  };
>  
>  static const struct reg_offset_data bam_v1_3_reg_info[] = {
> @@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
>  
>  static const struct bam_device_data bam_v1_4_data = {
>  	.reg_info = bam_v1_4_reg_info,
> +	.pipe_lock_supported = true,
>  };
>  
>  static const struct reg_offset_data bam_v1_7_reg_info[] = {
> @@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
>  
>  static const struct bam_device_data bam_v1_7_data = {
>  	.reg_info = bam_v1_7_reg_info,
> +	.pipe_lock_supported = true,
>  };
>  
>  /* BAM CTRL */
> 
> -- 
> 2.47.3
> 

-- 
மணிவண்ணன் சதாசிவம்

