Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A2AE77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fq9JIGFqDS16sxn3B26QdkQ1K0WJfrg2r7kx5NZceXw=; b=I0dCxTzK5ZxuKB+TVnSU0dnwuj
	DBrXYcMjx7xihBIDl1sOy+zZesKk3FH2KawexBIFeFCi3KvtxDl/lVvxRNqeYpAFbWQDdaAnuZe5D
	Hj49uGhe+9oj19nNppCihfv4itCa4Gd3p8a/DRBTvTnb/nQjA9LWpOEN4zGj5rA2bfCGiALsePawS
	PhqSFcTW6Vlapp2PCM4bDkH9hERuu/F5f/XnDvDUg+NYfEK69DJ1cBUAjlDhD+TnJ4x4FG6WAlgjQ
	xEPNag2JAWyETBReEzWgTMfdaxyTOgydXyAfKcoA5Ty6ZcJLGwvtEeubY3rn+6AiPfDDW+S1TsIRa
	xHaeBIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJFg-0000000ESti-02ng;
	Wed, 11 Dec 2024 09:43:28 +0000
Received: from qs51p00im-qukt01080502.me.com ([17.57.155.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJEb-0000000ESiz-11ff
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1733910135; bh=fq9JIGFqDS16sxn3B26QdkQ1K0WJfrg2r7kx5NZceXw=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:
	 x-icloud-hme;
	b=zTnDDMAH4Ey+MDZrcO8bYh3Wah8y9FtqGwW70+h1f9Z+CiMufChJPkVHKyfIl1hxN
	 ca6Hua3p1jSGQ2r3ELcrSfgdegVVJt3J4BANb79TEGQUMwXICzGWcms0mVMbsjvwVn
	 FYin/Tt6Rz2j1NalN8GiSAjn0BZzZlTbJZa2I3/UN5zFvG8oH7ursC8k9I5jzciYFG
	 8HzRRK0AC1SpQzCWO/ny0avQf7q71SwrS47V/gOoah1y94s70X0cU+AefLouGnRQdv
	 OSj5WqpFp+LwE+ZJr0wuphCWt65gYU4aTtJbkyaLYLp8sCdGrOCWIRdqIiIu90fXN9
	 u2C/dPT+E1IdQ==
Received: from smtpclient.apple (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01080502.me.com (Postfix) with ESMTPSA id BD6064E401BB;
	Wed, 11 Dec 2024 09:42:12 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.10\))
Subject: Re: [PATCH v2 0/4] Add support for HDMI1 output on RK3588 SoC
From: Alexandre ARNOUD <aarnoud@me.com>
In-Reply-To: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
Date: Wed, 11 Dec 2024 10:42:10 +0100
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BC29D61C-317D-4F82-AF42-EA3D705B0632@me.com>
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: Apple Mail (2.3696.120.41.1.10)
X-Proofpoint-ORIG-GUID: uroVR0O5J6T4E2ZKwd7zwAfbk9YM3ttp
X-Proofpoint-GUID: uroVR0O5J6T4E2ZKwd7zwAfbk9YM3ttp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_09,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 clxscore=1011 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412110073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_014221_333692_6789F733 
X-CRM114-Status: GOOD (  13.72  )
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

Hello Cristian,

> On 11 Dec 2024, at 12:06 AM, Cristian Ciocaltea =
<cristian.ciocaltea@collabora.com> wrote:
>=20
> Changes in v2:
> - Override hdmi1 pinctrl-0 on rock-5b as it requires hdmim0_tx1_cec
>  instead of hdmim2_tx1_cec (fixes a pin conflict when enabling
>  CONFIG_SPI_ROCKCHIP_SFC)
> - Link to v1: =
https://lore.kernel.org/r/20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabor=
a.com
>=20
> ---
> Cristian Ciocaltea (4):
>      drm/rockchip: dw_hdmi_qp: Add support for RK3588 HDMI1 output
>      arm64: dts: rockchip: Add PHY node for HDMI1 TX port on RK3588
>      arm64: dts: rockchip: Add HDMI1 node on RK3588
>      arm64: dts: rockchip: Enable HDMI1 on rock-5b
>=20
> arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi  |  62 ++++++++++++
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts |  44 ++++++++-
> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c  | 119 =
+++++++++++++++++++-----
> 3 files changed, 200 insertions(+), 25 deletions(-)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241207-rk3588-hdmi1-704cbb7cd75f

Tested-by: Alexandre ARNOUD <aarnoud@me.com>

Works perfectly on Rock-5B, thanks for your work.

Regards,

Alex=

