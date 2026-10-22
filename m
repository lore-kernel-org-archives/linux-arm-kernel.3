Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1519606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 01:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y80tyuhk;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HaSnxvQj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8oVHE7uhvQM0uF0tb8qagzI2B8K9hhXgyXmbesBuqk=; b=Y80tyuhkkq/epq/a34IyGqF1SA
	HuINPr/izTGF9wM+vIILHFBhO4gmPnDkWZbdIFuUckYSqxOD8ZOlFLfS8C0Bdcx7WYuLIR+tdz0IW
	nh9Jgm0JLbQ3Ej6WU25v0oZlYmifRtLFzE4zNHFJYY4aTni+V7HnlbGIhbrzyO9a0bSEv7xrtcRLL
	/L0F609NAeyja64usKtSUwC9RqkaRmHFBb99a62YxSzMhfMNV+u8L3GKGUfWgER74vSLm1plVU60O
	zRVXYEqhCXSG64AXPMzBv8KNK+Dyj0cGYErAZn5NdxyR3JP69yZ4wgl8nm90LDPNaVULTKZjYUcFQ
	lV4cBzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJhOM-0000000D8GJ-3voe;
	Thu, 22 Oct 2026 01:14:50 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJhOK-0000000D8FW-0l1A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 01:14:49 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso1950654a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 18:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792631686; cv=none;
        d=google.com; s=arc-20260327;
        b=lN+rls+Ufbd/dkutnxMqKTSW4gUDJgqM//yGc4YJ/iRImwJtzGudRV6VbmeGtKy1BK
         /m8o7jF9iUrLFG1/uXJvzANrh+SQRAdXDU6MGka1YOYbqGskDw4NblexX/lADdgnrYUI
         WIkfaV22uVnDubm6rXz8biZXn2s4kQR7rmJRLKzAM/B/hZBz69jRgZurOkvc+o/NteQi
         B8UUo+tQzbp4qLl9yBINbInLttUExRVHMGxn3Gylf6Gtte6oX12h0ktaoO5f8rB1RhJ3
         DnnCSmDp5IHCcTvmBh+YPGsOnVPFuZcKcJBLqdm4RwGpdi7W9458dFQEMHNDLF6se2rT
         ThUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8oVHE7uhvQM0uF0tb8qagzI2B8K9hhXgyXmbesBuqk=;
        fh=ZQHJHNOUdDpeAwv8sV37Fae869VaGYwLnQtLc9NsW+I=;
        b=dsdBbEoePRSKdf57wRKEwcHoJJqQxnjkodKaOrYLbqA+DLPZo/YIIrgpPpOSoq5Rzc
         0WYNKjKms1S70u4pCvnfJiSjDHR7dq5IsUHKhX1oxlWWlEWm9wu54F/1PvGofer+n3+4
         48p8+fz1WDH4/+4V8B69gzjRrlN/iAdtsqWp9oJb48/0zw2h6u42OGRdP7dDNEAQlyRN
         oj9OPVKlEgELBis3bbmLJeu1dnNRWIIUBNQIr1xS8X1NuzMmVFAkNPRIRQHWYdzfF01n
         hebhp4TtRN2cE/Nh0g8wfQoE4nZMd7iCAns2yolfKhyu0PpekROvNDrapYiJjJpVNDLc
         QYHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792631686; x=1793236486; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8oVHE7uhvQM0uF0tb8qagzI2B8K9hhXgyXmbesBuqk=;
        b=HaSnxvQjBDXRJAt+ucu1+XERJnveEDM2QUydot0EAtwb+U0lD7J8UsSe5x21UoDvBl
         MGt8pj5r6zv/vixqYkAsp7/Wb6aPAunT7PQgBBs2VA+2vVIbwxwR7wY8n2hfjwCBPqOQ
         KllqZ6npkWJFcuDGhDxf4+86+4NlGlnWBhFRUjS8rGwV7yBZfLKgivSPjb/9YC7AXWT/
         qi5Hs3/4dAOVt0k/m6S2GN22WdxAaZ+OO+3FXWZBw9XOBQ1rBjZv0iPvOGPwPZPozKlk
         Ix8dN0RXpn9+eBKCwmka6HT4WwKPAr66U9XwGBcfhsm4JqpiAe2h5Z1rU52q458ucv97
         P5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792631686; x=1793236486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8oVHE7uhvQM0uF0tb8qagzI2B8K9hhXgyXmbesBuqk=;
        b=DzRgoMZ5VEpmyd3cUBmY7Ulv0OlKYL4DZWKCCAt1YotgDWDvwN9NPsXi0NRH/Lp0xj
         BoLkiCxrGRFnjkBEFwnqOcG0/kE2fWRTpG05RqW0q2kchJttTUKOAMXbMTBMYzX4GIIT
         mIuiJGDrsRJNUg7GKtxQ3IBfyWnvFZSZzRuR2MaEffEN5TVatuL2YU2IcNKL7Q5AIRJq
         hpXR7KLOucoxBshCB/LJbkjZdiMwt2IKgXOP73TURFOxNj0j6APd3BlogxdP+TvOSHyf
         c5c4reDL9lM/WO5VbeopCKstw1rlDAO3hZ9zXCVsyO5gW+3JMk+5UctbYRg7hPtFRfqf
         RZ+w==
