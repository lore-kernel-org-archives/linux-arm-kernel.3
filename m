Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA026E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IyxAcHFAxcTmG9nYaEBKdzxQiLgVkSftBgEC1aePQNU=; b=UljB+YoUJJy3uYXJ0SboG29vWn
	x/0hSJG/CunK3GwliAuY5LxKJWffmnGSIN1n8DpJTCDnt1eS7vTLuwI0xBhcPTRx7HiKh+scKTKRi
	9CCyZ1NKv2b0o+cGmXiP0VUQJU/zHvOdf4UUSj2C2xMfLW254jmLgiDJDUQ4ZwvY7mVCHkiR8JoiU
	CbqMgcYEZasYpXaPElDCHa1ZhIDlzNdgaqctxnmGKri4neIjUJxImlvHxO4IjDaKSwCQBB/P+XXPj
	eGYD9/FMU+PNSh7Yu/fpfCz1dMwwZswaalM+Ez4IU8Fld/xGW0E0ZXUMBV//9pAJoH25m5cgm4NH2
	Bh2IzRog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2JK-0000000Bm9Q-470Q;
	Tue, 24 Dec 2024 10:38:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2I8-0000000BlyY-371S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:37:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436230de7a3so7143845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 02:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735036650; x=1735641450; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IyxAcHFAxcTmG9nYaEBKdzxQiLgVkSftBgEC1aePQNU=;
        b=UoPjTi9UCxUwutbe/vhbBwIHTmhKMYJNtf7E+F1JDjGsqcrNov9VulqG2QUKhu33s1
         h26B9Wnjeqmhx6JwOPD5Rll//lVUmh2q010n47eTO9RiXBWGGHuZGco6KaZMI89DqoIZ
         xLL49wqgoauNtsE8444GPB6Zi+vlobcXTZKuH82XQR2GSL4nGd6llT4jrLDLoOD3ubaJ
         5LbtvVnc/pODKbUQ+1ugFVbjSVF0hrSho8c+u4+VKJT25v63gWAtOrEQ/flBBMmnCY3t
         iqnA7hPi+kpAsJ5vt8B+JwfC4ih2oxGIZqDuiSkRevDT0QDWIGP3baKlKma/VaiVWsIN
         k7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735036650; x=1735641450;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyxAcHFAxcTmG9nYaEBKdzxQiLgVkSftBgEC1aePQNU=;
        b=vLEl30ZdYHreP8FtQFEfcQxeUcxu/0ttPSgZibRKQDcW/OGQ+guJT0zbyG4AVpBoMv
         9XqxgAT1/MZ7n4CXUoZjedoG4Ydz9kAecNzHgtxGJ8QUqZdTR4Dbh12Ok1EybGcPWXv6
         qgDL9VcuW2igB767d6QBTpVNPow6XJ9f3tMXDaXN4AKMLMLZe2wCd0Tw4GN14PUcKp3u
         M8kOZDQx/9jfgjAmuui85aYJvg1mXxMW3CVkcwxWzJ1cPbxxpYqSGrk0TBCrAq4M5mr/
         thTvDHcocUQBfI9uhvpZvibx58Rk5ZdHxtbHABXyBEq743j9A9qoUtWTE8zxkDN4yI0B
         jZFw==
X-Forwarded-Encrypted: i=1; AJvYcCV5/TR6CqSEgaa5dK9VsiqCltcQZehldcLsTx0oYXHy/ZGhwJle8/RBX6kWOYiDoQclo7fIo3Bj1AKgIsVa8NRP@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk0HmVm8uYUNfzIg25JcHlAj4NTyqjFkGuxh3O2jpHoFfKxqaT
	JQH/g+Uw0ssHHrjgk2CWhbpiVr/rwxOlmM8dMyks1tkNJHUwaH4cx0wI98tVxIA+y3Hrns4PyJe
	iWKXpeMchjQmHWtavJ0tXwTt57NGImwJ4
