Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F731606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mybS11By;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LW4AiRJd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Weu5Zca/hPX7MdlI7TVErZ4xT18FxVN+YlEWkEZPcA8=; b=mybS11By5IiM/a
	q4Hn2FmgJowXT/KXXMMgXutE9XHpY4Sya1CmrmAXV5rkmaO7yQfTuG7aJeyC6Ps1ynTjGCyi8pszH
	fPDUzFr5xtJVFS+BKDvUv+5hrKQH4umd71sRztSDrLmmd8Diu56b1xS5EJygHcKABKKymkRQFMGSe
	Oa4UkZzJ8JFEDLXyCncCw9CO/OOzMEZze7B54aWoiKAYcZ1w1FH6JD85u6VXOfdmXwwrz7+uhgAJv
	ws3oyWFs0eHi71TaN67e6zCpZ2p2JDM+UyFN76n2qwJSw7TxwMPl7V4Lm8VUJFiRZ2BNOplClS1Am
	0MAHSHC/uRjgNExc1Diw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxxU-000000008Em-2HGb;
	Mon, 02 Nov 2026 19:44:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxxS-000000008Ds-1EFf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:44:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2087502f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793648680; x=1794253480; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Weu5Zca/hPX7MdlI7TVErZ4xT18FxVN+YlEWkEZPcA8=;
        b=LW4AiRJdp0zWM2rPyUH1WCcUGsJhZAv3dU+HWuL2GZbPO/rhh9RbVGrl8X5uwz2LP9
         BysUS437vR5w0c2Mu7aHqmKmuHKS86bV0dXZJhuLv3bXz/0LJYWHgf65WSqny7C/67dE
         Is3r4auR7JfmdW+MIBNHFSyPdpI1+bJBEhjUtC5YLVwGvCfLBFycyAUX7IfGBO0pzBzV
         ZUoSg+2SmcrbfTp1kyHURHIEWfu5aJXrla5Ox+T8NzIT6aZBIzWHp2c5h6EeNtnl4gDN
         BfI4fjLs4Js5n2yk34Khpd/cB5g+gRYQe04KsNIU16gpjDJzies8hAvq8VHOye6iP0CR
         Fyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648680; x=1794253480;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Weu5Zca/hPX7MdlI7TVErZ4xT18FxVN+YlEWkEZPcA8=;
        b=euBIROWz6ehQxVt/MfI1s5FsqDbA8dXKYpO9Hz6woJlHCg2fHjlu1YvQdvydQTzzdw
         plpowR42RO/HZGhkF2RKIogBT/aiiPP6+7MAjAakWRJHfUI0BROc/jhcFJbCqQIP/Lxs
         jvdyFfMJWJcwmnpk0MY59LKsD0W+j1UTiL/NVO2nTGtozxOqBT75tw0/Gben2qV2ytip
         XMj45Pw+ltXb8ZvE34rytqtCzePtJ5pPhRR9fi99oYkD/D9tOLzQTBI7PfDTZoghqgQ5
         STNcD1nY3p+v5HMsRXOG4mmF3CAtC+b9WFbs8D0fSW196hMOVb0fcCxogpkbJPFnK7+X
         +qWQ==
X-Forwarded-Encrypted: i=1; AKwUvBypW+v8fHFexf/roR9UriPgpTq2AkioOaelaaOgjax1wZu7BWL/j89oWWhnNTTGI2BT9/SUOUVP0Ffke5RRSL3W@lists.infradead.org
X-Gm-Message-State: APuU4Z+PeVStsAIbA4RpOPUKZsI0vcxxRn1h4dCar/EEhbYOTxH2XCqd
	r0ZM2VTbc9VNSkBxMYqVB5IWf6Y2VRjTLykkco7iQpn/sgl7/Vd83KKtR2HYwibVBv4=
