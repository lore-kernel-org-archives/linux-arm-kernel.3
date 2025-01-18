Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24C4C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clsIt6Hq0rPEiGjWhgknzGQoRLzRmMBeP5mJe82oZ3Q=; b=zeFT/rS+QrOK3BB1xqmo2VAfwM
	VfOEMHpIJGqiHnsrCoSScQDsuU1Q6YXinxqWMu7Rcgibq93N/x9w7k6WQ0Rly+zDLRvFBMvdHOrbU
	WAzLVMUaiA1d983GvFJ1u+gfRKTTPQuQKx+ea0BKsR16jO+d+lSRbT+zUDy2cfpTSRyf2u6yoo8A+
	BvJFXtN1ghFgyCitX212HWebJv/uVIdh//5OcxU5LtxiF0RmNAkT9ON7HDUb1os1sJF+i4yWFVcyO
	zKZyIBkiMoEhMcSiUT3zQfxN/8n9jj3xkVwC6tGb++zu7rlDAFRj6u4h0qaEsJ0gSIu8f8ZodUyY2
	Jm/r+w3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ9rU-00000002XBM-2HcG;
	Sat, 18 Jan 2025 14:31:44 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ9qC-00000002X31-3sg8;
	Sat, 18 Jan 2025 14:30:27 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:370::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 910c6354;
	Sat, 18 Jan 2025 22:30:12 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: bigfoot@classfun.cn
Cc: amadeus@jmu.edu.cn,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 3/3] arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568
Date: Sat, 18 Jan 2025 22:30:08 +0800
Message-Id: <20250118143008.49352-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <000e447d-a1bc-4118-865c-8c0b70146ab6@classfun.cn>
References: <000e447d-a1bc-4118-865c-8c0b70146ab6@classfun.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR0ZVh5DSE1LTx8ZHU8aGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUhMS0FBSllXWRYaDxIVHRRZQVlPS0hVSktISk5MSV
	VKS0tVSkJLS1kG
X-HM-Tid: 0a9479d2498503a2kunm910c6354
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PTY6Dgw6HDIJTzNOTk4rTgws
	NEoKFCtVSlVKTEhMSUpLTUpJTU5PVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSExLQUFKWVdZCAFZQU1LSjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_063025_196267_A15AD0AB 
X-CRM114-Status: UNSURE (   9.28  )
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
> It really helped me, I wrote first dts with reference
> to it and other devices in mainline.
> Could there be a better reference link here?

No need, subject to the schematics.
My previous reply was also based on schematics.

> In the schematics for that slot I saw that it only has a PCIe3.0 x1
> connected. I think maybe max-link-speed = <1> is wrong.
> Now modify it to the following, it should look correct?

'max-link-speed = <3>;' already defined in rk3568.dtsi
I'm not sure about this, can you test that it works?
Without splitting, num-lanes should be 2.

-- 
2.25.1


