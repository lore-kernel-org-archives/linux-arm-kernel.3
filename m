Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C46E6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXP6IwLqJvi3eFye0FZCePw4KIH75GoUU566pzSc5Bk=; b=Jc3q/VsmRKhjWV4pcfSNdMmcES
	BxMS1RVxNClap9X8DtAaBQe+Wzmzh8P40Lvj7rvCrO3r+bN++Pn8vvdG2Njy5uF9vPQ1u/+mpN9eD
	gIqi1FgUSCCuryoBO91JaUZaVdU5ZJsQ59fZ1XoGEu39OYdl/kXujRPnb2yKwHt4dplx1NAbjp2PK
	50SNmnFSau7YLuVvynxPkZmLE/7RtBxd0UCZOSHbdshx6R05NSElxM56ZpKs1Ascp50KcQFh4/h0g
	vbo7i1HtXvc4Zn5TI7nZo6EsH2UjFqErcukxfTygqM5LrB5CBgSUNaBibRv1hpauyUwv0nMPlSVS+
	iBUYD2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6R2-0000000Fqr9-1tw6;
	Tue, 23 Dec 2025 17:44:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6Qz-0000000Fqqm-3hxm;
	Tue, 23 Dec 2025 17:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B14C40BB8;
	Tue, 23 Dec 2025 17:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F4DC116B1;
	Tue, 23 Dec 2025 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511873;
	bh=UpO9gOAmsb4xmiLPxSRxi21Q3cw+GzU44VBAhFU6H1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FO5zGhNrnWiNN0lx2ucUFPxSGiQ5WRDYGn2pTLpANt7K9QNPAsbP9AESENuhsn/Iy
	 /lDTnKzEfE0SJ9D5erNttJpt29yKjBcRBO49snqgrgVN7MCwRy7JOtk4Le/R/jaFLj
	 KMDBWNNIhy0wmm5Km+25C5H0PX0PSHhclanV3qlR5z3P6xOfd53q/+CXPwpbWxY8f7
	 cQyxOkNAwwwY9ZHPF9KtnZ1v8zkajE8Dli4UWPDRcKuraGKq8QHuvJ8fr2KKW6tN1q
	 SoMuc8mBD4me5zpFzhT+2LuDh0CBG0DmsFX+iuYnD+wP7i1Ve6BT1xNaAOn/BGEprO
	 jWhdswTrrEHPw==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, 
 festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251219081354.3806806-1-xu.yang_2@nxp.com>
References: <20251219081354.3806806-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: change ssc_range value for
 i.MX8MQ
Message-Id: <176651186992.759340.3813003594906863484.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:14:29 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_094433_955457_61814C29 
X-CRM114-Status: UNSURE (   5.29  )
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


On Fri, 19 Dec 2025 16:13:54 +0800, Xu Yang wrote:
> According to IC engineer suggestion, set ssc_range as -4003 ppm
> will have more tolerance for EMI, and suitable for more boards.
> Besides, it's confirmed that with this setting the TX SSC test
> will pass on one customer board.
> 
> 

Applied, thanks!

[1/1] phy: fsl-imx8mq-usb: change ssc_range value for i.MX8MQ
      commit: c9d03933ea161a5543e15857ee519c60ec04fe9b

Best regards,
-- 
~Vinod



