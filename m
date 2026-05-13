Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66219CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87q79VBUBAoV03ks74/SeOz/4GOZSstUrCW7DZkds1c=; b=iBz93m3BE8J3Y/J5r+nGYjkbga
	bqciQ/IMcf2452utlMliOJOUMiZQs1BF3ZNfiBFzMl4/tEXIF673C29s0LRwchPiH1qzIGLDTXYwT
	LkTnmoPt5vL7N6NdG7N0nmzC4YmVsPxXkWYjxSPMVrKjhio1bHNwtijPKDdsPmOV1xyOwooRAPrSa
	AinAS5WFYkcA0c0jtIX1s8nrgUapH9KI7KRs8A2ZWwrJAwHN/FnZOCtUdyBIXOjihOLakmpMtIWro
	W/BCNRXzaCzypDEy6JjJJIB0t46QqTlaBXjEqwnnwi0SGZLws2eFwRjC9UEpnY0C4zh7CVPmQDjmc
	uzjNbdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6vu-00000002CiX-0C3K;
	Wed, 13 May 2026 10:35:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6vs-00000002Chf-0QrC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:35:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A613B43995;
	Wed, 13 May 2026 10:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4AAC2BCB8;
	Wed, 13 May 2026 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778668515;
	bh=wrLs4XjI3t/ijO5RtVIO8F98O7lgFKIA/HaZF6uxGvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1/SwdJJa09YLPCFAC2P5o1yPWweFkqpaHnJKKWpxS4jTyjiuYuowiWV+DjXnJRQY
	 d8fW7n7Hl+EeMTIy1w9PR+CEFTJ1/clY7CakIoEyadMYojOZPfwQLKJQKP/iZiQiYe
	 buhnfzR1vxZcI2oUhNB1f3bho5laJ53qJysSVZ9w=
Date: Wed, 13 May 2026 11:59:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v4 2/2] coco: guest: arm64: Drop dummy RSI platform
 device stub
Message-ID: <2026051316-confidant-turtle-1e84@gregkh>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
 <20260427061615.905018-3-aneesh.kumar@kernel.org>
 <agM7VmoQ--ylUmyM@arm.com>
 <yq5a7bp7u77f.fsf@kernel.org>
 <2026051352-albatross-contents-7113@gregkh>
 <yq5a4ikbu1w2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5a4ikbu1w2.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_033516_181683_DC67C74A 
X-CRM114-Status: GOOD (  28.79  )
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

On Wed, May 13, 2026 at 02:23:01PM +0530, Aneesh Kumar K.V wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Wed, May 13, 2026 at 12:28:12PM +0530, Aneesh Kumar K.V wrote:
> >> Catalin Marinas <catalin.marinas@arm.com> writes:
> >> 
> >> > + Suzuki again
> >> >
> >> > On Mon, Apr 27, 2026 at 11:46:15AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> >> The SMCCC firmware driver now creates the `arm-smccc` platform device
> >> >> and also creates the CCA auxiliary devices once the RSI ABI is
> >> >> discovered. This makes the arch-specific arm64_create_dummy_rsi_dev()
> >> >> helper redundant. Remove the arm-cca-dev platform device registration
> >> >> and let the SMCCC probe manage the RSI device.
> >> >> 
> >> >> systemd match on platform:arm-cca-dev for confidential vm detection [1].
> >> >> Losing the platform device registration can break that. Keeping this
> >> >> removal in its own change makes it easy to revert if that regression
> >> >> blocks the rollout.
> >> >> 
> >> >> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
> >> >
> >> > I wouldn't merge this now given that systemd checks this file. Could we
> >> > have a symbolic link instead for some time until systemd eventually gets
> >> > updated (years?).
> >> >
> >> 
> >> I’ll add this in the next revision.
> >> 
> >> static int create_rsi_compat_link(struct device *target_dev)
> >> {
> >> 	struct kobject *platform_kobj;
> >> 	/*
> >> 	 * target_dev is:
> >> 	 * /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
> >> 	 * Create compat link /sys/devices/platform/arm-cca-dev
> >> 	 */
> >> 	platform_kobj = target_dev->kobj.parent->parent;
> >
> > What?  That is crazy, you don't know that is always going to be ok.
> >
> >> 	return sysfs_create_link(platform_kobj,
> >> 				 &target_dev->kobj,
> >> 				 "arm-cca-dev");
> >
> > No, don't do that, if a driver calls a sysfs* function, something is
> > almost always wrong.  Don't be making random sysfs symlinks please.
> >
> 
> Sure, but could you explain why this is wrong? Below is the full version
> of the updated patch.
> 
> coco: guest: arm64 Replace RSI platform device with compat symlink
> 
> The SMCCC firmware driver now creates the arm-smccc platform device and
> registers the RSI device as an auxiliary device once the RSI ABI has been
> discovered. This makes the arch-specific arm64 arm-cca-dev platform device
> redundant.
> 
> Remove the arm64 platform device stub and let the SMCCC core manage RSI
> device creation.
> 
> This changes the real device location from the old platform device path to:
> 
>   /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
> 
> Keep userspace compatibility by creating a sysfs symlink at the old path:
> 
>   /sys/devices/platform/arm-cca-dev
> 
> A Debian Code Search check found systemd matching on the old
> platform:arm-cca-dev device path for confidential VM detection. No other
> userspace dependency on the old platform device path was found, but keeping
> the compatibility symlink avoids breaking existing systemd-based detection
> [1].
> 
> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

Don't attempt to put symlinks between random devices in sysfs, that way
lies madness and you will never get anything fixed.

Just fix userspace, it shouldn't have hard-coded a device path in the
first place, and you are thinking it would now use a different
hard-coded device path?  Please do this properly.

Again, there should never be any hard-coded device paths, they are free
to move around and be renamed at any time.  Use the correct apis instead
(walking all bus devices, looking at userspace attributes of classes,
etc.)

So your patch is ok, if you remove the symlink stuff.

thanks,

greg k-h

