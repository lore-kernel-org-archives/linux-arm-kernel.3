Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D42FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OW0dklUq7uf6SLk/z/yDWKh4nZLnpSbAuY6QO/s7DpU=; b=CiJAYo/E7OtNAXxZJrpzkzUi3b
	g22BhKKe7n2iMSSxVPk96qS0l3mbvKu/5sUHD5oHyYqHarpnLdMWgHXz6M5EtIPnFFgRjzd7j+LvV
	mDx6/E7nOCw68/ScwxxjFZjWdYALs5SiQM8xeyfY0GJD0vAIcV5q7mt9PtX/POC2+TXDO9aNCKUWl
	5OSN6KQpIJRgscDEWuwPX13U29kLAt3i5pprePgclKSHEhWHPzVD2SCEWfCcZN9NScq6FqFi3lNXu
	lQPl71r+IEgjumZIJpVSgMQkeY8i8hxJMD3BUzcb220+W1cc7I8YmV6IiV0aq5PmgH18dyn5A+VAH
	X5eOOdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGEw-0000000GP4z-0dCU;
	Tue, 05 May 2026 13:55:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGEt-0000000GP3m-42pV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:55:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48909558b3aso57878245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777989305; x=1778594105; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OW0dklUq7uf6SLk/z/yDWKh4nZLnpSbAuY6QO/s7DpU=;
        b=KV0UnThSxCDo0zGthXdxGra/1ciGthTHd1WKxrEb2dETQpYOW6nPW+zLZYNY/WDsT8
         NOcOtUmlok9nuSBmjc7KO5OgrrXNV4JzZYXCUoNqvEbYezf94ADRFbONWZacHD+FHIbs
         Cp00Zx+HTrZxMRaOiyxftaRb9UlkTJuR/G3QcG0kMD/jf+7tmPp3BcD8XndzG8Ik0Abg
         V5qbnwcs6lR0wqleOzhfvpG3ALMG6QvdypGeftBkexGgA8ezvMQzhFz7W6btbHzdaxMt
         lWhSkNY97bT028h+mhD0dX1/XCBCqdgj5rzRwAnIggZlyAA1EDzokZn3o83YwWi0t2rP
         3gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989305; x=1778594105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OW0dklUq7uf6SLk/z/yDWKh4nZLnpSbAuY6QO/s7DpU=;
        b=U5BYj3iEahJ5OWABXYW0SgJ2GX37HVMZTEiPKnKvP48s8o3+ryxAaiHM/lKUb7pmfU
         6B0wNXfJUn/7ipVv6qrF2TcSva2Jn6+DUVVv2GrWrVLuGxm8KVQwXYOkhf30sTqCpF5V
         a9NHKUHmoTgoW7/dg/KtHKQA4y5StvdREpRHgthX/ZnM3Yd4a1r87Y5AwzY9vsTVBwR6
         qMvTQo/c6a/D5gLNnriyfir1TyLrenvvGIlPBGj7zhXn3AEdtspxl0T6bxpJ96nuF9NB
         1iwxzensAzYBJos4qV1lNsd02f/d8COrIXpcA5PtBBsEmCwXFYN9vGvSFUME/+yrMoJT
         +QjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9z+s9D1qicwHij1rNGTXmawFaTuSa0vLH9Zr9vlXDGiNMCHaz8pLxiX6ppW6z40FUa8nC8SiLMKh+vCLXgTaxb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1vpys9HevhiPw/kdPpYOSvh1oNhTasSsIMLRjQunp03q4b9dr
	2gRxhc1/RJ2CBmcESjwZoNFtNftIGXQCAi2f83/zzrHO7/HSJ07V4OTYkfeWAMUi520=
X-Gm-Gg: AeBDievLeqcDYc9EDopX15DHEHi0BEJt9ddrHK6NlQ6V4KokYmk7ibWciAzHC1wZ4FE
	gNFhDKWQQ0Zpz+OCCz6rABtZuBkZbl0S3Qn29ezA8sZJ1PjSUDN18flE0sOdmRYFq6iNGXoKQNz
	qOEj/7ycIZEFhOE7edCbVt1jmJEZhnHwcMeiU78MXtlo1vXY4wZ3bvEHYRHCZWa0SoSRs5RbF6i
	rgFTZ0atlKBgF9kxFh5WwWoDZZwmbOQdfiACbAUXqnkIfeuwU0BovwgSBw6Kad2fKMsxTbdPJvz
	A1NA1WYJpVP0VtQWy9bTqNMCYGSOle+h+uMwWDYu98NFQnJBAeBvBPFodP36M3vCRHf1WR+sb7Q
	kZnIxiO1Nbj9JYbsLQ1UhuBEr3i4C1U3EO3poAH3pQn2zWYJr2edCdQXUotqsbzGTxZ59lY97TY
	7SYFh6UdABVeuU+DO/hP4qdiMCrQpU9GQG6LkvHUY1dLkE4w0=
X-Received: by 2002:a05:600c:8590:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48a986381b8mr182417195e9.9.1777989305399;
        Tue, 05 May 2026 06:55:05 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm369040085e9.6.2026.05.05.06.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:55:04 -0700 (PDT)
Date: Tue, 5 May 2026 15:54:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] printk: remove BOOT_PRINTK_DELAY config
Message-ID: <afn2sYKKsqG4QBVX@pathway.suse.cz>
References: <20260503214214.3475670-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503214214.3475670-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_065508_006316_A5F1E8DA 
X-CRM114-Status: GOOD (  13.79  )
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

On Sun 2026-05-03 14:42:14, Randy Dunlap wrote:
> This boot option is ancient and probably not being used.
> Dave Jones used it successfully maybe 15 years ago...
> AFAIK it doesn't work reliably, especially on SMP.

I agree that it most likely does not have many users and is not
reliable.

In addition, it was kind of obsoleted by printk_delay() which
does very similar thing except that it can only be set
at runtime via sysctl.

Which brings an idea. What about doing the obsoleting properly?
I mean to:

  1. Add "printk_delay" early_param() which would allow
     to set "printk_delay_msec" via command line.

  2. Modify boot_delay_setup() to set "printk_delay_msec" as well.
     In addition, it might print a message that it has been
     obsoleted by "printk_delay" and will be removed.

Would you mind to do it this way, please?

Regarding the reliability, it might get improved by moving the delay
to console handling code. It would even allow to use sleeping wait
when the consoles are handled in kthreads. But the wait might
get multiplied when more consoles are registered and proceed
on the same CPU. Anyway, this is out of scope for this patch.

Best Regards,
Petr

