Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB221606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sLNRFCRO;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JRC6zfbr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TwsPFdRh0C49DOdl+xuWiS4YPqcCQKDREkOH0Q0gTC4=; b=sLNRFCRO85kVKxz6rt4vgdM3Ec
	lRCDKzxrmu0WXAmB9IVfHYB/FRm56UF3DBKScWuiKak8wm4c0Mu0sG57c7zPPjBXbPNETP9TvwW48
	Sx0zaxHSCI4XJL57l05+4bQdS7acD7yKB03e9O7e6ePeENTyQbEr9LrRa1RAyqdbPJOQ+94hWcusX
	l0yPUX7kxEh8WFlWtWjCd0oBq22awvN8Figc+X6vn8fCOZ/Y1+IlWm2wZPpfOoCpEPiOuQObUbHb0
	M2q1Yi1945DMd4BNr1nyeoWnM13/BYHDM1Hv5l8SnZy/x8pLonOnEze85Ea4xMJu+OcQy61bnQssc
	65ahnZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnL-0000000Ccl6-2euj;
	Fri, 06 Nov 2026 14:19:55 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnI-0000000Cciu-3GRC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:19:54 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4afef353dd2so7835945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793974790; x=1794579590; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwsPFdRh0C49DOdl+xuWiS4YPqcCQKDREkOH0Q0gTC4=;
        b=JRC6zfbrJKWXo4JJjLGc6S/7XNCSOOe+Da+7PoWmX1fQCAOHlaE2/ByYNu0AwHP/K9
         jo13zlaZ/PXPBMO4LcpO+1Sc4T7LnGV0yWjksZJlp+ccnnFyT6tB0KnOkEhk8wYPbOmw
         VoBcx9/Qg/cTTSmxOfRYgilzmEnkPzm1EbtEOnxoPPVHZ5clmXIoK4WP8fcM8Fnb0XNY
         XNNXMOPvql0s0PDMdR0MGdKkLoyEMRbUs0BvWEoq4PYs8VIyf9044MK25u6MVY3HPpe2
         zBBAI+792mhhHhImVMUOnMHR0Y8rjp2MOqB4j39dyI2eU5PEpxPYyAKodolxParD9cKJ
         5N0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974790; x=1794579590;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TwsPFdRh0C49DOdl+xuWiS4YPqcCQKDREkOH0Q0gTC4=;
        b=L6Sh+Jf/lKsfAJ5vsNVtVNezjdCcbM8I1RlO5XsLtIu3NvS0YNLYrI7qs8feY2Xp64
         0IZCnZsg5vGZ7m3vxqDZIpQXbsG44Pgg5sdjsA/g23/KZMZ23XZxUYtWSoc6rB3TDT52
         4fUXvsrO5L3jSzpPlHgj5Jl74GGc2bJPlF6nS4HXmA8wnxS8cwNwU5soOzEl/2s1f+be
         k7yeJqNta/Ybhie+YrUwLlmx3HjZbd3Bttahy/QYyUFqjrpO77l+aBSP/1jBoh1P7A30
         273pH7sw+jjYddofQjx0au0umjFii9J6WSYu/nakwhOubpqEa1vWrePg21yBRJrV6Hme
         Civw==
X-Gm-Message-State: APuU4Z9jPJma8puwBkrgzKozEb/Y5EV6nBMqNgrtITwYo14t7Xibibqu
	1CfFtLFm8vm/BOE07ofNqfBGsYHK5j1b9P0U3tXOTvoFUXAWI7ApcRJPp1tpZj8A8uxinuWSiQ=
	=
X-Received: from wmok21.prod.google.com ([2002:a05:600c:4795:b0:4a1:d943:b7d5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d0b:b0:4a1:742e:3
 with SMTP id 5b1f17b1804b1-4b6e0170a5cmr45487535e9.27.1793974789972; Fri, 06
 Nov 2026 06:19:49 -0800 (PST)
Date: Fri,  6 Nov 2026 15:19:37 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106141936.2744481-7-ardb+git@google.com>
Subject: [PATCH 0/5] efi: Expose loaded image properties via info struct
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_061952_827953_6B91A594 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Clean up the arm64 build script and linker hacks that zboot uses to
obtain properties of the loaded image (which it cannot access directly
via a relative reference like the ordinary EFI stub).

Instead, define a struct efi_image_info (whose contents are arch
specific), and expose its offset in the loaded image via the arm64 image
header, so that zboot can access it after decompressing the image.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/all/0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com/

Ard Biesheuvel (5):
  efi/libstub: Make efi_remap_image() return efi_status_t
  efi/libstub: Pass a struct efi_image_info to efi_stub_common()
  efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
  efi/arm64: Expose struct efi_image_info via the image header
  efi/arm64: Drop build and linker script hacks to obtain image code
    size

 Documentation/arch/arm64/booting.rst           |  3 +-
 arch/arm64/boot/Makefile                       |  3 --
 arch/arm64/include/asm/efi.h                   | 11 ++++++
 arch/arm64/include/asm/image.h                 |  4 ++-
 arch/arm64/kernel/efi-header.S                 |  6 ++++
 arch/arm64/kernel/head.S                       |  3 +-
 arch/arm64/kernel/image-vars.h                 |  4 ---
 drivers/firmware/efi/libstub/arm64-stub.c      | 16 +++++++++
 drivers/firmware/efi/libstub/arm64.c           | 13 ++++---
 drivers/firmware/efi/libstub/efi-stub-entry.c  |  8 ++++-
 drivers/firmware/efi/libstub/efi-stub-helper.c | 13 ++++---
 drivers/firmware/efi/libstub/efi-stub.c        |  3 +-
 drivers/firmware/efi/libstub/efistub.h         | 16 +++++++--
 drivers/firmware/efi/libstub/zboot.c           | 36 ++++++++++++++++++--
 drivers/firmware/efi/libstub/zboot.lds         |  7 ----
 15 files changed, 112 insertions(+), 34 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.455.g6c5a503b38-goog


