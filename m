Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E32CC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 00:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T16tHjdcydDyfcQnO+rO78FihM7DOnKeDErtF6szV0c=; b=AjkKTEKciik1h5wLtfbFpiQv7S
	lAFd5p5Xn5slHIeUylfaQwHQe7O6srsjayj6amxlTdoQHdzs8iiMqMQKC12dfw+a9vT21wjd0mHx1
	ZISfbhtzc5LSficbqMfOr0+RKpXsy0mIiDcVJJmMPdlp3zVB4c2Za+fOwyzslfpra1uwH6jZeaXHJ
	R/6BcVLvGrXkoEyjGzrjN3aXAWllVFAxI2euXdAUtMVz4vQ/Jg6ZzeRCSN9eejlDwPXM30L1Hm2G3
	vRnT2Ipvfa6rcaM5JCcfWCjrAF4WaIOu/gc46e6u2/87gJS1yJ0+y+KNjB1X8tIs/69YktbicphB0
	HQi6/aEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyJhj-0000000EWlH-27ec;
	Sat, 29 Mar 2025 00:05:39 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyJfy-0000000EWVK-3KHs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 00:03:51 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-225107fbdc7so48538185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 17:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743206629; x=1743811429; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T16tHjdcydDyfcQnO+rO78FihM7DOnKeDErtF6szV0c=;
        b=A9iHhB0LWF6T1j+sgGg+zfFxWzf9UBXzzPHa0V7MxPfkMBeiC5F22vEt1qV4zkAsdp
         JeSkg/ezQh+U2Azv4DxShmPAYkR6VwCUMVeEvK72vGqxeqKoCzouLjE9XeXHOMdEwbKZ
         TH4BVtNRrBafqsTnqwwZppt/3c7qs0c39n/TWp6lAdQBTlwdKMyX1S4THnFz1FFxD+dE
         KGqDtLvHwU+Bft1g+bcZ71BmkJ6k+iVzt/7CGBWMhXRGXit5P7/tTlwhFlMoWI2KPUyK
         k68kJsojvZV4bvhu/govJ1AjAAAVLggStacbRAyJvKeQ7ivl70lGqtKEzxxTZ25oPxb4
         aoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743206629; x=1743811429;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T16tHjdcydDyfcQnO+rO78FihM7DOnKeDErtF6szV0c=;
        b=pAPXhuoIuXJ1+jPU2Oo3SgUrM6y85zt20QSSyLJB9pSGDPCX5+qKlrafbRhqW9+HNx
         ItYvEbZTqvjz5StlfwZC4hxflUk5JpPiWt7cPreiRAS15ZJUOpSKSpb4v/ww4f/5n+1y
         tlxG5NbPLqaEKWLmybx/VOwghcINkq+MsaX30YJkO//K6lSZCZVQ/CzWNZNjCHACttxA
         3IO/8ue87r6rcwEDHp7bBNP5Go29HS02dBovsosqrXolu0Rxc5KpAg7al5su0xctirMl
         I40xmHESp7xXFTcwaFhKm0WybUiHMqYBeoaavWAH2u82VAoZ19QZKoitcALHqyYka4W7
         vgXw==
X-Forwarded-Encrypted: i=1; AJvYcCUfUAhkqDHgH5CRHgKM7HvnBI+D6ah6qcXEK8AR+2RVC4WKTRmnTJe6VpfjPt6XJaGXmFmfpA6AuDVWc/P0xqrT@lists.infradead.org
X-Gm-Message-State: AOJu0YxLsMTt5j0+yFlBDbbgrpRGpZtDS11EonYVMr1C3lsQslsj2yfH
	HmgbLJTnUWvL47pqD1mGVTtGOHs+UssxZ8HL+XH+Y0PEI/Q1NXlbHHp8iwqv42RGPw==
X-Google-Smtp-Source: AGHT+IFXbp95YRShZyWDHTfWt39VhfR88gtKILTuI2qmMg5tUTqt0nYA/ekMozYHGJNsTbYe2UjU9BY=
X-Received: from pgac16.prod.google.com ([2002:a05:6a02:2950:b0:af2:37c4:2ad])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9e4a:b0:1f5:862b:a583
 with SMTP id adf61e73a8af0-2009f78553bmr2229842637.34.1743206629156; Fri, 28
 Mar 2025 17:03:49 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:03:35 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250329000338.1031289-1-pcc@google.com>
Subject: [PATCH v4 0/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
From: Peter Collingbourne <pcc@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Peter Collingbourne <pcc@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_170350_846918_999D657F 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

This series fixes an issue where strscpy() would sometimes trigger
a false positive KASAN report with MTE.

v4:
- clarify commit message
- improve comment

v3:
- simplify test case

Peter Collingbourne (1):
  string: Add load_unaligned_zeropad() code path to sized_strscpy()

Vincenzo Frascino (1):
  kasan: Add strscpy() test to trigger tag fault on arm64

 lib/string.c            | 13 ++++++++++---
 mm/kasan/kasan_test_c.c | 16 ++++++++++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog


