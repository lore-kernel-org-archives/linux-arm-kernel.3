Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S7UeQ9Gq;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Fvrz7Gd/;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=DkGGGIw7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ai8/m3ORx3SDFek14s5382kHx3xtwqviDFybZ71Yxpc=; b=S7UeQ9GqqepdP4
	/8BTuNPtf+njrqObDimCZZBIdwOp+9ucISZ3rhT20RHC2+zuT+rIt4tfN/Yq61g3jva8WEx/3Ep0R
	fAEUjcxLs38ilv0CqR0qJuwauOYNpfxCI6qGJ8W9pco9X9ecYpEWR5S9kfFMlEK7kos7dKkAp+Tlb
	/x/VVHEbfGS/HoxvQsz1MvYd8l8H3TqXx9oMuv3rM1VYmq3BrJai8TeYajDUlh5dvT23O53mX0jIU
	pTaqM7ICuGt8SWfOq5mXmUiNONxgvUklCMr8dd2tbOW9glRndZoVXvrn2L2Xedv8Bs/WatfNWRw3S
	LrXS4TUb1EJALMJmJnzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFx8-0000000DgBy-02QJ;
	Sat, 31 Oct 2026 20:45:26 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFx2-0000000DgAW-1Fxv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 20:45:21 +0000
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDkCou636993
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 16:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ai8/
	m3ORx3SDFek14s5382kHx3xtwqviDFybZ71Yxpc=; b=Fvrz7Gd/xEKLA0Avui7n
	zfo8HkRANkh99NliYjIXJcykbv7MXLl5ZZ2keep9+WGLjOb0xzb8nsEq7yMHMeTk
	ZeKGNRdarUzg8a1d/FXOBnYywZuGhMbkxjoCvi4fM8K62X9iXO0QjSXqgsn86WzE
	jLIRl+jYAewlUJ0q8pVabuBMZ2EzP1qjF/a/3IJRGFvVu5EqolOM3F/c1BTyGPj6
	ODgGDWmnNqLgNlsWluAgIluiG9UuVEXZDAj5N0/H0fvKC0CddhL2cHBZ1BvMwA63
	gFKi4Ay+OLJ9MATz4mi/U487eZGq9gT2+tSw+J0d2NDwbREdzxvYiTkyMo1iz6RT
	+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hnc7ak55j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 16:45:19 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so319293485a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793479519; x=1794084319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ai8/m3ORx3SDFek14s5382kHx3xtwqviDFybZ71Yxpc=;
        b=DkGGGIw7A6WJ04XeSa2MFQgANny5QYD63NcZJiHaT37PiZ9i+yWMNU0VRySJaHq1i3
         NOjrusweB65Yb0KRH2n7DSbfO9g3dpA2FlCm5k8LqC69RyZethAdBF89GiUQZDG4m7N2
         lMUdsSUOpXpvBgXPW56T6wPoSb6tZaE4MXkXoHO48H/MfoiaGKeyQiQGe5gB4iuWhWFu
         MzSRxE4m31ZZrK/M/CaXWDvGOgMGqsfOyD1HXvKZEy9zDuxSAnbplRhcwGro65lt02b6
         burn8x2V1WjjSn+SFS0QPpvUCEdXB4g1B8wIbOFEnOFTnhD9O7rtAujY7i/ITK7QBExL
         leEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479519; x=1794084319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai8/m3ORx3SDFek14s5382kHx3xtwqviDFybZ71Yxpc=;
        b=jVRembtPQrEOWETwd3lpF+6UAKaX1dS5cKZTOMCn0IRdXAS1RZG1R0DQTOausVv38R
         6+vnkbVZ8CJedULvpjjj3DinsUvBd75uXExsK4pywpXsynfR7d2HdDKTjVFVdEzq91y3
         DMMx3TGaA57nJmeNRDKyNsPWD7WRilqLzzzAllKNzzvK79tjt3CmJrarfYYKTNat209H
         4LN06osCbWeRvRSKUSz06uixJNQof+i1BjhB4465w84WOXekb9qlOFfx6D1+QcAT9p9M
         /I0lkStwj01OjAWjKdXGa41Oc2MDDE3XUnTKHgnloZ+8WJl6436bA2iCYHC/BQOMsBuv
         hBUg==
X-Gm-Message-State: AFq9FYJgUergn4fPpqyQbDL0i1lcDxvwJ+VVvGYty+1f3ySa1wvCq5pJ
	dvrztXUwiSxecEwTscQH9xp2bd4SMAj259ciqj7aXstPD5cY3V0RjfiaKtk6B2GewxMPhChPrF4
	4kg9kErTmkrAYITk1JgbLdiDSLwdBeqri1lnj5ufULDG4wauFbD12vYL3d8e7g3Em+ipk0l6o
