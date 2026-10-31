Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ED2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lOtsPU6j;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=qkCp/46B;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=e6yIMPDh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ROwj3Rexs8Y9gllQWi0CYRPzJsmyOmh+Ba5Jprxs8nY=; b=lOtsPU6jt6eM5j
	yccBZLKBxp58n/YMS/Sdj4MfOwuLeJybSzVNAJoRdzchEW5Ap1kiItxY7bUtT9Jmqheay+1T417DE
	mSXFYuRDrOSMTz7FpVl2IgVahnLb/EKrtWtg+Sx90LbU7VH31kYqeeKitano3umYxEWIXDOeT/4UN
	G4geSUeKV97IZBkERhn0PcGrRuvbGiP09RF1+ADZKHyC/x4xXZ9FZdk0PDIDuUwY/5HTVkRpOHL+V
	0FvdRLbsrzUBsFpFI2HEzG82vHrfpAodXeLmiVKkWz8nQnOMMvRU4lP0B8X1Fn1Up5FY1VdIj0lpt
	8BZvekpMLTNd2VBs33eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNDG0-0000000DXcf-2RYu;
	Sat, 31 Oct 2026 17:52:44 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNDFw-0000000DXZf-1CvB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 17:52:43 +0000
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDjrSp558277
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ROwj
	3Rexs8Y9gllQWi0CYRPzJsmyOmh+Ba5Jprxs8nY=; b=qkCp/46BCbH/3caJFFuA
	BlnNlJICBKE02t0EV/Yl+Mf7VV9idaFusWRBluq2zCneN9cFuYDcUqf/l31dOHFz
	iQE/bzebwLC0BQlLbQFOhaGuXCSXB9ohJ+JrZhC3uP0k5aAlGo04caSUWLizbGaD
	Q8fyoMn/BtmmRGD76UAo0PUtJ6TOiHx5Ym7NhY0x+SFdXqbKcsz67KGCd+fZ9VEt
	0BfGicaIcuW0A06wOcyT3GRe2sXfrWAVc1vzKBHPy5ZgGVEYhfv99FHBHwW/CcLq
	ncYCO25VgOnxXlWsafpBOv2cliC4TAu2kei/Vw+CCZpk+X8ivtNyQX97QTFnLSgT
	4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hn9ccaup5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:52:39 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so374792085a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793469158; x=1794073958; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROwj3Rexs8Y9gllQWi0CYRPzJsmyOmh+Ba5Jprxs8nY=;
        b=e6yIMPDh5qvhiq22g0T5nrlIAfM4zOovNvXGZKMsd90Vlnq0Ip6eRHsQk+n/T1XpCW
         4dOnvQjES4W0u5Yx2Cemfr+NGjL3Kjx70h4MD2TFZAmePPDrmaL6bQ7zfBzmX4Ir0kvH
         HZ47YF/gHh4eYgWI31LYrZoawsj33ThaVv0wUs/AbPkGIWiHf8qBr+dUZNhtoRtbaQ73
         Y2SgLWSkvEtcIp75QYN6TOABD8m1q38boUhCC0J5R3of/VAbQoesIBqGCs98K3yas4l4
         ScAg3mRwGwSW7QZ/Hiwjmr3UwNNYxWwcLKd7Wiw8OtTVdRdMjFiNPhidV3krMtqA1NUU
         8MzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469158; x=1794073958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROwj3Rexs8Y9gllQWi0CYRPzJsmyOmh+Ba5Jprxs8nY=;
        b=ntjWYKFxgmBkwyByULo2MIpz5z5r6XWnWe+J+ENcY/oud97O9DBzbZsZRnW4A4EkeC
         BS1lAv//mXAOr58LrxEdh1xJbZBfw2VxMa40u/vDGi5h/ulPbqwvku/Wr68fVmF58Wj1
         m5sGYZjqowddXvJFs81WYtnw8jLYKiYD6uh5lQ6bByhPZ6/RoFJiKHnQkPq2Ax5ju/l/
         eUZ/0U23B9gScEsmMA89B/I4AFRyGqujXvkHlpxvjQJue6xDAAqyrWSubK5NYtOyH50M
         fsRMEtbtIlt1jCMp4jOn6vQVnxzPhAlNxC8v3BRvEUCVLWoDguDZ5aeWRzVn+/W9SQAZ
         rucg==
X-Forwarded-Encrypted: i=1; AKwUvBz2gwuAb9BqUort1F0fosGm+Oj7RhJapaijsFl9DBGZBP/70IA9+bmDs4gGsG+u+ErQLb+Xh82KlwflUwLpIuEl@lists.infradead.org
X-Gm-Message-State: AFq9FYLIeYKsSTPT+cNiZGniYOZWnp0FSzkR54c6zcE1+UrHvs9ylbIw
	tbXZRozWR44GJofhMVFfqISvIsi4o0peSc5siU/YZOsZyq0GeMJWNpi8nVaj1M2199pBfFzX4AF
	TQ8kejygKhubi17y1UbXobTlVpfQdrix5doXcw6RofTJXXtYua1pdNGlkLn6FWB2X8F6Io+bw
