Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1CBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCS0VDGQ5Q+LD1JHnGrvUSTEtuyy6XbGnrga2vgHiZg=; b=DgUWT5ClIjXQpkmg5+UHSffTw7
	UP7AHLoPziB3HZulGj9ThhWggBaRDHdbxSUakU20Mx1IUI3vxBr/j+m2x8nEVbazYASjG0lC4FuEi
	midJuUFYqT564td664t2iJiWUuCe9bp8xlSotkvMYE7L58z7rwMaZDswjRJWnWPTEi8u5+8TfboTS
	65/Tl9jCXi1rG1zUC+urO9G5VNQlRROnsUCzl6rP/mgg41JP16ucgszU4jsKbO2moZij3e4wMEDnR
	aui+JM/9rYcvxbMrYQIq8Nwk8RuazcuhskZAMybZ+F7NeGEiEsyDxJ2xx/+dGhCKB1tazwMD0t4L4
	aA5IIsfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHwv-0000000GHnj-1oUt;
	Fri, 10 Jan 2025 16:33:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHmy-0000000GDvP-1922
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 16:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BCS0VDGQ5Q+LD1JHnGrvUSTEtuyy6XbGnrga2vgHiZg=; b=CG9qEBUxGfUpRQg7CNIjZjoZpP
	LzwYDQq3tdU5yXm6YLbw1dTP1yEaGd44XXFRFBHivWN3eQ+1fz35sIYeqHPQhDvWiKoYKncOQlZb3
	d7fV9+mrCkHiJ75Ah8f+/fUrud6gu8GlLr5foJKOSIJHzNT3yLNslKONSd0Y0ETI+M6+ewc9YfkN+
	m80QHQ+f+YbvyO0ywgVwGdDwSjKCHrEPjafk/D8RD4IFrWerqR+AtUv1k2OKziMUMNoh8tloQ1mVa
	ZlOiLMptUhVFtWyTxUL0EsG6kxcUw9C27EPa7bHSfa0cOqW8LWPy/sqX9J7COWvwNiyxO7TtH6flR
	XOwmxykA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHmu-00000009q1m-3p7x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:23:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97A48A426A4;
	Fri, 10 Jan 2025 16:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A456C4CEE2;
	Fri, 10 Jan 2025 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736526182;
	bh=+BmdB9emBwpf+gGi963mGVknRd9+wDnLwjWCpQ0Mzm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dl2PAI9IiEHY2aYlDERQmOJYSbxg6pOQL4FEpljVGlaA+uU4GGPdpzdX5HQ8Rg0NA
	 UjiuUAlG3cIGUeDfsJN0DJuL/cAqgerE6Ra9pL9kv6pMSKlRdTb2BbChwSpJVVrsAM
	 Ta842BkpivSBAquFSLJMUNZafNrBjCMBrD8U8ytQl8vwv9DhLeeOPvNGUoFlBh3y1H
	 NLck9Ji1lu9WCZHkK1mplL6LBQTyWxQvKl/4OEomOEMfkyc8qzFJSc9oUrRo+v6U9d
	 8jqzjC42AIMMu2Y6KbycXvb0fkciWnW4ZhNwek+DHtNJqJL/ON7Vd/9f79GyzjE+Ql
	 yaoYSyquO+e5w==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] KVM: arm64: Support FEAT_PMUv3 on Apple hardware
Date: Fri, 10 Jan 2025 16:22:49 +0000
Message-Id: <173651597781.2396497.580300234024062639.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_162309_223068_B325BCB7 
X-CRM114-Status: UNSURE (   9.69  )
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

On Tue, 17 Dec 2024 13:20:30 -0800, Oliver Upton wrote:
> One of the interesting features of some Apple M* parts is an IMPDEF trap
> that routes EL1/EL0 accesses of the PMUv3 registers to EL2. This allows
> a hypervisor to emulate an architectural PMUv3 on top of the IMPDEF PMU
> hardware present in the CPU.
> 
> And if you squint, this _might_ look like a CPU erratum :-)
> 
> [...]

Applied the branch events patch to will (for-next/perf), thanks!

[03/18] drivers/perf: apple_m1: Map generic branch events
        https://git.kernel.org/will/c/4575353d82e2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