X-Gm-Gg: AYBFou0LPQ1kRUL2GzO1WMgTUPJBFkr0M9V3W9QL+KxPZtc2uLb5RaFwTd+RtakyMMG
	THfUD710OBS4mfhDd0jiMGL4h6l/vE/e6zRWawSy/36voETpWOSSfS9GQfZ0p24YpNBpmbIILVL
	2NAE43c5aGxWUjxYH8xWl9hkQt/l7wXC3SXB2L6T2SjhlMsm3DfSalIaf7CfrtUwn/V5KEv7OPX
	kqT6QhdUklrZDORR+S/WWfTViiUlx3dqzbEmBIi101BU4lUoxwqClTBDj2H7TLnwNUGMhs1tfA+
	dPPCA6yHZ+dU8+wwe1R3jN8d2D4H60y6edbcOEA3BayvhHaIbXX6aHu0nuyZi+946YdIz4SgKOo
	2PtoltTDRFveOlc8oFVnnYCIHbJEIbjdMtKQ6VCYI+C9vAXBwVgFkl7wPGAQ=
X-Received: by 2002:a05:620a:1a0e:b0:93e:95ce:539c with SMTP id af79cd13be357-94421584b5emr961471685a.2.1793479518776;
        Sat, 31 Oct 2026 13:45:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:93e:95ce:539c with SMTP id af79cd13be357-94421584b5emr961469985a.2.1793479518355;
        Sat, 31 Oct 2026 13:45:18 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.155.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm104242845e9.2.2026.10.31.13.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:45:16 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 16:44:54 -0400
Subject: [PATCH 2/2] arm64: mte: drop the huge zero folio check in
 __access_remote_tags()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-arm64-mte-folio-v1-2-a8bc2960d11e@columbia.edu>
References: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
In-Reply-To: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793479509; l=1038;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=wJzy+6jZ9FNUZA+CYa8tCkf+lYaM64n7ZqisEdf29gY=;
 b=pmuTULaOCJqENTjQZWYbUcM88382x7yBPaM69wtTYQIjChLdg+Xw7STo2k39LEOW2iJjyMrCA
 9E2Z5Ey/XGnCCLEEfhp55O31R0s88gukfg0g0/M7ix6SKPfv3smoAr5
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: fl4V-Wsws2bNOUb_fzF7cM41Y4bCUJb0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfXwSs2cxncj01i
 Xym25uOhz2ZmKIsrtFKztZksh6eY55GoE11ri3JqFx/HXSAKWC9vlo9PB/M/MzM24+TbTAgXyHy
 oq+kqdxScpGjzOLkzIEey6TC0vh7wwl82x2h4XgAPO+9HPnqUT4/
X-Proofpoint-GUID: fl4V-Wsws2bNOUb_fzF7cM41Y4bCUJb0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfXzzw3YYQmZar9
 zobC6k1SPpRz0PjD6u2tMLUP+KTwAY3oF93T/cbugXe+i/TQuGg/rqGcMaVyzsZsl4NqbadEoMJ
 gCkn0sLPoklPs4de4o0JpdYZ/4sfKs5pz0nR1ukQXqjiWC0j8afSVi0BT8jc3gE8mh3sWPIcarw
 cThB2fD/v3+oKENEyFdzkPGlCmFXYyZ7eKk46cBHRLwlSfkIKruPZbitkvCad6Gp1lPq2IzePHd
 OxG5fhckjJfuK+UynZXWHi2nygm5+/eG9QLVcBHdzIREchLe5+7/rbjqEN6VlAu0s9cvq8r8oLJ
 Qu0P6vylLcJjAZPSSK1Q4uEJHyX4hhChY8ScNavAxJ9TL1ZdaADnavyIvqsh95D0/aB497N6O7c
 5T/yl7bxyJY5leziKK3TYRyet4loXHi0iY0JK2JA6VYj6Bmc4ODvLkTHt+5kz27u/Adsr9pWpjf
 GsE9VX2Q1L8Vy0swdmA==
X-Authority-Analysis: v=2.4 cv=St8Fe/O0 c=1 sm=1 tr=0 ts=6ae6535f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=OyQKmhT2Qqi7aVZxTY5mBQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=xKJDtGlsPQfC2qmXs3QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 malwarescore=0 bulkscore=10 priorityscore=1501
 impostorscore=10 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_134520_456632_C85A62D7 
X-CRM114-Status: GOOD (  14.30  )
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

Commit adfb6609c680 ("mm/huge_memory: initialise the tags of the huge
zero folio") added an is_huge_zero_folio() check to the hugetlb branch,
but the huge zero folio is a THP, so it is never reached. It doesn't
need to be checked in the other branch either, as its pages are tagged
by __GFP_ZEROTAGS on allocation. Remove the check.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 arch/arm64/kernel/mte.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index f8d39e70857e..8615732567e6 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -483,8 +483,7 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 		}
 
 		if (folio_test_hugetlb(folio))
-			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio) &&
-				     !is_huge_zero_folio(folio));
+			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio));
 		else
 			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_folio(folio));
 

-- 
2.39.5


