Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF995C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WML+/ObPWkSPRoaiWIHFm8yG2IrgtdFB4ZBzBau4x8I=; b=hejdrBdBKWYriNxmXBD4qcgeCm
	74nfv+O+uEwN+Klkvt9Ns04Cr7Z2zKeIL2SceNLQAPyNDAIEPMe4b8Yge2MzV9GbjgdcM7qlJwu1O
	Ct9dghSin7u+59gh5/fwJZrv1pr7n4DtU0/0xam172ogcwOB5wgMNpmaTaz4eCzQj64fdDZTUisY6
	exj4U4N05NXr8tU9pRxP7lMi//tvJ8cTd1le4g2nroCdGFy20fVzitHkDJ+Lkii7bD3UArGLc/7vJ
	uQfCiFW3h++PMtqmtIuBqkf5owyzW5H9eHPzcuojKyI3afYl5ew8NI0LWXwVl2OBfvKSdsLHJMY14
	NbAD5/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjlw-00000008ccS-2Wbg;
	Thu, 27 Feb 2025 19:42:16 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniSK-00000008JBs-2uT5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:17:57 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-390e27150dbso1039659f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 10:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740680274; x=1741285074; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WML+/ObPWkSPRoaiWIHFm8yG2IrgtdFB4ZBzBau4x8I=;
        b=Uxu9l65tNWACi6mIOLUZBGWzoyO5sm3TaL09Tc31J6/ea178u3N49yRSpCpE9NY34y
         tBuX2d9C9fqYRrvlKEAs3gUI604qpec5Y+S4wuaeonC8W5B5du1n+KHfMgaaJTdioptj
         BC058Gc+7mKRwMNbslYcEHFUU+kB/oVnmnEr70lo98HumnriawoAEpjVupYaIexII9yH
         +OICIKN4Xezw/FImFhCCX/fcAS6Yerx2Ou9QoVYCfqSsjN/GpZFZ0IjPJrHqcIVw4HaP
         QotCDOyBAt6jHP3dNpYUlzRIPLSBwrE959zD8J3hQtBk42ZqtirITdtXfxg7/eGdc1d4
         QFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740680274; x=1741285074;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WML+/ObPWkSPRoaiWIHFm8yG2IrgtdFB4ZBzBau4x8I=;
        b=a4Yc8jwwL9Tb7efL9ANNPd1bYHtj1yqsJOJyLdRbJOdqnPPATHSEax7ZQ01vA4XHeE
         dvSj+OrjDVdqShNoyBSRT0qPNB8etLq6lrPbhET1LcCehFwr5fbpLULzvZnj0DPdA7bG
         t7IKMszvQ1xU1MaoPAkpfQhQAqQ3vetYDRQgBSUbJ9+Xh8Q4Co//V99b8igqYX6bPZXo
         YtSZXm5exyTP5gg6QGTVKuL2Xq96rFjhYToOnSYOAWV9C4lE/yD4MtgjNYaJqjW8GYnw
         uIOnJrzrlv6VdjNn8qZQYN5OQQj5jQcA/AmcIUJpHQlfeDbPaFa71w+bjEM/0mr6jM61
         HYSw==
X-Forwarded-Encrypted: i=1; AJvYcCV6EX4Sn06w8AvYAKVcBXuvxc3vxGy9l0oDfUXgaZOFk0H6WV70UcDoU9oG/h4G8iBtQAOKdcYPInkdG+wr0m7d@lists.infradead.org
X-Gm-Message-State: AOJu0YxK7mhFnpqhoNUuzJUf24lvuPJ85l2MIgzrw7vNQ7uCLp6KaXGX
	L2GHRTf7myqaazQtEyOX/eJuhfNf5aDEByxIE5jibXd9Ot5kmi6X6zUvu4aqSRYDP0EdDVsJ79f
	mQxntF/pO1Ii0CI8tZqKIs3TuIA==
X-Google-Smtp-Source: AGHT+IFFgy3uOiYkfgXSKvEHx/UgS5vFK40ACXZHcvac3+mJfnimRkLhC2vM9vssr/5l88QZLrGZkaFEBXqbcHd+ZhA=
X-Received: from wrbfa8.prod.google.com ([2002:a05:6000:2588:b0:390:e9d7:900b])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a8f:b0:38d:d274:4533 with SMTP id ffacd0b85a97d-390eca41791mr151865f8f.55.1740680274621;
 Thu, 27 Feb 2025 10:17:54 -0800 (PST)
Date: Thu, 27 Feb 2025 18:17:45 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227181750.3606372-1-sebastianene@google.com>
Subject: [PATCH v2 0/4] KVM: arm64: Separate the hyp FF-A buffers init from
 the host
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_101756_729113_2C3D8FD4 
X-CRM114-Status: GOOD (  10.31  )
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

*** Changelog ***

v1 -> this version:

Split the patch that maps the ff-a buffers of ffa init and introduce
"Move the ffa_to_linux definition to the ffa header".

Thanks,

Sebastian Ene (4):
  KVM: arm64: Use the static initializer for the vesion lock
  KVM: arm64: Move the ffa_to_linux definition to the ffa header
  KVM: arm64: Map the hypervisor FF-A buffers on ffa init
  KVM: arm64: Release the ownership of the hyp rx buffer to Trustzone

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 56 +++++++++++++------------------
 drivers/firmware/arm_ffa/driver.c | 24 -------------
 include/linux/arm_ffa.h           | 24 +++++++++++++
 3 files changed, 47 insertions(+), 57 deletions(-)

-- 
2.48.1.711.g2feabab25a-goog


