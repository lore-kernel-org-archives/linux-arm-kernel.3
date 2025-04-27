Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308BCC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MIdt4B/6I9CULlR6XbbjrilJaaHVCAilK44z1GMyFEw=; b=yspI78tnWp0yQq+ollo4yx8ZX7
	kaYtZlaBb6Ue8DNIkxEwhofsa2gaiXdSAt1uNe8marRR4LNHHY1nZDWIP+qARS5HcFWL3E12fmBb4
	OtDzMj/sEE+xdxIN20BHqB+tloR7qe6gHNov5UaDFDczgezknSKnEUrlAfbsClGItcZ8racexk1e8
	GbZMXpHHb/cvr/6RIIkcN9hvtgtGY00xYyhOzz3KfP+m+N8Cxabqo/DJMVMjyx1bmeJzWiGM9kQW/
	1ROtlvAu0WBWPxPsOTDRc4JrH5XQuIN1Pt+GoQSLdphqQzLZDaHRB1q22rZ/owzVYox+s4t/RNFyI
	uJKQ+XVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92pp-00000003eLB-2mLA;
	Sun, 27 Apr 2025 14:18:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92nq-00000003eAZ-0QCy
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 27 Apr 2025 14:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MIdt4B/6I9CULlR6XbbjrilJaaHVCAilK44z1GMyFEw=; b=miMBnxFpagupH23M7rSVhHCaqP
	snExh5DfQJxI/K5wBWuwknylLIOmdp/Os3UtpXrAWR37aufievxUT2GDL2qbTDN1/+B7wu4OVj2vU
	Z89Y3kAM463RGODaq06WoMoBqF7yHUwu/xytgwuSYxkjUzD4YbpaZqesx1bC3KGOkxs10EY07h6/L
	7yAgsLd3yayvXkc4TdJERbbnopmTSwuOELACxzxSmJ6/DVmei/Z3nlZOKnOdIviTsoVGvjf+GEjVd
	fwGsLgrrfkFch6CHh5rYKLOmdNrVLmF21R66sLB8zPf6BqPKfD4Lnlgdn4dHu3DG+LwhbwdXQd76T
	ZZBeQPUQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u92nk-0000000CTcs-2rHS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 14:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745763348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=MIdt4B/6I9CULlR6XbbjrilJaaHVCAilK44z1GMyFEw=;
	b=g44TN8H5tK2TQIzuF9LghKTinCz3pdX11wQ8JHLJ3l5/YAUSowAR85k0pIjSMb/G3gGFfe
	2UW0r65U7ahkaQuMhr8MeJ90zpTQUV4j/M4MpfHsbvY1DLKb92Um9xTRbRZh+SaOskj1qz
	p32TZXZRbXW9A6qKseZWpVx811hTPDk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745763356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=MIdt4B/6I9CULlR6XbbjrilJaaHVCAilK44z1GMyFEw=;
	b=Y4nlO1YajcMwvdK46QCgNBSociHMULuT6u1/yCBch7gn9vWlayne19Gl+oVYqDw+CrGZz/
	6RrJ4QAj+g4ShLe9V8LVzP/a/+kdR9QKqXnZfPWGwVaTmle/0pldLWTfEu005kXTOpKpP9
	PQ1+SRAjgmZ9lOc9waiMojEV5DfWC8Q=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-3Yv1N4TCOuilOA1CFITVoQ-1; Sun, 27 Apr 2025 10:15:46 -0400
X-MC-Unique: 3Yv1N4TCOuilOA1CFITVoQ-1
X-Mimecast-MFC-AGG-ID: 3Yv1N4TCOuilOA1CFITVoQ_1745763345
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1442e039eeso2267719a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 07:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763345; x=1746368145;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIdt4B/6I9CULlR6XbbjrilJaaHVCAilK44z1GMyFEw=;
        b=fRSoukiA1fjGh/8BCGbWT5NJwWKMlBXHYB4dc/fT+ibJo7nXk8O9WYg8/y4B3C5Ds9
         pAIz2r/gWBDtZkt6zbJFNn+rIM2vVDGa8rcb1lIVxhB5fIvMhF2RynHPIIW7DUg6h6kd
         2GOHo/Fo1J7BU1e8pg10o55WxJlilAHK1EbuZKQsPkW/1/km415DASikiPdQ1sXWNBgv
         zyUoiken8G3S5m7h8slkVtsrO8NdSXFwQAQLPMkuqHn7Cu6rdV1Ku7VgpAX/gXC+2gQv
         FuLJ5DsljREUpGPSU9KD9JKp54Y9jzb9E3JygoAhPHath9Bf8gqe5wgUyG8NGKcbolGa
         sVeQ==
