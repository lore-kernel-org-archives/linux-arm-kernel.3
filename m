Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5306C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4Fpzu6vEVBo0wCJhRUrT6eOf6iL8Bnn94ks0el4cwM=; b=EWZ/wYErTxtOyNtfvhvXzq/X8K
	89HL4acVGdCLWJAw5TkC/sJg9Cx+EHSPlDrHWXG177NuZeHGf4FYFcQ2OLNSAwYAtJfamdfOevDdl
	gqDBecgpldIcZSejt0mmM0YVWTigsUdB2Gtr5476oGQ60zwsazp5+nYtnBmovNlQsouf3FiIVy/J0
	dy3Zhr7QGHTImD8bJ17K6wSuZNzC9mo8a00HaW4hwlksHTDwfyjig5IfXrHuDYBOph0OV3UlkWC/x
	3A9EjzX1YjlqIpWFOFicqTsPWWlDGYZuNvJD00itMsLRKz8EXiE0mV3BT1zh84hm7fJrRf7Ug3xiz
	9of9XqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzZY-000000062CT-2OCF;
	Thu, 06 Feb 2025 10:57:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzWu-000000061WC-0ti5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y4Fpzu6vEVBo0wCJhRUrT6eOf6iL8Bnn94ks0el4cwM=; b=PrjOQspbW2JJOQnrN1DjoyCfFH
	kTTHXY+AM464R9qMxLBlKaN0imqo76vBBqIQcX96e3XTHnCYepEDAq+zHXvlJgly8YARHLvVJZEvb
	jz6ossyw4GYUvjlFoIjeKC2/utMnSvpDD10fOBSufmiWdyNBqIDbYlUKbrD7tzvwr78rS/79RWZwM
	atns55LSI2WE8jCl+PYIAshaIns9gOMaZc1ZAIamaXtN/hA5bnp4+XJwkHNJEOu2QR1LSm34Qd420
	EVNaFz528SRNoq+qB8OWoysOLmtM1MOQpUMtIG6C0L0e7iDUk/sMv/RsfO0u7q587C7ZVnRUf6Vgr
	CfXwHtpw==;
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzWq-0000000Guq4-3SVZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-38dc33931d3so96375f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839278; x=1739444078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4Fpzu6vEVBo0wCJhRUrT6eOf6iL8Bnn94ks0el4cwM=;
        b=gIU9CfiAWoQlQrvRmgZ2S1E7VGbVNRLhXX7aJmA2GgR6AMVYAYxmNJovPgCgpwbxkk
         6+ShBLqJppeavNlpH0Ua3F/a85N0vy9n5OUCUZmPas5FdvfxGkxQ39RxizC+QvwWu73Z
         HGduM3QYADZuAsuXYCvf9DzRpGnWijl1JmoAACfXLLZ/V63HtVZdIHGvj1GHB6Nofzv0
         TOv+/79glyej4C+Qo3ZTX7s1kQueNO4hzkFeOXHnNzMZS5UfX1q8MPBP2SZ2gUqexztB
         By0sPuJSg0Gd0+29LR2bUDtAipxoyc1YoAbGwZIEb1GDLw/XaEswZolPO6Igt8JBFqaD
         P51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839278; x=1739444078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4Fpzu6vEVBo0wCJhRUrT6eOf6iL8Bnn94ks0el4cwM=;
        b=npXaR5CTvex6KEJunT5lm8H6iPR892yzLdZQ3RUquG4dpoVlz72dMZxFPVau9kTJ0U
         pBGRg31QT7j0oVos2JppWUPojMvejLw5XYV5/hF/liAJXXLp2Z6AqovP4IslF5ztgcbn
         B7mZmNg6lNTpsTPUIt+mhymLqu3oSHuxsuLTKuowwfDQf+ilZhemrqa+3+rpiGrkNRQy
         6Ek+xZEqr/DSB1BoPzk5rmdprrv08zeLS0SM6yccGUIEuHNnx/CrPP9Jtnb8/yekRhev
         vQgyTFYjfLTGS/kozi8h7s99DkxfeunlijUbUn2i8+0s6oHQNaOGQ080s+vJUszhUZDs
         FeVA==
X-Forwarded-Encrypted: i=1; AJvYcCW7N6qJN1XK4bq72yQchn0weljdfYwiuQsfiKCUzTo3ehdLwhXCfHqQWoOb+z45anq9Nr/m51osro1pxt8reYDl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc0ITF2xC6rLRTRNlSlrqsjnPCaUwJzS8vTAebIlIXiQQdDson
	ToJwLX5uvk6P0uzglopzCuJFBRSeCC86sd2Hw8HYUaQbnytYVBJi
