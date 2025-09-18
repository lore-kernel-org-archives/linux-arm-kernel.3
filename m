Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA61CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9gsW+PCsFsbjhMHkw04UTWe5VphiwFtc+TNmvQSn+Gg=; b=fyrMlZY/0U6Rp6O64FZ/Qm7apM
	0v3f011GT9Bb4rtdYQT6FqoFBWSKdJZC41/9mZloHCiAHt9cuhueUcufqQD/NnbvegwAVFhL/+cRg
	IE6gl/Xyv6jjs9ebyP7/jz9mX/PZB3PQpM8rptxfpo3hakoSSLQcaMWg+sOpLsw6fj8hBeoLXNAUL
	YHgcpKYdwc52aFyJBfI1PyyT72TlVAaU4yWr9fK2/Dnf9pr84uPOtWb4EaaEvLEmCyBl4JhE7d55L
	/QC0vtFO9aT+jHowN284V/6COgHE25HxtDi9OlCfEDw+59+gpmcREIUAzBPMLZSBX/IrwvxglLJC4
	BL21S0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBDr-0000000Gv8L-3CSx;
	Thu, 18 Sep 2025 09:46:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBDo-0000000Gv75-40cb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:46:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso4312355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758188795; x=1758793595; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gsW+PCsFsbjhMHkw04UTWe5VphiwFtc+TNmvQSn+Gg=;
        b=nShgDZiJaejQsqX9V7zr5aC2kab9LFoAZIHHc2nsLN4QoR8pVqUsGxMBuhQ0zFE1XS
         bEvzCPoCS7eN9BPQgdggLJZSYm+KvyXqOQBf3BaJDPSglVmOoOOUwkblAcAFEVHfYAOi
         4HWoyclRAGTJXUFajWov85fveCmcSFOd16wuhnBE+oCqwqq9eeYCeeSCKJL1Phh4mOVu
         ZVCUgjilHWHKmuZiqeSNefPUdB/KQsj7HWJ8bQzc/dhaLA7lyuMBbcXW50qIemhYPa7e
         WPljU8PkqZDmbmVhgwNKne48tv1jQGjJX+TzhQW+DDIUz4WoGHuj3iaF0WUkgEbAPvZg
         LGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188795; x=1758793595;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gsW+PCsFsbjhMHkw04UTWe5VphiwFtc+TNmvQSn+Gg=;
        b=V7h2hmctVikG+/qqtraT6khbEfxFYb2cFy64mvioU3PfWOC+zDV1xl1MlDFq2jY7My
         WbYXHT2cDajff9Md6FU32739XKSwGu+ajuimhb3U29wJcwi3aMQTUlrRztSLfRGr0A+W
         ntl7TinSLkpWi8EYt0xbcpFRb53P37kpecTydbAH0soyBB+JutWOdI5070slqkmrF/L8
         JKDASs+nWf0XHcNNEmRbfNMC6v2bThct4YFjWCFpbJreLVm7ZJW55HlobLJH1L/OoP4w
         IPL7NP0BvfALllsA5vAKTmYZNCeOhntIUmhhNgTVHa9YwDgkpwz/KeQrI2qC4LJ6Bg9a
         qcDQ==
X-Gm-Message-State: AOJu0YwYEXKRnDITiqPaUdagBG7sQSFBBBdg3G4KvM8caBfYdXh/yuT3
	5TgCxuHPh0vzvnIth6uuhZuyAUm9ztDsvem8PEmmcwcbbP0/YJsbkmCUUgt//YTtb7BkPelbXqD
	T8dS8
X-Gm-Gg: ASbGncsXMiTVJ+FVCJGN7sXaZmjdF5wG7gf+Eu+Vynf9JfFfRBjOSqrU79m2juQ0yd9
	xG/YRzV7fsKYH7GY1UKK1c7aU/uFt6tqZkLHgEQjLE8FJNbjU2uLHG6aLHsdrfrwyMHxMdvTdN2
	wDKZYFxkXnimro21noVuN9C/gNgqOSPVhrdX57HM2G90OWu2P1Iua3agowtXL0tUef9oEAloCTb
	ZpL/OuUE5sASKwCuT1aaH6OdVKj03koCa0wxtTByoIcD3ooFzTR51haN/GK0ObE6ejQAHky6zR1
	JZSmSwH5RhwFTFI93MJHEZNCIL+Jm8/svx4KsYxXyK3LV8P78iBe5jG93RMYpNF5o2X7DZ3Ay/+
	sDy8pMLMmSxBVXrps53FJOCU2WM4hVP05rmXKocTan1P71g==
X-Google-Smtp-Source: AGHT+IHuFnfC6ktLvjXJO+7x5N4vkiVPVLA5AIqL0cjSQjLhFwmJLsbh7gFJcbm0i6DZHk1/dpehYA==
X-Received: by 2002:a05:600c:354c:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-46205cc8649mr56930195e9.24.1758188794619;
        Thu, 18 Sep 2025 02:46:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4613d14d2b0sm76378985e9.13.2025.09.18.02.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:46:34 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:46:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [bug report] KVM: arm64: Dump instruction on hyp panic
Message-ID: <aMvU9-6DpbTsN3W7@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_024637_001037_1BF0B02C 
X-CRM114-Status: UNSURE (   6.85  )
X-CRM114-Notice: Please train this message.
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

Hello Mostafa Saleh,

Commit 92b7624fe052 ("KVM: arm64: Dump instruction on hyp panic")
from Sep 9, 2025 (linux-next), leads to the following Smatch static
checker warning:

	arch/arm64/kernel/traps.c:219 die()
	warn: variable dereferenced before check 'regs' (see line 217)

arch/arm64/kernel/traps.c
    206 void die(const char *str, struct pt_regs *regs, long err)
    207 {
    208         int ret;
    209         unsigned long flags;
    210 
    211         raw_spin_lock_irqsave(&die_lock, flags);
    212 
    213         oops_enter();
    214 
    215         console_verbose();
    216         bust_spinlocks(1);
    217         ret = __die(str, err, regs);
                                      ^^^^
Prior to this patch, Smatch used to assume that perhaps a NULL "regs"
would make notify_die() return NOTIFY_STOP so maybe we didn't dereference
it.  But now Smatch knows the dereference is unconditional.

    218 
--> 219         if (regs && kexec_should_crash(current))
                    ^^^^
Checked too late.

    220                 crash_kexec(regs);
    221 
    222         bust_spinlocks(0);
    223         add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
    224         oops_exit();
    225 
    226         if (in_interrupt())
    227                 panic("%s: Fatal exception in interrupt", str);
    228         if (panic_on_oops)
    229                 panic("%s: Fatal exception", str);
    230 
    231         raw_spin_unlock_irqrestore(&die_lock, flags);
    232 
    233         if (ret != NOTIFY_STOP)
    234                 make_task_dead(SIGSEGV);
    235 }

regards,
dan carpenter

