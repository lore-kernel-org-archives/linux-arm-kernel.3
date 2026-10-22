Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125D4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 19:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gMzfv9Hc;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HXU3Ti7e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PZPvfX1rm0qpo9fUpVJwjmTY46uavpRGLm5yVTqEhw4=; b=gMzfv9Hcm/+1C1
	bCoTythgLiLGnVQHYcNljo/d/E4NiX/9/022pQhjqj30HO6QvkFE51i2t10844RXZ+qdT9ZHGI9bV
	P/xM09c0ARYKu/P1qhjZZTlkrOx66oJo6T/tLFUteL5+PobxUb1R+3Jy1i1KVHrhUY/eoJ4uJNrHS
	AoT6ZBBN7hcOMwyAZkia21XvEBFzZRvHBRGCA48uar03hSdR/J0KEShWuAfE3CKRgkkOkdk8VH8Yx
	CaT/+xU+hmNPZY+AEFc8sVdbmdOmp+9zgpBbUxL3sVmvEVdRpMw7zfMcsJ6rjk/eWyWC7XjBoyObZ
	iZv1N+HPDEMF9/w71PDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyal-0000000Epa6-2p1u;
	Thu, 22 Oct 2026 19:36:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyaj-0000000EpZj-0OtO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 19:36:46 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c34bff61551so23971766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697803; x=1793302603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZPvfX1rm0qpo9fUpVJwjmTY46uavpRGLm5yVTqEhw4=;
        b=HXU3Ti7eIWA9Q1UQAcgorcCghzA6ydmrB3WRD4QJSxz11m3NegH+POO68b8hVyh0eF
         gi6gokAlrsSMJbYM5AGeutFwKHufORHhc5MFip5/9rtR4LqQLaBLGdFtZ1rKPuhuHlH2
         FFvJqADr6nO4d5cvR/zBp/1jdKYbxP9Lanr4MrBU4oz774V2Yj7/HSuYAxVrNIJnSqQy
         GrQ/JTOE3YJg061oBOe+T7MnzE7s0SD9cOoSjn7o1SNm8bqniL/hjOdtk7Krp5dpGnK8
         1mLTvHWoLzGhnKowmVtokyBZmhS6ILbUD6W8aRGYRDJu68kZnOzTluUFJxyIyAlBod/M
         gV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697803; x=1793302603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZPvfX1rm0qpo9fUpVJwjmTY46uavpRGLm5yVTqEhw4=;
        b=M331cXe+VvZASkz6YSp/lw52dNxy176WFAJ4XuGfUGEkqfGRM2mkldYTT+phDf1n4x
         bQC0XKVFm5eC+4cUcCvT1DsMD1/YHT5fi1WzKOweZfMAbh9IkpA7YPikG8hQ7iHSUR8V
         LEd7qHqAS7cZy/3noJlQj0qq5w82Xhu0Y4CV58jKXXiG+QWoW54gYN44ZJoxBg/NSA47
         4Z79cPg+uIEbAYAABZJvPZI+954ZvYQo5LlXvpCqAVoB3K2YV80d4qg3KbtgaNzmYlV0
         sPJz4EVpZe24FTaFeCwc8NMuSIxf2gjPqcLfESb4NaQbDqokAceHtTMwMrJ6iKFPJ2Mc
         NzsA==
X-Forwarded-Encrypted: i=1; AKwUvBxrdYZzASYiNc64MmfMI0CADSUwmSWD7assoYow9JzkYebMnMdhW3/nYYSHpa6FAGkVuadIC3Wjrh1TC20mGI+S@lists.infradead.org
X-Gm-Message-State: AFq9FYKIJf+Ugy9bvZ5KEEIu4436/r5MNoer75VDFZFzyAYysvkdsVvA
	71zjhspQpCyH99Ub2ITU8TTwxevgHQyfZV/om2gLY/C6wi8MqzUAh5jm
