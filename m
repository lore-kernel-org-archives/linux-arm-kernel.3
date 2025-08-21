Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BF9CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qBXp2L6ghuaOFTwpw0VcF+lJn82b0iwLgdjpHusKRY=; b=U1eSnQ3ZN33jBHE7yn/1z9FjeS
	EWZPaBbh94J7FDYDBZX9gQp4ZBoj9/eAqeO3e66OAnXZx/VDNx+cJb4trDVnI6DdYhMGTiVd0K1pX
	krrbO4uWklyOVbYHeGPpPbzYSyIxpaJpsn043dqFUhbUVMbHF8O3goczNxIQd2/QGI02ISdBeMnuY
	RILxwxje/KlHCp/k7QB47c0yfnEKf+hgvmBjLWBlKSoFPY7UKmEq/PU0QQuTkbf1iaVaxcdsiJ7nG
	2yXMXXl3O7gfyrWdJ825HAjA5jfc4W95sk2C312uchRwJCa49DWTNSSF/S+1/gdU9OTkjfXognCuz
	AZGQ20QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Mt-0000000HQBA-320i;
	Thu, 21 Aug 2025 15:38:24 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4cE-0000000GvpL-00vn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:42:03 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755780117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2qBXp2L6ghuaOFTwpw0VcF+lJn82b0iwLgdjpHusKRY=;
	b=txzMEN3FKtz1olFZUVrErfLHlhVNtHZp9Kd/i2sWnJtnGBam8Rdp3Oaogr0G23n5z4Eehf
	nGkZ9OB8Xo587f3LLNgNZFk6nWKx26GGOODXnDG6QmhwykAptAb4nKdWsxH5mY0lzf762R
	v5ZuMJSkoNsbXkwH1yFunobZ3E4zLw9ecdcIjUIrrUWy3yPU3o8Radlqb5OGtBQjUE46wM
	IzknYv9LHjnyR4g9tqA83ILR4aotfauXFfh970xI8ortZznliPacH7OK51v7hjHYF0jUKk
	eCuIcurdewmlFv0qdyBGbByDQeQawkgA59EaxihTeqGqU8F1X+bMOwNtY3h9UA==
Content-Type: multipart/signed;
 boundary=3b571f17c3ddaedec092828a238ae966d2c316d9a762f9d2cf5b0d604e2a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 21 Aug 2025 14:41:34 +0200
Message-Id: <DC843K2CRBHH.1IUX1SB576TFZ@cknow.org>
Cc: "Robin Murphy" <robin.murphy@arm.com>, <linux-pm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH v2 2/3] thermal: rockchip: shut up GRF warning
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Heiko Stuebner" <heiko@sntech.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org> <20250820-thermal-rockchip-grf-warning-v2-2-c7e2d35017b8@kernel.org>
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-2-c7e2d35017b8@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_054202_675793_49DC1E70 
X-CRM114-Status: UNSURE (   9.27  )
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

--3b571f17c3ddaedec092828a238ae966d2c316d9a762f9d2cf5b0d604e2a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Aug 20, 2025 at 7:40 PM CEST, Sebastian Reichel wrote:
> Most of the recent Rockchip devices do not have a GRF associated
> with the tsadc IP. Let's avoid printing a warning on those devices.

Retested with v2 of this patch (set) and there were still no regressions
on Rock64 (rk3328), RockPro64 (rk3399) and Quartz64-B (rk3566).
I skipped testing my NanoPi R5S (rk3568) this time.

And on Rock 5B (rk3588) I (still) no longer see this warning:

  rockchip-thermal fec00000.tsadc: Missing rockchip,grf property

So also with v2:

Tested-by: Diederik de Haas <didi.debian@cknow.org>

Cheers,
  Diederik

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/thermal/rockchip_thermal.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

--3b571f17c3ddaedec092828a238ae966d2c316d9a762f9d2cf5b0d604e2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaKcUAwAKCRDXblvOeH7b
bkU/AQCEUoGxVyVSNGRj6qG6NCl2nThKkgrDRtbsVWcAv4iiLQEA5qiGnnUdk7ma
IuxRHRF24a7aweQEHZRYm58eco2GUQQ=
=xzaV
-----END PGP SIGNATURE-----

--3b571f17c3ddaedec092828a238ae966d2c316d9a762f9d2cf5b0d604e2a--

