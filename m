Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BBBCA0EE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i58vDD8ciCG4tqEiOdS2g0gU9MJ6vUoA6yHuonpgaXs=; b=xQATQDN7a9hUeGF4C6eDQkMsia
	LpP95jheRyuVrXWp8sYDHeX6lvOJrTPcVG/B3TzGxKhpS5MrC4lHXMysmeKNhosFZHvo2LrnGdPvE
	Aq4ZMOVvux6+9wpMViyTDQ1Q3DuX+lFEsOX9O/FpAlfzgBEIpljIKw0AlnDHdZaoII5svQG1kLBpE
	lfO11NZ2rybcVC57UiXkKSpUGUdIF8SGaT0C2gpdjc4qeo2erWZWRLC/uPOzQ6Gl3uQlKLgajFCKz
	GCoiyodZ2iS9QbrFqbxHTIWcQsom4eY0tZMTKRmpOSBACFvgD79YQrh5+3JL2lXbCKfS5haDNhMlx
	VTW+fKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrA-0000000EeVH-2TWt;
	Wed, 13 Aug 2025 18:05:48 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEb8-0000000ESkW-00dL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:45:11 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-61865148a8fso1024854a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755103508; x=1755708308; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i58vDD8ciCG4tqEiOdS2g0gU9MJ6vUoA6yHuonpgaXs=;
        b=dS7LNSFVN46wvijnd4SzVqS8ge33iCZ8+Z2nsWEWfcS9uB52sP5ArAhcsABRo5YqTn
         dhHS1WIDKGPnHTPZjL2dwdDysMZAdmGbTHD1EHoscT5zOcPgwooKs3mYrKuGPgjbGKPB
         0r18/Jn87lFL2lkgwaiKaZh815g3hcMIuTpwV5sB2qN5yrwvUlexDHU02H321SPzPrf1
         1EtUp7X4B2hPuyPFCgZJ3kCuWa9n8//3xiRMEFYaFuOcH4GQT1JO34bKnXSSDQ7N5wUO
         9nVR4JKgrEEySU95rxgGF0IcwnA121dyUKCkRR0gCxHq+ZbFZQVmc7bNjSwUCaBOePXg
         K8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755103508; x=1755708308;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i58vDD8ciCG4tqEiOdS2g0gU9MJ6vUoA6yHuonpgaXs=;
        b=KTctmV1Mrqxg0IwSlBTIHKCBiHVn1IKZsYcSK0u4TEnNnGfrTP2JKVSyTMA8k9jzb5
         aeNnlckChEPqBHbRq/N6ECneTc4iyFFttb89QzkSPQyhBqRGMZhlfujdzJ1dgBxgEHHQ
         377gRSIXviA0FHin49xZjSVxQe+avzvq6goiFInC98AP/xOa7koPKGUS0xi73CWSL0B6
         RYMmUeXMRC5hcfoZhg1gvL8uRq56OsX1AxV0l0zohUfhOosxz1Ml7IsMxoSGNZn+28HL
         DiLAiDSUHoVlukvinLWmdvlnSoEt5IIEMRJYj0pmMU/tpOjpmlzv8LO2xwfEY7xBXxUX
         Nu/w==
X-Forwarded-Encrypted: i=1; AJvYcCU+oT+D/Ue1tj/KdcXQNWam9+w7TwMeRdwjzFiT7wE9zWsjEsJTdwlxwL8cifjwosdohKsRotIXydd6U5zTcTzw@lists.infradead.org
X-Gm-Message-State: AOJu0YwvJ0HKsXmbEorK9ZwF4tImqst6MkOnryL1B2Q7M5GpFPfn36DS
	gq595C4s5M5UIUJ2IFiI/mKDPcQYdV6B22TPvMSg3bPl+CYfZbons0SKhxR/F2ECCrDvdzZzAGP
	kmA==
X-Google-Smtp-Source: AGHT+IF0drcCjeBdG/uPQgP82HDkur1vntaYSIKvrMuZrEM2KABBBPD2dmHvJX65Xz6iE3/3L6JbiBwVPQ==
X-Received: from edj1.prod.google.com ([2002:a05:6402:3241:b0:617:b625:f131])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a50:a6d3:0:b0:615:a847:c179
 with SMTP id 4fb4d7f45d1cf-6186bfc2c65mr2002154a12.18.1755103507594; Wed, 13
 Aug 2025 09:45:07 -0700 (PDT)
Date: Wed, 13 Aug 2025 17:45:04 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
Message-ID: <20250813164506.1203851-1-tabba@google.com>
Subject: [PATCH v2 0/2] arm64: sysreg: Fix sysreg field definitions and
 generation script
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_094510_040086_1E1EFF97 
X-CRM114-Status: GOOD (  13.52  )
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

The sysreg file has an erroronous value in the Security Enum, where
NSACR_RFR is set to 0b0001 instead of the spec value of 0b0010.
Moreover, the file has some redundant definitions, e.g., RCWSMASK_EL1.
While these redundant definitions are not wrong per se, they add
unnecessary code into the header file and could be a source of future
bugs.

Fix the Enum value, remove the redundant Sysreg definitions, and while
at it, tidy up the sysreg file a bit.

To reduce the chance of this happening in the future, add validation to
the sysreg header generation script. I didn't want to go overboard with
validation, so I only added validation that would catch the errors that
I've seen, which also are errors that wouldn't generate a build error
later on.

Changes since v1 [1]:
- Remove redundant definition of CPACR_EL12
- New patch that adds validation to the sysreg header generation script
- Rebase on 6.17-rc1

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250808123744.2087648-1-tabba@google.com/

Fuad Tabba (2):
  arm64: sysreg: Fix and tidyup sysreg field definitions
  arm64: sysreg: Add validation checks to sysreg header generation
    script

 arch/arm64/tools/gen-sysreg.awk | 20 ++++++++++++++++++++
 arch/arm64/tools/sysreg         | 18 +++++-------------
 2 files changed, 25 insertions(+), 13 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.51.0.rc0.215.g125493bb4a-goog


