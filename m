Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2FACA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6MGuHLofg/UQ6j3od6DFBlP6h40d9oLh3k2QL5DRKE=; b=efWIgKRoshbb/ziEgLmGf1kcs5
	3Fq055q5tYtBTnMXa58GeFO87od1YD5OaoxfCUIeGjqjF86X4+8uBZKIC2Os70SMMNdWPZgwCYccd
	RwnntBh2ChRZ7jq44h1oXHyWq+Onc9Yw5Xu00SXu7oyJmBB84/woXFJUJhadUe2hDPGOKKUW/2DYc
	+/Qr7z/KaUlsmjc8kfP++NqCYvNYO4jdSq4QzBlz+36t6hx1H1ZqeejH+6+sJG0I76EflGBvAG0A6
	RmxNURoKontbrKXMYx73BBqfPqBvlrutJzMopreQBeeMEJnTKVQZXcv0B6Rev7eTLbiy6Zu/iT55/
	wjvTaujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbdq-00000001Wkb-1l5h;
	Thu, 28 Aug 2025 12:22:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6S-0000000103A-2nIz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 09:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=L6MGuHLofg/UQ6j3od6DFBlP6h40d9oLh3k2QL5DRKE=; b=YXsXEVvAt6zFH2vCpo+SHyQxMA
	FRn/RR3m/u0KGUydOnubHxc4yzjv8443FtZEBKGu6Bk2N6LbG63FnXXfctAtgaNEeCSgvMOmc+o36
	6hPf7uAI9FOgVR7VJtSnqPgdliHv1N71Ccz6EJaliFnFOROQxh6pGyETVJr4AijGDHLugffxW6A/x
	CX+myLF/bFXy8jqaKGClajFX2kOA/PZOTn2fgNIakTFVfCRTUIr+pTeQSIu5V3/0MNbal5yHHmFyS
	ZFvZFFLWJo142/h68XzWUXSI1eb91wZmnRwpQPL/7NQaPEVzEsPs6t7YwaTovMFrIWhHJl+DSlRGw
	3O6UJD2Q==;
Received: from fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.156.205.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6O-00000002gNV-1Ad7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756373968; x=1787909968;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L6MGuHLofg/UQ6j3od6DFBlP6h40d9oLh3k2QL5DRKE=;
  b=ix3zAVOGyH8bsnful7mV37GEKPMOHFuBXMV8sSUWP4tEg/FwJcJV8+aB
   /Q5dmgn9pJt94oivmbghvT5hUygfyJWZlTHISpBDT3GxScbZl9zunWsMj
   EsyncQCXknF9fugn8Uf9GHRyvY8ra1XpYzVq2JbfyGm3RE+4TcHXyJT/Q
   XFPDFyENTiVkInNYq0mV89gmBrOr82PABcsQOPbgkRAbNWDfSZ12tF2GA
   oTrmcHEx6Yn7Fx4h3UtYBg/pDPJ1V9dPVvl0G8WRNWtTFkeGkyI51ZvKG
   e6cHSR10iqGPyBiTjQkFFgA2B5ry07G4G2Zubfv7ftfO9stWaHAtNn2w5
   A==;
X-CSE-ConnectionGUID: xHLGpQ9EQomHh63vS1uFkA==
X-CSE-MsgGUID: peFr5JATRJ+PESY0Origbw==
X-IronPort-AV: E=Sophos;i="6.18,214,1751241600"; 
   d="scan'208";a="1303198"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:39:16 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:15240]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.43.161:2525] with esmtp (Farcaster)
 id 88d0e6d1-2f79-4aea-8d55-7d6f4981dd7e; Thu, 28 Aug 2025 09:39:16 +0000 (UTC)
