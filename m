Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14249606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WzfvcJeH;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEgqWmYc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qEmYCkPXDtF9hobALFV6QXuRhofx2fxJSYASJMiIobw=; b=WzfvcJeHenSj3yCm7N5qRcCIJ0
	rWOi5+elul/v+kGFNbO1R+VmN29vWILSznc8sQbg1HSaDieE7cDlB+TZ/JkZJCTLtpHXrVGlrIDxw
	uQF3Zguh/jlrc1Ubpj+dRUOt3TgetG121svQXr3jtMqsb3vY7Pn3W70pDTRXX0WsNZMEAE6J8Cifa
	u+JdfVsLANNE5Chqlww0xQIVjmTPEyVKp8rxFmdVen/tATAUNFeCLi30MWXRYCj4TuPU79OooBRD2
	ia2R/F7Pqje4AYQmMHOP2MnbDC6T6kLj2/dgm0gh3zeqWFUJC/P24Y0YwmyzBlRGPwmkc0NyZ9CD0
	jCebPGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLVG-00000003e4O-223s;
	Tue, 03 Nov 2026 20:53:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLVD-00000003e3u-0ICX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793739185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEmYCkPXDtF9hobALFV6QXuRhofx2fxJSYASJMiIobw=;
	b=UEgqWmYcs0WG5sXWTDvngmJCmfZdmMrsETFRqiEhKx6bnxSEH6VL4STG1MdKZdfGf8XiMb
	X2WYgjl3+qCMdJpyD07GyEwDs0QjgUpGYrfVRDc97c68REBmmF1C0sLZmyfUiklyKDXqFN
	rZMX7AeP0zVv5KzkwxIQ/q/M53NKdQ4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-118-HjnHRM6hPr23HX-1lG6F3A-1; Tue,
 03 Nov 2026 15:53:02 -0500
X-MC-Unique: HjnHRM6hPr23HX-1lG6F3A-1
X-Mimecast-MFC-AGG-ID: HjnHRM6hPr23HX-1lG6F3A_1793739180
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 17DB61800677;
	Tue,  3 Nov 2026 20:53:00 +0000 (UTC)
Received: from loberman-thinkpadp16gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 835BE1800347;
	Tue,  3 Nov 2026 20:52:56 +0000 (UTC)
From: Laurence Oberman <loberman@redhat.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Hannes Reinecke <hare@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Wenchao Hao <haowenchao2@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	cki-project@redhat.com,
	jmoyer@redhat.com,
	bgoncalv@redhat.com,
	mpatalan@redhat.com,
	ftjahjad@redhat.com,
	fsuba@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] scsi: scsi_debug: Wait for async target cleanup on module exit
Date: Tue,  3 Nov 2026 15:52:53 -0500
Message-ID: <20261103205253.1632907-1-loberman@redhat.com>
In-Reply-To: <20261103193235.1564898-1-loberman@redhat.com>
References: <20261103193235.1564898-1-loberman@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 3INyRekWSO7POyPZj3zSRC98ioIr7Hd2872SnuGZoLc_1793739180
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_125307_182621_E66C2979 
X-CRM114-Status: GOOD (  12.68  )
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

sdebug_target_destroy() is called with the host lock held, so it defers
removal of the per-target debugfs directory to
sdebug_tartget_cleanup_async() on sdebug_async_domain.
scsi_debug_exit() removes the hosts and then removes
sdebug_debugfs_root without waiting for that work. The recursive
removal of the root frees the per-target dentries, and a cleanup that
runs afterwards calls debugfs_remove() on a stale dentry:

  BUG: KASAN: slab-use-after-free in _raw_spin_lock+0x2d/0x40
  Workqueue: async async_run_entry_fn
  Call Trace:
   kasan_report+0x92/0xc0
   _raw_spin_lock+0x2d/0x40
   lockref_get+0x9/0x40
   __simple_recursive_removal+0x35/0x570
   debugfs_remove+0x40/0x60
   sdebug_tartget_cleanup_async+0x43/0x60 [scsi_debug]
   async_run_entry_fn+0x96/0x520
   process_one_work+0x925/0x1910
   worker_thread+0x567/0xcc0
   kthread+0x355/0x450
  Allocated by task 150:
   __d_alloc+0x34/0x9e0
   d_alloc+0x44/0x1d0
   ...
   debugfs_create_dir+0x18/0x3d0
   sdebug_target_alloc
   scsi_alloc_target+0x7c7/0xa70

followed by a NULL inode dereference in down_write() from
__simple_recursive_removal(). CKI hit this running blktests throtl/001
on arm64. The cleanup can also run after the module text has been
freed.

Commit b402a0dce64a ("scsi: scsi_debug: Fix create target debugfs
failure") drains sdebug_async_domain before creating a target. Do the
same in scsi_debug_exit() just before removing the debugfs root, after
the driver has been unregistered so that no host can still be bound and
queue further cleanup work.

Fixes: f084fe52c640 ("scsi: scsi_debug: Add debugfs interface to fail target reset")
Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Closes: https://lore.kernel.org/r/auja2VnJTp-ijxqu@arm.com
Reported-by: CKI Project <cki-project@redhat.com>
Closes: https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:3017229113
Signed-off-by: Laurence Oberman <loberman@redhat.com>
---
 drivers/scsi/scsi_debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index a922c8318a2f..deaed8b3e6c4 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -9053,6 +9053,8 @@ static void __exit scsi_debug_exit(void)
 
 	sdebug_erase_all_stores(false);
 	xa_destroy(per_store_ap);
+	/* Wait for deferred per-target debugfs cleanup before removing the root */
+	async_synchronize_full_domain(&sdebug_async_domain);
 	debugfs_remove(sdebug_debugfs_root);
 }
 
-- 
2.56.0


