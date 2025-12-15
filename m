Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47569D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qChWII7YU0dPGLuhGx6Hi0lLzxxkedT+0cFWcFxavFw=; b=0gNqQdnMdPVoLnT3Ru5Uo4pGj3
	u2YFjEhQTiX7ff44DKxT0x8RhdUQ1jFyAFl+AJ1McFb2unp46jE2LcdhiyuH8/59QnWyMwQzeYZH6
	+i7T0WJTIR1kN/Vq1bQ/g0AVRS9RVM/zyEHFn7q8trNAnfYUDZb09DB7qSYmebs8Qm+wEQjhoFbiA
	lJfhbD1LwvUBIo5yQOwp0PrbR4YP04zSEImDyo/0uB993ornECVdYrD2Db1ZBxfgNQ11Q+D/3DYNU
	Oyg/vo/Jmr0YVUywZkYRgXZ3XL54A2cLhcrrP2n8AVTfX+7rKufKebhN2C3WiSUGwO91iedLoOxT9
	rvNMAdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV73F-00000003YYR-1Tko;
	Mon, 15 Dec 2025 11:47:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV73C-00000003YXB-2ntZ;
	Mon, 15 Dec 2025 11:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=qChWII7YU0dPGLuhGx6Hi0lLzxxkedT+0cFWcFxavFw=; b=0s8PwH+oYvtcbINmpprf+s+aF/
	ET2F7leFesp+2r4coEj3JIW7NhD17zLVhJnZ4Pc71HnOjQmv1R4Ir+yTNJK+iBbk3U0SCgx/81Hn/
	WWx6L+N6f6UwLjDHPjZR0E1Wj4ZQoz+qKXwGCroTfOZMWsFOc0yq7YBNpBhST3h8HDv6gxcYPJZJk
	/UQgrJcHwJ08ACoHBcIQL/p8sbSSNfJLmt2nQiFtnzT3vjJfysShvFsH0+jhLXnbA0L102LYFFbRv
	6nK8UwS5imdNlvNqiiD7QH7kGpZzvrX+bIePchMh9hChgik8v/Cx77O59FNJW8tpIPfRURtNzyz7X
	wSkOIevg==;
Received: from [192.76.154.237] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV73A-0000On-Er; Mon, 15 Dec 2025 12:47:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Martijn Braam <martijn@brixit.nl>,
	=?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
	Pavel Machek <pavel@ucw.cz>,
	"Leonardo G. Trombetta" <lgtrombetta@gmx.com>
Subject: Re: (subset) [PATCH v5 0/4] Upstreaming Pinephone Pro Patches
Date: Mon, 15 Dec 2025 12:47:32 +0100
Message-ID: <176579924023.1404176.12391640220645132527.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
References: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_034738_819498_0F4F957D 
X-CRM114-Status: GOOD (  11.36  )
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


On Mon, 24 Nov 2025 19:46:59 -0800, Rudraksha Gupta wrote:
> Throughout the years, many have contributed to the Pinephone Pro (ppp)
> development. Unfortunately, these patches are scattered around various
> repositories in different states.
> 
> I will be attempting to upstream these patches. I will start off with the
> following small series:
> - Add light/proximity sensor support
>   - Link: https://codeberg.org/megi/linux/commit/f171bc7013bc7ad3de9af817bfbcbfa548ebe01c
> - Add accelerometer sensor support
>   - Link: https://codeberg.org/megi/linux/commit/b0bb7633e073a6760fa213b8c4a78ea2e73c7bf1
> - Add magnetometer sensor support
>   - Link: https://codeberg.org/megi/linux/commit/2f7e67f451f16eaf15b81aa1dbdf126d54927d35
> - Add mount-matrix for magnetometer
>   - Link: https://codeberg.org/megi/linux/commit/d7cd2eab931e32fa94408a96d73b4e6c0616107a
> - Fix voltage threshold for volume down key
>   - Link: https://codeberg.org/megi/linux/commit/7c496a5cc27ed4e38b740f36c2d8b2c62f80ae54
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: rockchip: Add accelerometer sensor to Pinephone Pro
      commit: abd9bb7ad5bdbbf76316013cda3812c2719a0210
[4/4] arm64: dts: rockchip: Fix voltage threshold for volume keys for Pinephone Pro
      commit: 5497ffe305b2ea31ae62d4a311d7cabfb671f54a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

