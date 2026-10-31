Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE24606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ekF7CtlD;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Kx6xGzpD;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ccdvp9GC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PV68I91KKeWspn/QO5cHP4XcwhAjqyzgD7yiFdKEI6w=; b=ekF7CtlDvtY1kk
	CAujESBTxBOfpj4jEvB9xVsZh6aVhIO+pYsFg+/rQsO8amNa05iJ7Q8sF/YbAX6YXz12n8rlLtNbK
	QSu/PeaVlSZL9/O3rynDevfBBYqRbDi8x/09dxlNU7LUxKfFJXj5Iq2DKjZqGVHazTi0aJN858Bt+
	CadF4m7fO46hHBNqpx1cMMMpLVBt/fooKTSY+JpEvpt/xGXNzG1qfMVSEJW/5lgBey5ufrHQhI/x4
	i/EihY0ONmzB+9uo6+5k1/RRTlzMZyn9M+0AO3GCU3wF3kGLbDV50EGRiPE99l28+G0OHCOqu7RGe
	cXfh+6qJh2zyCOiqnMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNDG0-0000000DXcP-1cLE;
	Sat, 31 Oct 2026 17:52:44 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNDFy-0000000DXaa-0AE6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 17:52:43 +0000
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDnCp92741061
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=PV68
	I91KKeWspn/QO5cHP4XcwhAjqyzgD7yiFdKEI6w=; b=Kx6xGzpD1BZSx5LYmhHZ
	PKcsV2yB08K15Y/Lm62zbY6EsHEfWYGBBVQFDP/KKwA+WuKJv4rEbtZXx1tAJPSv
	de8lCz8BQ+BhwCPTlBfN+YIbz60qnGT7kIXnmp0Hk39KkHnoxNcyoNaRld+vDnOa
	z+ZWUH9dpGkhZwGjtNC+I65yur+xxrIMi9LWPaYI/PQtEJkQYR/Xq5UEFMGPL8SN
	uVtAfjC26nF0seMYDuxWBTUkofCeg9+yIBoW39Lu3PxqpST0mDUMFyDuFxbANKrP
	gq3blYeeOFp1Ki0iBNcj8KWs1Ag3f2l1FHzs2+TIHqjdoX0d9Bd25S6qmNZQoWsG
	cg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hn9betx0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:52:41 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so284712085a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793469160; x=1794073960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PV68I91KKeWspn/QO5cHP4XcwhAjqyzgD7yiFdKEI6w=;
        b=ccdvp9GCQrvfonafq/zlFPrpGFa5Q8IBqznQQbQXlRo8Tjyns73JERRLbHDVY3/Vuq
         W/kyyPWBQey0QBqIdpkJIdmRMsERsvkxVLBt8VwJ8m7HN3QVTttR51FK7wLU4MRhzaXw
         WDtSuppE1F5iXZ9DbLYx+ZCYSseCma6tayh27RYGdf/U05TMeFb2tSM/gjdlQS2HIskJ
         JfafuRw1/Q9bfs2GSp+k6RsRfjtIidlAsGtLy73Q8gZ0EFsktYLz5FulVJzd5pqVnceT
         6R+dxwei/2P5Vmg1YT5YE1eIbEeMDlVWMctwRvgLgbnEoDmv27aAh4Daolow5QI7oiyv
         qwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469160; x=1794073960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PV68I91KKeWspn/QO5cHP4XcwhAjqyzgD7yiFdKEI6w=;
        b=tRgbmcUUwc0NzoSYYLeTGswpB9aFhzG7fmf2Nuhk6ccMWef7Us5prer7M/sMMJXWLb
         GVhIgMwe/wQjaOglrtgGefbibwsp9UYrRxfaTATvKm77UPcexJxpGk51tH56c1WfCHOz
         68QOGYiE/9Sv51X2OgGFv58/nioGvvEgr16DlIBtx3NCF3DPCsyzZDG4bgA4/WwDJnNo
         1+qELl19TYL4y0jGXw4I/tLXC8LB53OdahRdpMwtj2aBLZL/Mr4CJTRpsBlpSxgVng4/
         7660sQPX3tczpQkLsosPcUCFxT7mmDDvpx5errcavqTD6ByVKK2pZLqNnAWoi28jliJa
         7bsA==
