Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B3E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K1BXSHtL;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JM+5a7K1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pq7HU0c5zDLc3H6/f5sVG7kyw7kaKqt44IjPJ2El8M4=; b=K1BXSHtLmAaqNLcmNuLJ1muSPF
	HunLH1elkA7+o/omnYL5JyqthuqQO0gOupZzVYL1am99DdHvZlvmunU7xwrF9XHnhUVD4cee4zzHy
	gjsJ1RvCp+/s6ehW1Qbua6uYsBo9NSc7mrufU98uGIvw3nWXhSq/tV4QfBh/SX975LCi2tyCtUjOG
	Utmf/jl7u+0qLokw9m++dn7Cn9uGdag9/9MDl8jLz66rLXwwMb3CC1dnilkDMJjwulLl56W0sjF/H
	vdWiKF+UVZf2tF2Vsf1aQFsbu+ptd7KoMNfcOevcRoADqfLah4XLxlsgXilcv9csvz9ErdIjJq8Qf
	cEdL6lww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnM-0000000CcmC-37RL;
	Fri, 06 Nov 2026 14:19:56 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnK-0000000CcjC-0bsc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:19:55 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-492425d771bso546361f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793974791; x=1794579591; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pq7HU0c5zDLc3H6/f5sVG7kyw7kaKqt44IjPJ2El8M4=;
        b=JM+5a7K1O/zo0S/aBmiNJGSEOr4BfIE6FTM7IhtmHszho67cCAmXCpAkWxl5a2cP4Y
         USkeJp8B1aQ1YiTh7/pmAynPTxNFzIN0hFZK2vdT69WlVxEbDfFuqpCznbt5B7VDXFLd
         mB+fQdB20svVP+jMs8VCbRV4S3haPVO+64kMJ7r4NkQsdwoFX8YgF42MRA5ptKOEwWcT
         KTtjcJCNcEX6JAT740fSpx5kjBBZ/hOKuY9Rh+Z/FXuQ5yB0YCD4LnNWFeUuD6BdzvgQ
         rzGblSYUjRfko1F8ngSKhWZ+7D+XFlyb8ASeen1D9sno57DDdGG/K83olvXyqWW3Mavc
         5Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974791; x=1794579591;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pq7HU0c5zDLc3H6/f5sVG7kyw7kaKqt44IjPJ2El8M4=;
        b=xdLf10CF9O9zCtrx8FfPJIyy4A1zd2A2TsrwxJQ0OrF4sQpXNZeEjdep6UqocN8PXB
         uFDaPbnvYIq+9qJB0kJzNi/Ttko3mspmRubf49fXXNHr9a7bCZ1gbc3SK4TS3imuyI+8
         kNpTnEaEew9OaoVsfkS0W0CW2LRsxPcCzzuiN7RbcYaVZrlKLTiHxtWyrceYpVKFNIbP
         /rUZUHs4n/6EBwILajOgEEIVihDe2i9w1u020I1isYhnv5tIXSj2aBuGtw/sgCh56392
         MIAoR03j0qUpf4tYqSYQBiKgA57UFxMs1JLk7uW6PVNJDlH0LoHt1DQJBDJHGrTOLBJp
         STrw==
X-Gm-Message-State: APuU4Z+wwZ4w4u869iZDwIHDwHFz0ZEzDQocSefwHDS+U5YXJ8bJKrGt
	ejJWT95U3adzhoefYSIF9DtTPSOpMtJZkfGC/tOSzAYcuQf75h6IZaOKpjaIZMgh1DPU13fBnA=
	=
X-Received: from wrcz11.prod.google.com ([2002:a05:6000:454b:b0:48e:514c:983d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2004:b0:48d:ba3b:af36
 with SMTP id ffacd0b85a97d-49277219922mr5315232f8f.37.1793974791162; Fri, 06
 Nov 2026 06:19:51 -0800 (PST)
Date: Fri,  6 Nov 2026 15:19:38 +0100
In-Reply-To: <20261106141936.2744481-7-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261106141936.2744481-7-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106141936.2744481-8-ardb+git@google.com>
Subject: [PATCH 1/5] efi/libstub: Make efi_remap_image() return efi_status_t
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_061954_212175_CD1C9367 
X-CRM114-Status: GOOD (  16.54  )
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

efi_remap_image() uses the EFI Memory Attributes Protocol to remap code
and data regions with the appropriate permissions. This could fail for a
variety of regions, all of which are currently ignored.

So relay the failure status code if any occur when invoking the
protocol. Locating the protocol itself is allowed to fail, as remapping
the image is likely unnecessary in the first place if the protocol does
not exist.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/efi-stub-helper.c | 13 ++++++++-----
 drivers/firmware/efi/libstub/efistub.h         |  4 ++--
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
index 8e43eb3f418b..b2ad081cf324 100644
--- a/drivers/firmware/efi/libstub/efi-stub-helper.c
+++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
@@ -698,8 +698,8 @@ efi_status_t efi_wait_for_key(unsigned long usec, efi_input_key_t *key)
  * read-write/non-executable. The code region is assumed to start at the base
  * of the image, and will therefore cover the PE/COFF header as well.
  */
-void efi_remap_image(unsigned long image_base, unsigned alloc_size,
-		     unsigned long code_size)
+efi_status_t efi_remap_image(unsigned long image_base, unsigned alloc_size,
+			     unsigned long code_size)
 {
 	static efi_guid_t guid = EFI_MEMORY_ATTRIBUTE_PROTOCOL_GUID;
 	efi_memory_attribute_protocol_t *memattr;
@@ -710,10 +710,12 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 	 * If the firmware implements the EFI_MEMORY_ATTRIBUTE_PROTOCOL, let's
 	 * invoke it to remap the text/rodata region of the decompressed image
 	 * as read-only and the data/bss region as non-executable.
+	 * Don't bother if the protocol does not exist: it means all memory is
+	 * read-write-exec anyway.
 	 */
 	status = efi_bs_call(locate_protocol, &guid, NULL, (void **)&memattr);
 	if (status != EFI_SUCCESS)
-		return;
+		return EFI_SUCCESS;
 
 	// Get the current attributes for the entire region
 	status = memattr->get_memory_attributes(memattr, image_base,
@@ -721,7 +723,7 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 	if (status != EFI_SUCCESS) {
 		efi_warn("Failed to retrieve memory attributes for image region: 0x%lx\n",
 			 status);
-		return;
+		return status;
 	}
 
 	// Mark the code region as read-only
@@ -729,7 +731,7 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 						EFI_MEMORY_RO);
 	if (status != EFI_SUCCESS) {
 		efi_warn("Failed to remap code region read-only\n");
-		return;
+		return status;
 	}
 
 	// If the entire region was already mapped as non-exec, clear the
@@ -749,4 +751,5 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 		if (status != EFI_SUCCESS)
 			efi_warn("Failed to remap data region non-executable\n");
 	}
+	return status;
 }
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index f5eec8c12894..b09d6c535ab5 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1241,8 +1241,8 @@ struct efi_smbios_type4_record {
 const u8 *__efi_get_smbios_string(const struct efi_smbios_record *record,
 				  const u8 *offset);
 
-void efi_remap_image(unsigned long image_base, unsigned alloc_size,
-		     unsigned long code_size);
+efi_status_t efi_remap_image(unsigned long image_base, unsigned alloc_size,
+			     unsigned long code_size);
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 				       unsigned long *reserve_addr,
 				       unsigned long *reserve_size,
-- 
2.56.0.455.g6c5a503b38-goog


