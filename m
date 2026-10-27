Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211B9606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mf+uChRu;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kendgb81;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CpOdAmzK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gogy6K4mHkApebhkUBNBSa8MX+km/CbZiAD1dzn6BOk=; b=Mf+uChRuRKbBG9wyxKt+XFOGuM
	w99Bbaxt/EloUfavzK+3Tbba5plDsZ/syRIojCDiadC4gNSO/MvsrZa+kRSyE5qFFO/A6atslRsKx
	qHY4Akgk0EK2U9Dk8GW7rdcJjzDR//MTQwaYkVLctKeoUCBi4hUwmbQ722L+c6mA+R29q+tWP3PnD
	9N0aBEb5I1bnszEibMdy66kW7BKAbJh8nNyxhv+pibSa5LpyP1c/fiFQSkiXgkzi1E53IjuX0gsJJ
	BbmAygYi3lDGGCxtHc2F0oIpgHwFQdiprrFqAoMeSVWaZR78peMcZ8MeYGRiHpq1ip9rZDnSb0KBQ
	jzM4PLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhXy-00000004vmy-0mWr;
	Tue, 27 Oct 2026 13:49:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhXu-00000004vkZ-3Mqg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:49:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3ff1935897
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gogy6K4mHkApebhkUBNBSa
	8MX+km/CbZiAD1dzn6BOk=; b=kendgb81mmep/bYskIEz2TaH/+8gari5zUDnUM
	l4OzLDP1YMi6b7/oECUovafhPY44oIAqGpo1CKoOs67WAJOmwDBBdEZr5nS0nXTO
	eNFnjOjCJeMF8ZfmP0bb1vr6NTO2eqDthyejVB44FFpZOmvWcbTdAx9RzX5jL7Yt
	ylPs0o6naSYjurrf/qN9TgiyMqheefsrnXdtg0TuzjEDKW+x/qhqijQgU93hEkr6
	ctgdJVmWHJ6CevI91z9q17KIbT5bsCUHg/ZXnWOChLoRvkhOMKFArWycBlEfjp1J
	7yovPzFx+2MNL8e7fziPZlsa+tNo1QFNl581PJjQST2Epi0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavu54h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:48:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so725207985a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108937; x=1793713737; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gogy6K4mHkApebhkUBNBSa8MX+km/CbZiAD1dzn6BOk=;
        b=CpOdAmzKaGt+IaaPITmdqDnzPaDmR/Hmfaalh70MOevgjdrYdAn0IK3/7I/br3APhD
         Y9PXdfSVcBzC9tgYqWoV6L32G3cHaCf7s20Su+T7I1r/6GVQlJv4IFG8q69XC+L7SxLT
         O2zHFO+R9Z+hOBXe1phUuEKewQC/yCasXImNV3TISZlw/bIcloJrO37h1kTqXoXXBwn/
         4CNdrx5vMT9fCtVyANLXloFBbTV0PyAq2NMiMtU+I8//SpLJ0x7Iw3LhAi6ZqcsLMP0t
         kCkLhbl2dzzsuAcx+w7tZ6aWYbSRO10BCeCSobia1fjd/nuR7hWduveqivL8f82aaP+d
         WLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108937; x=1793713737;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gogy6K4mHkApebhkUBNBSa8MX+km/CbZiAD1dzn6BOk=;
        b=IFg5oejnVNVqOO5Q9GLsZdpVFEV7qoD5voJGLtbtUnQ/79qmOHGWTYi6lF2lbfG922
         A0JZNSHBnxi/bY+Zcmj+l0Nqty/zmtP3DfdnXEr0qseP60fyqmhwGWrTzwR1JgEedSuJ
         sgpZkjPTpHb7+GislIJ7yqUsEbh4pcpRl4wwwgViovA4Wj0GvZe9omNUW25qE3awJRCA
         8H6+s/yE9mvi7kH92kzIy7nNznEXc2H2gbICosk3/isG5JSyCfb08mGY3dKsy7cQ5ems
         nu1WQUD2pC6Kd8QwkSZO6Lxzl79oEXKJaMeUYVuWDD9zhQugciq8wvJKeXt/TZY/BkyW
         2shQ==
X-Forwarded-Encrypted: i=1; AKwUvBzF4OgeaVpIFucu5cN6ou6mKAYAljHrAhF5a+gznqtgXYyiKtIDMDUVEtGr/U7p275ftvIxhM3nnqGemu+Gzlib@lists.infradead.org
X-Gm-Message-State: AFq9FYJaoFkDEN5RtlnRlCXaAqpuG4gxU5EBu2cuJbNxLOFEeNtqHeV6
	xFNHhHTAa4i3AkIxMVN4YMShjUmoC4EQpOW4rOYqMF/chwhrhxjK0MZIcOoVCuJlywBRsaPy2pq
	zLFTaVzRvcqLDImYA94Bmu3cbMOLbXtKiRlf/oS5NVSbzpsavTVE0OLQPyMx/+cz5m2FxV5Ztll
	g/Ng==
