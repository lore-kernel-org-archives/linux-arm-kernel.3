Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3879FFCC9DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8pNDEtotLUhhRZIK1FscdSEc+0KR4iTe7nbV8NtZNg=; b=kbBV16hgOgFqfhBxiyT1K+rE9j
	MBl+L4V9aZeRq7+X8DoMboDwvqDY8mNBYKNj27ID4pY8kct4yvtfmS707k+Dzfff2oY2DZH5OgGDa
	zK9UdhSW+5m7/1EGa+eOZkDF+DR4wobYGUbpIbKfNfVMRiRnQl3D5zzsC557XRv2u2Sgs12piN3Ul
	vA3LHfspM32aJXw/MzK0Fj54ZhSXZVB3KY67v3L0sHFJUrGJs+2Vg1szBpvYBWp6ERPd+mHwoY222
	G/qNEe42luR1Hyk/ZhqBj33Q5u6yWxz8tnUgZsMfHLcYQENjaXKDrLOXOjrtNTpJllbEqiY753hki
	qDn1+K+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt1n-00000009204-13qE;
	Tue, 10 Mar 2026 09:05:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt1i-000000091yg-2VwC;
	Tue, 10 Mar 2026 09:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=M8pNDEtotLUhhRZIK1FscdSEc+0KR4iTe7nbV8NtZNg=; b=VByBN9Dn95xghDhOxw1yKNiwXM
	r67u85KhS+vpERHVwqtLGbtjeyLoXNagYYcAX8ZctMPr8ne6sDu25dL2HJCVlZWY/iFmVV/CPLqkc
	qYRBH2tW4/G6lIjbhDLA+XUtw9uYyjrtL7qprvhpQ/dX+X0jFt1C0zdtWcGEVOizceKRbaPBmm9Du
	R7zF05ExyeiTVeZXKOrL0tOLbziga2vhEufAO1uflnwBXSeTgL670SpR/YSALzrF1fYy7awaJd23e
	bRb5sAoIe2u0GOEqjtFBsDPj1eaTEMgFJfUBUc6zGQB8K980vOgBj+koQex7zA3cQb2aNRegoEzrQ
	fZkpOlxg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, david@ixit.cz
Cc: Martin Filla <freebsd@sysctl.cz>,
 Charalampos Mitrodimas <charmitro@posteo.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: Use reference PCIe clock generator
 for BPI-R2-Pro
Date: Tue, 10 Mar 2026 10:05:04 +0100
Message-ID: <4743255.cEBGB3zze1@phil>
In-Reply-To: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-3-37abd7ba29d0@ixit.cz>
References: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-0-37abd7ba29d0@ixit.cz>
 <20260304-rk3568-bri-r2-pro-fix-pcie-v4-3-37abd7ba29d0@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020518_638982_BBDA74D2 
X-CRM114-Status: UNSURE (   8.51  )
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

Am Mittwoch, 4. M=C3=A4rz 2026, 12:05:29 Mitteleurop=C3=A4ische Normalzeit =
schrieb David Heidelberg via B4 Relay:
> From: David Heidelberg <david@ixit.cz>
>=20
> Describe properly PCIe clock, which allow us correct the
> topology (removing the vcc3v3-{minipcie,ngff} dependency on pi6c as
> supply) and adding the clock dependency in the PCIe nodes.
>=20
> Suggested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Martin Filla <freebsd@sysctl.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>

I think patches 2+3 could do something like [0],
to actually model the clock-generator as one node.


Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?h=3Dv7.1-armsoc/dts64&id=3Dcfe2d65332eff95ac7308478897760888f957a=
eb



