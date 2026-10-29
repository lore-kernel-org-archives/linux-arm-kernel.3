Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21595606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mwU40mc6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSF0dolw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=; b=mwU40mc6P/va+LBQ/ocjBLNYax
	OjS1SFty+w/3Dl5+cgE4SeTtcCpUICJBj0KGijeSEQQYxst0GyQXLQWJvG1fyWiFdWJO0uU8a0qox
	nv+hlrwSzcLu5B13FWFeVkaNH/JkYWGRVFoirtr7qValhp4P5AJC74gNGvvFTZT+OI17GDVIQI6C4
	v+a7Ql9LE/gG/5WILxsrr9LzB4KCzdGCcmRc3rV8Qn+Aop6DQ4uAb665/K64jQE1f/WpTDavtEZBs
	HgMPVYhPfT28Zalj354U5hEmjWbSW3IHJn8TqVNodmcR+gNrZEeRxO13DDrqTHb6n2dUhzFU6En5o
	b02gYAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVLF-0000000AC4l-43Ud;
	Thu, 29 Oct 2026 18:59:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVLE-0000000AC3i-0Rh1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:59:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so25127355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300349; x=1793905149; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=MSF0dolw4ytBT6HjmF1YIiaM9H3cX52pZc9zDAMlFIy92LRO29FMfXBGnTNv9z07Rg
         Vw+2LLEEU55asznAG/31nrx6fNGglN++GpKalxouhxSzc2ZwM7d4GYhT1PQvx0qh1Eg8
         iNnJYv8dIZTGNd68EeACnydJ6TO/W8LNUbZ5w3blGbmZpWYEKqGUS/9q7wotEYP1kWLs
         ze0HXA2b9jRxDd/w3HC38xSPVm1gLaAuHkstLXQMNrpNhjF5l/tbNJ0SWI/cBLsWf71W
         r0+RqlxV01H4XkjgRKJNutFjE8nFlhNSg/iHzounWFu13TEjLRR+yM/glHBsMI6NW2vO
         LgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300349; x=1793905149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=G3nL9Xe2Wpm5rzcLCeDthx5RgHSD7acDZY5TlDwB4IeFOCTUpBfeuEhal3vlicLe/z
         ah8eG927XFDpw6TWNy4VXud3B++jsHDzIRbTwTZdr7dBJJwMNqlvm0WUV2pVn7Uv7LBf
         EEr9AR0bzuVvACAFGoJ2DULfLn8jbk6wqfisd3Pux3wRE3lCf/FpPDEZggZ93BACkX8G
         4la6H5XltF7K9nvpV7IxWn1fyNQAgntxePMDgAd7vuaTAQSNnAkbntgRVQEjGkdRzpz5
         n2xWJ3aCmUxF+QpCLz6czTWpEhVr7o2P7h1XVBcOi7M2Duj4GMoPK4eWG4p1PNIAGzhk
         +DFg==
X-Forwarded-Encrypted: i=1; AKwUvByTt0iyqPdKuAMGR5fqcLx6/Qx7jWE6Inr1ROW3MRRX2KVtn8WIY2HCPLctf40ajHYzuHO93ZG9gKLCUhFXV2lJ@lists.infradead.org
X-Gm-Message-State: AFq9FYK1iGxkGIHJbAjFWPZ21uFKoX890uurMZdm3VxnFDHc+l4nVCGF
	qw0/kK3N7eYWJrJaBJArry44cibxMwCtQgTZQ8CytOi+smxBwgpvLqo8
X-Gm-Gg: AYBFou1AcPeAvNa9LpLTBM9S/9fsmrJOMpeLtjaAiMDLj2vCn42MYKXWQMjzOQ0xVd+
	XLAD4XjAOlbJ3Azf66EDJR/1ypj9QDKhzMNvWuXc3MtYKslBcqAcJAA6mG844vscrJa3whjGdv1
	/IV5p0zcXtdTYgoTOF7aKNNDvvDlkOrtii1I+AJ8wesT25XbkK2A0miM324H3aw8EJoMTHLNdrK
	j0JsjMkpzUJ+MW8qjRfIUkQRtzbwbz0Ctgs2Ni/ylmeFKayGmplSlBMTWXWC8aJ+NEiDT5ZPITQ
	T4/nTUiYUXHfYGqX5/LxLOZoHNxYnPRL6hK1caF/Z3SYQutnDP1RGpswsN2gWNtrZcGJUAbQ4Po
	cSKX8ue5y3XyD7TtO0N5G6m3lKMgGESPFHL58FD8xXSePHQNeMTROilMD+ce1K+vDfR5mytfu5a
	vPb2RrErQ4gkj2MyN3LNtETiOBerVTtsiqHDC5cPBzx7GMMmb7DQb7CGQlXhC3r9pYHgd4+1kfn
	r0broQwAZNKnNRyan1LqWd2kGdp5oQ5Woh3XYtD9raXaLShgcTZEaL+bClUMJR94O0oMilJnYv1
	q5CYLMIZAXfwDPCmuv+ypwWC5oGyaWMh8L9fEaeLucXBJ6eCrOJgIzNU1tM9exIEA0vEsJZZBBr
	SaFSn3g1f+G6dgG9SwcSLdz3mNa+weUJia5KCNfI1wXbO1TAahD5RKivqRidt+0dVXytXFBZdop
	7DowNrEoqiFmkK
X-Received: by 2002:a05:600d:4121:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4a96836988amr152798385e9.32.1793300349381;
        Thu, 29 Oct 2026 11:59:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm4933955e9.10.2026.10.29.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:59:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:59:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auOXeGVQG0UHeoQb@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_115912_159914_4719C518 
X-CRM114-Status: GOOD (  10.64  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:

> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>   drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>     -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>   drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>     spuriously triggered WARN. Fixed: 1 > 0, no warn.
>   drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>     -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>   drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>     Fixed: proceeds correctly without CONFIG_PM.
>   drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>     (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>     xe_pxp.c) now correctly treat !CONFIG_PM as active.
>   drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>     executes stall register update.
>   drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>     return now skipped, correctly proceeds.

Pattern C is mostly bugs so this patch should have a Fixes tag since
it fixes bugs.

regards,
dan carpenter



