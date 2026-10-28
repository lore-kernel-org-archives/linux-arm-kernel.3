Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A78606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nsj8fodW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKTUYAx5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ltg5mraD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oTRZog1W0kVUlnt0eMjHj8jyDlXn7iZFi9ARBq8uKVw=; b=Nsj8fodW24PCLSoetHmqb2beWx
	sox97SEqFvC3Qt2Wc9++yyceWDLKXe8DrmB0CVVsnrGJPYQf29MlVdX8agWHq/+1AvKY0jIWs8jwg
	2C1wXZoIDa7lStUQCag2NFG4c1X71eBKogH/V8C1TjLDquzF2EeW9j84c1cTbB6kbgVDMOxgnyFgr
	9EIXvj8XgaXc4dr6JtDUPmUz4CUQdZQHEF0PfkuIr5a6Qo7n3mKpLI2dB55EYB4zKwzPB5GrTb3GS
	/nqEZIgAo6wfHAlqpQr4zIAUgPJO3fO6h5aNPgwoPUDkIoy2pOPE9jTAn60sTfuXpn02xHfEFLZPx
	sGbh5EGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM288-00000006t2H-2DAV;
	Wed, 28 Oct 2026 11:47:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM284-00000006t1g-0APV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:47:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe48b3704227
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oTRZog1W0kVUlnt0eMjHj8
	jyDlXn7iZFi9ARBq8uKVw=; b=oKTUYAx5YsUyPWrcDOxB8VKpbu/Zdb/STd5uLP
	poDAyMcuzJqWeHzTnKTJspnUGidC5pOUEqGa5gMMcJkFBP32BD4ZmmHFGfBK+YYI
	ss23Oc2Ggzn/q79T6ZkpOFqAf0RSt5iha5Q7cF8l+EBxPh4juzlr8Ai4nLd1Tbbi
	Efa8WcPZS+CyknuxfGGMsSRn3SJvo/8+HKptEzu3a6oIZLGAUIIco6uur7rZFy1e
	jYmV0RWndXTkz6U75er8buEfKOIhqV9KcmRrpj6Yj4ekBkM5cnFmNVrAZdHY0Th9
	6VDTJlHmksxqTfwHAsP76YArSLtUiN2v9RCQhYlQaoUJLHOA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy7140f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:47:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd8b7226694so463830a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 04:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188058; x=1793792858; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oTRZog1W0kVUlnt0eMjHj8jyDlXn7iZFi9ARBq8uKVw=;
        b=Ltg5mraDsAON2PJmLG/ERYuIyAUq8LF6kl6lcV1dAsX89lxLCVUjIwmnHN9Ebg1beN
         sCXIsQvjBBPHbkoX1xJ9lbQASvUlDW5Q9gGBsSANDYFbICafRf4FKuK6Eyush3QN2lrR
         6vLVgQvbXf5luftc9KprYaye+Vj+CeXCaKOy4xLDS8bo5JbcnhqJl+ItGeHj/f/3NS6x
         NrSaKNxZTcn0mCYkpFAm8iamYm+GUCBiisoYDz7KQjZMysv+4CA05whUi3ykSaQI8z2A
         5qxP/Q49K3IdSL2aNIC9asfJEBbq/vHnuZ7u7vm28GS8NS46kdLMYslodgcDL7OTqTWM
         PETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188058; x=1793792858;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oTRZog1W0kVUlnt0eMjHj8jyDlXn7iZFi9ARBq8uKVw=;
        b=DCpM2uAzS+C5Q78KC4V6XIKW81IuztTc5HjzXp+nGlojI8o6VrE+e0undpqINX9SXU
         kmtUevm9gpz3j2r1HWjMy5aLku8SRjQLpd7OrhIhnUwqkCuNE8HfrNSonEMXjgMW3tAK
         iQvDAOuhFNnLrrIYtlM6Urfll/xCEGZJPraJhnO77qci7tLRaEVTTXfQIzjjA/udgfx+
         6Mvadr3H6WHTR/aeDeQKJVPJqEowijGYevPW3mVEyh3dKAyhr9pgMUWwTGgoDLWCxcwa
         o3K2ftLx/jThM0QS0FyTwYU4S/5BeOHuTowI6iwjA2gqTnEPc88mWi82cc48j9dzPE0f
         thaw==
X-Forwarded-Encrypted: i=1; AKwUvByJ73icCh8EfpCb9J2zGjvqW9esSnSmNNcEs0lWIFzMxCO84e4cCR98Kyl027hv3PgcikcnJ/0Or2bcYhqTen8w@lists.infradead.org
X-Gm-Message-State: AFq9FYIufG4esM/+b7E8fU72m7kJ/+9HvouAQah2AvKsEzRlnYa22bcm
	H5xgoPlN5fHajBFjyPV8ClT7uN5fFZmYyzPnuUYDqjN0MLZcBDWJTDfRCChMfhS+U8nZzQlJNp7
	r+h1lhuaYUWV3q9LLZqQKIh1XSrArI8S20QI1H+E+2gVXF9dYdsEt3IoKja/zv9IxJ9IL28c17u
	5+Uw==
