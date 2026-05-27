Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79734CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 18:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aYuyafSbZ4rVnjRaui8xS+rYrPMJVSn6qkIJmqMYC34=; b=ff4wdsOqvENlNI2wZlcNA9hWOe
	LJsWrnnHL4F4N1BJAu1iTqrAvz+5UMw9vjfEq5kYO/QLKM0wGKdCwXr+hn9RhMeOwmQATwnyuot1J
	SptyWxsM8pmtzWjKKGn4BBFJ6lVq3ITAO9S5kFV2rxcjCtHoy9ivNe5olq6Vrgnxwo4tHrYWvE1yM
	yPNTiYxrDDVGCECuMWhGk7J8eE+5rRD2r+OCEfSe3c7DNfxbVa/JUwgEcM85tiAtvHYsSPdIFDXPD
	nNDDqC1N9BLt87cFm8wuM5U5Ve2wNpdolsi7ABup6NgW5CSYRq1+rbC0X/3+jG2YuJKl7qcjhIMZI
	XeAGtC/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIpj-00000004cqL-2rZa;
	Wed, 27 May 2026 18:18:23 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIpg-00000004cpn-18WW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 18:18:22 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-49045243094so78191445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 11:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779905897; x=1780510697; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aYuyafSbZ4rVnjRaui8xS+rYrPMJVSn6qkIJmqMYC34=;
        b=Z4R3cLDP9wXZgiDSrIZaOIkDqelUooRe4nVquhEv5ygmBALBqLCwhbDHK2K4N4W1xT
         J/7Lhib6pFTvr/R6KNtJ1mLYrjOgrnUsx0qXLhscvLQAOqLafCA8sHmuzGZPqDDwkkdY
         B0sezFl/18OnfpRordPITZvoYI8k8sPv7TBBYFBkr4jCV/u1guYQE9XSuqJMEBZN13Rd
         VzqCG6Oehq6ysIgRjwaFpbn5JRfRHou9V+uYZq2ZjsF56BH+BadvqpVOwH+boqBjDb6i
         r1gq0ejrPdsTgILjdUCoiIxcNpbBgxo0JWQB7q7dn/xGbq10seEpguFA2jb8D0ABe6ok
         BTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779905897; x=1780510697;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYuyafSbZ4rVnjRaui8xS+rYrPMJVSn6qkIJmqMYC34=;
        b=QStiUGmP35THqXjD20EM6V4tahqRjOjF7NSpmq3KUjv0i8DEPqEaa07KjpMyTnpiCw
         4DXjfUTVFrPwD5ptFcPmMzR20JF9EUo0wvEc5z51PTWjF1OeJlz/5QRblh0NrrH3AbSu
         trKg7TJYPElfgeK8uWhcAGDZcD8lr0N4e1nzV0eePAO5B/6VPuAMVdaE08sT7U92iQRx
         Y6x/dmFVVR/h305HJ72uQOsPLiSvi9VncQkSSrLP/aQ0aFyPzvA5MjK2tb/CWUB7iIJR
         gxTJlwmJxVOLctu0SkhDhwSQkvzbtLEYbobvLwMOLpDZsPXPD0fg98WKifLrnusBQK9X
         kgqw==
X-Gm-Message-State: AOJu0YxQknJ+MnsTkVqShedRxeXlo+SauZcZLq6DpPIIznEYqsja+iFa
	CApIFlLicKiA0T/iF1ACH0bAS5SPGwttxMyfpZdO4Omhk/KGhN+GPs0yO7VlhqkdqaXU/wr42+7
	d6jR/IESSlSokW4AtzA==
X-Received: from wmsk24-n2.prod.google.com ([2002:a05:600d:8498:20b0:488:81f0:1a27])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4592:b0:490:6237:5212 with SMTP id 5b1f17b1804b1-4906237533fmr237671675e9.9.1779905896526;
 Wed, 27 May 2026 11:18:16 -0700 (PDT)
Date: Wed, 27 May 2026 18:18:07 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAF81F2oC/x2MSwqAIBQAryJvnWCCSV0lWmg97UE/NCuQ7p60G
 mYxkyFiIIzQsQwBL4q0b0XqisE4m80jp6k4SCEboaTm6T6NXZCv+5QK3GI8b4xQrbJOYKuhlEd AR89/7Yf3/QAohpNwZQAAAA==
