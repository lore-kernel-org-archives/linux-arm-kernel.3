Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FA2CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTFDij8rOfBi4onm0+1H8QKsdfpsAEcT4+wmk4yoEdI=; b=nmJUtiaZ1wkCSFj38ZFU3B0gYQ
	KcK0JKKwM/DSr2oKrMVJIugGiNQm3yPV4UFo2Z3JMGrKivPWQyZ5ZlSdQSPU0iUhRa+0O94cgGn9P
	rLI3Ogd7NYfiXUlYPZ5+FScEMSzIw5d9583guWH0xMypZf2vh9XXOG4IbQrHbs1QJDbTvdSpREYqm
	b0a0P4A6L+2tBXN8Iw0hig8PNe4gBqYHoEypqJ6g95SIuka0/O/3bBUPs1YUujk5LlwyWmB8ttb81
	9s3ep81M0PtW730J8IehSxLquk7lcEMXVh/NPh5zGIfR0xucRVZaKToCIL0tOkkLMIi17kk1iLnQr
	2nHc4ilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiz0-00000006Si1-2IMp;
	Thu, 28 May 2026 22:13:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiyy-00000006Shh-2PIP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:13:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07EEE6020A;
	Thu, 28 May 2026 22:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0831F00A3A;
	Thu, 28 May 2026 22:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006419;
	bh=jTFDij8rOfBi4onm0+1H8QKsdfpsAEcT4+wmk4yoEdI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Qy+Y6kkhrAQA9KzETFwRbfyko7N6FINYJZiKIHhTcXSvJB2CxgGhUZkauOPYbZs2S
	 k7QvnESYLyvAp5noz6mEanflq3hT95oJ7FX7Y+pEItT6SH5YzLDs9YhryreVAsuRTf
	 KHc5qdpz096HaOiuqBnvazYMIM+STLVGzVjwgQOP0LMr9KYL9MvSn9h92NsdokjImD
	 Fo2yJ32Fu7M2OQsihiX+7tLTys+YHY8w41mvVepYkuzchr1ci13Jks86gB/JOXVV36
	 bhR3//bj2P0Pkz0b5UiDt2DiaLoj4eijSlYBnTrW4b98NjkfpFa1XEzFU/pdOHyL2B
	 wWMwPxXZ0ceVg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
From: bod@kernel.org
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, 
 Prashant Shrotriya <pshrotri@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:13:31 +0100
Message-Id: <178000641103.4557.14582699057810501776.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4495; i=bod@kernel.org;
 h=from:subject:message-id; bh=K4B2ABnCbINjELhznQoUmwLcHPZIQBbuZok35L47E3k=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGL4MgmVsUJ9fIpO2FVo+/R+7dyMCz2d4kVRpt
 /D6zzxj+8CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahi+DAAKCRAicTuzoY3I
 OpmJEAC6cGVc5XD7h6kvsDLFRV2F10LaNzQXVBOCfZQgdQexwjr1EAw6mksRkIL2e8kKtzKHyRy
 uBenhK/Y35WLCNN+spRYGYeZ9EpX4iEFM3KY3pE4AOExVCFX5qmpivKb0aWI1mepIzg20ieutGh
 nd9tZfkZig6BNo7dltwK0VgThWqQZGIyDb/14EWkvAfS1x1AbYcvhUr0WMXgx8pzYSS2Fe/6OYK
 onEZIFZC3ZOFkjJNgk7l7qJISxhdzU8ZZm3txnainHA1zci3Yjt08M+PmeSsxYmxNJ/pxDeeJOF
 qFylUWPQJSRtgodOO9WjOciGiCKYcrZGObYyunF1uMZ3qMwpsGnLh1GMobMEerJuf4BKeBj+YOx
 8k6iOTzCeXSX96kUJpTXhcxlAyJNocH94SE6zUqK36Hh+N0PzllF5/1nGBT3kTR015/mWX9iQRO
 fXn/+3Ol8JMlRE5Mws2+5bDjm+oEp3QlC9oag2q36xk12R8DXzmbB+zit/Y2DM9fWLWaShGM5uW
 abuUDbuxs00n+SMYrlPu/+3rVh3xbYpjopDc9BzP6kL1rPsmI4SIr/2yQLQwW0ub1L7tqgOAwmK
 CY0jZYKTWI9kNLEpNa8wZ00CyLttb17r6gEr/HIQjv9iExYXtsjsVUTAQQ2Mho28SxxgTgJgVuc
 CsVBH4VeitIK+Cw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
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

