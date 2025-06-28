Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AE9C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 00:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KmbYvv/p8QkJFOIHHC4rmh9tFFrEsA16VC6+yNOxFU=; b=TkwVQFThBZ3VqmLrHFTVLvHb+D
	FG/AFZs0qJSAJ83mE8r5Y9yXVQWYrVMwN4zWkzxoqJhJwjnpTfVD509EWwOEgx/QEpn2hk6c785lV
	zTqCwTZc58CiRDw0LPm+E/iNbCGvJv5dfjDYoKa/3B4biI10oHzTkBiyCv8n1Nsku4pio+6qbQXsb
	k+BiFTfCEVJ3/WlyGF862GhwvQCJpb/MTxpksdN5VWN7YtxEOFDmNMBFASap1OagJWLmVD5MwWChM
	OucSPdi9HptjQs7UPeh1+0yZvrgPRbq85DcFobEOB8rHPXrMTtg26MM8Ortaz75MSyiZhTfhgvjlu
	BR5vc3gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJct-0000000G5re-1fzN;
	Sat, 28 Jun 2025 00:41:03 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJaY-0000000G5gS-3rra;
	Sat, 28 Jun 2025 00:38:40 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7d3e7503333so50459485a.3;
        Fri, 27 Jun 2025 17:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751071118; x=1751675918; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3KmbYvv/p8QkJFOIHHC4rmh9tFFrEsA16VC6+yNOxFU=;
        b=XorJ7zXWQQIyrGiT7HaHR9VG8POhYDcyRsxcd5POaSoCaF9SaDF/l54gAeDM/6dPqJ
         IPYLpQt0oR4ZNfhJNunVnsiSrxWyaYcDkFM5BqsULjjaXFmiwdPRN6PoG2FcddZblcrG
         m+eA3NQzAQk6deP84UWDGJn7RJTiId8OplRMeJ/85BbiZRawSosa6aclV4XW/fonHN/F
         vuL/jzd4hgjA6bvg5JFF9ugwhxLrZjm+oMkc/7benjebiDUderjHeR+w5CFeKJbICb1/
         JvGpUeH6i4ajRpoQrQk9nwsPKYsb3RifVURgFM/Q+a8UKdhyYXX2J3UyYKcPec+PspCE
         lSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751071118; x=1751675918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KmbYvv/p8QkJFOIHHC4rmh9tFFrEsA16VC6+yNOxFU=;
        b=eT7911Qh7D/CyV+UkW1K42OwYWt5Kt8ipQTSm7HZgW5Y6Lx9iLbNK0E0vj6Iuxjqic
         EGPRsFq2sCtJ1fIGeIkLKh7MQXwkhPakjX4vg0h/HYLJhMAa+NHbnUYkJBZwZXvphJ2g
         61NccOaX/seDouXbNLi61EKw7LC/Pc/P1OnIbR4dE4yL6NOlesDMna7cioD9szFK/zBg
         dX+JzG1Tq5sU2NSABHMjY0BkMujFtFl4mt/3hqeIX111gxLe9gJnJGWYAbF2tSSuz5t8
         72hvmrDNHsOLTokhghVFEd4jQnNdnyxqY1gCKywYCtI4voipv0L1GJAPzkZiwPnqvF16
         /DcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtwmI8sFr1Ej/dr8vG05HlL8oed4U8snNE+L2MT7WeqZhmz4fLfkNGgOo4OFypKSAnH1nznegL7BMITl8xJgES@lists.infradead.org, AJvYcCWXra6R4HbrtidBo18UdfpbOKylAV93unhFXKzi9AnnjLhFqhOkopAYkdyhMIUdf93Ml53k+pDRmCQkoxYfETQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7yjC5DMfR+eWk30pC0irYbeXGELwqz8syU5DVD/6rYO5F/5Ug
	SWWKaDPzp0kpsDIplf7qfpBsRZOCcilmN59svOZQ1EVYX6DUmsoOwGi1/aeZTH/FivDFYhDz8Wo
	Zi4Qo2WXBJmSkW8YdSCSe70agREEEJR7rqw==
X-Gm-Gg: ASbGncvHpLMMFMWgRTOUfJ106j4i3d37012zVv+YMTBmUtR+L8EtegtxTFs3KNNw7Wh
	dMp99zW3ANNJ5MgfEbi8qcUQXDuSFK9JYPdnNVgohronB0wvY4mAggoRF2FX02n9hF9ZUMhRMa7
	TNHtMG5ifCWKko+x3WV+jsrnOJO/8NcLXctr63XXJBqA==
X-Google-Smtp-Source: AGHT+IHeXX/ytyIIvpN2oIAb6FB+uwhRuxKdFeJOBggJqqTAJfOjXYxpwE1kJmxFrPksbUis4eMEEXus7Y5v6Tmz1/Q=
X-Received: by 2002:a05:6214:262f:b0:6fd:cbbb:b02 with SMTP id
 6a1803df08f44-6ffffd77b1emr97546376d6.15.1751071117860; Fri, 27 Jun 2025
 17:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250410163022.3695-1-ansuelsmth@gmail.com> <aF7xlqRLXlZu0DZr@makrotopia.org>
