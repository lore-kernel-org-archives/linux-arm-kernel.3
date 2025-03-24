Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D61C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EU5vl2IyAMkqAxOVujXowWQEexWNrBm4lKNgvrzygYM=; b=TBLladc9EO2Pwnl/6ywQisA4XX
	cEbsf8birXfjcII6dSJVSESaTIhcuLL+fjOX02VApboTEc5L0Ksz/eiYgdzjMosDLhOqBVwwdWq2F
	JoD1pkFw95UJvp6Fx0cbkpwZd1fbLdaq5hDHURzwDu0xsgGw02NIYIGQIv1jdiiMkoS1MpS5uLF/H
	3yi/8yA8dUCixbAMJD2eePPJoBpTk5P8XdlKGaf+gmCLbe3szoBlkctUG2IjCqAJwA28PFrQkwpjG
	7JirUJ3ObG08TsT3spIRAHhKgsWNDEna4FhbbL8GDtyB04o1suLlVZssxTIb46lxmu/VDZ7dx9h1O
	6NyCD8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twnEz-000000042GF-28Qx;
	Mon, 24 Mar 2025 19:13:41 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twn1P-0000000400v-1puf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 18:59:40 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d51bd9b41so29661125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 11:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742842777; x=1743447577; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EU5vl2IyAMkqAxOVujXowWQEexWNrBm4lKNgvrzygYM=;
        b=QcUoLJvBlggqjjXt4niIt03oikfepUr/zBh5fhTRHXN143znQ53LzRGbq5uDR45ScK
         pEyykFA0nUM1djc0uMpdHoX8FuN8+VvLleQ0jO4hDmNLu9M93dHnKnXZyv7ZmLQ+XSqz
         kFbW51ujEaMIBqAkX7OfyNAnfQSNMG3ZTSVRMbRc3EUNCg/qcYDaMt7kMKKw/wIKbwJ6
         M31RPNf1MsMBQEa/TR54g/7ikceDcA8ebj5wPSTWBE/1mVstAz7InFI91Pu182sj7QV6
         cK7+DYbdpc0AShec9dHwYEXgbNkX3MfthG622FfOF3jLTS/JfI5Mw7uDw3icQfPQQWqD
         jXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742842777; x=1743447577;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EU5vl2IyAMkqAxOVujXowWQEexWNrBm4lKNgvrzygYM=;
        b=EVaofVGLeRcsOq+JP+zcVZdM9KlyXT1TjKHBJgYDXttVJpxb96kswOoB17u2Y5id/Z
         hesmqQ9KRezTIi4mN7NRfWn8dnv68OR3w2HzemYwB6og5pNnDLi+ljs5hGn/UYIVd6+C
         VPeYiyTOu786Z8zLYktiGHEkQrjhdtCgZWrxhNVu9Fhj8m7D12Dxj20W9f9dlHD7QYIw
         x/wg6lHe6M5iDT6ZqnheTUPih7JUOrGWmvJ8YxAgHwZDWgwNMuGzp7pUH++r7K1VeQ7q
         dNhv9NaiKFNeJjgnm061BG3DaOJWWxBHCjt5PoXzqrQ1rtOi5UGow5/oIr+mDPpRDSTe
         GbAg==
X-Gm-Message-State: AOJu0YzM2yfYIJ4VIsOOKNn6owBrCQb/Eo2ZrtigyubHsio8fD+viWxe
	bgRPumRSv4qNd+BVA4it6+9edndAOf8dCSXjJYp40wcgbSftuAE5bFMoO9/v9qhB/KqroIePNnU
	H7YxnNC6ZgOMUwfyJ3aqhpSckgQgJ+LyrkulIGQ2kDCNsedAr9/sgst6vJtBkP7KYYcgWjd2Mo4
	GM1zj7A1HlUp89cGb3JYswAPNNPKoEBSsMyMwEM9ZJ
