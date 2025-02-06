Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EEEC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNh4bBgia2Ipni7dJuXwcTOev81RT+xOna48XaoTDik=; b=CjDBl3OztT6P4zycrVvK1jIS16
	/4BRMgf6MkMyAV8ZfzsvNOxw5tHacA+tQACO19Arau6/nXBuDmAyx/bIRTWMH83HNVx6CgA5ueXGu
	MH/xd1VFrvBdvbSovdl4JXggjZ+xFpUdAJmiwmhs21NgiRWmksEQdRoPlrhlpw4dsuOXgW75ifOkx
	Oq8WgIL/r5fa3mhicwmSDeIWAcCraEQb2PzzpryJrS786nClpa4y4vaT8M8RDO1+lxfHjIxi0Gt4i
	GpRP6tLm5xPJFV4TfQeBtBpVlUduy9+EPhWIuJva0VWFGE7ZCQRAen6htgfxNMrGi0tfJxYHYUbMe
	13FCUmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0JZ-00000006BMH-0PHw;
	Thu, 06 Feb 2025 11:45:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzkT-000000064hf-28ae;
	Thu, 06 Feb 2025 11:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738840123;
	bh=YsyAjTedAN5lyZo0FlAMasVTbgpk/AriGqi3k2NqfyI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=YO9wn3cq+a2cUFa1ojHtArWBgvsEXO2/5exII35hqGFtERjeT/HUdGMicR8is2p42
	 PMAh5yoAiaONcZ5/4ZQetDuCBICzQpnYXGBoN+uG6+5wuFo4EWdtL0F4/2TBj7JzuV
	 UasLuj0oBb/g6Ciwbv1L0vAF5Cn9YUzs1zktw2IPiptsVngA6xzP6iywkOg4RTk1w1
	 2D4FLbeSvEGL5truUC0NHAytEeqzTP6jgH4+KsvnQ3cNuKuHif5lBjICFaTbdt7SYF
	 iYl3eJv7P2Bl8Jp+asbIRZQGHosjZqdxzph/GiLg8cVAE/sFtjaPIJV5MNXbrX0VFh
	 PFtI27MiYf6ig==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 510A617E0F9F;
	Thu,  6 Feb 2025 12:08:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Danzberger <dd@embedd.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, upstream@airoha.com, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250105150328.15172-1-ansuelsmth@gmail.com>
References: <20250105150328.15172-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: airoha: en7581: Add Clock Controller
 node
Message-Id: <173884012324.110657.10404370781267442733.b4-ty@collabora.com>
Date: Thu, 06 Feb 2025 12:08:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_030845_703094_9357AF37 
X-CRM114-Status: UNSURE (   6.00  )
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

On Sun, 05 Jan 2025 16:03:02 +0100, Christian Marangi wrote:
> Add Clock Controller node for EN7581 SoC to correctly expose supported
> clock for any user in the SoC.
> 
> 

Applied to v6.14-next/dts64, thanks!

[1/3] arm64: dts: airoha: en7581: Add Clock Controller node
      commit: 7693017580e9be839fa5f27130bb6500f3597595
[2/3] arm64: dts: airoha: en7581: Add SNAND node
      commit: 8e2e6908a8919a8608866626e5b3bcf242f90b38
[3/3] arm64: dts: airoha: en7581: Add default partition table for EVB board
      commit: 34833a6f17f6ea99fa9d7788d93221f610061d23

Cheers,
Angelo



