Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C88C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3G+SIxKPBbyfBHRdfeHBZIIG3bjmVBlSkXauQhl1CU=; b=B6D7ZEd5z7p2yeisoEiRdtcq2I
	pr1k60kcI3Ouc/EcxpUBhsVpQXd0zymJvljFTnG+UOCnWWTVV1QKZhhc3uxstPY+AzGmnDR/B8Fhc
	H/nddk9RKrbTIiaDyewxocr+GBZ0c9dg8/5uW/ovAUWnM8nalHJ20oksZMbejBZlju9G6SWf/x2nj
	MVXlcT+J96+vkEqEt/Wr3Ceo2RNIFORmDGBYUXshRnKPwyGEvbxIdtvk7mNpCWNYBMlb1xkoGMAeL
	ZjffKVflNsvZz0fBMDi8w1oAGEmmQhoV+RO6+iOSEFZPmBx74djP/Gydj2hcp6wxJH7mKTEE73U8w
	gm/VggYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGvP-00000007lAZ-0qeD;
	Wed, 12 Mar 2025 07:54:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGnF-00000007jmD-2i6O;
	Wed, 12 Mar 2025 07:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=H3G+SIxKPBbyfBHRdfeHBZIIG3bjmVBlSkXauQhl1CU=; b=KWcpXCKn/kiJdVrdsT8Ce8qO8r
	TkotSHwgoDh5X6j/lkqW5gztcLvgf42GMn5/ugHqLuntJkHECxA4qFsnhztFVkRNlK0nP0LaNc6kT
	dS+NnwEjARovvQpBlzoD3OpfDNNnXvPibKDBMXF6+b6Rjwy5AgCFKfx2WH0ywLWSXNsct89J1DeWK
	jpPDD1roPEGtFIvdA8nGMYXhsW7QOJOtkCcudRqzh2KCZw+Ys+KOGRWaLBbopbBNU6xeXGXP0Z/2s
	6U0ICCfj7F7SSmJH2kB6BYNtrMpk3XOBXR3IXVvHfKFdU6wXwpzbxzb3zohhGAKVeKe25OVHgvJdX
	OjuU3cjg==;
Received: from ip-185-104-138-79.ptr.icomera.net ([185.104.138.79] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsGn6-0005zY-8M; Wed, 12 Mar 2025 08:46:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: rk356x: Move SHMEM memory to reserved memory
Date: Wed, 12 Mar 2025 08:45:57 +0100
Message-ID: <174176555638.249409.3786119315566916178.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250308100001.572657-2-amadeus@jmu.edu.cn>
References: <20250308100001.572657-1-amadeus@jmu.edu.cn> <20250308100001.572657-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004621_683573_86475551 
X-CRM114-Status: UNSURE (   9.04  )
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


On Sat, 08 Mar 2025 18:00:01 +0800, Chukun Pan wrote:
> 0x0 to 0xf0000000 are SDRAM memory areas where 0x10f000 is located.
> So move the SHMEM memory of arm_scmi to the reserved memory node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: rk356x: Move SHMEM memory to reserved memory
      commit: 19f48b687566b0f52c9ca833fa1f0c27ce44e1ba

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

