Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33DCC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wG0VMVtyV5h1mlrkOa/d2VEkTJAENQTpUdtWi9v750U=; b=fKpbmHJX/4TcW1RLL1ScxEspLR
	XMVYj9gAC6eO/mwwVK8qd9yRUUpWHDJiZvLI4OtA+7HUG+YxXc7PtSeoT1PiUSEuYxkZgL+qtU321
	m1dGMEFJBgYIH+aNvCGfY2tysq/PMBx0qeePrCTzHpw7lhPODOCM0vgStXX4Ec9qvdRAZYUWn4dDz
	EQoNhazzdfL7Gn+c4BzgwJ2N4YcHRo/MNwupZckRjPZ9LM6OKXtEFzoYBM8A1aAEAnwWjUo6dV5f0
	l2B4+BWujNefyYBG+LFaAtFpFZZeG7cfMADe0VxB7TdMHuf/3p2jj3+0i2S9Qzuh+aZzcBk1LHDYu
	kmlJRmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4Y5-00000004suw-0ePu;
	Tue, 08 Jul 2025 09:23:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3w2-00000004mmq-00qo;
	Tue, 08 Jul 2025 08:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F73161472;
	Tue,  8 Jul 2025 08:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75519C4CEF1;
	Tue,  8 Jul 2025 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751964257;
	bh=7qiNC+yf9eJ5O6aMil6afPWYh5EWFpuGHBB+T4HRaHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kojm2K8sadJqZwidW0D255pG4egrPRco+NwIZwN2JQUuQmmZxqqurYiGaC6Tq0U3D
	 uEYguXM5hD5YlAIRH+P3vN7Soh3TH7YqSfMuhBGISKIpiIk9CbXs+K7UpEvuMhNV1V
	 7KeWZEakTIgt5GSKQ7ATYRDoGYQWUwmp2ZCFWzgc3VE5CHpyxHGCQfGD4kygE3ypbN
	 LCjQScINAi4Dmr5TV4sgDYG1ZTqnjMOgO0mPJN0wqZ3HlEX9rIM+LjP4CvENXSXpGa
	 VIhM0k4oY0ZM64mx682efn1r77iyV5dPx2zb2O1dczyYIvKXDPlZjYF/u0nQ78j/Al
	 oIQ0yzw+T/5Pg==
Date: Tue, 8 Jul 2025 10:44:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] watchdog: mediatek: Add compatible for MT8189
Message-ID: <20250708-devious-pug-of-kindness-4f8dfb@krzk-bin>
References: <20250627094431.11772-1-ot_zexin.wang@mediatek.com>
 <20250627094431.11772-2-ot_zexin.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627094431.11772-2-ot_zexin.wang@mediatek.com>
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

On Fri, Jun 27, 2025 at 05:44:19PM +0800, Zexin Wang wrote:
> Add compatible string for watchdog driver on MT8189 SoC.
> 
> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 91d110646e16..ae61e7654e8f 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -501,6 +501,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
>  	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
> +	{ .compatible = "mediatek,mt8189-wdt" },

Redundant commit, really, a least with that hardware description as in
commit msg.

Best regards,
Krzysztof


