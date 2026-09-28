Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A60CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCYMxlYVrU0ZRUnBfl0gDlG7/5tTg9Tcf8QxOVlz+MI=; b=KYe79OqEANY/S0++nU7zg8Wvjj
	79Vodfc2hwwYu6Z24rFCmFZaKFp5V09wigJndtDe2zSyWmowF0VkDQWy2BpVjqOMhyoC8B/ZlUb+6
	CZHXE2wtghXtMBQBSZgd2ogTHNSB+bbKy3wR4BrcTFmF6D2hHnZBbQc42iqFXzK781bd6f6tYolDm
	OWMWqbgGZ6E8CJ3yR1sTslYwFpDiSVjoe4bxm/Y7Z0OPXSay9J7u2gBmA8o/ZAHWKBew7njLR16lY
	wVXHu1poxcDl/sm3gGA2GFkV99x6IstA/J72ssSQe2W4J0pM2vALSX7D0p+cbpqxFWTM1MPC0GQEJ
	yHgFc5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDye-00000000ytL-4B1t;
	Mon, 28 Sep 2026 16:13:16 +0000
Received: from out-98.mta1.migadu.com ([2001:41d0:203:375::62] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDyc-00000000ysl-2IWs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:13:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VCYMxlYVrU0ZRUnBfl0gDlG7/5tTg9Tcf8QxOVlz+MI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790611992; v=1; x=1791216792;
 b=lOWNlF49DgLMiQP6FVUexHLquA93qgRmOln+VgM3ThgoENZebP/kimKLbr/+bmD4zuMjU3m/
 N0mbM5+KAaRJVZ223ehMM7iBn6914TgdDTjK5gF5WFJIbfOEIMGKPfKfhbSOtg1d5BwTGEKaOuD
 iEsGsicbsUmFfK3R0RmvHXYg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3ac29f528f0360cb;
	Mon, 28 Sep 2026 16:13:12 +0000
X-Mizu-Trace-ID: 3ac29f528f0360cb
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b8e81e2a0bso12707e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:13:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwoU+5KcpXbC+W3YUpV8+r7i2d339OlKlc68vEAKOS6jlrbprGJlsXc63RB5n69FFCWy5o+bpYoDbdytq/9v34C@lists.infradead.org
X-Gm-Message-State: AFq9FYKI0sF2n9HplRh5iNkbE/QvvFaxkuvdacKSIEQvUmnH9nJd8YiM
	Z0XKnAhGqG1+8XxNMQnBMmYrHL5dSHTZ9b0B2BrvYJ47ZTB4z+9xFa2huek+4n3Mmcv5YdR/qZ3
	01AOlDPaDMbaqYe9p8xjVtmTTpOLmGMuGG16C8nDD
X-Received: by 2002:ac2:4650:0:b0:5b8:f142:cf3 with SMTP id
 2adb3069b0e04-5b8f1420dc7mr105362e87.11.1790611989788; Mon, 28 Sep 2026
 09:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev> <86cxtx4bbp.wl-maz@kernel.org>
In-Reply-To: <86cxtx4bbp.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 17:12:33 +0100
X-Gmail-Original-Message-ID: <CA+EHjTymQqcARDNHHDvkjFvEuf1C78NsvPJwcnaH4bOu-m9tQw@mail.gmail.com>
X-Gm-Features: AclHuK-OWctusFN_TR3hIpHHx8_H0y3i7Oz0Ee1onONuAo5w9l_i54qFA-ucEZA
Message-ID: <CA+EHjTymQqcARDNHHDvkjFvEuf1C78NsvPJwcnaH4bOu-m9tQw@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] KVM: arm64: Nested stage-2 walk error handling
 and other small fixes
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, Karl Mehltretter <kmehltretter@gmail.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_091315_249586_E12E9A74 
X-CRM114-Status: GOOD (  14.72  )
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

Hi Marc,

On Mon, 28 Sep 2026 16:58:34 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > retiring with the fault in PAR_EL1. Reporting the unreadable descriptor
> > as a Data Abort instead, for the stage-1 walks too, is a separate
> > change I'll send later.
>
> Why later?

The loop fix is small and stops the hang. The Data Abort change
replaces the SEA-in-PAR_EL1 reporting at the four walk sites in at.c
and nested.c and has to stop the PC advancing past the AT. I haven't
done it yet, and I didn't want to hold the hang fix for it.

[...]
> My definition of a series is "an ordered set of changes that have a
> common theme or form a progression towards a precise goal". This is
> not a series, but a patch dump.
> </rant>

Sorry about that. When you asked me a couple of weeks ago to group
related patches rather than post them one at a time, I took it past
"related" and put everything small I had into one series.

I'll split it. The nested AT walk fixes with their selftest as one
series, with the Data Abort change in it if you'd rather have them
together, the SMCCC filter WARN on its own with Oliver's change, the
three documentation fixes as one series, and the two selftest leaks as
one.

Sorry again :)

Cheers,
/fuad

