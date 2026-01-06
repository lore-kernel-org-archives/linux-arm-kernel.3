Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AD4C47BE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZUjxP+lSd4GrNVicI9mGLNa1WRBkNq03k4CSNb1z0I=; b=bmspi443Jv610WT2mOmdJprM7O
	+fIYJct7nmSXD8DFTTQzAEzWGb0KJ6UUSWgmAy7csXbhLqdWapyqOhLu8ATPjRBB+yjqhPonS/inS
	DBznajFrMMevIUOuM/YGuoqM1elwZHO+Ne9/wWLngZNKe19eR8hoq2/felq8ZfW+APbhV2w2pX4ZX
	1jjMGgj15bbyynqOtowzYPmxBq1IHFmBJPv52jKHdIQgjgUseAvCCtnH8t9jY1HpfH+gzXDyJY0Kn
	s4ch0/Tpv6sQg74c1fofqSmgzl7nVpenFg4nsDntZsfXB2fUaH88RXQQi1RK2zQHsZ/QEb4a2n34l
	YIdDt7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAUz-0000000DXot-29yV;
	Tue, 06 Jan 2026 17:05:37 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAUw-0000000DXoU-0Rvg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:05:35 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlyGW6FwSzJ46YJ;
	Wed,  7 Jan 2026 01:05:23 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B96AC40086;
	Wed,  7 Jan 2026 01:05:25 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 17:05:25 +0000
Date: Tue, 6 Jan 2026 17:05:21 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Alain Volmat <alain.volmat@foss.st.com>
CC: Mark Brown <broonie@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/4] drivers: spi: st: remove __maybe_unused for
 suspend/resume
Message-ID: <20260106170521.00001668@huawei.com>
In-Reply-To: <20260106-spi_st_maybe_unused_removal-v1-1-8f5ca7136e96@foss.st.com>
References: <20260106-spi_st_maybe_unused_removal-v1-0-8f5ca7136e96@foss.st.com>
	<20260106-spi_st_maybe_unused_removal-v1-1-8f5ca7136e96@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_090534_294149_54C6C746 
X-CRM114-Status: GOOD (  15.34  )
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

On Tue, 6 Jan 2026 13:14:17 +0100
Alain Volmat <alain.volmat@foss.st.com> wrote:

> Remove useless __maybe_unused statements for suspend and resume
> functions since this is now used via pm_ptr.
Patch is fine, but reasoning not quite right. pm_ptr() allows
the dropping of the structure without needing a __maybe_unused
on that, but these are passed to the SYSTEM_SLEEP_PM_OPS()
macro and that is using pm_sleep_ptr().

So tiny description change needed to reflect that. Probably
mention the pm_sleep_ptr() is as part of the macro as that
bit is not totally obvious.

Jonathan


> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/spi/spi-st-ssc4.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-st-ssc4.c b/drivers/spi/spi-st-ssc4.c
> index c07c61dc4938..b173ef70d77e 100644
> --- a/drivers/spi/spi-st-ssc4.c
> +++ b/drivers/spi/spi-st-ssc4.c
> @@ -403,7 +403,7 @@ static int spi_st_runtime_resume(struct device *dev)
>  	return ret;
>  }
>  
> -static int __maybe_unused spi_st_suspend(struct device *dev)
> +static int spi_st_suspend(struct device *dev)
>  {
>  	struct spi_controller *host = dev_get_drvdata(dev);
>  	int ret;
> @@ -415,7 +415,7 @@ static int __maybe_unused spi_st_suspend(struct device *dev)
>  	return pm_runtime_force_suspend(dev);
>  }
>  
> -static int __maybe_unused spi_st_resume(struct device *dev)
> +static int spi_st_resume(struct device *dev)
>  {
>  	struct spi_controller *host = dev_get_drvdata(dev);
>  	int ret;
> 


