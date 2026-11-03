Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F18606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ll+BLSqb;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d1krUVQ5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0IWTvKkeF4HtefocvDwGzPE+Zqm+swxL2xAGyPzvM3Q=; b=Ll+BLSqbSZNEqI
	mjq78h7r02TnXY61e2pInW8gimIm4PZ8r4suhkg/ZD8xK7vEyBZmWDgq87z88uaFfSKiz2gK/V1SI
	VzD2YZ5eb/ZpPUT5RZRegB3+SQRscU3J5I6gaDQoHtXgfubF5F23E1vPhlR7hA7kyvMgPvpsFluAx
	UHC/ffI/Mnj+1YWvZtDC5Dv4BaL3UkGcEklETGm46gfl9VreETGJ1iv8p1Xr6mWdRVsoPAfIwXV4o
	08r/qi8Stuhh5Na+z+ByRHqlbPGF3bjMf8F5F9XPXJQKXicB937CIY4FAwq/oCtEW4SrTYy9aLz9m
	Oo6L0ytfuubrkmjtkduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLVk-00000003eAD-2ZXO;
	Tue, 03 Nov 2026 20:53:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLVh-00000003e9A-3qkP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793739217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0IWTvKkeF4HtefocvDwGzPE+Zqm+swxL2xAGyPzvM3Q=;
	b=d1krUVQ5e8shJPMXJ0mccTQZ1VMVxVUWdrzhj4BG/pXdcBxzFeil3OUGTeTY/7nJs0jTFu
	swXO8lTlqe4+51KgNk7Okxh21xZRiITGBVVTvDhxB5yu3ET0J7z1G7RabFGUnZZ74BMGOG
	N/wL3rATtMySVCDKT6nD8kfrq99chNg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-5Ei6o5ZPPsGTYJIEPjWWDw-1; Tue, 03 Nov 2026 15:53:35 -0500
X-MC-Unique: 5Ei6o5ZPPsGTYJIEPjWWDw-1
X-Mimecast-MFC-AGG-ID: 5Ei6o5ZPPsGTYJIEPjWWDw_1793739215
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-88322409239so397527b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 12:53:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739215; x=1794344015;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xPft9KWXDkuOx6B7/u4FFqsvHBu2VvHvH2RwxyN1/g=;
        b=CLZPWDuYHSjLsICIs7FPR3gSkHVO8fOaZYz7P54NjAv2+nWBUggxRh9tnMGWxOYcIy
         yqojqX90kmMuZW8QCv5RIbt3qO/w1C0532B8PFg6fISf72rxP0e0qa0Xqffx5MbGYUKl
         BH+UXsvMDvLPg3+IWFpBAEAbr0ImZBdJc42PYRMxknR2ZrLe9vkUcVxv2wENlT9DRexB
         +vtkiviRhwBqFdwXfOVHw6BgRGW62ZV1cgQZSIkZzPXMVkYIQeBajhnS6UIUWF5mUkzG
         MjacACDeeEuaZG/zj8A2MViO8uq3HYAKC6dL/r/mk8CwClaVtKBjtcp0e2IgDklQFckX
         RH8g==
X-Forwarded-Encrypted: i=1; AKwUvBzMQC1zcfN9D+n9u3PxCl/1pSuWoV+PRT83m9HYqfFEsiJT0jB1Dwt1NXW+RrmZlfbYQhzC5a8D8UogdxqOQx/I@lists.infradead.org
X-Gm-Message-State: APuU4Z8kDKJ9inpOmkqp3pUhWzNYawtTEBS3w4E1DahF3DW7xmccHVR5
	HrQHef9txNkojSFMxdk6atiq7HeEacqmS1g2csZblyB6HSWQ/TBbJpgf/UHQveOEiFsawHzRP+T
	1oOK2wJErr1FXdcIFBZc+FoyVzQ6E10UA2X4zH+/32wroQJwqp06su072yPq+CaBxlx6hLUgc7h
	kS
X-Gm-Gg: AYBFou39KZqzwwcFbGj6r4BjhuEXE0sFnFLnPXLrLjzBJYcNyKQUg8cyki6egESOdi5
	5UUoNL5/dHG6GJ4cSHTu+Lpt2nCsJMvGpjTTOA1/0B17tNRBFhNU8Isbc8v3HmLDwwJ8bwE+PIE
	TsjXUw7EDrGNWSFZVMdVboAiLTMhCQ57cbcDZ5zAA2mdtOMZK8TggKoE5XSbIfVO47vUddFExTj
	kUKGcq9oO99+1yfY6krImmYb9KY/9SFbRALQUl/40SpN5JPZiVgliV+NnU69CqL2R24VnJ3JZsC
	+P253hoOtICWX72T/OFVLUG2nPmgTqp+tcMmcThT22ou7TEDv49yHCxe64umvzdTe5LHCFyXbeE
	hd6AOwSx+c0LWkjlQCqiR20m7uRjwvsHgCUcRoluUB2lMnzG/Xq9UuHikDp3SYr1SJaMWI2I6oM
	xgE2cm85Q1agOUWRuciiMlRWjKw675xBRbwS/6WzboD0aVuIlkDIHFWMavsBVH0/CWxzgd4vs=
X-Received: by 2002:a05:690c:19:b0:8b1:ce5:be3a with SMTP id 00721157ae682-8b2b677f906mr103815167b3.37.1793739215142;
        Tue, 03 Nov 2026 12:53:35 -0800 (PST)
