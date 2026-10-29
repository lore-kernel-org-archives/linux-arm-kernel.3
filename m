Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50396606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aW0C01yc;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=NiMnLrpR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gLjComLCp2esLTingR9be9ipRIp36YyskRA+PmDaCHo=; b=aW0C01ycEEuwYB
	3M2NbS0qI+2ED8Meo43pHVwMuBTzvYpKUXwlsPczR8jFDzIgwWhxdlG2POQ73Ik0hXO8c0g+15+gd
	dCIxCn9xddjsKjMM6FprOFsby4d8r0dBjnV7BNOuFMGelGosooFX3mDU3NPuYLPzVTu5CqXS1R5Zi
	cSUXEaufvvU3ZlydBqiPjMoxNQrQPxQwcqIJS1fxKzWK+olG75OMQVyMYnuZ9J54oIMi7idjO461X
	Ahlzu7nZdB2W4y3Jx0AFfJqHyQHcod+O6dJ3fS+MGa5ouk5zjxIXPm4cI8SilkfSoqWsBiYUR47az
	SuiKt33WJyx7udzzbGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUbC-0000000A3ls-2u1L;
	Thu, 29 Oct 2026 18:11:38 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUb9-0000000A3kL-1QSS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:11:38 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6faddda49e7so2074125eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793297492; x=1793902292; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLjComLCp2esLTingR9be9ipRIp36YyskRA+PmDaCHo=;
        b=NiMnLrpR4Fdfh49SoiLQzpHkeD/HRUo7Dxx5YeT/rTlCpozqzVWFAJNTx+O0oPubIS
         x3yruMNgTfdOt6Il84umg+xdmzy282ycRBlKSzfbbQd1BF/25nKwSGpV3qZhGsitFNob
         ox+m/ewqee7eNka9PZ3VLeCoLn7qfqg89+YXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297492; x=1793902292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLjComLCp2esLTingR9be9ipRIp36YyskRA+PmDaCHo=;
        b=wXy7IfszvCD81m/USsu//leTvRpbwdVWEbeIT8a4BFH4ZByQ1eLeT7OrX6VAnQ2bfQ
         r4vO8co2WdjxBLbdi62KJ8zLRQRKpBHnf1BFoCOc56r1lfYvndCapcFHeXNIYr00n77f
         RpZDZD8sBseyupiPf7caa59bXRzgKlCt+qTwMW8TwrrKV8zC7F1B2v5mFh81vxkotZyL
         89j0q1QkKlUnspV/bmXQpGPDWHQ4rvdMJOltDsp2T3TgJjyDsk2vzz19phwNcFdupvqm
         bxtaqmzzT67wTVrqZridjcuiDFrWm/DQkQlW4wTrMg8KbVOnkVuAJ55GathzEp8x+Sqv
         JsDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnRcNSuUz/rX+ylCJ1QqHzd1weswGeObUvQ+m+WGPUAHymWtjyoxfGc7PQ78svdUzqNhLgDOaZbFrupls6lkib@lists.infradead.org
X-Gm-Message-State: AFq9FYKoQTfGvEP2Wz0kHgVU2Kg7vwYAVLw24XEoCxhIwjUV9DWvKFMI
	5zT+q22cmoSw51QIFQlzlZiyesWfhxHCpMuUvqnYhu8ps/0WvmTanm/hR0rAOzhdvA==
X-Gm-Gg: AYBFou37yqQAAhfcLU639kuGHEkBdWxJc35TUBwaXef036tdsrJBR2Z5lZJwu08twOm
	op3XedJJtSxXrb2pelGLAkR2qR617GjzvY+zejovxWUDOUSlWsB4tBRV+i4pNHcv+tafjxsQmTA
	0K6CKlJhepjysQvqCxA+Rqt2opusEAtPjjYETPXDdEMFlkXbJ06GuusIxWhBCjy8M/enLM2Rjhy
	GDERt7XgT/0PWnhp+AikzJBao+vfSIud0SsjYhWPedNBR8ORne2QT5q5Yxm+dkQH5Uv8UaTcTNO
	L6Nk62zDZ0vHBYTff6XGYnV54MhVaP+gaIL5qnF+6V2gVB3Bf7c6NvNlK8jXl8nd2I1iPDYQdIK
	+AjLFKSBMfz/SlzaJFukRZiNicF1xtu6TYlaAyu+11I8xPohzeIpyOMGO7vpPsKe+ZXX5d3BeWa
	CZMMakSSMedQZKDwbuZtcvKdtZcRS0T01UD5cyk9EPGVW14/645UC27foKK5TPvizZ+SHtf/P2x
	B+3O4vmioDksCEt8no15+/FvzPUmZGyOFanGzOG4cE88DnlwX1THwKKV52eS+BL7f0BhUz7g5/j
	nT1hM/o7FelPwnU/MfaJaa6JCACvW1Ab3TRZ4tALvE1y7Q==