X-Gm-Gg: AYBFou0NvsGxEeeAU2+CK+KDn0cXlFD2jKew7K5zZ3H9+Cw7pj/VRF1Lez9uUW7rVyb
	xZiEls0mZ9gXFlWOyKHu8AAnIiaFQPBr8/tBz/XYdUVrh6sT4aqleR2VBLhJbc8SmjJrhsT6rMK
	aGJx/iUOt/Xm8wWB8/yzU0PC1syypeladUsvON0eeofa17R6wxLF0+7dCu8nzQ8mn9CVN3EVceG
	kP9/riTZpsGV6PegnabNJ9Y/HXawHc4/2pioAP5FeHw9xktMXYr7PqUY5Y3F3rS3UOm4ItAIgKe
	MZSOvyXchNuOKA6PBz7FHvDar4up8NCAjuNoGZM4eIYPq9eskBLTkdCvrC2c3NF0wkbxAj3ZgMY
	23fNZ6FzR6sT9X9tw3biW9zElBV3a/6rVRonXxpImZmztQkuK8i4DvRUtu+s2SdQihChuvo1/L/
	s6siqkoVxqeUICFSKXbqdFGwPFj/F8
X-Received: by 2002:a17:90b:46:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3ae5824195amr1544053a91.59.1793188057812;
        Wed, 28 Oct 2026 04:47:37 -0700 (PDT)
X-Received: by 2002:a17:90b:46:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3ae5824195amr1544019a91.59.1793188057285;
        Wed, 28 Oct 2026 04:47:37 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:36 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH v4 0/6] arm-mpam: Add basic device tree support for resctrl
Date: Wed, 28 Oct 2026 19:45:40 +0800
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG7g4WoC/33NTU7DMBCG4atUXuPK/41ZcQ/EwnYm1NDExuNEo
 Cp3x2kl2EA2I33S6HmvBKFEQPJ4uJICS8SYpjbUw4GEs5tegca+bSKYMOwkOR2zG2kBDLVcaF/
 p+5QpzjmnUmngug9BOuVsR5qQCwzx86Y/v9w3zv4NQt3I7eMcsabydcsvfPu7lzq+X1o4ZRSck
 fbkwfXaPiXE48fsLiGN47EdsgUX8UtarvZJ0Ug/GKO092Iw+h9S/pCcsW6flI2UmlsThFfSD3+
 Q67p+A5CpaoaFAQAA
X-Change-ID: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
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
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188042; l=6430;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=gXJ2/d3OTcX+aSWArZnGPSQLM1rYFhxCK9CnoTgH7gM=;
 b=iR4QarYGhjfQ3RvWKyd98W/aRgOpf+uRlESlrJKRESx/NzzxuHxqdS2xXLz64gm/T76FXFwzm
 fD0w2wFvPYRB1RskulgaVc/9T/a/5RGppIHARSWAVfw9/maa0YBF3Hg
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX+NKdNEAUcmxX
 bzsou9g2CLZIb7gFyO9mccDcDzbSPx1RO2HnsiiBCuyDTfrgTFa25Pwss9PBjxD4qtXi6kqq7ZV
 IrW+DrOqEJApzak9x756sVW9s8+ZkcuNSgqFKVCnJs5QxkyKkdWcPj8LKxj3QxSczIZ7UWQDh9m
 k9TnDX6ZVqBFrgXM//EqfmFrmtG3GBIPq9Lg7j9i0JY91mM1TUMQ3BepoEGOhvkMvUdZlozbNHT
 mDoRtkV2aXcGrN4dUD4qLNHcUdwFvrMyY8Ch70Nag3JleUU8UDunLGKBOlYOiAGYtef0E6UZ1cf
 LCAqgUiDkqtT6M4w73j9/yAIitlQNvqpDPHQaMTh08Yw0lvLPCEDDA9YusUoDc2YqwsZbWs+LcF
 +3KdvM93r4h3NubrTi2ixCjVPK30IfBgue87kh26LbL6XHNgfSJ0XYdVWNGhFWh1LAIXsnPhSw7
 6sFEnoMJ+ZrSgH9yJEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX2DhjCOSNxt9L
 c5MTOLbOZ18hCBs+msPT4fOPrVfGxrLMuUtWIJROvaXkatDXn8hnhzm1WW0mDvq8EzsPjh13cHC
 MaSxtCPxFahDPx0FAGbfJLpkOZbrJrk=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1e0da cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=7CQSdrXTAAAA:8
 a=Ikd4Dj_1AAAA:8 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8
 a=omOdbC7AAAAA:8 a=JfrnYn6hAAAA:8 a=663aHFS58uk1Hu7jYysA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: -ffNIWc17g_0CUwut5spReUv6wW_JDBf
