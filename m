Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C961C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c3wDLxoVc+HEdX2GMJxvGVJZTBNah2ZOjTXwELNejXA=; b=YqJqr3Ct3cMtKZshlm0ZwGYRoc
	b3uC2rTPLKLJdGxSucG+2nez8z5+doIn1FjMYxVJlNGwMvOnleQVjl7aNsAmviVGrDU0NzdnOuAx7
	ETFn3INri04qFC4neTgIk8Vb/Tkez2b8rpRJKxNDr8x3jnuI9K8fL+mEuu1K5XukgXiozYvmFiet/
	v8dRh9gPz8QET/SRZyEsuvggUCNOdEAM5K6hfDKGUsfMb4cXat9z3lGTuHwG/PQaxEPb4WjMFfNOd
	qI3rgVnh6EWdGQo+cFJ74spJIlw4x69mYC95xYCRf6xLMn63/0Qv9zT696AKrAbvHnXDbJ6gw/+FU
	2mFQ7NKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebCb-00000005MCy-3MZV;
	Wed, 23 Jul 2025 15:16:17 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueb1T-00000005K3T-44d7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 15:04:49 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af0dc229478so488745266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 08:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753283086; x=1753887886;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3wDLxoVc+HEdX2GMJxvGVJZTBNah2ZOjTXwELNejXA=;
        b=oB0AJnYlZVBRxA7c0Wjnl02jljMdYG8oe56MRfV5z2F0BAzpuL87X09heWZv0f1YML
         cfAW29cgEjcmb0BEu0QgXrybXwhAfAd3FWiAcF20QbtALVIP9Jw4Tx3lAGH4oDG60gB9
         TkWlOAlZV8FENXeoq/VsuJmqc5FyiPbjdlzJCN/RGdSgrPJNXog2ONobtTdPceOvkmLG
         t5mDndaXNe7Z1NFR6m6N0WoMMqeFpoHotcLwd7gGTu/jNZDfzKvK5KdG8K1fo05bHYWG
         Sd8wlXMJ4/qXXjLv1HgzawSRNA8Qe4Kz+okFwtT3ajcON89FiPc2eBOCR0SgU9TTb1i0
         8CSw==
X-Gm-Message-State: AOJu0YxgNS3swtMUo+fQvp6mjNbbP8mCGeCLnHyy7u3ZMBuDeM0PZULk
	KwoVq6/NIue9scAmqpxXpC+0d4JzGg4HbH68/lpn22pqzrRq8vQ1imTf
X-Gm-Gg: ASbGncsy5J8DfdRjd+0kVk5kx1Iu3yQUh3iZbF9mZoV7fMHkQSSQrN9fPVZ62cacxLA
	efwDdrwUQs9DH4q8+tSmb9g3GHRpKRb+CiKEityc08cfn9GQ4PiPNC4GaSOUE1GGI1DVWuldV0Z
	UIdkKT3cbTnfrXbgzI+ULwX0d2zEOl2JLF9jvQ+2lwT4nS94izzhcZfcqGkn4Vl+5eZ4AxxrjKx
	lbqRgDTNCjkwqQ54XicmzvodtGOXme02hBwzfQfRx9QWMxdh0SbbNDkUqrjYGhVy6+auEmNfhwv
	mtpAeGk04G6bMvCGQFfihYDMOwmOa38vhDAgAJkB5i0Zt22vP9PnLFNfLhU+LlY+/CkhptENRjx
	y9xxNncQv6sam
X-Google-Smtp-Source: AGHT+IG4M07vIFs4hMRP/029gmdq+4cUNxE2P9XhlYCoD20ic0NnH4DJ8ZRKHcH+ho3414YcpwkJ5g==
X-Received: by 2002:a17:907:3d09:b0:ae3:a240:7ad2 with SMTP id a640c23a62f3a-af2f64bb5bbmr298750266b.2.1753283085272;
        Wed, 23 Jul 2025 08:04:45 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:6::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cadd8bbsm1053308066b.154.2025.07.23.08.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 08:04:44 -0700 (PDT)
Date: Wed, 23 Jul 2025 08:04:42 -0700
From: Breno Leitao <leitao@debian.org>
To: mst@redhat.com, jasowang@redhat.com, eperezma@redhat.com
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Subject: vhost: linux-next: crash at vhost_dev_cleanup()
Message-ID: <vosten2rykookljp6u6qc4hqhsqb6uhdy2iuhpl54plbq2tkr4@kphfpgst3e7c>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_080448_014037_6BE627E9 
X-CRM114-Status: UNSURE (   9.33  )
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

