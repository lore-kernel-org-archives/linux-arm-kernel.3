Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA2FD0BB70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhASEzqWkSQ2maC6/lvcxAC1VPsOBizvjq6mLRso0ZE=; b=QmqO54Qhsvau5moe6rL5+BQrj9
	d3KI//Y3Lxaz67r/bSYV+NhnOikBb4bCFJCdpj/xJhys2HAcUZAc92a2GSXT37HbWHEKnSNkm37qL
	02l/fQV/oZLssrkmG52Wc65qQ7ZnSDNePG10GEcaGJtaNMYwVa9BvS383Nl6pbJxm2HcIK3pX6EQh
	9zdBNjXd5ESXwjWPPTohUumftoVBSdi28vLp2kNPvSag12i9lY1d1xzvPxmX/p91gXeCR7WVkfdbX
	cns+x6pE6NaRNwd4CafXTGuE3+EevR34/Qo9FFKHTwOxggjF4zdHgoY+fAKHmdfJCBZ8OWh//93w/
	F8NYWVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tGk-0000000HIcE-44o7;
	Thu, 24 Oct 2024 08:32:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tF9-0000000HI5F-2rdH;
	Thu, 24 Oct 2024 08:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QhASEzqWkSQ2maC6/lvcxAC1VPsOBizvjq6mLRso0ZE=; b=DM0nZADyLQ2iVDPGwcedB/C3cl
	D+TqlBMIOSc9MzYfchaiQsZ2yZGRwPnyVMTLgakXqEhEvmRIo+K+KuYyV1bKmbfwAid9/SKsQMCwz
	ZkiZw1IRMjy4LJHUWCI2ZsOGZGFq11HWqhfjOda2vJwEaFHxay/tXNoUCjGWCTbysFaSxJ5sT7Ian
	qzTaVxpRRwcw8MQpcbV1JLi6s4LrqC3VozTeLWbHJtz5YlmhtTi3amE8TE/5KASQX3tDThqWXOiDc
	mUgRBVEj/xti9JoAYMm2tv4Gm5Nd8oWVDvGGgYY8UIL5iJqLskP8SpGOTKVpHgCRwDhKyt75JmAcW
	VATMc1Zw==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t3tF5-0002iS-PU; Thu, 24 Oct 2024 10:30:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v3] arm64: dts: rockchip: Enable HDMI0 on rock-5a
Date: Thu, 24 Oct 2024 10:30:45 +0200
Message-ID: <172975863601.1671562.16763365060415840002.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022-rk3588-hdmi0-dt-v3-1-3cc981e89afb@collabora.com>
References: <20241022-rk3588-hdmi0-dt-v3-1-3cc981e89afb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_013055_739201_E05719B8 
X-CRM114-Status: UNSURE (   7.31  )
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

On Tue, 22 Oct 2024 19:04:42 +0300, Cristian Ciocaltea wrote:
> Add the necessary DT changes to enable HDMI0 on Radxa ROCK 5A.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI0 on rock-5a
      commit: f57a8daf6bbd8e71f16693ad6d8421cb881c7fe0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

