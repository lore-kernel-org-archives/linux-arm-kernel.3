Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7A9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 02:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UgC/Qx3V;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yc2qHepA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ra/5W4A7wCVcqM3u/vPzniDQAL4TxR3LVwCVXnp5ER4=; b=UgC/Qx3Vdycn86
	vdhCsOzEciHxwEWsnTEo8ytIsd/pAnhsQqVzqZNs7hRoHLkUH4aGvOK9qBsqTEYQz7ki6y+V25x+s
	DqqGDx6aJ8ugVOoU1gF405bKCb0U1Iw6n6GLmLOYWizqbtqwkMdNBPJepTMCTP21Zzy1ohFJkI31o
	xYnUlV9MaK2dXAoPp9I3TlT/zepVtGjBuTrAdke7nG5Kj/dUrfmaNpodErs3ysxgNO8E7eR7/c9xv
	CfooPhCNLQ91kvAU5vYLeKCkAJdwS8GxT28Sh5FjXcmzfhRXhLgfTjNAsuXkdYZiT4Tct1ZVOlNtT
	JvzTzGMVRGdfEk8oha+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtcr-000000066iY-2nVf;
	Wed, 28 Oct 2026 02:42:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtcp-000000066hk-11xy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 02:42:52 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e9ae391a05so3136965ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 19:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155370; x=1793760170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ra/5W4A7wCVcqM3u/vPzniDQAL4TxR3LVwCVXnp5ER4=;
        b=yc2qHepAAYMu0HiypWKLjBRlkrpbnUUNSZ30ynhkf1NNrj7q+5LekTjATl99YsK2sL
         cazkCR4N8VE5Ax+kq9gpcwqMKiPOXjHAoE7dsGY6LhAfZVfr8Xr305oy8MQsU1yLDhpu
         IUj7ZOS6mc2gcg1hPDKRP0n4X+ScQN8y2+bsAw9xaZ1OsMc+VIiBeQ1EDG7sETmA8iQ9
         cuOtKiistvrayquppLFfiQZLi2cUAkAxO1WmcL5qaOnRaigSBskHqrxE6AV3itW1oWlU
         Rzr8Zpk459X4JHxsyafvBLDe8PCkRzppc1IMQ4dF2CiNSOSen52HJQov9r3vNlCk+Nvq
         XHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155370; x=1793760170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ra/5W4A7wCVcqM3u/vPzniDQAL4TxR3LVwCVXnp5ER4=;
        b=ZWkwIHgVicUfrSYWHEgin/dvuWKDh5ZgmjrduoGpPiMX2pUnHB6MB+R9mQlyIFWUlA
         vHYmkcWHh0dbYoqxGcOkzbB28KTPFA4uxSZ5FEtKs3APGwpQBsWD7CqbOKMQGhUb76sN
         qpaUuVPLF8UrWlzXu1g/SbbB/+q2k4Mz4qK7PxRgWpfToOhYbtLgYRPB6QgwmjBw4uFI
         4IAcfx/uwVCWYOiv/sUvzBN3C4KbomIffvCyVmp0EbpQ8r8SdkdqO0TjIt7SzkC3C0qq
         h4BHE4W8FVRJgSHCSP5ntgl+xIRU7KcZfaLcUOHYEo37x+YmhXjnYigxfsAtcMi095iV
         oCxQ==
X-Forwarded-Encrypted: i=1; AKwUvByD/V3tBVe0m3WSJdtAONPQZltWUqXBzxPPtmjOZ09HKYUdbl9RWEuCUMYvpfEcPfw+LH6U3KB2AyGdqiIYhWfB@lists.infradead.org
X-Gm-Message-State: AFq9FYLixNC5ZSlTdQxUU165vXcC9z30fFf1AeNeUrKkOOayWEBp74UA
	4HR4mnx2vZGxPH8gi4IFQiW1gupvXyFErhOF38n2aMGfDzESiu0FlhVG
X-Gm-Gg: AYBFou2yuTYthc4xj3dQSFicvMkiutB/3V5gf6BLNf7cNxWm2oEovE4cPsS9CJljNjz
	8mmbV79vRtVHg+NV+R4QG7QlDAiwkEB7QTu/rhSF4SiiTaBHGBRiIp5yDop+jlxzo3cd6UbFVL6
	Dcq5XIhDy66Ciy3rkicPPP6ATwyKPC2Xp4ZFhj7O4GFOeK8UaNZIzkCE3l5vZkNfuMhrTaFUlm2
	g/cSHeXvjagBJ+rdaOI8MHMYIc90mik3JjzqyJxi/WmUSzr2GFdxK1Yfu3YPJhWAAzoc7GfyR8q
	ReXgeHWl9FDgrJwIh7v0Net1i+JiSSgAmQ7UFG679jX7qGDmVIjGA0cSfFE3hmUGQamY/j5ji6A
	1+A3uhYH2tAgcy5x+P7b1MiDgbag7ONAK3Q/nSYmuPmu+ksZS8QYkT2QT6IModgR9eN9vvtUl1w
	b9gK42cj1yh5ihsI+ASDpkeIGP5FqMUAdn991u47TiwEdQ+N7/qHXmRROzP9MOJkR+ERFclM/CW
	X8PrAbRkreYrL8Qx2lhVBlkaiFhlKEyNpEiF2HIx+fMw0WpucZDit3WnOBRprF0CXU6py3yyqtw
	F0DRDzyyc9s7fAaLcy9RNM4vst8/0kc3VjBRU523bty6sfA=
X-Received: by 2002:a17:902:e751:b0:2e9:6645:e9a9 with SMTP id d9443c01a7336-2eb074e7947mr280415ad.32.1793155369680;
        Tue, 27 Oct 2026 19:42:49 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a69csm15520515ad.13.2026.10.27.19.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:42:49 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: baohua@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	surenb@google.com,
	liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	shakeel.butt@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	zhanghongru@xiaomi.com,
	willy@infradead.org,
	zhangbo56@xiaomi.com
Subject: Re: [RFC PATCH v1 1/2] x86/mm: use VMA lock for kernel faults on user addresses
Date: Wed, 28 Oct 2026 10:42:42 +0800
Message-Id: <20261028024242.3394761-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260802074018.73887-2-baohua@kernel.org>
References: <20260802074018.73887-2-baohua@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_194251_293245_54A174B6 
X-CRM114-Status: GOOD (  13.55  )
X-Spam-Score: -1.9 (-)
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

On Sun, 2 Aug 2026 15:40:17 +0800 "Barry Song (Xiaomi)" <baohua@kernel.org> wrote:
> Use the VMA lock for kernel faults on user addresses. This also
> makes the existing code below meaningful:
>
>   /* Quick path to respond to signals */
>   if (fault_signal_pending(fault, regs)) {
>           if (!user_mode(regs))
>                   kernelmode_fixup_or_oops(regs, error_code, address,
>                                            SIGBUS, BUS_ADRERR,
>                                            ARCH_DEFAULT_PKEY);
>           return;
>   }
>
> Right now, the code above is dead because !user_mode always
> takes the mmap_lock path.
> ---
> -       if (!(flags & FAULT_FLAG_USER))
> -               goto lock_mmap;
> -
>         vma = lock_vma_under_rcu(mm, address);
>         if (!vma)
>                 goto lock_mmap;

I ran some numbers on x86 to quantify this. Using perf I counted how
often kernel faults on user addresses still fall back to the mmap_lock
slow path (lock_mm_and_find_vma), and the total time spent there,
before and after this patch.

Test setup: x86 host, booted with mem=4G.

Workload: vm-scalability case-mmap-pread-rand-mt, a multithreaded
random mmap+pread workload.

Fallback to the mmap_lock slow path (lock_mm_and_find_vma):

  metric        before_cnt  before_ms   after_cnt  after_ms   d_cnt%   d_ms%
  fault path           416   3510.000           5    256.780   -98.8%  -92.7%

The number of kernel faults on user addresses that fall back to the
mmap_lock path drops by ~98%, and the time spent on that path drops
accordingly. So these faults are now handled under the per-VMA lock
as intended, and the corresponding mmap_lock contention goes away.

Thanks,
Bo

