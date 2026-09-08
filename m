Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C20C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=; b=wxcvsNnNhxw8b/nGI1lYvCpbUP
	t8xNpLG1T9ooUhg5kUrgNvNk89HiTFNrYCuj+rPJCoEPIETG7RJ1dL8r0BXjlD4pWM8mNvD+QRLyk
	3Sn9bwEDiqTs6d8ZbAUvfh42bKzO8LkS7rsw9EtUMgfzhwAZciGw9YqO/19y1R4J/nMdHMXp9rmrP
	0siw7BQnF1fEuQzxzg6dlhZdy5xY9mFmzxGz9Yb8xS8gIUNPSdbuGqoEzDlYWz4pUxcs/AFa2vCzS
	4ESNKuFq8D31qKFGBdl0cTb6R5bM5LtfgzV7ilwHy6BOlJD0v+8R2uBI6+hkxIo4ZddVa1JbAnJub
	7sLNshtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZJ-00000009QwY-3L2W;
	Tue, 08 Sep 2026 15:17:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZD-00000009Qs1-0fJk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=; b=k2JICM9F3tdCfcEJNrE1ttZAO+
	kLR334wEUoa12lMwNQIbR/Z1asnc6jquqzsebXyyvGmCExJ3YXrlUitQbHhjgDChOdoszlBIjrhQ/
	l0l/HGUP1fxFxFvKzGrtAzjO977i3S+oQ7+Yrlu3hxOJ/IYHyK4pik8qawVzE7IeeFqhnOEQhZa1+
	lkJclr+RZYuer3VPlExoowR18sQkZDq3wUvy3tQ+QvcqaGL0TLhbnt3yIRTOl1aTcWoUbEXvzA+rV
	Hpy2apnELekikXY50yl76DnM87Sxb1nBpnVgbSzQE6dYGyodWN2MnMzoWDVOJ0HUhm41F45eDbnT7
	6LJqYctA==;
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xZ8-000000000E0-2h6a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:16:58 +0000
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYtaq982205
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 11:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=TUGg
	y+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=; b=VPfBwFhTXlKFwWloCWqY
	doiDToCv+ItHMrqPO8i1W6Tgwgz/M5rRQJYpKEfNUMWz5BJ2yLG+uh5r0CX3wyyq
	TKmf1kQmAGXXF3BJiEXFXxeso1ZOcG2jGlJZLCjrKINYDYBLatBvLKfKfPfcWcvO
	m0ayVUqVqT1dVAi7f6Qsa0hLZhPTzL1rNniu2/8pm2cMKQP+Sgeb0CvIqJl2TFbA
	vSLEIvvAgpI3kJk5ot7pZHladU6eFzG7h4Ajx6Xp1X0gl390LLJ48qW4au+CZrVI
	h4yF2ZuGZGkAOgNtYYq65A/PBG/UWV0El1iRS9lZegUCHrlUD+ytH0gxUUSpGfRw
	mw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj50j5337-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 11:16:52 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9105be46009so28387066d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880612; x=1789485412; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=;
        b=W72mMk4Ik+o4MKU4KWj83tt0GkFuRA6G8/IMg34Iawh53gcWRYeAL4VbxO3BLf+Q6v
         iPjKjszrO8syTZRn0fZKTvLhEJ7sLDXafywIquSmLRRUBtfqHziR/V4jmVOlTSwZfV09
         fLXwseTLWjKYZ/1Z17ggbGuISMplqtlhgTYPm2qeUz/KPzkCg+1wLp7nZ4ghqC9QMcCc
         Lgm4V4b5tZ5Fx1xL/wx7gGSaaRJx27JWXNHDvyvwL3v9fvzRqlIcU0I+qk9yPSwYwbC6
         Z73mKfKvphYdpGOASHJ7kOFiGONx5WaR3mnfPRBp19gC4JNnSX/uInHk1a/mL0c5SUgm
         EWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880612; x=1789485412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=;
        b=cUdcJtXdLySCXViOYeet9itNqnsEJ+XsybUQl55mV1bUE+yrPp8yo6mBvCuhVWsK2L
         UecqHmzz6cJgOAlXN3Vy3KAMdsctY2LbLuYf+5xVn8+2a4W4lZcQWYh/mMw7t+umsZlb
         GxrhIcZ455dAgr4mo8KP1eQjccF2p5WTgPEzGy1YeyAIX41ROLBMG90C9+7ltIHmXvtR
         +wcxH+OhIMWhpaQ99L2LfOD+8zx1ReZO/12H97EjEI7OxcvSfs4fqaR9lRGjBaxxyhZ5
         N5UNR5iORW7R+VxwfCGmoR7IA2IkjZ/TWjuwEhWaPyQ9uWt+HSLvxR+l4BkxGaZ3edIB
         6PdQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1RKeakIKsPidHFhd49JAKfmhqPW0FKV9UbUVSOUw1feBL6byM2UFwBYmishcbe/xpjaMdZLKJzY1bIJC43v+X@lists.infradead.org
