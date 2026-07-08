Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3244C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKUSCNsamYINaoMMk1AY8FuyMTxoIpvfSaBPJ1kllt0=; b=T2TQ5hM9R2sQpCsO4i+4bvDlK8
	oe/vba75UAKA3881aN8LetlZCcMSjnupFNdtw69cKTkpp/9HuSaIe0BkWUCQaoVbEIHRws/J8dAze
	c7QHzNnzbQCHy5VsbhgtS3L84XTWDwhSMzQEPx59GcEaIy+qHc3pdTgtzfFxQWSouhb3HGVcm86OL
	MtCpC0bAv22wkgrk2s++U8AnkQpKhTMIpvIlkshKflWu+akqVnYER0MBybaL7tfuF9oSbBPqMO3+t
	qaYzEMvb8AcHjVvrNCKbwt4FAZ7NXHeLVKdJxpH5uZsh/hsiNE9IYbLPvkGYLKf16eBTHjPbGOFA/
	uygm30rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNAH-0000000GYha-0Is4;
	Wed, 08 Jul 2026 07:57:53 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNAC-0000000GYdm-48e9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:57:51 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-698addf0a80so513216a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 00:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783497466; x=1784102266; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AKUSCNsamYINaoMMk1AY8FuyMTxoIpvfSaBPJ1kllt0=;
        b=pMS5fnQsWGz4oS+rPyc5JEAoWUXtjiwy5KWcPKl3IKb4i8CkY4IYEWTDdgMq/DNVON
         SXhiGiIY+6hoZ07hquy1c4LabbvgRxpAnocZxxnwBt1Q1vD1XkHL+4Lk9OfpRTSgRNzX
         IYfLL160rzCiyBcA6V2KQ3MqZAaOIu2G35MC+8FEM1tAl24tuDVPya1KfxBA4eOFz2k/
         kC6LVLPSUC7vEQBhV6KWUqTPel+KllgkH5F1bkvbqvP/Xz/5L03xIrKRgNXPn4w8pwx3
         fl89vkEfsIIDVuM8CMCaxb2iRax+jyL/MTh6Xg9I3xEZkzv9vBGmFpSsdb2ht/+ESBn3
         a2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783497466; x=1784102266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKUSCNsamYINaoMMk1AY8FuyMTxoIpvfSaBPJ1kllt0=;
        b=kcOpKkLZdEtcpmTOCel4p+x8OCoOwwQnuuFs/afBSwzfp5/2F5MtJ6ADvMRNNkFLBq
         QR5krV9Ds9YpVmwr/gHgwkdnPfdz7SDy6RHQDQ6i6Sx0Qfg+5F8IAo8WUfA95vzjzeDH
         W+Nj/yzHE1lNguHoV/+yPdgDJDMgQm/ijYsBg4bfKqtfQgP7lj7/qtBZQeDafygxGLKC
         Rcc1vks0fg2xpbnf3xwmIwFJGVadE08HlqmjIDa5MuxV4ltq/QybAy99g22VcIgJgMt6
         icIp2HTF0Q/TbK7CfZKIQRvRONbQ4U+UWslXHMMZXS2Un4rSkGGEH75UxqMfRQN9RlOe
         pBfg==
X-Gm-Message-State: AOJu0YyMmWB8Gsi0vvirRMVrMzZW8eoyoyE7Gx64jsvtSmEdLNJCW00Z
	9VAAzR1QfZ8GW4jvAVelqge3LCyKpryIEp/CJR3NR+3tNNLaKTNS3po2pEm3sAVDhxZFl6GNlJb
	los/k8EQQlBTrp/ceQ6vSjw==
X-Received: from edro11.prod.google.com ([2002:aa7:d3cb:0:b0:698:aaa3:b77d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4305:b0:698:585c:f07b with SMTP id 4fb4d7f45d1cf-69ab44634e8mr540676a12.3.1783497466019;
 Wed, 08 Jul 2026 00:57:46 -0700 (PDT)
Date: Wed,  8 Jul 2026 08:54:33 +0100
In-Reply-To: <20260708075435.47419-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260708075435.47419-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708075435.47419-3-vdonnefort@google.com>
Subject: [PATCH v2 2/4] KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	linux-trace-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_005749_108005_BA2A92DF 
X-CRM114-Status: UNSURE (   8.77  )
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

kvm_define_hypevents.h is used to define the kernel-side structures for
hypervisor events. It doesn't need to be used anywhere else than in
hyp_trace.c.

Rename and move it to arch/arm64/kvm/

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_define_hypevents.h b/arch/arm64/kvm/define_hypevents.h
similarity index 100%
rename from arch/arm64/include/asm/kvm_define_hypevents.h
rename to arch/arm64/kvm/define_hypevents.h
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 2411b4c32932..0c7349fe006a 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -391,7 +391,7 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 
 static const char *__hyp_enter_exit_reason_str(u8 reason);
 
-#include <asm/kvm_define_hypevents.h>
+#include "define_hypevents.h"
 
 static const char *__hyp_enter_exit_reason_str(u8 reason)
 {
-- 
2.55.0.795.g602f6c329a-goog


