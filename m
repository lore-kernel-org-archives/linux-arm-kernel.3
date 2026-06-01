Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDE8CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HpjtZmFXsxidBZJjFQYAS6CBJU5vUaHDo+8aVLCph/E=; b=pM+QBFIsyWtiT/g9b8mgje7QxR
	V3W65yd8cufgM5E6Lu5kTFg1YNbK/+fRmRqrYNQNBu2UhZNRxmYwqxa1bvd0/cpjA4QzZRzsuVXyx
	XPYZs4vYJJnJl4STKhyugbm+vPc3ZuvVGRK9ksZ8yDQw2vtNUYU1erFdzKUx2c0KwMvV1lGMz0YYZ
	yk6KdYmGc9KoZW8vyiEBl6PY76aBcgnjayAsCFpFIzihk+jiCcrggkHiekHeqDEl/oIdltQMRVa/U
	G6FmusKx9LE0dPjUFgBnD6+uvFBDPE1kEDJnwKAbjlCmBLcje9BhtviGrlC2dLXDr+Vc1iEjf80Ew
	MyLj2LfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyxo-0000000AUkh-14im;
	Mon, 01 Jun 2026 09:29:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyxn-0000000AUkV-1NuY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 09:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HpjtZmFXsxidBZJjFQYAS6CBJU5vUaHDo+8aVLCph/E=; b=KuMN+lvw5aGZAQVHSmyowBLbHl
	Ysihu39ayXfrzrKX76Rvz6MeApN0Q9u4Nq1utbmtp9uwVIQn2jkkdRL3i/qTst+hVjc6vZCNkoFIP
	/fcggzOnx9iHuKXhXQtebQL/aV1psdNY8DY57jqVMAWCv/m0I23nSCzyYr+1pZ2Qj6IjZ2VXokOgK
	4lWSUFSUKi2kH6A6IxSDWRFZN1kvnh8G6RZa/NUcAcME3PEfC4CxIC62u8fqcv3Bh5ds47UYF4+5S
	p1b0fiOzcir8L1TMpwjzopmMJuTyzpA94rHA3SRGYPIXSj3plApAuLf0C700BhELSVQm/zB2MlaS2
	R6tmRUHA==;
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyxi-00000006EFw-48F1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1780306175; x=1811842175;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HpjtZmFXsxidBZJjFQYAS6CBJU5vUaHDo+8aVLCph/E=;
  b=qRZpc04m/8Ri5ImGpRc/oemVt9vYiS7C9YvWSyUNs+78UK1hqV49g+xT
   6Gcp21hZ6LFxcYEhHSbn2GdIxsnKBl5Bf245H0poMAT1wO5Hw0RiWDrPV
   eCh5g0nJaFu7TcyvetAS302jXgFskQAid/ZZumznqTwDrcOHPfs72DqlC
   EilF9oWBpjlinDRJ5L3jIFCTshEL5tCozYtEVMaZwMTjBePJ6cOfEb3AA
   ecjSmPC5tjWRGMt+Dv4F8asmjTXT2SYD1LXnuOK4CXH4EuMM6rHGLm8mh
   TUQIjthHJGnf7YppcRua2OnFtaw0ZUhDWPqFJ3CcppGs3a7raWxSUvo4/
   w==;
X-CSE-ConnectionGUID: paRINLUsTfCt7XNNg/2Yiw==
X-CSE-MsgGUID: CQMjXlMvR9aNle3Z+GucdA==
X-IronPort-AV: E=Sophos;i="6.24,181,1774310400"; 
   d="scan'208";a="20629402"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:29:26 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:16247]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.6.91:2525] with esmtp (Farcaster)
 id bb685c7a-870e-4d2d-aad3-f6d9fb73e6b5; Mon, 1 Jun 2026 09:29:26 +0000 (UTC)
X-Farcaster-Flow-ID: bb685c7a-870e-4d2d-aad3-f6d9fb73e6b5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 1 Jun 2026 09:29:26 +0000
Received: from dev-dsk-gyokhan-1b-83b48b3c.eu-west-1.amazon.com (10.13.234.1)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 1 Jun 2026 09:29:24 +0000
From: Gyokhan Kochmarla <gyokhan@amazon.de>
To: <stable@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <sudeep.holla@arm.com>,
	<sebastianene@google.com>, <linux-arm-kernel@lists.infradead.org>, "Sudeep
 Holla" <sudeep.holla@kernel.org>, Gyokhan Kochmarla <gyokhan@amazon.de>
Subject: firmware: arm_ffa: Align RxTx buffer size before mapping
Date: Mon, 1 Jun 2026 09:29:18 +0000
Message-ID: <20260601092918.11031-1-gyokhan@amazon.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [10.13.234.1]
X-ClientProxiedBy: EX19D039UWB001.ant.amazon.com (10.13.138.119) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_102936_146157_FA84D5D5 
X-CRM114-Status: UNSURE (   8.84  )
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

From: Sudeep Holla <sudeep.holla@kernel.org>

commit 0399e3f872ca3d78044bb715a73ea645806d2c7b upstream.

Commit 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during
RXTX_MAP") advertises PAGE_ALIGN(rxtx_bufsz) to firmware when mapping the
buffers but the driver continues to stores the minimum FF-A buffer size
in drv_info->rxtx_bufsz which is used elsewhere in the driver.

Align the size before storing it so that the allocation, validation and
FFA_RXTX_MAP all use the same buffer size.

Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
Cc: Sebastian Ene <sebastianene@google.com>
Link: https://sashiko.dev/#/patchset/20260402113939.930221-1-sebastianene@google.com
Reviewed-by: Sebastian Ene <sebastianene@google.com>
Link: https://patch.msgid.link/20260428-ffa_fixes-v2-9-8595ae450034@kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Gyokhan Kochmarla <gyokhan@amazon.de>

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2059,6 +2059,7 @@ static int __init ffa_init(void)
 			rxtx_bufsz = SZ_4K;
 	}
 
+	rxtx_bufsz = PAGE_ALIGN(rxtx_bufsz);
 	drv_info->rxtx_bufsz = rxtx_bufsz;
 	drv_info->rx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);
 	if (!drv_info->rx_buffer) {
@@ -2074,7 +2075,7 @@ static int __init ffa_init(void)
 
 	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
 			   virt_to_phys(drv_info->rx_buffer),
-			   PAGE_ALIGN(rxtx_bufsz) / FFA_PAGE_SIZE);
+			   rxtx_bufsz / FFA_PAGE_SIZE);
 	if (ret) {
 		pr_err("failed to register FFA RxTx buffers\n");
 		goto free_pages;



Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


