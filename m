Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A48C606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GmXzM6TU;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cl/ebpRV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TIgU+Ph3TU3fSxrpE5w9RHNSxCs4sGelZ3NDiZdAMQo=; b=GmXzM6TUYsSLHkSyy8eEg5vPIV
	r4mrRrnd/1HtSuQiTUD3jzPl+EwwyWti0tXRXhKf/9wuCLbgXJ/Xr22sxlr/a2tcWiswhPCWMF5eF
	umgqsAfBte0S7e6+LhquN2U+f1AI90Yg53WxaNlxF7Ylbc9akNCIkHy8dXx3ajSFBlD7gtZCdtYHD
	y5LJTP9zER+vGsZg5vMc1OEJquH5jz85IO/+W8UwaH1P42BE2YFTu1ZWbb1BAHMV/GgKWiFTw1c2F
	2DGBnZVz0jEUUMQSlwFCDbhtVuSPPMWxCaLqc8vwlOxIKZ8I2UnreC0+L4XTVOWa7jLBoxxM753dp
	wsTCdTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKFY-00000003X5Q-1kBn;
	Tue, 03 Nov 2026 19:32:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKFV-00000003X54-3pNc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793734368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIgU+Ph3TU3fSxrpE5w9RHNSxCs4sGelZ3NDiZdAMQo=;
	b=Cl/ebpRVT/CbdxEpYxYHq5z1pR+7M69ibB3B+GdIyUurSCOl35QCN9ht7T8rcDOKxihvBU
	jLoAzlSc2wV52h7aO+8jolyudK8GQ4FKmppaEisIdXHzNppJ9+iTSs3UWeDU3TKBqvzu4G
	UMFVAjmoVeoRVfJI/gli/KQflhXu7Wk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-440-Bqcr0AShMuyZGg5nbjr7Eg-1; Tue,
 03 Nov 2026 14:32:45 -0500
X-MC-Unique: Bqcr0AShMuyZGg5nbjr7Eg-1
X-Mimecast-MFC-AGG-ID: Bqcr0AShMuyZGg5nbjr7Eg_1793734363
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FB6D19560AE;
	Tue,  3 Nov 2026 19:32:42 +0000 (UTC)
Received: from loberman-thinkpadp16gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CCAE51800586;
	Tue,  3 Nov 2026 19:32:38 +0000 (UTC)
From: Laurence Oberman <loberman@redhat.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Hannes Reinecke <hare@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Wenchao Hao <haowenchao2@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ming Lei <tom.leiming@gmail.com>,
	Will Deacon <will@kernel.org>,
	cki-project@redhat.com,
	jmoyer@redhat.com,
	bgoncalv@redhat.com,
	mpatalan@redhat.com,
	ftjahjad@redhat.com,
	fsuba@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] scsi: fix scsi_debug module-exit panic and pseudo target leak
Date: Tue,  3 Nov 2026 14:32:33 -0500
Message-ID: <20261103193235.1564898-1-loberman@redhat.com>
In-Reply-To: <8e4ba1820a7c56867bf7fff07bd52ff3f79573a1.camel@redhat.com>
References: <8e4ba1820a7c56867bf7fff07bd52ff3f79573a1.camel@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: rXOfAVej_XVGLoi_SQV6Oa5vh-6OcqOtbZWpVEAlsMo_1793734363
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_113250_026656_636D1557 
X-CRM114-Status: GOOD (  11.64  )
X-Spam-Score: 0.5 (/)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CKI reported a NULL pointer dereference in debugfs_remove() from
sdebug_tartget_cleanup_async() while blktests throtl/001 unloaded
scsi_debug on 7.4.0-rc1 (arm64). The bug is not arm64 specific. It
reproduces on x86_64 with KASAN as a slab-use-after-free of the
per-target debugfs dentry.

While fixing it, instrumenting target alloc/destroy in scsi_debug showed
a second, independent problem in the SCSI core: the pseudo SCSI device's
target is never destroyed, because scsi_get_pseudo_sdev() leaks a
reap_ref. With add_host=4 num_tgts=16, ->target_alloc() was called 68
times and ->target_destroy() only 64; the missing four were the
pseudo-device targets at id max_id. Any LLD that sets nr_reserved_cmds
leaks its pseudo target.

Patch 1 fixes the core leak. Patch 2 makes scsi_debug_exit() wait for
the deferred per-target debugfs cleanup before removing the debugfs
root and unloading. Patch 1 was found while testing patch 2, and
patch 2 was tested on top of it.

Testing (x86_64 VM, KASAN, 7.4.0-rc1): loop
"modprobe scsi_debug add_host=4 num_tgts=16; rmmod scsi_debug", with
an msleep(200) temporarily added to sdebug_tartget_cleanup_async() to
force the race window.
  - unpatched: KASAN slab-use-after-free / oops on the first rmmod
  - patch 1: 68 target_alloc / 68 target_destroy, pseudo targets
    destroyed during scsi_remove_host()
  - patches 1+2: 50 iterations clean with the msleep

I had assistatnce from LLM for both of these and ran a local sashiko
which was clean other than a pre-existing issue

Laurence Oberman (2):
  scsi: core: Fix target reap_ref leak in scsi_get_pseudo_sdev()
  scsi: scsi_debug: Wait for async target cleanup on module exit

 drivers/scsi/scsi_debug.c |  2 ++
 drivers/scsi/scsi_scan.c  | 15 ++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.43.0


