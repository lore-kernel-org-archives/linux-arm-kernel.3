Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2827D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YN6GqXPK;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Au9zxSNX;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=uziSBMvM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Uz/Fqze7vjXHXkw3xCMrYU6OhmBnb9pnskloOWPqElc=; b=YN6GqXPKVRivo3
	zYWgpKc6pMhgKiTbiXPS1i1kEPLMnc8QLwnDX1UWck+vbHnCWtgivEgQ9Av3TBNFcRkjFgbNflNn1
	NBXtjqKRw5zXbe2KUokVLOVE5Bpfa9Z1NokGis+1kp0NNcbworK0G/2a55H8nSir4GSpOQmF/r0Oi
	LajprA2wZFU69Gxzdx7xWUEurpCWqNbjsorlrEAvH6MxwlX1V64xklQPaRU2FAUYOBAfwGzKktRVe
	cZpWFYtV1oIKwGd13coKwY/IQZi2uGqe9/PTPKAvQffFPL7u8XkS6MlM4WaaWEfTi0JFMxw2tsjZq
	Qp4fvJbt9WFfg09lUjog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFx7-0000000DgBg-3MhP;
	Sat, 31 Oct 2026 20:45:25 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFwz-0000000DgA8-4Amm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 20:45:19 +0000
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDk5Ov085103
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 16:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Uz/F
	qze7vjXHXkw3xCMrYU6OhmBnb9pnskloOWPqElc=; b=Au9zxSNXPrPM62rbkt+E
	zqPdQF4JQblJl4rrMOcFHPen9286VgEZzE7phKxVeFhJTkoPUsCTsUXeUnDax81u
	ZgJoVSDUM9iKa6VPh8SjqfxIIP3glCiwcy/14xQwQtCCxF/pi4eQ8e4OiHAlvWjh
	8I4Od1RUUrUmZaDp6XKaJJsjIDnNCpLepxxvXHaB1LvlTd7aoUITXobQM0Icr5h4
	blCSMbtyxYXBiLjYQxNdORgCUpOTaTM0TadWkeTYW/7oaOrJqfWE1wfmnpocyyv6
	rNNzJJXo1QZKhtR6gccroyyxKXMbbptbzdrK4bl1bujha8rnYPbjm6JcQfEoixtJ
	4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hn9wqbexp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 16:45:16 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so507264185a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793479516; x=1794084316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uz/Fqze7vjXHXkw3xCMrYU6OhmBnb9pnskloOWPqElc=;
        b=uziSBMvMr2ksdZqYCJPQQPSmSMwY9EqyJCS8zznuJ3Dn2Vj4eeKIi4ztltv+GxTvfl
         IuuRWFSbzAQm1JWgscOg7ly6Z4Sw9yITHcFXz4GP1fsmItEZ/T9ZmP28lzlbpeFuq9Sw
         c0p97jLh298SjPSqXhPkpa3md0j1Y//uCn11pUerm4b8DCpvx4q85s2LlStvluaM6Pjz
         nmWlx6W9Daxy2JQxGUk/J+Bm99rUiLgyxF3DzV/Hmc6YXFp6HR7Wp67TYpgeXjMfmiVl
         bfGnb1XakXddciQPmpfH0JqTcVi3R4/pUtPtoOh7PYEblyml26VyMzbJcUZ9KvzNp0ll
         Vj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479516; x=1794084316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uz/Fqze7vjXHXkw3xCMrYU6OhmBnb9pnskloOWPqElc=;
        b=IT4Lgwd2ca2JmlHdcZZTl1AxjhDOM9iY/v0JYXHV+TP6LGi1VSb4lwObooGEoeT4qs
         nsbi3hXBACcR00261qrjErMnIMOBfoE/p5PDyep+Mr/VuJkzF9a4fG+vvzXlcEvT1tII
         yS55YckaperH6FZ2eAvtZMeTgwLkVG9UJJ1P9voSIszydH8F5MWQRLlfob0f7m0oq/JT
         zIdKeLQltts+DzSyItQkvrmVA5LE3WNr58AyBXYtLiFIJPnkPjRteJmPgkSTCRnQ5hpF
         5qzcPPPy7rxxfEzucpBJJLJxJbpN0CW0uHw5Hd706rRa7YLjqfH56jnptiR2HoLywSqf
         OQ8Q==
X-Gm-Message-State: AFq9FYJdX7Ad737HJ3hr1K52gY9o8zSO30OC5KKSY76BlukzVQX9+54I
	dSmd0IS3x7mJRo5WUGqbCJFVPIzvBbe8zRMccmpvKtUE2SGOjBr9XNkvShQKT/qyeGBx1whRHn2
	1TIKRrR+FUnQoLJfeWma32ikasOQWHkLQJXCURllamo1FM5adqJfGAw2P7V+KcybHt1yMerf5
X-Gm-Gg: AYBFou0I4wADI4pL/U/NVjxhqY0YXdP/D3PM+ppSl98ITCVmyHdZH+FlBMzVhg/jLDN
	RxgWu5TqNhfihQZ47bxqOp4oJJ372GbwaPsBK71Oy06MdAqrmJWt2p32aL6NWdD/kHfz2mzi/gb
	awRatprlxwW78rzXQo7zzwM1JnOEG3v6EhVD238weQo1WMkoFvdIluyU2Fonoj8RfmtItEX60of
	FFehIrdsohLtFCI6RBwFaYR6ZzNfT0U4BVXU61sDSI53fJMVSyR6iqrlJ5i86fOWErrrIPu5BCp
	GRhqhm90pYnOTPTiss6mde78BbPwyFZyYUx0AGZkDKmwV/R5RJodWy6IuOROWM0NlCsR25CuuB9
	eWxfitJhgbjuR5ZTaSPO8fM3T3p3t6ZuWOJaZGr92/FWyvX+OSogM19OsOlA=
