Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255A0E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gt5Dw4xDrEi3b2EABYrPiIWTk1iGh4iu7N4Ns/FgtDg=; b=mp4w/FZlsHJIl09RWmhnbAYrEb
	8eTKgTHHRhoFJiBR7WAy3LZHysS8B0nKADuPa28EDO7ue5JV6Bxt1OAeSAeCcnIMEpXbNKbYzd60Q
	0+TIWSDEneZvaLb0ASfVC+j8YsAI8xi+R4VD5qaKPqpW0TEEGqWZQVjTu/goPeNw84vfJ0pQyTqUS
	g0crvxtIjmA4u88gpXDYE4CHlOY5OMx8IcVvW7+G/YTYMGKFo8KOo3wxasYKy8r7BsZ7VEtgX6o5S
	4nPUI8xFVb9AJbg1oVeBo/ogak7w1c7doetf+GRj5BuLBOheeOmBkMriGsBTN+iQdZtNpeAZpYFgx
	Bof6wCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSet4-00000007RwD-3hgR;
	Tue, 31 Dec 2024 16:14:30 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSert-00000007Rom-29qU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 16:13:19 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id SerbtsZWjnl6tSeretLw5U; Tue, 31 Dec 2024 17:13:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735661587;
	bh=Gt5Dw4xDrEi3b2EABYrPiIWTk1iGh4iu7N4Ns/FgtDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=k9YtF6MMuJKuWprW3mYB6GrQPD8cIMcGr0g9eBQMhGPWTTLWgJgsHoLG3ogeFg3aw
	 H2kdl2KsonchiYdETtMPHkTP1yVmuuoXlEgOwzXEdcRd+d5jMBKxDbWLYa9K11CLQ5
	 8vAvAYRnWYWj9nk1hAUdwds4TrtoXOf9o7Bdh9/qw10iFXk8raEtVqHZOkDAsqbClQ
	 WIlecDRecgYVjJT2v9vQOvO5lbaR7ExDe2tHSBk2bcnokl/3kx3b7OiyreAPgWoKee
	 8OHyeZ7YSoyOXmpbzAAgAXRZbqE+m6DlwY5s3KntYn624d7H4zfheL+BDEIbOqQcqO
	 hpdao8YiEnLWA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 31 Dec 2024 17:13:07 +0100
X-ME-IP: 90.11.132.44
Message-ID: <352592c2-e1a4-4d42-b1d2-f4b87ede2974@wanadoo.fr>
Date: Tue, 31 Dec 2024 17:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] soc: ti: PRUSS OCP configuration
To: Basharath Hussain Khaja <basharath@couthit.com>, nm@ti.com,
 ssantosh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 pratheesh@ti.com, prajith@ti.com, vigneshr@ti.com, danishanwar@ti.com,
 praneeth@ti.com, srk@ti.com, rogerq@ti.com, afd@ti.com, krishna@couthit.com,
 pmohan@couthit.com, mohan@couthit.com, parvathi@couthit.com
References: <20241223135550.6898-1-basharath@couthit.com>
 <20241223135550.6898-2-basharath@couthit.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241223135550.6898-2-basharath@couthit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_081317_981823_51EB319F 
X-CRM114-Status: GOOD (  12.11  )
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

Le 23/12/2024 à 14:55, Basharath Hussain Khaja a écrit :
> From: Roger Quadros <rogerq@ti.com>
> 
> Updates OCP master port configuration to enable memory access outside
> of the PRU-ICSS subsystem.
> 
> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit either
> to enable or disable the OCP master ports (applicable only on SoCs
> using OCP interconnect like the OMAP family).
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> ---
>   drivers/soc/ti/pruss.c       | 77 +++++++++++++++++++++++++++++++++++-
>   include/linux/pruss_driver.h |  6 +++
>   2 files changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
> index d7634bf5413a..a0e233da052c 100644
> --- a/drivers/soc/ti/pruss.c
> +++ b/drivers/soc/ti/pruss.c
> @@ -25,14 +25,19 @@
>   #include <linux/slab.h>
>   #include "pruss.h"
>   
> +#define SYSCFG_STANDBY_INIT	BIT(4)
> +#define SYSCFG_SUB_MWAIT_READY	BIT(5)

Hi,

Nitpick: #include <linux/bits.h>?

CJ



