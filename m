Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E390C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JjkQbWY/HnPp5mgL4PyI7UmyjOUB6NOpVVT766uZ7M=; b=a+O8K8dNfIIr63OP5qvtrYdbWB
	C6pUqM7piVUaiVBcS6kEAeKZdgXQuf9hHC/PvzzJJzj5TKTrenfAYwAgeE3vEN3LGLidBZwpVnM/9
	OdZzHcDbuCxm05NIpgeAxA6Bt0oaen6MLFUINpE1AjbCahtyFQpev+lcxWEX/C/bTmx1eBJ72P/d8
	7T3sKtod66po4izd2ZBfwQ7IchsxqHVl6a/lC/bUPfEbythul2Wc8cX5nI4Qd0vzXOG99Hzo73uKk
	LaF269ht1fV2Q8WgPMf/7MmbDRPencuCHBu3Rpyx/KbkpktoX6BRZgv0/eMbHL1aovOkdg2JhiygW
	GvnSqZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1h1x-0000000Gnw3-3gAS;
	Mon, 07 Apr 2025 07:36:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gk7-0000000GiTV-3v8s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 07:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1JjkQbWY/HnPp5mgL4PyI7UmyjOUB6NOpVVT766uZ7M=; b=0titYTkDoxaYelZsph46XGJIsw
	MPqXxVEmr2+oK/6jc1wOBx0xJ3EWYSUY6MDQUFF8OkLjm/aBxnqx20eco1CAiUAqjzMMKUd2yFVPZ
	1v6jaVhAoqis+uX7ZelcAeA3jm+DPWFj/2u1nv+wE6hNiKpoFdtspe5djqLV2si4avIjEDvtSl9Wg
	KTgQB14K3WPERh50xu5k0u92785ScWt49Daql1c3DTG3/ZiSyGouBUdLbLKq10+Yok1RYnUA5xYmS
	60gWwsiB80IKmCZWZ4e93bZahbNyZanyjoAtTJ4siokgxNPB3xB22HM5dcPNZKXdB5nBxxXXi3hhB
	s59kFcNQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gjv-0000tP-2Q; Mon, 07 Apr 2025 09:17:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] ARM: dts: rockchip: Add aliases for MMC devices
Date: Mon,  7 Apr 2025 09:17:39 +0200
Message-ID: <174401024396.372530.9920450693183884709.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324125215.160616-1-andyshrk@163.com>
References: <20250324125215.160616-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_001803_967736_C4368C2C 
X-CRM114-Status: GOOD (  10.65  )
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


On Mon, 24 Mar 2025 20:52:11 +0800, Andy Yan wrote:
> Add aliases for the MMC devices so that after the system starts up,
> they will all have fixed device numbers.
> 
> 

Applied, thanks!

[1/1] ARM: dts: rockchip: Add aliases for MMC devices
      commit: d15d8d234248d6575b2d4efc14731d0a623f89d0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

