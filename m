Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288D8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhhcCDU+2ooKNbUhegC94na+OdnsS3UuZ3bz8FOZEF8=; b=Ab7dATGX5CC7M1WhjhhNQrKpXR
	6L6AVqiNV1n52I2T1G7A3IiVagqbomn6IsM2haPIE44KRTYOzi1PFVwnaLFDAzqcEX3mbcnhHupnW
	dwkooMpGQTITOzHaSAtwNOLHtGK8IRel+qvEWy2eRwwPjlzKXmRixSPch0K8DkEePXs8WVOMeEi/L
	pCnj75TYRHgf9kx6ZIppZ5JasUhP12WX1RaV0Q7CIT0VvPOoDZlwMZ8j2Iz+LZqvDs0eW5UZ1zNiL
	sCSi67LtIYDMVroBnqVnNlU7TAGbhDm05ajdMARKsAnMNPp68MAloqJE8SZqxI53mDpZNM38FNGDS
	gEk7lnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZp6Q-0000000Ba3v-1TND;
	Thu, 10 Jul 2025 11:06:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnYs-0000000BLB7-2OaY;
	Thu, 10 Jul 2025 09:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IhhcCDU+2ooKNbUhegC94na+OdnsS3UuZ3bz8FOZEF8=; b=snosT+UKyAII2Wc7nTc8MNpVF+
	mIqgSSwuyse452MxgLHuEYo6EpYzZGUCDYNwtOstxDYEL+JeBarSYsVxIJ9IVtWJE72YotLOfmcTU
	lnZUNSkLnYQfKdkQzjibOFgi6kfAXkaABJbjicp4dgEAwinOduDwRW8ABOWolxutbuNz0diiD+2Oo
	SugXN+6RGtNe9l8c+A47FfTIgVvcmjYtcoBeX8qIv6NbGz2bXmJaxuOEdluOk6F5fCEUZVr7gQtkP
	MTCHC3kTVeTTDKBljl9wqeW0dpANWmvklpV6Q/HkZOT7U5WaImyhB5q+35uhjYPDbkYvBgnAq7CMB
	81Elml5A==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZnYo-0003fo-Q8; Thu, 10 Jul 2025 11:27:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI receiver on RK3588 EVB1
Date: Thu, 10 Jul 2025 11:27:17 +0200
Message-ID: <175213962000.1887379.8818372315895664398.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250704-rk3588-evb1-hdmi-rx-v1-1-248315c36ccd@kernel.org>
References: <20250704-rk3588-evb1-hdmi-rx-v1-1-248315c36ccd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022726_627536_91E0F7B8 
X-CRM114-Status: UNSURE (   9.98  )
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


On Fri, 04 Jul 2025 19:14:14 +0200, Sebastian Reichel wrote:
> Enable HDMI input port of the RK3588 EVB1.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI receiver on RK3588 EVB1
      commit: e2fe8ad8f1e62c424b8b73cc89d1bc53d19c41b2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

