Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D587C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2E+iGdIlkoV59NdMfEBRQzgmdfJXBZ5T/hflZcAGZw=; b=mho+zjQRgINBm7BkUeJ5piqShq
	nckq+jIPZLEn0XqQbR+P4JauiqeZTMe2PqevWSAr/1viTlsG9I34XKuvlm8O6XXUTdwWb6K66ey+P
	8I1XPeFOIwp5TXh1ByFxDLe4+7DFVYIgy8fq1TfgyGflWH2p+KD4iC0vp97929RN7t2JDgtVlouNH
	9bhjcaEj7v81kroXJ6U2g1FdZoSOvdCeoBzZOUW6HxdzB74plSyXsdC2GHSqaTNKqRI4VJJYgfOtG
	WE4Afhvx5bwMZeGhaqQXUqWAbNzegcAco2AbyioKRh/QU7kTBud6bQSww+8cMhTYBFcacfVqk/0Xy
	QP7Fi3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhRCS-00000003Sq5-3UJD;
	Thu, 31 Jul 2025 11:11:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhR9u-00000003SfB-3rq6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 11:09:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE334601F0;
	Thu, 31 Jul 2025 11:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B74C4CEEF;
	Thu, 31 Jul 2025 11:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753960153;
	bh=A1QiLFsWkLOne69flYjxRji6b6Am/6hybG4NGr+X1Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eq7cm8edGkoGi5Z4FYjfHo2kfBz7kdjZ8gZnbMlHsFJZ9GpJ160ANP36pAiPhDGgx
	 iSBRb9D8F7+YbYqseUEpRsE63h0uqHBH01Uq2J1uPpafcHOZhF4KTe2YNGlJtUzKHL
	 iB5+szXDjW87D6zwKwO3ejN4+vhRb6yJj+sGXe6+xpj52OdlEzIwBprztPVvRNP9c2
	 PLPwNZp6qxfLgeMYhH+UA1pDV+wfT2P9utoPe0+jzebjPRub1Yghs+ZdE4iF1UUXCB
	 amjkeVJfPiPJDx5TmmyaUmFj+PBG+X127oT0+Vmh7jkNVD3e0eJBq5CW7ekvCaZorT
	 g9j8GQxvmThvA==
Date: Thu, 31 Jul 2025 12:09:09 +0100
From: Lee Jones <lee@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] mfd: stmpe: Allow building as module
Message-ID: <20250731110909.GE1049189@google.com>
References: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
 <20250725071153.338912-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250725071153.338912-4-alexander.stein@ew.tq-group.com>
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

On Fri, 25 Jul 2025, Alexander Stein wrote:

> Export the core probe and remove function to be used by modules. Add
> necessary module information so the driver can be built as a module.

because ...

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/mfd/Kconfig | 10 +++++-----
>  drivers/mfd/stmpe.c |  6 ++++++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 8f11b2df14704..a58c95e5b8072 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1539,8 +1539,8 @@ config MFD_DB8500_PRCMU
>  	  through a register map.
>  
>  config MFD_STMPE
> -	bool "STMicroelectronics STMPE"
> -	depends on I2C=y || SPI_MASTER=y
> +	tristate "STMicroelectronics STMPE"
> +	depends on I2C || SPI_MASTER
>  	depends on OF
>  	select MFD_CORE
>  	help
> @@ -1568,14 +1568,14 @@ menu "STMicroelectronics STMPE Interface Drivers"
>  depends on MFD_STMPE
>  
>  config STMPE_I2C
> -	bool "STMicroelectronics STMPE I2C Interface"
> -	depends on I2C=y
> +	tristate "STMicroelectronics STMPE I2C Interface"
> +	depends on I2C
>  	default y
>  	help
>  	  This is used to enable I2C interface of STMPE
>  
>  config STMPE_SPI
> -	bool "STMicroelectronics STMPE SPI Interface"
> +	tristate "STMicroelectronics STMPE SPI Interface"
>  	depends on SPI_MASTER
>  	help
>  	  This is used to enable SPI interface of STMPE
> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index e1165f63aedae..5faf13fd6cf83 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -1482,6 +1482,7 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(stmpe_probe);
>  
>  void stmpe_remove(struct stmpe *stmpe)
>  {
> @@ -1497,6 +1498,7 @@ void stmpe_remove(struct stmpe *stmpe)
>  
>  	mfd_remove_devices(stmpe->dev);
>  }
> +EXPORT_SYMBOL_GPL(stmpe_remove);
>  
>  static int stmpe_suspend(struct device *dev)
>  {
> @@ -1520,3 +1522,7 @@ static int stmpe_resume(struct device *dev)
>  
>  EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmpe_dev_pm_ops,
>  			     stmpe_suspend, stmpe_resume);
> +
> +MODULE_DESCRIPTION("STMPE MFD Core driver");

Drop the MFD part.

> +MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

