Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3279EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N3L7AviT9xfQLqg1ssfgAz/hdS2zhgqxmqkg15ECEOI=; b=DbTjFYmB9e/qSPrCIvcvV1X0oQ
	lQ+IMOVB3OjjKWXH6tPnFkBZTRilBMuPETIkRn0z5/emF5ZPWKFcIfkF9DNGPHKbTxkfQHtnPs0gh
	kyyvG/9hsZgHjrALqaCayxricN8paeipFK/PUznlQ0Iy1c+jYXeBLJBpZ31TWAyB/faYUeJfRBapm
	QihUP/Ltz3z49oxJt8bKDYkUWWO63iw0Jhte+GqaYcOYoRogi5nh47WXfRTAcTzBUX+RZOg2F5S77
	WNzOco+NLmTgot7JggW0K8R4sL/CQs76g91VdqN5j6rOUg7cHX86RpeTK/IdoyEzl2AFbZ5kQ1Ugb
	AD6qBiLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPMF-00000005X1j-2CUV;
	Wed, 26 Feb 2025 21:54:23 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPH1-00000005WM7-3Sux
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:49:00 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-438e4e9a53fso1711695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740606538; x=1741211338; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N3L7AviT9xfQLqg1ssfgAz/hdS2zhgqxmqkg15ECEOI=;
        b=Qk92FnrX5yfjf7S4PcIuCoKD2n69xwTNrPkkTDyoZOQy3PqaxMYZUT3Ks4cH+Lz9Fz
         M070AQc8smFHrkH9T22jE+My24W1l6OQR4FJsIiDWlOmieL0dUJH3OkLdEkcDTXtvawp
         D4GoftZxUlvArxT1WSXpgnLkDMglTNGpamJ73eTdEujI+82QAI0+XQw4TVD98CSnSqcX
         Jcr1E+cxraYFdMwN3prHMJIKrnaJGSozAadGMXQ4gq9OzKwOcbG3/amzACyssuiPyg8I
         9it/vDWIdCrsPM2ofW+X+UR43YmGaIH+Nr7WRyhleGD8Y0rsIO0/MlVnp8tOmUMyKkSs
         Zq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606538; x=1741211338;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N3L7AviT9xfQLqg1ssfgAz/hdS2zhgqxmqkg15ECEOI=;
        b=E9mUVGpZhMLyFOShGIUjroTPd7CzXDMABGQBxlcOnYm9XOJ68m4VGgXEj5LZfKNamd
         Q5URZCv+remV6oqGQaAmOc3JyHGlenAQ8sIuWXx5zrVvX3TL+BhoT2NW818r9Hiax7oJ
         hVdw3SxxCmhAyyToBoroE4+oVQXvw+oFtt/wAFKnsTycuke7+WRxqf7forIXWvDn2JWG
         L5zn9NS9p7DUOR22gepZvAdkN2tq1sUJnfrJ/KdbcANC2UQXNGuvRH3tfArKfRF8ldWt
         ebCVFXWZeFzJ6iKCzqzCgjSPmMMQQ4Y3Qh1ij4F6GKBtDuhkWi3sOsA3GN/7OudNttEv
         djBw==
X-Forwarded-Encrypted: i=1; AJvYcCVbQu75e5qDjJxbJS20ceXGHQ7OwvvSi8BYfs6w/UNF/AJHvKi2Fr8LP2SgM5Y9ZTQeIQT7a1vRL2NImBx4T0Op@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp6BSi+Hh+CEsE0+yvWDyXHyK3IYYc4vMjvTCa5pcNwI0n8v3C
	ysK0WRG0gtxxfZnzjsZT/XwDHfSu3re4iYe/WvZjE73tMYVr4POA0UXpLA7rGK4uXGqQklGnhk4
	gZ0A1Cjv/Cul8aYM89684qeE+Ag==
X-Google-Smtp-Source: AGHT+IEA6UUUAJ9uECoMio1DestFhpWyyz+Ts8rNvs4mLLNlC2cQcJ944oVmRih7EryswtDmHignbakfjjpmw8U0FII=
X-Received: from wmgg7.prod.google.com ([2002:a05:600d:7:b0:439:67c6:5642])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5489:b0:439:86fb:7326 with SMTP id 5b1f17b1804b1-439aebb5558mr165297465e9.22.1740606537893;
 Wed, 26 Feb 2025 13:48:57 -0800 (PST)
Date: Wed, 26 Feb 2025 21:48:50 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250226214853.3267057-1-sebastianene@google.com>
Subject: [PATCH 0/3] KVM: arm64: Separate the hyp FF-A buffers init from the host
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_134859_861552_FBDD0088 
X-CRM114-Status: UNSURE (   9.51  )
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

Hello,

This moves the initialization of the hypervisor FF-A buffers
away from the host FF-A map calling path. If the hypervisor
cannot map the buffers with Trustzone, it rejects any FF-A call
when it runs under protected mode. 
Other than that it moves the definitions of the ffa_to_linux_err
map from the arm_ffa driver to the ffa header so that the hyp code
can make use of it.

Thanks,

Sebastian Ene (3):
  KVM: arm64: Use the static initializer for the vesion lock
  KVM: arm64: Map the hypervisor FF-A buffers on ffa init
  KVM: arm64: Release the ownership of the hyp rx buffer to Trustzone

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 56 +++++++++++++------------------
 drivers/firmware/arm_ffa/driver.c | 24 -------------
 include/linux/arm_ffa.h           | 24 +++++++++++++
 3 files changed, 47 insertions(+), 57 deletions(-)

-- 
2.48.1.658.g4767266eb4-goog


