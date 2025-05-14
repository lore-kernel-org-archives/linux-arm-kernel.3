Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327A7C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKe2WWPOKKxeDx60prV62ph0i3MCDDmxV+WKHZW1a6o=; b=IUjLcsUtkLiIQP+OUM7j18ArjH
	3fRu50Y2Wr5p72uUdmtI2/oCkRu5b53WMbuX3G+JTCsN9HWUgb0JrcF9D+cYQMrqRI9KdARcsFZh4
	k3u1yOmp/uTnWCgAMNmN7+jcIcx3nnNbcqN9Wun1J96PUUsvFLtbvztj3YHZi7fTLCO4aIpJY1LRk
	q1zc1jP9wrWB/Mf8Rf9aTIKebwPCiP0hukjOpQSYPmpTkW49dV/OOKcT6aLEy/NutHzPWa+Nhu9Zn
	FrFsvCs6+zvSm0xIj/CvJo+PUr6MZLTRSba4tFiHurMXvOkXwqNEmnbWQw6qRUmXjV3IRuCShnWrZ
	4EzZC1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCZ4-0000000FJIO-19q2;
	Wed, 14 May 2025 13:54:30 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBXi-0000000F80O-3NxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 12:49:04 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747226929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CKe2WWPOKKxeDx60prV62ph0i3MCDDmxV+WKHZW1a6o=;
	b=nGCwv7ftx5gDbPRP9hrpiNVqIdEhj5QYFo07xZIEqKL7qb8zP9/roXpLgqKGUltRNJ6ZfL
	GqpLBy3wKx25JBJzpx0xbk2xxsv0bLNaQpNiv33nhr15TsDLiaMkilLiE+NywlMqS1kM93
	ZueOAInbWADeab/M4tNkeZiAuIBMW6aaNc1pBroUX/enc0y03XSM3N334pXWHv60RjeVAJ
	aKqI+QkbS44HOoRiJiq+OELw4JGszUIHSHGS9/etZW4g0a7CM0vwMjyGIfTw9eBKPYacTj
	U7O7kwKubTQiApMlLUaX5EemTSucTbaw7YAzLkNj39dhWV0JsLRQ5IozTaCZNA==
Content-Type: multipart/signed;
 boundary=43495df6b18c95ed892a9855e6992edb45d3997bcce22c3b66455a6a817a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 14 May 2025 14:48:46 +0200
Message-Id: <D9VW95BJVUZM.2KDNW7JLCKKF0@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Shawn Lin" <shawn.lin@rock-chips.com>, "Heiko Stuebner"
 <heiko@sntech.de>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
Subject: Re: [PATCH v2] arm64: defconfig: Enable Rockchip UFS host driver
References: <1741161252-138526-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1741161252-138526-1-git-send-email-shawn.lin@rock-chips.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_054903_247993_8A6BF98F 
X-CRM114-Status: GOOD (  16.23  )
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

--43495df6b18c95ed892a9855e6992edb45d3997bcce22c3b66455a6a817a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

I'm updating my own kernel config and have a question about this change.

On Wed Mar 5, 2025 at 8:54 AM CET, Shawn Lin wrote:
> Enable Rockchip UFS host driver.
>
> This driver is first introduced on Rockchip RK3576 SoC, and will
> be used for more SoCs in near future, so add it to defconfig
> will make these platforms work better.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
>
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 3a3706d..907e92d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1191,6 +1191,7 @@ CONFIG_SCSI_UFS_HISI=3Dy
>  CONFIG_SCSI_UFS_RENESAS=3Dm
>  CONFIG_SCSI_UFS_TI_J721E=3Dm
>  CONFIG_SCSI_UFS_EXYNOS=3Dy
> +CONFIG_SCSI_UFS_ROCKCHIP=3Dy

Is there a particular reason why this is `=3Dy` and not `=3Dm`?

For SCSI_UFS_EXYNOS there is an explicit reason for `=3Dy` in
5be91fe8d91b ("arm64: defconfig: Enable Exynos UFS driver")
(it won't detect (some?) UFS devices otherwise)

But this patch/commit doesn't say if/why it must be built-in.
Is there such a reason or is `=3Dm` fine as well?

Cheers,
  Diederik

>  CONFIG_NEW_LEDS=3Dy
>  CONFIG_LEDS_CLASS=3Dy
>  CONFIG_LEDS_CLASS_MULTICOLOR=3Dm


--43495df6b18c95ed892a9855e6992edb45d3997bcce22c3b66455a6a817a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaCSRMAAKCRDXblvOeH7b
bundAP484maMdKYcsjQhffsxspOH3uTIZmD2k3J7gd1bn64CjgEA897iMCmAQ1KG
hvAs9elAO9T1nrBwCa9XpNB8Vkk2AQo=
=I425
-----END PGP SIGNATURE-----

--43495df6b18c95ed892a9855e6992edb45d3997bcce22c3b66455a6a817a--

