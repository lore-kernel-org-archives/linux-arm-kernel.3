Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9521DC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHkTw+5dQpKApAYf2vFRe89RTpd3KgzlrH7Rrnw929M=; b=bQ8Gwr0QTwrDt8pDC6SuEkRDz0
	3CuRtDbBq6X/hFSgfVBJEtby5qsKOJHILmNO5YPDtXD54nEpvahM99cZgNiryUS+TYqKE9SBw7bll
	yeqi4jV12/aLLLKW58AvuLSMe5JyzOs5VwAiNyTtmBa6jm5jVtcrbSjO4SSSZQOstGNdME1YnC6PB
	Wguyuup2ajGIHw3IhIoLVwFVN8MMoQwEZuZ7D8rG1SaEdXKGhd/sq4U+SlOPC82zctheV83LjrqhN
	DVLpXX29sDQJFHw5yATYvmEr8BSyhACFDCFfy6YmBbLQi8vyswoPZcTPvoJIdrJL6zRW+R5A2b2ZM
	8JguV/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLhs-0000000CnWS-0j0c;
	Tue, 20 May 2025 12:04:28 +0000
Received: from mail-m81189.xmail.ntesmail.com ([156.224.81.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLf2-0000000CmL7-0dHW;
	Tue, 20 May 2025 12:01:34 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c04:7a30:290:8105:3706:5628])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15bc46b45;
	Tue, 20 May 2025 20:01:26 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	broonie@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	ziyao@disroot.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add spi nodes for RK3528
Date: Tue, 20 May 2025 20:01:18 +0800
Message-Id: <20250520120118.1246479-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <28b03818-0290-412a-8d1e-9b88a163d387@kwiboo.se>
References: <28b03818-0290-412a-8d1e-9b88a163d387@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0lOVk8aS09CHksYQxgYSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtPQUwaSEtBSUJLQUNKS05BSExLTUFOTUlDWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a96ed91f06c03a2kunmccf6e257ad0b5
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngw6MAw4HTE6HBpCCkNMDz4i
	MVEaCSpVSlVKTE9MTE9JT0NMTUtOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS09BTBpIS0FJQktBQ0pLTkFITEtNQU5NSUNZV1kIAVlBSklCTDcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_050132_457514_EDF0A3D4 
X-CRM114-Status: UNSURE (   5.87  )
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

> This is missing power-domains after "rockchip: Add power controller
> support for RK3528" [1], spi0 depend on pclk_rkvenc_root:
>
> 	power-domains = <&power RK3528_PD_RKVENC>;

> Same here, spi1 depend on pclk_vpu_root:
>
> 	power-domains = <&power RK3528_PD_VPU>;
>
> [1] https://lore.kernel.org/r/20250518220707.669515-1-jonas@kwiboo.se

Thanks for the reminder, I didn't notice this.
If the power-domains patches gets merged I'll add it.

Thanks,
Chukun

--
2.25.1


