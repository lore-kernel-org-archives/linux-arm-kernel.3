Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE4CC36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ocw3fLNrrR6m3zSnxHaViU7nn/Q0W3Q5BAYr9jcJ8fw=; b=j99UjS12foTNO1PFSW6avA9cXG
	wQR7wcWVHLIwCgx6TZzpvTlmEB6QJQg9j97AkCZqKavYek89xVBJ0WYGRo/94jxikyh70167eQyJH
	RY2kBwY3uRW77eWN9PTZ6SYDwRfX+ze0MQ8dCSIs4yoJZMYF1MexSfK1ocedEcigaLHf8Nmr7HXLc
	aeB4N89BCPGJWALykYz29MGLvMEEghuhOgl2+EOinkJs425tshsKL9fC+ibAmAFACv5ykGIp++cIV
	nv5mz5m53R8hsfa6Tr2Vv6DqjFeh4Is4kxfLmAmJ6Mse44uVFPt6eVCiO9qtuups0WSHkPrFzAwWO
	2K29VgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDIi-0000000BpwL-2I5J;
	Thu, 20 Mar 2025 10:39:00 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDFI-0000000BpRW-24qN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 10:35:29 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-86b9b1def28so592515241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 03:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742466927; x=1743071727; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ocw3fLNrrR6m3zSnxHaViU7nn/Q0W3Q5BAYr9jcJ8fw=;
        b=hx3ld2yafY3QYdDBBpipqggljPPRE7Hw2CCkbxuLuccokeamlqAOEHqYnjaR1S5zdy
         GYI84gZFSqWeDr1IMNcMoZL8W8wjpcabCcrffmFk0lIxmE20RkvllutoAQtrwl976m2Q
         p09vWa70v8xtAL8vLVlGXP8ySEYyZbuEJBU/udFhZH+zhOuoCLi4OziWKtL+b9BTHMou
         FksMNiB6znyH+yKQvhVdsKpQANgPiWcS8PJ15wjXz13FOYvx2iMVc4zyQFOi4NTEPkf9
         lJ1G9lSgSSRk4FmBK4grfZxk2aU4AIMVJYp7MctamUtqobSlUmvgsltTgka/7IR9dYYi
         IrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742466927; x=1743071727;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocw3fLNrrR6m3zSnxHaViU7nn/Q0W3Q5BAYr9jcJ8fw=;
        b=KWwyOp9MO70Gm53B6Xayj8UwBNIPSySID+XpB3Mc5eobeKtlE0uoI//Lm3u4ofAIxC
         od7RCov84Qe7CmnJwBRA4VFOHj0/I5+CQIEbwva5jSAeiQtpGVJjB2n1UQlyzYS8GlFj
         rBCUv0rGzGIUDHxlzmWjPGUPmmpweuqg6c9nV2P2vBSqG9xgpKbTk9citD/I0aeoNR7/
         FqmpNBO3VQb2Bntj046hVBoO6lDXa8cRqfRsa8NRxlILvTUm8O/AEnGFsiWqRAV9q0wg
         rbBsm9RePGEPzbyGZ/DQqWZwG9dVjjWh2h4iL7LCm7H2Pocn0CRCACk0TmojOODdE0DI
         mFuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlAyua7Q4RFHitjY+WlQrrpzSwZ86eGRcZAKLLDhtqFS1yVar9yruYXFMrel6IpcOaANuV7UmNgpvcyqmPTbP+@lists.infradead.org
X-Gm-Message-State: AOJu0YwyZjxvdtslmqfvBgsgSLkABoxDVYtlMvW5opxPwV4a4fKU0cmL
	7Yy02u+qKqMCUFnrBC2z0ckMPZnTByl9PvDfncItwHs21PIBEMcYvlSmPJTdP550pLQoH2xfMbt
	ol7MRLYwNoFPIQb0gGiJhkrK22+Ox11woirf5nQ==
X-Gm-Gg: ASbGncvkwyEurKmElfPFxfr2vDxKV1Vos/PuFgOU+cuWATvcu246E+bPl7wjQK7ADia
	PwvRJ5QDoTmFZt888E0g+haEJ55KMRXdexQEtL7JE8v1lix3aZCf8Q6uk4v2eUa2b+BLX6oBCVm
	ZrCygHZRnWLT1mBqyxne01ICFiPvHyiDO40kP5KxXv5sCIFj4AOhSTDjc=
X-Google-Smtp-Source: AGHT+IHIeZliyhb9LyS7D2WsjQ6zbb6VPBN1WoAf3qf5XM+D1B5bbRyzduTdvwhUu6cWsbXVY+l4bLVoqYBV0hktqrw=
X-Received: by 2002:a05:6102:3f11:b0:4bb:e36f:6a35 with SMTP id
 ada2fe7eead31-4c4ec691efcmr4815712137.14.1742466927194; Thu, 20 Mar 2025
 03:35:27 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 20 Mar 2025 16:05:14 +0530
