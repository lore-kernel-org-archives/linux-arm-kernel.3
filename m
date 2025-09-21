Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D92CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5s/rbYzOFlNssq65LrWlny/zA30+0vcvAUYK1oUceg=; b=JIF9Xt29lVOrjB9DpHNa61JXVz
	hSRUg7BnnQCrCk80nRpWST+my344x3aujeTNbLx2Us1rWXJvAwL8eF7+FV7P/V9PXLLG2vEWxhNb2
	aHxtzAowpqfIHT4lGPAF77MyBlL42sZcc5HsUuMNAGwGQqCLHkpa/QY68rQimrqAU5/cfMXHvsjgl
	n3bpTWwZOizihoUPS+iEQf4hvnpFHAPDODvPSpFT1irFf01tkAgTUJU6ZlroDoZ5B5ZXYTdloEtQL
	LUFV7D/HhLPKE+b3QIPfuFN4IteFPsP5SopwNiHvj3UO4OfvGi8A+SZCfM5pi/AyH/IiGp58yq8VF
	v3zexYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MTv-00000007go3-0yXY;
	Sun, 21 Sep 2025 16:00:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MTs-00000007gnA-2gaU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 16:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02570409B5;
	Sun, 21 Sep 2025 16:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85221C4CEE7;
	Sun, 21 Sep 2025 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758470403;
	bh=cm6J+UUm0Yhk5gWtzjh9epyLXB2qW6PN/nEAcS+Q3eo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K3pK0p0qVU3h0AxJ4/wvHpEO+P/uqi3mIvu1GLcvOj88VReiPu3Z58Vbto8aNql4c
	 Zy9xggoNLA/bi2x0KftoQxI4pI6wtnScf3db7c6OTXEZBQjjeXWvS+cw/tb2aHzQJa
	 YcZMFDYeFDsGCIf3q5wgQMXndu2xDkA6I0EJ/8BHIJ0vioLYjX/M9f69zO305AAxyl
	 i+Caud7at4YXkNwO2CEtZFzb7pBo2EOz5D+2wZCwnFRK46uuK+7l/kL3PYOeTlYO0x
	 RiUHgaxr67xkqxf+0FMpBpYI1vzqpz5LkzCXcmW01aL24/6P6eDTR0mxPSy4qlgOI6
	 B2v6u6lRknFBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250921022925.599022-1-andersson@kernel.org>
References: <20250921022925.599022-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Taniya Das <taniya.das@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Nickolay Goppen <setotau@yandex.ru>, Sricharan Ramabadhran <quic_srichara@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Brian Masney <bmasney@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, Daniil Titov <daniilt971@gmail.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Marko =?utf-8?q?M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sun, 21 Sep 2025 09:00:01 -0700
Message-ID: <175847040126.4354.10132480274472842830@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_090004_702899_502D2E6D 
X-CRM114-Status: UNSURE (   6.30  )
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

Quoting Bjorn Andersson (2025-09-20 19:29:23)
>=20
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.18
>=20
> for you to fetch changes up to 4ca6a89f38718d6cd84304e6a26e7ddc90e03356:
>=20
>   clk: qcom: gcc-sc8280xp: drop obsolete PCIe GDSC comment (2025-09-11 21=
:09:29 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