X-Gm-Gg: ASbGncsizlRbKh8TS15rYFmpvzRwpQDwJhx8nHkC2zIdgR4RYdRMB3LCEP6RZQt69db
	diGuCymq0q0KbvhdOzqMdzawqPQpqF/xYJlFMauk=
X-Google-Smtp-Source: AGHT+IEMvWGZrOguXRKiIfrO1s4mFpUfCni8a5LMoHYf3eAijd7XyaM8lD+Gyy/HhZiUzhDFzaP65UgKaH0VglQWwRs=
X-Received: by 2002:a05:6000:178c:b0:376:2e3e:e6d4 with SMTP id
 ffacd0b85a97d-38a221ea815mr4867074f8f.5.1735036650048; Tue, 24 Dec 2024
 02:37:30 -0800 (PST)
MIME-Version: 1.0
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 24 Dec 2024 12:37:19 +0200
Message-ID: <CAFpOueQyztUyLgPwGGpreJLmgmhQLbTqdtAv_WB7oxYh-88aNw@mail.gmail.com>
Subject: Issues with kexec on arm64
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_023732_786238_C4FB7457 
X-CRM114-Status: GOOD (  10.58  )
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

I'm encountering kernel panics / system hangs when attempting to
kexec a vmlinux file on arm64 architecture.

It happens both on qemu and on real hardware.

These issues occur on all kernels from v4.19 to the latest mainline.
A sample panic output looks as follows:
  kernel BUG at arch/arm64/mm/mmu.c:217!
  Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
  CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0 #292
  Hardware name: linux,dummy-virt (DT)
  pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : __create_pgd_mapping+0xe8/0x3b0
  lr : __create_pgd_mapping+0x44/0x3b0
  sp : fffffe00804d3c20
  x29: fffffe00804d3c20 x28: fffffe0080620000 x27: fffffffefdbc0000
  x26: fffffe0080300000 x25: 0000000040010000 x24: fffffffefdbc8020
  x23: fffffe0080010000 x22: 0000000000000040 x21: fffffe0080010000
  x20: fffffe0080300000 x19: 0040000000000783 x18: 0000000000000000
  x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
  x14: fffffffefdde0000 x13: fffffe00804d3c78 x12: 0000000000001d68
  x11: 0000000000001d64 x10: fffffe00804d3c2c x9 : fffffffefdde0000
  x8 : 0000000040420000 x7 : 0000000000001d68 x6 : 0000000000000000
  x5 : fffffe00a0010000 x4 : 0000000000001004 x3 : fffffe0480010000
  x2 : fffffe00804f7ec0 x1 : 0000000000000000 x0 : 0000000000000000
  Call trace:
   __create_pgd_mapping+0xe8/0x3b0
   map_kernel_segment+0x74/0xb0
   paging_init+0xec/0x4f8
   setup_arch+0x234/0x52c
   start_kernel+0x64/0x500
   __primary_switched+0xb4/0xbc
  Code: f9400300 92400400 f1000c1f 54000060 (d4210000)
  ---[ end trace 0000000000000000 ]---
  Kernel panic - not syncing: Oops - BUG: Fatal exception

I bisected those panics to 8eb7e28d4c642c310f25c18f80a44dd4b01c694e
("arm64/mm: move runtime pgds to rodata"), which was added on v4.19.

I also reconstructed the full call trace (by adding "noinline" to the
relevant functions):
  alloc_init_cont_pte+0x6c/0x1e0
  init_pmd+0x154/0x1c8
  alloc_init_cont_pmd+0x11c/0x174
  alloc_init_pud+0xc4/0x148
  __create_pgd_mapping+0xa8/0x130
  map_kernel_segment+0xc8/0x168
  map_kernel+0x98/0x1a8
  paging_init+0x7c/0x418
  setup_arch+0x224/0x570
  start_kernel+0x5c/0x4f0

My understanding is that the panic occurs inside alloc_init_cont_pte,
at the BUG_ON(pmd_bad(..)) line.

Hello,

I see kernel panics / system hangs when I try to kexec a vmlinux file
on arm64 architecture.

It happens both on qemu and on real hardware.

