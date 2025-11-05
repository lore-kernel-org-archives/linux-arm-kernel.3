Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7931CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZRTyQbwGvc+R7kDpBMaVlz3uvjTnQ5CQHAjJcXrCkM=; b=3Jm06otZpWHStIrc0TTJ8+tJW0
	J/A10XAIP/zM2q/sM+2Q54YDsDC1lyB3THaefoKzzyE+VIfIWwaG4sqjeY1rmqqCcOeIJYuN9Kkw+
	VV7tRXwaH+iq/WeVj/Y5vDFliqGeyNiRBgtgFYuSv8wZ9BnqBZJcVKsBePXDC1Q3x7Pm/SoJ9ExID
	kZO7aN54raofU/HMeB0f88aooXGjfWBeDQUm2UZI7zjENA/x4nDbp6DWZKEIzjN/nOXiy9oa2wwtH
	hrVEIjse1LNOPE5TJEzQWaz3Ul2CZGIbaI7C19u3wRmDUQwUdQ3iBt3kfs8jSlkb1FzvzhF6fpDYl
	vgAuBNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgqh-0000000E7m2-3Jb1;
	Wed, 05 Nov 2025 16:59:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgqe-0000000E7lP-3yBz;
	Wed, 05 Nov 2025 16:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 125EA43F4A;
	Wed,  5 Nov 2025 16:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCDCC4CEF8;
	Wed,  5 Nov 2025 16:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762361943;
	bh=1J87xzk9VW3lpoQ+hkZnGeccC3K0L5gdz2AKUwHegLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CQGTUh2juHjQ0qGUIJYSwANSA+HsCyK5E2ANQOb6XSJwLMqQtKobX/k4eSLUgrnrv
	 cRqV/j6qaJEaBvihDxBZ9DTHbT4Xx6CIkG2i13JVfNiatzPdQu94ogqOT2c24kiwMF
	 S7os2yloZfSuw+1CiKojJ722oHNUK+W2jpyliDw4xDcPBkjXcJ5QH5DAdU0XEPb9HL
	 9cuSV/NzXN0RGN+z+sClJ9QkwHj6Ga0JcvLzGCoxXY752HSwBN1Du17A09MOoP8u86
	 b0zZOGlB7UESmENdd2M67Z16PulHQrTGoNQjYqi49I1fR8g8CiOQJkN3J1AJM4yKPa
	 Vk9T2qwFrJ+tQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
 andy@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, ukleinek@kernel.org, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, daniel.lezcano@linaro.org, 
 tglx@linutronix.de, chunfeng.yun@mediatek.com, wim@linux-watchdog.org, 
 linux@roeck-us.net, sean.wang@mediatek.com, zhiyong.tao@mediatek.com, 
 andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, jitao.shi@mediatek.com, 
 Jack Hsu <jh.hsu@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20251030134541.784011-1-jh.hsu@mediatek.com>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
Subject: Re: (subset) [PATCH v6 00/11] Add mt8189 dts evaluation board and
 Makefile
Message-Id: <176236193629.37589.12615931533548308117.b4-ty@kernel.org>
Date: Wed, 05 Nov 2025 16:58:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_085905_015559_2AB9BE2F 
X-CRM114-Status: UNSURE (   8.53  )
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


On Thu, 30 Oct 2025 21:44:32 +0800, Jack Hsu wrote:
> In this patch series,
> we add Mediatek MT8189 evaluation board dts, dtsi and Makefile,
> and also related dt-binding documents.
> 
> based on tag: next-20251029
> 
> Note:
> This patch series depends on following dt-binding headers and yamls
> 1.dt-binding headers
>   1. mt8189-pinfunc.h
>        https://patchwork.kernel.org/project/linux-mediatek/patch/20250919020525.7904-1-ot_cathy.xu@mediatek.com/
>   2. mt8189_gce.h
>        https://patchwork.kernel.org/project/linux-mediatek/patch/20250820093831.23437-3-xiandong.wang@mediatek.com/
> 
> [...]

Applied, thanks!

[03/11] dt-bindings: nvmem: Support MediaTek MT8189 evb board efuse
        commit: 2150cd7ffd14a39fb56c2b3cbfcc6dbf629b7643

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


