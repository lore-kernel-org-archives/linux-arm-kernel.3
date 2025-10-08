Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0C6CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 16:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MLcuhnYdeS//vkM0RdYjN2OKyaFw6ciE1LlE+RBNKiI=; b=bqUINUwnDqEiMDzAe+g4+RG6r2
	GSqJVajfafvJSMZmvMbrHVZvyXExjIrJt+2NlyvrmmeHtXyGgcQOA2sV/G6dH7jbHj18yleCKBs1I
	69TqhFL2/1HzkXNdF259jF5xYkd6te2iJet9BqMKcU4nyWU9USlHG3Vt3yQfIfry6UvyzrK1XSG8R
	GnksunfdnWsbaekr9kmQ4ULrmNQC6EVS+5nv+259Ew1S+Jw4/XjqbGaMtron9SmY/tdCiTifxtzFW
	o2GRPPYeyoHM4jq+1BDDzv7yrpRzlupjbKpbT2/UK6nrAm0+4DY/WkZ0XBGqdIr6pb9MFJgVRSv0k
	SZuq+rsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XVQ-00000004M6K-0AS1;
	Wed, 08 Oct 2025 16:59:12 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XVO-00000004M5k-1v31
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 16:59:11 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7bc626c5461so23414a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 09:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759942749; x=1760547549; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MLcuhnYdeS//vkM0RdYjN2OKyaFw6ciE1LlE+RBNKiI=;
        b=RBfXsqeVayvhq2B2jh4o5nKOvWd7o3jiLG2/OcIqnZrehSUk8+yQbaYt5N5/mWf9Mv
         cLKmGXuuVMTrh8660leQDXHth6Ft0V866kZQGK5Rg9NZLAOu2broY/5ZfM1sd8ioNsdx
         VQ6+92JhE9EpUXEgCpSUQ4mR48ABAUOKeEt0dKzMwn7ld4bKCh7JndBVwO13ovH7adWT
         SFEecrBzBPK9WrPg3tGL27ZVYJcSi/p3NYRf/01Liydk5Xch4H5ypvSDIVMG2ALrnZeq
         ASmQFApOnycSsEpdZpz8DIpM/FBrq83Xh7ZAtGrLYtgUIIz3eGOqTic5d30b1kStRn7Z
         4xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942749; x=1760547549;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MLcuhnYdeS//vkM0RdYjN2OKyaFw6ciE1LlE+RBNKiI=;
        b=H98B1gPlBe2toTqDnxDC4wzM8zNpmN7t3cnzi+U7paqy0wqh16GnALTWWfDYOw+Co1
         AeaLTfaVWsOrmIUgp6RqjR20RxMmuJSsPoA1kMJ2GGKcqsEknhsz4m/9U3K9/mHfnwn0
         YKKuy68zm6zPOKdOauN72Cy0hrEAXewA7jXjqsNp1kAu0vSDxNLi6x2+wzo78Ivxpmpo
         m4ecXJeIYbP0iPu5HvInQ6PH43r3epPCJSvwxj5yR07OSbUmCx6oFPiWA9b3Ez1eU081
         kSubfjMjmwoGoCpQRnKzA9yrcpDL6JInffEQPWy0/y/CVH4aPA1gmwoKvV2XZ1VbiFbA
         0rBw==
X-Forwarded-Encrypted: i=1; AJvYcCU1YJXU8uuPAEbofRTkaabLivkQh/qUZVwNtUwbUU54TwwkXlIe+HrlcqRi/cVJCEshXCq4GG+4RUK90pe+VimP@lists.infradead.org
X-Gm-Message-State: AOJu0YzQN7SdNPpuFd9j3vqgZwY2odo0zrsplF+HdNMGHJH0n1029cTf
	rbwv6OmbOj8AUvIXZiYPj72RTTV8qYWbBw8QeZFVEWa7fNofVWcik3RELMBV+SxBwy0C2Tjnj0C
	erI0SfCxC8wonptViv2CY4q0c7IaEyE0=
