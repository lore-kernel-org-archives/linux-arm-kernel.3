Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37ABC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 02:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g74Ixp8NGxnQ+h3OVHTuhXFI9JESJ9nmLN3UeSeO5tM=; b=v3wACWbUydv/WfVhJ+17bwqOr6
	1z32EHIZEQkNLtTBzIn5qUbMDbXlE9+UO37XRg+RPV1YXhbFnzchCoDxhce/hd21TRUMSBpJnZImW
	+lw6L3aqkQ+2cpELpYfPEzwahh63E7mB8GrvCSZFh8WtwaGfV1Wa/Ju+28g74JOoCbdwwPCnENoJm
	MHtQYilWoWMASwRUkeoNQY6tucve46VgrRg75zusmLi+vDgW5sMWZwVV4zVf9giCfKyLAAkAWD4iQ
	z0egs7tbrZTWA6maFmUXCI6QMBlsY5JBE6uczO/o0JjYJTi1g9GOzZfR1Z8Lp05yE5NHUGuISBzoi
	u3TmY88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wws8p-0000000AkCt-0SVu;
	Thu, 20 Aug 2026 02:04:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wws8o-0000000AkCV-2dQB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Aug 2026 02:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g74Ixp8NGxnQ+h3OVHTuhXFI9JESJ9nmLN3UeSeO5tM=; b=l6Pyb3A0QZWdQfhGlh/MmkJbyR
	SLtZs6NxpYHWbjG2Ce/R6NyqrDZgyX3UwsRAjw82AMInBhIRegyY9Af65AYXue0R/7IfuQuG2KvWF
	G5LZBVUl5hY+eqYUinLElOyFal3kK0cgZbN2bnzdyvJqBGdw7lJtqfyVHUk2KFza4MYfq8xZ/8eYU
	c9VO0zfy016iB7r2+9C4ovwJ1wVY0T/NJn/tUixohXkbyxBhbE2sSHpqbm8XkjU7R18JZ4293DXX9
	Ah7JkH3Ig3x58pugQWv51LSW5AeWANzXvIuTse3hiuVjBPzud9nIxYEVNVOwpCurKpLYZenQBNdol
	/fK6c4eQ==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wws8j-00000002m56-2D0i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 02:04:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=g74Ixp8NGxnQ+h3OVHTuhXFI9JESJ9nmLN3UeSeO5tM=;
	b=dOwL6ap5xqKDjbfhxc9u+vAy3K11je4jzBVXj1gjiAG4pvUwLIu2y4HHT2hSi+so8drBPXx12
	yYocL17qu0LP5GoA//uvWfUZcz7P3t4Mu0caB9ZMIkOuIt4aBqI7RMtnxxXJlNSFO9uUBnnZU7c
	dgSZXUGFaI4kOTIZVdWc9yE=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hQRL45dLTz1T4dr;
	Thu, 20 Aug 2026 09:53:32 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 235B140538;
	Thu, 20 Aug 2026 10:03:34 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 20 Aug 2026 10:03:33 +0800
Message-ID: <815f8d05-bfad-4fd2-9cfc-fc90938324f5@huawei.com>
Date: Thu, 20 Aug 2026 10:03:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Fix get_cycles() after delay_read_timer() conversion
To: Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260819-fix-arm-get_cycles-v1-1-208bf07ac540@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260819-fix-arm-get_cycles-v1-1-208bf07ac540@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_030422_649134_B274C944 
X-CRM114-Status: GOOD (  14.20  )
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



在 2026/8/20 5:43, Nathan Chancellor 写道:
> After commit dfc256dac54c ("calibrate: Rework delay timer calibration"),
> certain ARM configurations (such as multi_v5_defconfig) hang during
> boot. The use of read_current_timer() in arch/arm's get_cycles() was
> improperly converted to delay_read_timer(), resulting in get_cycles()
> returning 0 even when the timer has been read or an uninitialized stack
> value when delay_read_timer() returns false.
> 
> Flip the branches of the ternary condition to fix get_cycles().
> 
> Fixes: dfc256dac54c ("calibrate: Rework delay timer calibration")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/arm/include/asm/timex.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/include/asm/timex.h b/arch/arm/include/asm/timex.h
> index 94e40c19cfc5..4d31eab9dba2 100644
> --- a/arch/arm/include/asm/timex.h
> +++ b/arch/arm/include/asm/timex.h
> @@ -13,7 +13,7 @@ typedef unsigned long cycles_t;
>  // Temporary workaround until timex.h is cleaned up
>  bool delay_read_timer(unsigned long *t);
>  
> -#define get_cycles()	({ cycles_t c; delay_read_timer(&c) ? 0 : c; })
> +#define get_cycles()	({ cycles_t c; delay_read_timer(&c) ? c : 0; })

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  #define random_get_entropy() (((unsigned long)get_cycles()) ?: random_get_entropy_fallback())
>  
>  #endif
> 
> ---
> base-commit: dfc256dac54c8b692110bf905c64cb130e15963d
> change-id: 20260819-fix-arm-get_cycles-c83096ec81a9
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 
> 


