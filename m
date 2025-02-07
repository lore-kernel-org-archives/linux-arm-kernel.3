Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E91C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6ih/LrCB0TBhJJrYgx7AsyysXqX50UygCQ/toakb9A=; b=aHA84MS/95PStiFmKAlwcFDCQL
	v74Jg33Smq9P6KwTvgZWML94B7Qex8CLakQbje/p/fKVTXQezFLk1adf22pQnCDd3IgSsXzbSCfuv
	uAUn3UzOBuCRjz7bA6oAgdF0RlXxiMz27Z3VuguuSs60qmmsTGTMwtBegYRtBj8BVJ9OVMKH5354W
	PDiyoV4Ahf7+oCG0Qq0j+K+xeB9/k/9lKYxl8pZ+cXjMRQ4zL68dwt3DRVvnvDUDZvOsLrWWwvlPU
	LlDxQSHi6yNZ4ghsbuW3DWhWsUl+Jz5SYMeX0RFtUf3pksb07TqUsBoBoyTL6Hq5h9rOoM0eluWOb
	fQpusl0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRlb-0000000APLL-2qEg;
	Fri, 07 Feb 2025 17:03:47 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRO7-0000000AK9y-15Un
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:39:33 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1738946363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6ih/LrCB0TBhJJrYgx7AsyysXqX50UygCQ/toakb9A=;
	b=LqUyBY1GbZn/An3WfS8y3xh5Eed+fv7L07ZKBn4XkHJSfqZbNbAEiDkMit04JGQEoIKN7+
	HcOakv5YAULbtLNbwq1mt6BS7w/F4AQ3X1RwJZUls+7zraWc9wujHV+0SJ4Xo/HfJTdY3r
	4D+xUs2OAjY5egJXL8IaakoOzVpSb/W2OncgFQB4A1/KFJ5UiUDzPupeaFO1l7vq/8aCHY
	B7cQV431jJJZdRmkRzE+o79AdCyZ9mshz4yVlcXN5HjwtHztbysPQU89F17/RHPvmnyyKT
	RjXi5cvLKjIHZNlz9CAr/07NGKZCRXqddwxnoqi/gObEdS2lDBh1gwPNler/lg==
Content-Type: multipart/signed;
 boundary=7028502f771c4dd1e1fb2bb3c0027617c3fbe8bf2f682fab29e1f35f7093;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 07 Feb 2025 17:39:10 +0100
Message-Id: <D7MD194WS7UL.FT324IUB9BIA@cknow.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Maximilian Weigand" <mweigand@mweigand.net>,
 "Marek Kraus" <gamiee@pine64.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Diederik de Haas" <didi.debian@cknow.org>
Subject: Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on
 PineNote
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Dragan Simic" <dsimic@manjaro.org>
References: <20250207111157.297276-1-didi.debian@cknow.org>
 <502523554b482a2e10d85d37761932a0@manjaro.org>
In-Reply-To: <502523554b482a2e10d85d37761932a0@manjaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_083931_567088_751A244E 
X-CRM114-Status: GOOD (  18.44  )
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

--7028502f771c4dd1e1fb2bb3c0027617c3fbe8bf2f682fab29e1f35f7093
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Dragan,

On Fri Feb 7, 2025 at 4:01 PM CET, Dragan Simic wrote:
> On 2025-02-07 12:11, Diederik de Haas wrote:
>> Add the recommended chassis-type root node property so userspace can
>> request the form factor and adjust their behavior accordingly.
>>=20
>> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
>> Link:=20
>> https://github.com/devicetree-org/devicetree-specification/blob/main/sou=
rce/chapter3-devicenodes.rst#root-node
>
> Maybe the Link tag should be converted into a "[1]" reference?
> To me, this is more like a reference for this DT addition.
>
> In general, references can also be placed closer to the contents
> they back up, which isn't possible with Link tags, but of course
> that doesn't matter much in this case.

I generally use the "[1]" format when linking to specific claims, which
I could've done wrt the "recommended". But I considered this a general
background link and then I prefer to do it via a Link tag.

If requested by a maintainer I'll change it ofc, but otherwise I prefer
to keep it as is.

>> ---
>>  arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
>> index 2d3ae1544822..3613661417b2 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
>> @@ -9,6 +9,8 @@
>>  #include "rk3566.dtsi"
>>=20
>>  / {
>> +	chassis-type =3D "tablet";
>> +
>>  	aliases {
>>  		mmc0 =3D &sdhci;
>>  	};
>
> The patch is obviously fine.  Thanks for the patch, and please feel
> free to include, regardless of the note above, my:
>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>

Thanks :)

Cheers,
  Diederik

--7028502f771c4dd1e1fb2bb3c0027617c3fbe8bf2f682fab29e1f35f7093
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ6Y3MwAKCRDXblvOeH7b
bm7CAQDbpmFpX5ubvZP1t+qtuzyTR6mFwL+PSL0Ss0jlhqiaOwEAmNLs1E37i0+M
8dsgxHWQRk9FxOK7KW6Wd0HRz+Ij1gQ=
=yaBF
-----END PGP SIGNATURE-----

--7028502f771c4dd1e1fb2bb3c0027617c3fbe8bf2f682fab29e1f35f7093--

