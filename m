Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U8ukKnlp;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DJJr1fwO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8EgRcbuDfKORZQpY0utOTTMffHlpWo5to8q3utLizKM=; b=U8ukKnlpfnSwZptAQe7oJec+bT
	8eugWeH3kXgZ3NLY3WZiylZAuP8OeJi59exgkS+Kg/7+gG9uOuzrSmMQq2KxFZ4bcGTPQyeWtyPxA
	6BQe68vQnAB8txcoQsYSttk1ho9KR9oonIiZ8+weHxiD0pl+SYOUzf+VBYYoKvfYcDfvtn5TynF61
	DvqwOegSEDsmArt8iAj9NmJx5TEVF5+AMGSaH/+vA4Osxc/a/ycezr/ZpRqZhYrs5j3EaKXzUX/xY
	ZGVoYTQ5dr5ZoLO3FtUqAMkEYrzmYC5NqGrkwrc4vPVnXlm6orwEoA8eNeFThgGcD1wds4x2UsFLT
	Cy071zgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJx2Z-0000000EfO9-3nQ5;
	Thu, 22 Oct 2026 17:57:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJx2W-0000000EfMJ-3Nd5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:57:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e98798cbddso132645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792691840; x=1793296640; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8EgRcbuDfKORZQpY0utOTTMffHlpWo5to8q3utLizKM=;
        b=DJJr1fwOCaamsq2q4jgfPbYaguA5IR0Y4vkgyulG0hnynffRpvtjOJ1jJesstNXKRK
         ntmDffiCDhXJnpSCNnQInRGuwO+EthyEKXYeDXPPehecghx1MseyJ2ho+F4OYklGiBVG
         u51qSvqDD7JvAiMW+yP4QzosnYYJGRrT01IU3ysH+smd2dy56Tq++WRQi6XM8hy/LTsB
         t00mgbgTqvoLwZfXKXv4m3O6zwkc8NENjtynh2bs08ljim0bMNkpf6NUtwPkA0B4oVb5
         TdPMA1Ku5WnGWWwR+vaUwIDHPzf/IMaKaToxORENCqJ4v29hwlHPZKYunslv/RtGYWcQ
         tgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691840; x=1793296640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8EgRcbuDfKORZQpY0utOTTMffHlpWo5to8q3utLizKM=;
        b=wenA+9XJe/5G8kRFTvKJVRBPp4GsL6Dwh3laCfEXSLkKQU6lFsvOuqxtZnJptYgCza
         M6OufgpLMwvotoADloTXW7cKxPIJD0JLuyScxOYjnVLTV8JyEqHekg7XWi04iqfaxB3U
         JjKZmY0MGKOtbFYTJIv8SnCY0MrvmPqv9z2Ws2YvxLsThLAagdYePjQ7lkAWjhhlpWYP
         +JN/pvcSDVaeqLAqB8HyxwSE5hC6rqCrRzp+oXhhTkVTIccZVa64OyjcpDBwA5gpzpxI
         3LgBfCKNIc3iI5OTgq+6cP3fAdvkDSuTNl2jJo8xnPz6RueivcvZLLUxqnaZ2CgYEny6
         yz+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFzJ+vKKJYbxWjhqKBGdwox2I6W0gezfNNsehbz97fkm2d8jWXWx/VKF8P9BSWrQC45vjlrPf7kyy9PFNChnmX@lists.infradead.org
X-Gm-Message-State: AFq9FYKhdP+KtSK85CFpTfMAUs8UKPK6vRNl3GfZ719w6ZIBcFwRxj4a
	/2ilDGNJkAN2hFzu+Jp6yHxJ9zzixAlCPVbzCj2JO7m4ZWEh91vp1Fpg5vDjZGs7+Q==
X-Gm-Gg: AYBFou0DzEKpr2LRDuAJuQeEuXTJzIagEGgZKafGf2sQ55EGfQmKXQZjmmwDgGluvSY
	ahRVwHu7HRMiUKlhLymuhMGBqY95MRR5ihe0gm/L//OxqulJRmWi+jnX4UHJJaga+7XH6+iCjeQ
	zk8q0UYx8k1Y3hfpTvUDlHCVZ1gMhe2WJpd9l0Lk3bPwQr52w0e4en/7laWgUudQpAYvhlkVlap
	aMpri78K4JXzsU8u12wOns1fWoKhx+0AfJZ0cd5BLjOP5PckXR1Tcua8lqFvhAZ+3lGCHwrc2U0
	ly7YBT+4pfIgnql6O0CamWj8f0YIlxPW/B6uw7e9DfKN9xVlXO5ED+48XitowT4tkJiYg1NK/oj
	fV9Rfuu7kArZFJX1LVXsy+Ka9dtCFG+w6BCRGWQrWWFiiyK8O+p3t7xaFawgKXdZfcBAZYZ5cvr
	JBNPlwLdW8R5dBe8WwODlYqzt4L66xBWdD95iI/dRzJrABW/TG2Mhoeggry57srFJa1guQR3Kax
	QgHdWjJwbvniDnUQ4OMtxKjUgSeSGgaOAlNhaYFaLCsBe3/9XV4tcshgdbobRcLviPez386/Di9
	+PzKBo1YXbLIc3++TwB2Mg==