X-Forwarded-Encrypted: i=1; AKwUvBxn1AukOTbyBEXnfVX0D5zpoZkExoC5Tj9Qxfyu830PVgVRiHrmsJ45KjQhtp8EVGHSf1BdynLffmBQyiSGjIFY@lists.infradead.org
X-Gm-Message-State: AFq9FYLKwnkfQ6wVOMsM7+z95aoyWNs2/V8RGXiW5HAJmOC+eu2mF0s9
	3nHlXFlNVDRIT+3ivoEyzhwy1wdlRqNg3KlzLuDIxigyoYaEj/jQY9rJcKxPWHjIq3toJsLQYqw
	F3tjvMnII6puavWx1QWfRYJBGyvWD+ZAo7UdA/1aJxg==
X-Gm-Gg: AYBFou0r7P5DSS+wMvUzdCAkW791nUwPCQ8CIFHGAlwI8PGn+AQt8OQGWp0ObTZr0Q4
	a+uLvuw6Yv0Wq23cVdvDKB/lyue0Jt+Ot5ktbBbNPc7JP4QPLYMu5SyCG1NRjLmXFsEkS3ZpmoD
	FD09HI2GP3sq5GAh7zZzu4iIReXuZQaTjo/qkaqvOUa5QIkhCxnjoRtCOzyG4Vtw9XZolszoVN9
	HhoyfjXa7UKTFA05BTNcurwoWGZ9cFlydimTIxrHbF8eisGfNNQwchLxwfkMHtHXyX5m4OeYsgp
	y/XRlUbrz+V2bIo43CTvx8GRhXQjOJovSNCXKJKg4o3YXotUVNkTDFWvJetLyAV2ThPafSALTpA
	dRxFWxrN1vFsVTJACzKPEbInBkQN/DXVDYjrIaRiv1Fff3Lnq8CYHCpeal/cyZ1D9YUBiGKuw+E
	Yk/xnXWwP9GNSD
X-Received: by 2002:a05:6402:428d:b0:6b1:b5b8:b696 with SMTP id
 4fb4d7f45d1cf-6b408eba0a5mr2764546a12.23.1792631685748; Wed, 21 Oct 2026
 18:14:45 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021152527.375070-1-tarunsahu@google.com> <20261021152527.375070-3-tarunsahu@google.com>
 <CA+CK2bCnS8wcVDbOymBGeJB6pDUkknOpF22EynbwSV=D5=J4ow@mail.gmail.com> <atlEdhPjlyTPDWmG@google.com>
In-Reply-To: <atlEdhPjlyTPDWmG@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 21:14:09 -0400
X-Gm-Features: AclHuK8ceakYR2BnO2tCnQU3MVfSYSSwRjvSGLmyMHhBXtZBiFnzxvM1Bfsv7Tk
Message-ID: <CA+CK2bAxgtx2gZ-UE2HqwAU8=h9K5RE3xozBs1njgLo1-CaPvA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] liveupdate: Select file handler by name in the
 preserve ioctl
To: David Matlack <dmatlack@google.com>
Cc: Tarun Sahu <tarunsahu@google.com>, Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com, 
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org, 
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com, will@kernel.org, 
	Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_181448_287377_C02F9A72 