X-Farcaster-Flow-ID: 88d0e6d1-2f79-4aea-8d55-7d6f4981dd7e
Received: from EX19D015EUB001.ant.amazon.com (10.252.51.114) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:16 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB001.ant.amazon.com (10.252.51.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:15 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.017; Thu, 28 Aug 2025 09:39:15 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "david@redhat.com" <david@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>
CC: Elliot Berman <quic_eberman@quicinc.com>, "tabba@google.com"
	<tabba@google.com>, "ackerleytng@google.com" <ackerleytng@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"rppt@kernel.org" <rppt@kernel.org>, "will@kernel.org" <will@kernel.org>,
	"vbabka@suse.cz" <vbabka@suse.cz>, "Cali, Marco" <xmarcalx@amazon.co.uk>,
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>, "Roy,
 Patrick" <roypat@amazon.co.uk>
Subject: [PATCH v5 01/12] filemap: Pass address_space mapping to
 ->free_folio()
Thread-Topic: [PATCH v5 01/12] filemap: Pass address_space mapping to
 ->free_folio()
Thread-Index: AQHcF/+eDtAQnAAgHUCJHWFnAQTX+Q==
Date: Thu, 28 Aug 2025 09:39:15 +0000
Message-ID: <20250828093902.2719-2-roypat@amazon.co.uk>
References: <20250828093902.2719-1-roypat@amazon.co.uk>
In-Reply-To: <20250828093902.2719-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_103928_581264_F165BA8C 
X-CRM114-Status: GOOD (  12.83  )
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

From: Elliot Berman <quic_eberman@quicinc.com>=0A=
=0A=
When guest_memfd removes memory from the host kernel's direct map,=0A=
direct map entries must be restored before the memory is freed again. To=0A=
do so, ->free_folio() needs to know whether a gmem folio was direct map=0A=
removed in the first place though. While possible to keep track of this=0A=
information on each individual folio (e.g. via page flags), direct map=0A=
removal is an all-or-nothing property of the entire guest_memfd, so it=0A=
is less error prone to just check the flag stored in the gmem inode's=0A=
private data.  However, by the time ->free_folio() is called,=0A=
folio->mapping might be cleared. To still allow access to the address=0A=
space from which the folio was just removed, pass it in as an additional=0A=
argument to ->free_folio, as the mapping is well-known to all callers.=0A=
=0A=
Link: https://lore.kernel.org/all/15f665b4-2d33-41ca-ac50-fafe24ade32f@redh=
at.com/=0A=
Suggested-by: David Hildenbrand <david@redhat.com>=0A=
Acked-by: David Hildenbrand <david@redhat.com>=0A=
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>=0A=
[patrick: rewrite shortlog for new usecase]=0A=
Signed-off-by: Patrick Roy <roypat@amazon.co.uk>=0A=
---=0A=
 Documentation/filesystems/locking.rst |  2 +-=0A=
 fs/nfs/dir.c                          | 11 ++++++-----=0A=
 fs/orangefs/inode.c                   |  3 ++-=0A=
 include/linux/fs.h                    |  2 +-=0A=
 mm/filemap.c                          |  9 +++++----=0A=
 mm/secretmem.c                        |  3 ++-=0A=
 mm/vmscan.c                           |  4 ++--=0A=
 virt/kvm/guest_memfd.c                |  3 ++-=0A=
 8 files changed, 21 insertions(+), 16 deletions(-)=0A=
=0A=
diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesyst=
ems/locking.rst=0A=
index aa287ccdac2f..74c97287ec40 100644=0A=
--- a/Documentation/filesystems/locking.rst=0A=
+++ b/Documentation/filesystems/locking.rst=0A=
@@ -262,7 +262,7 @@ prototypes::=0A=
 	sector_t (*bmap)(struct address_space *, sector_t);=0A=
 	void (*invalidate_folio) (struct folio *, size_t start, size_t len);=0A=
 	bool (*release_folio)(struct folio *, gfp_t);=0A=
-	void (*free_folio)(struct folio *);=0A=
+	void (*free_folio)(struct address_space *, struct folio *);=0A=
 	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);=0A=
 	int (*migrate_folio)(struct address_space *, struct folio *dst,=0A=
 			struct folio *src, enum migrate_mode);=0A=
diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c=0A=
index d81217923936..644bd54e052c 100644=0A=
--- a/fs/nfs/dir.c=0A=
+++ b/fs/nfs/dir.c=0A=
@@ -55,7 +55,7 @@ static int nfs_closedir(struct inode *, struct file *);=
=0A=
 static int nfs_readdir(struct file *, struct dir_context *);=0A=
 static int nfs_fsync_dir(struct file *, loff_t, loff_t, int);=0A=
 static loff_t nfs_llseek_dir(struct file *, loff_t, int);=0A=
-static void nfs_readdir_clear_array(struct folio *);=0A=
+static void nfs_readdir_clear_array(struct address_space *, struct folio *=
);=0A=
 static int nfs_do_create(struct inode *dir, struct dentry *dentry,=0A=
 			 umode_t mode, int open_flags);=0A=
 =0A=
@@ -218,7 +218,8 @@ static void nfs_readdir_folio_init_array(struct folio *=
folio, u64 last_cookie,=0A=
 /*=0A=
  * we are freeing strings created by nfs_add_to_readdir_array()=0A=
  */=0A=
-static void nfs_readdir_clear_array(struct folio *folio)=0A=
+static void nfs_readdir_clear_array(struct address_space *mapping,=0A=
+				    struct folio *folio)=0A=
 {=0A=
 	struct nfs_cache_array *array;=0A=
 	unsigned int i;=0A=
@@ -233,7 +234,7 @@ static void nfs_readdir_clear_array(struct folio *folio=
)=0A=
 static void nfs_readdir_folio_reinit_array(struct folio *folio, u64 last_c=
ookie,=0A=
 					   u64 change_attr)=0A=
 {=0A=
-	nfs_readdir_clear_array(folio);=0A=
+	nfs_readdir_clear_array(folio->mapping, folio);=0A=
 	nfs_readdir_folio_init_array(folio, last_cookie, change_attr);=0A=
 }=0A=
 =0A=
@@ -249,7 +250,7 @@ nfs_readdir_folio_array_alloc(u64 last_cookie, gfp_t gf=
p_flags)=0A=
 static void nfs_readdir_folio_array_free(struct folio *folio)=0A=
 {=0A=
 	if (folio) {=0A=
-		nfs_readdir_clear_array(folio);=0A=
+		nfs_readdir_clear_array(folio->mapping, folio);=0A=
 		folio_put(folio);=0A=
 	}=0A=
 }=0A=
@@ -391,7 +392,7 @@ static void nfs_readdir_folio_init_and_validate(struct =
folio *folio, u64 cookie,=0A=
 	if (folio_test_uptodate(folio)) {=0A=
 		if (nfs_readdir_folio_validate(folio, cookie, change_attr))=0A=
 			return;=0A=
-		nfs_readdir_clear_array(folio);=0A=
+		nfs_readdir_clear_array(folio->mapping, folio);=0A=
 	}=0A=
 	nfs_readdir_folio_init_array(folio, cookie, change_attr);=0A=
 	folio_mark_uptodate(folio);=0A=
diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c=0A=
index a01400cd41fd..37227ba71593 100644=0A=
--- a/fs/orangefs/inode.c=0A=
+++ b/fs/orangefs/inode.c=0A=
@@ -452,7 +452,8 @@ static bool orangefs_release_folio(struct folio *folio,=
 gfp_t foo)=0A=
 	return !folio_test_private(folio);=0A=
 }=0A=
 =0A=
-static void orangefs_free_folio(struct folio *folio)=0A=
+static void orangefs_free_folio(struct address_space *mapping,=0A=
+				struct folio *folio)=0A=
 {=0A=
 	kfree(folio_detach_private(folio));=0A=
 }=0A=
diff --git a/include/linux/fs.h b/include/linux/fs.h=0A=
index d7ab4f96d705..afb0748ffda6 100644=0A=
--- a/include/linux/fs.h=0A=
+++ b/include/linux/fs.h=0A=
@@ -457,7 +457,7 @@ struct address_space_operations {=0A=
 	sector_t (*bmap)(struct address_space *, sector_t);=0A=
 	void (*invalidate_folio) (struct folio *, size_t offset, size_t len);=0A=
 	bool (*release_folio)(struct folio *, gfp_t);=0A=
-	void (*free_folio)(struct folio *folio);=0A=
+	void (*free_folio)(struct address_space *, struct folio *folio);=0A=
 	ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);=0A=
 	/*=0A=
 	 * migrate the contents of a folio to the specified target. If=0A=
diff --git a/mm/filemap.c b/mm/filemap.c=0A=
index 751838ef05e5..3dd8ad922d80 100644=0A=
--- a/mm/filemap.c=0A=
+++ b/mm/filemap.c=0A=
@@ -226,11 +226,11 @@ void __filemap_remove_folio(struct folio *folio, void=
 *shadow)=0A=
 =0A=
 void filemap_free_folio(struct address_space *mapping, struct folio *folio=
)=0A=
 {=0A=
-	void (*free_folio)(struct folio *);=0A=
+	void (*free_folio)(struct address_space *, struct folio *);=0A=
 =0A=
 	free_folio =3D mapping->a_ops->free_folio;=0A=
 	if (free_folio)=0A=
-		free_folio(folio);=0A=
+		free_folio(mapping, folio);=0A=
 =0A=
 	folio_put_refs(folio, folio_nr_pages(folio));=0A=
 }=0A=
@@ -820,7 +820,8 @@ EXPORT_SYMBOL(file_write_and_wait_range);=0A=
 void replace_page_cache_folio(struct folio *old, struct folio *new)=0A=
 {=0A=
 	struct address_space *mapping =3D old->mapping;=0A=
-	void (*free_folio)(struct folio *) =3D mapping->a_ops->free_folio;=0A=
+	void (*free_folio)(struct address_space *, struct folio *) =3D=0A=
+		mapping->a_ops->free_folio;=0A=
 	pgoff_t offset =3D old->index;=0A=
 	XA_STATE(xas, &mapping->i_pages, offset);=0A=
 =0A=
@@ -849,7 +850,7 @@ void replace_page_cache_folio(struct folio *old, struct=
 folio *new)=0A=
 		__lruvec_stat_add_folio(new, NR_SHMEM);=0A=
 	xas_unlock_irq(&xas);=0A=
 	if (free_folio)=0A=
-		free_folio(old);=0A=
+		free_folio(mapping, old);=0A=
 	folio_put(old);=0A=
 }=0A=
 EXPORT_SYMBOL_GPL(replace_page_cache_folio);=0A=
diff --git a/mm/secretmem.c b/mm/secretmem.c=0A=
index 60137305bc20..422dcaa32506 100644=0A=
--- a/mm/secretmem.c=0A=
+++ b/mm/secretmem.c=0A=
@@ -150,7 +150,8 @@ static int secretmem_migrate_folio(struct address_space=
 *mapping,=0A=
 	return -EBUSY;=0A=
 }=0A=
 =0A=
-static void secretmem_free_folio(struct folio *folio)=0A=
+static void secretmem_free_folio(struct address_space *mapping,=0A=
+				 struct folio *folio)=0A=
 {=0A=
 	set_direct_map_default_noflush(folio_page(folio, 0));=0A=
 	folio_zero_segment(folio, 0, folio_size(folio));=0A=
diff --git a/mm/vmscan.c b/mm/vmscan.c=0A=
index a48aec8bfd92..559bd6ac965c 100644=0A=
--- a/mm/vmscan.c=0A=
+++ b/mm/vmscan.c=0A=
@@ -788,7 +788,7 @@ static int __remove_mapping(struct address_space *mappi=
ng, struct folio *folio,=0A=
 		xa_unlock_irq(&mapping->i_pages);=0A=
 		put_swap_folio(folio, swap);=0A=
 	} else {=0A=
-		void (*free_folio)(struct folio *);=0A=
+		void (*free_folio)(struct address_space *, struct folio *);=0A=
 =0A=
 		free_folio =3D mapping->a_ops->free_folio;=0A=
 		/*=0A=
@@ -817,7 +817,7 @@ static int __remove_mapping(struct address_space *mappi=
ng, struct folio *folio,=0A=
 		spin_unlock(&mapping->host->i_lock);=0A=
 =0A=
 		if (free_folio)=0A=
-			free_folio(folio);=0A=
+			free_folio(mapping, folio);=0A=
 	}=0A=
 =0A=
 	return 1;=0A=
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c=0A=
index 08a6bc7d25b6..9ec4c45e3cf2 100644=0A=
--- a/virt/kvm/guest_memfd.c=0A=
+++ b/virt/kvm/guest_memfd.c=0A=
@@ -430,7 +430,8 @@ static int kvm_gmem_error_folio(struct address_space *m=
apping, struct folio *fol=0A=
 }=0A=
 =0A=
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE=0A=
-static void kvm_gmem_free_folio(struct folio *folio)=0A=
+static void kvm_gmem_free_folio(struct address_space *mapping,=0A=
+				struct folio *folio)=0A=
 {=0A=
 	struct page *page =3D folio_page(folio, 0);=0A=
 	kvm_pfn_t pfn =3D page_to_pfn(page);=0A=
-- =0A=
2.50.1=0A=
=0A=

