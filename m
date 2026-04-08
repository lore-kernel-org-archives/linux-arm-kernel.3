Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54571FF512F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 01:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pD/U8jlNGNQBpPARroCSmi3cFYS91/sbHvl4Gv0tUW0=; b=C+pVVTCtUiAFvn
	aNuxTNKK1qfT0h6mrf58AninTfpw7XQ0HRhGgeOoA5zrbSKDK5SXqMzwJitMopYkiAdNGyDKWYuTy
	X4KaUOhb43kFrXJcx20PQIDCWjNsgVvQcbhT2Y/wfIbrjypGOwBhxJwViRn9CJwxlfe/lSuaMe/uF
	Uh7WPziN1SQ9CiuyX4yZFP7gwjudqslSU2yPaJnpDARdnumRo+pFk3ZyKxhA1mZ/61yWk7KHiqkgX
	uYmdjvfd5zXDNlemY8sKdna83kgfyXxsYHpwjgwUpQwJof4eGg6lTKlXa8UlKNu3MNgnvZMepBu2D
	jMry8NvKHHPoo7dJUM3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAHVD-000000084gL-0722;
	Wed, 08 Apr 2026 01:14:43 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAHV9-000000084dj-0vCB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 01:14:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pD/U8jlNGNQBpPARroCSmi3cFYS91/sbHvl4Gv0tUW0=;
	b=LZ5dedVcaAaYTioUqoEm+IWb5tCWe86svQQ9EkAddRV/WQWlJx7Pd4cJzaBO/r9k+ALWScDAE
	oaLiQxbKAhS/f9bNPmo0KWWdCX+BE3S+/gRWDn84kLkeCEAma73gL/a3itJMT73a9xAIcUhpL+c
	u8A2GUb3Ot7JTuLnZof1h00=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fr4gX0kH8zcZxk;
	Wed,  8 Apr 2026 09:08:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CEBDD40561;
	Wed,  8 Apr 2026 09:14:24 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Apr 2026 09:14:24 +0800
Message-ID: <ebbc35d1-e52e-e9ff-0932-0ca50d961cae@huawei.com>
Date: Wed, 8 Apr 2026 09:14:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 01/10] entry: Fix stale comment for irqentry_enter()
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-2-mark.rutland@arm.com>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260407131650.3813777-2-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_181439_754085_3F07EB26 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: vladimir.murzin@arm.com, will@kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/4/7 21:16, Mark Rutland wrote:
> The kerneldoc comment for irqentry_enter() refers to idtentry_exit(),
> which is an accidental holdover from the x86 entry code that the generic
> irqentry code was based on.
> 
> Correct this to refer to irqentry_exit().
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  include/linux/irq-entry-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
> index d26d1b1bcbfb9..3cf4d21168ba1 100644
> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -394,7 +394,7 @@ typedef struct irqentry_state {
>   * establish the proper context for NOHZ_FULL. Otherwise scheduling on exit
>   * would not be possible.
>   *
> - * Returns: An opaque object that must be passed to idtentry_exit()
> + * Returns: An opaque object that must be passed to irqentry_exit()

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>   */
>  irqentry_state_t noinstr irqentry_enter(struct pt_regs *regs);
>  

