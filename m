Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20BECC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZU0ITcIU0RDlLux+WU+QTQ4pBSZPCHTEfxzBG0C718=; b=1hqLupnJKo9viSRmVm3kfIsKaO
	p0+gDR5A7A/doeOfzZdCM/PHaC6sjWraT7QRh5zTpJSZxgWyYQpdGcz+RXOpRAuDRx0Sg/8UXALMr
	al2n/pcsJBdN0ChRTGJ/KawD8KNbKydwF1fuERVEWrrcRkWjaLyY1lO5OHhAdWjGCrLFiycoTZqUR
	4gg/RHYB2SRmmne6emL9tktmVhTcAj0QbFADpwxrgwdTtKbldphIyjVc1C9pFQjDUEQBCVqUDeeo9
	OISIDV5n7vpvJ04UV5PbdEUP17ffAy9ykdE45kXYlo9Ulm6bYGvmJ0s0/O0OaYitPYH5zvjdFVrTJ
	EctNzjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHchA-00000002GRa-2xDR;
	Fri, 16 Oct 2026 07:49:40 +0000
Received: from out-195.mta0.migadu.com ([2001:41d0:1004:224b::c3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHch7-00000002GRA-3JLz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:49:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=WZU0ITcIU0RDlLux+WU+QTQ4pBSZPCHTEfxzBG0C718=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792136975; v=1; x=1792741775;
 b=Z5v09qg6T7waZcENXLM9+Y6P+8KwwuKNCHaTp/BKjgjpTthfbtKa1oa0f3ekPc0dUfmBjRc7
 oinmZNe4du3g356X/N3HZhRTt0F6wmKAbxfY4uVX/aW+5VzZhfwR73S+qTHMYdfOUWhR8f5o6lT
 oGRkeNxoCF5tAr/L5eK7gKEM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a5e8366da7d9bfb1;
	Fri, 16 Oct 2026 07:49:35 +0000
X-Mizu-Trace-ID: a5e8366da7d9bfb1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso3306e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 00:49:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByNp447PJ8xBWuUXsJi5idW9DNc0KU2gHx00qtmGiFVD9Z/duRcsTMNQODHuwMbjOlqweXOzhNZFNMOoLEZhAZx@lists.infradead.org
X-Gm-Message-State: AFq9FYJtZZNAwGaJaTnBHZPKPz5hfbFeypG2VgpFMpByhyDb0neockC4
	vHzu31HXj1ODec/DUx6i3lk4QtVsUXENIdvixU2i7SRWiKAh9PLwU6+O3XcZksqN6MKLuW5MQJD
	iuOPXg2i6VFKTMLTtqTsZJHbFIytWjqX8PZna3iQH
X-Received: by 2002:a05:6512:b95:b0:5bc:b2ec:eaee with SMTP id
 2adb3069b0e04-5be493c4cb3mr93309e87.11.1792136969950; Fri, 16 Oct 2026
 00:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261015173605.1072963-1-maz@kernel.org>
In-Reply-To: <20261015173605.1072963-1-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 16 Oct 2026 08:48:53 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzdN53MvWmvk+KcD2XEthjpgSivGkYAsc7r8JpEb=02LQ@mail.gmail.com>
X-Gm-Features: AclHuK8kpSMVjBqTkfq4Ie2CF_wEvKZrjX3oALmxM5tl73nYKwHuhkhXFGvtnPw
Message-ID: <CA+EHjTzdN53MvWmvk+KcD2XEthjpgSivGkYAsc7r8JpEb=02LQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: arm64: Cleanup the HCR_xyz macros
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_004937_971490_5E2DB0F6 
X-CRM114-Status: UNSURE (   8.46  )
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

Hi Marc,

On Thu, 15 Oct 2026 18:36:03 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Patches on top of kvmarm-7.4.

On kvmarm-7.4, every object under arch/arm64/kvm and arch/arm64/kernel
builds to the same code and data with and without the series (debug
info aside). Protected and non-protected guests boot in pKVM.

While testing it I found an older bug on a line patch 1 converts:
HCR_BSU_IS has been the unshifted enum value since the HCR_EL2 sysreg
layout went in, so guests run with BSU at 0b00. I'll send a fix
separately.

For the series:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

