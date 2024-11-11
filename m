Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70191D41D40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 23:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1kbnaXoTlpDzhR7Und7m0yG1HUq2WsmOLWdk0VxH2U=; b=quJ5/XD9RjzFTRkiFi60Y/nvh3
	EkIQBQvUmnNVgJT35n787+g1+7t7U6yZ4tKDPAu1dku5yxa8YONanPBhH/axZbSJYC69z1uP9N7tT
	G1XXs/KUeqWapxgVZQso49bz1EvSsAoU7crYYWVNgDSBygNkfA3HUoZGi9l+wLn6oRCNq9AX/9Tcl
	99acgfxlvqVW6jfpzuOL1EXHmdIeu/YjszsiYC8GYYru0Mv4IK3dS4ztLNrZII+PED0iKlWPX3FD+
	3HW7GgYkpuj/hu9zZpt1LyIaiBx6NsLNjBD3K5e4tvjVHu/XF9VUgoehSf/hFtW0QsYMPh3b018m7
	43YRt9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeFb-00000001foc-0ZKK;
	Mon, 11 Nov 2024 23:55:19 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeDo-00000001fVh-0Wnu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 23:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731369206;
	bh=/1kbnaXoTlpDzhR7Und7m0yG1HUq2WsmOLWdk0VxH2U=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=kzYM1tMmRXj67bu5aN2rYgWXRdBhCtsYVc1CRiDHRq0DMX6IBCZzXs/b3TDGtWyn6
	 8InZgahjgAodowhz+RAX9ztwkB3hwkk66PVyQSN1Ewcbkc048gbBvs5G81SJHk7myO
	 yjh71q0HyINmvgElK7mRITBEanF3XaDA0jD8vAnnpB0uUOW4JfIdHWI26yMQOVMtdP
	 njvoialn2fQdzvn828mP02TFz7IFzkt1aqfG87xSVumEocXTC53xo7XLjozG6vjvGl
	 LdWP+iZXCDay/2Ox1GtDy2SZsyNQ4Y50s3UqlUUhtIwh8lZF+t5GrsGuxC3DekiLC9
	 CEM+G/OcxQ8IA==
Received: from [192.168.68.112] (ppp118-210-164-236.adl-adc-lon-bras34.tpg.internode.on.net [118.210.164.236])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1E96566029;
	Tue, 12 Nov 2024 07:53:25 +0800 (AWST)
Message-ID: <434b2dab17050643badc60c50b361153631b7cdd.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 3/5] ARM: dts: aspeed: Harma: Revise GPIO line name
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, Rob Herring
 <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Tue, 12 Nov 2024 10:23:24 +1030
In-Reply-To: <20241111094349.2894060-4-peteryin.openbmc@gmail.com>
References: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
	 <20241111094349.2894060-4-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_155328_558858_57045EAD 
X-CRM114-Status: UNSURE (   8.08  )
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

Hi Peter,

On Mon, 2024-11-11 at 17:43 +0800, Peter Yin wrote:
> =C2=A0 Add:
> =C2=A0=C2=A0=C2=A0 "ac-power-button",
> =C2=A0=C2=A0=C2=A0 "asic0-card-type-detection0-n"
> =C2=A0=C2=A0=C2=A0 "asic0-card-type-detection1-n"
> =C2=A0=C2=A0=C2=A0 "asic0-card-type-detection2-n"
>=20
> =C2=A0=C2=A0=C2=A0 "cpu0-prochot-alert",
> =C2=A0=C2=A0=C2=A0 "cpu0-thermtrip-alert",
>=20
> =C2=A0=C2=A0=C2=A0 "irq-uv-detect-alert",
> =C2=A0=C2=A0=C2=A0 "irq-hsc-alert",
>=20
> =C2=A0=C2=A0=C2=A0 "uart-switch-button"
> =C2=A0=C2=A0=C2=A0 "uart-switch-lsb"
> =C2=A0=C2=A0=C2=A0 "uart-switch-msb"
>=20
> =C2=A0=C2=A0=C2=A0 "leakage-detect-alert",
>=20
> =C2=A0=C2=A0=C2=A0 "power-card-enable",
> =C2=A0=C2=A0=C2=A0 "power-fault-n",
> =C2=A0=C2=A0=C2=A0 "power-hsc-good",
> =C2=A0=C2=A0=C2=A0 "power-chassis-good"
> =C2=A0=C2=A0=C2=A0 "presence-post-card",
> =C2=A0=C2=A0=C2=A0 "presence-cmm"
> =C2=A0=C2=A0=C2=A0 "pvdd11-ocp-alert"
>=20
> =C2=A0=C2=A0=C2=A0 "reset-control-cmos-clear"
> =C2=A0=C2=A0=C2=A0 "reset-cause-pcie",
> =C2=A0=C2=A0=C2=A0 "reset-cause-platrst",
>=20
> =C2=A0=C2=A0=C2=A0 "P0_I3C_APML_ALERT_L",

Rather than list the identifiers that are already contained in the
patch, can you please discuss what functionality these identifiers
enable, how different functions are related, and why this must all be
done in one patch?

>=20
> =C2=A0 Rename:
> =C2=A0=C2=A0=C2=A0 "power-cpu-good" to "host0-ready",
> =C2=A0=C2=A0=C2=A0 "host-ready-n" to "post-end-n

On the other-hand, explicitly calling out these changes is helpful, but
please also discuss the motivation and impact.

Andrew