X-Gm-Message-State: AFuF++nH4igU+kS9MlhT8lpPkPdijyUsjm1LyG25H9fv3IhSWXfZ5M9c
	r6DWlEdj3wRLzvrno1u1KiRAdtiZn4s4N9xfqlYOa2FjI70lXG9mIYBKlqUdayFqJquQIw7pYrt
	Jj9fR01/knB3Tf3xNOE4+uuOeDXQ1PVpJp7sRLzJaznVRH9vKLq1eytlzQrc0FzplRwukL34/
X-Gm-Gg: AYBFou15n84rKSV0L6+VialYtUVQt0NDyxTTgARvOSOqsK0Ic632XzxYhCZtOnqISO5
	IMLewDU+A2YnNjkQeUV/b2biwUhFG1r17eAlYxZiCICd7a67AQd4kiZmQU9njaRAYDfp43GmQg4
	YEmoOd88NH9EnKtB6Az1r96i03Vf2MU25CkjZ6KwtSi3Duu7oH03oi3q4nxx0wSJPFydV99S46j
	fdhXMUCYW04nCdJUBSNVOJCPqP6NPNcYlG5Vt4Rr4QqLgqIILC/qGEuzM90dTMjAAa09eRHd3rw
	4PEUhURSa35WJ5K2EwonpiKPgicdVE/rvJ4JlKgbno00HXe9gUjNFERE4JFF7LOJX/TGIy+qaEw
	MpUZbvJexDgXZvhvIdmRyHs1sMVDOEheBVyv9DmHeHZzFssi3Xvfl3Q==
X-Received: by 2002:a05:6214:29e7:b0:910:3b67:b793 with SMTP id 6a1803df08f44-9103b67b7f9mr305200326d6.24.1788880611476;
        Tue, 08 Sep 2026 08:16:51 -0700 (PDT)
X-Received: by 2002:a05:6214:29e7:b0:910:3b67:b793 with SMTP id 6a1803df08f44-9103b67b7f9mr305199926d6.24.1788880610996;
        Tue, 08 Sep 2026 08:16:50 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:50 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:37 -0400
Subject: [PATCH v2 7/8] arm64: mte: pass the swap entry to mte_save_tags()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-7-ee6d01dfa5e1@columbia.edu>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
In-Reply-To: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=2617;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8STOz0RYKi+7v+knfY76tg8bbf4f7uqOVYm5Jf2KOls=;
 b=3yiqYYUgynKMq+RRIEdaUti5K7MwMUXqY3WMxl1fsFaH046VsOb7qrugj7sTwz0D6k7kygoPl
 s02ruplAlBsCYZx/5WBodJl3UJIHGU4Yv+lkcZNrMnk7xeKVJglYrmg
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX9XUsWE62Lnoc
 c91K2oqJGq+0Yfc8UhtuekLswOKtq6I1oQP7SqpklOmX5BWxl0NPMGssd2TPDzr2AH100I9uSX7
 3LgrJscgn6LBWOh24luMAgNCzOZR6eZHI2upzcrw4835Xwe7k4lhUPUpzZpMK39UHNFQHkvgXHk
 ei9HBLzNoGjHBG3wL3GS869qCsynH40pt5VtvZGmBgI0RFSaobhSipP6PSDhgLtKGu0PuYUbe2h
 tQWwBP7bY6HJAk6I8nPP+v2pHTno9MncuAAX3H5lwaTpdV5UYnlCszLaQgCncNWgKtxT8oyoPGX
 2LVzvTDs/7qr3tlUZKLRIz+yP/Dshs/4xvI0ld35Y+tH62zWw5O7jn4PknRcHO8RTehuPiTJRvu
 CdA7rt78Sc7EYf1ia13BI+ia+el1AHyZxR3tnRT/j02VeFndB0PDVyy+QPRBkwcWA4dlhtEPo5O
 4F1uqTYhWaBYrKSwp5g==
