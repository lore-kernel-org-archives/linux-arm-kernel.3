Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA37CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 20:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2/TuQL3kQKm2Ps4XEUaXLRCzG1Av6dinL8AdUC/eeo=; b=iOBk14effQLdw1i9/95qwwrjwP
	NS/IW1k8e6nBxOw0u1B+zOXJ7/oeY0IFmPvv+IuexLRPkfi1UrBSDbqQ9tKKn/eeXq7s2DClpzp3L
	wPsfr2V/ltGt2QfvTh05pxW1ZKTQWSNnILmgOYy6M5RwXrjfXtVzwhhG6H+NKHHXNhH8ZRxaVKFc8
	CbyIYBYFJQJIJkOTSmFogYtKIN8gJTzZrWieVgyJKMeGKXKxBcoailrydMb7kkVmwO3NOqD7TdqNe
	GmdNFl1Lg7DOcAlQhslD4sgyoUV9fReouPWBRKOisidrS+B01axuarkwue6HJzTa78+4nrEpr0epg
	oAkep5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAaeA-0000000GbiV-2Z85;
	Thu, 01 May 2025 20:36:42 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAacC-0000000Gb28-1i4p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 20:34:41 +0000
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-60638c07cabso786724eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 13:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746131678; x=1746736478; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s2/TuQL3kQKm2Ps4XEUaXLRCzG1Av6dinL8AdUC/eeo=;
        b=QVL01jDFcFEo+a7iQK1wD1JLaTcnoPSw88JZHzJjgIcs8iZbwPeJ/Kv/Vw8NG1Z5RB
         WvuW+13HC84YXrnQNnPqaGd2UeTGg0+zS1YbndUqOvk3HGpM9eZ+klfkIcsPR5PhIiee
         ZWAwZiBNpI3rTg8BTgeTHxEheQpkzQGK42Q9GV/06gzd7sVjaAFuy9giiAt6DcbG0v4h
         KYCzjZLTAAvq2RdU1xbFp3rv8pYZwdh82bGENjxGEHGWmOdSAhcspdwLlES/xStEWGi4
         aJzpYtXKJ2mDHqr9kXbRyGKOXPGAHJL3YR4bQLHfPP04p/obY8U+yOsQseec/qKAa4yu
         hkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746131678; x=1746736478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2/TuQL3kQKm2Ps4XEUaXLRCzG1Av6dinL8AdUC/eeo=;
        b=njjQGo89S5TL2FlsfKhf4bED7tCli9kmN9Bu33Gd+OB6JnIW1uNtGNqKRnYJORKHm1
         zhONtLcG+1vESqBSYvV8qaRGf521gRUEsspISltZ4B78O1c0y//t2nHTOJAxezpGN4Ox
         GO2/ngIk7mpvCCSJw6W4grlStA6moehpVXBco7LV0xwD/sPOIvhUhXPu8nRTk+1hlad9
         78KMIf7dH6gC5GtAbaZyCe1bQdpDAffWUs4uAhKXLyG+46TTml+iHUIiX95RS+UmMA26
         3x4go7iPB8Dc0MVG/SLjpBbIRQNaNuceZvAO2Cakbt05SN4J5lnVsQoTrgNG6r8J6FjX
         rucg==
X-Forwarded-Encrypted: i=1; AJvYcCWHCQAAbY/KAi/aElj1i9rCTPnaQHi9r0+XAKY6kzp4sBv5ZqmKYTKvj/pCLNNGD7FOzBNvAvLyIJ1z+Vc8CMno@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl/STznkLeSdP9j7AMk33fG2mHF3pxy+xi+O6O7JjutR7cPlnl
	RikmlFcaez2EIB17X2ljrEZWF9ZxtSx9fLxu+/TkKZDS98xYHSjVb4nxlj61CwHzxX5ipMcoNEB
	U8HrIkWXYHmzSIAj5Y7xcE2NfNHHHODtCVScEVA==
X-Gm-Gg: ASbGncvT9j2y/5Q7S8HOQ0CKLH9ERdp0Nc4nYX0FB6vVCoNmfx0RGTw8Xfl3CHXCthP
	aJiEtDuTG/ShdwLdMS8fcrtxjEbklMk9pem9MxOtPCLlRLSVRD7YjqCu2n0suRhgbi4tUhubmYP
	X2JXb5lJ6o41lCZMllpKVgLw==
X-Google-Smtp-Source: AGHT+IF6bq7NXLJi5546fpk08Q9+VHouk/Ivf8VOZeleLm+nJv5PjsAxN/cnoxBRn6+mutu/ZCv+/Az9E+zhUFk9998=
X-Received: by 2002:a05:6871:7419:b0:2d4:d820:6d82 with SMTP id
 586e51a60fabf-2dab3313467mr143467fac.26.1746131678613; Thu, 01 May 2025
 13:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
 <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-5-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-5-1bcc44fb1d55@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 1 May 2025 21:34:27 +0100
X-Gm-Features: ATxdqUG_Q1uY69qq7IbymtjMCwucexqjDWrXAetFETrm0a0bcDxzCmS7-g07qNE
Message-ID: <CADrjBPrRmQKvuTMZXAF+gVgMzkDs1=9LkwrW7CHGVEYG8c8bsg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] soc: samsung: exynos-pmu: enable CPU hotplug
 support for gs101
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_133440_455751_4E1BDCF4 
X-CRM114-Status: UNSURE (   7.37  )
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

Hi folks,

[..]

> +
> +       regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
> +       regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
> +                    reg & mask);

I just spotted a typo here in this patch, it should be
GS101_GRP1_INTR_BID_CLEAR. I'll send an updated version.

Peter.

