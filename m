Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBB2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQVQBaV5fHcA83clu9akSWu63NEeaNysHxlR6UY3iUE=; b=UyBZKt2Xq/yhQqNqP9Vnmkce7+
	AucqFv0dWUj1rxBlbBxMRAvO9KKmiOscBn4FeEW50dcugUpEEwoGVrf7WWeR3KnZJannlN1tYcJ3N
	zmnu9OMGIj2ckY3ZPs+sn58EB7kGzI0LETJXyBl9k795oe18YgDUwx729F43tCZ1Bf4E6ghu88kWh
	3O6LbMkEvk/SiwaOkgD+GvCbStFxdg/G62ls4Zx7eEI5oDfuY/3TDAwpDyr/Fbf3S6EZX4XGmS1Re
	rhnvE/O+c4HJQry8VCvr/dEtD2J3Ucf3vpLBSkD+q3QMxJZcVCca39c4OlQbHIsUA4L5MdoxVKo4J
	Htk4AyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dcL-0000000BJYy-2HZK;
	Fri, 04 Apr 2025 09:45:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dZN-0000000BJ2h-1YCJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:42:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74EC8439B4;
	Fri,  4 Apr 2025 09:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB05C4CEDD;
	Fri,  4 Apr 2025 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743759756;
	bh=PmYxl4sZbJkOboYnme1Rf3xp9X7MenH8Ul4Sk4iBhGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlAoTx6Cxsk1VPlbNn1UFdsyAy9P0Rj8nyH5vajp1LzdLxXJBq8sWEwCF1k05aC4u
	 BzFAW6W4ahDULGMh6rE9WaFc2FdaUcJlhgafxtq8lfcX5p/hUkP+v5t1EcmCTvM0qS
	 Jf1BysEkl4+ipPZlua2TjHHNs1lGhYOEGhwoUq3vy+lEMWH4vqHImPq0aZhfMIM7PB
	 ulpvFqI6b3TyCpNU+K3HYaKbFFn5d839iavi0odpOZMGIm+xGPFGTnNvBn5u/vbbVW
	 4QN4xwUvhmxHn+Hv7z1O4D+b/ZFF5IXwbWnqQH4y+hpOK4Lc3yQkdNHjYDnK2P/lZ1
	 XztKg3HpTR2Mg==
Date: Fri, 4 Apr 2025 10:42:29 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 23/32] mfd: sec: add myself as module author
Message-ID: <20250404094229.GF43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
 <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_024237_448436_E3D85363 
X-CRM114-Status: GOOD (  18.14  )
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

On Thu, 03 Apr 2025, André Draszik wrote:

> Add myself as module author, so people know whom to complain to about
> after the recent updates :-)

Full-stop.

Smiley faces might be okay on the list, but not sure we want them in
commit messages.

> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mfd/sec-common.c | 1 +
>  drivers/mfd/sec-i2c.c    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b1cf25de4870e1a95e 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
>  DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
>  EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
>  
> +MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");

Might be more polite to put yourself at the bottom.

Not sure these are ordered alphabetically on purpose.

>  MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
>  MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
>  MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
> diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> index 2ccb494c8c024361c78e92be71ce9c215757dd89..74fd28a6bc9a42879fc1eb05546777f60e0062e9 100644
> --- a/drivers/mfd/sec-i2c.c
> +++ b/drivers/mfd/sec-i2c.c
> @@ -233,6 +233,7 @@ static struct i2c_driver sec_pmic_i2c_driver = {
>  };
>  module_i2c_driver(sec_pmic_i2c_driver);
>  
> +MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
>  MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
>  MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
>  MODULE_LICENSE("GPL");
> 
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

-- 
Lee Jones [李琼斯]

