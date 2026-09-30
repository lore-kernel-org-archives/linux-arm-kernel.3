Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47096CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOkj2/NJ68nu7y5h+AGIOhr5AdQrQ8tR9kgRub30cxI=; b=wLlnBIQ8Mhwzp42/2e+WMBRI0P
	W38mLlDfTakTcadeMuf8XxR3ssg5sWL1dl/mh6AM/N3kQekTN/1GPpZ7deZLalRWzVIvdmOFr4es7
	ywHegxaC9CKrdM8EZZMuunWZ3NaZw26GiD1qQaAg9ikDMB+D2yk5N0tWR39NlgkfaWQkH5mExi3s7
	+JmQJb0VuVSJNpzHqJgnOkhYyG4qd2/VBdzkSiZaEJeAgFYG3JNeuJGc+F1nBuNhQlBK4lkZc+pM+
	3Q75ULGvQqNy+3jRli+SEkhw0CR1tnngCzS23/8lMoc45lDyU8zXlasu5gZq4DnFl4pVtV4MZ/fWt
	4cb3vjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzNl-000000071V1-2EHA;
	Wed, 30 Sep 2026 18:50:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzMs-000000071EZ-1kJW;
	Wed, 30 Sep 2026 18:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nOkj2/NJ68nu7y5h+AGIOhr5AdQrQ8tR9kgRub30cxI=; b=Tbg6EGF7fqC4xtrbbOQppHFOmB
	fWxivvhBU+em5wdf4XNeaSv18LHLaZbq8ghOu4leOPFMDBmSDNRyCR2v0v+x4ilmxtl4tQa7DlVQd
	ywAeYrbx5WfABthdp/7DMiFqDDiX7m4Q3CdCDHdrNRfTTh4Xw6PaDglF3xu8E9/VPQXApfQVCo/rL
	oyTlzjT5W4fsooq2nmEHRZuc7t6K28VqWiKYcS1pGBG/zBIHTk6P3Jh80bMIdU8Oq7VpIIVUja1iL
	IK0JrlULAAYqRhSVVX7+dj9xPSlzftB5LQ04RYViNJ0hgOUC7NhZDIv+cheMwEsrPSz6pUlUeaIME
	HnKUAJrw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBzMp-00000004DRE-2kME;
	Wed, 30 Sep 2026 18:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nOkj2/NJ68nu7y5h+AGIOhr5AdQrQ8tR9kgRub30cxI=; b=qu5cFbm6PMl2tQg99IiRVgNG89
	LGuamJDMFlPTNYegtS4dTEubvqlAZyAMtoaaej29CmA5HPa6si+t4qn0ASCU0fznj3fZF7J1mt7PW
	iax5DDvyfGxGWrJaNNmCBr80psChQ3qpGfpkjL7Gd6otk0/W5EYa74XMRLU2TfFsZMqd+8xNv35oB
	R2H7cYHnm8XYuaMuENjWJMu7XsVqggwRbz+BurC5ZB4Vbh2XETeQe5uzw3o4R9TgV29N4tsf4Azcn
	ITR/2HIxl1feGDxicgfF/DmMT0d/g1RbU14y12hCTBX5UcTpYAY83z4/vwwu5+pZ7/3ngAiIGe8ck
	Tnr/mLgw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <diederik@cknow-tech.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Rapha=C3=ABl=20Jakse?= <raphael.kernel@jakse.fr>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add supplies for es8316 on RockPro64
Date: Wed, 30 Sep 2026 20:49:10 +0200
Message-ID: <179079409726.2398180.6334756596993767242.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922133643.2730265-1-diederik@cknow-tech.com>
References: <20260922133643.2730265-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_194923_944715_73F7B33C 
X-CRM114-Status: GOOD (  13.36  )
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


On Tue, 22 Sep 2026 15:36:22 +0200, Diederik de Haas wrote:
> The DT binding for the es8316 got 4 power supplies added in commit
> e9966d450b46 ("ASoC: dt-bindings: es8316: Add regulator supplies")
> 
> Page 28 of the schematic for both RockPro64 V2.0 as V2.1 describe those
> various supplies, so add them to the DTS's.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add supplies for es8316 on RockPro64
      commit: 9f587b25d9db29d180a1e483651dddc80f898db6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