X-Gm-Gg: ASbGnctAkeSx+ECzVzSQf40OXEx9T2cn/PmkyKoKORgUdNF/N+JSilxW0QnRSBz1/uO
	KcTSn2450p2PJ3VDDvFm48idLVeZp7s0j/WkKYlzza6ODJ3QgqorqgargyD2cbsXrW1TTcQVnph
	xcNbCqxaXAPansVJOoEC4ABVs1j8aWb8da+5x5vCxR8iPTM7WHBHWZdph1CEoEgvx9nyzzqUap0
	9V7YzKKeqpkpcbn/twuQHi2RUDtbdEiOrBuCOcncGcvy8xfGQg8PaiW7dUZhqzxpkJgxRCBYn0I
	p3x+nQ==
X-Google-Smtp-Source: AGHT+IHM5vaMe7dQKG64EkTeSRsdLjRkMoUvLfANIG4QYK0OqXKUcNrK28QFEfWzU8iR33/xEot5Og==
X-Received: by 2002:a05:6000:184c:b0:38d:b807:b894 with SMTP id ffacd0b85a97d-38db807bb8fmr3106134f8f.18.1738839277867;
        Thu, 06 Feb 2025 02:54:37 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:72::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc050d688sm912424f8f.24.2025.02.06.02.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:37 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 01/26] locking: Move MCS struct definition to public header
Date: Thu,  6 Feb 2025 02:54:09 -0800
Message-ID: <20250206105435.2159977-2-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; h=from:subject; bh=l+FzxzqcQOvCH8c5GurhKDmppajCdKyqii/WUkvzxT8=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRjghejvu1V67bqXOIvMlrdiOA5EFuq9ml673Px YVwX7L2JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUYwAKCRBM4MiGSL8RymRCD/ 9/YOhtMVXa4uhP+xTSUCPdwnoJ2e7ZwYDxog71LJ2HXxXg9/eSH8/Si/tA5gU1tWmG5QH+z9074vpJ vFqxdR0gSvIAsqQrBO0Tj1Qgtdyo22PRO5rV3ADONgAsBycwmCaZBA33dyS1teyYYdgun6rsOcUI+f 7pF1YCbr7dccOv8O7agZL2Y/864xfviCiuvbQTK+cwwdqybOxwT1eXhHNeK0iH7aUa6XsePpDTIUo+ Jjk3tHIskRifzXmI0/KTA1h/KRtLc8mbDdNugVNuuQ0Zglv9yZqIcVqy3z2l/OXaAVJlh5g0JO6dlM UFIZc61NIQP5h0n4mDGH9B1u7jcOYk+PiiJHCe89a2orxDwKXXe/wwnz5jKbllMykb9ikA9Ok+hW5d iP0uJ1ZTBE0OFUVJ7kZfX+CbwA9+l0dW6Sk5V88N8siHqhSZvKmyXQLvmnfjHCgGWq9VIkbzgNLFaZ yMEFQeShp0yCBfOTpqybarU2fc79rESPAl91vmwTkbkdGWUDl7ZmqaOlaNcnSsdyJIX4CxqqO0ad7h s2JcoMGOqNOzWMpcA7dkooTjlAydnB+BiivOD4kaYuS141fC0PntHgdN8c2hpVTrG9A64nnLBRMSVN wvOc8dXgBeQceXqmhiBDNuP6995mi4cgcucLwriFXse32y+vjJeqT2hqUBzA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105441_002876_E903F97A 
X-CRM114-Status: GOOD (  12.95  )
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

Move the definition of the struct mcs_spinlock from the private
mcs_spinlock.h header in kernel/locking to the mcs_spinlock.h
asm-generic header, since we will need to reference it from the
qspinlock.h header in subsequent commits.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/mcs_spinlock.h | 6 ++++++
 kernel/locking/mcs_spinlock.h      | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/mcs_spinlock.h b/include/asm-generic/mcs_spinlock.h
index 10cd4ffc6ba2..39c94012b88a 100644
--- a/include/asm-generic/mcs_spinlock.h
+++ b/include/asm-generic/mcs_spinlock.h
@@ -1,6 +1,12 @@
 #ifndef __ASM_MCS_SPINLOCK_H
 #define __ASM_MCS_SPINLOCK_H
 
+struct mcs_spinlock {
+	struct mcs_spinlock *next;
+	int locked; /* 1 if lock acquired */
+	int count;  /* nesting count, see qspinlock.c */
+};
+
 /*
  * Architectures can define their own:
  *
diff --git a/kernel/locking/mcs_spinlock.h b/kernel/locking/mcs_spinlock.h
index 85251d8771d9..16160ca8907f 100644
--- a/kernel/locking/mcs_spinlock.h
+++ b/kernel/locking/mcs_spinlock.h
@@ -15,12 +15,6 @@
 
 #include <asm/mcs_spinlock.h>
 
-struct mcs_spinlock {
-	struct mcs_spinlock *next;
-	int locked; /* 1 if lock acquired */
-	int count;  /* nesting count, see qspinlock.c */
-};
-
 #ifndef arch_mcs_spin_lock_contended
 /*
  * Using smp_cond_load_acquire() provides the acquire semantics
-- 
2.43.5


