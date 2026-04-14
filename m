Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FBFF531E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 03:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=av25gekQIuBM/Y6KxSWV5Ks4E89VKaLrHKzcr8v2Occ=; b=Fj5qUM+dFFsHQFefmnsTV4JZsQ
	g3nfCrKRhu0wq3E5XBWtY5VjBU78CsVkzYBCflYtf4jbKTC9iCcM0v7TD7mgel0Y9xag5qA9QZeAG
	nlneU/UEtBSFlG+vhl/XQR3sncocRsBOvXmN2UMtLLuw28gXduQin0PA3a6iJ0kVa3gW12gF0aoVh
	ET8bH3oqAn9LmW+ucdR9quLcLuvBo5SQFYBfknsRlvNMBjfqlXm0pLP0hO10f6VqnchDrCbCbODfW
	O6HuPbHjvoH9jNvM04wmj6o/rYpdCKmfXyiz9TAwdmBZyXxtIKSLPyn/svUXxwF2UhrqUTlx0FMrj
	aICXOBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUAe-0000000GcmV-0N5N;
	Tue, 14 Apr 2026 03:10:36 +0000
Received: from mail-m4785125204.xmail.ntesmail.com ([47.85.125.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUAZ-0000000Gcm8-3veg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 03:10:34 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a9d8126a;
	Tue, 14 Apr 2026 11:10:23 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Gordon Ge <gordon.ge@bst.ai>
Cc: Albert Yang <yangzh0906@thundersoft.com>,
	krzk@kernel.org,
	arnd@arndb.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Tue, 14 Apr 2026 11:10:13 +0800
Message-ID: <20260414031017.2834464-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
References: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d89f7f94e09cckunm47224bfd8374c3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhpDVh8eSkpOGUkaGENJGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=PsIz2A61jB8c0HmAWTe1NuuK92uODdQa1stUjfDOhqsgA26thYg4XKF/6uN1o6pziFlTD9EsXqfIXiSlLk/bR0z/4uElo7q/MnfFFSlsZGkgcJxZbjv+d/Yg3yn0bmyofbaAqBw8X7bDbaE+cTpcHBXKosX+k8eurypYjebM2z0=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=av25gekQIuBM/Y6KxSWV5Ks4E89VKaLrHKzcr8v2Occ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_201032_662583_8191F848 
X-CRM114-Status: UNSURE (   4.54  )
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

Hi Gordon,

Could you please help with:

1) Reviewing the remaining 2 patches in this series.

If acceptable, please reply with an Acked-by on each patch below:

- [PATCH v7 1/2] arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
- [PATCH v7 2/2] arm64: defconfig: enable BST SDHCI controller

I will carry your tags in the next revision.

Thanks,
Albert

