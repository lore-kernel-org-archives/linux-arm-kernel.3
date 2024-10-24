Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917ADCE8E91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Vlh+OWPEJjqhnR1Dpqe4iO+ZlrNapO4KnJxZYyLlWk=; b=rx/HX9LKkGSBFLOav14l06bLRM
	Ens8SCq7iRI19SFm5hdBMNt2dRODEOTJZE0KlljqbV9uAXWanssbVhaHeT+SJ0ZVUuP0JN/GhxOgb
	oe+tpEMjBpDiUp4TuHGt7IamuPC4WFI2CKTCQZ4agUSH2B4NAOiGPqXytQ09JNArgPuRRuVMODYN4
	0f+luCiBCYzU+3ecOudW8fSbS7m6NEcGJSbRg9mAowrVtrMPWW+ofnUYE+ktsHBiI3SeqxQdCbobX
	ddFWQ1K0gzFl/l+KOO0b0+9wrJ09g1k8CyhHy7FxugQDZicvq9rYTZz5amNZuVCcx7oCqPfXEWCPU
	WuYub5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40OX-000000012nA-46Ap;
	Thu, 24 Oct 2024 16:09:05 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40M1-000000012ER-2Ph2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:06:31 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28fc60660dso1850127276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729785987; x=1730390787; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Vlh+OWPEJjqhnR1Dpqe4iO+ZlrNapO4KnJxZYyLlWk=;
        b=pXRp4xvdZI0XDG62perN8nRuuFbeHy+ZAF+8C+dt3ds5Y5qVHuqSoMn9xwmz8c6Tuj
         DcnmLCoQEPesPYnTLLN3DsNZnIXCCoSlmU2F9pNR7FT/eDUC3caNKgj7uw4pV0rielvR
         hsMgNvqxX5XgskFt33w3Oh9dzZ5ZRo2qmi2ewDXNJ5p7hGty2MgO3ZMEU0dviWr4GDrG
         yWzTd5DughziOezXM638Yec85mlX+9iua1rtlPKYR8EStz/QjGgqDuwz1yk4pyzmo0c6
         Led2BJvf7Z5bLo6xtnfsWkdB0rr/TYqtbpTclbj4BMhl6TFXsFE7LawGDXZKoVI5W6Ez
         2epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729785987; x=1730390787;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Vlh+OWPEJjqhnR1Dpqe4iO+ZlrNapO4KnJxZYyLlWk=;
        b=O/0D6aONaZ+t43b7xPiRPgn7Hhq1jQHW3UoCBS9ca/HPlY0TZbjQKRIZ4FK+NOA30b
         pJHBlixK5IOYRCjNA/5ObbngWep5dmLOf4HloqZSD0posyHmTa8O/KPbhErmgM7eksr5
         BhxO22cwm0Q+l8LCKwwKcusLOQPPIpUh0On3MQGVcWKTx4L40cIcVeZCYwi4BetX9dvj
         f3cEYPNpAdff/XDjA36up04IeevHuxxhjfZxS8Reiv1hYl17gpfi7QKkooUSuSokvCfo
         BsSPTvhZiLQDjlF1PgOwdZXKoFXcPOtBaDMNl7KvQdxs/3Z5Sv2mKtvSkMez/Qlg32bP
         TsAA==
X-Forwarded-Encrypted: i=1; AJvYcCXGgf8Cxuq5QeYxRAfoaUdL00oYV8itqFIR1RquwbKoguHjMQTHR9lu9L7cWBBG1fuJ69Pn3HfWb9P4HQjQOgqk@lists.infradead.org
X-Gm-Message-State: AOJu0YwkvK8VvAl5im2KiCvlaBBJ8UKsOvPuaI3iMhm/5O0ZfAzsH94b
	Sv3xFiav0Wg38aNvS+705GGv/pxGI//0qEwI10ff0ScOgCkOwaHQ2i4DVh/OiCaerMIO4IoKT8q
	wTVZqlO7VKQ==
X-Google-Smtp-Source: AGHT+IGaTNB2cxvpZfiLTZ3lOLyBwhFAf/NyceFQfu/ZPNy7VLbkaYQkYEfTc8o/kTdRiS7SjTcDccubMooCLA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a25:b113:0:b0:e2b:ce2f:787a with SMTP id
 3f1490d57ef6-e2f2302ed44mr7753276.3.1729785987546; Thu, 24 Oct 2024 09:06:27
 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:06:14 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241024160614.1894599-1-smostafa@google.com>
Subject: [PATCH v2] Documentation: Update the behaviour of "kvm-arm.mode"
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: corbet@lwn.net, Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_090629_641744_51DDFA70 
X-CRM114-Status: GOOD (  12.31  )
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

Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
VHE support") modified the behaviour of "kvm-arm.mode=protected" without
the updating the kernel parameters doc.

Update it to match the current implementation.

Also, update required architecture version for nested virtualization as
suggested by Marc.

Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
v2: Update nested value also
---
 Documentation/admin-guide/kernel-parameters.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1518343bbe22..d5b771e5cb5b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2740,12 +2740,16 @@
 			nvhe: Standard nVHE-based mode, without support for
 			      protected guests.
 
-			protected: nVHE-based mode with support for guests whose
+			protected: hVHE-based mode with support for guests whose
 				   state is kept private from the host.
+				   In case hVHE is not supported in hardware, it will
+				   boot with protected nVHE.
+				   nVHE protected mode can still be forced on VHE systems
+				   using "kvm_arm.mode=protected arm64_sw.hvhe=0 id_aa64mmfr1.vh=0"
 
 			nested: VHE-based mode with support for nested
-				virtualization. Requires at least ARMv8.3
-				hardware.
+				virtualization. Requires at least ARMv8.4
+				hardware (with FEAT_NV2).
 
 			Defaults to VHE/nVHE based on hardware support. Setting
 			mode to "protected" will disable kexec and hibernation
-- 
2.47.0.105.g07ac214952-goog


