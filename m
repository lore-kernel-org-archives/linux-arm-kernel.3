Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E44D6CFA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNcAXA78Lmf4S4GSMOlD97M4xfkehQtEkWEYKY3GGRU=; b=Ken8p8S7MikODUx9QCqhx0U9f7
	OKnPGrSP8R1ex/YZuWItYBD3A4cSn+N8zJ3yCBCyKPG0JH9T0gpgZ3jTg0+Gq5yxweTMHG2mL5/et
	xEBO8RHMNkJuq/1EtbY5/Vth5uCG1fmdvdz7W9vgyYP29RCMvyERGxMkw/XfNWW4EUCDd3daY8WXU
	OvNjNW0KFOJYHypssTOXp502NxBn2oJnnSAeyZlFPzwAigr/dqfyGN/6trq7KnFM0TEpDn6L5w6k9
	m5Q+8w8EN1dbaYpR4Rmqs2ptElwna5rGImdxNibsraaXzhsnSWNYXah1ECQo6t9ootVw1LLzVyeFx
	Fi59CtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizUG-00000007dhU-2I3e;
	Thu, 22 Jan 2026 18:32:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizUD-00000007dfp-2m7Y;
	Thu, 22 Jan 2026 18:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nNcAXA78Lmf4S4GSMOlD97M4xfkehQtEkWEYKY3GGRU=; b=j8ymQqVVDP34hMaNDAd6lsm2gA
	hUkLdSsKEo08LQ7zwkhttJ1uQ1iCfORq3BIFl76ch9eVplwUCTEgGUfte1vxkQO6xtTLlYCsn/r6b
	yUSE0djpElYDsij7vJBq/8ULeC2Knf8cftaOv6HNLvlcRxYrXci+8ZoXvK4lTEB2A06mc6EwggcUm
	2C+zdsBr6U+9WtBGfBOGWWtNU2uEh2vP067j0umnicDmUnUCRuD9InXy+2/uMzm+iGW1wDP7Hy9z6
	C6Y1dQq53pdtcb+SoiNzNE0lasVPeftkQJtaPHMcBKXYJP8Av9KlIKUxFrUDlgS7lN5zgthei3n5Z
	t/yKgPXw==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vizU1-003rA9-Ny; Thu, 22 Jan 2026 19:32:42 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576
Date: Thu, 22 Jan 2026 19:32:37 +0100
Message-ID: <176910675436.726233.5945062783721941669.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260121-ufs-rst-v3-1-35839bcb4ca7@gmail.com>
References: <20260121-ufs-rst-v3-1-35839bcb4ca7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_103253_701168_7FEFD6C3 
X-CRM114-Status: GOOD (  11.13  )
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


On Wed, 21 Jan 2026 11:42:13 +0400, Alexey Charkov wrote:
> Rockchip RK3576 UFS controller uses a dedicated pin to reset the connected
> UFS device, which can operate either in a hardware controlled mode or as a
> GPIO pin.
> 
> Power-on default is GPIO mode, but the boot ROM reconfigures it to a
> hardware controlled mode if it uses UFS to load the next boot stage.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576
      commit: 79a3286e61829fc43abdd6e3beb31b24930c7af6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

