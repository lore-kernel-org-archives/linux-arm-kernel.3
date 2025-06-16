Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A5FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hZLfO/aZyhMByPrSvo6tytgTdrnVnO5xyKlmjUCAvKw=; b=Hfd2hm/cN4T0WF
	lcjaxmyeQqJ1fBbuOAAkrPl8mu2J/FNF0rI/c/yYydRKT+Beip3ckKfhNz9sA3489N1JGAqCHgSuq
	sHvcfPmJHkQFncMQ6xJXNm4YtWXg4/WY+9bjhALxwtOVMkstIzzaT+EWnszjcLnafAj1wjX+81E49
	KPzN5lJX9rbl1/DvVFHONW6ezrXYZPoMd88uwGpWX5Z9NMsX0TgFpC5YmmoHZ4mA9VE2sosWKtwK8
	lQJhSqTHvR0NwS8UeK2oeoapcMCziVlEhFAY+YVvzO9m2+AZUHosmodaVUWiErdW50NjFYMiLikxp
	vMLa13tu8NcM/Ga5aVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6Ft-00000003vus-0baV;
	Mon, 16 Jun 2025 09:35:53 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5f3-00000003rMX-2Ob8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 08:57:50 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8nbMS018924;
	Mon, 16 Jun 2025 10:57:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=hZLfO/aZyhMByPrSvo6tyt
	gTdrnVnO5xyKlmjUCAvKw=; b=RMUr56cGnt2/RKuJ4spaAqR0emvF93V4UccXgy
	LMZbSVE+1tjfHj1tM/nNO0xtDGv8ZNjsp5EWl/h7LRsAaEU+dQU7iGVWopOKSTTx
	SmMxOcsDq5+kooCeQHsQGojp3Ea2kzjQKhVnA+5rvfQ+j9qocvU2AcXgW5uJLqQJ
	ftcScyP45zUgIiwv3ZyFa+YreFS93Rbd8Af6sguAbUFc0A4765p1UKOM/z6KwyKq
	WUkjBpIvNRIpAjIrGZRlzYY4ilz+qNGXPX6OFYBBlKD3RNn+s3rM5g2GKUn1srO6
	C7DbbaN/1GPmPG33jvn4XYGy6AyXTbqXovPbFKJ4tgWp3G/Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e1yqwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 10:57:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 01A4740074;
	Mon, 16 Jun 2025 10:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29F025D40BC;
	Mon, 16 Jun 2025 10:54:42 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 10:54:41 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH 0/3] Fix STM32 I2C dma operations
Date: Mon, 16 Jun 2025 10:53:53 +0200
Message-ID: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKLbT2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3UyjZN3SguKSotTEXN1U0yQzS1MDQ2NTy0QloJaCotS0zAqwcdG
 xtbUABnEo6l4AAAA=
X-Change-ID: 20250527-i2c-upstream-e5b69501359a
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "M'boumba Cedric
 Madianga" <cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_015749_897630_1682865E 
X-CRM114-Status: UNSURE (   7.14  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series aims to fix some issues inside the driver's DMA
handling.
It also uses newer I2C DMA API.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Clément Le Goffic (3):
      i2c: stm32: fix the device used for the DMA map
      i2c: stm32f7: unmap DMA mapped buffer
      i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

 drivers/i2c/busses/i2c-stm32.c   |  2 +-
 drivers/i2c/busses/i2c-stm32f7.c | 40 +++++++++++++++++++++++++++++-----------
 2 files changed, 30 insertions(+), 12 deletions(-)
---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250527-i2c-upstream-e5b69501359a

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


