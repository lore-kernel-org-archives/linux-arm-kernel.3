Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF673C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 18:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmZxT8OePR70IlcHk3w9PyaS2Ebe0ZK5Neg7TiicVTQ=; b=KfZzYfL0+nEQPwoNOOZyAmLEot
	g/haWf28jMFdlNySOmF8RE1471bXu/ie42p5hwPvRl40h4erS27tiUnt3Koiosl6LhBw9AivqSylR
	0NtpGudRPmY/xH1A2Up19pT0tUetHFIY85XEMQRVIrdoTVXY0BmIzvJ1P12yp0twiA1Ul9uyH2awA
	098N87DTDUpTeWwNkQuu7otvonfqew98HuTtwrYRM4zSjEceSpCbH7Sypt8wF2na9vkMG/EuCFRR+
	nnr3LAs3BTYzXmtcrXSC7MbTK2AX5b75eicrTLamQpP/UAr/Y+AdEjPrOOlnGY15D2Sj4dzFMTY+4
	hYUIzb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYxq-0000000GPpI-0SPO;
	Thu, 01 May 2025 18:48:54 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYiw-0000000GN3V-19mz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 18:33:32 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b1c122308dcso1422247a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 11:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746124409; x=1746729209; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vmZxT8OePR70IlcHk3w9PyaS2Ebe0ZK5Neg7TiicVTQ=;
        b=pa3Lu9l++laFgtmYXmUZWk5wvThXijygfsfjEPacMinf19i3YZW2lxtT2Uh/YARy6P
         xAekJxx+7njnVSCjBhqLm/lIjPIDwL2oXoYOiGBpxE6nblOK3eJZ6X9jTxvYHzASJi4A
         ihWwq9yvkmPN53+F44LYROT4UobY3q54ntANt+Splke9RlDWxpUgeKBwVWUv7ROTmniM
         Q3ZYwHUPXy08amiZI1JlH6lNbRQ2U+JGL3PJhKKM9+rsMMbUw8rAAHdygFFu6zGV3LHG
         mIGyHOOKpLPnBtznuu6HTA0p8lNIN3fX4hu4HxR8zYnSmTizV5+BSrtbH7tFY1P/x66F
         IkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746124409; x=1746729209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmZxT8OePR70IlcHk3w9PyaS2Ebe0ZK5Neg7TiicVTQ=;
        b=xMH7ut8mjsqvJ+L113ZUuVIwDYQxrCj2/ojPE7PW1E/gL2tgFvC22iTsjgBw6ndBRS
         PBalL7SjTMCGJqF+J2mi0r5zI0+pInyFofU4peGlLdQ1P4gnIgBKw4xMrY2dvjZcSNDZ
         65EykKPB5X6Lo1hsB/d74sXFS54jsX9Fz+o7XFqRfaZbjVtlMOTnkLxnwfZtbZpdyu6D
         /B5HyH368ZhKujMlWojh5OA/CCs+T/rzCpJH8o5yQkuWaQ8IT9P7W8L1Tti5PJZUOFRN
         smw5A6jU19XPCy6lxCJMw3ZCzZCu4z82xvfh65y5oORK8TLdz3qLqnAOv59+qnvKo/Cf
         Zuaw==
X-Forwarded-Encrypted: i=1; AJvYcCW0Vp9qjWWad6n6pbmZDefYIZbTt3/iRI70F6lEC/AH4DvFpQde3ylzTCeb8kxsYyUFsaMqWI6B5TXpUjoA5ZXy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8jlz/QYSMO1v1qFOguupLBgp9Zxa1FoXKJrd45Abgoo90sjer
	z9PMkoaswKm1lv5K4AnuilLg2TtLVYdbbsJrEZyNwOYw2qWQC10gOPkxNoonfbtQ8Ul+xYjQd6v
	qVuhSGc/29Q==
X-Google-Smtp-Source: AGHT+IG7ZB54jjneYfe1tn18St+FGK/8C/RP49qADT4OdwlvOWaJA1tk/v3Dm4OeF0p3gO05OEVmZwLAOdDMmg==
X-Received: from pgct19.prod.google.com ([2002:a05:6a02:5293:b0:b1b:54f8:d2ee])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:1587:b0:1f5:8262:2c0b with SMTP id adf61e73a8af0-20cde46dddemr28056637.2.1746124409090;
 Thu, 01 May 2025 11:33:29 -0700 (PDT)
Date: Thu,  1 May 2025 11:33:03 -0700
In-Reply-To: <20250501183304.2433192-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501183304.2433192-10-dmatlack@google.com>
Subject: [PATCH 09/10] KVM: selftests: Use s16 instead of int16_t
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	David Matlack <dmatlack@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Eric Auger <eric.auger@redhat.com>, James Houghton <jthoughton@google.com>, 
	Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_113330_326219_6E148D51 
X-CRM114-Status: GOOD (  14.40  )
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

Use s16 instead of int16_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/int16_t/s16/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/lib/guest_sprintf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/guest_sprintf.c b/tools/testing/selftests/kvm/lib/guest_sprintf.c
index afbddb53ddd6..0f6d5c3e060c 100644
--- a/tools/testing/selftests/kvm/lib/guest_sprintf.c
+++ b/tools/testing/selftests/kvm/lib/guest_sprintf.c
@@ -288,7 +288,7 @@ int guest_vsnprintf(char *buf, int n, const char *fmt, va_list args)
 		else if (qualifier == 'h') {
 			num = (u16)va_arg(args, int);
 			if (flags & SIGN)
-				num = (int16_t)num;
+				num = (s16)num;
 		} else if (flags & SIGN)
 			num = va_arg(args, int);
 		else
-- 
2.49.0.906.g1f30a19c02-goog


