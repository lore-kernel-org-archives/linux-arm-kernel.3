Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193AAE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDbYEwthtaMnaPUQjYL9uilU4hsUSGdxtT6CRg17Pg8=; b=cIzP661q3HndCAgde4nC3ut9JB
	gv9mM8ylrPYN9j7ow4LD4XxuC2BH/8+I2MskFUuQa69vxrW9Xgq+2s8vtSL6YXjppNA/biY7zN80c
	kXfiGveH6YriMzPy3zrguNedLE67U/NzED0BH7GJ5qGPUNOMLbgumhaOoSaacsmD/jgFCX6Vk+nYm
	47QmBMo/m+M+iW2Nx0E3bMObwcKPp1lvh/Og5MyCFgpttq1EEOMRCysDRpCwMkKCDhxVe2C6WeYpK
	sd5jaUMvXKqqLJJY45bMcEyNPT/ajPYzLEDR0jvu6d0rUe5Dws8mdpd8LIafg9gEPtbG/mj4CQ4j6
	G2H3QV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNu2u-0000000Gir8-2JZP;
	Wed, 18 Dec 2024 13:25:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNu1o-0000000Gidj-3NDs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 13:23:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A089A42540;
	Wed, 18 Dec 2024 13:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421F9C4CECE;
	Wed, 18 Dec 2024 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734528231;
	bh=1rag6+1uBjp12jD655gpKiTsPlSVmA8ZNwJ3WpSAXSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hDGqeDucP10ueCdAlxU5KcQ5MG8REROI/vhy9a4afhixrdj7/I1WsDWj82mLzrMOE
	 lNnOf010qNjMzF1h9mr8xsBaXI9dmb8eqeJrq5BPHolfqF3m7H1qcSVk1Ba6eLdqHA
	 6C145vyICWf0wlqvnZsHdywSdVUQ2Xm4i2uJxonzJTnRYWvJ5EIHCvA+biXHPeh3AB
	 mStYJ8m6JYNNnkccs0J14m54pugdiQ0Nee6+BfKQ28bEMxEdwLEfJpFWoDb9aAJHwF
	 tArQTHxJsvZCMycF2hGA3BrFJ2fEmlM7sucbBNVKgD4Tl1ikFMT4gdJpq7F6ZURNZg
	 REIVlBHYGGmWg==
Message-ID: <d599c3ad-2c3e-4fda-8008-bd5051beecca@kernel.org>
Date: Wed, 18 Dec 2024 15:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: Add entry for linux/pruss_driver.h
To: MD Danish Anwar <danishanwar@ti.com>, tony@atomide.com,
 mathieu.poirier@linaro.org, grzegorz.jaszczyk@linaro.org, s-anna@ti.com,
 ssantosh@kernel.org, nm@ti.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
References: <20241218104424.1257880-1-danishanwar@ti.com>
 <20241218104424.1257880-3-danishanwar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241218104424.1257880-3-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_052352_909022_2BD0ABE2 
X-CRM114-Status: GOOD (  10.87  )
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



On 18/12/2024 12:44, MD Danish Anwar wrote:
> include/linux/pruss_driver.h is an orphan file. Add entry for this in
> the MAINATAINERS file.

s/MAINATAINERS/MAINTAINERS

> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc992f10a2f6..069817391e9f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23638,6 +23638,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
>  F:	Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>  F:	drivers/pmdomain/ti/omap_prm.c
>  F:	drivers/soc/ti/*
> +F:	include/linux/pruss_driver.h
>  
>  TI LM49xxx FAMILY ASoC CODEC DRIVERS
>  M:	M R Swami Reddy <mr.swami.reddy@ti.com>



