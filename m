Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D874E60A260D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J1a/dc2r;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXsC2ItG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvDGp3Jo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=J1a/dc2rHy465Q
	hjoByFFlzcMRwIgCSD8MUAZv/yKVjyk4VT48v5wxG9EtGgmfTexWsIjpeJ2DvISS5sR6NEw6fBDnK
	7aE5N8od/mTP9BY2aK68JM4dDJO3Cs8VjTIbvwzeEIin0gEdUMvSsdc4Q1S9zZ9x3c+5RXW7B8deY
	YNcz/Aqb83i4o2QkvbUsoyRWe7FkIedjm2BqREOUCXCjwo5/7RWEV+vDGm4fvCdRscCVk/lXIAOdE
	d2HalWhkzeikvElIYjZmaXojqatq5JCYj9GIoRO2QFIym/d+TNdcCIoI18/mAIIVfV6Nvc1L5Wjdw
	PkUBJmVyRGBWts+YZ14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM28g-00000006tIU-1Akp;
	Wed, 28 Oct 2026 11:48:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM28c-00000006tGL-0tpF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:48:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2Da4154753
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=aXsC2ItG8FlL+JE9
	KAC2z5roNxozGt8CsUW+hq6elaEKAV/ncRmKYtMZPRCnPkDPs2TTuZ2OiGK+giQA
	b52xmXp2aIVv1zqXg4QlS5N3m5ab8Y8YdUaeRtgIg/hIVu9zpzJL0qUskj1AXMo9
	y6I3KADqPUEsGzxWv8wKderFC9PTw5zhGFUC1NJkuCQU/tMjHzuszpo3wlsS5nb+
	jYfWcgqvGgoLTHX+85QB5NOCAVt5SjguJ4+WRNOgeoHQS3+u9uzXjXTVjNjTShlO
	OlWla+SI/vc4PNEPHSSDOJ0oVZyi4lfe1Rw+rw8nogqigfJ+0lbfgzKs00x2aObz
	a8GDQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0mpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:48:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e987ec84afso8671665ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188092; x=1793792892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=GvDGp3JoMJA14h/CrXPcE89orAeGuG5gNv34QrBaBldQkfhVUFasO989uNunEXfdep
         ZrmSm7MU7Qv/KValb3GbcxcqAwsnKWLePFfhMe2C0PGdHxZa4kALQy4jYM/SsVHG538h
         JJoVibrKVJB3EwaTRhavWcs7NwulP6MNSlUeQbJl2auX4e+mDgAOG5QgMjKIn/itOs7Y
         DHZlmx5FwTD+wdOE3hPW7USfwZ2k0p7G3a0Wtc+9BHTLlKXIWgRAvJPHKyJHVfTA38vE
         JgUeHDh3Mye8tQGXXAzPXENeOPc9w8JXPlwWAZRyU/gd5lT1N1OYXOAX/F2LUD2IR3Bb
         A/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188092; x=1793792892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=k+SfaZgSpTAmekA+eroP0fRsAE5ZbtvCev5tmrAWAToRvkgGc8cHNGXzM+z42DNxf6
         ZyEXG4uNHbSQatX0mJw3CLHgbC5SSozpVAz3K7JxkYlGlkBzaHCf1J6uxEYr+Sg3zf3T
         djdp2hBb84ea1yXa3ANQsF7pBE8TDBiCeWU2LjPJmj5bv4MVjuDYn3FNCoK26c/y+Jzb
         wKoFYK0b2PXwlzZ78huR9lrcGyMWQcfNBkASTzh2IE8TZdUAKWABUcs4bfYl7uDvEY++
         Agxfe+pDIDIyPmhR17KmWjLxlOFNa4565yq0OWwu2Dfyt6zEktkItXYaYJBopFkpYJSd
         UbNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZiBD86cPsI6Eo/FZ+0WJuwrJ42qvc3tMDfOS5t1zhP3+XVR/8wy6Lx5VZ0NMsFSwYc6k4AZuk8iLSnJE24xvr@lists.infradead.org
X-Gm-Message-State: AFq9FYLeuUTdjIbgCyzKfbg671mxuUtWygKxgMOSoinzbv1RQ3sFqVib
	dkk2MaVclIlrkk66qvWgWU6ceaDy9lsFuVdmMxtlBuoQ4fgIUD4gJJzsw5Bv0r79E2ZRFFvQ7Md
	wUiIEgJcbOIukChE4G667vBOOK/MNTtUNDAJQEf86KK6/D5oH7KQBNe6bXOZni9zeGDsmhE1EDL
	PRaQ==
