Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D507606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ijdFDzvO;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ghfZLzKW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0tnMr9KEjuROPAq10Z+5/qoKIgPgadWx4j+MtBV+tDs=; b=ijdFDzvOG9ugXo0Hmx258nGF/g
	0S5cwCWfw3hCSTydOQFtL2iXiaTT0TVLLL+BTKBORmhvkr63E5+JqeeLgmaFeuo3WFiCxStHs5bPv
	Mmk9vBDe/KKgZBOWR1gs0xfIVqj9ckMeRbIEb6is8V/QJbDm5Dm+yiafI1bInXNnOhi1ibYEAboqy
	Qj+5wfxW6iGcuYT47qghqDkbTHEc3I2sxOrkNURwHsGsd+Z1YG8EFendps8poq4kmNe4IosAvMNQA
	YSo/r/fBuOYMwkkTF95pfTdNtW05GPEr5x9Geh/5PP0w2WPs6/yXWgoQwiq/qJ+646Z4MbcUcO74A
	KSKDr96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnQ-0000000CcqU-3dIV;
	Fri, 06 Nov 2026 14:20:00 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnK-0000000CcjX-42WH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:19:56 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so7010235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793974792; x=1794579592; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tnMr9KEjuROPAq10Z+5/qoKIgPgadWx4j+MtBV+tDs=;
        b=ghfZLzKWZjd6mh0d09ZgURf2adLxpuFnFEtavsdtJi65kb/goGdZZos/xNVjlCDVhE
         +A3Vhpfx4Pmbg58dcIKhiSnOVIpOV5R54QKKFl9NK4ImwaPNd4C5fs6ecIiUutjCfCa2
         J+d/MoAJifTT14fcZnaeqCnvY/iCnT8SaQDa6NbB44g79vR1OUcGLrjZ5rVKv/vVQOB4
         bu9R8x85xx2XbGis7wU3HpOznYq5h1zo1EiH08PIEiIb+q+L6wMetrzYu5wvnSYoPshd
         duUwaE7zmr/VyuIfkrGD++6ShMyjdVUSnaN/AJ2/eCPtfBo0nMnRof12eYiObszd4bRl
         DOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974792; x=1794579592;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tnMr9KEjuROPAq10Z+5/qoKIgPgadWx4j+MtBV+tDs=;
        b=Tnir+DdtXYaQbAqF06+7OMzpq0kIAHkGwI6oesAPOZ6eFiOsinRWyzj1sLwvAUOnzA
         lbAj7fN69kaPk3EOZ08XYpX8xZdsFVuOmYdRglntfihmxQTwVIrzgJUVbiGfkLir8Kjo
         Xd+I/0PsCYYZjPFMPB63Ij71fgP4RBtc9IjLIJlKaRRWXs9inA5BdNTa0XsCaPR5Xabh
         ZJTn3Y/KgvPMAChEcm24ZqvXpRg2n+yv9MN4GkT0kChz4UjR9QrFqWJ/5zTr5h15PzFW
         3R/PsJrhnJAH0bNbdco/GW4cIhc/ItIGZUwAZuq8LeYe4Bw4g8qd61Vt+KCAohKBo+yy
         Zbhg==
X-Gm-Message-State: APuU4Z+P3Ahf3wvNdgibA6Dp4DXHXw9uP4i4AkCHL7WYmyVmDDRfyOZP
	ktw2kUsYB2QfeUj8/BFWYTuSFXZ1nIE91Ou9moSM7rcdc0RzikNuy4E5aPDaw8l471MyQztSWw=
	=
X-Received: from wmco28.prod.google.com ([2002:a05:600c:a31c:b0:4a2:11fa:1981])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4454:b0:4a0:1b21:2628
 with SMTP id 5b1f17b1804b1-4b6dfba8640mr46219565e9.23.1793974792222; Fri, 06
 Nov 2026 06:19:52 -0800 (PST)