On 2026-05-26 22:42 +0530, Nihal Kumar Gupta wrote:
> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> 
> Add CAMSS driver support for Shikra SoC. Add high level
> resource definitions for 2 CSIPHY, 2 CSID and 2 VFE instances along
> with the interconnect bandwidth votes for AHB, HF and SF MNOC paths.
> 
> Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |  2 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c            |  1 +
>  drivers/media/platform/qcom/camss/camss.c                | 13 +++++++++++++
>  drivers/media/platform/qcom/camss/camss.h                |  1 +
>  4 files changed, 17 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf79957dc05c5524dc439791ce097c785..62208f5c4f17bd6c9a8fe5613649920e6ee1a1f2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1130,6 +1130,7 @@ static bool csiphy_is_gen2(u32 version)
>  
>  	switch (version) {
>  	case CAMSS_2290:
> +	case CAMSS_2390:
>  	case CAMSS_6150:
>  	case CAMSS_6350:
>  	case CAMSS_7280:
> @@ -1222,6 +1223,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>  		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>  		break;
>  	case CAMSS_2290:
> +	case CAMSS_2390:
>  	case CAMSS_6150:
>  		regs->lane_regs = &lane_regs_qcm2290[0];
>  		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 319d191589884777bced456867e5a2a4211a2770..b152f8d48e003d8eeb0cf19ad57419b25cdec087 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>  		break;
>  	case CAMSS_660:
>  	case CAMSS_2290:
> +	case CAMSS_2390:
>  	case CAMSS_6150:
>  	case CAMSS_6350:
>  	case CAMSS_7280:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..f67ecff53f15bd213dc7736d4e5fe880007d1ee7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5565,6 +5565,18 @@ static const struct camss_resources qcm2290_resources = {
>  	.vfe_num = ARRAY_SIZE(vfe_res_2290),
>  };
>  
> +static const struct camss_resources qcm2390_resources = {
> +	.version = CAMSS_2390,
> +	.csiphy_res = csiphy_res_2290,
> +	.csid_res = csid_res_2290,
> +	.vfe_res = vfe_res_2290,
> +	.icc_res = icc_res_2290,
> +	.icc_path_num = ARRAY_SIZE(icc_res_2290),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_2290),
> +	.csid_num = ARRAY_SIZE(csid_res_2290),
> +	.vfe_num = ARRAY_SIZE(vfe_res_2290),
> +};
> +
>  static const struct camss_resources qcs8300_resources = {
>  	.version = CAMSS_8300,
>  	.pd_name = "top",
> @@ -5752,6 +5764,7 @@ static const struct of_device_id camss_dt_match[] = {
>  	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>  	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
>  	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
> +	{ .compatible = "qcom,shikra-camss", .data = &qcm2390_resources },
>  	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
>  	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
>  	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 93d691c8ac63b2a47dbb234856b627d8911a1851..8ba8a38113dfc15849fa333d05b2c3853f3a7714 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -82,6 +82,7 @@ enum pm_domain {
>  enum camss_version {
>  	CAMSS_660,
>  	CAMSS_2290,
> +	CAMSS_2390,
>  	CAMSS_6150,
>  	CAMSS_6350,
>  	CAMSS_7280,
> 
> -- 
> 2.34.1
> 
> 

NAK - what is the point of this identifier ? It literally just adds a new
define and a new string.

Unless there is an actual difference with 2290 which thus far we haven't
see, this new type is not required.

---
bod


