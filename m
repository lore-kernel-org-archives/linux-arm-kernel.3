Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38139CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 04:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZYojajc/GZnnqfLJ0TerXgFrRFfpRChE26/+4ZhIU8=; b=UK947jW46bYjjzKxDSERs3AVK1
	zy+R7j+64TylxW7lN7y+1pGcRRWw0ZXvzn5eRvuYdTCVIHFyTpfdGfKs2G5hUZYl18/WgxfPDdAUc
	Omur/g3tiKeS6PkgC2706STDESYm39Gf6PbTlHv2qPnVUBoaUaAsuT/OgOuB7/Vz/CgAkWNeB+sE+
	uvfDq3KVz5RBIyMTaeaF768X56StJ+uHN3RwuN4FvAzXKBK1MLLGLQ+6FbHlu9nyVPekzYIN67cm9
	WyKZTmTt4vTwRa7pDTEyD1YyBu0g0RDrnAWX3oBi4Cr3Eu8QDT7v0GT8lF9kejIKYYi5pJnxLk4Xz
	TUQN/Xxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEh8I-00000005OXt-2pwR;
	Fri, 31 Oct 2025 04:53:02 +0000
Received: from mail-m49220.qiye.163.com ([45.254.49.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEh8E-00000005OXI-1F0q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 04:53:00 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27df65d1c;
	Fri, 31 Oct 2025 12:52:53 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de
Cc: soc@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	krzk@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	ulf.hansson@linaro.org,
	conor+dt@kernel.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH v5 0/6] arm64: introduce Black Sesame Technologies C1200 SoC and CDCU1.0 board
Date: Fri, 31 Oct 2025 12:52:53 +0800
Message-ID: <20251031045253.789621-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
References: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a389c874609cckunm02ed9fdf61527c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSU9CVklDHR4eS0lJTElNQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=f2wz2SzZAlsfxhX8+oVUJd3MqUei8pXHJ3+WZFzhM6YiBUlGgF3ubrCPUCRGn1W3cx0ZlLk1bjiCa/hbXjQH7H/2AzH8Ocmnusys3lhyStBM0vC9XSZgAt/P/rfzRKobJvB8M/UidwAlh4qnhAf9Y68BZotzrG5O40/WuUvAN5U=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=rZYojajc/GZnnqfLJ0TerXgFrRFfpRChE26/+4ZhIU8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_215258_932284_53713933 
X-CRM114-Status: UNSURE (   7.55  )
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

Hi Arnd,

Following up on the v5 series for BST C1200 SoC support. The dt-bindings
patches have received the necessary reviews (Rob's Acked-by for 1/6 and
Krzysztof's Reviewed-by for 2/6).

I now understand that the SoC-specific patches (Kconfig, DTS, defconfig,
MAINTAINERS) should be reviewed by the ARM SoC maintainers rather than
the DT bindings reviewers. Please correct me if I'm misunderstanding the
process.

In your previous feedback [1], you mentioned you'd be happy to merge the
SoC portions in arch/arm64 and suggested resubmitting for 6.19 once
6.18-rc1 is out. Could you advise on the next steps? Is there anything
I should prepare or address before the 6.19 merge window?

If I've misunderstood anything about the process, please let me know.

Series: https://lore.kernel.org/lkml/20251016120558.2390960-1-yangzh0906@thundersoft.com/

[1] https://lore.kernel.org/lkml/09b1318e-21dc-4354-8733-866b70696295@app.fastmail.com/

Thanks,
Albert