X-Proofpoint-ORIG-GUID: -ffNIWc17g_0CUwut5spReUv6wW_JDBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_044740_086102_50DCE68B 
X-CRM114-Status: GOOD (  21.54  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Arm Memory System Resource Partitioning and Monitoring (MPAM) with
resctrl requires device tree (DT) support before it can be enabled on
DT-based platforms. This series provides the foundational DT binding and
parsing support for MPAM.

The patches are based on earlier work by James Morse and Rob Herring,
with fixes and additions on top.

Standalone fixes to existing mainline code (placed first, independent
of the DT work):
- arm_mpam: fix the RIS index range check
- arm_mpam: fix the MSC MMIO window size (off-by-one)

Inherited (authorship preserved, with fixes noted in each patch):
- dt-bindings: MPAM MSC binding [1]
- cacheinfo: expose cache-id generation from a device_node [2]
- arm_mpam: device tree support for MSC probing [3]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
[2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb

The Kaanapali DTS patch (marked DNM) is a local verification example
only: production firmware does not expose MSC register access to the OS,
so it is disabled by default and cannot be upstreamed as-is. The MSC
register size is 0x2000, as the Kaanapali platform implements MPAM
registers up to offset 0x1FFF (permitted when MPAMCFG_MBW_PBM is not
implemented). It is included as a reference for other platform DT
authors.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
Changes since RFC v2:
  - Fold the binding schema/example fixes into the binding patch.
  - Fold the foundling MSC fix into the DT support patch; remove the
    unnecessary parent cache availability check from
    mpam_dt_create_foundling_msc() to keep it consistent with
    mpam_dt_count_msc().
  - Remove the #ifdef CONFIG_OF guard around the cache_of_calculate_id()
    prototype in cacheinfo.h.
  - Remove the [Yin Li:] annotation from the cacheinfo patch.
  - Rebase onto next-20260918.

Changes since RFC v1:
  - Fold fixes to inherited patches into their respective patches with
    [Yin Li: ...] annotations, as requested by Ben and Andre.
  - Move the RIS index range-check and MSC MMIO window size fixes to the
    front as standalone fixes with Fixes: tags.
  - MSC MMIO window size: genuine off-by-one fix; the ">" bounds checks
    include the access width and are kept as-is.
  - ris_idx: validate range after of_property_read_reg() and keep u8
    downstream, instead of widening the call chain to u64.
  - cache-id sentinel: keep ~0U notation, leave cacheinfo.c unchanged,
    replace unsigned long with u32.
  - Convert mpam_get_cpumask_from_cache_id() and the cache/component-id
    variables from unsigned long to u32.
  - Fold the device_node refcount fix (of_node_get()), reviewed by Andre
    Przywara in RFC v1, into the DT support and memory-controller MSC
    patches.
  - Drop the "clear mask on error" patch.

Previous versions (RFC):
  v3: https://lore.kernel.org/all/20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com/
  RFC v2: https://lore.kernel.org/all/20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com/
  RFC v1: https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com/

To: James Morse <james.morse@arm.com>
To: Rob Herring <robh@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>
To: Jonathan Cameron <jic23@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: devicetree@vger.kernel.org

---
Changes in v4:
  - Reduce binding to minimal set covering only properties in current
    use: remove RIS child node support, memory controller support,
    arm,mpam-device, cpus and interrupt-names.
  - Drop memory controller MSC patch (no concrete platform user).
  - Drop RIS accessibility patch (no concrete platform user).
  - Update DNM Kaanapali DTS: fix node names, compatible, ranges/reg
    format; use 0x2000 register size reflecting platform implementation.
  - Rebase onto next-20261014.
  - Link to v3: https://patch.msgid.link/20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com

---
James Morse (2):
      cacheinfo: Expose the code to generate a cache-id from a device_node
      arm_mpam: Add device tree support for MSC probing

Rob Herring (1):
      dt-bindings: arm: Add MPAM MSC binding

Yin Li (3):
      arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
      arm_mpam: Fix MSC MMIO window size off-by-one with resource_size()
      [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

 .../devicetree/bindings/arm/arm,mpam-msc.yaml      |  52 +++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  52 ++++-
 drivers/base/cacheinfo.c                           |  17 +-
 drivers/resctrl/mpam_devices.c                     | 254 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h                    |   2 +-
 include/linux/cacheinfo.h                          |   1 +
 6 files changed, 341 insertions(+), 37 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98

Best regards,
--  
Yin Li <yin.li@oss.qualcomm.com>


