Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1809BC9EC90
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66c1qZb9uWQ91gm9aXXLZegL5Tmk8VbO1+aPcfVFTAQ=; b=2lkLn8mUnMQ2tYyvOsEYHO2HgY
	1BNoSywP8QPhJm8SmIiikQf2NWgsXa0F8D3TiYpJN0QtTAgT+Vv005rwAGlJZVvRBAAzIEB4fMOnY
	5RIsO+yaB0Uy0Hh8TYB/rZEGlcR7W1vrkXX0BGJK6ueMSoRvTaD4V00+DXrPb7mx0CfcVrtyR3Ivc
	kAlhltiCc8RMeDtj3Y98ZvEjxMArqGyoNYXKyllMB1uIDudC725BMKacN8NGyZs07hxGFxZLUng+s
	wIS4HwXgiUzud5OMrsfIcMcDOZW+iEZOXniDdDOqgk3v2OXxH843YT7xWxvB/LqpP5Dse2nvyVhwL
	niNAeHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHyD-00000005PFh-3839;
	Mon, 12 Jan 2026 13:28:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHyB-00000005PF1-2Qde;
	Mon, 12 Jan 2026 13:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768224508;
	bh=f78gp6boRiGgxdOsuYxB8AuLWAEzu6iYkpim1DtE1V0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a377KQy7q7rvGs8Nkk9WTyVAVs/kmJNHq8rK8hC2yY2YRzmSNdRL67cG/4QTEhPmR
	 lkUPc8C3qUVFlIWsH3riOyHqQ5H41AabjGnupkDWTIMngVQaAH3GClDJB/lrN5Dg40
	 fjUm1w29uQaa6tYOevOWGtHV06/7dMI5NuljeBlZoX4wfHt/JyE7TQXCthfF/tS3qr
	 Mc89DfdzgrBjgV05y65cxjD86mVXBMsgNHxTwHQ5lCEePEb3Pg8tNkdizcaaQn86Vq
	 pLuEcHHzspKD1Lc+H3lXla1QatB+AMLpmGnAhWufkxFuNU98HAbJuvEy/U3HZSn72m
	 xt4FdQTN6B2Ng==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B397417E0333;
	Mon, 12 Jan 2026 14:28:27 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Macpaul_Lin_=28=E6=9E=97=E6=99=BA=E6=96=8C=29?= <Macpaul.Lin@mediatek.com>
In-Reply-To: <20260112085544.2959250-1-wenst@chromium.org>
References: <20260112085544.2959250-1-wenst@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: drop
 firmware-name from first SCP core
Message-Id: <176822450766.38852.14968182973024481538.b4-ty@collabora.com>
Date: Mon, 12 Jan 2026 14:28:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_052831_814964_FFDFC5D7 
X-CRM114-Status: UNSURE (   6.81  )
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

On Mon, 12 Jan 2026 16:55:42 +0800, Chen-Yu Tsai wrote:
> Arnd pointed out that having firmware-name in the device tree is wrong.
> Drop it.
> 
> 

Applied to v6.19-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188-geralt: drop firmware-name from first SCP core
      commit: c3f6d533b76e27a6dd4264b0240f7742a4d79323

Cheers,
Angelo



