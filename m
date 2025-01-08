Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36452E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tF0K+drxH13G/w3wVMe72kIEcoLUYOzI4PNx3Hs7188=; b=kzhhTBTmSPD0p5B8qnh+sejXIS
	doSLejaQ0SPXLetkWwNzsUypzl7boV8ezNErQlu5Ev1pDDomIdNv5HBhj7lzE8U1A7cqD/bE0vMbD
	8FOYBTb4tGthlA1kutYE+JnezD94eSIMss6IX/hakfCDVYx/gfJOFYxTg+sRvmUdpd91wdrPIHgEn
	RDlhXBHOmfE5L105fh8h4VL3IbWAZbg4l964xztKScEHsvdHlNUXS6WTxpq9T6n28kFOu0nQrFtpJ
	NmdxREqm0FWWMY9Otu/FIHbnC79+jtIuQ1DE3IXjrpJqN3297ExgFkZfTb05Jjl/QMQIFCv/e1vxW
	VdMtgY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVz6-00000008amP-16vf;
	Wed, 08 Jan 2025 13:20:32 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVfZ-00000008WjG-1hia
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tF0K+drxH13G/w3wVMe72kIEcoLUYOzI4PNx3Hs7188=; b=bd0t76DZmVNycr03dgHT5X8/w9
	8IT1zuMwC5dHre6TjolIDbLzhlXNnRD4MB1yK16ruGj6i7H05OTNPzbMU3BKsZe6ddIxOpqvz4qG/
	lLqV7z1gJwjDL5W/t+k4gnGBMFwF97GG+qH7y598M7/b8LCVTu98Y20HzQ5kSIEQsulEgJex6v34r
	2OCMg+t+W/SeQX6/sMKW0WtOkGNFv5ydRsOZPwe8yCGQ710ynAsyLahjCT+y6ybx42sFt2YeMSAp7
	ydXJpChlsTHnyEeqO7fC+HYruqP1GXadLqGAKm3PxJTNSPExBxDmXBYOvtxI04keVNbXmbUZfKmq/
	xbKzUOfg==;
Received: from [122.175.9.182] (port=28889 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tVVfW-0000mE-1r;
	Wed, 08 Jan 2025 18:30:18 +0530
From: Basharath Hussain Khaja <basharath@couthit.com>
To: nm@ti.com,
	ssantosh@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	danishanwar@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	afd@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com,
	parvathi@couthit.com,
	Basharath Hussain Khaja <basharath@couthit.com>
Subject: [PATCH v2 0/1] Add AM57xx Support to PRUSS driver
Date: Wed,  8 Jan 2025 18:29:36 +0530
Message-Id: <20250108125937.10604-1-basharath@couthit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: basharath@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: basharath@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_050021_471413_C78E7C76 
X-CRM114-Status: UNSURE (   6.28  )
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

Hi,

This patch adds support for AM57xx SOC compatibility in the PRUSS driver
which is a prerequisite for ICSSM Ethernet driver.

I will submit the patch series of ICSSM Ethernet driver for AM57xx
subsequently in a separate thread after the merge of this patch.

History:
V2:
Rebase to linux_next and ti-drivers-soc-next


V1:
https://lore.kernel.org/all/20241223135550.6898-1-basharath@couthit.com/


Thanks & Best Regards,
Basharath

Roger Quadros (1):
  soc: ti: PRUSS OCP configuration

 drivers/soc/ti/pruss.c       | 77 +++++++++++++++++++++++++++++++++++-
 include/linux/pruss_driver.h |  6 +++
 2 files changed, 82 insertions(+), 1 deletion(-)

-- 
2.34.1


