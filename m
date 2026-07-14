Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54289C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZdDvcbVUY0wf06jzcxyJ90I8hA4T+lqgVYKj078dgw=; b=KCdL694Dz/EesVC2TT7DfIJpeb
	iAlKMVbQ2oaNe0r6hXfiLZKARahFhxw8tvDSIFxYubnHyPrVMozLSdGlwsxJSATXUoo4QltWfedmR
	cnmF+p/vy6wSSr8ZZ/WuRGZWKcec9tIvY+JQnkqmKM49JEKdMLJ4JZZrpTrF4Fthb+QPmADeyleJw
	9xGpyJZZ/9QnWb3On0qoG5+5jcNkwnCAAE8B/6dtwmzmHdfeBzP2BnFdosDzniC5m7c9FwwjNrB4V
	/t+pu+8CYvpI/TnkMxRBNGbxU6A+WEka+hAuR1FI8donN7U/FJJmytc7O4Fw4emvoOWMpI7ofIClH
	6ZUGCTeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjf8k-0000000CY6Q-2agO;
	Tue, 14 Jul 2026 15:33:49 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjf8h-0000000CY66-2FW2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 15:33:45 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpZtIaexL4wGudvlCHqF7Qhi4TUj8b17QCJoVDebbOzz6ZUXiSZjGnNknAl8kPa2Fy6rdMhOV4gi0cE8351KaYi@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784043220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZdDvcbVUY0wf06jzcxyJ90I8hA4T+lqgVYKj078dgw=;
	b=QVRRdzyMW6SOyr9FxDjXhEkxj3DXmBT9zxTlCbj7W7m2Abkj2IoJOqNQllk+m1oDd+/v2H
	781kKlrFRcoQITxVDcGy3ymhSDOovpsaA0gc4lPOSnAjJfe2OhGE60+fr/nCTPLh4i3H4V
	6xwYXnWlyZz+mVFShn8xmKjPJtU2fMw=
X-Gm-Message-State: AOJu0Yx0BOHiD32l/8jUosdRLChZT/JFkZAd2QgXZ2DiLjyNqyZe+a//
	6f5zAp+cCwwdRfaMDcNd4il7W1lHd240ON/zZQMUkNrJvhMW+YxHUpYHbQKnqoaf++MrgYrzogu
	JOdc+rcRffLisGfbfKceUfY/8SQ/NUOTuJlwA7GKx
X-Received: by 2002:a05:622a:4d:b0:51c:ba4f:9d19 with SMTP id
 d75a77b69052e-51d7bd752e0mr15356061cf.19.1784043211209; Tue, 14 Jul 2026
 08:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260714101601.4142645-1-fuad.tabba@linux.dev>
 <20260714101601.4142645-3-fuad.tabba@linux.dev> <86ik6hoayl.wl-maz@kernel.org>
In-Reply-To: <86ik6hoayl.wl-maz@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 16:32:54 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxtOhC=f0K=j-ka5A0nPtU0S_5vbnZcVhTOViHX6WMi=Q@mail.gmail.com>
X-Gm-Features: AUfX_mwAx_QJ703w6ns4jZBt5m8oNM38s2iIEmAgXjvj9wCMZI3UVlbYVuuMlt4
Message-ID: <CA+EHjTxtOhC=f0K=j-ka5A0nPtU0S_5vbnZcVhTOViHX6WMi=Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Hyunwoo Kim <imv4bel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_083344_127428_0184D533 
X-CRM114-Status: GOOD (  14.43  )
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

On Tue, 14 Jul 2026 at 16:19, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 14 Jul 2026 11:15:55 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > The vcpu_{read,write}_sys_reg() accessors are only valid on a VHE host,
> > so helpers built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be()
> > cannot be shared with hyp code. exception.c already wraps them in local
> > helpers that pick the host- or hyp-side accessor via has_vhe().
> >
> > Rename the host-only implementations to __vcpu_{read,write}_sysreg_vhe()
>
> I'm a bit puzzled by this. There is nothing that makes these functions
> VHE-specific. Look at where they are called from: plenty of non-VHE
> uses. These helpers are the canonical accessors for any system
> register, and they don't cater for any particular mode.

I might have misunderstood what Oliver asked me to do here [1]:
> Can you instead name the wrappers vcpu_{read,write}_sys_reg() and rename
> the current implementations, like __vcpu_{read,write}_sysreg_vhe()?

Since they're only used and gated by has_vhe(), they're vhe-specific?

Cheers,
/fuad

[1] https://lore.kernel.org/all/alWDI7uj9YFedXET@kernel.org/


>
>         m.
>
> --
> Without deviation from the norm, progress is not possible.