X-Forwarded-Encrypted: i=1; AKwUvBz3YxCg2y7XLUkQMArxhLcz31SMALW8k2caQbHro2B238kE6M0WfJ5DFxH6n4DUYwSDxHOdccsCp0kzypJHceO/@lists.infradead.org
X-Gm-Message-State: AFq9FYIXri3IIix3L3YaduinOjs74rJYAURfCn6NGCe0X4bHtJy+0asS
	esUodH7Bk494ZH/cLc0MNAR6xcRL7+QTTxFPa3nnMUF5/0J5Cb768RuQmwS/BasdxIXrmAjS1hs
	vPixcWDDxpQKs5+AU7XHN/A956R4lbuZtQiYF69bC9pjc8mG6vLOSoknziJ6/3wsrISnL0Gzh
X-Gm-Gg: AYBFou2P86q3nHqn9nOH1Bs7K3VYWWy4XwajPwFgoB255aC4USDmMk8ZO6APqLkxLxl
	GI2su4Qc7VGVnUg2ZGNfFi2eEJ3IxZpBdakBJM8bJNgFrGwofFCGSB7n3VbaFqUMb0I8J/f4MpI
	dMgk8LAptYk5CpCPCfuEnXddXBvusINKWUIfvKxcWB3hcNi8Ij365yJkawdIxw/nOjjrKu/N81C
	rGk8LAiG60tHg2wgVvAP0Enb+vY88w2CIZ83zwYqx+0BuDKckkxRxiXQM7wryPO+8NgAiVZZH1W
	AD3+eWkP1eMI+2slUoHHjfos3sdU912Gm55XJc9XdTU26hTlGJ0+5uoAZSaW77x7dySVIwLePLA
	9jlUrGeZNCo0hMYlmyGksFrabnRJq8+tBU92JK/aNnqAmbFt1rvSEUPlE+g==
X-Received: by 2002:a05:620a:45a6:b0:944:6d8:9c52 with SMTP id af79cd13be357-9442171e25amr971141885a.57.1793469160569;
        Sat, 31 Oct 2026 10:52:40 -0700 (PDT)
X-Received: by 2002:a05:620a:45a6:b0:944:6d8:9c52 with SMTP id af79cd13be357-9442171e25amr971138585a.57.1793469160095;
        Sat, 31 Oct 2026 10:52:40 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.159.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm249158315e9.11.2026.10.31.10.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:52:39 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 13:52:09 -0400
Subject: [PATCH 2/2] platform/raspberrypi: vchiq: mark pinned pages dirty
 when unpinning them
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-vchiq-unpin-dirty-v1-2-632d3f1281e0@columbia.edu>
References: <20261031-vchiq-unpin-dirty-v1-0-632d3f1281e0@columbia.edu>
In-Reply-To: <20261031-vchiq-unpin-dirty-v1-0-632d3f1281e0@columbia.edu>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793469152; l=3712;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=vFj4hKFrhWMRoV0kZRRhqDRjKJ27bx1QEz2GfvQc7us=;
 b=yGrjFPBXLe0lK6TZ8lPQ7inx8FHEWC+f9pn2UE4L7Ecdduwmc1oit1qQp/D3jLfTflf6booZf
 rnY5IBsKL8OCNv+KTHLjMpHETguaaepNNhfgBNORqtnxJ7RTaEfwSJO
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=d5dgWhjE c=1 sm=1 tr=0 ts=6ae62ae9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=P+xgYyhW+KadpqoI50EQPQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=xRIeBTzNsUtmvBibuAEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: hlhi1CJ7UQF4vkO1yw6c8DJ68onBkkuY
X-Proofpoint-ORIG-GUID: hlhi1CJ7UQF4vkO1yw6c8DJ68onBkkuY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfX5NRKEOI23FQv
 EJRMJb9tggEXVz5+kMRm8Xsl6aL+4icvFt/mvAKOZ+NKJrXd1ySkrdcVvDLDn+1b/pSce08QQKL
 GlRLYJebKpMG1FUdzAxNUZQFclE3Aex/AcxzsFzJtX/M6PeBR2w0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfX82GI6y9r822U
 5i48jTiJynr5YFCX9yty8K6FJOYN45/dmoVSBKf2zcXs40aHngOkq/mvAOn1lHroPekChEVB4kj
 iB7N52I+nAJ55TLz86/1U80bwEedvv0Gs1LbF0vMk1g9/z+UHJOAoa9R8i13tw8QosV9SlsxZCI
 C1iD8Icp+DlNh5gidc3kFogDM6sIYIckMNrFUOFWkXyyQs1OlZYI06ja36bJfBZ851qGzuqqFik
 SeIY2P3XshzycnKnHC5p1ft28/tDc+8193PyUefdYVMz5dizWkGvjRSzlLB/NUG+BNapgC3MmpA
 irqSkYWBv/FwjtW8PvVGWpclI0Tt7ukbKW6NaTjowMhIqnRpGvEMk2m22pWke0j//3Il3qm6E/X
 mpTJ0D0/VTelI5hwkDVGmUK1e050yZ5A2hFQ+MrifanjXXmCxLnEXBsVlzNhR6pInrh0FsvVHV4
 GBl6Nx4uzuENHIhNrsw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 lowpriorityscore=10 clxscore=1015 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_105242_120016_B55CB304 
