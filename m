Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D14BCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XoP33HamohJnYpgEMOOVXkOdMXK2Wj7iOxwWmiRyjA=; b=ejsk57rkTGL8g+bS7po1OZ6HvX
	ejDwvprPB5JhJoeM53WHvhrU2Rdd6nuQGH+lYbjc2+fIEwKqYsXHtlDJBHSdrI4AvshBImBu1/m8I
	ZLVwzglMMRDH86OZVXQKCNamj7XNFude/wBbQh9sK0V6cpELKovVOqt2femf3CyKNZt8zAs4waLMk
	fCiFjaMRS2olkMtqGlmEYF9apm1X1qYnLgdgGzNbneJVp8OEssJ0Ojt/45GBV506jcPSCYr8ewq7V
	SqEfODEOeU0VW4hZ1OwEKuhQuW1GOYhOMJdNSTwhpyo9/nUPTZoKKXai13dYjm8efJE08zXlF76Pa
	eW7dslvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5jl-0000000Ce8s-2fNX;
	Sun, 26 Oct 2025 18:45:05 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5ji-0000000Ce7v-2T0a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 18:45:03 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1761504290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6XoP33HamohJnYpgEMOOVXkOdMXK2Wj7iOxwWmiRyjA=;
	b=Xu7AezbXj9uqu7+8ZLk5xs1budthm6Tf5t9XogPUBoroeIZZR1h/G+9rdfNJ8Xig4w28K7
	gPD0TnSaKwr90otHjpM6vEpYkhJy1vI8qx6gkVfrEgpiJc4LItyLMgZkP2tcRHROsqLx8u
	LY95EHxK2aJnHc7Fqr36DzEspOnO3QV+cY0tVkC+DWK/NNXHUSpfAVm5cemsgu1JGp67Zb
	dgfEN2OBKCNW6Afk3pK0kcTOiI5KOtrjS7waaQnZWHYHQrdVZchK2EA5Q8I4ZlzUR4yPG1
	ltUHntWkA8gv38x4oGWo5AwdxHnBCt4CR4iVOeIhpsnyvHjUhcz5vkz08vJRbQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Oct 2025 19:44:34 +0100
Message-Id: <DDSH5G4FVB5F.BK0F7WNGG6S@cknow-tech.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Dragan Simic" <dsimic@manjaro.org>, "Diederik de Haas"
 <diederik@cknow-tech.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Johan Jonker" <jbx6244@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vccio4-supply on
 rk3566-pinetab2
References: <20251026172608.108956-1-diederik@cknow-tech.com>
 <e2caefd1-9668-0404-598f-98b26375525c@manjaro.org>
In-Reply-To: <e2caefd1-9668-0404-598f-98b26375525c@manjaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_114502_767160_A23146B6 
X-CRM114-Status: GOOD (  16.30  )
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

Hi,

On Sun Oct 26, 2025 at 6:36 PM CET, Dragan Simic wrote:
> On Sunday, October 26, 2025 18:25 CET, Diederik de Haas <diederik@cknow-t=
ech.com> wrote:
>> Page 13 of the PineTab2 v2 schematic dd 20230417 shows VCCIO4's power
>> source is VCCIO_WL. Page 19 shows that VCCIO_WL is connected to
>> VCCA1V8_PMU, so fix the PineTab2 dtsi to reflect that.
>>=20
>> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
>
> Thanks for this patch.  As already discussed in private, this is
> correct and safe to do, because both supplies are designated as
> always-on, so please feel free to include:
>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>

Thanks :-)

> Though, I think this cleanup should also be propagated into the
> stable kernels.  Right now this patch doesn't actually introduce
> any functional changes, but maybe in the future there will be
> some related driver or DT changes or improvements that may end up
> relying on DT correction such as this one.

Fair point. Dunno if b4 picks this up automatically ...

Fixes: 1b7e19448f8f ("arm64: dts: rockchip: Add devicetree for Pine64 PineT=
ab2")

Cheers,
  Diederik

>> ---
>>  arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3566-pinetab2.dtsi
>> index d0e38412d56a..08bf40de17ea 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
>> @@ -789,7 +789,7 @@ &pmu_io_domains {
>>  	vccio1-supply =3D <&vccio_acodec>;
>>  	vccio2-supply =3D <&vcc_1v8>;
>>  	vccio3-supply =3D <&vccio_sd>;
>> -	vccio4-supply =3D <&vcc_1v8>;
>> +	vccio4-supply =3D <&vcca1v8_pmu>;
>>  	vccio5-supply =3D <&vcc_1v8>;
>>  	vccio6-supply =3D <&vcc1v8_dvp>;
>>  	vccio7-supply =3D <&vcc_3v3>;