X-Received: by 2002:a05:690c:19:b0:8b1:ce5:be3a with SMTP id 00721157ae682-8b2b677f906mr103814837b3.37.1793739214512;
        Tue, 03 Nov 2026 12:53:34 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30998fd95sm4851957b3.30.2026.11.03.12.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:53:33 -0800 (PST)
Message-ID: <98fdc5862cfd344f1b1401a3301382807ce4eaff.camel@redhat.com>
Subject: Re: [PATCH] scsi: scsi_debug: Wait for async target cleanup on
 module exit
From: Laurence Oberman <loberman@redhat.com>
To: linux-scsi@vger.kernel.org, "Martin K . Petersen" <mkp@kernel.org>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Hannes Reinecke	 <hare@suse.de>, Bart Van Assche <bvanassche@acm.org>,
 Wenchao Hao	 <haowenchao22@gmail.com>, Wenchao Hao
 <haowenchao2@huawei.com>, Catalin Marinas	 <catalin.marinas@arm.com>, Ming
 Lei <tom.leiming@gmail.com>, Will Deacon	 <will@kernel.org>,
 cki-project@redhat.com, jmoyer@redhat.com, bgoncalv@redhat.com, 
	mpatalan@redhat.com, ftjahjad@redhat.com, fsuba@redhat.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 15:53:31 -0500
In-Reply-To: <20261103193235.1564898-3-loberman@redhat.com>
References: <8e4ba1820a7c56867bf7fff07bd52ff3f79573a1.camel@redhat.com>
	 <20261103193235.1564898-1-loberman@redhat.com>
	 <20261103193235.1564898-3-loberman@redhat.com>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mN9h-4fore4iL4g6P6QWf-Dn25L_p0F1BMCjOa3bVps_1793739215
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_125338_031380_6DF19E7D 
X-CRM114-Status: GOOD (  20.00  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-03 at 14:32 -0500, Laurence Oberman wrote:
> sdebug_target_destroy() is called with the host lock held, so it
> defers
> removal of the per-target debugfs directory to
> sdebug_tartget_cleanup_async() on sdebug_async_domain.
> scsi_debug_exit() removes the hosts and then removes
> sdebug_debugfs_root without waiting for that work. The recursive
> removal of the root frees the per-target dentries, and a cleanup that
> runs afterwards calls debugfs_remove() on a stale dentry:
>=20
> =C2=A0 BUG: KASAN: slab-use-after-free in _raw_spin_lock+0x2d/0x40
> =C2=A0 Workqueue: async async_run_entry_fn
> =C2=A0 Call Trace:
> =C2=A0=C2=A0 kasan_report+0x92/0xc0
> =C2=A0=C2=A0 _raw_spin_lock+0x2d/0x40
> =C2=A0=C2=A0 lockref_get+0x9/0x40
> =C2=A0=C2=A0 __simple_recursive_removal+0x35/0x570
> =C2=A0=C2=A0 debugfs_remove+0x40/0x60
> =C2=A0=C2=A0 sdebug_tartget_cleanup_async+0x43/0x60 [scsi_debug]
> =C2=A0=C2=A0 async_run_entry_fn+0x96/0x520
> =C2=A0=C2=A0 process_one_work+0x925/0x1910
> =C2=A0=C2=A0 worker_thread+0x567/0xcc0
> =C2=A0=C2=A0 kthread+0x355/0x450
> =C2=A0 Allocated by task 150:
> =C2=A0=C2=A0 __d_alloc+0x34/0x9e0
> =C2=A0=C2=A0 d_alloc+0x44/0x1d0
> =C2=A0=C2=A0 ...
> =C2=A0=C2=A0 debugfs_create_dir+0x18/0x3d0
> =C2=A0=C2=A0 sdebug_target_alloc
> =C2=A0=C2=A0 scsi_alloc_target+0x7c7/0xa70
>=20
> followed by a NULL inode dereference in down_write() from
> __simple_recursive_removal(). CKI hit this running blktests
> throtl/001
> on arm64. The cleanup can also run after the module text has been
> freed.
>=20
> Commit b402a0dce64a ("scsi: scsi_debug: Fix create target debugfs
> failure") drains sdebug_async_domain before creating a target. Do the
> same in scsi_debug_exit() just before removing the debugfs root,
> after
> the driver has been unregistered so that no host can still be bound
> and
> queue further cleanup work.
>=20
> Fixes: f084fe52c640 ("scsi: scsi_debug: Add debugfs interface to fail
> target reset")
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Closes: https://lore.kernel.org/r/auja2VnJTp-ijxqu@arm.com
> Reported-by: CKI Project <cki-project@redhat.com>
> Closes:
> https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:3017229113
> Signed-off-by: Laurence Oberman <loberman@redhat.com>
> ---
> =C2=A0drivers/scsi/scsi_debug.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
> index a922c8318a2f..deaed8b3e6c4 100644
> --- a/drivers/scsi/scsi_debug.c
> +++ b/drivers/scsi/scsi_debug.c
> @@ -9053,6 +9053,8 @@ static void __exit scsi_debug_exit(void)
> =C2=A0
> =C2=A0=09sdebug_erase_all_stores(false);
> =C2=A0=09xa_destroy(per_store_ap);
> +=09/* Wait for deferred per-target debugfs cleanup before
> removing the root */
> +=09async_synchronize_full_domain(&sdebug_async_domain);
> =C2=A0=09debugfs_remove(sdebug_debugfs_root);
> =C2=A0}
> =C2=A0
Please ignore, this went out without series numbering. Resent as [PATCH
2/2] in reply to the cover letter.


