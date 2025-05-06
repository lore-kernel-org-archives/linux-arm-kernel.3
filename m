Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93292C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhaFKze9VG1/eFCN9G58dM2RFBh4W36ZYcYCtz7qr9g=; b=2CjKJIvWOrpFQoa2flmByhSM4W
	FYMe/Q7f/x+d0znAcqTg8J2uETNogiRS2ZbzDmzP0KWPezvO8rHQAf9/hJOg1tZayYMnaj7n1t2Ft
	lJ+MFo/yE1eYtqyicXewSe9HflgtCT5Gw5Zvf6bVc01iqUeUtLXGFUWPmtYH0FTvUEtpp1/I8laoR
	grUtVaKqr+5etBHMDllqz9KvlHs3gP3aZILubP5lrlYbfmn8I7i4zEb0AntxYj91BRX2Qk1m7aQyI
	hV1jbfNZLzCmRtDg7UpV3rpBRCXs3AndA2vrmgdtetRYT+Em2Ggu5E8BYTt6C9G/5IGAPsXKkov5C
	Ti1OISSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGQN-0000000Bj35-2K9W;
	Tue, 06 May 2025 11:25:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEyy-0000000BSvv-2nPN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:53:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-441c0d42233so3220705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525179; x=1747129979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhaFKze9VG1/eFCN9G58dM2RFBh4W36ZYcYCtz7qr9g=;
        b=Hq6P7BCDccfNk1gLo8BgNb8PKBF5JSU4EczDRXgBuDmUmb2QTAItGngVjLDCL+cOVJ
         CV0Og7IHvAKvvsM5dW4QyPQUXct6U1d13JWL3VRDS3u4pSTDR7XPWEU24GD6yOEbiofE
         IjQOgZ6yZGNxhFwBdg2mRAup2PhBXej+uCn5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525179; x=1747129979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhaFKze9VG1/eFCN9G58dM2RFBh4W36ZYcYCtz7qr9g=;
        b=FAGRc4AIuLyq2SwUtpJIhd3qkEd/SzIFzUwkcVd/TlTwLExmcw9CifC7RP4QZqGayX
         zwbHw+TLtdMT7QxzQK0u+yMisg/8m5hp6DQApSR4/2fwPHBFwKISIJmfa2dH+vnUcKBK
         dTbDV+H33r5c79gCm8IvCLe3QCsK4fk3QWDdF7xeEad23ZhDtpDZqJROnCmRTUdkveJt
         IFHCKTJ6TQONORRNLSV+Uqa2TsU7qfyttWRNsp+ckxAWPXgdyqk+cZxoomOkSKW3gpKP
         vCkDvxips6PR33SES9f4sgZ/z+L/1W+E2/AhWOvzOq+XzgJaoM6R9kINNpYC7Bb9JUGf
         fPSQ==
X-Gm-Message-State: AOJu0YysMgGbdAq7ygdJ7+ngucCMdPLphgc/7SKgn+cxSb/1uuU6rSMM
	IJ0VP+VCnsEcOBfJLjv2L+AyrTyEJKa2xugrYb8i3O2t5YsDzCHaD49APXEXCK9zek1XGdBbGng
	=
X-Gm-Gg: ASbGncuvfXiLnRvO2JdHeFPB3Owlfq7ZnoJ3T0fyWZP2Uvu0TyOrvDB1oiMJqsSJhX6
	oL2kgQD75ksJLjX/bGlo399YnzEWEUCVyourjB242GbZq0LPFYrcFvHxJhgaYehREHxNxbwQ5ZD
	j0eL0760QXb/GKkE/iFcv2uhtuF37qNs2l3hAZonUAgBohv5BUaiFiItHFWeBhesU/e86NOLreW
	NzkSAJr772CYlL74I57SV5MFnKw8Mr7D78GApYkyH9JqX2I4OCRSDGJPsLl5mMC01yCg/0f+M1U
	oX16EuBMF34m/UxvS+1Iey0iqWKmiROjj3yrURBx0KQuMctiNjDLygNi
X-Google-Smtp-Source: AGHT+IHeK+dFXjh9OrxfzRPfPF/LOpOuNNkj7QNpkKx/cJ7vvnj2X+5i334G41Ez0rqAejsL1kXepA==
X-Received: by 2002:a05:600c:1382:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-441bbec38b2mr52734125e9.3.1746525178968;
        Tue, 06 May 2025 02:52:58 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7196:3093:b0e3:1016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm12879860f8f.44.2025.05.06.02.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:52:58 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] mm: fix VM_UFFD_MINOR == VM_SHADOW_STACK on USERFAULTFD=y && ARM64_GCS=y
Date: Tue,  6 May 2025 11:52:21 +0200
Message-ID: <20250506095224.176085-2-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
In-Reply-To: <20250506095224.176085-1-revest@chromium.org>
References: <20250506095224.176085-1-revest@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_025300_706568_418C7409 
X-CRM114-Status: GOOD (  13.89  )
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

On configs with CONFIG_ARM64_GCS=y, VM_SHADOW_STACK is bit 38.
On configs with CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y (selected by
CONFIG_ARM64 when CONFIG_USERFAULTFD=y), VM_UFFD_MINOR is _also_ bit 38.

This bit being shared by two different VMA flags could lead to all sorts
of unintended behaviors. Presumably, a process could maybe call into
userfaultfd in a way that disables the shadow stack vma flag. I can't
think of any attack where this would help (presumably, if an attacker
tries to disable shadow stacks, they are trying to hijack control flow
so can't arbitrarily call into userfaultfd yet anyway) but this still
feels somewhat scary.

Fixes: ae80e1629aea ("mm: Define VM_SHADOW_STACK for arm64 when we support GCS")
Cc: <stable@vger.kernel.org>
Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf55206935c46..fdda6b16263b3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -385,7 +385,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR_BIT	38
+# define VM_UFFD_MINOR_BIT	41
 # define VM_UFFD_MINOR		BIT(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
-- 
2.49.0.967.g6a0df3ecc3-goog