X-Gm-Message-State: AOJu0YxkHNLRo2UL9WS3YXSlLdFzHQXauubF6NzWk6GbmInBxIVhjFNR
	S64nN6eH8VlkzD/CEdfRvo4NSpJU1onELSxB4E0S/ljKhc3IEDGXJeMQkAveNz/0epm0sAh6I5m
	YQR8O1udmnLk9OvO67XVe1N+ePeiEmlcWHoLGzfBGwuQbhXVFpKG+iA24LqrPxGnvtzdEZJJtKc
	feNpVK9l7JYCDW2npfVZE+U9r1J8iaBIuQszw2O2NXjEQtZYT87HID
X-Gm-Gg: ASbGncsU/mCvfJbSTxNZvg5Cxj+DEnID9Vu+TyiGc0+4R0U4HYVx/dKXoKf9cd2wy1/
	LgzhpLSuAwUn29eayL8YhRTmZZ2CYIJyu6jdAOITe2xseZonea8Nw8CBTXG/KBw6Si3QAc5htLs
	BU2xo2uDxc/XgT9QL+7QPSQCjIl2priXPeMwpMiM0ZGoILk5C4SzB/EsdyksMySX8m5IH8PtgzX
	dv5GGE/YmIfbhWaBiBR0zH9F5JDE+bPOLjAFv2h69I7GCN+6UxS7EymqhKt7I8J+Al4ib9HUVro
	8BygA/87h7gtReRYHQWtZ4FIKwk/LcvZtxyD7R5j8xz31tGqcSCy
X-Received: by 2002:a17:903:1b6d:b0:220:e338:8d2 with SMTP id d9443c01a7336-22dbf5ea7femr117031425ad.21.1745763345026;
        Sun, 27 Apr 2025 07:15:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM4cJhO0FRDxlg+HMR2gflqzryby41iCWr3xFEFDXotv09J1a/HMVKJVolEsbKtUcvXkDfUw==
X-Received: by 2002:a17:903:1b6d:b0:220:e338:8d2 with SMTP id d9443c01a7336-22dbf5ea7femr117031055ad.21.1745763344502;
        Sun, 27 Apr 2025 07:15:44 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a1dsm64773605ad.140.2025.04.27.07.15.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:15:44 -0700 (PDT)
Date: Sun, 27 Apr 2025 22:15:40 +0800
From: Zorro Lang <zlang@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Subject: BUG: KASAN: global-out-of-bounds in is_midr_in_range_list+0x29c/0x2e0
Message-ID: <20250427141540.yyh4lht6tzg2l4is@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qFn3SrwVeCgr_zyOgv21wUTwJcBr59Jv1Gv2byz0tBc_1745763345
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_151612_968327_DE9FFBA0 
X-CRM114-Status: UNSURE (   6.72  )
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

Hi,

I'm from fstests@ maillist, my latest fstests [2] regression test on
mainline linux v6.15-rc3+ (HEAD=f1a3944c860b0615d0513110d8cf62bb94adbb41)
sometimes hit below KASAN bug [1] on aarch64 by running generic/650 [3].
So report this issue to arm64 list to get review :)

Thanks,
Zorro


[1]
[16982.135841] run fstests generic/650 at 2025-04-26 15:57:03
[16983.655106] evm: overlay not supported
[16983.838316] psci: CPU114 killed (polled 0 ms)
[16984.610264] psci: CPU32 killed (polled 0 ms)
[16985.855711] psci: CPU19 killed (polled 0 ms)
[16986.578909] psci: CPU48 killed (polled 0 ms)
[16987.329376] psci: CPU1 killed (polled 0 ms)
[16988.071610] psci: CPU0 killed (polled 0 ms)
[16989.675527] XFS (sda5): Unmounting Filesystem 73595b5c-b0eb-4f47-9d60-41cba8eb626c
[16989.894868] XFS (sda5): Mounting V5 Filesystem 73595b5c-b0eb-4f47-9d60-41cba8eb626c
[16989.935608] XFS (sda5): Ending clean mount
[16990.913789] psci: CPU98 killed (polled 0 ms)
[16991.624018] psci: CPU94 killed (polled 0 ms)
[16992.334849] ==================================================================
[16992.334865] BUG: KASAN: global-out-of-bounds in is_midr_in_range_list+0x29c/0x2e0
[16992.334888] Read of size 4 at addr ffffd4ca56f8fb18 by task swapper/94/0

