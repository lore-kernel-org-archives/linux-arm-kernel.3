Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65DFC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 17:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3HNOWZw5hkcyGSQgmqXfoEJ+ny9/ZCvslOQJp7MB2E=; b=ao9GXbqUCr02Ws0mgS/JM6/T7V
	6kyF5YN4s1K6y2Gm8CLtIoxBv2GLJdgZPvlB7hfYsgl3g3NuadSvtFzjk40agA6edEjxLduw3zTvN
	F8RUEJsCv2SmQRKk856fuMZCC577YbjwK/DH9cuzWTyrEkQjwEYgtaunCwF5xtNMooJqyRLFhwv03
	vc6CtCX6pH6yPgs8zaSTjsV8i4I/vFBxLJl07m/aDwrIYdgpKy8WyzT1DtcV19l7KlADIWtP5zeJ1
	+UJESeMQcz7d1p9TOu+czSW/sytZXj81+lvBxrvsEvDoLFhrUo9BRC/FOcAF406HUxdzYgFDwp9OA
	hCO+QwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoQi-0000000HOQQ-4C1e;
	Tue, 29 Jul 2025 17:48:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoOG-0000000HOAG-0Mbn;
	Tue, 29 Jul 2025 17:45:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6004EA549BE;
	Tue, 29 Jul 2025 17:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07791C4CEF4;
	Tue, 29 Jul 2025 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753811127;
	bh=x3HNOWZw5hkcyGSQgmqXfoEJ+ny9/ZCvslOQJp7MB2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpYz6p89DzVpv//o/gFNgWEc5Gm98fYQHRh53L/XAWVBwKf6VN4selbeF3gdwwEvg
	 u98KjXQ+5iE3qf+0PljVq+7U6G0i+8g8/g9PlFz68kwZDKNgUlgQjigkgP9A1YfC6B
	 9X8Ms26uAs+GCTr1uCtrFAuSHuRLHW1z2YDRJsI5z3Nf70z4vA/bBChgiwI2YG2OEe
	 naZZVD+u9g8sLV6R4EQMlhKSJ7f/5V8LlkT4e+czD5gn/DRl/Y4EvNof/bpqSNfdpw
	 p+dlMs7GS/CXFDGcJ3/fWfe2l8DGD5l4E2fAVzl/R2WObcVvwyyop5zZBqcVz2NVQ6
	 VnYBAwpJko4pw==
Date: Tue, 29 Jul 2025 18:45:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Huayu Zong <huayu.zong@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: mediatek: Add binding for
 mt8189 scp
Message-ID: <20250729-flask-applaud-7af817ef7a94@spud>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
 <20250729023125.9036-2-huayu.zong@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kD2euniIewJpEG2U"
Content-Disposition: inline
In-Reply-To: <20250729023125.9036-2-huayu.zong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_104528_190234_FA2618A7 
X-CRM114-Status: UNSURE (   9.04  )
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


--kD2euniIewJpEG2U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 10:31:11AM +0800, Huayu Zong wrote:
> Add the compatible for mt8189 SCP to the binding.
>=20
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kD2euniIewJpEG2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaIkIsQAKCRB4tDGHoIJi
0pwmAQDF9XgoLzRZN2+HymZe6A7A4abQRqFlzcGxlUnimpt8xQD7BQ2lbwb8Iw7n
KyWPgmI4hfaZEK9QDBPIsnCbJOyAaQk=
=qcBV
-----END PGP SIGNATURE-----

--kD2euniIewJpEG2U--

