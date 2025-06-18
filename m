Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B843C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 09:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxgvbzOVdrAxEczG7xt+lBT38YUbQ/6F50glMQK2gS8=; b=0d/cSleOXLu+TczFsR4pPConqd
	Pm7HSKVCUGATA+/30ppZf/P6mY9E6AMaDyGz5h2Q4IDjXtfqGuMLLlZZc+V363B3Q90fblkZLX6bW
	RROsARie6ZCyonMVk21QeBvGu6r0qmFxc1CGypQVfW7n1psiRSUseNGtBZ3EKHes9yvES+2fzI+hx
	oPa4vQDibGHpH/u88Z8V6ZtqmBm0tDELHYadsoAYkPdCNsfew2EcS97Z/pvuT0dY4Dnj5n3odngcd
	mylj+Tdm6BnGm1IkZdIIolUohNnSJPL0rM2excRIJtd342k6P/NiMNAFPAVh22oHZ9pevsRU1270f
	fq+0WOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRp5E-00000009aOh-0kBQ;
	Wed, 18 Jun 2025 09:27:52 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRp2z-00000009Zvw-35ex;
	Wed, 18 Jun 2025 09:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1750238697; x=1750843497; i=frank-w@public-files.de;
	bh=GxgvbzOVdrAxEczG7xt+lBT38YUbQ/6F50glMQK2gS8=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RXinS2s4dUx7F0b10RU0gjtLMM/jHOobjIwjR7+FFu0k21bTFRS6s1wR1la+tfS4
	 iSNXB2EoSRieOFm6DTbNXATK/JioDvA1uWGi1dTpKn9llWpq7iKoaE3Q/6O6x3pYB
	 yhP5QabHmfeDXHsXckEkqRhtHTUBHOmuDut6K+AfaaLXD4oh/7pyGeTs86A6DTYQX
	 UuxAAwdirs1IAjnj4PqQzKxuZYF4f9F1AwgCRa4q2TQhGGgtvWFY0EzZBgoTFntt0
	 stLhUN6MjTaGPKkZwnDCC8rKQ3DgyjLfirHTkw+t9/jNEEL21VXl8asksh22Y5Bdu
	 nDzJJBzqdSn7h1t5iQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.71.197.97] ([100.71.197.97]) by
 trinity-msg-rest-gmx-gmx-live-b647dc579-2m42j (via HTTP); Wed, 18 Jun 2025
 09:24:57 +0000
MIME-Version: 1.0
Message-ID: <trinity-86a5b58b-a74a-48be-80ae-aa306e95f214-1750238697100@trinity-msg-rest-gmx-gmx-live-b647dc579-2m42j>
From: Frank Wunderlich <frank-w@public-files.de>
To: horms@kernel.org, linux@fw-web.de
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, daniel@makrotopia.org,
 arinc.unal@arinc9.com
Subject: Aw: Re: [net-next v4 2/3] net: ethernet: mtk_eth_soc: add consts
 for irq index
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 09:24:57 +0000
In-Reply-To: <20250618083623.GF2545@horms.kernel.org>
References: <20250616080738.117993-1-linux@fw-web.de>
 <20250616080738.117993-3-linux@fw-web.de>
 <20250618083623.GF2545@horms.kernel.org>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:hP8Ld9j2b2oQo62lTxD2sCQh/QnH0JXI+WPy/BMcds2Ntuk8dEcRGZiuxLul4i8uviVP/
 Gc3OpxiyxTkJ5snhLk27+9yx6JOkwGE8tx83eeW+ww+ekrhnEJBeajVyVfcJoamUQrrTOhlcYuba
 9GSVI/xPIiORJOgwP/t+pM7SZouPHN//M4Lqdnnz9i0NwgcEDHqPwm+t/XmBkcyf/faxCjU7Vpwg
 vxcPLEC25tlWBrU+sMVA3c4UtEBBBukS+CTBVxzGpXR1pxyPX7GUJiaXqfrmOLBaXHiLVIeX40Ld
 eAqo2c6X98jWbXosLybPPrGBZeIt0MHrQgSCN6M2xP6GHQsZWy+VgOy2bCU50VJIe4=
UI-OutboundReport: notjunk:1;M01:P0:N5Nc5QCAEMY=;gkTcsL6tpsiJN4jeXPaqRfUbu6v
 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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_022534_072246_049A08AA 
X-CRM114-Status: GOOD (  11.50  )
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

Hi,

> Gesendet: Mittwoch, 18. Juni 2025 um 10:36
> Von: "Simon Horman" <horms@kernel.org>
> Betreff: Re: [net-next v4 2/3] net: ethernet: mtk_eth_soc: add consts fo=
r irq index
>
> On Mon, Jun 16, 2025 at 10:07:35AM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >=20
> > Use consts instead of fixed integers for accessing IRQ array.
> >=20
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v4:
> > - calculate max from last (rx) irq index and use it for array size too
>=20
> Reviewed-by: Simon Horman <horms@kernel.org>

thanks for review and the RB

i thinking about changing the const names to this:

MTK_ETH_IRQ_SHARED	=3D> MTK_FE_IRQ_SHARED
MTK_ETH_IRQ_TX		=3D> MTK_FE_IRQ_TX
MTK_ETH_IRQ_RX		=3D> MTK_FE_IRQ_RX
MTK_ETH_IRQ_MAX		=3D> MTK_FE_IRQ_NUM

because of i currently working on RSS/LRO patches and here MTK_FE_IRQ_NUM =
is used as name=20
with same meaning like my current MTK_ETH_IRQ_MAX (where max should be sam=
e as RX and NUM
is one more because it is a count).
Current IRQs also target the MTK frame-engine which is different to the PD=
MA RX engine
used for RSS/LRO later, so MTK_ETH_IRQ_RX and MTK_ETH_IRQ_MAX are maybe mi=
sleading when RSS/LRO=20
support will come in.

can i change the consts like this and keep your RB?

regards Frank

