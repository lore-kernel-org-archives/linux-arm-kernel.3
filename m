Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BCFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=; b=s9UZmz4zeANW//b4mjrH1NqRXS
	kJEKdeLnxji0lvBtBOzI61rdBA4IFlo5MYswZeoaSxUN+xekj+2htdmGUj9R0qFs/A0YK9GFwzDG5
	uTa13/xO4Mlo+XRuu+SzmMscSjMtPxAxMM8kp0y6VCQgZFxvoj1oSaYsDQ6+qwzh1mT/eCB7uacp2
	RESq2kwfRuaJySyFgwFupVE8iv+eUofgVQ5RJQkzbHz677A/JxiOnAV1qIZbM+Bnj4LMtcXxDJpzm
	4H5vFGSBHIbS/oNoxM7lmLBxmEl//9WsiuqcQ3+iZIDKGXhU/76zRUsbFJY6eYXzel124tK7Fo+oX
	qn1xcH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezyL-00000002rJ6-3RIj;
	Wed, 01 Jul 2026 18:47:45 +0000
Received: from mail-qt1-x862.google.com ([2607:f8b0:4864:20::862])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezyJ-00000002rIZ-1NDq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 18:47:44 +0000
Received: by mail-qt1-x862.google.com with SMTP id d75a77b69052e-51c1372f84dso7372331cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 11:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931661; x=1783536461;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
        b=tANrwKuklFi03/a/Yqm2EiqKpN6GmLRDRcuWo/HWCVM+HSoSe2EHLR+eGWwx7JuZxB
         UYDabRl/j93dl5s0mXuXBgzHTcbrZUv4u3vy6KpyQner56J/y1Sfz5NtOl66+d5J648u
         +BTDVdq9n6eTdUrHFWjImGVEkVWUxoZwpuGaPtnPrfLcIgN95j3ZuV1khYL8ulLAK/cp
         6HNpoQx83+ZvGqCeLWwa+2jhTl1wvThb9WDs3oC2qz+bfr0jUQAfOwIfhWeJndq5ZqiX
         QUGHnKpbhORjcWCTV3UcESYFaflZE2zaUKFPA+YFZeisMvTLX9CXI1fEafftJx2S3wWH
         3rYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mWAz7IRhDos4S6bD2jo2fPIfuSOi6S/76GBhVmgW3shLCX4CZnVbwyy93iFttBKuqimCQjM1KkTLKgYPw3L+9@lists.infradead.org
X-Gm-Message-State: AOJu0YzXxwBDC0Auu3Eu+9lNrelQTxFf9QA8tqGR/k+SYf2dRRO2RWaR
	MCBSydXpLvqZLq9UxrFbDek96uaajDtFXUGC1RRL1M7n+2rJFrzPvCW+l35dcZ0Yn2RDS5K/+Ja
	x/3MP+aeFCncqHtXpwZzSh0cGESi+vj2bZlti1k2ZIuHCpSf9Iwsdmb/R0iVOcF8PsoohPq7FRL
	H8se3EwCC04gTPzdZ0M2srV4IXtw9qA89XaUCX9rNKvLgk6VtOgoJq3QG/4cvlJmtirSANTBc66
	bC1A3JqnMpWocGTCdcYHnzJAQDf3zwEVOo=
X-Gm-Gg: AfdE7cniJrrDilHj65Z2+ROU5U3VwJCv2hhNgYA2BLesFOcJBR52krqu3j4VaFMRahI
	+UcZdjb5U00Ag1mwWWpJ8YHd6Kh/nWpF0ax80plyPuS2ia444LdWaGJeS0K5a6AYUO6xrQZmkWc
	o7/a+kwKiSWheip2IGXs9IVkqBXjPjIRQKt6yaS11Mo6HEUX2MfBoxIcag9IkyYB4CVkp3KOIwk
	X0YA70kPVctzwTvI69I8aGNKXsiHpQUsNXuM+NgZq/EdPjAAekUmWJaAhw+16G+b27RskIqqMuW
	NEwFbObUogBi4wDsHJZB9T30dpZ5/AIZwda8KIzmdY0v2JiOTAvoUo1yCIGXSVfgpx+3igosazo
	8vsvrhHhTE/ML+jImYEEPYOwY0LVMz2AkjuHTL/T0Bfm1OsXD77Nxy/Ve7GVirhRced79GmNFY8
	vNr9utWy0sXZgl6KPwSDOfLrc+K6I6xyOIyuk+ROlV0DxRCo2rl7PjSQ==
X-Received: by 2002:ac8:5f94:0:b0:51a:8c9b:649f with SMTP id d75a77b69052e-51c2af408a0mr26516501cf.67.1782931661162;
        Wed, 01 Jul 2026 11:47:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-51c10795464sm2199011cf.5.2026.07.01.11.47.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:47:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so12181181cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782931660; x=1783536460; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
        b=YrLlvpXYJXMe1RrAtoN1aOiShesnf+wHoFhmJquNBpLO6AW+aDdbwuuR8R3WhBMGmi
         g3s2MFZm19SeZcpt19j+XEIRaQ8CJhM5p/QHBQ3FPGYC7BfZTMVGswdiCBtCqpHFcWZ0
         n2apTj0J3jZYZqSnGe9c2qYJJqhDF187dIP5s=
X-Forwarded-Encrypted: i=1; AFNElJ/WGIaA69Bx4KVI1pitiMqa1qmQeJpqVDMhzzWbE1eNaQ9KMAsWlpRgDqFVkGaYl5+c25Zmvdt5nS4hN/2aHkKR@lists.infradead.org
X-Received: by 2002:ac8:7f4d:0:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-51c2ad5c37bmr24012651cf.25.1782931660581;
        Wed, 01 Jul 2026 11:47:40 -0700 (PDT)
X-Received: by 2002:ac8:7f4d:0:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-51c2ad5c37bmr24012221cf.25.1782931660134;
        Wed, 01 Jul 2026 11:47:40 -0700 (PDT)
Received: from [10.211.247.235] ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c1080d149sm57936471cf.1.2026.07.01.11.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:47:39 -0700 (PDT)
Message-ID: <d37a738d-f316-42cf-8dbc-99a732a33240@broadcom.com>
Date: Wed, 1 Jul 2026 11:51:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm: uapi: Add macro for chipset specific event ID
 region
To: Bence Csokas <bence.csokas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org
Cc: Daniel Kiss <Daniel.Kiss@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
References: <20260616134802.636166-2-bence.csokas@arm.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20260616134802.636166-2-bence.csokas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_114743_398090_81DDBAAA 
X-CRM114-Status: UNSURE (   6.38  )
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

LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>

