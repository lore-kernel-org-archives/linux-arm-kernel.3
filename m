Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6345C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWs3GXRlx91qlbus5IlQPX+xUrucb3RvojJ3Jxtdv6A=; b=pddkmzMGtyVuQPMxxTtqKibpQ/
	PYX2qkBhPkxdTZQdQPDsfM+qixhpK77CIQwFVdvgjH0F+OmYoN6uBhNjDYilL8nJj/1Nybdo19pE7
	NP4b5Z86NT5P0o3qruW3vOXUSk2oIEmw4H/lR+8vMbYvtoO7xwV2bdz3AYpjEZvPZPnZ5gTDoWgrB
	HX4HrA6ke7BuiOWlspXec9OsGjgmoHBMai4xNC0MxVmyEOR2wPXX1wynEJabohLS3L4Fbetur7G1+
	RNQUkytzANjgiO4WQub+PF7BAoDbuZq426vCJBolH4ARnvtxpFcZzor8u+hyj5oxCDsNUfjsQaoSl
	xTm1RFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzau-000000062Um-1Lsd;
	Thu, 06 Feb 2025 10:58:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzWv-000000061Wj-0vMi
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OWs3GXRlx91qlbus5IlQPX+xUrucb3RvojJ3Jxtdv6A=; b=R+dmC146Epw8appLw1EP0VSvoo
	SzzkqhgZwRAVd+IavGmKrdwSw84Vgu8jCbX1GG1aV1PLiB5pDHl6ttpyrL6IEU2Y6bysrEJg+ENyl
	qbS5hnih5W6JsJZp0fjQsALlf/zTuHhJC9XD6EpHUq2kubemtF3hc+zqjaez79Cts+SogFwHZ29er
	e/D3a+y9+i/J00A29H79qx4rzCldeQsFXX7pyWDTVTKDj8fbKImItz68/XnEIT9FNs5Xo4f4Ey5Sw
	RBFKvQ/DhFkxC2npMHAbN4XHk9QtkNhpjGUdFc+rOM2pSwbNrhGbIKN2wFbWWddZdfpEM80aJkrrm
	mY0Liqxg==;
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzWr-0000000Guqb-482l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so7253625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839281; x=1739444081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWs3GXRlx91qlbus5IlQPX+xUrucb3RvojJ3Jxtdv6A=;
        b=Xjf9j2Fn/WywLvU7/RCVrSmHVv7Wzl4N3dgjebRQwcn4ELWifAWQJGS5JvUyGxIfw9
         9gTMNo/UEbF3zVeiMrsuGgLcG0eqwYSdarlC9b6rmP16JXPaGJigH6dtqHQvzqgk3FLg
         l5XY2xK5N37dHnLX4Am9bWj6ksCRoma782kdnFJUxbuMlW8Vqr0PQHmiVK9LgQZoOKbO
         zjRuAjJxAiX/sRBvUHlxUx9cKhwH1njTyaI2proUIO3IkyjZHvlZUCb0SyTyQy+bRvGM
         4usm/xTO4zel1iJ7zUxAIA1n0hNu34IGR/mUt6SGflHD5/WRZN52rbwQsov/vJv2ZzGN
         7QMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839281; x=1739444081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWs3GXRlx91qlbus5IlQPX+xUrucb3RvojJ3Jxtdv6A=;
        b=o8wh+VHCICqwsukTxNJeBzGVbcG80PMlaUWcX9L4mUAK8NfYdGS8IRXhQKvEgD9RwU
         nOHn8nkd5+dxcUuYtGBz3qTSCwq5nO7GF96kBT3umWtT1LIB7ckrWMjgJwtu6K3q/nsf
         8NsyGWQ1vhFe/xof+TzW929xNf0LWnmf72gzwpSdXF9enwqnN+vX4Zaib9IvCjR3cUWL
         WQpvFqBahmtTLl2mQjvhsGPVpCSXQgx4hcQILlFJytAz3mmn7Hx/yAcISQgF8SvbfCTu
         ZQGy4hSnEyMjCXOIfmMfMw9JEXGjNLmawBp1j7v+aQ5IGRkEucgpoGk61YZ6NnTfo45j
         +FxA==
X-Forwarded-Encrypted: i=1; AJvYcCVINBvETxwUq2BaFI371DHtlcHXmVGEBqLP16i/Ne/ViVhrVn1jMsuOaXv2GbkHjDxKwgp5uJSyjSbey52g9i7P@lists.infradead.org
X-Gm-Message-State: AOJu0YyDxlq73UsXCnyRF3KqtQRtquvc+sFKT391YHFLoks4TZ2xMqYm
	zzLhWLuxG2n5ur6XFDtbYCI2esCjAUN7aqlzB7zzYNhUBVgHtE08