X-Google-Smtp-Source: AGHT+IFXLSEctFeyD4DM0l6T6dvVWRHKZxY/tHET+B00TrGKUHpe50KBTGAvxsGOrUoTxIz9QdIhFGa/
X-Received: from wmrn15.prod.google.com ([2002:a05:600c:500f:b0:43d:9f1:31a9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e45:b0:43c:ee3f:2c3
 with SMTP id 5b1f17b1804b1-43d509eb3d4mr143385015e9.7.1742842776707; Mon, 24
 Mar 2025 11:59:36 -0700 (PDT)
Date: Mon, 24 Mar 2025 19:59:28 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113; i=ardb@kernel.org;
 h=from:subject; bh=CH9G3u1CCVjdEZgY11mjk53QRiyscsaYqz4kmq2ldTI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf3h6gnNlVPuhWnoWLLeOP9NrSWUbem6FN+7Lf9az3A+2
 PDcQcO7o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzk116GP1xH1SfY5zzxmP/3
 yk6x+0ZRf5beuG986tJl/YiY9b5z2CYw/Pf3DbnvU3RQwnZaSdPsl16JvTdlRCWlP1f1LeVnPfO jiwUA
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250324185927.1024543-2-ardb+git@google.com>
Subject: [PATCH] ARM: Disallow kernel mode NEON when IRQs are disabled
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux@armlinux.org.uk, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_115939_488350_A25DF53C 
X-CRM114-Status: GOOD (  15.55  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Commit

  c79f81631142 ("ARM: 9283/1: permit non-nested kernel mode NEON in softirq context")

relaxed the rules around the use of SIMD instructions in kernel mode on
ARM, to allow such use when serving a softirq. To avoid having to
preserve/restore kernel mode NEON state when such a softirq is taken,
softirqs are now disabled when using the NEON from task context.

However, the fact that the softirq API does not allow unmasking of
softirqs with interrupts disabled was overlooked, resulting in a WARN()
in some cases, as reported by Guenter:

  WARNING: CPU: 0 PID: 1145 at kernel/softirq.c:369 __local_bh_enable_ip+0x118/0x194
  Call trace:
   unwind_backtrace from show_stack+0x10/0x14
   show_stack from dump_stack_lvl+0x7c/0xac
   dump_stack_lvl from __warn+0x7c/0x1b8
   __warn from warn_slowpath_fmt+0x19c/0x1a4
   warn_slowpath_fmt from __local_bh_enable_ip+0x118/0x194
   __local_bh_enable_ip from crc_t10dif_arch+0xd4/0xe8
   crc_t10dif_arch from crc_t10dif_wrapper+0x14/0x1c
   crc_t10dif_wrapper from crc_main_test+0x178/0x360
   crc_main_test from kunit_try_run_case+0x78/0x1e0
   kunit_try_run_case from kunit_generic_run_threadfn_adapter+0x1c/0x34
   kunit_generic_run_threadfn_adapter from kthread+0x118/0x254
   kthread from ret_from_fork+0x14/0x28

While disabling softirqs is not really needed when running with IRQs
disabled (given that the only way a softirq can be delivered
asynchrously is over the back of an IRQ), let's not complicate this
logic more than needed, and simply disallow use of the NEON in kernel
mode when IRQs are disabled.

Another approach might be to only disable and re-enable softirqs if IRQs
are enabled, but other than the test case above, there are no clear use
cases for doing non-trivial arithmetic processing (hence using an
accelerated SIMD implementation) with IRQs disabled.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/all/389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/include/asm/simd.h | 3 ++-
 arch/arm/vfp/vfpmodule.c    | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/simd.h b/arch/arm/include/asm/simd.h
index 82191dbd7e78..e604a9382960 100644
--- a/arch/arm/include/asm/simd.h
+++ b/arch/arm/include/asm/simd.h
@@ -4,5 +4,6 @@
 
 static __must_check inline bool may_use_simd(void)
 {
-	return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && !in_hardirq();
+	return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && !in_hardirq()
+	       && !irqs_disabled();
 }
diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
index 7803d50b90f8..e559ad3cd148 100644
--- a/arch/arm/vfp/vfpmodule.c
+++ b/arch/arm/vfp/vfpmodule.c
@@ -877,6 +877,7 @@ void kernel_neon_begin(void)
 	 * the kernel mode NEON register contents never need to be preserved.
 	 */
 	BUG_ON(in_hardirq());
+	BUG_ON(irqs_disabled());
 	cpu = __smp_processor_id();
 
 	fpexc = fmrx(FPEXC) | FPEXC_EN;
-- 
2.49.0.395.g12beb8f557-goog


