Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDC3CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 17:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VE3zWNd8hyEKKt0aCbf0h+Pe6DuWRN17pEEkLFG58ko=; b=HDSy34QyPxDywj/2Ag7DzvN5YN
	Rz8wlMvcDmSa0YIOJcBRASYYhCw1vugoqcMLEKnvGIYhMl5CGbyZeH4J1XRKNLXwoCq6r6YQGKv9V
	TbAMIW8cB8t5KGLrcA5pGGyBN3b/LXWmurxwx/otpUpVParXLzovXBg/tU+z/iiKTJSRq2PuvMJPW
	aSLvk+5RuwoDuYyS55EjTLhZtvSfoLAj7zyOxDF40v0LuFs753ljMGfzcbDFicjYcJRX5XxXhjW/O
	62Uvx1su9gMOwNV21bQh7xufeW34CsHlbXjEjZYdmV0GseEFBT8UTqTx3vsUVic3mA1UQ3vszkq/F
	B28v3xzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD4fJ-0000000CaVC-2gsC;
	Sun, 26 Oct 2025 17:36:25 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD4fH-0000000CaUZ-3909;
	Sun, 26 Oct 2025 17:36:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 31B2940D20;
	Sun, 26 Oct 2025 18:36:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1761500178; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VE3zWNd8hyEKKt0aCbf0h+Pe6DuWRN17pEEkLFG58ko=;
	b=YtCaKF0sba269jXpys5kvrSjKhG607xG769thtCRBdZvKbQdg0oJpjALMKO426aPKh5idW
	9uQvEPSV2ppc49hQx6komclTXMKHoRtS09OsrSDpj4YJbzurP6/YLrYwDFpmKVAJgXezpl
	XgJjdakMca22HMHH8sJWPhhxmKVKQQwfC2Ctq9Q/pxCdMWEJzK3IPvjqB3uo+PM/rJ0PH5
	6VTppTB3ggk2xCvwo+pCOAbojoufQ5XwMEkhSHrSszjgVDzSbd3tUeGvGIP+9qxHKwFs8e
	DZ4AsMSKs1gbHmWH1Rnylg0g37CZCII2h5fRd//joHzmbJkTjRBXwPEx8tSRwQ==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20251026172608.108956-1-diederik@cknow-tech.com>
Content-Type: text/plain; charset="utf-8"
References: <20251026172608.108956-1-diederik@cknow-tech.com>
Date: Sun, 26 Oct 2025 18:36:15 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, "Johan Jonker" <jbx6244@gmail.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>
MIME-Version: 1.0
Message-ID: <e2caefd1-9668-0404-598f-98b26375525c@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= Fix vccio4-supply on rk3566-pinetab2
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_103624_038149_64B632F6 
X-CRM114-Status: GOOD (  13.40  )
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

Hello Diederik,

On Sunday, October 26, 2025 18:25 CET, Diederik de Haas <diederik@cknow=
-tech.com> wrote:
> Page 13 of the PineTab2 v2 schematic dd 20230417 shows VCCIO4's power
> source is VCCIO=5FWL. Page 19 shows that VCCIO=5FWL is connected to
> VCCA1V8=5FPMU, so fix the PineTab2 dtsi to reflect that.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Thanks for this patch.  As already discussed in private, this is
correct and safe to do, because both supplies are designated as
always-on, so please feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

Though, I think this cleanup should also be propagated into the
stable kernels.  Right now this patch doesn't actually introduce
any functional changes, but maybe in the future there will be
some related driver or DT changes or improvements that may end up
relying on DT correction such as this one.

> ---
>  arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
> index d0e38412d56a..08bf40de17ea 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
> @@ -789,7 +789,7 @@ &pmu=5Fio=5Fdomains {
>  	vccio1-supply =3D <&vccio=5Facodec>;
>  	vccio2-supply =3D <&vcc=5F1v8>;
>  	vccio3-supply =3D <&vccio=5Fsd>;
> -	vccio4-supply =3D <&vcc=5F1v8>;
> +	vccio4-supply =3D <&vcca1v8=5Fpmu>;
>  	vccio5-supply =3D <&vcc=5F1v8>;
>  	vccio6-supply =3D <&vcc1v8=5Fdvp>;
>  	vccio7-supply =3D <&vcc=5F3v3>;


