Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB33CD5B16D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0Rtq02u4ALdXbWLdQuFWEAwLztJaqUa3MxILk+qipg=; b=y04e40fRLikLO1oh1tY2XqshkQ
	5I9deZfuYkIkRNrzHVrDVRdFW065WSD9iKr8ydXJ1lue7xddHLDOiiEw7xXdEBnAmGUvj9DJNJ6TR
	l9Jrni0eku7UzjJFzUbMD+BoKY19zIyfsauI/2I0NHUZGhmx8iBVtuW9kkk7PKPy0KuW02M+3jDYQ
	zxC2+QTbDxUH0lG5XyUPvq0jvur1gH6cVBpiCnvj8POKucyg5WsZr0RSI8YD03ZQcavXX4ulOYPC+
	BQlQrj79nmsNUlNyDzsve9x8gsFncOi6PoFzBPPOQnla00XMozFoQN4xTDBToGNxWLc6iTDHM4x9+
	oh67OIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUl3w-00000002RoX-1xUM;
	Sun, 14 Dec 2025 12:18:56 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUl3t-00000002Rnh-1Hor
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 12:18:55 +0000
Date: Sun, 14 Dec 2025 20:18:42 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765714727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e0Rtq02u4ALdXbWLdQuFWEAwLztJaqUa3MxILk+qipg=;
	b=vTv9hKGMVqpUCNXD7Kr50vG8fAIReJ542cYQqEEak4yI4RoUqGG6jT41ppiGt+T6TY+Siy
	I29EoPf4ZlKjjCw9+0OIAIrXHOjTE2b34qjlqACRhKNVzB4k5V2LLkk5mfBVfWmyxChlq0
	64w0lUqBVOVz9sOjOb+t7KVunN6jGIw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leo Yan <leo.yan@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, james.clark@linaro.org,
	mark.rutland@arm.com, james.morse@arm.com
Subject: Re: [RFC PATCH v6 05/35] KVM: arm64: Add KVM_CAP_ARM_SPE capability
Message-ID: <20251214121842.GA16796@debian-dev>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-6-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114160717.163230-6-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_041853_871196_6EAFCFC3 
X-CRM114-Status: UNSURE (   7.30  )
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

On Fri, Nov 14, 2025 at 04:06:46PM +0000, Alexandru Elisei wrote:

[...]

> +void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
> +{
> +	struct arm_spu_entry *entry;
> +
> +	guard(mutex)(&arm_spus_lock);
> +
> +	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return;
> +
> +	entry->arm_spu = arm_spu;
> +	list_add_tail(&entry->link, &arm_spus);
> +
> +	if (list_is_singular(&arm_spus))
> +		static_branch_enable(&kvm_spe_available);

We can simply check if list_empty(&arm_spus) in kvm_supports_spe(), thus
the static key kvm_spe_available is not needed.  Another benefit is this
is consistent with CPU PMU's virt implementation.

Thanks,
Leo