X-CRM114-Status: GOOD (  43.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 7:02=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-10-21 01:17 PM, Pasha Tatashin wrote:
> > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsahu@google.c=
om> wrote:
> > >
> > > Currently luo_preserve_file() iterates over luo_file_handler_list and
> > > picks the first registered handler whose .can_preserve() callback
> > > returns true. When a subsystem introduces a new, backwards-incompatib=
le
> > > file handler alongside an existing one for the same file type, usersp=
ace
> > > has no way to choose which handler preserves a file descriptor, nor c=
an
> > > the kernel keep the existing rollback-safe handler as the default whi=
le
> > > allowing callers to opt into the new handler.
> >
> > That is not how it will work. If we are in the .can_preserve() call,
> > it means the user has already decided which file handlers to use. We
> > need to do that before any preservation happens; otherwise, we could
> > run into conflicts on FLBs i.e. FH of different version require
> > different FLBs.
> >
> > Therefore, there should be a luoctl call (i.e via a new ioctl to set
> > compatability) that provides the kernel with the specs file of the
> > target kernel we are updating to, allowing the kernel to select the
> > compatible file handlers. Since .can_preserve() is called when the
> > user is already preserving files, the specification must have already
> > been supplied, or the kernel should fall back to using the default
> > (i.e., latest) file handlers.
>
> I don't think that is the right direction. IMO the kernel should not be
> choosing which file handler to use, userspace should be. If userspace
> gets it wrong and chooses a file handler the next kernel does not
> support, that's on them.
>
> The problem with the kernel making a decision about file handlers is
> then userspace does not know what arguments to pass in. We are adding
> custom per-file handler arguments to PRESERVE_FD and RETRIEVE_FD. If the
> kernel is picking which file handler to use, say for a memfd, then
> userspace doesn't know which arguments to pass in.

It is not the kernel deciding on its own which handler to use; it is
the system admin (or host orchestrator) that configures LUO before the
LU process starts, because the sysadmin knows what kernel we are
rebooting into and the LUO specs of that target kernel. Meanwhile, the
process calling PRESERVE_FD (e.g., a VMM) only knows about its own FDs
and should not have to track target kernel serialization versions.

Also, the PRESERVE_FD and RETRIEVE_FD arguments are uABI tied to the
FD type, not to a specific internal handler version. They are stable,
and we can expand them the same way any ioctl argument is expanded
(via size and flags), without ever shrinking or breaking them. We
should not play the game of providing completely different uABI
argument structs for different versions of a file handler. If a caller
passes a new feature in the uABI args that the currently configured
file handler version does not support, PRESERVE_FD simply returns
-EOPNOTSUPP, just like any other extensible ioctl.

> Sure you could add some method where userspace could query which file
> handlers are active and decide arguments based on that. But it feels
> backwards.
>
> I think a much cleaner solution is that userspace chooses file handler
> during PRESERVE_FD. I would even require it for RETRIEVE_FD so that we
> are guaranteed that the args the user is passing in are being sent to
> the right file handler. Passing to RETRIEVE_FD also opens the door to
> transforming across Live Update (similar to how AWS did LU from Xen to
> KVM as discussed at LPC).

On RETRIEVE_FD, the preserved metadata already identifies what format
was preserved. Validating that the user is passing the right argument
struct only requires checking the compatable string, not selecting a
serialization version on every call. And if we ever want to support
cross-subsystem transformations on retrieve, that is a retrieve-side
conversion capability.

> Regarding FLB conflicts, today we don't support multiple FLBs for the
> same global state, so there is nothing to conflict. Selecting a file
> handler during PRESERVE_FD doesn't change that.
>
> If we ever need to support multiple FLBs for the same global state
> (e.g. an incompatible change to the PCI FLB), we can add an ioctl that
> lets userspace select which FLB to use before preserving any files.
> After that, only file handlers registered with the selected FLB can be
> used to preserve files. PRESERVE_FD with any other file handler fails.
>
> That keeps the FLB decision up front and global, like you want, while
> still letting userspace pick the file handler for each fd. I'd also
> expect this to be rare, since FLB serialized state can use the same
> feature flags as everything else in this series.

Userspace owns FDs, not FLBs. Whether a subsystem uses one FLB, two
FLBs, or no FLB to coordinate state across FDs is internal kernel
plumbing. Exposing an ioctl for userspace to select FLBs leaks kernel
internals into the uABI.

Therefore, I think we should not select FLBs from userspace at all.
FLBs are an internal kernel mechanism for sharing state across FDs;
from userspace, we only preserve FDs, so that is what should be
configurable, and the kernel should resolve the dependencies and pick
the FLB versions accordingly.

Changing one file handler may require changing another file handler
because they share an FLB. We can't have a situation where one VMM
preserves using FH_A and another uses FH_B for the same FD type,
trying to use different FLBs for the same data (since we can't
preserve the same page into KHO twice). More generally, we are
rebooting the host into a single target kernel, so compatibility is a
session-level property, not a per-FD property. If we need an upfront
global ioctl anyway, configuring the target compatibility upfront in
one place is much cleaner than exposing FLBs to userspace and
splitting version selection between a global ioctl and per-FD
PRESERVE_FD calls.

