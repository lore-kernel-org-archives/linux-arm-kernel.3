Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211B3C636C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuKRmFdpVorOkBPRtg9u8MYAq3fDYmh5MMIl7tdXRZI=; b=HP86E/PJh9Y1eixS/dQS4ywqjz
	QLAuGWD5T7M+6r2VMHuhMO0ybKYJmQWaE6RCf8Nik0O8MJYQ9np2qG0K3GIZAyOkqlGeCULmOhBZF
	6I9Ey2FFiyjzy0iFX47vLI3lvKjhOadrpdG+SPIk8iaytHdba7b6k6Sibymm6kJQXyv6whnTrcjf2
	c3g2gOK9QBBtnUZUbXeOUiR0im1LttmHwtpeLkjGDp9udCMFI7Pg1E6fBv0BRDVWJgoQNsA8LV/zX
	0PBVzonxx4/uZ95LWwX0BbVAO07BG7drGQbyqvn95rU5J6zzZlip1SxfbhICh3Nezk9N5DAyskPq2
	AlUFzVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuIB1-0000000H1Mg-1d6L;
	Sun, 22 Feb 2026 22:43:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuIAy-0000000H1Kx-2Jem;
	Sun, 22 Feb 2026 22:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XuKRmFdpVorOkBPRtg9u8MYAq3fDYmh5MMIl7tdXRZI=; b=zyW2IIik9kebKJCHB3euvjuKAQ
	Ko3k5FHN7PArfdmvDj1c/dCKjpzPwxLHfwfDs0soqYdesv/H81a8nQwCxrgMKFjcl7KaIE7Wv72VI
	f8Ggh0zek1YZ6XjQVJjM7yPmc+TakWrcGBln/GSNqWnYiOjkRHFpELNkht6d5zRcWjj2dW/8pjF/x
	/VX+Kwhrkk1qr590qQ6J0vCBOEmWRMIwBLDUh+aBkKrtPGsZoHHOS3N9eNpzx26B1vRUwgSbtnxdo
	wQ8guc7+reOnavIDszlMzR7Gjwfvntxjlnd2dfJ4ozvizu4gkyI4XsXRVqWjp3ZDoOtX+JXEyeeSp
	23Rx/1Bg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: add node name for RK3588_PD_RKVDEC0/1 and RK3588_PD_VENC0/1
Date: Sun, 22 Feb 2026 23:39:12 +0100
Message-ID: <177179992293.1861430.14271222400212376260.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
References: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_144344_591667_D572BB73 
X-CRM114-Status: UNSURE (   7.85  )
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


On Fri, 13 Feb 2026 10:35:12 +0800, Shawn Lin wrote:
> Thus the board dts files could add property for these nodes.
> 
> 

Applied, thanks!

[1/2] arm64: dts: rockchip: add node name for RK3588_PD_RKVDEC0/1 and RK3588_PD_VENC0/1
      commit: 9e79dcc4d8681df3ea1a0665dce5e35a37ece4b6
[2/2] arm64: dts: rockchip: Add domain-supply for pd_rkvdec0/1 and pd_venc0/1
      commit: 52ad35272559db09ad571d698665fe33d93534a8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

