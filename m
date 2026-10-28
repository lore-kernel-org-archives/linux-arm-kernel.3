Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F84606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mi3Vk7P+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G9EIYHDe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjQc/S4R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=; b=mi3Vk7P+xGSbdJ
	z5d/iU5KLjUfLH4H+boY07+h3Pi/4xgWYx01dwuF0nOQ/8gI7HHXhKKC2JiowCHJpxoWMr4HjKoAC
	CHGDMkAspwycYnOzoKW57T9VKTkaU4VaXBZnYl6eCyYv0aNCL2Q0uiUqwTfNcmT/cAyZ+Me3n3pdg
	aTuGdwJT89gruSj2yGFPyY7y1PEayQwHycJdKwD8ZVDTjOgOrXnQDPDVCKDu8QbPt7eDzlWKKywum
	RiMDdpqrR21yvR7YLBrGdCSev+o8+PRCKUD0O9sRXEl8eIVMo0L8XHIeOECcGLu4vdvf5mvKfOfce
	0JLGIMJxEngpyUc0TFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM28X-00000006tDY-03rN;
	Wed, 28 Oct 2026 11:48:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM28T-00000006tBK-33Qb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:48:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdrWh1011753
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=; b=G9EIYHDewyZC9pXP
	3ju6CGwJZw7Ujww1sHYT+7aynqaUpNLbRZGPsv8Tvphc+FWzrHLfL2hTrN2KckI3
	Oszeg5JA/y98c7nOsW3wXj7f6I+CFMreOCcM8TaPc/lg8vF7HO8WrzxPgdc7bve4
	AiwMrBA6PCatm4XTdvgsmU0e/NJCFU4yA9k6D+7gbtzTSPTsl3KMoIG5Z++jQC80
	Rdp/2OBbHcZvKxBmx2y74+SWfwPvAJVW6zYX7ny3q0Shr8cvTOA/8UuYPjjQ9GqW
	FHsT0qT5Atlr9KEjg0Yq0Cb4J6Zr4z83MwZIE0nZKKFplvzyBA0UsxBPXL6kdAUV
	fPOT1Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehg84w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:48:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e832c03576so13533415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 04:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188084; x=1793792884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
        b=CjQc/S4RvyuVh2Wp6eRzrIsZytA/osQjtUr8tsviawsOjJIfN7oDFFRMGWJCfw0BvB
         u5z0d6KOPNZBefq8gkPnZEjIdvSS46CJHesUGBRsODCjXm+3tZLE9AtEOw0ABuV/BY/e
         HZDDC9SfNNTfPOCz868B3aBnzVax/3k1k9HeqjRXUyxV9J9VBVsg0zSKiVyCLZHypHdv
         eL5SaZKN3Kus988Lc0WI7d0BAkRQniYD5ZL16PNH9K8B3+1sX4e4vaTmGN6jlM34HyCS
         06/ODITP0kCMx3exC7ymnkqDwHb6uvv5QLAxpaxzBgLG3Ko4OXS/HabajwaU2NOGuXC3
         r82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188084; x=1793792884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
        b=HVIhBZcez8j5neqA2ZK+mIB9bls6wMAqI6aN1PQJejmKfQWYma6jGJJjFwWaxJOsNC
         GeFc6DCYfFRAMMtjuWILwoxjlnYHbk7Hxp8KE5s0RqVn1ZFgPn8mjSg6RxQa+nVCysBy
         +ef9gOz0T1MGhhWUx4LAA+Ke2OnE2QuhnATWJ5tOMYKrqxUjwtSyX3pG9r5AwvtARP0t
         fHqMMHFDaA5UfI90LqqvBYXC5R6F8JJIgFhz7vgD+BF/T+Q5ZPEEm7/0StLDJnswVoNA
         nlpr7bgSVU+i2spAoOa6BORQ5ApBvhgUfuJH9zWyYZZq6wPQ/mMuLCVKjMqZWjnSoBfT
         H8Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwpV4mVNurB+c2sSN34IvUGug2TxBYeyZ7mAXxG9JaZ/JCR/ZH5HV4AbJOOjWRCU+2B22kSoEtzHoBTPtsxnk9W@lists.infradead.org
X-Gm-Message-State: AFq9FYLKePh8vv57WjmmlTPHwAZaLhTBdEeBqKddaxhb9dOT3bohEzQx
	swKBURS9C00FhGglFOEOMoY3E++u34gXAUyQABUAN0hIcn2oq0MXCfoU0VJE8Cwg6aIhemJ7jLn
	4oks7M2D26/vcH6FNcgm6oUJWXZJ5uDgX0ZuG72GcFk/zxpxZzkJGxSAlYALD1Y88W2TjBu5KIT
	vu0g==
