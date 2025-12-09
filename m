Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F668D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxEyI/m4jP3NK+9omDGjHNBVqFAKxQf4F7O6U4IQKoo=; b=sOUMJDQedM2DvT8+HfgOdNkq83
	HQO4D46XY7PLAaX9R0zj6ADLDjZdVWffhOhLQtBOo7ccIq7PStfMOKnAbgmyKoo3FhldldP3a1OvC
	/g+N+FIyxLPTaEnUVn6oxQoqu1KAviVbMF3AM1gfxg66nPVZrGC39+pAyB7zJwKCwZkGk6ZnwDegV
	dqOyv5BzEHKFe7AW1X4heY7ogVNEKs0YaNUOGvB3JD0nqCQY8qq40kww8kJ0qpwWbyhwzcFMruewl
	27zSjsNltje3ICgioHT26ytisLpvTQrVZa5CJMaNBCLxoqy7DtnAoDGYUQ1SHYNmY9W2ZjKEe4Eaf
	vcD+JpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwwJ-0000000EGJ6-3ILn;
	Tue, 09 Dec 2025 12:35:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwwH-0000000EGIC-10Ze;
	Tue, 09 Dec 2025 12:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xxEyI/m4jP3NK+9omDGjHNBVqFAKxQf4F7O6U4IQKoo=; b=ugvX8vPqK2eKIzZ7gi70O05f+8
	ZDyNYpVEFR7VcjhO3cf27DGj4LVp9Sb+i5t7rfRjlJfndIIx//YDPv2LHAbqo6/8D64Lvi0/iEOht
	qsTiHsfUSKrsJXrBgLPI4zEXXnVWRrP3pkTJWIbaFoarY7Hlf/c6/pwX9Mg3qdqXzFn6uvv+WvRsK
	+ii4FiSIyVlI3vrgu8+d2GkUth8y0jKb2UFVN31dw0o0BNWIUNQhst/zyoCL51fLhfFqdrIt30S8x
	Fi2o3yV1YlhB/JYqIR+B7bkIP3WNPbWha1qKWa/Ne/HIimVe6ibInJKXlUE1OWbEIHEJpEazRV85k
	RM0LMB0g==;
Received: from i53875a42.versanet.de ([83.135.90.66] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vSwwA-0007hg-Fr; Tue, 09 Dec 2025 13:35:26 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ye Zhang <ye.zhang@rock-chips.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ye Zhang <ye.zhang@rock-chips.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, tao.huang@rock-chips.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add rk3506 pinctrl support
Date: Tue, 09 Dec 2025 13:35:25 +0100
Message-ID: <2043731.usQuhbGJ8B@diego>
In-Reply-To: <20251206050844.402958-2-ye.zhang@rock-chips.com>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
 <20251206050844.402958-2-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_043533_304855_9334DBE9 
X-CRM114-Status: GOOD (  14.45  )
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

Hi Ye Zhang,

Am Samstag, 6. Dezember 2025, 06:08:37 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Ye Zhang:
> Add the compatible string for the rk3506 SoC.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This patch was already merged into the pinctrl tree in v1 and entered
the mainline kernel during the 6.19 merge-window [0]

Same for the actual rk3506 driver change. So please base future versions
of your work on top of that.

Thanks a lot
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D13064950339ffc73a0e55e9b4898df861b04848e

> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 125af766b992..76e607281716 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -44,6 +44,7 @@ properties:
>        - rockchip,rk3328-pinctrl
>        - rockchip,rk3368-pinctrl
>        - rockchip,rk3399-pinctrl
> +      - rockchip,rk3506-pinctrl
>        - rockchip,rk3528-pinctrl
>        - rockchip,rk3562-pinctrl
>        - rockchip,rk3568-pinctrl
>=20