[16992.334905] CPU: 94 UID: 0 PID: 0 Comm: swapper/94 Kdump: loaded Tainted: G        W           6.15.0-rc3+ #1 PREEMPT(voluntary) 
[16992.334922] Tainted: [W]=WARN
[16992.334926] Hardware name: GIGABYTE R152-P31-00/MP32-AR1-00, BIOS F31n (SCP: 2.10.20220810) 09/30/2022
[16992.334932] Call trace:
[16992.334937]  show_stack+0x34/0x98 (C)
[16992.334952]  dump_stack_lvl+0xa8/0xe8
[16992.334965]  print_address_description.constprop.0+0x90/0x370
[16992.334983]  print_report+0x108/0x1f8
[16992.334996]  kasan_report+0x8c/0x1b0
[16992.335007]  __asan_report_load4_noabort+0x20/0x30
[16992.335019]  is_midr_in_range_list+0x29c/0x2e0
[16992.335034]  spectre_bhb_loop_affected+0x28/0xa0
[16992.335047]  is_spectre_bhb_affected+0x128/0x160
[16992.335060]  verify_local_cpu_caps+0x140/0x358
[16992.335070]  verify_local_cpu_capabilities+0x20/0x2a8
[16992.335081]  check_local_cpu_capabilities+0x28/0x58
[16992.335092]  secondary_start_kernel+0x80/0x180
[16992.335104]  __secondary_switched+0xc0/0xc8

[16992.335120] The buggy address belongs to the variable:
[16992.335124]  spectre_bhb_k132_list.10+0x18/0x40

[16992.335339] The buggy address belongs to the virtual mapping at
                [ffffd4ca56f70000, ffffd4ca57df0000) created by:
                paging_init+0x3b4/0x480

[16992.335360] The buggy address belongs to the physical page:
[16992.335366] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x8015ad8f
[16992.335376] flags: 0x2fffff00002000(reserved|node=0|zone=2|lastcpupid=0xfffff)
[16992.335392] raw: 002fffff00002000 fffffe1fc36b63c8 fffffe1fc36b63c8 0000000000000000
[16992.335400] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
[16992.335405] page dumped because: kasan: bad access detected

[16992.335412] Memory state around the buggy address:
[16992.335417]  ffffd4ca56f8fa00: 00 00 00 00 00 00 00 00 00 00 00 00 00 04 f9 f9
[16992.335424]  ffffd4ca56f8fa80: f9 f9 f9 f9 00 00 00 00 00 00 f9 f9 f9 f9 f9 f9
[16992.335430] >ffffd4ca56f8fb00: 00 00 00 f9 f9 f9 f9 f9 00 00 00 f9 f9 f9 f9 f9
[16992.335435]                             ^
[16992.335440]  ffffd4ca56f8fb80: 00 00 00 00 00 00 00 00 00 00 00 00 00 04 f9 f9
[16992.335446]  ffffd4ca56f8fc00: f9 f9 f9 f9 00 00 00 00 00 00 00 00 00 00 04 f9
[16992.335451] ==================================================================
[16992.335456] Disabling lock debugging due to kernel taint
[16992.335464] CPU features: kernel page table isolation forced ON by kpti command line option
[16992.335484] Detected PIPT I-cache on CPU94
[16992.335628] GICv3: CPU94: found redistributor 270000 region 0:0x0000100100b00000
[16992.335723] CPU94: Booted secondary processor 0x0000270000 [0x413fd0c1]
[16993.795562] psci: CPU80 killed (polled 0 ms)
[16995.515686] psci: CPU24 killed (polled 0 ms)
[16996.794949] psci: CPU9 killed (polled 0 ms)
[16997.494378] psci: CPU90 killed (polled 0 ms)


[2]
https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/

[3]
https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/tree/tests/generic/650


