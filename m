Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF53E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 04:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAa+E2qpa9yVY0np+pwu+ZtHJwvEymiXJeXUQqJmk68=; b=MHHN3VIRiaKclmRHnaTWg4ZNjx
	wf1bmx4mBwXf+9UFVOvw1un2i+IXn6lpzo+E+hIV0gNRW3m8NfonB+9ui23ieuYA6AWaffu8zydzu
	vCZws+e9Gd+hQW8DmnJMU7wamyB3566G4KPKU6ElRt/ACJcC1vp6ICFsir8xGJ1IiuXDS+AK8GUrE
	AFk0L8w3u24m+UYvNWOYBYUCszBB2v5TIdW6aH7YEVzLO7s3pELxBqtTLQTMyfzicTOa2nYL3mIOR
	voMPLbZ30ZlBxsgXXtSXkiATh9iBGQjhEHgxixCq/0Yls+hh6LpBXwuq+E2T+twovZTj23Z2PTpxq
	7QqSlW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPDdE-00000007o0G-13Eb;
	Sun, 22 Dec 2024 04:31:56 +0000
Received: from mail-m10141.netease.com ([154.81.10.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPDc2-00000007nuz-0Qq3;
	Sun, 22 Dec 2024 04:30:44 +0000
Received: from amadeus-Vostro-3710.lan (unknown [116.25.95.193])
	by smtp.qiye.163.com (Hmail) with ESMTP id 66ff1284;
	Sun, 22 Dec 2024 12:30:30 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: naoki@radxa.com
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: default to host mode for USB on Radxa E25
Date: Sun, 22 Dec 2024 12:30:27 +0800
Message-Id: <20241222043027.265865-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6EFDC4E74A617E25+ed534e8a-fef0-4f09-a24b-a536b7f2f13b@radxa.com>
References: <6EFDC4E74A617E25+ed534e8a-fef0-4f09-a24b-a536b7f2f13b@radxa.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0tNVh1DS0sZS0xCSx0aQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkJIWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a93eca18e0b03a2kunm66ff1284
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kz46ERw6HTIULg1NME4SFB82
	FBhPCwxVSlVKTEhPQ09KQ0hKTU5OVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCTlVKQkhZV1kIAVlBSEpCNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_203042_400399_7EF40307 
X-CRM114-Status: UNSURE (   6.45  )
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
> Could you check Product Brief P.4?
>
>  https://dl.radxa.com/cm3i/e25/radxa_e25_product_brief.pdf
>
> There is "USB3.0 OTG Switch".
>
> Best regards,

Oh, sorry, it was covered by the shell so I didn't notice it.
BTW do you see any issues in the sd-uhs-sdr104 mode?

Thanks,
Chukun

-- 
2.25.1


