Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4FB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 20:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=37BJ0PFh;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I4EtfQBu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6Cutn76HGVOvz/pUDurQ4xzloi5+zrfO4jU85m5dbQ=; b=37BJ0PFhmrkzCZgMN+Fe0+LX4w
	oy1v+DglD7mHEGZuHTQhL9mgvzCqJfm0TZ6H9muhwLsD1J3CpvX4Y0gSktDr/Zs/BIGVIsWaci4Js
	ytxuuLl7hXMqs3yZQ0i4kTPC2qVg2zBCPs9zD4zJuP2XNJsY8l6Y6/kOWCmPNqZeK2CbZqgFzBwtv
	dalTSiUnq7jGVyGLmlxhCvlq/LTP40HAX3eCD4mpuleIK+tnTne6SFYIBTr0p7bHvV7bJv3PLXea7
	0dgNRYRpZfcq8x3qvlSvwcma7trUfNbmh8lWEmWZaCQWuH24Kww7MOo5dfuG89b3YJ7DiQ+FXp4rO
	/FtY7oUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xItjV-00000008IIK-0Y11;
	Mon, 19 Oct 2026 20:13:21 +0000
Received: from mail-dl1-x1245.google.com ([2607:f8b0:4864:20::1245])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xItjP-00000008IFp-0x6G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 20:13:16 +0000
Received: by mail-dl1-x1245.google.com with SMTP id a92af1059eb24-155a75f91e1so32725c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 13:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792440793; x=1793045593; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6Cutn76HGVOvz/pUDurQ4xzloi5+zrfO4jU85m5dbQ=;
        b=I4EtfQBuFpx2LsgqwR9jz2kgTTNNXKM/z8wJEew9AoK6y+PNXn+zJeZQI8EfOyXnja
         sFd2PVKUcqGA80/zS9JxYMO5yE2Psq2AS52y1EFYOyK9FcdC0vFUndDmlv1Atwpia6pm
         fIrhc9o0Vpw4liU0Gyzu6teL98Bl/qnkUYuQZKVRvLizrSppmplgN+4t574ssR1m+7Ee
         UXnLknp5wTn7b55cB8Db6PNqN82a0kzxTs/RXkfFWaVxzA+0WFVRoaZbi3uxTjKPe7PG
         5/A77YldOodtIr+goBP4FF9eYCOAbQwui6IdPFSuHU9Ldt5gIkoANkyzCmeoR9V0W0V5
         lMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440793; x=1793045593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6Cutn76HGVOvz/pUDurQ4xzloi5+zrfO4jU85m5dbQ=;
        b=lFV3MmzLd75ofuU3cQuc+ompAHmKkHeApouOQ9VEmjY7LN1xwvg013q4lXz32KTZ8a
         sxGSYTCitiDd2TjSAKFnqg0IHzI8GgqzyZ49BEftEiUBQ65w4Wy5NJN5coScqtOxLJyI
         Tb2iZedNS7fTQcdCRy8rv+Cg1WauqS1QDga4rLHvIDnCdqgwzzYfIBWHCUUHWKZcag/y
         MXQEO3vHAJ1SiO0tC4VmVf9odWC7UBCP1UaYlzbjUzNkOrFibzyHb9E76+u0Ewc66Bat
         JMrfLKEaOeSmxK+yzKVmlX0ijek1o6zAKuS5IbaB8urQ4m4EGojctbY+t+ziKkaRR8DK
         FQdA==
X-Forwarded-Encrypted: i=1; AKwUvBxq3RacbvWURTlPK7Lud4kEd/conMRRmHC5dEjYZK4fyRYRTbOj61MxQ8R7Dg/QQU3jGYsOOr5KFAV/sSOmkrtx@lists.infradead.org
X-Gm-Message-State: AFq9FYIMgigSY6UIGV7u5nMD/YM8LTyMCEF1gOgxrv3GEJaiZKYLjN1L
	8QmqsrIOFOZs1P2yXuf2LkkEHozWe8kq2vHLb9HVeTato3E0FKBCk+p6imVV7tQmM8Ed61Bx5MI
	mc2CZC0RsjA==
X-Received: from dlep19.prod.google.com ([2002:a05:701b:4593:b0:168:9e52:72b9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:130d:b0:182:c472:b123
 with SMTP id a92af1059eb24-18db853ba02mr237142c88.1.1792440792662; Mon, 19
 Oct 2026 13:13:12 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:12:57 -0700
In-Reply-To: <20261019201257.3805356-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261019201257.3805356-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019201257.3805356-2-irogers@google.com>
Subject: [PATCH v1 2/2] tools headers: Update the vdso/unaligned.h copy with
 the kernel sources
From: Ian Rogers <irogers@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Christophe Leroy <chleroy@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Eric Biggers <ebiggers@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Ian Rogers <irogers@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_131315_264295_A0043534 
X-CRM114-Status: GOOD (  13.77  )
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
X-Spam-Status: No, score=-26.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To pick up the changes in:

  vdso: Add VDSO_UNALIGNED_PACKED config option for ARMv5

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/vdso/unaligned.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/include/vdso/unaligned.h b/tools/include/vdso/unaligned.h
index 9076483c9fbb..726fd15efc82 100644
--- a/tools/include/vdso/unaligned.h
+++ b/tools/include/vdso/unaligned.h
@@ -4,6 +4,20 @@
 
 #include <linux/compiler_types.h>
 
+#ifdef CONFIG_VDSO_UNALIGNED_PACKED
+
+#define __get_unaligned_t(type, ptr) ({							\
+	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
+	__get_pptr->x;									\
+})
+
+#define __put_unaligned_t(type, val, ptr) do {						\
+	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
+	__put_pptr->x = (val);								\
+} while (0)
+
+#else /* !CONFIG_VDSO_UNALIGNED_PACKED */
+
 /**
  * __get_unaligned_t - read an unaligned value from memory.
  * @type:	the type to load from the pointer.
@@ -41,4 +55,6 @@
 			 sizeof(__put_unaligned_val));			\
 } while (0)
 
+#endif /* CONFIG_VDSO_UNALIGNED_PACKED */
+
 #endif /* __VDSO_UNALIGNED_H */
-- 
2.56.0.212.g129ede20d9-goog


