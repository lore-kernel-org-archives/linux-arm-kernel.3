Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812D6D26D94
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDoxBGvur96sn5UQABuJBDOzxmuF+TGUGL1bD2paGak=; b=QSXFPF/ukYHIEE863wBn0F33rJ
	svp5YfSfXkTBzNrRA7R8IgdvcwD8qLMNGY5CJhsf2QFZon5j02tU3UP9tXMKwSc2iCmJTMIcQrDfd
	66o6O+VUrMAmLgttHtqOZCbkxF8NZzpH1Uk0/HiSLjXBON9W/TzMc/TWWnBxcMmjmehKLBQZXzOna
	z3ZvSxW1vw5Itryrwx7+s/stPgbVfXwFbNy4kouR32oylblXvqdwOWjKaDNgO5dyMvYkTOFUC2pDf
	72gti/Lrpu4GpT5FrT1/ncaKjmxN3BGWK+aqchTHMmg29Z0TEHlBkx60/FCL0P7c0y3TErOmn1A40
	EY9US5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWn-00000002xEw-3OpL;
	Fri, 09 Jan 2026 19:52:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWl-00000002xCZ-0xj9;
	Fri, 09 Jan 2026 19:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=PDoxBGvur96sn5UQABuJBDOzxmuF+TGUGL1bD2paGak=; b=Az7xRXFY+vWHCJXqMUIfTMQ7nJ
	yQM+qcsK/mjBui8Bx9ZV8bmNSTgV/ZtuLXBfVbSToUy0IjWu4/7ePv1rTrFWWgWcoXSL2V8wkQvn8
	47cCxQkCSKC5peuXoWa3QwPBP78nq5kA/vZpm+Z2T/GcoKsVf1PLD6OfDxRtks5wq87IhIJBzeEpQ
	LWYXT73dORYYdDXteTxd5qfDGm+skyEtuvDJxW9XtyQs2Zv4Wyk2IQ6nmBh148zIvpUBTipAuT4Wm
	1WM9YJb5vQR/ueNjFH7siKEZfxrZm8uQHZH62lFRvWI5wbxoSK98fVkpipol0cCSyGlGTqv+bGU/+
	QE4FNyUw==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veIWi-001fth-WF; Fri, 09 Jan 2026 20:52:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Drop unsupported properties
Date: Fri,  9 Jan 2026 20:51:55 +0100
Message-ID: <176798831390.3446147.10789004722764768066.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260108230607.1348879-1-robh@kernel.org>
References: <20260108230607.1348879-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_115207_265114_46097F96 
X-CRM114-Status: GOOD (  10.95  )
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


On Thu, 08 Jan 2026 17:06:07 -0600, Rob Herring (Arm) wrote:
> "pinctrl-names" is not valid without a pinctrl-N property.
> 
> "max-freq" is not a defined property name. Maybe it was supposed to be
> "spi-max-frequency", but changing to that would be a change in behavior.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Drop unsupported properties
      commit: 56e7cc8dadf91cd2164e5d6dac9258f448d50182

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

