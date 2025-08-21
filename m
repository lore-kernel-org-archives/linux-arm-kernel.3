Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E09CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=; b=ZTKqaFeqJMtLz7OOaO2FZU18D0
	wzuAWkIFwwdSOs6GPLyQb6L/SPYwxITX9OtJw2BBuUAntqPFau/8Rdw1x0GMjK9CI5h0SYbdI/NTj
	9oF6n42iC1/XOrkr4r+cAS8Hl0uiAs3FjAxTcK+2iUqDWDw4Nz0YnEEItr4LkEC9VH2ByI29PHuRy
	CHu59aD7CmeQlKg0jt0VvJyvxcbnKz8qPIyTbexAQNcapP1FgjlD8yTN4SUlVuE12ETj3xB6QS5Xc
	kSie4JV6AQmslleJ7irXZhr9OOoZUsZYfvcJ4RnwnSKY03Cowl+hiikADMVzY1NrOmsyH3i1vrwXX
	54mc+9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFzu-000000014yl-1dhd;
	Fri, 22 Aug 2025 00:51:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaF-00000000O0i-2MYY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=; b=f6Sa2SG8UZyCN0ZkhSG1BAVLMH
	mzK4z7Le4OFPh34hOFVj+5mPQynOS7hFqO7QT2cBsnX1f8dQtfvrajuhDUR8qZZ8uBMdE8Fi12oA7
	B/khqH3j3zJ6BOBgclOxemEsfLCAvQSQej0EZTVNV1T8sKrotrfDQZF/uy7Ru0LwHhsnJEYCMBSjd
	Wzh373Czk3Ay6vp7UBJ8CWLkltMT3BOyrLPASdFaAMfY7BgHlIamfpiSa27T2ajx8eIY/vVPw15N/
	2jldFkfv3KlaK6hgxMFzFUUmVh8XX6+UZFffxfBOo+AQUU+FuAjC2m6GN/pgOPiX+ywF6XXIEQGNR
	lB9WyNWw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaC-00000000evT-0IRb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
	b=FEc/ixVICnw8V0P32ZbsdqRyeMv5FyRbJKdSAbLGDxqeG/a9uo40Ij8nhW+SV6xNCFpE8/
	xC86E4obxyA9N/IdytmeQWP/ZdVM3m4oPa4PhmUGQCZ92Juvw+uHbCf1fq9klrN+nAcE9/
	0JAH6u3T9oQGr2IILZsnO5QN0Nzt/Lk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
	b=FEc/ixVICnw8V0P32ZbsdqRyeMv5FyRbJKdSAbLGDxqeG/a9uo40Ij8nhW+SV6xNCFpE8/
	xC86E4obxyA9N/IdytmeQWP/ZdVM3m4oPa4PhmUGQCZ92Juvw+uHbCf1fq9klrN+nAcE9/
	0JAH6u3T9oQGr2IILZsnO5QN0Nzt/Lk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-h2Cc5ahXNIuMSu8Ovz4VFg-1; Thu, 21 Aug 2025 16:07:55 -0400
X-MC-Unique: h2Cc5ahXNIuMSu8Ovz4VFg-1
X-Mimecast-MFC-AGG-ID: h2Cc5ahXNIuMSu8Ovz4VFg_1755806874
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0514a5so6771725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806874; x=1756411674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
        b=k51rooEzDsW3k0Eoo0/UVPtMyuDB15D7HremGP0vUoDrAcwUL10cSbJDJK6hLaY8ch
         5hd5glx69ankJ33jtpLTkTzRT8wDM8JxWGCyJTZLW8FtV5OJDnfLp8dJVmgEBMvy+DIN
         rl643x8FiP1sOAHqDr4HGNcZk1oTyhnqqdvPlsbVTIwq3hE+jea1W2ztFWy36G6kfgyv
         gXoJ7oDRoH1HnpJGSiRfzT9sFENnv9+Qj4rii1YCEyq0tgmeUEFD7AqzqXyohU0sxQSx
         DLStMiqh7q6cg5ksSPsbrF8Ek4BUaM80rUmOBLTObCT0+BWz8s8jJFL5zQ9NX+SLBzNR
         xWiw==
