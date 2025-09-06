Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9E2CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XL9HIJO3UGo5wyNjZG9W2dDyTd3zOWpByElnpm1c1Y=; b=TASr7qekHzxu6yOyt1QnlHktUs
	ca1HrPS0/GHta9VwuvaAHrPmm3xYsxWBm6In+1LwqjOxkLdDdFVg85W5PVMH3Q5Nkkw8lOlnHKul/
	CUZgwX3irlXA8Kq6L6GvhTyU8rKjssqjARruFfkMl72BXUgaLiAZYU6ouK3TaLVYiOievyXq0qqMs
	AMOIgt2ftbCYcwsPGyaJTmTW84Hw+5/W7AVjNsuhwSYXxRTM5FbShMaTJwpqZdeJ/M4k8YuXZ9PFP
	FA/po2Ao6IIZH3kHUbyQQZtWjZhUV54ZntvH7bAx7xHiLP7YGTgRqvzsxKJuD7Xs3MNKSz0zqvLMe
	Q44yoBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uutZr-00000007tDC-1cUZ;
	Sat, 06 Sep 2025 14:07:39 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uutQf-00000007rtH-0JZm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 13:58:11 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1757167085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+XL9HIJO3UGo5wyNjZG9W2dDyTd3zOWpByElnpm1c1Y=;
	b=F6w2aN5IOUHo91/K1jt/wOXJfr/PMEdWIGwoITPTiw+jwqaCSgnBV9BQs6GyT7xLKcUuI7
	yZGYXtSNBSFs62GiylNXChPHb6MWLG5KDSTsR6G5iWCfd0X5JGptu9qJ5ped+2wgKTgdZc
	pysWSw0Nad9+HUTNutrywXHTEZy9MLEkyEsxuPWTxRQyQQUibV5pNyEReqaodtOo2HkOP9
	1DmU/D8elEgK28LaxIt6XKh8gg8erTYt2Vp9wqXBQxt7CfowyKVjtApaBvwKAS5x4ysJ8v
	fNupDxM6iHIR3RrCUO4rk6JJMknJfXLU+k4O3fwpJxwiSKxhkNnRs5++6nG1Mw==
Content-Type: multipart/signed;
 boundary=7bb96b1748a067e53456e99e209bf191ed42469d49852d8d3d12a1592bb7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 06 Sep 2025 15:57:55 +0200
Message-Id: <DCLRQQH0F49Q.2OUP59P4VV91O@cknow.org>
Cc: <heiko@sntech.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: clock: rk3368: add CLK_I2S_8CH_PRE
 and CLK_I2S_8CH_FRAC
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: =?utf-8?q?=E6=9D=8E=E7=BB=B4=E8=B1=AA?= <cn.liweihao@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
References: <20250905132328.9859-1-cn.liweihao@gmail.com>
 <20250905132328.9859-3-cn.liweihao@gmail.com>
 <707aad1d-fcdb-4c66-8d96-41cf1a1b02ce@kernel.org>
 <CAPEOAkRTVtKBsmiGTbKOCar0oNS-C3dRXqdpuowroRPH1bFS7g@mail.gmail.com>
 <58b638c8-b27e-49a6-b79e-f078135c575b@kernel.org>
 <CAPEOAkSpEzVtUqyUJQbDmbmPOjORnAfuehhvo1qqZgAAeY=ZVA@mail.gmail.com>
In-Reply-To: <CAPEOAkSpEzVtUqyUJQbDmbmPOjORnAfuehhvo1qqZgAAeY=ZVA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_065809_829958_44095B6E 
X-CRM114-Status: GOOD (  15.77  )
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

--7bb96b1748a067e53456e99e209bf191ed42469d49852d8d3d12a1592bb7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Sep 6, 2025 at 3:34 PM CEST, =E6=9D=8E=E7=BB=B4=E8=B1=AA wrote:
> Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=886=
=E6=97=A5=E5=91=A8=E5=85=AD 15:21=E5=86=99=E9=81=93=EF=BC=9A
>> On 06/09/2025 03:34, =E6=9D=8E=E7=BB=B4=E8=B1=AA wrote:
>> > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=88=
5=E6=97=A5=E5=91=A8=E4=BA=94 22:13=E5=86=99=E9=81=93=EF=BC=9A
>> >> On 05/09/2025 15:23, WeiHao Li wrote:
>> >>> We need a clock id to assign clock parent when use i2s 8ch as audio
>> >>> device, CLK_I2S_8CH_FRAC should be CLK_I2S_8CH_PRE parent so we can =
get
>> >>> frequency we want.
>> >>>
>> >>> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
>> >>> ---
>> >>>  include/dt-bindings/clock/rk3368-cru.h | 3 +++
>> >>>  1 file changed, 3 insertions(+)
>> >>>
>> >>> diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bin=
dings/clock/rk3368-cru.h
>> >>> index b951e29069..795e721957 100644
>> >>> --- a/include/dt-bindings/clock/rk3368-cru.h
>> >>> +++ b/include/dt-bindings/clock/rk3368-cru.h
>> >>> @@ -183,6 +183,9 @@
>> >>>  #define HCLK_BUS             477
>> >>>  #define HCLK_PERI            478
>> >>>
>> >>> +#define CLK_I2S_8CH_PRE              500
>> >>
>> >> 479
>> >>
>> >>> +#define CLK_I2S_8CH_FRAC     501
>> >>
>> >> 480, no?
>> >>
>> >
>> > Neither of these clocks belong to the previous grouping in terms of
>> > type, so I chose to start with a new integer id here.
>>
>> I don't know what is "previous grouping" here, but IDs are abstract and
>> are incremented by 1.
>
> In the current kernel code, the RK3368 clock IDs are categorized by
> SCLK, ACLK, PCLK, and HCLK.

Maybe this helps understanding the discrepancy:

Starting with the rk3588 series, clock IDs are in the 'clock' binding
dir and named "rockchip,rk<SoC-id>-cru.h" and are numbered sequentially
with no gaps. And the reset IDs are in the 'reset' binding dir with the
same filename pattern.

With older SoC series, including rk3568*, both the clock and reset IDs
are in "clock/rk<SoC-id>-cru.h" where they are NOT sequentially
numbered and thus jumps in the numbering is not out of place there.

HTH,
  Diederik

*) I have a local commit which moves the reset IDs to
"reset/rockchip,rk3568-cru.h", but I don't know how to do/fix the
numbering, so I never submitted it.

--7bb96b1748a067e53456e99e209bf191ed42469d49852d8d3d12a1592bb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaLw95gAKCRDXblvOeH7b
bvNkAP99WIABmRv9YSzmveKgHvYKLFoQLUV0tMVC03ofrDorHQEA2TFlad1NNFB5
V10lG7EyfJsr5FC/E6J50SW4/JODEQs=
=GF08
-----END PGP SIGNATURE-----

--7bb96b1748a067e53456e99e209bf191ed42469d49852d8d3d12a1592bb7--

