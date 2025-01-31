Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC5AC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSoVraY0r0unFouv2cjJlPgOV3B6gjB8B9pfH1AHEBQ=; b=q41M/FO5IBSlkfzIFbqziEdfDj
	SrV6tbbbnQRMdsvkdcbteljemR1tbzgG2rmzoJK3EO66jLydf0k6cHAuXdbhmC+baa603HfZgzd0A
	OH4L2rs9h6lPuuegGyXBY/J+hZILGe5rYmxZ+AM+NfxpWlVFf3aqZiRp8aWPukHXPpMkzwSwW23IL
	dyUOSj7TRDt4yC39+LMGuPpTgEdDuRjbeV3IjIMwb3RY/KtVgF0EWiE0clFtFxmqeYgOlzEQ53C5y
	D88KWV7XmtVGFSdOb80wjGH66jPdbYiD/HI+s1+YP/vqORjQlLOWnEIy301yS6AMEzGyaOf8u76fq
	CbANexkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnkG-0000000ALe7-3gdm;
	Fri, 31 Jan 2025 09:55:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnhi-0000000ALJp-0WOv;
	Fri, 31 Jan 2025 09:52:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A163D5C4D88;
	Fri, 31 Jan 2025 09:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FEAC4CED1;
	Fri, 31 Jan 2025 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738317169;
	bh=bBWySW1/lROaMs3/C2As0r11HJEJ2oZDK9hKpWsk4H8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qjCTzZgomyBIL2KotNx2A7QXjlxQnyzQCqmYDV41BoAdhIo0IXbyBLqaK1f+Hjsdq
	 xGfaerIaaVKuqG5K2h7+Uku1vGHdM7EaN+yGD58o9C+75uxvz4JJcO5MQN+hSYeImw
	 b1NlTQL0emE8fjJVdjC4hLLPTYknwmrkewsicueYXyRWvAvtxdaFgESaGSyH6ltrh+
	 TTSAt1xAP4EFCdEcXNQCBa+1lrDmhpzdzrNgrnn/+F4ju7pwG9coApq1fh/Rg92t/y
	 IrgTRqGC7bn5BAVbAttlRhSyBb8fPb6r8KDYa69NC/GtX7lXU/bsbtQW4U7D4Vhwmp
	 l/xAZVRhhxmEA==
From: Vinod Koul <vkoul@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jianfeng Liu <liujianfeng1994@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 0/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
Message-Id: <173831716590.670164.5196739962949646746.b4-ty@kernel.org>
Date: Fri, 31 Jan 2025 15:22:45 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_015250_208944_A3C21381 
X-CRM114-Status: UNSURE (   5.24  )
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


On Mon, 06 Jan 2025 18:00:00 +0800, Chukun Pan wrote:
> Changes in v2:
>   Matches the '-ENOENT' error.
>   Use devm_reset_control_get_exclusive.
> 
> Chukun Pan (1):
>   phy: rockchip: naneng-combphy: compatible reset with old DT
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip: naneng-combphy: compatible reset with old DT
      commit: bff68d44135ce6714107e2f72069a79476c8073d

Best regards,
-- 
~Vinod



