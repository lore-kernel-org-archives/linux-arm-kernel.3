Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2926EE6440
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IML1ayTIBjLRiL1IISCGMNFG24NcobrFATGIP2DkaPQ=; b=Q2BTAgetPq1jXoHeeAnJkgtc2M
	X/fwlhsk/BFStak8W185jJ8wnQf29Ow7TJJ+E6zA3ujqrd6lBIQEE4HUf2l7Fnr9M31y+HhKVDhfz
	mR2nTBu8PFISCmb0lg2v9O8NlImDcwrj6m9CDtXuMIe+J+TWZgbY2YX2V9P2cDwzmiApTLpeCR1bJ
	knDH8r4oM1xoAcFOsLdFkk6N95tS04GRX8cMZ031ztoKyejNqjWphvcVJMVuQ7NBgsX4fu3eIeWAE
	8OJM0HbcqjFrBaYnLYC2NBO+5poS1lNSYyw09Taw4OEfEa72MSRx//7TCNDUPVuIW1oJS+034lM/u
	R1w+wAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavE0-00000005y3F-1DUx;
	Wed, 31 Dec 2025 12:22:48 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavDv-00000005xzS-36HG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:22:44 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so95593675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 04:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767183762; x=1767788562; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IML1ayTIBjLRiL1IISCGMNFG24NcobrFATGIP2DkaPQ=;
        b=tR6qhXVAMAPUe40ja+BUINSAKyroCqF77qEa41QJg4I5Ufc45u0oFNdWOLQC616UOw
         9J6YYKLH8Tm5DKGWwFvorb+3lX3B592w/ruRm1GUWJWVszw6E8Fb+3LpEX3NxvMedaUP
         dyx6MAyd6o+JVZI/LhyN3Xykmn3b7fd0Sw8irWLzp+tCfTt/f/WTbprCglG+aKiAIJ0p
         IzxOn8NUp5MPZvWN4lamm74/RWST85PAsQEc8xBxqc03r82leWeuloYPGQ7ttogxlGML
         ZdjfmyhRJphRMr0KSLagE1FzEZY6EF4KVJsEOib4Xqhw65wrqXvtBZqoI5Ru/kQMb1wp
         fuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183762; x=1767788562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IML1ayTIBjLRiL1IISCGMNFG24NcobrFATGIP2DkaPQ=;
        b=dgEETEKYJkY7evTBPZk0hgiJcrznoFFsyqFDNX3iRRu9HKhGanTaqIA/GD4CQS6zN+
         xa1GdEBvJLD/Fpa3Jyyzye/gy3BklhueKK0rPJ44FYN7+/cpYXYmCYSMeSqvf/nIj9Oc
         IvZDIsMEN8np1RvNnDQLFGEnI0P/0/XZruWz6gwnAPAm4ygLAW6I5hGu4Dk9iVf0m+aW
         cA3BvzOKfhxOMOt7+5Te7+kH+c/kkBy2Ctig/w/s/M6auCCRDcuJQgtojnUH5mz4SzKZ
         TEQFlyTbC1c7atbWc5rDQqWIsCOhR/K60KDgTolRRkMjmgXqixKMKMoQjBMlYxLkdYOH
         Ibew==
X-Forwarded-Encrypted: i=1; AJvYcCUQ73oyytOvtf8t/G9pvZnSj0nq07lg1/o7lLnaxX6Sk9Nzl5Zm7p2ijbpZ9SJ3x9CwkCDYU6ymr1WWfI4YSaBj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn7WoIGgLlM+k6L7DHLzpNi/c5Rc3Szb1x798MfKF9vOlX+2em
	TWW0R41jeV60JjKzxLzwS6pHD7W+ybtEABf3fIdPqPJt/3v8kyJzdInGNWubkKex6l8duchz1M0
	kBR96bwusPU69wD0yaA==
X-Google-Smtp-Source: AGHT+IEJ0sOB06BtEpr8ZstmrMz9PeNhPmO2C6GqJfhTbjec6TNWZvpmubPfbs7AHp85adb5H0AyCveolppYmsI=
X-Received: from wmco11.prod.google.com ([2002:a05:600c:a30b:b0:47d:47dc:d5d4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:115:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-47d1997e733mr293114935e9.30.1767183761820;
 Wed, 31 Dec 2025 04:22:41 -0800 (PST)
Date: Wed, 31 Dec 2025 12:22:28 +0000
In-Reply-To: <20251231-rwonce-v1-0-702a10b85278@google.com>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=dWGhxjFk0H0ccZ8Z0LvyX4T5xP2vhqe9w9Pjy9Iy9EA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpVRWLGkM6ekaGvNs/GppoXyA8q6kxlkpqLewuW
 7WNKhbTKjqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVUViwAKCRAEWL7uWMY5
 RtLUEACKkaSaNK/TcJXYBxaQi+3v3CPDHRjWTgRzkBlZ2cipngBrd+Bwm5aNQr6HLLA2wljr5zB
 sd8yJUc9TZdLiWbispUZaLCxJC+XAMVad9CXiS98PYq5H0Hv98uxbgcFI4T3nuHqM/xrG4OBMqR
 d9jwZii4XhRij0gUrPqQYAqX3+sb174Ah2h6tS1WLllr/7oegCZFedCpoObQ7JF9OwSXtT5VevH
 R2ZDKva3GoKaG0vo428LZXH/UDDFPKUn6o0Y1whhaRXdzIG5we6N/H53PjF2Q+OC2kHDHtqgKea
 xjKnfDl8tJ5TAjd69k/mBPk3xHvVo/vIbXfL35oFTix2yk1n8kcuv1Zx0+Qbv6gF1FSr5sn9Yot
 z3DlseF+Q4w5zWKbGVngm4+kn9Lo6gew72+hoQ8C2n7b9mGKUkCIqmNHamdglZznxgfrHGI8imv
 Lkz8hP73DNqX6vhQblP3+Fxt/SN84uREUef+vAAyVKFAIp7SprtvVzputk+BQAw+YVR+0f8QLLn
 eErdIcXGjyGhtXHOc3Gp79iwy56k9avNJ3qKMHDpuuC1LPYW4FH+9lKwRwkh6qmqJXW5Wd6RnE0
 rUhuFmIzHmZwLTF8u3QbBC9TYTfct5eLCQac3dju/Lnq2VWuei0fDBQanQibHCkKnD/nVST47AS Hq8sRXqSOcbvtBQ==
X-Mailer: b4 0.14.2
Message-ID: <20251231-rwonce-v1-4-702a10b85278@google.com>
Subject: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_042243_797235_991F5178 
X-CRM114-Status: GOOD (  11.73  )
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

Using `READ_ONCE` is the correct way to read the `node.expires` field.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/time/hrtimer.rs | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
         // - Timers cannot have negative ktime_t values as their expiration time.
         // - There's no actual locking here, a racy read is fine and expected
         unsafe {
-            Instant::from_ktime(
-                // This `read_volatile` is intended to correspond to a READ_ONCE call.
-                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
-            )
+            Instant::from_ktime(kernel::sync::READ_ONCE(
+                &raw const (*c_timer_ptr).node.expires,
+            ))
         }
     }
 }

-- 
2.52.0.351.gbe84eed79e-goog


