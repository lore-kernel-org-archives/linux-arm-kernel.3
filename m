Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD6CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 01:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UPwvKPga+4YAgt5EQqAV6b2OdS+lrS5y9910tNFvgDA=; b=Uv/Cj16R+2ASViL8Eb6pYYbumF
	2adWEhhf91HCPIPB5WJOPX37YxJPsueGspSK/qudJ2mIFfyYUlkhFpRjb896WkHprNejbI47m98Xx
	TZ/eBh2xRN2ViayGsr4D9glFvV7+l9p+ns6T7fT1RUYVuWf7D58B/Rp0/DhO65ZSfROq7sr4dR2ZT
	LwLq9Xq0SyIa+txT+pyAwXoaPw5fRJPCnN9b9ve6LNUMMbwZf7NYs2i26FcmJkNs5W1kXLbHmVEHc
	o4ufE8FT1W/MSVGosOkXq/5vix8wdyBeQ2Ae4urfmQT/IIakF/sW0Cofb7CdWTVlb0S2pQxfG/BO+
	A34F3lWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmn2-00000004pIz-3QOs;
	Wed, 02 Apr 2025 01:21:12 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmlK-00000004p2d-0Ck3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 01:19:27 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-227e2faab6dso98563875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 18:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556765; x=1744161565; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UPwvKPga+4YAgt5EQqAV6b2OdS+lrS5y9910tNFvgDA=;
        b=JKLriPYhuBWlArApoLJdCD4lA7p/4HkJV06t2Ux4sldhrXHprdJPf3zvQZIj/7KDNm
         f+mU3xx0l7ANO4qDbb3xdm0RmbEwtD9nKBiDmKpLzN2BlQKtStSRBegZowb2KvEBjUn0
         4UglyRiBLJF2ASfQkG9s7bJmzwAH8yhapVve9spqkyvenfegxRvx/5fo+2od4bGmFU7r
         oclGiwxxWabcHC3NbTTj/E52qqqhHl0Gtde7YjrItuzgSHGViWQAih4dMqs7AwjuaTPJ
         j1T8m5dwjxR3JQPF9sbmCo1QpzcdT5+/am3PemERLHGOdcmFeosucqMtLa9d0XFx8fBx
         m7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556765; x=1744161565;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UPwvKPga+4YAgt5EQqAV6b2OdS+lrS5y9910tNFvgDA=;
        b=s3VsknXbntPT6xD+DUrHAgBOJgJ0KZUQzLduKoqY+pc7PMksxhshjgpFFgv527P+4w
         bng6yn5eV2JZeOkPCx+pE0HA0iOHvzwRw39MFZox6SLT6buzk3iVCEUzbqo7NkT1zgKP
         CIpF51pxBE23lpB4KN282PQYxruhXPOseGrs8YYhBAZqnkXpPZmhGM1IqgnUfgdTffCF
         GQ9mJXfOTq/Uk4ZJPIah/aDrHE/V+XWq8qMI3bd44G/mhn9KfOdqa4cFT8XlEKJsfQlI
         xDF5nvAWOWXmvd6FW1fLu1sdecctCrrnPmz4gIBnd0XnVc+FKsnuU+LKzRapqsmbysv3
         TZRA==
X-Forwarded-Encrypted: i=1; AJvYcCUWOGr/kFYh1PwuRWdikjcMfse4aF7Kr7s3ztl/qbi99AVtj4JnGmDiX/04Sj2IcvbQ5j6KM6FkZz77XIDqvGax@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt5iwZF/yeTVIfxKg0KKBVz7yqjEosJwiACmLoeUV0JZzHHcrC
	6vuRI/cwXLIPuimS7VdtXx4AEWnCnhZTciRXS/AsSMsbeQGyOe5GQO/Xxe/mv4wbeS+OSbcYc14
	a
X-Google-Smtp-Source: AGHT+IFmbltUl6jqRWTrpUdS5JgvD4xgt7cXsuIH5MV1XRARYJnix9g8oSZjsewpNEuvhgzJthKxbl0V3lU=
X-Received: from pfbgs18.prod.google.com ([2002:a05:6a00:4d92:b0:736:5012:3564])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f8d:b0:736:476b:fccf
 with SMTP id d2e1a72fcca58-739804397f9mr24081808b3a.18.1743556764708; Tue, 01
 Apr 2025 18:19:24 -0700 (PDT)
Date: Tue,  1 Apr 2025 18:18:29 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402011832.2970072-1-yabinc@google.com>
Subject: [PATCH v2 0/3] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_181926_106249_31CE2C03 
X-CRM114-Status: GOOD (  10.70  )
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

Hi Coresight maintainers,

When tracing ETM data on multiple CPUs concurrently via the
perf interface, the CATU device is shared across different CPU
paths. This can lead to race conditions when multiple CPUs attempt
to enable or disable the CATU device simultaneously. This patchset
is to fix race conditions when enabling/disabling a CATU device.

Changes since v1:
- Use raw_spinlock_t and guard().
- Add a patch to check enabled mode.
- Add a patch to disable helpers when fails to enable a device.

Yabin Cui (3):
  coresight: catu: Introduce refcount and spinlock for
    enabling/disabling
  coresight: catu: Prevent concurrent PERF and SYSFS mode enablement
  coresight: core: Disable helpers for devices that fail to enable

 drivers/hwtracing/coresight/coresight-catu.c | 33 ++++++++++++++------
 drivers/hwtracing/coresight/coresight-catu.h |  2 ++
 drivers/hwtracing/coresight/coresight-core.c | 12 +++----
 3 files changed, 30 insertions(+), 17 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog


