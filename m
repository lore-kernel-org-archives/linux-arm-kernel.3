Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EBCCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 04:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=; b=WQZzquR/airkPWPTZ1qiSP1Pzd
	xDN2QsASBJ6MlbUe78q0907Ttx4QfQ9yyFCA1kxNMJjJqA4vm+YFftAFYnn6/7/zDPAmQMdnTGLeu
	qFJXlb90i39DRMCKP57j4QMyyXwadTMw2QuqxubaOcI563lVORwBb5lR0BYyGhEjNcNGxEGSmHyIs
	BwTW9iDsiio7ekk5KkGdU33CS1yannki0XEAqVbK9zvU7MC3HvhbxNZvuFY+1A6buF7lykzH8LOAf
	jKMbht0Pv3raszsfhf/403d4tDQoYo0/iwJsIiOUb/3aByhgjRnJRlPgn05DHE3AO2s42VpF4s911
	SZI4wOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJ8l-00000001TsK-239P;
	Fri, 22 Aug 2025 04:12:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBag-00000000OFb-2lJi
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=; b=QazDwaC9jxgrFY27owS0LQWJgt
	ohulZAdv3FwkUrKKmytvlW7JawijcUkgP09o14/kquaMA0VJirqqyXOOD4KA/wmGdP1K3/LW8nQU+
	S0Rpz52RIbqkexln5b6LrSwgtR9spI9zEkO48llGPg8ufZq8Uqi9ohAzM44YZln+HOkJwZXcRmLyT
	774ub9k5siH3mh9W8YAYIVtY/npxUovEbyCoh09Nz1UAnZEycdESHKsb4kK8eFZQQnwZ1djIN7GNc
	rEnk/GFEuj5ottpGSl2wqnK5j8K6AzoTE9HBo/Czz118CmO0/54cfkiSdtiT3odErRZwy9rvnYsLm
	PqqMr64g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaa-00000000fIz-2sOk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
	b=VH/oKTBz2XvWYIXL1GvlBbyllRPas05ZwTwF0Z6sB9C4dEfMVy8vnN4x7QMc8gj47HpevJ
	pOWS7UJYoCLhQKik7zpfAAbdldKWfeJddzVAHQbUVYQfVy/PXePcQCIVBc4xp89SyoGNm2
	144L8JuKo4ZH949FwJJjZoRTlqGlGEE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
	b=VH/oKTBz2XvWYIXL1GvlBbyllRPas05ZwTwF0Z6sB9C4dEfMVy8vnN4x7QMc8gj47HpevJ
	pOWS7UJYoCLhQKik7zpfAAbdldKWfeJddzVAHQbUVYQfVy/PXePcQCIVBc4xp89SyoGNm2
	144L8JuKo4ZH949FwJJjZoRTlqGlGEE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-C6e9zqOHOravK8yuexqgNw-1; Thu, 21 Aug 2025 16:08:44 -0400
X-MC-Unique: C6e9zqOHOravK8yuexqgNw-1
X-Mimecast-MFC-AGG-ID: C6e9zqOHOravK8yuexqgNw_1755806923
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b9edf2d82dso666855f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806923; x=1756411723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
        b=OG3/XISbwbDBYwIrkMpjNM1xp+qPGPmVz/a0WODLDoooecwKaq28tZCb/maljuFIx5
         F8ZCE12z3Z50KWnvWRbW30u9RHwrSX8/o1tLwWOhyU4MsgtByfOjtVMsQnzccHSIZBI7
         TDF+5I/G8q3bO4CvW0iKQQXygTgxAIpVoUq4qjMgmW8nXZWwo+4pcZsWmLOW51baP4/f
         7SnI951eMunKBEMVVyYALnhCLoupZl79JClCsC1nxUqCQaGyeECN8RDM+5SRULGDLh+h
         Bc+CBLY1PRpj1GFGqpSDCIq6aauc5OJC77FGdvjRleoFLyAPl1lfR93j6/oblB1u70E0
         JZEw==
X-Forwarded-Encrypted: i=1; AJvYcCUdtVXVkpey7yZ1t6y7+TWFuRRrEeWCXdDr6ioO8KczKQgczH9i5ymbdml1JrSE+fiVVTiNENgJjhc1tBCsO8Zo@lists.infradead.org
X-Gm-Message-State: AOJu0YyiBx51x8iXCaJnbXG3pRKahV0vnghzfj2nQK+3jbdRrvj8rjjJ
	3QZ4CaVTDuaSHTM/A/14ttszdMEARTFbdGX2yGfXxzQgc0fx03duOZNzY+8W9CQGmoMrRo1bpLK
	Cim7R4u2ffXD6nPvcRLCc30evaJIO0ZHmpmhv0nDmEf1czc7UmkA2mhzXSJZUUfvwzC9FBz9Grk
	34
X-Gm-Gg: ASbGncu5K6oDubPL/NIfMCEsWaGXRN6xX03iE2lzMZOMgfsy7nLOmGLp+7zN7ASYB2c
	FaTiGBWQd9PX1EWX33aVeiIidyn8S+5McyNkLmoWjL6LkKksSVEl7tYAf4eecgG1a6sqDoGxvM2
	N5Z2xJrvS4W4kH8j/U3CmkBe0/AA1rEPGzj+x3yfNIPHdvl/R4qoK++Ui6n4KhI3nfhTKnDbF+I
	+I1+dJQQX9FKMHwrDf1c6mCdx3Ovde9//8/eIlqlC84W1b8jCoVacx1uKWWnIcKSvLs1kg/ASZv
	H2SknqZGv8dBETfz0PG7Yvto8UFfPrh1fXrpnb6CWomG5hLCLrEVZ2G3gR5tmx5Wy9F+4KHD+FR
	3Jm3F73ecaNNNkCpzIYZGaw==
X-Received: by 2002:a5d:64ed:0:b0:3b5:dafc:1525 with SMTP id ffacd0b85a97d-3c5dc7313famr204662f8f.33.1755806922935;
        Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnHzRKC08dohUKQD/XdldMc6IWYVddiLtTh8Yidep5vx+5++gzVG23SiimMwYZ+HldR36Zkg==
X-Received: by 2002:a5d:64ed:0:b0:3b5:dafc:1525 with SMTP id ffacd0b85a97d-3c5dc7313famr204645f8f.33.1755806922505;
        Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50e3a587sm10028205e9.18.2025.08.21.13.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 34/35] block: update comment of "struct bio_vec" regarding nth_page()
Date: Thu, 21 Aug 2025 22:07:00 +0200
Message-ID: <20250821200701.1329277-35-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ko9ETJG-diJRV2c-4Wk1YKBRBH2beyI9R211DZPuPdI_1755806923
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210848_983284_36E62777 
X-CRM114-Status: GOOD (  13.68  )
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

Ever since commit 858c708d9efb ("block: move the bi_size update out of
__bio_try_merge_page"), page_is_mergeable() no longer exists, and the
logic in bvec_try_merge_page() is now a simple page pointer
comparison.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/bvec.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index 0a80e1f9aa201..3fc0efa0825b1 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -22,11 +22,8 @@ struct page;
  * @bv_len:    Number of bytes in the address range.
  * @bv_offset: Start of the address range relative to the start of @bv_page.
  *
- * The following holds for a bvec if n * PAGE_SIZE < bv_offset + bv_len:
- *
- *   nth_page(@bv_page, n) == @bv_page + n
- *
- * This holds because page_is_mergeable() checks the above property.
+ * All pages within a bio_vec starting from @bv_page are contiguous and
+ * can simply be iterated (see bvec_advance()).
  */
 struct bio_vec {
 	struct page	*bv_page;
-- 
2.50.1