X-Received: by 2002:a05:620a:1793:b0:93c:c96c:a592 with SMTP id af79cd13be357-944216964edmr1075239585a.36.1793479516245;
        Sat, 31 Oct 2026 13:45:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93c:c96c:a592 with SMTP id af79cd13be357-944216964edmr1075237585a.36.1793479515783;
        Sat, 31 Oct 2026 13:45:15 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.155.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm104242845e9.2.2026.10.31.13.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:45:14 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 16:44:53 -0400
Subject: [PATCH 1/2] arm64: mte: use a folio in __access_remote_tags()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-arm64-mte-folio-v1-1-a8bc2960d11e@columbia.edu>
References: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
In-Reply-To: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793479509; l=1922;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=umaz6XtbnXVNpH/k5rdDfLFgb6VcMXDTiPejDNlmohE=;
 b=gDvQQkEeZ9SjHt1/v4NbIHqmAV6DCAIWWIMmD2WSp3mCHc6fo/TgbTc0H5mDpRgcqzSHu+S9A
 g0CNvPZ4J6EAySnpfH9w/eH1aV8BpNzBYziCfogQ6eBBex4eCpIqmtB
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=YpWa1IYX c=1 sm=1 tr=0 ts=6ae6535c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=OyQKmhT2Qqi7aVZxTY5mBQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=Bu24Ljrm87nzk03AsjUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfX7sYvnTGKSW3e
 hkS0tGbBsAehl6/yqOtTEbH6evtv2se2G7wSlk5v8YBy8I+fnvT4JyIbKiIPCIq+Fu4oWffcGZu
 Jd/2xHVg7RaI6EYKX4LBGTa64OIulrD7pP1hGFdRDxSWIxNJvl9B
X-Proofpoint-GUID: BzWl18_W9mydAZ70fQcLIHuwmMf7o92K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfX10XpKZwj2EVj
 S6WlakG0fELkCM8NDN4Md5GrL0mTpy4S4pxbmNPgkxIbjiTDd1vUnb9mSMPgLA2VvvUesW76mDG
 WbBgfsOLIqhqov+zNf51A0VbOT5lAnDZTL4Qfv6u7MYWEL5WPgaQ6mJntiZZl2mv7YVgMABf5Hk
 gaK4wAXXjwARxZEOPGIsO6l8R7zIsD9Ot4f0mAfL4OZpYJNW/S7kkAua6QaZXWhhu3ooDrRhJLn
 lWMcrCALP0YF77/CGzX9aND1dIyOEsN8OgOAH8JwuIzru5/G2hshljxaSRnj0qGFSxH1QFckxLa
 BCzMCDtSA6PJLsTpFe+0W9m1iB++Bigt1e74Et+4PTYfmp5Gc/Jb23nhq1C4Wara65FJjtUA3xE
 91lP40QtTKmLANd2KTfhsy5pJRRFAWtAXkO6qU85yLHDk9Kyge8be34U12X5RH5CRZwzcbIHiP/
 Ekwh/IjR8MQW66u/Q3w==
X-Proofpoint-ORIG-GUID: BzWl18_W9mydAZ70fQcLIHuwmMf7o92K
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=10 suspectscore=0 lowpriorityscore=10 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_134518_510042_6E48EE77 
X-CRM114-Status: GOOD (  18.39  )
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

__access_remote_tags() looks up the folio for the hugetlb check but
still uses the page everywhere else it can use the folio. Use the folio
for the rest, which removes the hidden compound_head() calls.

This removes the last use of set_page_dirty_lock() in arm64.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 arch/arm64/kernel/mte.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 31f5c6b0510e..f8d39e70857e 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -467,6 +467,7 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 			err = PTR_ERR(page);
 			break;
 		}
+		folio = page_folio(page);
 
 		/*
 		 * Only copy tags if the page has been mapped as PROT_MTE
@@ -477,16 +478,15 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 		 */
 		if (!(vma->vm_flags & VM_MTE)) {
 			err = -EIO;
-			put_page(page);
+			folio_put(folio);
 			break;
 		}
 
-		folio = page_folio(page);
 		if (folio_test_hugetlb(folio))
 			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio) &&
 				     !is_huge_zero_folio(folio));
 		else
-			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_page(page));
+			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_folio(folio));
 
 		/* limit access to the end of the page */
 		offset = offset_in_page(addr);
@@ -495,11 +495,11 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 		maddr = page_address(page);
 		if (write) {
 			tags = mte_copy_tags_from_user(maddr + offset, buf, tags);
-			set_page_dirty_lock(page);
+			folio_mark_dirty_lock(folio);
 		} else {
 			tags = mte_copy_tags_to_user(buf, maddr + offset, tags);
 		}
-		put_page(page);
+		folio_put(folio);
 
 		/* error accessing the tracer's buffer */
 		if (!tags)

-- 
2.39.5


