Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80575FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2a4GcW/9CQXNlYVQKt40jw2ZEV4nSc3Q1Abjd895jfM=; b=4MfKIY760zcSuonkYrtlwXAZz8
	8mh9Jsi0zB0MsulxNa8GGAYSTYHLi3mkn0/Yxmzg79Pe9bPrtSNb/7Tb4pqriMKdE9EYGiJwzpZaS
	kqSdSacgw1OlFfy0NiVCeo4El6RaDAbHxq8l1Wz7KS5VIxmh4VSst9BUestHd69Z58CCK/CgH5562
	JnWc81YPj0Bkma4YzvCGsAz0FGLlOd6uhr4J5gHCfh1XMLkcZZqOZOkuY157vRftXIg/UMalOeWkO
	M4lEUoYxGrkAKfHffFMrioBhtsfn2bO5luYjWdmdXXpaJq/KASKak1sTiFuX2D+WizDxRTtLP0VyI
	TNLA4wWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGfg-0000000GPAO-0Wp7;
	Mon, 27 Apr 2026 07:46:24 +0000
Received: from mail-m3294.qiye.163.com ([220.197.32.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGfd-0000000GPA1-2WPB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 07:46:23 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c44d2e91;
	Mon, 27 Apr 2026 15:46:11 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org
Cc: arnd@arndb.de,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	will@kernel.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH v8 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Mon, 27 Apr 2026 15:46:11 +0800
Message-ID: <20260427074611.26112-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d78e5b19-c380-4fd6-9ae7-e2b20b74474f@kernel.org>
References: <d78e5b19-c380-4fd6-9ae7-e2b20b74474f@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9dcde727a609cckunm139de2471b056f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSRhKVkxLHxkfT0JLSRkdH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=PaAH8gCO1lCvuD+EUHgJYdJs3O9vLdBvkaI8AY1nfThuUE2VYeMo9DH0A39b4ITUE9fuQf7IPz3GcQ1siaVuIOocj9U8jJwqgPNuI9jTXj9p433RW0qunn3fDSyXA9+2QnhyvuItFSu950KNCp58K5izVV+qFx/gBNOglZxXe0o=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=2a4GcW/9CQXNlYVQKt40jw2ZEV4nSc3Q1Abjd895jfM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_004621_867795_48D31721 
X-CRM114-Status: UNSURE (   3.90  )
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

On 27/04/2026 08:36, Krzysztof Kozlowski wrote:
> You sent it already three times within one hour. Please stop.

Apologies for the noise. Sending is stopped on my side and the root
cause is still under investigation. Please use the canonical v8 for
review:
https://lore.kernel.org/r/20260427055555.3693459-1-yangzh0906@thundersoft.com

Thanks,
Albert