X-Proofpoint-ORIG-GUID: 9sc8Jyno_ClSwroW_EONauShKGo1Vc3j
X-Proofpoint-GUID: 9sc8Jyno_ClSwroW_EONauShKGo1Vc3j
X-Authority-Analysis: v=2.4 cv=O7gJeh9W c=1 sm=1 tr=0 ts=6aa026e4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=p1CcqGZxNqfKctaSDs4A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXwMq0Bgbsqspz
 DFS8IUHywZmk9vClW9PO1QMsMDknO1ZbLcrgWQ/pfz6Oc17mPVoomVYw1zxz78fifuy5vhcYCT9
 sjD7YSpAlAtM/NG7LKppWxBb9k+WdpBk3p/mUmOtdxZXsoq4JCEa
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=10
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=10
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_161655_168234_15ADDDB0 
X-CRM114-Status: GOOD (  17.51  )
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

arch_prepare_to_swap() derives a page from the folio only for
mte_save_tags() to recompute the folio's swap entry from that page.
Pass the entry in directly with folio_swap_entry(), matching
mte_restore_tags(), and move the page_mte_tagged() check into the
caller so we only compute the entry for tagged pages.

__mte_invalidate_tags() loses its only user, so remove it and call
mte_invalidate_tags() directly in the error path. This removes two
calls to compound_head().

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 arch/arm64/mm/mteswap.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/mm/mteswap.c b/arch/arm64/mm/mteswap.c
index 3c54afc8b758..f64202b69309 100644
--- a/arch/arm64/mm/mteswap.c
+++ b/arch/arm64/mm/mteswap.c
@@ -20,22 +20,17 @@ void mte_free_tag_storage(char *storage)
 	kfree(storage);
 }
 
-static int mte_save_tags(struct page *page)
+static int mte_save_tags(swp_entry_t entry, struct page *page)
 {
 	void *tag_storage, *ret;
 
-	if (!page_mte_tagged(page))
-		return 0;
-
 	tag_storage = mte_allocate_tag_storage();
 	if (!tag_storage)
 		return -ENOMEM;
 
 	mte_save_page_tags(page_address(page), tag_storage);
 
-	/* lookup the swap entry.val from the page */
-	ret = xa_store(&mte_pages, page_swap_entry(page).val, tag_storage,
-		       GFP_KERNEL);
+	ret = xa_store(&mte_pages, entry.val, tag_storage, GFP_KERNEL);
 	if (WARN(xa_is_err(ret), "Failed to store MTE tags")) {
 		mte_free_tag_storage(tag_storage);
 		return xa_err(ret);
@@ -68,13 +63,6 @@ void mte_invalidate_tags(int type, pgoff_t offset)
 	mte_free_tag_storage(tags);
 }
 
-static inline void __mte_invalidate_tags(struct page *page)
-{
-	swp_entry_t entry = page_swap_entry(page);
-
-	mte_invalidate_tags(swp_type(entry), swp_offset(entry));
-}
-
 void mte_invalidate_tags_area(int type)
 {
 	swp_entry_t entry = swp_entry(type, 0);
@@ -102,15 +90,23 @@ int arch_prepare_to_swap(struct folio *folio)
 	nr = folio_nr_pages(folio);
 
 	for (i = 0; i < nr; i++) {
-		err = mte_save_tags(folio_page(folio, i));
+		struct page *page = folio_page(folio, i);
+
+		if (!page_mte_tagged(page))
+			continue;
+
+		err = mte_save_tags(folio_swap_entry(folio, i), page);
 		if (err)
 			goto out;
 	}
 	return 0;
 
 out:
-	while (i--)
-		__mte_invalidate_tags(folio_page(folio, i));
+	while (i--) {
+		swp_entry_t swap = folio_swap_entry(folio, i);
+
+		mte_invalidate_tags(swp_type(swap), swp_offset(swap));
+	}
 	return err;
 }
 

-- 
2.39.5


