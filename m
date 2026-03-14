Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C078010706DD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xl+Uf18fqruXHqchg5arUmkQufHcl9O3lBTne7YsaaQ=; b=foPYF/FsUiCdXXypUcGqb8gwLy
	ihpdUrY0Rw6pQib3CVs+Mt+z+XTL3+Py26k1U3ejQUjLaA2O+g5UYiozcMVRJdKBUzFj2Y4SARC0u
	Z2nS6HbfvpKvNrZJFV1ujLWtych6s4zm+R6hK3fHeFxlrtzALvRwphTsv23EKbIT6k6uz9t4UM/ky
	LSDAGMt+PDyTpgZ9PG4oKUaZHQGXM4MOk8z8OMwbU//RGT/jw9SrqFBPszKYsF0oEXpei3IsL8Ref
	7xmN125PpcwaDyDY4j7UQoQoOeDalDuvrTY41TOfrmcGRcWTa9sYJClI4fDyj9DTmxZuTWObhp43o
	RlPag1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1PqL-00000001uup-2IHi;
	Sat, 14 Mar 2026 14:19:53 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1PqH-00000001uto-117Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 14:19:51 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1773497976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xl+Uf18fqruXHqchg5arUmkQufHcl9O3lBTne7YsaaQ=;
	b=EGLEwi+WJkwvV8gz682AmrPTMD1U66aeOBTeWeosWn8TziuY17rzTDlXucPem7yuwUbLq7
	k3uD0kFRayntDssYJGY5sVuAI4wWbmSzOu41+ADPrUqBWx/pcBVOU/y3PRMs7gzvDGYPQp
	pAUXoiRHvDVg7A3RYc4ZIKtqh/wY2k3K/nqRwi0G2EU1+QwCIg9Yt9XjmSAnqGUL6Hxno4
	bUE/fjvSpd7TFrBVCvYoMrAD9BRmxj8kEs1IeCwDxG1FQZv8v6n0o9bdsXtqGvZM0FsP3S
	0NOxd6rWdW1wq8uXlM6U+ImQcs3Sb6OhNdv01nvwlWX2ZRas/1r+Da2eeYSf5w==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 15:19:22 +0100
Message-Id: <DH2KK4G8Y2K1.3VO7LIFPTGDV1@cknow-tech.com>
Subject: Re: [PATCH v2 0/3] media: rockchip: rkvdec: add support for the
 VDPU346 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
Cc: "Christian Hewitt" <christianshewitt@gmail.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, =?utf-8?q?Olivier_Cr=C3=AAte?=
 <olivier.crete@collabora.com>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Dragan Simic" <dsimic@manjaro.org>, "Chukun Pan" <amadeus@jmu.edu.cn>,
 <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Nicolas Dufresne" <nicolas@ndufresne.ca>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
 <ee0fd1ecc6c940811cae743f087e96d348909c9a.camel@ndufresne.ca>
In-Reply-To: <ee0fd1ecc6c940811cae743f087e96d348909c9a.camel@ndufresne.ca>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_071950_697641_98C588A0 
X-CRM114-Status: GOOD (  15.63  )
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

Hi Nicolas,

On Sun Mar 8, 2026 at 10:40 PM CET, Nicolas Dufresne wrote:
> Le vendredi 26 d=C3=A9cembre 2025 =C3=A0 11:31 +0000, Christian Hewitt a =
=C3=A9crit=C2=A0:
>> This series depends upon Detlev Casanova's current v7 series for VDPU381=
 and
>> VDPU383 support [0]. It adds support for the VDPU346 IP block used for H=
264,
>> HEVC and (in active work) VP9 on the RK356X boards. VDPU346 appears to b=
e a
>> close relation to VDPU381 used with RK3588, except with a single core, o=
utput
>> limited to 4K, and minor feature differences, e.g. HEVC level 5.1 on VDP=
U346
>> vs 6.1 on VDPU381. To handle differences we declare a new compatible.
>>=20
>> The device-tree changes are derived from prior-art in Detlev's patches f=
or
>> RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempt=
s
>> from Piotr Oniszczuk and Diederik de Haas.
>>=20
>> The register differences between VDPU346 and VDPU381 appear to be minima=
l so
>> we currently and intentionally reuse the VDPU381 h264, hevc, and regs fi=
les
>> to avoid duplicating code. There is some evidence of buffer size changes=
 in
>> testing which still need to be explored. If further register analysis ne=
eds
>> separate files for VDPU346 the refactoring will be beyond my current n00=
b
>> coding skills and I will either need some coaching or would be happy to =
pass
>> the series over to a more experienced developer.
>
> A fluster score and explained error report is missing your this cover let=
ter.=20
> This will probably highlight some of the instability issues reported in t=
his
> series. I'll mark the series are "Change Request", as you have few review
> comments and now this test.
>
> Overall, I'd like to see probably investigations of the problem before go=
ing
> ahead.

FTR: You replied to v2 while there is a v3 here:
https://patch.msgid.link/20260110053727.2295260-1-christianshewitt@gmail.co=
m/

It (still) doesn't have a fluster score, but it is the currently most
recent version posted on the MLs.

Cheers,
  Diederik

