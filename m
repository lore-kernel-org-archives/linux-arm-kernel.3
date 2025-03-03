Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D4FC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Uc01JwRLTx4LvOAU9cv3DgvL5O0RF1rRGwSEjckiRA=; b=bINY5Offsee24oI2ibDZZvlyMT
	6wCisX8bH/DIIhvXkhWVhGIMcjUNIzmTRbNaPNp/Vl7UllDmT9lDgB2Cx4DCTG8JuUMYcRpyFRgvv
	NYdpshDJYfWm1A3QRN83+oayjFiBtrDUmevlHI9IXs3w057t7IT8jO9byFHcsDLMGkzzteCPBrHzM
	Mxa2xGVsA0GYe6TTmhAV29g9f7eRqi7o7Hz8zOflh3R08ed900QrK4WXXkHaDvnAqw4m/H+U4YHy0
	UAvc7tZGmAoLiSMnr9iCMOoDJTVQJow7k2btAyA94N55vU76g5quPlgATPzMc208hk0m4dzahOlIq
	tlHvAG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp88S-00000001On6-0y1Y;
	Mon, 03 Mar 2025 15:55:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dp-00000001INm-1aUo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Mar 2025 15:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7Uc01JwRLTx4LvOAU9cv3DgvL5O0RF1rRGwSEjckiRA=; b=YGgcnJLofQuLq3hr9pd9FD5uu4
	dgegGu9QIXWBIViqcZmsWFzEr8Wc/zh0giEX+iNF/jVNyy/gAwe5yOWp+6dIQb9ffHRJDWpPk0jBV
	ZE8cFe5wooAuz/y0PLoIRgDbkX7R65Pq7U1wnUbXU8E9nQeqDTsimuiAh60jlHDjKJLpp8wRZF/Us
	6zy+hAh3vR1YJsDBLs8S4IbmXRdKqhOofOeYYcOu/Bop93Ik5N8Jc8IwGJo+0kAOnSXI/yarlzUVX
	DjFd9R6zuTZmuAQMBgLCmAxov37jSaz3htNys0eDso/f38udyYnUE8YI7BACE5V8ZDJLGXoPuggK0
	MuJbGLIQ==;
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dm-00000004Zzt-0gWk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:35 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-38f2f391864so2550624f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015413; x=1741620213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Uc01JwRLTx4LvOAU9cv3DgvL5O0RF1rRGwSEjckiRA=;
        b=Uza+bhpc5aIm59jnCMJHWhP3RNt+7qFNKw8jPWYNbns2RvzGrgsl02Bo2zMrKl+QUy
         R1i98HK4yUgNvAiSdL+Zhk5Hsp6m930SaVvmHFqCiDlLf1YqEwx3G+Mw2M2DSn2AS6Nt
         06B6d4qpsgURdZzTYv93N6CcZIVPkPwZV+jgroY60UKOqc8BmRfCo9URmis/3EtvDdq8
         AMxlF8ipZSFRFd0tYi+K7/WWPt6ogSCl/a2lDnxEPlUmF2CtFOj0Uo64mTs1tsFcFF1R
         +JGX2eWBeBIzHn+LNwI0KnMo/o7uF8zl68SMV2BuiQTpNYmY/yxJb9/12+o2xmffNyfg
         FjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015413; x=1741620213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Uc01JwRLTx4LvOAU9cv3DgvL5O0RF1rRGwSEjckiRA=;
        b=MFy9LD6UdnGV3oI1UzOfnrNu6SLpSzJGovH2SLH4kIKCr4Q8SiHAgdfN2Y2qHtasWe
         uvdEtzZvSgo/Xqi2968mhGKanCEfB+8WspXzLBe0dTLRsvlfEyesaAcexDy55ViGZzYc
         C9Qt7sa5Y4YwJmSt+0Gh9xwViopiiEafwIHNrtSPI/epsMiHbN90i6sHDr4GsfCt97lv
         bCTCJ2NZk4DETDLbo6L3G5OZ3ZiJCUtSC5PPi9korPB/FcH7nNLVWbGr61eVJq2H/Udt
         cYWj5IhBIHFB7FZNzq2XLy0xxlQrlNb0i7UsSO2RSGkPoxTeX764ILkYS3K8FlRppEIQ
         b7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCU710yM4Ypot1DEmOU7dH0dZz3jW6lZAyLx4m+pBSlWIc64qJlPOrKpO3jDEv9rB4hMrqnyd3K5KHUOrbR214+9@lists.infradead.org
X-Gm-Message-State: AOJu0YzTcIz4+Si/gqgdhMaCZBgEPnvM8nrFB9D5nL20vzvq26QodrW9
	WF8SgNzy/T5ybfE5wq5DHa1UxnjfpjHP0rC+TmO92l8Dg+qqu4OX
X-Gm-Gg: ASbGncuIADWQPlACTkfa8NenuoXxQCsuM0fgZ4JSZUianr5bH3UBkRkourRet+d3bnp
	RRThGjKcOMEpaeZUDc29qSdeGub5I1O+g/Z7cwC3ssJMyteued98T26Xo+reg2n2KHwttyPl2Nc
	ARmUA75703gkjTD+4PjayVT/jUsbRBdtGGp1Dj+0Cm572pGTBJiMS18JX/kxwgNio2OmyEjBXwN
	ZtJfGE8KP3C2IwmvAoH/qzgbTMceXTgToLr83sMKlOij7OUykPlesaMetadCPKbyY818EGRrJLK
	srHQ6k2n/GuQVOj+P7hy1pIF7aooKZ8TkQ==
