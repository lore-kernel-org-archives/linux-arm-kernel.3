Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B85C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fAUrsz9OdOg3wQLEmYa5D4cgvz4ST0mmGNxgNjOcyeU=; b=V7qlhIPu/dbO8iOleP0B57DMyp
	d4ZlIW7M4mSKH5z96Auvp/CM6dx13FkAt6E3ckPBRnGxV7dwk+8rfX+bMnVGkPB7xItugzZhOqSJF
	RzvgazLOZWtu976rxYVe2u1Czod6hGXeWC4N2jlcuy3jriCNaNfld1BVcaSuqYUgbX41Swv7RSI0h
	j66ib9tLPoNBBS7GRH9rWDRGSfC8XKK69h7ICwWQMvD7+0ZUTlvPJIDtI4wOfwE/LtMeqcC4bAA4h
	sxOku1E/Lj080hchpil4/J8LYU6njXnBrPFKQ8qGrUNNyNdPKw+SwetTfRYGjlEQU9tkvPrTa2gDh
	NlPFX5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txP7u-00000008Nqp-1Bd9;
	Wed, 26 Mar 2025 11:40:54 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txP6A-00000008Nf1-49JE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 11:39:08 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43935e09897so42385155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742989145; x=1743593945; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fAUrsz9OdOg3wQLEmYa5D4cgvz4ST0mmGNxgNjOcyeU=;
        b=rJMj5ky8thjMTseH9+M7NH2cWYNd272+6RltbS5qpmPXrupIK6mCPWDKlFUY/odqGR
         yDiM3M8m9lX1ZdxVcKjMOlRnPhmkScb5wn0m2MISEPP0cSQuocoA/RSuw/8/ILtbsY1N
         b3o8398LmdvmVEqACMWSr3OgjymLDOMh5eyLzeF/ff6OpLMRCOxBakoaW7vQFJbJhXmI
         yeBj9jeQ5Kw+Ktn0yRIPaZoFsXMc6p5PyPCUKPPfMR8FOr5P1fyFmryDqCxdPQykbClT
         u+c3dN5w3+QNhRvtBK0JkiuzaWwtDq5wJt27063DCkQPapQ7XAOEyE1NskUOfKNLDg0E
         0ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989145; x=1743593945;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fAUrsz9OdOg3wQLEmYa5D4cgvz4ST0mmGNxgNjOcyeU=;
        b=AumOpUKeXeiWYinApkGl7K87o9maUy94jmlJ4E5lZhPM3xLbJ1jLxvRaJ9NKtOIJuo
         WKSkOKW+sitSURmZz9L9FiElqInpa0BalFS/LnsZaN4uAT/gC6SRTeq+anh3gxx2IYyo
         SsffBDXsqrVAN5kQUj0NcPtHFjhdtLm+mExNRXj+lMhCZAt01EHVVdpDGzCL/Jm21smO
         gU8Bfk58JHT4ho+zMLwm0pI/S2J/R7Sb9K7kvHGS4VQ+eNhou6y3C6Dh/f4KYF5Gxld/
         t9Obtlhoe30JKZgnpnSJJW2WYQoNDyXxHsfMekIq6JrqxwUyqww6OCoAK3Rq/smV4t4V
         wtGg==
X-Forwarded-Encrypted: i=1; AJvYcCVN56S3Zv4XKgCtE2w35p47ZHESl/JCeYYjUboG4/tDY2uyWm07L+MSRJPuyrnBblAM7KjaJVy2TagFDDwxV0Hw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9yEnXWr3Gv1wCumZkJQKR409ivAOncEZZr6xM3Kjg1FK3VhNL
	c6iHLgn5h5MyxrzV5cLeDUvjjiPoyQIkrsvrK1t8fp+F5QjhXPbIAif2XyIf69E1T+RPatWf2ll
	hcGcIAZ3XeueDzlw+BaJS3agOQQ==
X-Google-Smtp-Source: AGHT+IGHwZHepscP8ejJ/xKjHvWMmfkRYj/uDkAFERn0R3gk+2OvGbhbfX9XWEWX38kk7ftW0gGcZ4p7ZxAAjcKTqDs=
X-Received: from wmpz15.prod.google.com ([2002:a05:600c:a0f:b0:43c:ef1f:48d8])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5021:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-43d509f6307mr221896365e9.18.1742989144752;
 Wed, 26 Mar 2025 04:39:04 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:38:58 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326113901.3308804-1-sebastianene@google.com>
Subject: [PATCH v4 0/3] KVM: arm64: Separate the hyp FF-A buffers init from
 the host
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com, qperret@google.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_043907_031394_D2E070E0 
X-CRM114-Status: GOOD (  11.90  )
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

v3 -> this version:

- moved the definition of PARTITION_INFO_GET_RETURN_COUNT_ONLY from
  the driver code to the arm_ffa header and dropped the definition
  from the last patch. 

v2 -> v3:

- dropped the "Map the hypervisor FF-A buffers on ffa init" patch
- added ack & reviewed-by tags
- don't release the ownership of the RX buffer if the flag from
 FFA_GET_PARTITION is (1)

v1 -> v2:

Split the patch that maps the ff-a buffers of ffa init and introduce
"Move the ffa_to_linux definition to the ffa header".

Thanks,

Sebastian Ene (3):
  KVM: arm64: Use the static initializer for the version lock
  firmware: arm_ffa: Move the ffa_to_linux definition to the ffa header
  KVM: arm64: Release the ownership of the hyp rx buffer to Trustzone

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 12 +++++++-----
 drivers/firmware/arm_ffa/driver.c | 26 --------------------------
 include/linux/arm_ffa.h           | 27 +++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 31 deletions(-)

-- 
2.49.0.395.g12beb8f557-goog