Hello,

I've seen a crash in linux-next for a while on my arm64 server, and
I decided to report.

While running stress-ng on linux-next, I see the crash below.

This is happening in a kernel configure with some debug options (KASAN,
LOCKDEP and KMEMLEAK).

Basically running stress-ng in a loop would crash the host in 15-20
minutes:
	# while (true); do stress-ng -r 10 -t 10; done
	
From the early warning "virt_to_phys used for non-linear address",
I suppose corrupted data is at vq->nheads.

Here is the decoded stack against 9798752 ("Add linux-next specific
files for 20250721")


	[  620.685144] [ T250731] VFIO - User Level meta-driver version: 0.3
	[  622.394448] [ T250254] ------------[ cut here ]------------
	[  622.413492] [ T250254] virt_to_phys used for non-linear address: 000000006e69fe64 (0xcfcecdcccbcac9c8)
	[  622.447771] [     T250254] WARNING: arch/arm64/mm/physaddr.c:15 at __virt_to_phys+0x64/0x90, CPU#57: stress-ng-dev/250254 
	[  622.487227] [ T250254] Modules linked in: vhost_vsock(E) vfio_iommu_type1(E) vfio(E) unix_diag(E) sch_fq(E) ghes_edac(E) tls(E) tcp_diag(E) inet_diag(E) act_gact(E) cls_bpf(E) nvidia_cspmu(E) ipmi_ssif(E) coresight_trbe(E) arm_cspmu_module(E) arm_smmuv3_pmu(E) ipmi_devintf(E) coresight_stm(E) coresight_funnel(E) coresight_etm4x(E) coresight_tmc(E) stm_core(E) ipmi_msghandler(E) coresight(E) cppc_cpufreq(E) sch_fq_codel(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) sm3_ce(E) sha3_ce(E) spi_tegra210_quad(E) vhost_net(E) tap(E) tun(E) vhost(E) vhost_iotlb(E) mpls_gso(E) mpls_iptunnel(E) mpls_router(E) fou(E) acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E) [last unloaded: test_bpf(E)]
	[  622.734524] [ T250254] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE, [N]=TEST
	[  622.734525] [ T250254] Hardware name: ...
	[  622.734526] [ T250254] pstate: 63401009 (nZCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
	[  622.734529] [     T250254] pc : __virt_to_phys (/home/user/Devel/linux-next/arch/arm64/mm/physaddr.c:?) 
	[  622.734531] [     T250254] lr : __virt_to_phys (/home/user/Devel/linux-next/arch/arm64/mm/physaddr.c:?) 
	[  622.734533] [ T250254] sp : ffff800158e8fc60
	[  622.734534] [ T250254] x29: ffff800158e8fc60 x28: ffff0034a7cc7900 x27: 0000000000000000
	[  622.734537] [ T250254] x26: 0000000000000000 x25: ffff0034a7cc7900 x24: 00000000040e001f
	[  622.734539] [ T250254] x23: ffff0010858afb00 x22: cfcecdcccbcac9c8 x21: ffff0033526a01e0
	[  622.734541] [ T250254] x20: 0000000000008000 x19: ffcecdcccbcac9c8 x18: ffff80008149c8e4
	[  622.734543] [ T250254] x17: 0000000000000001 x16: 0000000000000000 x15: 0000000000000003
	[  622.734545] [ T250254] x14: ffff800082962e78 x13: 0000000000000003 x12: ffff003bc6231630
	[  622.734546] [ T250254] x11: 0000000000000000 x10: 0000000000000000 x9 : ed44a220ae716b00
	[  622.734548] [ T250254] x8 : 0001000000000000 x7 : 0720072007200720 x6 : ffff80008018710c
	[  622.734550] [ T250254] x5 : 0000000000000001 x4 : 00000090ecc72ac0 x3 : 0000000000000000
	[  622.734552] [ T250254] x2 : 0000000000000000 x1 : ffff800081a72bc6 x0 : 000000000000004f
	[  622.734554] [ T250254] Call trace:
	[  622.734555] [     T250254] __virt_to_phys (/home/user/Devel/linux-next/arch/arm64/mm/physaddr.c:?) (P)
	[  622.734557] [     T250254] kfree (/home/user/Devel/linux-next/./include/linux/mm.h:1180 /home/user/Devel/linux-next/mm/slub.c:4871) 
	[  622.734562] [     T250254] vhost_dev_cleanup (/home/user/Devel/linux-next/drivers/vhost/vhost.c:506 /home/user/Devel/linux-next/drivers/vhost/vhost.c:542 /home/user/Devel/linux-next/drivers/vhost/vhost.c:1214) vhost 
	[  622.734571] [     T250254] vhost_vsock_dev_release (/home/user/Devel/linux-next/drivers/vhost/vsock.c:756) vhost_vsock 
	[  622.734575] [     T250254] __fput (/home/user/Devel/linux-next/fs/file_table.c:469) 
	[  622.734578] [     T250254] fput_close_sync (/home/user/Devel/linux-next/fs/file_table.c:?) 
	[  622.734579] [     T250254] __arm64_sys_close (/home/user/Devel/linux-next/fs/open.c:1589 /home/user/Devel/linux-next/fs/open.c:1572 /home/user/Devel/linux-next/fs/open.c:1572) 
	[  622.734584] [     T250254] invoke_syscall (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:50) 
	[  622.734589] [     T250254] el0_svc_common (/home/user/Devel/linux-next/./include/linux/thread_info.h:135 /home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:140) 
	[  622.734591] [     T250254] do_el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:152) 
	[  622.734594] [     T250254] el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:169 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:182 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:880) 
	[  622.734600] [     T250254] el0t_64_sync_handler (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:958) 
	[  622.734603] [     T250254] el0t_64_sync (/home/user/Devel/linux-next/arch/arm64/kernel/entry.S:596) 
	[  622.734605] [ T250254] irq event stamp: 0
	[  622.734606] [     T250254] hardirqs last enabled at (0): 0x0 
	[  622.734610] [     T250254] hardirqs last disabled at (0): copy_process (/home/user/Devel/linux-next/kernel/fork.c:?) 
	[  622.734614] [     T250254] softirqs last enabled at (0): copy_process (/home/user/Devel/linux-next/kernel/fork.c:?) 
	[  622.734616] [     T250254] softirqs last disabled at (0): 0x0 
	[  622.734618] [ T250254] ---[ end trace 0000000000000000 ]---
	[  622.734697] [ T250254] Unable to handle kernel paging request at virtual address 003ff3b33312f288
	[  622.734700] [ T250254] Mem abort info:
	[  622.734701] [ T250254]   ESR = 0x0000000096000004
	[  622.734702] [ T250254]   EC = 0x25: DABT (current EL), IL = 32 bits
	[  622.734704] [ T250254]   SET = 0, FnV = 0
	[  622.734705] [ T250254]   EA = 0, S1PTW = 0
	[  622.734706] [ T250254]   FSC = 0x04: level 0 translation fault
	[  622.734708] [ T250254] Data abort info:
	[  622.734709] [ T250254]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
	[  622.734711] [ T250254]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
	[  622.734712] [ T250254]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
	[  622.734713] [ T250254] [003ff3b33312f288] address between user and kernel address ranges
	[  622.734715] [ T250254] Internal error: Oops: 0000000096000004 [#1]  SMP
	[  622.734718] [ T250254] Modules linked in: vhost_vsock(E) vfio_iommu_type1(E) vfio(E) unix_diag(E) sch_fq(E) ghes_edac(E) tls(E) tcp_diag(E) inet_diag(E) act_gact(E) cls_bpf(E) nvidia_cspmu(E) ipmi_ssif(E) coresight_trbe(E) arm_cspmu_module(E) arm_smmuv3_pmu(E) ipmi_devintf(E) coresight_stm(E) coresight_funnel(E) coresight_etm4x(E) coresight_tmc(E) stm_core(E) ipmi_msghandler(E) coresight(E) cppc_cpufreq(E) sch_fq_codel(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) sm3_ce(E) sha3_ce(E) spi_tegra210_quad(E) vhost_net(E) tap(E) tun(E) vhost(E) vhost_iotlb(E) mpls_gso(E) mpls_iptunnel(E) mpls_router(E) fou(E) acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E) [last unloaded: test_bpf(E)]
	[  622.734740] [ T250254] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE, [N]=TEST
	[  622.734740] [ T250254] Hardware name: ...
	[  622.734741] [ T250254] pstate: 63401009 (nZCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
	[  622.734742] [     T250254] pc : kfree (/home/user/Devel/linux-next/./include/linux/page-flags.h:284 /home/user/Devel/linux-next/./include/linux/mm.h:1182 /home/user/Devel/linux-next/mm/slub.c:4871) 
	[  622.734745] [     T250254] lr : kfree (/home/user/Devel/linux-next/./include/linux/mm.h:1180 /home/user/Devel/linux-next/mm/slub.c:4871) 
	[  622.734747] [ T250254] sp : ffff800158e8fc80
	[  622.734748] [ T250254] x29: ffff800158e8fc90 x28: ffff0034a7cc7900 x27: 0000000000000000
	[  622.734749] [ T250254] x26: 0000000000000000 x25: ffff0034a7cc7900 x24: 00000000040e001f
	[  622.734751] [ T250254] x23: ffff0010858afb00 x22: cfcecdcccbcac9c8 x21: ffff0033526a01e0
	[  622.734752] [ T250254] x20: 003ff3b33312f280 x19: ffff80000acd1a20 x18: ffff80008149c8e4
	[  622.734754] [ T250254] x17: 0000000000000001 x16: 0000000000000000 x15: 0000000000000003
	[  622.734755] [ T250254] x14: ffff800082962e78 x13: 0000000000000003 x12: ffff003bc6231630
	[  622.734757] [ T250254] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffffdfc0000000
	[  622.734758] [ T250254] x8 : 003ff3d37312f280 x7 : 0720072007200720 x6 : ffff80008018710c
	[  622.734760] [ T250254] x5 : 0000000000000001 x4 : 00000090ecc72ac0 x3 : 0000000000000000
	[  622.734761] [ T250254] x2 : 0000000000000000 x1 : ffff800081a72bc6 x0 : ffcf4dcccbcac9c8
	[  622.734763] [ T250254] Call trace:
	[  622.734763] [     T250254] kfree (/home/user/Devel/linux-next/./include/linux/page-flags.h:284 /home/user/Devel/linux-next/./include/linux/mm.h:1182 /home/user/Devel/linux-next/mm/slub.c:4871) (P)
	[  622.734766] [     T250254] vhost_dev_cleanup (/home/user/Devel/linux-next/drivers/vhost/vhost.c:506 /home/user/Devel/linux-next/drivers/vhost/vhost.c:542 /home/user/Devel/linux-next/drivers/vhost/vhost.c:1214) vhost 
	[  622.734769] [     T250254] vhost_vsock_dev_release (/home/user/Devel/linux-next/drivers/vhost/vsock.c:756) vhost_vsock 
	[  622.734771] [     T250254] __fput (/home/user/Devel/linux-next/fs/file_table.c:469) 
	[  622.734772] [     T250254] fput_close_sync (/home/user/Devel/linux-next/fs/file_table.c:?) 
	[  622.734773] [     T250254] __arm64_sys_close (/home/user/Devel/linux-next/fs/open.c:1589 /home/user/Devel/linux-next/fs/open.c:1572 /home/user/Devel/linux-next/fs/open.c:1572) 
	[  622.734776] [     T250254] invoke_syscall (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:50) 
	[  622.734778] [     T250254] el0_svc_common (/home/user/Devel/linux-next/./include/linux/thread_info.h:135 /home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:140) 
	[  622.734781] [     T250254] do_el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:152) 
	[  622.734783] [     T250254] el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:169 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:182 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:880) 
	[  622.734787] [     T250254] el0t_64_sync_handler (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:958) 
	[  622.734790] [     T250254] el0t_64_sync (/home/user/Devel/linux-next/arch/arm64/kernel/entry.S:596) 
	[ 622.734792] [ T250254] Code: f2dffbe9 927abd08 cb141908 8b090114 (f9400688)
	All code
	========
	0:*	e9 fb df f2 08       	jmp    0x8f2e000		<-- trapping instruction
	5:	bd 7a 92 08 19       	mov    $0x1908927a,%ebp
	a:	14 cb                	adc    $0xcb,%al
	c:	14 01                	adc    $0x1,%al
	e:	09 8b 88 06 40 f9    	or     %ecx,-0x6bff978(%rbx)

	Code starting with the faulting instruction
	===========================================
	0:	88 06                	mov    %al,(%rsi)
	2:	40 f9                	rex stc 
	[  622.734795] [ T250254] SMP: stopping secondary CPUs
	[  622.735089] [ T250254] Starting crashdump kernel...
	[  622.735091] [ T250254] Bye!


