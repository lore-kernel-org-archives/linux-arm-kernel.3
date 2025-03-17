Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A03CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wYlD9jZZoRKe3LWeJSVuvHocmq8TTAojRZykM6BVU8=; b=TqKMhU/0vPzbgatQ+cQeIayE6O
	DhJT/miWGWEk+B8BPemDWdNKJrj7sJ8ZMQ0uXy53xIeYjB8xQahoZs32YZAIsx3a2UW8hy4pMh5OH
	ivhLQqyKqJz5rqqzv6somFvX8FENNPpG9EGve6qneOPO3sI4hloB9rrefiNgEB/e+69ONlzXsqwLS
	N4QGpIx/+T9t5KNy8887YS0WvoZLX6dECPVJnwELdGiowP8VK6TD2MXD2ytPMzfYFhKQocYanq1Nl
	jDR/3MuQwoKy33mzya1Zfvftn0fKpZplA1jdr+Hom501U/V0sJ4I1zsWgSdIaU1QM8l2Z+/mkjIfd
	2x1PkULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu742-00000001znU-1NcM;
	Mon, 17 Mar 2025 09:47:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu72L-00000001zRe-2F9Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:45:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tu727-00042i-9p; Mon, 17 Mar 2025 10:45:19 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tu726-000Dre-1k;
	Mon, 17 Mar 2025 10:45:18 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tu726-0018Bq-2l;
	Mon, 17 Mar 2025 10:45:18 +0100
Date: Mon, 17 Mar 2025 10:45:18 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, marex@denx.de,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: imx: Dump higher 64bits UID
Message-ID: <20250317094518.yf2hbq5sjl7lgfwb@pengutronix.de>
References: <20250314065225.442717-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314065225.442717-1-peng.fan@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_024533_575422_B19765B1 
X-CRM114-Status: GOOD (  24.46  )
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

Hi Peng,

On 25-03-14, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX8MP UID is actually 128bits and partitioned into two parts.
> The 1st 64bits are at 0x410 and 0x420, and 2nd 64bits are at 0xE00
> and 0xE10.
> 
> Dump the whole 128bits for i.MX8MP, by introducing soc_uid_h.

Thanks for taking care of this :) We noticed that this is crucial for
burning the field-return fuse to keep the LOCK fuse unlocked.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/soc/imx/soc-imx8m.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 3ed8161d7d28..02d8c85e9a28 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -24,13 +24,15 @@
>  #define OCOTP_UID_HIGH			0x420
>  
>  #define IMX8MP_OCOTP_UID_OFFSET		0x10
> +#define IMX8MP_OCOTP_UID_HIGH		0xE00
>  
>  /* Same as ANADIG_DIGPROG_IMX7D */
>  #define ANADIG_DIGPROG_IMX8MM	0x800
>  
>  struct imx8_soc_data {
>  	char *name;
> -	int (*soc_revision)(u32 *socrev, u64 *socuid);
> +	int (*soc_revision)(u32 *socrev, u64 *socuid, u64 *socuid_h);
> +	bool uid_len_128;

Albeit your patch is not wrong, it could be far simpler if we redefine
the soc_revision to serial_number. This way each SoC can specify 
the dedicated mechanism of setting the serial number. Going this way we
need two patches, the first one is converting the logic and the 2nd one
is adding a dedicated hook for the i.MX8MP.

Regards,
  Marco

>  };
>  
>  #ifdef CONFIG_HAVE_ARM_SMCCC
> @@ -49,7 +51,7 @@ static u32 imx8mq_soc_revision_from_atf(void)
>  static inline u32 imx8mq_soc_revision_from_atf(void) { return 0; };
>  #endif
>  
> -static int imx8mq_soc_revision(u32 *socrev, u64 *socuid)
> +static int imx8mq_soc_revision(u32 *socrev, u64 *socuid, u64 *socuid_h)
>  {
>  	struct device_node *np __free(device_node) =
>  		of_find_compatible_node(NULL, NULL, "fsl,imx8mq-ocotp");
> @@ -102,7 +104,7 @@ static int imx8mq_soc_revision(u32 *socrev, u64 *socuid)
>  	return ret;
>  }
>  
> -static int imx8mm_soc_uid(u64 *socuid)
> +static int imx8mm_soc_uid(u64 *socuid, u64 *socuid_h)
>  {
>  	struct device_node *np __free(device_node) =
>  		of_find_compatible_node(NULL, NULL, "fsl,imx8mm-ocotp");
> @@ -131,6 +133,12 @@ static int imx8mm_soc_uid(u64 *socuid)
>  	*socuid <<= 32;
>  	*socuid |= readl_relaxed(ocotp_base + OCOTP_UID_LOW + offset);
>  
> +	if (offset) {
> +		*socuid_h = readl_relaxed(ocotp_base + IMX8MP_OCOTP_UID_HIGH + 0x10);
> +		*socuid_h <<= 32;
> +		*socuid_h |= readl_relaxed(ocotp_base + IMX8MP_OCOTP_UID_HIGH);
> +	}
> +
>  	clk_disable_unprepare(clk);
>  	clk_put(clk);
>  
> @@ -139,7 +147,7 @@ static int imx8mm_soc_uid(u64 *socuid)
>  	return ret;
>  }
>  
> -static int imx8mm_soc_revision(u32 *socrev, u64 *socuid)
> +static int imx8mm_soc_revision(u32 *socrev, u64 *socuid, u64 *socuid_h)
>  {
>  	struct device_node *np __free(device_node) =
>  		of_find_compatible_node(NULL, NULL, "fsl,imx8mm-anatop");
> @@ -156,7 +164,7 @@ static int imx8mm_soc_revision(u32 *socrev, u64 *socuid)
>  
>  	iounmap(anatop_base);
>  
> -	return imx8mm_soc_uid(socuid);
> +	return imx8mm_soc_uid(socuid, socuid_h);
>  }
>  
>  static const struct imx8_soc_data imx8mq_soc_data = {
> @@ -177,6 +185,7 @@ static const struct imx8_soc_data imx8mn_soc_data = {
>  static const struct imx8_soc_data imx8mp_soc_data = {
>  	.name = "i.MX8MP",
>  	.soc_revision = imx8mm_soc_revision,
> +	.uid_len_128 = true,
>  };
>  
>  static __maybe_unused const struct of_device_id imx8_soc_match[] = {
> @@ -211,7 +220,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	const struct of_device_id *id;
>  	struct soc_device *soc_dev;
>  	u32 soc_rev = 0;
> -	u64 soc_uid = 0;
> +	u64 soc_uid = 0, soc_uid_h = 0;
>  	int ret;
>  
>  	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
> @@ -232,7 +241,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	if (data) {
>  		soc_dev_attr->soc_id = data->name;
>  		if (data->soc_revision) {
> -			ret = data->soc_revision(&soc_rev, &soc_uid);
> +			ret = data->soc_revision(&soc_rev, &soc_uid, &soc_uid_h);
>  			if (ret)
>  				return ret;
>  		}
> @@ -242,7 +251,11 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	if (!soc_dev_attr->revision)
>  		return -ENOMEM;
>  
> -	soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX", soc_uid);
> +	if (data && data->uid_len_128)
> +		soc_dev_attr->serial_number = kasprintf(GFP_KERNEL, "%016llX%016llX",
> +							soc_uid_h, soc_uid);
> +	else
> +		soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX", soc_uid);
>  	if (!soc_dev_attr->serial_number)
>  		return -ENOMEM;
>  
> -- 
> 2.37.1
> 
> 
> 