X-CRM114-Status: GOOD (  15.85  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

free_pagelist() dirties the pages of a completed read with
set_page_dirty() before cleanup_pagelistinfo() unpins them. The pages
are pinned user memory that can be file backed, so they need to be
dirtied under the folio lock.

Pass a dirty flag to cleanup_pagelistinfo() and have it unpin with
unpin_user_pages_dirty_lock(), which marks each folio dirty once and
drops its pins in one go. The error paths in create_pagelist() pass
false.

This removes the last use of set_page_dirty() in vchiq.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 .../raspberrypi/vchiq-interface/vchiq_core.c       | 25 ++++++++--------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
index 3ae4ee2973de..931feb54d6ea 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
@@ -1456,7 +1456,8 @@ poll_services(struct vchiq_state *state)
 }
 
 static void
-cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagelistinfo)
+cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagelistinfo,
+		     bool dirty)
 {
 	if (pagelistinfo->scatterlist_mapped) {
 		dma_unmap_sg(instance->state->dev, pagelistinfo->scatterlist,
@@ -1464,7 +1465,8 @@ cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info
 	}
 
 	if (pagelistinfo->pages_need_release)
-		unpin_user_pages(pagelistinfo->pages, pagelistinfo->num_pages);
+		unpin_user_pages_dirty_lock(pagelistinfo->pages, pagelistinfo->num_pages,
+					    dirty);
 
 	dma_free_coherent(instance->state->dev, pagelistinfo->pagelist_buffer_size,
 			  pagelistinfo->pagelist, pagelistinfo->dma_addr);
@@ -1578,7 +1580,7 @@ create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 			size_t bytes = PAGE_SIZE - off;
 
 			if (!pg) {
-				cleanup_pagelistinfo(instance, pagelistinfo);
+				cleanup_pagelistinfo(instance, pagelistinfo, false);
 				return NULL;
 			}
 
@@ -1601,7 +1603,7 @@ create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 			/* This is probably due to the process being killed */
 			if (actual_pages > 0)
 				unpin_user_pages(pages, actual_pages);
-			cleanup_pagelistinfo(instance, pagelistinfo);
+			cleanup_pagelistinfo(instance, pagelistinfo, false);
 			return NULL;
 		}
 		 /* release user pages */
@@ -1630,7 +1632,7 @@ create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 				 pagelistinfo->dma_dir);
 
 	if (dma_buffers == 0) {
-		cleanup_pagelistinfo(instance, pagelistinfo);
+		cleanup_pagelistinfo(instance, pagelistinfo, false);
 		return NULL;
 	}
 
@@ -1664,7 +1666,7 @@ create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 		char *fragments;
 
 		if (down_interruptible(&drv_mgmt->free_fragments_sema)) {
-			cleanup_pagelistinfo(instance, pagelistinfo);
+			cleanup_pagelistinfo(instance, pagelistinfo, false);
 			return NULL;
 		}
 
@@ -1739,16 +1741,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 		up(&drv_mgmt->free_fragments_sema);
 	}
 
-	/* Need to mark all the pages dirty. */
-	if (pagelist->type != PAGELIST_WRITE &&
-	    pagelistinfo->pages_need_release) {
-		unsigned int i;
-
-		for (i = 0; i < num_pages; i++)
-			set_page_dirty(pages[i]);
-	}
-
-	cleanup_pagelistinfo(instance, pagelistinfo);
+	cleanup_pagelistinfo(instance, pagelistinfo, pagelist->type != PAGELIST_WRITE);
 }
 
 static int

-- 
2.39.5


