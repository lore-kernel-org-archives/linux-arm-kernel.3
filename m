Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE0CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 00:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=pa741XKQ2gaZssIVGBPFxX6Ra1
	tHgHieISsAZ9yCqwWBmuyZQ85zd+3g1O8A9fBf5SuvY6NiPRoPRFbnl9/s6FZ/p9ZSdj8Q52qZmGO
	wWK5gcqWaXLLPWb5GH3CmPb5k0X6eUSD5H0QOF4jWUttW5ZCs89wGV5URPZLI2AeUDj3T04iRyW9U
	wV1xCU4AicPUkx24ubYaGcx/w/Ct0VwAvP6QZjc9XdUOcwXf45rtQhbbZqv6JcI7f2XNr5Magnrap
	bdTQaa0YhoxIBIs/VVYvvRuYII1tw6tJfz2qZVdoEM4WAR6RY1cUkq32meWvYAKAdt04ka3832bOq
	I7Szj6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFDB-00000001WXn-3EsD;
	Wed, 07 Oct 2026 00:08:45 +0000
Received: from mx0b-00617f01.pphosted.com ([205.220.177.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFD9-00000001WVk-3mLN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 00:08:45 +0000
Received: from pps.filterd (m0247528.ppops.net [127.0.0.1])
	by mx0a-00617f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69702dPD3358279
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 20:08:01 -0400
Received: from egc-exch2.psmicorp.com (webmail.psmicorp.com [38.142.134.66] (may be forged))
	by mx0a-00617f01.pphosted.com (PPS) with ESMTPS id 4h5b6q80da-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 20:08:00 -0400 (EDT)
Received: from EGC-EXCH2.psmicorp.com (10.1.1.111) by EGC-EXCH2.psmicorp.com
 (10.1.1.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 6 Oct
 2026 17:55:51 -0400
Received: from psmicorp.com (10.1.1.107) by EGC-EXCH2.psmicorp.com
 (10.1.1.111) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.1.2507.61 via Frontend
 Transport; Tue, 6 Oct 2026 17:55:50 -0400
From: Evans Thomas <_us@psmicorp.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: fund transfer opportunity,Reply..
Date: Tue, 6 Oct 2026 23:55:47 +0200
Message-ID: <20261006235547.FB85241A2B104116@psmicorp.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: dNiHakC1Veeo-1sT83X0miO_1YVNap-M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfX8zNa5wQguOfR
 VxZfaTSMM8DIod1pH0W3AX5Y2bGPD7fgJ88UlooOXsiT6mHxnAKgzHoNSJGQzIUBHUr8Bv2/o/Z
 Px78CYf2URg/ZtPLd+AcbsER9xe0HH2HwZkXpF8Lrzm2KufDtaeg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfX7bncEl78siQo
 ZpyRqHCJkTSIWn2aLeRGeHZb68q8UDvr0vs82oVQ9R78WExSItKetv66ZsACNQW+6kd4w47reU4
 uKZuDNyCtD1jrQ9bn7eLaPfptcl5//e5yJrkYBz0xH3EgUZ5kIZVn7iPtz7o2C4I3JKkinHo8Ms
 TqiZsQ98Hea/WfwtvYsuaribLDCfy2MNHLRJM8mDBFOEreTJLMYzvd7fgJcJ4+MSpNJFNoffe5J
 9+N8C6RltRhou+L1vD4FFvgS83Cuk59digS/Sn/kCl/pnkFLBGo6NEt8J1U5XJ+Bn0voXRBrP27
 deEvVbJeaHT5zOGgxv0Xpjv2aRsLdRwm7nQrj0p5ViGp1NC5/a2slIjFiz4s+ljcLq4Z6S2PLvQ
 Gzmrs8anbuXKTyRqNF0dseWI6/oB+G4Gn0goC6+ET+SPTkWwOF7/ThmXllojQBeh+E+YVEge3K7
 CeSjlMYA43gbSoMPKhw==
X-Authority-Analysis: v=2.4 cv=E7BYNqdl c=1 sm=1 tr=0 ts=6ac58d60 cx=c_pps
 a=sNj4pI0fii9qGHoVqNzRVg==:117 a=sNj4pI0fii9qGHoVqNzRVg==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=ZHGAjPH774soz-f4Le74:22
 a=FHnH0SYMNjvGwZk24hmG:22 a=tclcd6dtLQvEqt9_mmAA:9
X-Proofpoint-ORIG-GUID: dNiHakC1Veeo-1sT83X0miO_1YVNap-M
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610060095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_170844_051224_B190026F 
X-CRM114-Status: UNSURE (   4.37  )
X-CRM114-Notice: Please train this message.
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
Reply-To: greg@gospelmusicuniversity.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