X-Gm-Gg: AYBFou1+Y/QVRCOEJLdVRj0wGfESpoHJmO4ZnxQKfg4pkQqXRJk+GvQz9pW1VtF2nH+
	D4FOLtAS9Pu3l5UlEohoX6b1lAgJOjXdPk+ujg4Z80bAVd2zDp+EvatF+GWepmtsGcHH/hy8DTo
	Hl7kN+qfQcsh7R3sQK2onrvP+x1BPxlytCyM7N0hLLKUaweEST3KiRZ50KVD73JJ/Hz5rlarNyd
	bZXbDgV59yio1hAUHTrUaIIZ8U+b/9AofGh6KvhJER1MIKh0rtWhmdTUrv6BWqq7bK9F4fiYkJ/
	gQzE/tZbQouByYkgQCXLMPrMrk/2VvysRJ8sNhFeiEBLZM0OWZ85EceAVMWFOdUOksMC4GgXy+Q
	BvbFvV30VKfsAs7ytijy6g5j2l0/Uet7qL192cjyHHlSPa9zXPoJ0nhJqrw==
X-Received: by 2002:a05:620a:440b:b0:93e:c12c:f127 with SMTP id af79cd13be357-9442187b1cemr848579885a.83.1793469158691;
        Sat, 31 Oct 2026 10:52:38 -0700 (PDT)
X-Received: by 2002:a05:620a:440b:b0:93e:c12c:f127 with SMTP id af79cd13be357-9442187b1cemr848577285a.83.1793469158126;
        Sat, 31 Oct 2026 10:52:38 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.159.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm249158315e9.11.2026.10.31.10.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:52:37 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 13:52:08 -0400
Subject: [PATCH 1/2] platform/raspberrypi: vchiq: pass FOLL_WRITE to
 pin_user_pages_fast()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-vchiq-unpin-dirty-v1-1-632d3f1281e0@columbia.edu>
References: <20261031-vchiq-unpin-dirty-v1-0-632d3f1281e0@columbia.edu>
In-Reply-To: <20261031-vchiq-unpin-dirty-v1-0-632d3f1281e0@columbia.edu>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793469152; l=1086;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=764Onyu+ULetDc0aDFVUsgf6G2JQGNpiKKz83VozlGA=;
 b=d+Aavx9jgZQmcn0Fc9zP9OeBSSQKOcCNxLSftJiDc77vgq/4fndx9V0ZAUcCyvkSwTV/LT+vI
 soS88tO8T0sA4kpFKpxWObAIRYb/3qiKPqgCkO7vduO28udqi2XSQpj
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfX+v38orF9voIT
 yxh5HcMUxC0S7BZt5iSjSV2gu4ETJX7FeTY5CgBXkviaVRNg/uRf0jCEVCWUNcYXOBu0oThyo2F
 ORoEtlL9QIDNTmbuUVJaXkbhI3Ycscj19vpEfWAlYCgOVUcDhn5A
X-Authority-Analysis: v=2.4 cv=ZIxCCn7b c=1 sm=1 tr=0 ts=6ae62ae7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=P+xgYyhW+KadpqoI50EQPQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=qauuUkPFoE-8jCmVUdAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: iPoa87JhMSITylwJrlyVfqG5VZgfiUAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfX1xbqOBKL+oLo
 LOj8Ey03D0cdzSviWHxATtYTRcDDgIj5KpLV4noaRorQObCpDP0jl/eth5m/TYLj7x859CoahV3
 JMYIgdNmPUVGUQ6Yrbd58zQYpIX3aUYCO3JtSpY1aqifqIlNWkWSHr9Q7KLG5jGPnPkH5HeZ6/I
 ZsRJ6ICv2QZfwwhiH6th+D/cj/cpeXxccZVbEg+6oyJT8oUxGkbsUCsYbouP8NP9jIfTRhJ0fat
 SfwwJTQmWET/0eSRpZTJBMpZv1MZXq6egYwLJKvS6xUAjGhYX8CNUv8XDIVYBf281k474loJ0z3
 xXhCBQoiR6pP1VhPXDXjPGKwHXOwMO8TIlnRZXjDKuaWo1UQMbB4mzjOWe72ysE3kZBvZL/oGjO
 qZLK0ZKVTad3SSmT+A+n7WQfWXLcTsB420cprivnqIrnU1zYgTcSNXlEQeRDwicYjy1/USXlIQ/
 BSFnN0P3q/k4OleEtDg==
X-Proofpoint-GUID: iPoa87JhMSITylwJrlyVfqG5VZgfiUAt
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=10 phishscore=0 adultscore=0 lowpriorityscore=10 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_105240_436239_435037A0 
X-CRM114-Status: GOOD (  12.63  )
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

create_pagelist() passes the result of a comparison as the gup flags,
which only works because FOLL_WRITE happens to be bit 0. Pass the flag
by name.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
index 48d6b1d74329..3ae4ee2973de 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
@@ -1592,7 +1592,7 @@ create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 	} else {
 		actual_pages =
 			pin_user_pages_fast((unsigned long)bulk->uoffset & PAGE_MASK, num_pages,
-					    type == PAGELIST_READ, pages);
+					    type == PAGELIST_READ ? FOLL_WRITE : 0, pages);
 
 		if (actual_pages != num_pages) {
 			dev_dbg(instance->state->dev, "arm: Only %d/%d pages locked\n",

-- 
2.39.5


