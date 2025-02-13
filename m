Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C26C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azo+14HeAmGjnMr0Vdj3xinAaL5HZge2DDBa/K8+Coo=; b=cw0vAQJVzu6Z5LIUFBgWgLF47k
	RVgGT2M7ip+kszahSyT6tgdmSY1NBIF7+3ckaq+ppW54Kc7ljVHwyzBt3L0H0DBVAQBhsZom7c+1E
	Vbmgo5Ja7B1tzLlcZ3M/UguAoyz+Y0hTW6eY2ZHX3nTytvtO6s1YkjkyGjTzyPGII6F6fbTVDqUSn
	Iy+cJldaQwR45kFWmD1UafT4+Ev9GHRZU6OfHiD6T9ROzewCURxAVaoCwG6BEoBrm3N1prYUSrNhR
	5izbWgL/lYSLni77hwxrP/AI3EYFCDzqhjXnReYSKy1odXj7qvq/vNZ6qC6X5NhvEW1izRxYAaSk8
	RnjdHOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieWL-0000000CL0a-46MY;
	Thu, 13 Feb 2025 19:05:09 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidaP-0000000C8di-3MSW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:05:19 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ce81a40f5cso19455125ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 10:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739469917; x=1740074717; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=azo+14HeAmGjnMr0Vdj3xinAaL5HZge2DDBa/K8+Coo=;
        b=SWvlq8/IhMTULxtoX5JYaS4hsYEv5YbED4s1SmGloM1LkK7ifjXqnpMTDoEi71lc76
         qj5eMdDrdmNrYzigc77LQXxXMwtOwZEntJsWLTIvh1OoT+GkDNAhbgOSZE2Lt9yBFbee
         KaQKamyc3xH0ayzqP6bLth3Y8FuCHqpKEmGRYkCgLjYhDt3LyUJK28kIn/dkiqAFNi9t
         PpBc5790YZ6b5Wa4l4b2gPatL5ZeMOxqK4EQB5zZZ4z+aBdh6PMvmPtkUa+erpUbvJnd
         qUjknhWxli4QMlimu2c/dtCMWHYsl0SAghQopCagHbfboTKUE5DiPV896ZthtYP8ovyX
         ypFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469917; x=1740074717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azo+14HeAmGjnMr0Vdj3xinAaL5HZge2DDBa/K8+Coo=;
        b=qSG082qBOwWRSfMNCGTlBohCT/TsLQdLcLN96McqSG9u5MfkdoRk+MOGUS/pNAYO8N
         /rBo4NLshLXdrzuDv/dd5MKzplVUHeVHFblY+/78M5+gu9dA9yFONrUHPNCRg+j1W7mK
         MmA1K9MGvXRnha4MEwqdxEcCeWjXyk2bijvf1P9tP2IUgQnUNUd2JeAZ7lRiAGhJdvgv
         PJ3WXbdlG2UPHldIb83aCPgK0etaetF56iOUXXgwuj45c34QHgtgCjYOPTVH7mI/lk+v
         DMxvnUTKb/0kCPBujtU5Na/zzsT20YsDlouv19ITP/ELTEY/mMBW3j3KueyUC9nDrkG/
         s5cA==
X-Forwarded-Encrypted: i=1; AJvYcCXkRvwbd/ocCt9ZjOMqIq1OegxD9rMePvhkbf/ZOivMtipZAhAZbbjpFBJKDcK9bQGBq8/rM4mOG+cBfJHTxu3e@lists.infradead.org
X-Gm-Message-State: AOJu0YzK4O+/s5erFlMUW62pAIEpzLRRiOQtgGf5a40KT7si7eXOgPoi
	E4Ojh5CV0cxLJSxy8So6g3rRSGm74B4K6TaGDVr7GWZ+m07VSKetW9tuQbzjianU1u6MNjFxJgW
	/V33qcbIZJlQNDDac5Rg89g==
X-Google-Smtp-Source: AGHT+IEy5YVI3p9y9PPdbxxSL3+aY42Gx+CIGhUYeoIGQ50w7BVgP/zMrF/otp0RuXTOXMV66ObFIzCa2Ha7BSoLtA==
X-Received: from ilbbs3.prod.google.com ([2002:a05:6e02:2403:b0:3d1:3f2e:4bce])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:170e:b0:3d0:4a82:3f4b with SMTP id e9e14a558f8ab-3d18c2d55d4mr31564925ab.14.1739469916921;
 Thu, 13 Feb 2025 10:05:16 -0800 (PST)
Date: Thu, 13 Feb 2025 18:03:11 +0000
In-Reply-To: <20250213180317.3205285-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250213180317.3205285-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213180317.3205285-3-coltonlewis@google.com>
Subject: [RFC PATCH v3 2/8] arm64: Generate sign macro for sysreg Enums
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_100517_860049_B136380B 
X-CRM114-Status: UNSURE (   8.94  )
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

There's no reason Enums shouldn't be equivalent to UnsignedEnums and
explicitly specify they are unsigned.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/tools/gen-sysreg.awk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 1a2afc9fdd42..a227f73cd31e 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -306,6 +306,7 @@ END {
 	parse_bitdef(reg, field, $2)
 
 	define_field(reg, field, msb, lsb)
+	define_field_sign(reg, field, "false")
 
 	next
 }
-- 
2.48.1.601.g30ceb7b040-goog