X-Gm-Gg: AYBFou0Qeg3sm1okW05GOfGtBFIq9KHL2DZTQJDRJoV7DYAjrk73DhFehyaiX6HVeLV
	SgQ6T0v5AcayuoFEI/twmKa0hULwr0pqSOxdJL+37mqvqLX7TiqfMnEK2nmVWQpVljjCQubZAzD
	WRJe9MBsqEyBLiVidEw1cmLzhk5v6nUl7tXJ9dbgFzas1UkF/BGGFwgd+r4M3nLIvmxAqjseNys
	wMy2MkZMMNaZ2NRvtUgK8vw/mNLS/A3FEzqcNZl6JwHSqJZ2bTitvFwor07BzlrhnTt3gQhNHCF
	GLerRbKMdA1MobeNKlrlcz86yE4kpTRE8CNjbPgQba3jQSJJNLm7E3fxMFeaGfywWfddDHJf8dx
	Dvvx4ZejC42o=
X-Received: by 2002:a05:620a:4150:b0:939:4a44:5f99 with SMTP id af79cd13be357-940ef79eef6mr1574207585a.10.1793108936771;
        Tue, 27 Oct 2026 06:48:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:939:4a44:5f99 with SMTP id af79cd13be357-940ef79eef6mr1574201185a.10.1793108936217;
        Tue, 27 Oct 2026 06:48:56 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7981a7sm455880366b.72.2026.10.27.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:48:54 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v2 0/6] net: stmmac: XDP path fixes
Date: Tue, 27 Oct 2026 14:48:35 +0100
Message-Id: <20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQqDMBBEf0X23JUkYsWe+h/FQzSbGmgSm7ViE
 f+9IfdeBmYeM3MAU3LEcKsOSLQ5djFkoy4VTLMOT0Jnsgcl1FUK1SCv3usJd7OgdTsxCqG1ak3
 Xaysh15ZEBeTWAwKtMORwdrzG9C03myzo/+ImUSDZselI9rYdzT0y1++Pfk3R+zoLDOd5/gBnV
 dJLvAAAAA==
X-Change-ID: 20261023-stmmac-xdp-fixes-00aa25d79af1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>,
        Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ZPbR6oz_D2kDv86qmARq1a8FlJeMDZBC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX1hKLw0y24lBv
 6wSST9yPbDX9eBNVrsUsmUFXv/05k9hOXVy+7FG2AyTV00rzZCdVv0nDN9ZKrtv5ZfIg+9oygDz
 5qjUAf91z9nwFK7Flp+d0xpNDCGZIwM=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae0abc9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gDgEgTsMjVfdaljlQWwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZPbR6oz_D2kDv86qmARq1a8FlJeMDZBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX+fRM47o1nt60
 vhKEA4M9pEJLxuKCrpa4XCtuT7UxpC0LDUUCxO0XN5ubD4cm3uYNbV5DykbkJNcl5bBHt0nUqEC
 SIOAe258KuxVo70W8gf6aDOI6sg06aV7tGAzM44RmwLhV2Xj4DH7SVrid+6f67AC32eIqZcATrV
 g+UVvMMCQ82LEdRpv+4U12LRmlUgfDreIRn/x2cOYY3kSLJW7TLUjfzbkD0w2xjv30bDk4g2pm1
 u6O5q3KW0L/K9TQn7sWto5Saz997M8g88w9ecIn9Zhb+ljP75cIwI6e38KWmAQ3Pc99IYkhZzar
 j5l8Co5VItyAjGyTgs/3SMmwRLl+8sK7AY6EaBcFq0/VGoX/Taai5c7FfVroOEm4PmsbNVShCjE
 EJmn7wOyl8Zr4cPqCxIK+DhKDFlNtIrzCRZ2Rt3CrQ9h/jSKUt66wx/bbLtKHhvgvMqIqLTDExL
 vDzN6O8eFe1+h4HVwMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_064858_970016_B52CD9C9 
X-CRM114-Status: GOOD (  12.19  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds some stmmac XDP preliminary fixes needed to introduce XDP
RX multi-buff support.

---
Changes in v2:
- Rebase on top of net main branch
- Fix commit messages
- In order to avoid possible dirty cache overwrites, sync the full page
  dropping the xdp_buff in stmmac_rx().
- Link to v1: https://lore.kernel.org/r/20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd@oss.qualcomm.com

---
James Hilliard (1):
      net: stmmac: take ownership of saved RX state at poll entry

Lorenzo Bianconi (5):
      net: stmmac: drop split frames on AF_XDP zero-copy RX
      net: stmmac: drop multi-buffer frames in XDP mode
      net: stmmac: copy XDP metadata in AF_XDP zero-copy RX
      net: stmmac: fix VLAN tag stripping on short and non-linear RX frames
      net: stmmac: fix XDP RX buffer DMA sync length

 drivers/net/ethernet/stmicro/stmmac/enh_desc.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c   |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 194 ++++++++++++----------
 3 files changed, 112 insertions(+), 86 deletions(-)
---
base-commit: f75062536e2d45ee182828f0e47e0124be2fdc8d
change-id: 20261023-stmmac-xdp-fixes-00aa25d79af1

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


