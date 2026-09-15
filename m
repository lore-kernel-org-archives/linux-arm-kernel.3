Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9C6C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGS9ZAELcTkTuNTgyKM0hpB2EjXGms+wAcOSiSmEqTU=; b=JRPUgtH/IQ/luaH8XeevtJAead
	RTJLfQYw+zERWqwLJWWZ4RVzKGQ7D5YwhhChDjjc3VCjuVCvFlJ4p+cNUspmjkZao4zDOBaIrU6gh
	DI/Z7h6PVNmhIDcRZlf9919dAkc5eXi/gwPzZvQuvaRgu91P7/9FbUhBDXFeAqvRqdY8CxNVTATUI
	SEorncpahfPg5D0y/1uDNyu9Xw2gTdFuW2yqscoECi5Ssi3pu2/em8XsKy5U3shyd/TxDW1oQ/jYf
	2v8LDXjWfjuErjXYwZ0CqMs5miJ/cpKhhQn4oigN4Y64I0oOMMvack/maudY25olTQgq7SmxBFRqQ
	ecgWRaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q1t-00000005qSc-1foT;
	Tue, 15 Sep 2026 10:04:45 +0000
Received: from out-115.mta0.migadu.com ([2001:41d0:1004:224b::73] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q1q-00000005qS9-3afk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:04:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=eGS9ZAELcTkTuNTgyKM0hpB2EjXGms+wAcOSiSmEqTU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789466680; v=1; x=1790071480;
 b=RUcrgGR5/w7lDRvia7/zzut2KnW5AR2QO+VucAT7YrxEz86l2Refpz2PGrE3CNMxSsL39tjO
 wMr2vLZP8ortLPbC0Xlznx8tBsJhwUGnvjghV9sbQB8cT9RblzfpN79LA3rwCbw+Lp2lZWxIWSa
 +eS7Z18TCYDwTEJ0EYx6z6SQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b79cd35a1256c782;
	Tue, 15 Sep 2026 10:04:40 +0000
X-Mizu-Trace-ID: b79cd35a1256c782
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so4102e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:04:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwDN4VHOmgbT0gvuwpVh25MapIYcUQsfbSQLNsC8GjQFcnxKGRDmF48OndJZpSp3eaoXlWA95aqt2+5Fuz26a/@lists.infradead.org
X-Gm-Message-State: AFuF++kGc6NvfDTcLNOyHVeAUz5PhRAYJdKyN68ALQVEN1jl8b5I0lwg
	BweaTUgy/8q5vDfhiX5q+ZucvaCQoQRjBr8oPXxOdiUB1px+tIEzJh+HAm265bjKNVV2yV1rvrI
	f4CRv4WQ+nEkRIWXqk5QjoVE/jdygKOxgVVH+lcWH
X-Received: by 2002:a05:6512:2251:b0:5b6:bcb:26c4 with SMTP id
 2adb3069b0e04-5b8b2d57c88mr125735e87.16.1789466675623; Tue, 15 Sep 2026
 03:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
 <20260915070418.3209779-2-fuad.tabba@linux.dev> <aqj1GKamuBraiub0@google.com>
In-Reply-To: <aqj1GKamuBraiub0@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 11:03:59 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxujn0EwJM49FaAuXjbyTWmvgzk89orO+8WLSn63u8WtQ@mail.gmail.com>
X-Gm-Features: AcwNN1VTCK-3nqI9-Q-RK2JyK41FQVwFdhMt-rabRiLORS8vzlwPjlPh4CVwNWw
Message-ID: <CA+EHjTxujn0EwJM49FaAuXjbyTWmvgzk89orO+8WLSn63u8WtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: Validate the host vCPU's VM before
 reading it under pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_030443_033476_F0306AD2 
X-CRM114-Status: UNSURE (   7.86  )
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

On Tue, 15 Sept 2026 at 08:34, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> Beside those nits:
>
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

Nits addressed, and I'll respin this as part of a consolidated series,
as requested by Marc.

Thanks for the review!
/fuad

> --
> Vincent

