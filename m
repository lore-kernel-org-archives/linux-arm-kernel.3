Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8E8C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 23:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBBRC+4dBOGUpUnVf1j+pdxrs8Bv9jF12/3OQB9wVH8=; b=Fphqc7SrFWu1P61WL3HoayWrOF
	ATnRhLrlDyowp/c5ztNI1yrwNuizjMEXjLAu50aUJoVKukUNb7MAunR9nKgTV7X2THsFMDq/pMvA9
	cMzORkCyZkpLt0Wx6LI9I8gohW2MNNwpPaYUWIfWSl5qOW+gInEzStlicys8rKn23U2XK5yhp/5jg
	azYAY7+gbsFV6Ore7YidRv8JLKh/SKdmDMBPyK6kvs/afFzpUcCaUdyCwzN3yOCWP7W/v2x3JW0Pw
	7fXjV2uFOeLBwVazgZc9chq+xeP98VxxbOdn3WphxKuOEWXH0X8hqKh/G9djSHphgkM5ppvkhDToc
	du4oECvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUWC-000000043yr-174j;
	Mon, 27 Jul 2026 23:13:56 +0000
Received: from mail-oo1-xc64.google.com ([2607:f8b0:4864:20::c64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUW9-000000043xt-1Z6E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 23:13:54 +0000
Received: by mail-oo1-xc64.google.com with SMTP id 006d021491bc7-6ab06473488so889207eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 16:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785194031; x=1785798831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBBRC+4dBOGUpUnVf1j+pdxrs8Bv9jF12/3OQB9wVH8=;
        b=Rt6bJCc9bm/pGP3UsTESZeKBiREJp8ZyeZQKvuPUeq65x6knCq7JgDnvAkLf8HVQlb
         jHwdwt+4QwWWCIPmZtp5bUKb4/NkRXViaxxQM1ifKdO9sXRExWfEXzz6VMNTy/HJUdRy
         LoyOKY1JaKnUNbztc2ZdLMpRSdl0mlZwZwnO2UvueGx3LvNslxxZp2Uhj5yAR/ZgJ/4z
         zljYUiakDtQ0SUWXeLUf/twIgWfRqh7nBYdMqHyKWNRVkZVK6Cnynxd5zHYYBuXEAF53
         /iybA3GHLGGuJ3msFa1YLx5dXMZEc7IJz0tluFAvmLl1s5oUo0Q7ba70eHo4FNpYMo0k
         GnXw==
X-Forwarded-Encrypted: i=1; AHgh+Rqh1aPZJmXIEJdrRvCHIZkFjL1CRBNVTKg3F1RrL7faNoZ8dc6tYld+kGytw9MKrCJxW59rkCAl/YhvWF/iiRVp@lists.infradead.org
X-Gm-Message-State: AOJu0YysFmF4dZn5Ln+KGH6RRIGHnifg5nP/qVP+/wn8v88O6vrZ04Yj
	C/VSHTd5qk5SezgpXpabDbmAMNQZ9SdPal/y+IOn1uFiq3rWFLQepdVtZb/AaJ4yRokYeLSvEKY
	uRGM4f1sFgaMTTVfu0K6un5a/+Y7iWRKU0gm5cwKsVedRv7DaJqlhUuyQRQLaPp6C2cPUcn+3a8
	cct3JnRSdpcRJRKMEkP11lVv5wPXXZPTOnq52ya+ZaMJdy9TSEf+dU1GvQmJ/k984mLTwrh1V19
	wJO9iA265BNN2sUhYI4wX6xC0mp+dI=
X-Gm-Gg: AR+sD13xq4wnRY9bqQ1XzC1TSWTyx1kHqRC3G/Z1qGfozB6wSeCEoBCAXbi1pEyW1op
	PDB4Q0Oql8fuMWWvZU/QRB3YyIw4JGJUXdYNZtlL82LvFFfSEMFjByDOQPJedQosMXmOqpW1q8m
	HyvXud1vQdhVQ0N9TYxDmlm7Nv0km79awtpUrb5r8R0XXAH1zO2VokVdfIJWkExygOsZLeSMUNy
	oOE+3KVztMpskBoWcHMt7ZnnBGDD0nF7OMvtld/86hsjAqDGveJ0BM2n6DGvsI6kGpBlsCc9VyD
	8reME4WIzGjknq+jD31L5rhz7AI+ihrYyiVAivBdOIPXLR4Ys0T3ZgBscACGANQ/w0e0anQxImo
	DsXz8WXYrM399h5MC0ROlwl9CZFh2ZBumv92PjoxSYn6ImUUo8gUNzRsCPbXTIIsOj3vcqRAhhu
	PISxrLT1SKjqhl28Ty3fgSMXWc5kIuriMB6Y+C
X-Received: by 2002:a05:6820:f02f:b0:6a3:97db:4917 with SMTP id 006d021491bc7-6aaffdedd6amr7282974eaf.51.1785194031153;
        Mon, 27 Jul 2026 16:13:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7ee29fb48aasm1177692a34.5.2026.07.27.16.13.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2026 16:13:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so149227a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 16:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785194029; x=1785798829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBBRC+4dBOGUpUnVf1j+pdxrs8Bv9jF12/3OQB9wVH8=;
        b=Hx0bAAopG88sP1eKfvWiwgYHHH3KnZOvqWAgTJ/ngzBlwoeDdtBxAM9P2/6UN4q4oh
         2Pj9muMfdD53T7lxuh6sdtyFqj8Jwi8SSH1sIOFBPa3YJfII8AKD3e9CQ7iY1FvEjiCG
         LeOS+a3EjwWQgRRIBOfXSkUzLgTCNGVW5BuYI=
X-Forwarded-Encrypted: i=1; AHgh+Rr4j7/JHjBm8QyYIOxpDGAGfI4mQVRAzfyFkKuGqn2Vg+ZosFRqGIzk4pt4xwiVFPbvJmF+QAMyHB4MUco2dxM4@lists.infradead.org
X-Received: by 2002:a17:90b:2ccf:b0:387:df8f:1409 with SMTP id 98e67ed59e1d1-38f2988462emr8728040a91.42.1785194029550;
        Mon, 27 Jul 2026 16:13:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccf:b0:387:df8f:1409 with SMTP id 98e67ed59e1d1-38f2988462emr8728013a91.42.1785194029098;
        Mon, 27 Jul 2026 16:13:49 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc415eafsm36964437eec.7.2026.07.27.16.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 16:13:48 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: dan@reactivated.net
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com,
	robh@kernel.org,
	robin.murphy@arm.com,
	will@kernel.org
Subject: Re: [PATCH 0/6] Add support for Broadcom BCM2712 IOMMU driver (Raspberry Pi 5)
Date: Mon, 27 Jul 2026 19:13:43 -0400
Message-Id: <20260727231343.1520006-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_161353_417600_9B16EE2B 
X-CRM114-Status: GOOD (  13.01  )
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

Please give me a few days to give comment and test this on
the Broadcom 7712, the sister chip of the RPi 2712.

Regards,
Jim Quinlan
Broadcom STB/CM

> 
> ---
> Daniel Drake (6):
>       generic_pt: allow missing sw bit in DMA_INCOHERENT case
>       iommupt: allow full-table contiguous leaves in unit tests
>       dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
>       iommu/generic_pt: Add Broadcom BCM2712 page table format
>       iommu: Add Broadcom BCM2712 IOMMU driver
>       arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes
> 
>  .../bindings/iommu/brcm,bcm2712-iommu.yaml         |  65 +++
>  .../bindings/iommu/brcm,bcm2712-iommuc.yaml        |  35 ++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  15 +
>  drivers/iommu/Kconfig                              |  15 +
>  drivers/iommu/Makefile                             |   1 +
>  drivers/iommu/bcm2712-iommu-cache.c                |  73 +++
>  drivers/iommu/bcm2712-iommu-cache.h                |   9 +
>  drivers/iommu/bcm2712-iommu.c                      | 587 +++++++++++++++++++++
>  drivers/iommu/generic_pt/.kunitconfig              |   1 +
>  drivers/iommu/generic_pt/Kconfig                   |  10 +
>  drivers/iommu/generic_pt/fmt/Makefile              |   2 +
>  drivers/iommu/generic_pt/fmt/bcm2712.h             | 259 +++++++++
>  drivers/iommu/generic_pt/fmt/defs_bcm2712.h        |  18 +
>  drivers/iommu/generic_pt/fmt/iommu_bcm2712.c       |  10 +
>  drivers/iommu/generic_pt/kunit_generic_pt.h        |  39 +-
>  drivers/iommu/generic_pt/pt_fmt_defaults.h         |  13 +
>  include/linux/generic_pt/common.h                  |   7 +
>  include/linux/generic_pt/iommu.h                   |  13 +
>  18 files changed, 1147 insertions(+), 25 deletions(-)
> ---
> base-commit: f4fb100039e96211609dfc44fb24b9e4a8a0f2f9
> change-id: 20260712-bcm2712-iommu-submit-2e09899e65c4
> 
> Best regards,
> -- 
> Daniel Drake <dan@reactivated.net>