X-Gm-Gg: AYBFou1ipe3ERybtfzflfc1bJ7mG8u1NRjJhaqvZ7+t8uOOT1car8RS+/9/k4QCwP6z
	wSeXyfM2zBMsn0/aUzDLNybBsvcMIm23RBzqkTzI7+30f3xkdgEPIfbiOnxb6m0BzpF3wCVcOy+
	pE7Vk3wPEoJe1hysshl9FevPTuSLZPDV9rNiZNGMwFIy2ZEkwVUkUiqlvefamRmR40DpsjgL9pD
	FyNdcaHftuJuCb1BTi7fi3RCnea+tMVjOPT0ndv4cciKc9aRjWhlB26BmfY5IMsF69p8LPXcuXJ
	uYmcDkbdK6lJU2+vfuxM8MpEKnKs2seYSqJainLpx1ezfBJpTBPDgb1aXFoLdV+ay352mRHzid0
	ZxdyZUffFSd1YXKwZ3NoGmpD17RIx/vXjoJE0k/ZjH5+DkbScu8IhAsvUweku+I0LM6o2jLoJ6S
	c6GLUTc0QO6uvs17JgOxlWvmcm2M3p23wdydte89Jxu5FZhn5LjxuEA+qV36u7CtOAKDH/zNmXH
	A1e28CJHkstEcdjtNlRarb9aPEWu63zP/ZfV9yt/yD3Mz3krmZXLQPHCfoIBJD84wPcBacBeeSF
	wtruBfeh9m6qWCsq/vRPcQVQtGNZYV/lBe2c61pI9ltkCmz0IOLxemdUJHRoiqKe1ZeHwwxRo5p
	NHLYbI6u7waKK7wXHBGVQOYW6/SbWOwo2klQjQo5mUg==
X-Received: by 2002:a05:6000:2611:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-48e6e50c8ecmr23807080f8f.32.1793648679554;
        Mon, 02 Nov 2026 11:44:39 -0800 (PST)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm23147608f8f.32.2026.11.02.11.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 11:44:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 20:44:38 +0100
Message-Id: <DMKZE3GQVDLB.18QYA9ULAH75I@linaro.org>
Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Christopher Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Russell
 King" <linux@armlinux.org.uk>, "Rouven Czerwinski"
 <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 5/9] ARM: dts: omap: dm816x: Correct speed for
 sysclk5
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
 <20261028-patch-ektor5-dm8168-dts-v2-5-4544429251e2@linaro.org>
 <20261101222942.1a78c6fb@kemnade.info>
In-Reply-To: <20261101222942.1a78c6fb@kemnade.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_114442_363648_AC81B49A 
X-CRM114-Status: GOOD (  24.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andreas,

On Sun Nov 1, 2026 at 10:29 PM CET, Andreas Kemnade wrote:
> On Wed, 28 Oct 2026 17:06:06 +0100
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
>
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>=20
>> The default code for setting up the clocks results in sysclk5 running at
>> 1.6GHz whereas it is expected to run at half that ie 813MHz. Force the
>> divider to be /2 to achieve the 813MHz speed.
>>=20
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>  arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boo=
t/dts/ti/omap/dm816x-clocks.dtsi
>> index 76ebc6c3c3e5..cb990773b098 100644
>> --- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
>> @@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
>>  		#clock-cells =3D <0>;
>>  		compatible =3D "ti,divider-clock";
>>  		clocks =3D <&sysclk4_ck>;
>> -		ti,max-div =3D <1>;
>> +		ti,dividers =3D <2>;
>
> so this changes register value  0 is intepreted as divider 1
> to divider 2. Sounds strange. It just changes the interpretation of the
> register values, not the setting. Maybe checkout the register value from
> user space with tools like devmem. The original interpretation was right.
> So this change does not make any sense. I think sysclk5 still runs at
> 1.6Ghz, but it is displayed as 813Mhz.
>
> I would expect some assigned-clocks / assigned-clock-rates pair somewhere
> in this patch instead.
>

We tested on EVM with devmem and this patch correctly sets bit 0 to 1
(which is /2 in the manual).

However, should ti,max-div in this case be <2> (and all the other clocks
that supports two dividers)?=20

I tested to set `ti,max-div =3D <2>;` and it seems to correctly set the /2
divider as well, but without specifying any assigned-clock{s,-rates}, so
I'm missing the rationale of how the divider is selected.

I'll drop this patch from the series for now, I think it needs more
investigation to figure out why it behaves like this.

Thanks,
Ettore

