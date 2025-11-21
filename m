Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6EACFC509
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 21:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4dtC/m0OXwu0tkxgmw/ktEFXPVEOhpmsbD/MPB1w54=; b=l3xwOokV6TWBqpb58M4pyYBuhE
	zKJbEuKvjQTufGL1LfqPr7pXUvM4OaNhwXlwp1H2d0rE9b5r6w1mkJlTAi7w+sPE7cn/uDSEvVqOK
	vWtcuNgX5xdhEzgT2/N5nRKWM2qzbpDSh4X0+fbwetBghLIrivldH7dcb+By7ZUp6ekhozbk8tIx4
	momw/cOgbC8mSCKro3ogqOpOkDAAqrfAcUWfy2Rz3x8Tt0DzkSKzgEbtEOgEi4/Xd9PjyEx6axYAx
	8wTYcR85Z6k8FiJtbY6BC/KzgSArklaebseV9pLVIzWGFDDur2FUsezAvPMEuIDXFoeOhftAKys+m
	LJjxtEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMYwp-000000090Nh-0nxT;
	Fri, 21 Nov 2025 21:45:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMYwn-000000090Mr-0EyH;
	Fri, 21 Nov 2025 21:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=c4dtC/m0OXwu0tkxgmw/ktEFXPVEOhpmsbD/MPB1w54=; b=0WbA8+bnPdkOjJxWsQUTK1OmJg
	YjOKJV0ZI4ka7N2AEjoWq2qymAvVghMATvWtIGgIdmqhAOWxtnAyBig13z5yfQccfqWAZX0g2eZA7
	aGVgtxnr+fL22wMb+ZdGX2CmZSwTD/j/sh22b62diYWxovrWKyDWhqDp6zjtiXaB2/Cgrkx0qv4NF
	WGanm+px7agt5QlIJ9oV1oM0X+499ySK60AzSZwOA3s9L2S8E3HqurTKM4JzsBPrEUOCZke4LIq05
	xWRw3iwPpT4wKfdSV+is+V4orl8w2wqg93PTP81GUoWRaYcZrgVebAuPUzYUroIAQ4d0LIE7+Ltou
	TiGHud0Q==;
Received: from [213.192.12.196] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vMYwc-0001Qh-Vf; Fri, 21 Nov 2025 22:45:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: rockchip: update 100ASK DshanPi A1 support
Date: Fri, 21 Nov 2025 22:45:27 +0100
Message-ID: <176376151911.52478.4773292492841717025.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251120120011.279104-1-amadeus@jmu.edu.cn>
References: <20251120120011.279104-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_134541_119652_6F62BC10 
X-CRM114-Status: UNSURE (   9.72  )
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


On Thu, 20 Nov 2025 20:00:06 +0800, Chukun Pan wrote:
> Changed from v2:
>   Remove merged patches
>   Split patch for more details
> 
> Chukun Pan (5):
>   arm64: dts: rockchip: remove mmc max-frequency for 100ASK DshanPi A1
>   arm64: dts: rockchip: add mmc aliases for 100ASK DshanPi A1
>   arm64: dts: rockchip: enable button for 100ASK DshanPi A1
>   arm64: dts: rockchip: enable USB for 100ASK DshanPi A1
>   arm64: dts: rockchip: enable RTC for 100ASK DshanPi A1
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: rockchip: remove mmc max-frequency for 100ASK DshanPi A1
      commit: b120a9df264eab51952d0cf44c16f13f2606281d
[2/5] arm64: dts: rockchip: add mmc aliases for 100ASK DshanPi A1
      commit: 98461b5e3cdffd126aec610691078408c296d79f
[3/5] arm64: dts: rockchip: enable button for 100ASK DshanPi A1
      commit: 80ec14d1d2173cc3f225102a7db09a457541fe04
[4/5] arm64: dts: rockchip: enable USB for 100ASK DshanPi A1
      commit: d43935da2bfada9e83f5f7e46f7d72e5d4665bd6
[5/5] arm64: dts: rockchip: enable RTC for 100ASK DshanPi A1
      commit: e34003dd2fb05da8f420bbd7b8ec62ab88242c45

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

