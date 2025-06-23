Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F775C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZQ09S5HUXQL8QzEMqvPTcx0P4EQYBwyl6nfwHAEjAk=; b=4lkHZiwrEtXpaGfHoDhvQXyrX5
	90ROzUv4VsqsTnnVVZENtEvuiuk8ft/bUpM6NJA/TxLyzA17MNn/wCswTKbPsJFyCgkCDxsQhEMGd
	RHBbrTTRzHz7lOLSFgX4KSlxM3cOW4uzmaA2lPSlHQ2xeGbHAd3BDaDs8y79neopKHPE+C+2rTNYh
	MoUJiQ50FerHUmOOrUfChDPQyIMtoplgK0DbEMhTvXpjDJm+Mr4/7VfgHHsxr2FEAOB07zRvoY1NL
	6LZ3h0PSnq/fbEs8ltg42bv8nKj4lOwJZRwBk/yQaka+7Y0oouAXc1zbBd88QgOwGLpmsEvMyXNyr
	T+JKD5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdZl-00000002Bw0-06qW;
	Mon, 23 Jun 2025 09:34:53 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdRJ-00000002AYy-3lf0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:26:12 +0000
Date: Mon, 23 Jun 2025 02:25:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750670765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tZQ09S5HUXQL8QzEMqvPTcx0P4EQYBwyl6nfwHAEjAk=;
	b=rA/N5fxMhzQdApW5Xv7M+X1a139TwAKG9UaWY2mpQpeEc/c+dIet3ZFxIS0LV2rCru/SXL
	fzQKIqSKK8k7HU15zCSL2sZA6TYN2LfAYSGv33CQx46tpWptwXBDeTV/rQXBr9Pu/6ZhS7
	kS1R51UD95Se6iuE+blTrVPTU1UHYjc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Ananta <rananta@google.com>,
	Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] KVM: arm64: Introduce attribute to control
 GICD_TYPER2.nASSGIcap
Message-ID: <aFkdofSolis53JgO@linux.dev>
References: <20250613155239.2029059-1-rananta@google.com>
 <20250613155239.2029059-4-rananta@google.com>
 <87frftfpg7.wl-maz@kernel.org>
 <aFkTDmj9u1ERnvHO@linux.dev>
 <868qliddzt.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qliddzt.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_022610_150726_13FEB499 
X-CRM114-Status: GOOD (  28.74  )
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

On Mon, Jun 23, 2025 at 10:05:42AM +0100, Marc Zyngier wrote:
> On Mon, 23 Jun 2025 09:40:46 +0100,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > On Sat, Jun 21, 2025 at 09:50:48AM +0100, Marc Zyngier wrote:
> > > On Fri, 13 Jun 2025 16:52:37 +0100, Raghavendra Rao Ananta <rananta@google.com> wrote:
> > > > @@ -683,8 +714,14 @@ static int vgic_v3_has_attr(struct kvm_device *dev,
> > > >  			return 0;
> > > >  		case KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES:
> > > >  			return 0;
> > > > +		default:
> > > > +			return -ENXIO;
> > > >  		}
> > > > +	case KVM_DEV_ARM_VGIC_GRP_FEATURES:
> > > > +		return attr->attr != KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap ?
> > > > +		       -ENXIO : 0;
> > > 
> > > Do we really want to advertise KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap even
> > > when we don't have GICv4.1? This seems rather odd. My take on this API
> > > is that this should report whether the feature is configurable, making
> > > it backward compatible with older versions of KVM.
> > 
> > So this was because of me, as I wanted nASSGIcap to behave exactly like
> > the ID registers. I do think exposing the capability unconditionally is
> > useful, as otherwise there's no way to definitively say whether or not
> > the underlying platform supports GICv4.1.
> > 
> > KVM_HAS_DEVICE_ATTR can't be used alone for probing since old kernels
> > use GICv4.1 but don't expose the attribute.
> > 
> > Does that make sense?
> 
> My own reasoning is that if we expose the capability, userspace is
> able to use it and rely on it to take effect (VPE allocation error
> notwithstanding). This is not the case with this approach, and that's
> at odds with the other attributes.
> 
> But taking a step back: if we want to control the nASSGIcap bit, why
> don't we allow writing to GICD_TYPER2 from userspace? This does
> matches your view that we treat it as an ID register (GICD_TYPER2
> matches this definition if you squint hard enough). It also avoids
> adding new UAPI with unusual semantics.

This approach would bring its own set of complications. At least right
now we allocate vPEs at vgic_init() but prevent register accesses prior
to initialization. If we want to bake this thing into GICD_TYPER2
directly we either need to relax this register to be accessed before
init or defer the vPE allocation later on.

I'm worried that the latter approach is gonna be a mess, and the
attribute was done to avoid a one-off accessor in the VGIC state. But if
you'd like to see it done that way then that's OK with me.

Thanks,
Oliver

