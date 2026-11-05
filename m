Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A118F606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y67zZlTG;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=oxUxuzKw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=94WhvBOvLikVnBdkqmMS0BP1DzIOS0lU6UoyFCQ9OjM=; b=Y67zZlTGCHPHvaclMMPes7yWXf
	U7CUwDsJRe41HAxK5B5BFfTUELC8+vPMB8aguHV5F50Rjx9GkZFbsc3HtF4ZvxZRDTds8kKZrfxwp
	Q+kEzxXLMopDJWmJsJpfasv71Cy3kopUeLmhjJqXO1qL/lXOjOM97b8mEwXpECHzVBdFc88KSENfl
	CeZz61Zgr+AV8jM/v/cvjXSYSPQNLMjgD+KuGN4KcDTaVRSMSiowDx2H4HNUOOmn+BOH7PCVUZI6t
	aMZElR0r4dNk8MMltMHbSpCcNdj7KpfqkCOizsYuyAoetfFDRDQe3SgTSsevg2Vgc8pG+7l7Nf0Qj
	VW6EzD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxR4-000000096sU-40uR;
	Thu, 05 Nov 2026 13:23:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxR1-000000096pa-2XUu;
	Thu, 05 Nov 2026 13:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=94WhvBOvLikVnBdkqmMS0BP1DzIOS0lU6UoyFCQ9OjM=; b=oxUxuzKwg9gT4g2DKyoFBl/WI5
	AbuiwNJlmwsdPRj3bXD9gfgwsoZ/KN16pH4zRlWrtXehOIZVACMvZY4vYYNpwOyJXTy/i7QPukr+8
	qlCNmtGYnlptdTzVZ+P6ag2rARROCx4HYiFeLDeDMolD+x+TNVJJZcQ2y2kTPwEhtJWfwmeT+U7x1
	sIfgCZdmvz47620kQNc+znutAi4gJOakEtEurl3RH+kJTyVnIeC9NpAxAt7iEo6DHEqghkVUn+5pn
	tEFLvsojd+1WSFwo8f0emOSYx9Y3khSJbYOIfZYsHejpiuAXM2FvaBEn0WYypGP18xmPsmsxFxDum
	22wo2MHw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Daniel Stone <daniel@fooishbar.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Stone <daniels@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color format
 on DW HDMI QP
Date: Thu, 05 Nov 2026 14:22:44 +0100
Message-ID: <34506010.aRNtrjHk3s@diego>
In-Reply-To: <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com>
 <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_052319_876070_1B47EB31 
X-CRM114-Status: GOOD (  17.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Donnerstag, 5. November 2026, 14:04:25 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Cristian Ciocaltea:
> Hi Daniel,
>=20
> On 11/5/26 2:25 PM, Daniel Stone wrote:
> > Hi Cristi,
> >=20
> > On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
> > <cristian.ciocaltea@collabora.com> wrote:
> >> Changes in v6:
> >> - Added new vop2 patch "Disable core clocks before dropping runtime PM
> >>   reference" (Sashiko)
> >>
> >> Changes in v5:
> >> - Added new patch "drm/rockchip: dw_hdmi_qp: Do not mask error code in
> >>   atomic_check()" to fix a pre-existing issue reported by Sashiko
> >>
> >> Changes in v3:
> >> - Updated patch 3 to skip any hardware programming in the callbacks
> >>   gated by drm_atomic_helper_commit_planes() after powering down VOP2 =
on
> >>   an atomic_enable() error (Sashiko)
> >> - Ensured VBLANK events are sent immediately when atomic_enable() fail=
s,
> >>   hence preventing userspace processes waiting for the page flip
> >>   completion to hang indefinitely (new patch 4, Sashiko)
> >>
> >> Changes in v2:
> >> - Addressed several issues reported by Sashiko
> >>   * Reset AXI before detaching the IOMMU domain, to close a theoretical
> >>     window where stale or in-flight DMA transactions could fault or
> >>     access memory untranslated after the domain is detached (patch 6)
> >>   * Fixed resource leak on vop2_enable() error path (new patch 2)
> >>   * Balance state on atomic_enable error paths (new patch 3)
> >>   * Avoided division by zero when computing max_dclk (new path 4)
> >>   * Fixed VOP2_MAX_DCLK_RATE overflow on 32-bit (new patch 5)
> >=20
> > I think everything in here should now be solidly reviewed.=20
>=20
> Thanks a lot for checking this out!

except patch 9 of 15, or mail hasn't turned up yet :-)

It does look fine to me, but if someone has an eye to spare ...


Heiko