X-Gm-Gg: ASbGnct2+Qctmv8oLGzpxpTpm3SuNIxkaFPoUwI9uzPGB8E7IS2HTJnt0Ev5nxsveJp
	mJ0OAcN4lRJfkLd9D/IEik6npNm9SdJmbdn1TobIRieQ7B7iMdy3Mg3OSndkO6RLJZCXSxYWWBv
	MmKuSwo6aTIrUMJs8y40SSFIOswetyqHw4HSox+M1KHwmRwLbNGFM/VZtiCXBSYVUrHk8w84N0q
	uFjRVx51tkSkWkKydUZ8hQFcD+7I8CTn/83LYgFZfWOrnU5P67UG/BG9cGjqN9H/uXJF6EH58Qz
	SUwx0g==
X-Google-Smtp-Source: AGHT+IHeU2y2+7O/uQKeXcLLdS77pnq5NJz5kvWtZprZ6uplDLOI4uMkvBsICSMk+DCJ+KCjzZMlhA==
X-Received: by 2002:a05:600c:5114:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-4390d43d8ecmr61035955e9.14.1738839280667;
        Thu, 06 Feb 2025 02:54:40 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:1b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fd23sm1381770f8f.71.2025.02.06.02.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:40 -0800 (PST)
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
Subject: [PATCH bpf-next v2 03/26] locking: Allow obtaining result of arch_mcs_spin_lock_contended
Date: Thu,  6 Feb 2025 02:54:11 -0800
Message-ID: <20250206105435.2159977-4-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; h=from:subject; bh=WHhXMqIdalfkSexlY5e1BRqspbIYdrDmDQT3rX3AKP8=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRkvzlsIk8Mh+hFnelZKKgCgtqU9iOBLKbPXk+b Hr7ixKqJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZAAKCRBM4MiGSL8RypWCD/ 9a6wXeJpwHCx6Ry/+60+90gq49Vx2iM0Ni2K5/JZ/w1SQ1K45M6aFIB7872eGf0XNmEL8eeYRcg6ky oIbxfK6Dz0h4c4cjezC6IO7ADwiRf1nt9gfi3HEwqdWIzBMac9NGH1ITZzTSB9FZuAkqXAfpZZq0iW l9L7JT2bKDalL+4TjYIHnpQaWg+MzdyiUwK9daJqckornGM5bI4UFqkTtWU74gzcj9I8Ww9UAJmZll /0oSi0NI558EvQj/JozkqtizlLGWLPs8WdwyXca/O84yRKYAhzPQZ+Ebe9SP1IcoorQstTzGtBQLkN zeZqTP0CpGFfPZy9B3ND9iBY7eJQQxB2h2yT74z85HkKKEjc2v0asUqBT4vT+B5nCPzdr638w7FtGe emuAf5iymDVjVyVtnlOV9UV5465nfpUZv9DqAwksMUOVSc3qvTgbKcDN4XsiSIJPYVu+XDqiFZqx3Y WlVVJyTFe+L+QnTVi8xn2N/fICy+rFILllPSBpOso5O/9KXfpcu9vnaCtViVPakzRGJqLFeOjxAQNd hQxMdvz26zEoWX77OknnGmg7FcT6xSJ9eFK4uTMlDQbiikiPsGIMVPxVutFarPkQs5maZ7giuy1hnE iy/9siJLZmE3DRYLv0bOoj+wxlb6+yk1cnr9VBCzo9XnhvUEn57+U1QY9opw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105442_073823_E398BA8F 
X-CRM114-Status: GOOD (  11.12  )
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

To support upcoming changes that require inspecting the return value
once the conditional waiting loop in arch_mcs_spin_lock_contended
terminates, modify the macro to preserve the result of
smp_cond_load_acquire. This enables checking the return value as needed,
which will help disambiguate the MCS node’s locked state in future
patches.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/mcs_spinlock.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/locking/mcs_spinlock.h b/kernel/locking/mcs_spinlock.h
index 16160ca8907f..5c92ba199b90 100644
--- a/kernel/locking/mcs_spinlock.h
+++ b/kernel/locking/mcs_spinlock.h
@@ -24,9 +24,7 @@
  * spinning, and smp_cond_load_acquire() provides that behavior.
  */
 #define arch_mcs_spin_lock_contended(l)					\
-do {									\
-	smp_cond_load_acquire(l, VAL);					\
-} while (0)
+	smp_cond_load_acquire(l, VAL)
 #endif
 
 #ifndef arch_mcs_spin_unlock_contended
-- 
2.43.5