X-Google-Smtp-Source: AGHT+IE38gK5wJECZxFlCYL7vqyBrElWlJLLivqEZ8lVMAciRT4pe2f0X2OlAMW3qevmIMhBs6VcWg==
X-Received: by 2002:a5d:6489:0:b0:390:f641:d8bb with SMTP id ffacd0b85a97d-390f641d990mr8952175f8f.36.1741015412881;
        Mon, 03 Mar 2025 07:23:32 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:1::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795d1asm14571262f8f.4.2025.03.03.07.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:32 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v3 18/25] rqspinlock: Add entry to Makefile, MAINTAINERS
Date: Mon,  3 Mar 2025 07:22:58 -0800
Message-ID: <20250303152305.3195648-19-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; h=from:subject; bh=qSIKPInVzZ0EbqaTg/PJPPvBSQOZHHVdC+CsMy/ps90=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWYI9HLNzIFosVfpo/eAGZLrsdbAXI02uiFuv5j gAn43fCJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFmAAKCRBM4MiGSL8RyraqD/ 429SlE3+raZFobBUUclVgrmx/5S5ghp0W6qHlpRJg15mqb/wQ7Nm7MfnP8Mt/cd/yugjieC5xXaIZZ 2gRGy1o4SiUDG91z7FYRxs5REy+twKo6/1wchd494MGNac2afJXVeogt88nnikDfs98ML1W3w4kR3r djShNfhU1YlT5UB9SixxXZsaVabsgXdlD37rG/rItcXLa2S3En21E7gq3ApgqdOWZE8a6/JpEG8kW4 1oXfdGyOuubLdfXTC9F1nuSlIdMSGnFINmAGPeE0mrtgS74cGYxE1pMpplfJMozQabn7YjTuU03xNZ 11p1zrVmvfoac73XycC6N+KM+AcpskEIKpjnp+SKHkhbf4PG513KLKQYTz3VNWwfUHh5AKOH6FYBPn sZ9LhuZ5FHOn+bfFHRURJQOjSlOHS088r968BsyQsVY1qv9RVyVM8VbqXS/C+frx/mSypWU0V8xVte r5NQyi+CfLnuOjZe5fyJo34b4gNNn+J/hqFR486kfOAD9hBD9pjSNnaD7P8U1z/36+m57yipbTlO3B QKtFBqPHAvNwGSaCkhb+JWZfcH7pd2jC83wadWyvMeixxn0WY4FwIP1tLyCP6lxkcbqNUICVYdOfqn LQ9KXmI+sQGaXI4NJ2OV88iI9YE445UWW9V+2WXlW683DUBbYbB8AjtUHjIg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_152334_422453_D522B374 
X-CRM114-Status: GOOD (  13.09  )
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

Ensure that rqspinlock is built when qspinlock support and BPF subsystem
is enabled. Also, add the file under the BPF MAINTAINERS entry so that
all patches changing code in the file end up Cc'ing bpf@vger and the
maintainers/reviewers.

Ensure that the rqspinlock code is only built when the BPF subsystem is
compiled in. Depending on queued spinlock support, we may or may not end
up building the queued spinlock slowpath, and instead fallback to the
test-and-set implementation.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 MAINTAINERS                | 3 +++
 include/asm-generic/Kbuild | 1 +
 kernel/locking/Makefile    | 1 +
 3 files changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3864d473f52f..b0179ef867eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4297,6 +4297,9 @@ F:	include/uapi/linux/filter.h
 F:	kernel/bpf/
 F:	kernel/trace/bpf_trace.c
 F:	lib/buildid.c
+F:	arch/*/include/asm/rqspinlock.h
+F:	include/asm-generic/rqspinlock.h
+F:	kernel/locking/rqspinlock.c
 F:	lib/test_bpf.c
 F:	net/bpf/
 F:	net/core/filter.c
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 1b43c3a77012..8675b7b4ad23 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -45,6 +45,7 @@ mandatory-y += pci.h
 mandatory-y += percpu.h
 mandatory-y += pgalloc.h
 mandatory-y += preempt.h
+mandatory-y += rqspinlock.h
 mandatory-y += runtime-const.h
 mandatory-y += rwonce.h
 mandatory-y += sections.h
diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
index 0db4093d17b8..5645e9029bc0 100644
--- a/kernel/locking/Makefile
+++ b/kernel/locking/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_SMP) += spinlock.o
 obj-$(CONFIG_LOCK_SPIN_ON_OWNER) += osq_lock.o
 obj-$(CONFIG_PROVE_LOCKING) += spinlock.o
 obj-$(CONFIG_QUEUED_SPINLOCKS) += qspinlock.o
+obj-$(CONFIG_BPF_SYSCALL) += rqspinlock.o
 obj-$(CONFIG_RT_MUTEXES) += rtmutex_api.o
 obj-$(CONFIG_PREEMPT_RT) += spinlock_rt.o ww_rt_mutex.o
 obj-$(CONFIG_DEBUG_SPINLOCK) += spinlock.o
-- 
2.43.5