X-Received: by 2002:a05:6820:5710:10b0:6de:aeea:5c89 with SMTP id 006d021491bc7-714f288a10fmr36729eaf.23.1793297492247;
        Thu, 29 Oct 2026 11:11:32 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4a904856f09sm130363fac.3.2026.10.29.11.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 11:11:31 -0700 (PDT)
Message-ID: <4c7a6635-7382-4e57-ae16-6bc2ee694f46@ieee.org>
Date: Thu, 29 Oct 2026 13:11:29 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, imx@lists.linux.dev, Rob Herring <robh@kernel.org>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_111135_399932_A3021CD4 
X-CRM114-Status: GOOD (  24.74  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 11:30 AM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> When CONFIG_PM is not enabled, all devices runtime PM state should be
> treated as active.

Should be treated as if runtime PM were enabled for the device,
and the runtime status is active.

It's a subtle distinction but the previous behavior returned
EINVAL, which means "runtime PM is disabled for the device".

Anyway, for the IPA use of this function, this looks correct.

Acked-by: Alex Elder <elder@riscstar.com>

> 
> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> should return the same value as the stub pm_runtime_get(), which is 1.
> 
> Analysis of all callers and their behavior with old (-EINVAL) vs new (1):
> 
> Pattern A: if (!pm_runtime_get_if_active(dev)) -- no impact
>    Both -EINVAL and 1 are non-zero, so !ret is false in both cases.
>    Callers: drivers/accel/ethosu/ethosu_perfmon.c,
>             drivers/gpu/drm/msm/adreno/a6xx_gmu.c,
>             drivers/gpu/drm/msm/msm_perfcntr.c,
>             drivers/gpu/drm/v3d/v3d_mmu.c,
>             drivers/gpu/drm/v3d/v3d_perfmon.c (x4),
>             drivers/media/i2c/gc08a3.c gc05a2.c og0ve1b.c ov6211.c,
>             drivers/media/i2c/ccs/ccs-core.c s5kjn1.c lm3560.c (x2),
>             drivers/media/i2c/s5k3m5.c thp7312.c imx283.c ov64a40.c,
>             drivers/media/pci/intel/ipu6/ipu6-buttress.c,
>             sound/hda/core/device.c
> 
> Pattern B: if (!ret) after get -- no impact
>    Both -EINVAL and 1 are non-zero, !ret is false in both cases.
>    drivers/gpu/drm/amd/pm/amdgpu_pm.c (comment says "allow access"
>      in kernels without CONFIG_PM), drivers/pci/pci.c
> 
> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>    drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>      -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>    drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>      spuriously triggered WARN. Fixed: 1 > 0, no warn.
>    drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>      -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>    drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>      Fixed: proceeds correctly without CONFIG_PM.
>    drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>      (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>      xe_pxp.c) now correctly treat !CONFIG_PM as active.
>    drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>      executes stall register update.
>    drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>      return now skipped, correctly proceeds.
> 
> Pattern D: explicit -EINVAL check
>    drivers/hwmon/prom21-xhci.c: checks (> 0) then (== -EINVAL).
>      Old: took -EINVAL fallback. New: takes (> 0) fast path.
>      Both succeed when CONFIG_PM is disabled; functionally equivalent.
>    drivers/hwmon/eic7700-pvt.c: call is guarded by IS_ENABLED(CONFIG_PM),
>      stub is never reached. No impact.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Cc: Karol Wachowski <karol.wachowski@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: "Joerg Roedel" <joro@8bytes.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Guan-Yu Lin <guanyulin@google.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: iommu@lists.linux.dev
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Cc: netdev@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: Rob Herring (Arm) <robh@kernel.org>
> ---
>   include/linux/pm_runtime.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 64921b10ac74f..de9e7518ecef2 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -280,7 +280,7 @@ static inline int pm_runtime_get_if_in_use(struct device *dev)
>   }
>   static inline int pm_runtime_get_if_active(struct device *dev)
>   {
> -	return -EINVAL;
> +	return 1;
>   }
>   static inline int __pm_runtime_set_status(struct device *dev,
>   					    unsigned int status) { return 0; }