X-Gm-Gg: AYBFou0qRdumb/IC+dg/o2kpXyWcYMCZ9wTBX4a8UKyJJRDvqy13PPL1lKFEhYPeY7L
	uP1At0mDL5M+KhZfXrbKS1XvRLDleNlXeHH77DEF4ActvCoJnNGPZsZiBMKT0zHb1w4cCGMzHrX
	Ay3SKtXgpqOhwqePO0N767UVRkAUayu7aSNPYxSlUv9UPV+dcKHAzWDGBewm7he5oyalVAXo1gX
	Ac8fLW+b9wnEYGhg67zWrnyZEonACi1TKktiA88rWDcqPbP89C6+zhjFziTKPuYGlYIDj04jfrJ
	tnrjsoh4lOMHyD/9yTjanW5EuT12UEsgUkZ184kHMBqS8vwmfy7TrVr3QsQSzkEQRVDQm151jl+
	3IpxJKmud0z2SFdWYJBzpHXNBChjtaDEnmH1den0a4/7KEKHpBpSnszY+Z2vb1rl41WHD6QVRgF
	Yu6JdRqGJ+8801tq/+vOpTcVtYIi3A
X-Received: by 2002:a17:902:d4d1:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb005a650emr19174865ad.59.1793188083561;
        Wed, 28 Oct 2026 04:48:03 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb005a650emr19174475ad.59.1793188082951;
        Wed, 28 Oct 2026 04:48:02 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:02 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:43 +0800
Subject: [PATCH v4 3/6] dt-bindings: arm: Add MPAM MSC binding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-3-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188046; l=3009;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=8PN3jSMZ/mskk1bxkWM3cKZzjFP8ZqH1EBcyaOMTbg0=;
 b=QWyVLshjnniVm9WIuAHK9RFKC1Ym/nBG3lrXTz4mbtssrfXDgAXVJPOmpEbKpFuCoaLZgBk2I
 SFDmSOAvOcGBmxG5nLAbhKzjZmoTp9mAxYBABXBUI5GwlvpR6riun1H
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX5M/nVu1G7dzF
 OTwoAlU/7WyVHwLgn2MRiTT3uWHL5SR7QTCc8zXhi48FXzQBmAND6W5HNfu7MuIgH3wbXchN7hq
 Q9tzd2fNM9X3HaH7XntIMCTFXRo7BnSQoiRyt7/ua3dMdKAKJJa+uUgKGiMZ7MndgehqJKaA+up
 BHY4X+9pevwxVm+hkKtIMbAHUU3Um84Y1dwlkMTnE5xaN6TE6XB3UaJlE75JIMcl9bayWnPHlaj
 phMkEkBnaCvyhkyeXzK/H/64NQUmRMluFfJTEweVlkX9fF99EVXNbpJlK0DHG9S8+WZseBtsV8j
 Sh08MS2UXQRXDueWNYs/6xpc8H1mrTaKPIR8YMkc725Cn6JEMANp7xK0ffG8t1+3T3sr0z9Lndc
 JY2AgRXnWmeKX0LY4d/f3Hz/cUq+WXe7fcDv7YWMidZgF83l8u6pO2+Q6ZuSv328t8RntfpgUGh
 M5uT+Yf3F7TGJ6hXLJg==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1e0f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Iyi0AkbGYOnUpVGOj9oA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: wzL4WVJ1WPDnf0-8w3j5tyzHG9Vdwe2M
X-Proofpoint-GUID: wzL4WVJ1WPDnf0-8w3j5tyzHG9Vdwe2M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfXwJIETlSXY9Xt
 sypJDMIBs71NKEW5JrUyyCtOtV0SKdtVuM9ENJQiEBWC7/H1Vp1V97gd7V9JbY0U8dTSpf4Pi6/
 A7y28klzN+mqrvWc54v6JIyawqW+l0Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_044805_889576_A64B2426 
X-CRM114-Status: GOOD (  17.48  )
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

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller or cache
controller.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

This binding covers only the properties currently used in practice; it
can be extended as additional features are needed.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: fix schema field order and yamllint spacing;
  fix example reg addresses; reduce to minimal binding covering only
  properties in current use, dropping RIS child nodes, memory controller
  support, arm,mpam-device, cpus and interrupt-names ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..523978900d3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+properties:
+  compatible:
+    const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+        reg = <0x0 0x30000000 0x0 0x2000>;
+        ranges = <0x0 0x30000000 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@0 {
+            compatible = "arm,mpam-msc";
+            reg = <0x0 0x2000>;
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+...

-- 
2.34.1


