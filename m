Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074C3CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3Wf62xC5r7GPaaJsND27Q/x6Q226FUTfzXzF0+A+bo=; b=e3VH8FqQ3b54elqeWD8L/YxcF4
	ohMmjarzbMYi94hfpHOz64qXPXqIkGbE1ZtQXTg885BvKjA13oQQK2qGcaMLLub2LojBCqmZ5VfuL
	0rr8tCuNHs1q3F40RNQ1NiiAMdQvZzPXvojfERgDqbyVZ/8WJwvOjp5HQGOttV2zuZv3vte6JR6rK
	RZ1maKLeySCy88PhErp054c3/XCmUccQ5chsJIzYtTsD8OIxelZL9xXMuFhNrlK7pu6hmX90NnBBU
	j3zgyT2OIxXSlPB387wsKt5kx63Hmz3gow9szYTodt87ZCexst/s7gDxJqFHMmqy6ndaTuZQH4nbs
	A8ZR5d7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELQD-00000001ngG-3bjh;
	Wed, 07 Oct 2026 06:46:37 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELQ0-00000001nc0-1ixC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:46:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=U3Wf62xC5r7GPaaJsND27Q/x6Q226FUTfzXzF0+A+bo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355582; v=1; x=1791960382;
 b=ICf/7zlamBQ8MkrqNSJjc31FwQLqOC30gBZi5ABILt94lp3RWOktaxZhU45mHLL6QLp6mKFk
 DzY+VzyJhHzAydwIWZUudkOb0EO7j4+xJBYxA3ORpmN5EpZnH86bidVF84mJqcQARWtYVzpUVGd
 2+ZfGVkdLnXQ2GCN9SR7e6TY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9b2ce8694fef50c9;
	Wed, 07 Oct 2026 03:25:47 +0000
X-Mizu-Trace-ID: 9b2ce8694fef50c9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba40832934so2866e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 20:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzThVLHeq0PaZK0MUqyeM1aRw6pBEHZXMOJ2ek+QXnApNbdDngXV/GMYUJmMNdopERnPMuGDFuQf9Z/jv/CGTAZ@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2ePG4vUQTaMMJc8rEtl0rhDSevw/nPHiHsAGzDC9OK+tTMtWr
	OoH0vy+5FO06ipxBZJ9qHLHFrGXXM2GR3rPfXwIo0KAKuKG66SwQFTFuwyieATlqZTm6KaIV7Go
	GDSCJQz38th2F3cJXsG8D4IC/03SL9mIeJq8xgEbJ
X-Received: by 2002:a05:6512:ba4:b0:5bb:661:7db4 with SMTP id
 2adb3069b0e04-5bcca011cc1mr293031e87.0.1791343542819; Tue, 06 Oct 2026
 20:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260924165329.1684155-1-fuad.tabba@linux.dev> <05714056-53b7-46ce-86eb-fdb7d2afe1fa@arm.com>
In-Reply-To: <05714056-53b7-46ce-86eb-fdb7d2afe1fa@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:25:06 +0200
X-Gmail-Original-Message-ID: <CA+EHjTzde+d7UFowKCeBnpD+8mFPcuUn1m2gLsDm9ViEgPfsQg@mail.gmail.com>
X-Gm-Features: AclHuK9K0Yw9pVF-s7nnkYWE_sJH6hYt2igpYcN7bP3h2C7iBW5sGaqUNJ48r1k
Message-ID: <CA+EHjTzde+d7UFowKCeBnpD+8mFPcuUn1m2gLsDm9ViEgPfsQg@mail.gmail.com>
Subject: Re: [PATCH v4] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Ben Horgan <ben.horgan@arm.com>, Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_234632_582890_03180927 
X-CRM114-Status: UNSURE (   7.35  )
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

Hi Ben,

On Fri, 25 Sep 2026 10:22:00 +0100, Ben Horgan <ben.horgan@arm.com> wrote:
[...]
> IIUC, this patch also covers the mismatched system case where EL3 f/w may set MPAMEN for cpus that
> support MPAM but system_supports_mpam() returns false.

Yes. HAS_MPAM is set per CPU from that CPU's own ID registers, so the
traps depend on neither system_supports_mpam() nor MPAMEN.

Oliver, gentle ping on this one too :)

Thanks,
/fuad