X-Gm-Gg: AYBFou0JFnEntqWb5QQwUfsCXQTRZDazSOsNLGreTJSorLaCmZeaKIRIj4KDazwdgeT
	AIDTUe1cKNpp+E2kwZQZG1bUMcyCs9RgLiDEl4M6/Myzj1cj0EFrJa1PztwMmJdw2uZI+omdUgU
	fmc0KgCeuXxxrNS+6aq0dAlQW9Yh/H/wUGO5oLw4Y6/gwDg8q5VOWULjPakI4X3vbVP2bdko0XS
	yc5+5FLD+1WjZusQkl/lvddXN4CUL0ckh/lmes9Q8s2HZF2V8tSs+ccI5ooTjwMdL+9nA+UIuIE
	A25113GF0nxCHhpWnhqT2osk6F4y09dGyCiwqGuxms4tdo+uIjKHFEjUzOYmCbpp0OEA1rCs9kY
	ohI+xrGwyiE+5aZuZ42QJBpcKSrjwLZuagYuCZ6cKF172CF416YDuaQjemZpQjPoyKqRDYlJirw
	jF10ABtP2kSOqtVlJbzn7t2C1sFhPSyCp93ayL8yyE0Eyc9Vxh0thotlGBteNZL2AbxAHoa5YQT
	Ls7eaolgJzmyCUCtmQ59g+raJVvsrBNL2e7BbQ5ijnsnlxP8Q==
X-Received: by 2002:a17:907:dac:b0:c3f:98d4:dfe2 with SMTP id a640c23a62f3a-c46a908932cmr24015266b.18.1792697802406;
        Thu, 22 Oct 2026 12:36:42 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:4f::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5ca4fa2sm22651766b.49.2026.10.22.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:36:41 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Jinqian Yang <yangjinqian1@huawei.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Andrew Preece <apreece@meta.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Enable dynamic MSI-X allocation
Date: Thu, 22 Oct 2026 12:36:20 -0700
Message-ID: <20261022193620.2152038-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715035437.700601-1-yangjinqian1@huawei.com>
References: <20260715035437.700601-1-yangjinqian1@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_123645_221139_AE0B18C9 
X-CRM114-Status: GOOD (  10.85  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Commit 0d6a7c417983 ("irqchip/gic-v3-its: Enable dynamic MSI-X
allocation"), merged for v7.3-rc1, breaks bnxt_en on our loving Grace
machines. Reverting it fixes the problem on current mainline.

Hardware:
  - NVIDIA Grace (Neoverse V2), ACPI, GICv3 + ITS
  - Broadcom BCM57508 (BCM957508-N1200FJ), FW 230.0.165.3, bnxt_en
  - The same platform with a Mellanox NIC (mlx5) is not affected

The trigger is a ring resize: a boot-time udev .link file with
RxBufferSize=max, i.e. "ethtool -G eth0 rx 4095 tx 4095". The close
path never gets the HWRM_RING_FREE completions, then TX times out and
the machine hangs:

  [   58.221] bnxt_en 0002:01:00.0 eth0: Resp cmpl intr err msg: 0x51
  [   58.221] bnxt_en 0002:01:00.0 eth0: hwrm_ring_free type 1 failed. rc:fffffff0 err:0
  ... (repeats every ~3.7s for every ring)
  [  215.539] bnxt_en 0002:01:00.0 eth0: NETDEV WATCHDOG: CPU: 69: transmit queue 18 timed out 5118 ms
  [  215.539] bnxt_en 0002:01:00.0 eth0: TX timeout detected, starting reset task!

Bisecting v7.2..v7.3-rc3 on this machine points at the irq-drivers
merge (8b5d31123f41), and within it:

  good: 9023960b74ab ("irqchip: Remove redundant dev_err()/dev_err_probe()")
  bad:  0d6a7c417983 ("irqchip/gic-v3-its: Enable dynamic MSI-X allocation")

On current mainline (f47d223627f8) the same machine fails at ~55s;
with the commit reverted it runs cleanly.

So far it only reproduces with our debug config (KASAN, lockdep,
DEBUG_PAGEALLOC, DMA_API_DEBUG, CPUMASK_OFFSTACK, ...), not with our
production config. I haven't narrowed down which option matters.

My guess is that with pci_msix_can_alloc_dyn() now true behind the ITS,
bnxt switches to dynamic MSI-X allocation and something on that path
loses the completion interrupts, but I haven't root-caused it.

Happy to test patches or collect more data.

Reported-by: Andrew Preece <apreece@meta.com>

#regzbot introduced: 0d6a7c417983b

Thanks,
Vlad