X-Gm-Gg: AYBFou33CL3CkPPASB1J9H9XCQeM/v9G25osq1G3bjcK/tmIAGhflSb+MQIS5OVm04c
	W8fOmcC9yioJFMt2JbnHMJu0eoEM7dvSVMSmTNVVfOrCP8vVsPkffkyt2wWzhv+pXzHdYpeb4cn
	S8zaM4QzK+7fs2qWi9a71fRdaYJNBEXkjysxFRZjbfFNIQCr2bg4090YLqEh5slGferhH7zBt9c
	IkTNHFcT7wA5gCKMerQEFc5g6icfZw/i12ZY+/biiEJ0tgXwJM4nbd10zjXdXsEqArXTODRO55a
	GNntBYT7lWPMxGHnLpWyuGZWzG4PNO6H2v0HSxEoAKK3AqiSKwbWiIQNKgTrryDPonjlBsNZPXU
	j3aISpza3LaxaqGou5q3YycyrZ4A+HGyWvvwdc9SC1Agu68U6iUIY6IhleDLFp2pcgC9uzo3lx1
	ywpZ4L6e45Hri3Vi0zguY9q+oiVjAa
X-Received: by 2002:a17:903:2c06:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb003ffe11mr18527335ad.10.1793188091890;
        Wed, 28 Oct 2026 04:48:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb003ffe11mr18527115ad.10.1793188091411;
        Wed, 28 Oct 2026 04:48:11 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:10 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:44 +0800
Subject: [PATCH v4 4/6] cacheinfo: Expose the code to generate a cache-id
 from a device_node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-4-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188047; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=cuphFizeBCUAPOmTA5mjgloZDLbPkPyZqyfKN0YBZdI=;
 b=n/XKEt2Df/QRRSl8LRoUZx320ZarsgT1ChUAkMLf5iPokWhJmxBSvVq8VNfkWiupCG8INUGKV
 UphnCzwL5k6Cf+mbzj5Cf+NoXIJ7fNZzyfax3mT22Nr/pOTnN1hhPEm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: mVPA0nSDi3KwrSdFYBnDAejppMVHFhpT
X-Proofpoint-ORIG-GUID: mVPA0nSDi3KwrSdFYBnDAejppMVHFhpT
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1e0fd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfXyd2tSAjmhlDf
 +BaecYGI4tzOgOZ8RWYMMSHDkOTgLAXfr7lhTU77NezKfR/SF4k/ckuqt3bMy6QrnIv9oocd+fa
 JZv7HtfIpj6hMyCLM2WEZa+BaMsnVY6l3GXJ8MNXd5S7iryLuuulD3kSSD+s7VnLOLc2VgXfkt5
 HVSJJh7tnuhHQneSGw3hPBp26Z3PqNhT2G26zW32lb2fH1Gh8gwcN2KwZyK16e29tesr0huFjbv
 M13sePEbAFYqzCnIKW1ey1B2gO9wGPm+WUyuSc1KPKA7NqiHEvxM0cj47UomGqB7jTcpSk/Ws9p
 M1z8kzVumNQtJqFzAz1Kok4DApZ5Fglpu0eJiEVPSN9q8ws07uu+TY1iQJuVG85VbeDubNlephR
 kXeAd+GwYeKN/hyxUVAdrqeIPiRU/8azbJjLng342Okio8F2Rk1saJJYiC0L1vTQQelnm47HHwO
 5n3AIq4ahKSNcsN0KHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX2bfNSPlUYVB+
 xCni+LJE26r4WiJHJDrEyA1KOw6g2ghAFzhMphv6zMytfc0aKLliPzSzCcXt5HoCsym4cEH8Jto
 bXIWwm9xjsUUlkoFHwbfVxOX7mQVdSA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_044814_414429_1A05207E 
X-CRM114-Status: GOOD (  19.40  )
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

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index eb8a907f6d50..a4b10f3a9007 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -243,8 +243,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -255,15 +254,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 56fa646df0d1..469d490968ac 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -114,6 +114,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+u32 cache_of_calculate_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1