X-Gm-Features: AQ5f1JrfSwLIxsvWRpKUwQXjWhqD0LlnNy1w9lDb63teXByQKV_Jsn0_BBUeIPc
Message-ID: <CA+G9fYtucEt8Hp6RsV0o+OWSz1E=hXBvhHa-P9C-bPnb7cyGaQ@mail.gmail.com>
Subject: stable-rc: Fast model boot fail Internal error Oops BTI - kernfs_iop_permission
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_033528_533537_63EF03AC 
X-CRM114-Status: UNSURE (   6.42  )
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

Regressions on arm64 Fast model (FVP-aemva) boot failed with stable-rc 6.13.

First seen on the stable-rc 6.13.8-rc1
 Good: v6.13.8
 Bad:  6.13.8-rc1 (v6.13.7-242-g14de9a7d510f)

Regressions found on FVP:
 - boot

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Boot regression: Fast model boot fail Internal error Oops BTI
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

NOTE:
  LKFT is currently running FVP Fast Models version 11.24.
  Planned upgrade to the Fast Models version 11.28 in this sprint.

## Boot log
[   12.812790] Internal error: Oops - BTI: 0000000036000002 [#1] PREEMPT SMP
[   12.812886] Modules linked in: drm fuse backlight ip_tables x_tables
[   12.813120] CPU: 6 UID: 0 PID: 136 Comm: udevadm Not tainted 6.13.8-rc1 #1
[   12.813245] Hardware name: FVP Base RevC (DT)
[   12.813317] pstate: 163402809 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=-c)
[   12.813450] pc : kernfs_iop_permission+0x4/0xe4
[   12.813585] lr : inode_permission+0xb8/0x174
[   12.813728] sp : ffff800080d63bb0
[   12.813796] x29: ffff800080d63bc0 x28: 0000000000002e2e x27: 00000000fffffff6
[   12.813978] x26: 0000000000000030 x25: 2f2f2f2f2f2f2f2f x24: 61c8864680b583eb
[   12.814161] x23: 0000000000000000 x22: fefefefefefefeff x21: ffffa991682c84b8
[   12.814344] x20: ffff0008006704d0 x19: 0000000000000001 x18: 00000000fffffffb
[   12.814525] x17: ffff000801bf8021 x16: e0acaabd2f000000 x15: ffffffffff000000
[   12.814711] x14: 0000000000000002 x13: ffffffffffffffff x12: 0000002e00000000
[   12.814893] x11: 0000002d00000000 x10: 0000002d00000000 x9 : ffff0008006704d0
[   12.815076] x8 : ffffa991665f0ff8 x7 : 0000000000000000 x6 : 0000000000000000
[   12.815253] x5 : 0000000000000000 x4 : 0000000000004050 x3 : 2f7375622f737973
[   12.815432] x2 : 0000000000000001 x1 : ffff0008006704d0 x0 : ffffa991682c84b8
[   12.815613] Call trace:
[   12.815670]  kernfs_iop_permission+0x4/0xe4 (P)
[   12.815830]  link_path_walk+0x2b8/0x388
[   12.815962]  path_lookupat+0x68/0x120
[   12.816073]  filename_lookup+0xe0/0x1e0
[   12.816196]  do_readlinkat+0x6c/0x1d8
[   12.816337]  __arm64_sys_readlinkat+0x20/0x30
[   12.816481]  invoke_syscall+0x40/0xf8
[   12.816623]  el0_svc_common+0xa8/0xd8
[   12.816765]  do_el0_svc+0x1c/0x28
[   12.816904]  el0_svc+0x38/0x68
[   12.817050]  el0t_64_sync_handler+0x78/0x108
[   12.817203]  el0t_64_sync+0x198/0x19c
[   12.817359] Code: a8c27bfd d50323bf d65f03c0 d503245f (373806c2)
[   12.817444] ---[ end trace 0000000000000000 ]---


## Source
* Kernel version: 6.13.8-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git sha: 14de9a7d510fcfb3bd35e275eda09724bda4d440
* Git describe: v6.13.7-242-g14de9a7d510f
* Project details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13.7-242-g14de9a7d510f/

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13.7-242-g14de9a7d510f/testrun/27684866/suite/boot/test/clang-20-lkftconfig-no-kselftest-frag/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13.7-242-g14de9a7d510f/testrun/27684866/suite/boot/test/clang-20-lkftconfig-no-kselftest-frag/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13.7-242-g14de9a7d510f/testrun/27684866/suite/boot/test/clang-20-lkftconfig-no-kselftest-frag/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uXZoz8Lc7Ue3i4mVWAM8Y800oz/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2uXZoz8Lc7Ue3i4mVWAM8Y800oz/config


--
Linaro LKFT
https://lkft.linaro.org

