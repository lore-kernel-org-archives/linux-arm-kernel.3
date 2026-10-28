Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B0606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R7RUZ2DM;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRk+cJvT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KL/TyX9k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=; b=R7RUZ2DMSpVs2g
	wkt0LxQIJqPPRpTyOIZu3laY2kebhYbHJ0/sp3zfyTHjOre7uvSA0anG51ccR1EiYRYlLWpKWQ3Gd
	W39xOhGMS6tmtXOJNCHUI7nLr7RBc4EIj+qEm2+M7bbvToZjrGcvACOjuGfzHRzO9zxXDljr4xMwh
	SsSI39Tnjd7o79wxMHVrlBEEUOwntYxxNzA+6B7nH4mCY2OGA3My5Ek6Fb+GcJ4TWT827rYXW6niz
	7suwCFc+HZER/tTqjEqNC7ZavvIQEXrqNNX3InJvC/BC4DHC4ZPnUkFQqEhZIZ5g48P+WXg5RhpE5
	o5KGPCpWrgfHIdKb9hnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM28E-00000006t4O-3Doi;
	Wed, 28 Oct 2026 11:47:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM28C-00000006t3a-3Ter
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:47:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2gn1538933
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=; b=TRk+cJvThlrWvgUv
	rRTBz/Rw9AnzGLidu6z08uAbGk4UazAMri/Q/nTdPIfPe8hV0fBdjTKHzWdOUvA6
	SPNn8xzWgw3TVcz50heEgFer+p8rWas3ePyTTEaALZcRh96qm18UZtAmeWtpetOj
	qSWsXZ6ChUZzvjZ5yLXCh3NOf0RQLMQ9kiaU2NqANrRxLVaNjTYKx7PA0Tpr2c5Z
	4N6mrIVMPeA8iZuMvRQIenS6aV+kplnji6LuVS1Cp7UvxiCA76TrEjjalPZ/0wBC
	ojdt6StbSSxUMu4YI6olw05K347k+YDd0+zZ3W9OY5+Ze654i10JQqdhCqR+H43F
	hG95iQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rqkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:47:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so577273a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188067; x=1793792867; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
        b=KL/TyX9kiWm+jZt+PEN3D0mS54MpF4yAz0kmvYRJromHH+RauZMCCF5AFOFUhNc2lY
         1yrqjMM2d1CgG2ePpd4BAy3t9MD8yaxZvwWKCA1+n6c02d2sEDQMqiFDSy6ZFHqkvE1R
         0yYa0phNkZN0H/fgzUZalAoylJ6IRSraRuIACEFJ4TStyWE3dbM80jqVbVqMD5B1eTkM
         hVsvcRkHZAkFn0fQfO4WjhgmQySBzJX5byxi6OvsNcqOxJOWDNBwXsEfDpvhdee9C55Y
         HGvnpA35xvTW/otR9B9rlIADprgjpVDOWfnq1uelkS+ruQYAZfP+5HXhOkrARf7Dr2X1
         iQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188067; x=1793792867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
        b=BxlD7Dg/D8hVG89YYXHjw8bluPP12R3ETbFY4kLDfqU9AKlyoBZTLd0ynWwacSwkBd
         lPdfi0feEE6jSorLBt3Kc/2gRNx0fWnj681mQcdNcxgBGi5fFRsBJUDHWqVdHLe6R+G5
         81Oo+t0pvQqvRPQjMQkoKw0qRTZQK+5p2xIvpHhAO/ZcJpd88zJld9g+NayoBf7S2hYq
         sbZF7FKA1L1p5/ZwdXbz35RGn6bZbHJqkWTppi4VcEbLB9deVdPTVuPFZiEjvkzIxguF
         fQTu1IoL2niKATWoGq+BXvVfUAsGTMrUM91fk/kvB5cRGdiUSBUkIKEWuVEG+B8YdsHP
         X60Q==