Those issues occur on all kernels from v4.19 to mainline inclusive.
A sample panic output looks as follows:
  kernel BUG at arch/arm64/mm/mmu.c:217!
  Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
  CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0 #292
  Hardware name: linux,dummy-virt (DT)
  pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : __create_pgd_mapping+0xe8/0x3b0
  lr : __create_pgd_mapping+0x44/0x3b0
  sp : fffffe00804d3c20
  x29: fffffe00804d3c20 x28: fffffe0080620000 x27: fffffffefdbc0000
  x26: fffffe0080300000 x25: 0000000040010000 x24: fffffffefdbc8020
  x23: fffffe0080010000 x22: 0000000000000040 x21: fffffe0080010000
  x20: fffffe0080300000 x19: 0040000000000783 x18: 0000000000000000
  x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
  x14: fffffffefdde0000 x13: fffffe00804d3c78 x12: 0000000000001d68
  x11: 0000000000001d64 x10: fffffe00804d3c2c x9 : fffffffefdde0000
  x8 : 0000000040420000 x7 : 0000000000001d68 x6 : 0000000000000000
  x5 : fffffe00a0010000 x4 : 0000000000001004 x3 : fffffe0480010000
  x2 : fffffe00804f7ec0 x1 : 0000000000000000 x0 : 0000000000000000
  Call trace:
   __create_pgd_mapping+0xe8/0x3b0
   map_kernel_segment+0x74/0xb0
   paging_init+0xec/0x4f8
   setup_arch+0x234/0x52c
   start_kernel+0x64/0x500
   __primary_switched+0xb4/0xbc
  Code: f9400300 92400400 f1000c1f 54000060 (d4210000)
  ---[ end trace 0000000000000000 ]---
  Kernel panic - not syncing: Oops - BUG: Fatal exception

I bisected those panics to 8eb7e28d4c642c310f25c18f80a44dd4b01c694e
("arm64/mm: move runtime pgds to rodata"), which was added on v4.19.

I also reconstructed the full call trace (by adding "noinline" to the
relevant functions):
  alloc_init_cont_pte+0x6c/0x1e0
  init_pmd+0x154/0x1c8
  alloc_init_cont_pmd+0x11c/0x174
  alloc_init_pud+0xc4/0x148
  __create_pgd_mapping+0xa8/0x130
  map_kernel_segment+0xc8/0x168
  map_kernel+0x98/0x1a8
  paging_init+0x7c/0x418
  setup_arch+0x224/0x570
  start_kernel+0x5c/0x4f0

My understanding is that the panic occurs inside alloc_init_cont_pte,
at the BUG_ON(pmd_bad(..)) line.

To run the qemu VM I use the following script:
  APPEND="earlycon console=ttyAMA0 loglevel=8"
  qemu-system-aarch64 \
    -M virt \
    -cpu cortex-a53 \
    -smp 4 \
    -m 4096 \
    -kernel ~/vmshare/Image \
    -initrd ~/vmshare/rootfs.cpio \
    -nographic \
    -append "${APPEND}" \
    -fsdev local,id=vmshare,path=$HOME/vmshare,security_model=mapped,multidevs=remap
\
    -device virtio-9p-pci,fsdev=vmshare,mount_tag=vmshare \

I built the root filesystem using buildroot 2024.08.2, using the following
defconfig:
  BR2_aarch64=y
  BR2_ARM64_PAGE_SIZE_64K=y
  BR2_KERNEL_HEADERS_4_19=y
  BR2_PACKAGE_HOST_GDB=y
  BR2_GDB_VERSION_15=y
  BR2_PACKAGE_KEXEC=y
  BR2_PACKAGE_KEXEC_ZLIB=y
  BR2_TARGET_ROOTFS_CPIO=y
  BR2_PACKAGE_HOST_KMOD=y

To kexec the file I use the following command:
  kexec -d -c -l /media/vmshare/vmlinux \
    --initrd=/media/vmshare/rootfs.cpio \
    --reuse-cmdline \
    && kexec -d -e

Thanks,
Itai Handler

