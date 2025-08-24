Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67BECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADa+fVNGO4WZmlPkY9EPlfFvm3fduD+G2BAy5zB2N7o=; b=DGDNAsZf65+dh0f4jM3qJCmoKB
	JKJUVFvI4gE/kVh4G+GeHSTMnmZsoghHdlGXBKa2UidSkS9vPpOK6Iadx70zn260zxF1OfspileKp
	Pp1wQawC890zfwXzmaLZ4Q+AtRjuVzzYM3AXKh0PsBa8RsQZbLSsrtPFHdN2agBz13a/E8g415L3B
	w/lyiR8l3ynhLB5I8vY0uCjD1AkatNRW46rbAgnT135tUKIMrhDcZYXec+JIfZQOzHQn/fZsccWW0
	lSKrqqXggSEuAMnzJPGnKsuOgFdNwbOg9LrRvIjZFHdX0q2+ls87VnWeIlANL5LaFCuIpgO+R11ht
	C2kjPwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8xP-000000065EV-2GSw;
	Sun, 24 Aug 2025 11:32:19 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8fr-000000063Yi-25Ag
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 11:14:12 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756034023; x=1757334023;
	bh=ADa+fVNGO4WZmlPkY9EPlfFvm3fduD+G2BAy5zB2N7o=; h=From;
	b=BIX6Ywury7THcZTUYmmkJAPhdSkdCI4UXdME4S4FwGX213bfIVVUGxYziYzSB4Otd
	 aO7LNYITNTTfZc+bz5Gwt2lOk+o4BkyNAAHPccl0otCve2rbHcP4sCS0lFu+TXV+85
	 YSYIPBEU/wmSzQAXhb9Fu7kdkMdkhw4alxrSmbgn1JrEZIbgBIdaEg16EWXKt9/DUC
	 SyF0oFa9HIR8p2phDhHrQnxf/mfczW3shD7zzKiiFdmPjV56J+XCYNF9ZODDAK+sV4
	 siF/aep1v4S1dUr2OgxYgbswwnmpG9uRE2lQIpI7RktRhjAEVqzwF++EhoQDY+EjTl
	 HZp07okK8RPMQ==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 57OBDf7f084268
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 24 Aug 2025 13:13:43 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 Aug 2025 13:13:41 +0200
Message-Id: <DCAM3WTJ4EXA.32GZBS4G7GWFJ@matfyz.cz>
To: <linux-mmc@vger.kernel.org>, <ulf.hansson@linaro.org>,
        =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        "Andrew Lunn"
 <andrew@lunn.ch>,
        "Gregory Clement" <gregory.clement@bootlin.com>,
        "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
        "Rob Herring"
 <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH mmc/next 3/3] arm64: dts: samsung,coreprimevelte: add
 SDIO
References: <20250824110039.28258-1-balejk@matfyz.cz>
 <20250824110039.28258-4-balejk@matfyz.cz>
In-Reply-To: <20250824110039.28258-4-balejk@matfyz.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_041411_830321_AF36555E 
X-CRM114-Status: UNSURE (   5.35  )
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

Karel Balej, 2025-08-24T12:53:45+02:00:
> +	sdh2_pins_0: sdh2-pins-0 {
> +		pinctrl-single,pins =3D <
> +			0x24 1
> +			0x28 1
> +			0x2c 1
> +			0x30 1
> +			0x34 1
> +			0x38 1
> +			0x3c 1
> +			0x40 1
> +		>;
> +		pinctrl-single,drive-strength =3D <0x1000 0x1800>;
> +		pinctrl-single,bias-pullup =3D <0 0xc000 0 0xc000>;
> +		pinctrl-single,bias-pulldown =3D <0 0xa000 0 0xa000>;
> +		pinctrl-single,input-schmitt =3D <0 0x30>;
> +		pinctrl-single,input-schmitt-enable =3D <0x40 0 0x40 0x40>;
> +		pinctrl-single,low-power-mode =3D <0 0x388>;
> +	};
> +
> +	sdh2_pins_1: sdh2-pins-1 {
> +		pinctrl-single,pins =3D <0x64 1>;
> +		pinctrl-single,drive-strength =3D <0x1000 0x1800>;
> +		pinctrl-single,bias-pullup =3D <0 0xc000 0 0xc000>;
> +		pinctrl-single,bias-pulldown =3D <0 0xa000 0 0xa000>;
> +		pinctrl-single,input-schmitt =3D <0 0x30>;
> +		pinctrl-single,input-schmitt-enable =3D <0x40 0 0x40 0x40>;
> +		pinctrl-single,low-power-mode =3D <0x208 0x388>;
> +	};
> +
> +	sdh2_pins_2: sdh2-pins-2 {
> +		pinctrl-single,pins =3D <0x5c 1>;
> +		pinctrl-single,bias-pullup =3D <0xc000 0xc000 0 0xc000>;
> +		pinctrl-single,bias-pulldown =3D <0x8000 0xa000 0x8000 0xa000>;
> +		pinctrl-single,low-power-mode =3D <0x288 0x388>;
> +	};
> +
> +	sdh2_fast_pins_0: sdh2-fast-pins-0 {
> +		pinctrl-single,pins =3D <
> +			0x24 1
> +			0x28 1
> +			0x2c 1
> +			0x30 1
> +			0x34 1
> +			0x38 1
> +			0x3c 1
> +			0x40 1
> +		>;
> +		pinctrl-single,drive-strength =3D <0x1800 0x1800>;
> +		pinctrl-single,bias-pullup =3D <0 0xc000 0 0xc000>;
> +		pinctrl-single,bias-pulldown =3D <0 0xa000 0 0xa000>;
> +		pinctrl-single,input-schmitt =3D <0 0x30>;
> +		pinctrl-single,input-schmitt-enable =3D <0x40 0 0x40 0x40>;
> +		pinctrl-single,low-power-mode =3D <0 0x388>;
> +	};
> +
> +	sdh2_fast_pins_1: sdh2-fast-pins-1 {
> +		pinctrl-single,pins =3D <0x64 1>;
> +		pinctrl-single,drive-strength =3D <0x1800 0x1800>;
> +		pinctrl-single,bias-pullup =3D <0 0xc000 0 0xc000>;
> +		pinctrl-single,bias-pulldown =3D <0 0xa000 0 0xa000>;
> +		pinctrl-single,input-schmitt =3D <0 0x30>;
> +		pinctrl-single,input-schmitt-enable =3D <0x40 0 0x40 0x40>;
> +		pinctrl-single,low-power-mode =3D <0x208 0x388>;
> +	};
> +
> +	sdh2_fast_pins_2: sdh2-fast-pins-2 {
> +		pinctrl-single,pins =3D <0x5c 1>;
> +		pinctrl-single,drive-strength =3D <0x1800 0x1800>;
> +		pinctrl-single,bias-pullup =3D <0xc000 0xc000 0 0xc000>;
> +		pinctrl-single,bias-pulldown =3D <0x8000 0xa000 0x8000 0xa000>;
> +		pinctrl-single,low-power-mode =3D <0x288 0x388>;
> +	};

Sorry, these got mixed in by accident and should be in a separate future
patch enabling the eMMC support. I will drop them from here when I send
the next version.

K. B.