X-Gm-Gg: ASbGncs/KASxfGwdn/ONxGzQOYf1xPcbxIxiD/MerjA4kkn3KZMMEwa9ntRMANK6INW
	LQCWr7/z0yFbL7knYDaCCPpxSYFkPVg3wfg+sLeiT0na2uNukXhnuR361Ktqp+zTCrngXSX6RkC
	V4IZ5jePuhSjhgfH+W50v0uNNhZo3uVhT3di6ZrRC7aqAys3A9M7xgWhOuQi+qOkAlvfqNLKTf3
	e2x3SXQgudFoRqoRogN73MvR4pwoM+I
X-Google-Smtp-Source: AGHT+IEHNRpSIdo7vOAC5/CTCNxm9nwcjfLs1uz4t0emqHl8PeXBHERT2XRgnY9iwJQAHShegF2ijykyeAMCKzmSmqw=
X-Received: by 2002:a05:6870:d38d:b0:396:697a:bebf with SMTP id
 586e51a60fabf-3c0f8ec3786mr2343860fac.40.1759942748948; Wed, 08 Oct 2025
 09:59:08 -0700 (PDT)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 8 Oct 2025 11:58:57 -0500
X-Gm-Features: AS18NWBk5ITjlA51eJhw0UMV87d_tCnM9lWgm5SubtDSASZXlRaLJEmvLcAhNsg
Message-ID: <CABb+yY3nxSwcHs5YwWkmFq=DXoAwqGXdud7673kM32V2+Le1+w@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v6.18
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_095910_500444_7C79ED77 
X-CRM114-Status: GOOD (  13.23  )
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

Hi Linus,
The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0615f:

  Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v6.18

for you to fetch changes up to 3f39f56520374cf56872644acf9afcc618a4b674:

  mailbox: mtk-cmdq: Remove pm_runtime APIs from cmdq_mbox_send_data()
(2025-10-07 10:29:15 -0500)

----------------------------------------------------------------
qcom: add Glymur CPUCP mailbox binding
zynqmp-ipi: misc cleanup
mtk: add new GPUEB mailbox driver
     cmdq - remove pm_runtime calls from send_data
     gce - make clock-names optional
misc: change mailbox-altera maintainer
      remove redundant 'fast_io' in regmap_config
      mhuv3 - Remove no_free_ptr

----------------------------------------------------------------
Ang Tien Sung (1):
      MAINTAINERS: Change mailbox-altera maintainer

AngeloGioacchino Del Regno (1):
      dt-bindings: mailbox: mediatek,gce-mailbox: Make clock-names optional

Harini T (4):
      mailbox: zynqmp-ipi: Remove redundant mbox_controller_unregister() call
      mailbox: zynqmp-ipi: Remove dev.parent check in zynqmp_ipi_free_mboxes
      mailbox: zynqmp-ipi: Fix out-of-bounds access in mailbox cleanup loop
      mailbox: zynqmp-ipi: Fix SGI cleanup on unbind

Jason-JH Lin (1):
      mailbox: mtk-cmdq: Remove pm_runtime APIs from cmdq_mbox_send_data()

Liao Yuanhong (1):
      mailbox: arm_mhuv3: Remove no_free_ptr() to maintain the
original form of the pointer

Nicolas Frattaroli (2):
      dt-bindings: mailbox: Add MT8196 GPUEB Mailbox
      mailbox: add MediaTek GPUEB IPI mailbox

Sibi Sankar (1):
      dt-bindings: mailbox: qcom: Document Glymur CPUCP mailbox
controller binding

Wolfram Sang (1):
      mailbox: remove unneeded 'fast_io' parameter in regmap_config

 .../bindings/mailbox/mediatek,gce-mailbox.yaml     |  11 -
 .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        |  64 +++++
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   9 +-
 MAINTAINERS                                        |   2 +-
 drivers/mailbox/Kconfig                            |  10 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/arm_mhuv3.c                        |   2 +-
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  12 +-
 drivers/mailbox/mtk-gpueb-mailbox.c                | 319 +++++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |   1 -
 drivers/mailbox/zynqmp-ipi-mailbox.c               |  24 +-
 11 files changed, 418 insertions(+), 38 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml
 create mode 100644 drivers/mailbox/mtk-gpueb-mailbox.c