X-Forwarded-Encrypted: i=1; AJvYcCXLKJEqkq5AvMgnN6ycJEWd1hTaOLEXcFNQV5wk9sXhk3sOXFCcvxDM2o9fC5p5yzncUZenF0xhtrpZjg4+lMP3@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ4I9vtxvpn1Ch8lXN5NUYE7k13ZsRaqzM2fWynG6ozsAOGWwc
	+ahq+iDchnCDzEFH4U6qBi5t8LJYGF2EQcMjryURHozcH43iKPQZj4VS2WA5nWbKmPzFuO3Zrkj
	RWvcO1Um7X7kMVWCg5cglKEFtvERROpgPy/7X+8PjmOIDWU7s53/Hkn0xp7xcDoS41zNsqUqzBB
	nW
X-Gm-Gg: ASbGnctd8whwwx7dvPLi7mVUTM9juKjCH86B+TVMh1Xq4FNhu0ckNONEg8KlY+sNfXc
	jh2NhTKmMRpWSPBJaEYAufctLJF4I0P85CWzfqp/C96tmPFGGDjTMbC8ItRSz7GamxQFqicKWJW
	xqWr3RNreHe1/DrLyMYk7IcS4zDCT9KH7sktgV8kpxF8AetTPhzOmhnkRXXgR6Dsxj7Z7aUWlFy
	0GZtG7nhSzlBbng/PEdlGcm0p37znly83Cc9zR6aPr45FOVOmxg4HnkQa2dOJ2wHXNQT4KwEarN
	xSupDRvt6fzXvJNdzSsVAKK3bfcCDycwJYULUsbYcrpMEYryYyFeqb86z6JopNyH63ymGOcA9OC
	89V2aSBhJg744Bp3N1ltY3g==
X-Received: by 2002:a05:600c:1388:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-45b517d40f2mr2554255e9.24.1755806874314;
        Thu, 21 Aug 2025 13:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo8ikhW4DoWVw60oDeAXqMRvn4UERlcVawLCjGel2pacwRc1R1ONhYVQm5EzuW0YIJQT4FDg==
X-Received: by 2002:a05:600c:1388:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-45b517d40f2mr2553905e9.24.1755806873856;
        Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07487a009sm12690403f8f.11.2025.08.21.13.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
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
Subject: [PATCH RFC 17/35] mm/gup: drop nth_page() usage within folio when recording subpages
Date: Thu, 21 Aug 2025 22:06:43 +0200
Message-ID: <20250821200701.1329277-18-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3byxYhS18Y5ECRKaKn760itXT7-VITjR1IsaKYSpeuQ_1755806874
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210824_232737_703127C1 
X-CRM114-Status: GOOD (  14.01  )
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

nth_page() is no longer required when iterating over pages within a
single folio, so let's just drop it when recording subpages.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index b2a78f0291273..f017ff6d7d61a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -491,9 +491,9 @@ static int record_subpages(struct page *page, unsigned long sz,
 	struct page *start_page;
 	int nr;
 
-	start_page = nth_page(page, (addr & (sz - 1)) >> PAGE_SHIFT);
+	start_page = page + ((addr & (sz - 1)) >> PAGE_SHIFT);
 	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-		pages[nr] = nth_page(start_page, nr);
+		pages[nr] = start_page + nr;
 
 	return nr;
 }
@@ -1512,7 +1512,7 @@ static long __get_user_pages(struct mm_struct *mm,
 			}
 
 			for (j = 0; j < page_increm; j++) {
-				subpage = nth_page(page, j);
+				subpage = page + j;
 				pages[i + j] = subpage;
 				flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
 				flush_dcache_page(subpage);
-- 
2.50.1


