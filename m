Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2B9CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDgiypVIwA/PQvdX7RyrKY/+g5n+NMwhEKvQxfGp7xE=; b=lvOvMYIKBmfbBc672/oReR1PM7
	NEkY2ctlqgB1FE4p1bxvW9PpuA7fYug3ww8DVI4egzYt/vJ6CsWTvdDqareN+mByTlb2iuoonNk3E
	TMOU3LkIqUNL9UGUUgYp49YKME26Odo8u19X902HjcqCQc8GMzds2UL3lS3FcQuXL2mPjtJs/2xma
	U0wxicseDHGosqbD8iSXg8cyPDnGkjnP+5fJ5I1JydmFdkxCRvv2slDwNd9xBBBXDiqIEhu+qkQjZ
	/OoE+bPYmPL/VKnyu8YqSfzQ6304G80BDclQLElkAamZsOelUT1Ak8JqnhzTvETKyZm6nWk5EZcEb
	bOFNCawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhnr-00000004nEt-3AUZ;
	Wed, 20 May 2026 14:21:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhnq-00000004nDx-28za;
	Wed, 20 May 2026 14:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GDgiypVIwA/PQvdX7RyrKY/+g5n+NMwhEKvQxfGp7xE=; b=WixYvNLZnwbi+Wy8l7n2aZrSLX
	1n2TMbpSF0rC54FLkAITvIiaNFtItXiawaXRTInMctrMjEEzrwylvBzY6RBZzKHMQlkONqZF/w/Br
	mrNbYV7HySrh6Q8H3z4lHFPCQ63L2NfLep9F9V6FGSqLjFbaM0utByQgJtQI0KbobzkIQ3++FIcHA
	5TV8MENexvq9ipYkRB9iybyZ4KKqFSpIiaUFsTpBSoRg4F4ruxTnjLZz9vSl/uX0DcWK0POygRw1R
	IqbsNY0Jot32XLQBaGSvx3GgH2So52C5w7DCoSUHHWYAmvKUp2IVr6is1ToGaXZBh8ffd8+pgdAMq
	futhAalA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhnm-0000000H3MA-06WD;
	Wed, 20 May 2026 14:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GDgiypVIwA/PQvdX7RyrKY/+g5n+NMwhEKvQxfGp7xE=; b=qKOs1rSHUfFyQjQ2QU90qLmsEG
	E4rO+KqFDvZdMnNVkhT2xM9SqMD/CMUMADckAN8zJzIgHiiRGrfYvDLfVYwvte7zRaDJPjinr9dN7
	W41mCtDYikWfvkdAm1kyTt5Ns2JB93TsQ4vLGQVdLdw8UDj+b5s76SDCSf59Tvpostexn9puA2nth
	1WSXxPyw1cawkSEQwtUp6XpmyN9Z6+X49zn1Jkj0dxFSvWFTrY7Udx+xmwDa/G9o8rsguZyCHlSmu
	oG53XHOV5DRGeBYTKUVFMdMkD5aBSLI4rVQszy9k+eZF8tHtjXWW6HmPSv6IqLIL+WyoyuC5IVfQI
	V1VVfT8w==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-phy@lists.infradead.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v8 phy-next 15/31] drm/rockchip: dw_hdmi: avoid direct dereference
 of phy->dev.of_node
Date: Wed, 20 May 2026 16:21:24 +0200
Message-ID: <3758596.1xdlsreqCQ@phil>
In-Reply-To: <20260505100523.1922388-16-vladimir.oltean@nxp.com>
References: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
 <20260505100523.1922388-16-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_152138_835037_C5291ACB 
X-CRM114-Status: GOOD (  10.00  )
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

Hi Vladimir,

Am Dienstag, 5. Mai 2026, 12:05:07 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Vladimir Oltean:
> The dw_hdmi-rockchip driver validates pixel clock rates against the
> HDMI PHY's internal clock provider on certain SoCs like RK3328.
> This is currently achieved by dereferencing hdmi->phy->dev.of_node
> to obtain the provider node, which violates the Generic PHY API's
> encapsulation (the goal is for struct phy to be an opaque pointer
> with a hidden definition, to be interacted with only using API
> functions or NULL pointer checks, for the case where optional variants
> of phy_get() did not find a PHY).
>=20
> Refactor dw_hdmi_rockchip_bind() to perform a manual phandle lookup
> on the "hdmi" PHY index within the controller's DT node. This provides
> a parallel path to the clock provider's OF node without relying on the
> internal structure of the struct phy handle.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Reviewed-by: Heiko Stueber <heiko@sntech.de>

there is now already more stuff depending on this change [0], and
the change itself also is sort of independent of the whole
phy-series. And somehow this series itself sadly hasn't gotten
much review yet.

So would you be ok with me just picking this one patch for the
drm-misc-tree?


Thanks
Heiko

[0] https://lore.kernel.org/dri-devel/20260518193748.2482823-1-jonas@kwiboo=
=2Ese/



