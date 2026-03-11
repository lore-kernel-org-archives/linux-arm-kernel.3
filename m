Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176E21062894
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuV8/K5C++mzUYvNA1S2vTluDHNaoNVD6DZUg5NvuOY=; b=wRYfAx3UOZPr2rLWOKgPf8x4+R
	hu+jzNZiefl5UhYKvYNUYH75FT107A563pYUdIWAe7PNELIcFnRXdRT8y8aujk94oKsq2esk/cSdx
	lFbeMaJPgrwCExAkBeVm5ESBShYWtTIhB0fQkfa53RdIBgH0QQzRp+uqzdCruV3DVzIbeWoCuP1Vc
	Grd2ROO5p4OoPRblUnOA06Ub9f/ItzNEQWjrBlmYooAo8aD1H+uSjBXzBhVXy9dQDgOr1dBxyijPY
	BbfK3BFf1hldPjshR8IbbGzqX/wkTQepcUdV67zoMToW6h71HuqKFqvCh+y4DWyne3PbOnH1PFaoM
	zjhpYuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J3j-0000000BbC7-1Z4B;
	Wed, 11 Mar 2026 12:53:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J3h-0000000BbC0-3WRL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:53:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB85960122;
	Wed, 11 Mar 2026 12:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2E8C4CEF7;
	Wed, 11 Mar 2026 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773233584;
	bh=pvTPwUETRgoaK2FYBnK3TRkvTzw8K62R4/XYbZAjHLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryr9cbb7ve9YMPMrvLP3BAvTRE9krLN3poqx1YUPjtaZH3anOyvrYuyu7OGsZZ6Wh
	 jrRCw63Nmc71hW7PwmHPlfdmAMCffYTP7cedDdrliyUxMJxpjvbjpQ3BAH33GPPeyz
	 8fPCTyKE1E9wmfrQXLCj1wFzFlfgICFSPBM840dvj5A5kjFgFWpl9Ik3qXOK9qo0Uc
	 NeHBUNA5YB04I0ygQhhRY2wswKS3xrHpAcPABKEkk3sQXQrC+Ripg/SlY0DxExNBql
	 g2EoOkXHdv67rh6hhn7ItoC0t+GRy+oeWM3BxOQgHToKwOiZhd4rQDTnc6QBF9J/vl
	 pMx5hK2xtr/bw==
Date: Wed, 11 Mar 2026 18:22:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v12 04/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Message-ID: <mf3nlrbu3h2iage5nd2tydhcruf3es7bs5e6ozv5udpymyci3v@dgcn5tgo3p3a>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <20260310-qcom-qce-cmd-descr-v12-4-398f37f26ef0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-4-398f37f26ef0@oss.qualcomm.com>
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

On Tue, Mar 10, 2026 at 04:44:18PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the device match data with a flag indicating whether the IP
> supports the BAM lock/unlock feature. Set it to true on BAM IP versions
> 1.4.0 and above.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Nit: I'd move setting 'pipe_lock_supported = true' part after next patch so that
the order becomes, add pipe lock support in the driver and enable it for the
supported versions.

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