Date: Fri,  6 Nov 2026 15:19:39 +0100
In-Reply-To: <20261106141936.2744481-7-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261106141936.2744481-7-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106141936.2744481-9-ardb+git@google.com>
Subject: [PATCH 2/5] efi/libstub: Pass a struct efi_image_info to efi_stub_common()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_061955_020456_B39A38D1 
X-CRM114-Status: GOOD (  14.95  )
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Pass a struct efi_image_info pointer to efi_stub_common() so that
architectures can expose properties of the image being loaded in a
consistent manner for both the uncompressed kernel and the EFI zboot
image.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/efi-stub-entry.c |  8 +++++++-
 drivers/firmware/efi/libstub/efi-stub.c       |  3 ++-
 drivers/firmware/efi/libstub/efistub.h        |  8 +++++++-
 drivers/firmware/efi/libstub/zboot.c          | 15 +++++++++++++--
 4 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index efa3ab8ad1c6..ff559708dfe7 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -27,6 +27,11 @@ struct sysfb_display_info *alloc_primary_display(void)
 	return NULL;
 }
 
+const struct efi_image_info * __weak efistub_get_image_info(void)
+{
+	return NULL;
+}
+
 /*
  * EFI entry point for the generic EFI stub used by ARM, arm64, RISC-V and
  * LoongArch. This is the entrypoint that is described in the PE/COFF header
@@ -80,7 +85,8 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 
 	kernel_image_offset = image_addr - (unsigned long)image->image_base;
 
-	status = efi_stub_common(handle, image, image_addr, cmdline_ptr);
+	status = efi_stub_common(handle, image, image_addr, cmdline_ptr,
+				 efistub_get_image_info());
 
 	efi_free(image_size, image_addr);
 	efi_free(reserve_size, reserve_addr);
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 6db10590f89b..ee5931eed59c 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -161,7 +161,8 @@ efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
 efi_status_t efi_stub_common(efi_handle_t handle,
 			     efi_loaded_image_t *image,
 			     unsigned long image_addr,
-			     char *cmdline_ptr)
+			     char *cmdline_ptr,
+			     const struct efi_image_info *image_info)
 {
 	struct sysfb_display_info *dpy;
 	efi_status_t status;
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index b09d6c535ab5..1955cdb5139a 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1148,11 +1148,17 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle);
 
+struct efi_image_info;
+
+const struct efi_image_info *zboot_get_image_info(unsigned long image_base);
+const struct efi_image_info *efistub_get_image_info(void);
+
 /* shared entrypoint between the normal stub and the zboot stub */
 efi_status_t efi_stub_common(efi_handle_t handle,
 			     efi_loaded_image_t *image,
 			     unsigned long image_addr,
-			     char *cmdline_ptr);
+			     char *cmdline_ptr,
+			     const struct efi_image_info *image_info);
 
 efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr);
 
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index 4a5ffe164873..97ae706c034a 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -31,6 +31,11 @@ struct sysfb_display_info *alloc_primary_display(void)
 	return __alloc_primary_display();
 }
 
+const struct efi_image_info * __weak zboot_get_image_info(unsigned long image_base)
+{
+	return NULL;
+}
+
 asmlinkage efi_status_t __efiapi
 efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 {
@@ -93,9 +98,15 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 	}
 
 	// Decompress the payload into the newly allocated buffer
-	status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
-	         efi_stub_common(handle, image, image_base, cmdline_ptr);
+	status = efi_zboot_decompress((void *)image_base, alloc_size);
+	if (status != EFI_SUCCESS)
+		goto error;
+
+	auto image_info = zboot_get_image_info(image_base);
+	status = efi_stub_common(handle, image, image_base, cmdline_ptr,
+				 image_info);
 
+error:
 	efi_free(alloc_size, image_base);
 	return status;
 }
-- 
2.56.0.455.g6c5a503b38-goog


