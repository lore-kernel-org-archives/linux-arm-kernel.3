Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C5BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWX3ya/A0m+GCH7EVCobSWcufZuNadjRVsGC/wTlWEQ=; b=Sy/zqmiJ85ZcS3GjfZ/4mGpvkJ
	qlDztc9pAw4K+mOJQHubHBG0iuG72uVsgEtOZcqV9gyIuOt9U1nXPP6J1Vxky4WdOL6IATkn0TTn9
	cBu+M48CjgXCchMCcFZVuJkr/9Tqpyn9gX7LV6SbUSLbofWurnM1+k7pjfW12S4mxaT3Mxy3b42r6
	fi2RP2PPrECeAmp/MGlKM2PKxNouMSpoFlgVdOsGkO8+key2JQ5kCm/H90A8sYMCid5Pf9Q16HwBc
	UXe2yNNsRK6r+rOD+aqV6sQ5K7uzO/URtBMSSSnD4UxsM+xnmqKUD9lCLhStEjJ2TFisg0Qu8W7Oi
	AdYmOrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7B3I-00000006oAI-3zCP;
	Tue, 22 Apr 2025 10:40:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AWv-00000006g9r-2Xm4;
	Tue, 22 Apr 2025 10:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XWX3ya/A0m+GCH7EVCobSWcufZuNadjRVsGC/wTlWEQ=; b=Oh84lwbFzKuCEboH1qV2vZ6KMc
	4+ZkuBhwLc7vDDemjPc6i9W26GkFXYmpFuGVUu/M1c9xKGdMTTFgKm8/6yRgO8+fTsZV95twjQT5u
	JRWu29iFEmF2FRnTf97Cn6PTAK8wWeWXWab/VWwk+zFl9EJMZbTgrXZo2KiuW1MYE7xST7kDcGbIN
	iKYHxc58JjuXSU7Da7+5C9mL8BW7zr6yMSyLbCU+2WjYJAWOKCt90Anqhy9YTiL7T7zCrvzVmvNDp
	eT7w0ljKQehnLyKsyaQSrz2TfAXvhU/qaQyVVHD5VQWHyHChcGiQem0GSnZDJcoq2WQxdjjQLmJFB
	unq43JYA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7AWn-0001RD-JL; Tue, 22 Apr 2025 12:06:57 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: nvmem: rockchip,otp: Add support for rk3562
 and rk3568
Date: Tue, 22 Apr 2025 12:06:56 +0200
Message-ID: <9448537.CDJkKcVGEf@diego>
In-Reply-To: <20250415103203.82972-2-kever.yang@rock-chips.com>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
 <20250415103203.82972-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_030705_642288_8B2C3D8A 
X-CRM114-Status: UNSURE (   7.35  )
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

Am Dienstag, 15. April 2025, 12:32:01 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Kever Yang:
> Add compatible entry for the otp controller in rk3562 and rk3568, add sch=
ema
> for different clock names for new entry.
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



