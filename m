Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FB1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 17:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8ORmEwkvZSASW9tR+9y0u56mm6Dx+WDZsc7ot3gqd8=; b=YH82qvb6z0Zrrk7P34+5WkYkMM
	qEjtQW1oljIoO+xr7wNuhhv1dksNrQZYDJkRiR3cJxO8EOdQqtGZ6oV7+B6ve+dJ6jKFl708O0k+X
	HXoAzsXzZd+inYqCKd1y8qfg+bfbgvxGJPIc0AVNqMLHnZeytx/eTOZ2xyTlx0L8PkPhkvnzaCplN
	LQ/80U2YaZ/djqvWHhLWhUpZlqt0kK2iY2BTT5e/KmVMfmkvSBzvMXoEmdXvLpb6fN/YOri/mX1WP
	jcpyub8mUoVURcwG1HuRNi9eGnWfrj+gleMfLxbLZX9dLjjgnm9Y/iHxKKaauNsY92HYI3iFg8rBH
	6q7sTtqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGse-000000038pV-3jPE;
	Tue, 22 Jul 2025 17:34:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFHy-00000002vMh-2vmO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 15:52:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD6451516;
	Tue, 22 Jul 2025 08:52:15 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C1203F5A1;
	Tue, 22 Jul 2025 08:52:19 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] coresight: fix indentation error in cscfg_remove_owned_csdev_configs()
Date: Tue, 22 Jul 2025 16:52:11 +0100
Message-ID: <175319951714.340844.3950740374860481675.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611103025.939020-1-yeoreum.yun@arm.com>
References: <20250611103025.939020-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_085222_782276_38C2E368 
X-CRM114-Status: UNSURE (   4.77  )
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


On Wed, 11 Jun 2025 11:30:25 +0100, Yeoreum Yun wrote:
> Fix wrong indentation in cscfg_remove_owned_csdev_configs()
> 
> 

Applied, thanks!

[1/1] coresight: fix indentation error in cscfg_remove_owned_csdev_configs()
      https://git.kernel.org/coresight/c/a80198ba650f

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

