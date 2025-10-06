Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9516CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rPUqxHqoYN9o/nXYPPPYebq9RP8korJ6LZObH1VKs1Y=; b=Skg2m1ZLb8ercl+1ikH1oIz7VQ
	2ZGBFvqd2+jJi4hnxDOwGyZcpy4Iax85J4wIazVuS4H7jANLiuptp8HM6Ni+MXAwh9J1PEg/UU7GP
	yfOPGodmLVtALXKlp/r3z6umIaNY0rQLvHFnktnIRMR6hHSGQL9j4i55u05vpuAPExTtfaDzy70o2
	BPaF14MGysnFTkpHpmTFyDxeUgCr352B7EulxTJjjzcQBYFRT9n4w5yf6ZIObbWM5Ejw652FsFJlo
	IHj7fEi39NylwMHPKv2AU6UkxfgYTXzDy3VaurxyzEgkOwTQvBvQWu2Eq/gEscvidd5k0QNsHefYj
	S27vPyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uDv-00000000xo7-2oWz;
	Mon, 06 Oct 2025 23:02:31 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uDs-00000000xnk-3ECt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:02:30 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-92aee734585so216959439f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791747; x=1760396547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPUqxHqoYN9o/nXYPPPYebq9RP8korJ6LZObH1VKs1Y=;
        b=iU4m1aUtKNeOhdSn9aCfU4SAaXPJzAp4X/S5q5rTc5ySx3IWVJXbbcd4H6EncRA/rV
         dPWMsptp9rmjZuFSl0XhYi2VO0EJDTpZTqoCWRj/ELPlUtcOmEsVTuH2pG/O0uaayglm
         tivSaoZdu743BB0MhY+iX76ouYm+P6+E97mUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791747; x=1760396547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPUqxHqoYN9o/nXYPPPYebq9RP8korJ6LZObH1VKs1Y=;
        b=uQP3sc2f9MIhrF/CStIXtfeTsegjGaE16y967bW1tAuBD8zyVvG2IB5zAaba6ASRDn
         H6x5CkpRmZ6/buosbOAk2So3Xn9w4dQraY0+0Arr4R/+ghh4TFi0Oyte+IhYVNEnvSiY
         35tXxI2RA1hbQ3w10TCZbDzpNXW9FOGjmKLyqpL4kpmjZIaDPJQtL0mPNkcOmjSYvMRx
         vk8yLH9Qbvl9SOlQsYxNlO7/8OZ22Jafs9pzw1gPthe7Y8u6WYI96lUjDP0tDUinMkwW
         sbf8LMS/10PJ8AgNBjBNomWUBPxIYUuc+AKQkPZ/FyLLDNX12QLKjerpZOSKFnxzT3q4
         2yLQ==
X-Gm-Message-State: AOJu0YwJOk8blyo20aHNCiUkaUSfOU6UsMbXfmN8O06ke8LePnpN7ORs
	5I4eEBB8cFf0SZpqGZ1YKWI6Eq0vn+h4m0qMbcmfBNXnp8RmmBRedp5gGHcfsY+hkf68m50/6Pe
	wBWJ2Vw==
X-Gm-Gg: ASbGncuFOwjFH6bCuYQAp8M3KV2SfF5ONjF7IyYKONM7e4UFEI1Gt/vwnhSVh7FvbFM
	VYNX3UEUVR0fLm7FEZBWcChESQuSqQdYX2CJCL1EhOJBzaZ7BOqWC8TEcvuQUCW07tWHIcVt5bb
	nHrKEJmCgLkaZ6FxTKjUgz3pSaaYg4QJ5q/0E1T6i211heevV1vXOc05/tCZLKHQYqYbsoPZvha
	D9EO8jPIaRbwKCNzOxTG7sWALgehcGcLBuz5poAeK4IUwToIEMDnetyXAbTptCTpTKygBzYlU7I
	vY8e/N2Zi2RssTqjcWqrnedr7OCfPQ+IIVVQfY9qc78SRTI7FKw7JrGTJlhbPxBflJ77VkKKDuz
	fxbYlaM1DaC12TxH5Dn0Lo9vqNEgFedWLK7JnUmEPcQA/7gLPcS6/Lg==
X-Google-Smtp-Source: AGHT+IE7/YGoPn47lQ3d5uWVlrWlTdbeR9OUwTMznvi5Kz+D26CuC+sguo/JsRy3VZbgrzZGikj0VQ==
X-Received: by 2002:a05:6602:1405:b0:887:574d:dfbb with SMTP id ca18e2360f4ac-93b96a5a9c7mr1831470639f.11.1759791746857;
        Mon, 06 Oct 2025 16:02:26 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec55bc7sm5422226173.69.2025.10.06.16.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:02:25 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] scripts/make_fit: Support ramdisks and faster operations
Date: Mon,  6 Oct 2025 17:01:51 -0600
Message-ID: <20251006230205.521341-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_160228_813885_124F3807 
X-CRM114-Status: GOOD (  16.59  )
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

This series updates 'make image.fit' to support adding a ramdisk to the
FIT, either one provided as a parameter or one created from all the
kernel modules.

It also includes a few performance improvement, so that building a FIT
from ~450MB of kernel/module/devicetree files only takes a few seconds
on a modern machine.

Changes in v4:
- Provide the list of modules from the Makefile
- Reduce verbosity (don't print every module filename)
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

Changes in v3:
- Move the ramdisk chunk into the correct patch
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message
- Update the commit message
- Add a way to add built modules into the FIT

Changes in v2:
- Don't compress the ramdisk as it is already compressed

Simon Glass (7):
  scripts/make_fit: Speed up operation
  scripts/make_fit: Support an initial ramdisk
  scripts/make_fit: Move dtb processing into a function
  scripts/make_fit: Provide a way to add built modules
  kbuild: Allow adding modules into the FIT ramdisk
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 arch/arm64/boot/Makefile |   4 +
 scripts/Makefile.lib     |  10 +-
 scripts/make_fit.py      | 264 +++++++++++++++++++++++++++++++++------
 3 files changed, 239 insertions(+), 39 deletions(-)

-- 
2.43.0

base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
branch: fita4

