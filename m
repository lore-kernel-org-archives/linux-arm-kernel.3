Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA671D31A25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHcd84zHOUudaHxIV5RcEWlZaOzRYSGxhjtMk9WwAsI=; b=rsFLVzJfXzhOBH69dx6T89Za0Y
	OfgsfTohKapWMyJ73kF1bUQ3JrOviOiRaWq0aM5PlhX4PiX426aN0Wvf/vfFyyCjM5wYowgxcYARE
	3ZnUInBIZdKof0zT3NT8pttXTMvIQb/hFOK9meB5EnyQQHc3lU8rWSvSnYI0XV5+ws3knKN1nlKiy
	WPMZdBvg9KcuUZqOKrXZf1yzaguycAP7fP3SDcHgqWJ1dl9L9i7PV7eAqLjh53eHsAZTJgXrBZMDg
	JM42FzWWU3thCkiY7ezIcb/XjZxvZTNgfda1NRWNaAppbX2H93lZzLNU8rTuFlBY/KoDsyyd6zaCm
	Zgz/mqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwJ8-00000008Liy-0Mip;
	Wed, 14 Jan 2026 08:32:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwJ4-00000008LhC-3QTs;
	Wed, 14 Jan 2026 08:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768379563;
	bh=hoxfy0ER/g+wAyeR3+r8k79uOE64Q3BdVvC8LlDiZg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S0blBjPd6ruf3r1TgKzm/WeFINixW9iY8V+LUMdVOBFMvFkCqLj6dYcloMepQpDA4
	 HLUvaOBD5w7ZFElVNuVUfcPk7NCinOHCm3yKsrFSkKFYjGt3aDdJq4FcucF8Xa+l+e
	 d/kHJZvGQLA4k2xNjq9Tb/4m3+B2x94rdD/lTniQBxHKU7TnehGnp/iUaDKkEvrxO5
	 ym3fmwPIh1L0eoC/GQYh1P/rm+6XrVVytlwx5OZhWjRwgI8pMqwHS8qnEwki3sjVw8
	 MPh1yJXdGzcNTz78aixoVt0anXKwUh7hhJqcTrop0G2UGB+gQyu3kfd9MERdjNJAnk
	 60v4glXUNkODw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B559B17E0456;
	Wed, 14 Jan 2026 09:32:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20260113110026.37032-1-angelogioacchino.delregno@collabora.com>
References: <20260113110026.37032-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-evb: Add interrupts to
 DA9211 regulator
Message-Id: <176837956268.8998.2468559603116961084.b4-ty@collabora.com>
Date: Wed, 14 Jan 2026 09:32:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_003247_057845_6D0F37FF 
X-CRM114-Status: UNSURE (   4.39  )
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

On Tue, 13 Jan 2026 12:00:26 +0100, AngeloGioacchino Del Regno wrote:
> Add the required pinmux and assign the right interrupts-extended
> to the DA9211 regulator (PIO pin 15).
> 
> 

Applied to v6.19-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8173-evb: Add interrupts to DA9211 regulator
      commit: 093d6e332259583a94d630897bdb07d6141bff57

Cheers,
Angelo