In-Reply-To: <aF7xlqRLXlZu0DZr@makrotopia.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Sat, 28 Jun 2025 02:38:25 +0200
X-Gm-Features: Ac12FXxOGlOHKTJ_xVAxIcad2hrEhIUVAWgcdm3E86cKjX76u9mT4U48z3XgCjA
Message-ID: <CA+_ehUwzyEXvOj2J2vXaSj0tSsEH-+cktHLkSZ1ieeuK5+NN-A@mail.gmail.com>
Subject: Re: [net-next PATCH 0/6] net: dsa: mt7530: modernize MIB handling + fix
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_173838_966451_91275EF4 
X-CRM114-Status: GOOD (  20.10  )
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

>
> Hi Christian,
>
> On Thu, Apr 10, 2025 at 06:30:08PM +0200, Christian Marangi wrote:
> > This small series modernize MIB handling for MT7530 and also
> > implement .get_stats64.
> >
> > It was reported that kernel and Switch MIB desync in scenario where
> > a packet is forwarded from a port to another. In such case, the
> > forwarding is offloaded and the kernel is not aware of the
> > transmitted packet. To handle this, read the counter directly
> > from Switch registers.
> >
> > Christian Marangi (6):
> >   net: dsa: mt7530: generalize read port stats logic
> >   net: dsa: mt7530: move pkt size and rx err MIB counter to rmon stats
> >     API
> >   net: dsa: mt7530: move pause MIB counter to eth_ctrl stats API
> >   net: dsa: mt7530: move pkt stats and err MIB counter to eth_mac stats
> >     API
> >   net: dsa: mt7530: move remaining MIB counter to define
> >   net: dsa: mt7530: implement .get_stats64
>
> After this series being applied I see lockdep warnings every time
> the interface counters are being read on MT7531 connected via MDIO:
>

Thanks for the report, I will try to fix this and post a followup
patch for this.
Also I assume this is only present for MDIO and MMIO is not affected.

> [  234.374708] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:579
> [  234.383200] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 3667, name: ifconfig
> [  234.391202] preempt_count: 1, expected: 0
> [  234.395226] INFO: lockdep is turned off.
> [  234.399150] CPU: 3 UID: 0 PID: 3667 Comm: ifconfig Tainted: G        W  O        6.16.0-rc1+ #0 NONE
> [  234.399158] Tainted: [W]=WARN, [O]=OOT_MODULE
> [  234.399160] Hardware name: Bananapi BPI-R3 (DT)
> [  234.399162] Call trace:
> [  234.399165]  show_stack+0x28/0x78 (C)
> [  234.399179]  dump_stack_lvl+0x68/0x8c
> [  234.399184]  dump_stack+0x14/0x1c
> [  234.399188]  __might_resched+0x138/0x250
> [  234.399197]  __might_sleep+0x44/0x80
> [  234.399201]  __mutex_lock+0x4c/0x934
> [  234.399209]  mutex_lock_nested+0x20/0x28
> [  234.399215]  mt7530_get_stats64+0x40/0x2ac
> [  234.399222]  dsa_user_get_stats64+0x2c/0x40
> [  234.399229]  dev_get_stats+0x44/0x1e0
> [  234.399237]  dev_seq_printf_stats+0x24/0xe0
> [  234.399244]  dev_seq_show+0x14/0x40
> [  234.399248]  seq_read_iter+0x368/0x464
> [  234.399257]  seq_read+0xd0/0xfc
> [  234.399263]  proc_reg_read+0xa8/0xf0
> [  234.399268]  vfs_read+0x98/0x2b0
> [  234.399275]  ksys_read+0x54/0xdc
> [  234.399280]  __arm64_sys_read+0x18/0x20
> [  234.399286]  invoke_syscall.constprop.0+0x4c/0xd0
> [  234.399293]  do_el0_svc+0x3c/0xd0
> [  234.399298]  el0_svc+0x34/0xa0
> [  234.399303]  el0t_64_sync_handler+0x104/0x138
> [  234.399308]  el0t_64_sync+0x158/0x15c
>
> Note that this only shows with some lock debugging options being set
> and may not actually be a problem, but I believe it anyway should be
> fixed somehow.
>
> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=y
> CONFIG_PROVE_LOCKING=y
> CONFIG_PROVE_RAW_LOCK_NESTING=y
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_RT_MUTEXES=y
> CONFIG_DEBUG_SPINLOCK=y
> CONFIG_DEBUG_MUTEXES=y
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
> CONFIG_DEBUG_RWSEMS=y
> CONFIG_DEBUG_LOCK_ALLOC=y
> CONFIG_LOCKDEP=y
> CONFIG_LOCKDEP_BITS=15
> CONFIG_LOCKDEP_CHAINS_BITS=16
> CONFIG_LOCKDEP_STACK_TRACE_BITS=19
> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=y
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # CONFIG_SCF_TORTURE_TEST is not set
> # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
>
> CONFIG_TRACE_IRQFLAGS=y
> CONFIG_TRACE_IRQFLAGS_NMI=y
> # CONFIG_DEBUG_IRQFLAGS is not set
> CONFIG_STACKTRACE=y
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
>
>
> Cheers
>
>
> Daniel