X-Change-Id: 20260527-uwtable-module-flag-6a0595bf0e97
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=A1hu78OBhTmmHM5EGvEyajNzJfF6krcevjHiRkrrgeE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqFzVi3kskmzo8hxmO7mr/pbdeQYSEplX95V4tq
 4KaJnwxD3eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCahc1YgAKCRAEWL7uWMY5
 RnybD/9o0kTvgXkQWWk/GJHZZCLOLzFKaeecdlVjCAPFYR53Dcqn84/yAo7HVigvXUUcnW0gyLn
 uXFqu08Z02Avg1LUUeKaQULe2uSOlv8rIw+lz7IkmAdC9Nad5Im7V8a8ydQzZMMNAdTPcr3KAvR
 1kx0f7WXBSO8DHJwf5G7P4Ja0+vBhdDY5m9gy7+V5Sel+doifDGaKUC0z7XzbC3j03y+v6qEsW+
 yW+KRxivNzyU16EHSLPIpvbxjTpChWMBTjMo9Y/quuFxFTZoCamc81u/F3A4wMs750r7ktNwgQv
 +Ek/azMy1gvdCowz4gcnEmGzeik9YLhCvtPJxNzdPMWeDwEiCGQBkk3bVYTrFewrUzxvrJmVNQj
 GnU8T5uy2Uws79QK7PFp8DWHtU2xUaLAuBKroF/SqxD8LgXJzjOMeI462U/Oc81GAw350m9kfwm
 O1uwJmSY/xpZyIojZ96csOTUlEakjtWiuwMTi3d2R19bVQLnzXNjE7Tq7ZNuTmrGMBKMAbD8if4
 Kv9AF92m34Ci1f5xqnnOyl8RXWxOeYA2B4OkS+TQta/8/RSi9nWxsr2qRPwFtNUx1BYsLIIk+Vz
 vBunGSTkvWvH5S1yqoUyTZungaMF6+rFWuXgPSTHeCbpOgdtDOfauQG9uHGCghUrZ+loToGr46W DfVKYjs9T98PU8Q==
X-Mailer: b4 0.14.3
Message-ID: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
Subject: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
From: Alice Ryhl <aliceryhl@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_111820_330561_20343F6A 
X-CRM114-Status: GOOD (  13.35  )
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

Due to a rustc bug [1] the -Cforce-unwind-tables=y flag only emits the
uwtable annotation for functions, but not for the module. This means
that compiler-generated functions such as 'asan.module_ctor' do not
receive the uwtable annotation.

When CONFIG_UNWIND_PATCH_PAC_INTO_SCS is enabled, this leads to boot
failures because the dwarf information emitted for the kasan
constructors is wrong, which causes the SCS boot patching code to
patch the constructor in an illegal manner. Specifically, the paciasp
instruction is patched, but the autiasp instruction is not. This
mismatch leads to a crash when the constructor is called during boot.

	==================================================================
	BUG: KASAN: global-out-of-bounds in do_basic_setup+0x4c/0x90
	Read of size 8 at addr ffffffe3cc7eb488 by task swapper/0/1

Specifically the faulting instruction is the (*fn)() to invoke the
constructor in do_ctors() of the init/main.c file.

Once the fix lands in rustc, this flag can be made conditional on the
rustc version. Note that passing the flag on a rustc with the fix
present has no effect.

Fixes: d077242d68a3 ("rust: support for shadow call stack sanitizer")
Cc: stable@kernel.org
Link: https://github.com/rust-lang/rust/pull/156980 [1]
Reported-by: Bo Ye <bo.ye@mediatek.com>
Debugged-by: Isaac Manjarres <isaacmanjarres@google.com>
Debugged-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Isaac Manjarres <isaacmanjarres@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/arm64/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 73a10f65ce8b..5b21941b5c8d 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -63,6 +63,9 @@ else
 KBUILD_CFLAGS	+= -fasynchronous-unwind-tables
 KBUILD_AFLAGS	+= -fasynchronous-unwind-tables
 KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y -Zuse-sync-unwind=n
+# Work around rustc bug on compilers without below change:
+# https://github.com/rust-lang/rust/pull/156973
+KBUILD_RUSTFLAGS += -Zllvm_module_flag=uwtable:u32:2:max
 endif
 
 ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260527-uwtable-module-flag-6a0595bf0e97

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