X-Received: by 2002:a17:903:19ef:b0:2e9:61bf:6591 with SMTP id d9443c01a7336-2ea7c33be70mr1491705ad.45.1792691839016;
        Thu, 22 Oct 2026 10:57:19 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b34dadbsm1687675ad.26.2026.10.22.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:57:18 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:57:15 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Tarun Sahu <tarunsahu@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de,
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com,
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org,
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com,
	will@kernel.org, Alexander Graf <graf@amazon.com>,
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/4] liveupdate: Select file handler by name in
 the preserve ioctl
Message-ID: <atpOe-blcgW-uDd4@google.com>
References: <20261021152527.375070-1-tarunsahu@google.com>
 <20261021152527.375070-3-tarunsahu@google.com>
 <CA+CK2bCnS8wcVDbOymBGeJB6pDUkknOpF22EynbwSV=D5=J4ow@mail.gmail.com>
 <atlEdhPjlyTPDWmG@google.com>
 <CA+CK2bAxgtx2gZ-UE2HqwAU8=h9K5RE3xozBs1njgLo1-CaPvA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bAxgtx2gZ-UE2HqwAU8=h9K5RE3xozBs1njgLo1-CaPvA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_105720_843352_CC1C75A1 
X-CRM114-Status: GOOD (  39.31  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-21 09:14 PM, Pasha Tatashin wrote:
> On Wed, Oct 21, 2026 at 7:02 PM David Matlack <dmatlack@google.com> wrote:
> >
> > On 2026-10-21 01:17 PM, Pasha Tatashin wrote:
> > > On Wed, Oct 21, 2026 at 11:25 AM Tarun Sahu <tarunsahu@google.com> wrote:
> > > >
> > > > Currently luo_preserve_file() iterates over luo_file_handler_list and
> > > > picks the first registered handler whose .can_preserve() callback
> > > > returns true. When a subsystem introduces a new, backwards-incompatible
> > > > file handler alongside an existing one for the same file type, userspace
> > > > has no way to choose which handler preserves a file descriptor, nor can
> > > > the kernel keep the existing rollback-safe handler as the default while
> > > > allowing callers to opt into the new handler.
> > >
> > > That is not how it will work. If we are in the .can_preserve() call,
> > > it means the user has already decided which file handlers to use. We
> > > need to do that before any preservation happens; otherwise, we could
> > > run into conflicts on FLBs i.e. FH of different version require
> > > different FLBs.
> > >
> > > Therefore, there should be a luoctl call (i.e via a new ioctl to set
> > > compatability) that provides the kernel with the specs file of the
> > > target kernel we are updating to, allowing the kernel to select the
> > > compatible file handlers. Since .can_preserve() is called when the
> > > user is already preserving files, the specification must have already
> > > been supplied, or the kernel should fall back to using the default
> > > (i.e., latest) file handlers.
> >
> > I don't think that is the right direction. IMO the kernel should not be
> > choosing which file handler to use, userspace should be. If userspace
> > gets it wrong and chooses a file handler the next kernel does not
> > support, that's on them.
> >
> > The problem with the kernel making a decision about file handlers is
> > then userspace does not know what arguments to pass in. We are adding
> > custom per-file handler arguments to PRESERVE_FD and RETRIEVE_FD. If the
> > kernel is picking which file handler to use, say for a memfd, then
> > userspace doesn't know which arguments to pass in.
> 
> It is not the kernel deciding on its own which handler to use; it is
> the system admin (or host orchestrator) that configures LUO before the
> LU process starts, because the sysadmin knows what kernel we are
> rebooting into and the LUO specs of that target kernel. Meanwhile, the
> process calling PRESERVE_FD (e.g., a VMM) only knows about its own FDs
> and should not have to track target kernel serialization versions.
> 
> Also, the PRESERVE_FD and RETRIEVE_FD arguments are uABI tied to the
> FD type, not to a specific internal handler version. They are stable,
> and we can expand them the same way any ioctl argument is expanded
> (via size and flags), without ever shrinking or breaking them. We
> should not play the game of providing completely different uABI
> argument structs for different versions of a file handler. If a caller
> passes a new feature in the uABI args that the currently configured
> file handler version does not support, PRESERVE_FD simply returns
> -EOPNOTSUPP, just like any other extensible ioctl.

If we require that PRESERVE_FD and RETRIEVE_FD uAPI is stable across
different file handlers for the same file type, then my concern is
resolved.

> More generally, we are rebooting the host into a single target kernel,
> so compatibility is a session-level property, not a per-FD property.
> If we need an upfront global ioctl anyway, configuring the target
> compatibility upfront in one place is much cleaner than exposing FLBs
> to userspace and splitting version selection between a global ioctl
> and per-FD PRESERVE_FD calls.

That's a good point. Ok let's not do per-FD FH selection.