X-Forwarded-Encrypted: i=1; AKwUvBwslUaYZcbZX37NeapSMsi3e8ra1COdlSjQMiJlp9ujsLxceA8x133AZ8y0YwGnCluKZ35rWWpbHW6aaXZfYZ8l@lists.infradead.org
X-Gm-Message-State: AFq9FYL7qaC4zjHuPoENknvsLfpOv4BY/5gGKyuPUHBT1XOIUVdbMb+/
	bUCfDlaByeQ+ZDgVHpGsbo07gfUShNcI828S1+iWq7d2Cee2PRWM4fMEKgdfSbT4hh8F1QdwK6z
	8KF7V97nrCNjhV79+UrUQSCjQ4c2jfuY2OLx5zZW3dR26Toef9wIwWDkaK5UROn4w01G7jE73NJ
	pt6Q==
X-Gm-Gg: AYBFou2O8oP4u8Snv7pzgvyvHNWL6QsluXPPUS03cJJip0YaugSWmTUrLw0SfZ7GV+A
	UTDK5SMMvepHtbdvLU8Y+lN+CvST1ctjrIaiBZjg616JfWUOkicT/op5E29NrBe3ybUxD1R9KTI
	69JS25j7Ch6t6iiqqJejIANgSYvZA4Czi+/HXK3zv9l0ocWdvjP7cesfp057jplvukW1A/TMsbj
	J/tQUaHhxs4eIAR8FRWUwCkirvu3eOc5Cu8/DvrpmEOUxNi9NJolznTOnlU/zkNBCFZLTu4I2ej
	rQzsnJUDQWSjyLfrkqBEkyI/a0UNw+/+lXUjULe1JcaI3JBiKP27PMUbE8VZ9dHEFmvtUHewUSM
	qNP4ID/o0Zs7eh92vSa/9LSYJf7/nBIpDCrXlKQxUYPOx9jBRaFULSU24mdPI7ec0ZusUxyZiAo
	WyaJMB/jyQycNR+B3D6Pr+yL0kugG4
X-Received: by 2002:a17:902:c94d:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb004b1de5mr18458405ad.59.1793188066534;
        Wed, 28 Oct 2026 04:47:46 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb004b1de5mr18458135ad.59.1793188065798;
        Wed, 28 Oct 2026 04:47:45 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:45 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:41 +0800
Subject: [PATCH v4 1/6] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188043; l=1130;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Fdpc/cwPO/s0yoI6hre67PeGTToBFG3hV8kaAFSlrjU=;
 b=UXyHBEaTAEOkqMTuwB7THPKdjj01ssGYxm/IfpMHdxA7r668oZktRwEdGTTMV42sxolaMW+xY
 FtJ+bPI8nSvAFSvvjAcwSSuLrsk3Jwr1Ce18R83ntKIzfGc9iWxpMzn
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1e0e3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: uA7lNbkBJ2CppbkV7rCK03Jx6HyTzM8s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfXxLUeSQyRVHnP
 lrGqDEHOV3SBVQdNK5HDbXjO5ev36JMlPHP4kDviknsaQhR2+LXSjwLUlZTaDffrGUWcrYmlSBl
 OerwsgL25KpTDRJdLF1duHeXqBC10HQ=
X-Proofpoint-ORIG-GUID: uA7lNbkBJ2CppbkV7rCK03Jx6HyTzM8s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfXxRqxV+bt0V/j
 9IDIY01WGPCsTTFU4TAGyZs8j38udWY7B9GYOE9CMWu8mrAJ+IYzfPFldj9Wo0PHdV8or3yquAd
 GI5EDe0i84QQnf7OSpB9LnmSFRCFfFkeWSUUs9RMORDCxY/5zevm9vjaQKSBlqkhDm2W75423HP
 IUIsFoBESBQC8Lqbl6LeyDVDQxAjFrdrVanfuYHY6RSvg90pBZKOEowe49feQk21fLWEjo/DHLZ
 P1Hv3t+gJ2+4R92Ea5Kec+ysK5Js5KX/A6qfqJWAiBvCaXWX/Vx6gMmHUgDNeVqiaABhIzg/jeE
 Y5z2uG+4+dIhNOqAKJwFmL+ox0mqQjWaMiEwM9AS8cI8Hh1rSu1qvri5DwNQcWMp51pweLf7ORC
 JBJSpp+iXunnFcfyvJF0oJ7HondwRTNBsxUB7Wxoqrf1ujBAkZnRxByXHGm/aYLkx9a5O5GW6Oq
 rchnINU5gUL1Qr6KCRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_044749_013208_CFCF3DC7 
X-CRM114-Status: GOOD (  15.68  )
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

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..347a5a6d6a1d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1


