Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88931F364A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99WvpafNgC00TdwhpxyflrZyk31T3nLUtaw4nZnTa3A=; b=O2XTC6rLyIwwH7BLO0JDLnr76Z
	A2Add9payOPFl+z+UyRdSKopja5SiVAgSHNelYLts4aXIS9JUPkI4/cFKgS2ATev5smiLgyVATMCy
	KOL1F+Y3NAR9mRWjYLnHWZ4/rJqOvfzMJ+bYlu02MByey4YfCEz+wBOa1yFb+N+snfB2ISVI2PIW9
	+JflRnsw8f5kkcF03On5KAbvvyASR/QpPvRRvVoy5R+egTBxkZjSe1LXtcV16BGRfXb/R0AEr1r9y
	g0X6Qavq7wgxdrCt1LhMXRMuFHCX8sz9bRSWb5CHTv/JLZhxurERbP8J3j4EN6zMRDXOU3eekmukE
	PuHd9M4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuJ3-0000000B6X4-0zRs;
	Thu, 09 Apr 2026 18:40:45 +0000
Received: from mail-106105.protonmail.ch ([79.135.106.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuIz-0000000B6WS-05Wn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1775760035; x=1776019235;
	bh=99WvpafNgC00TdwhpxyflrZyk31T3nLUtaw4nZnTa3A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H0phYpxsB7XPwLrtnfyBN6mvMhy+ifqvS1OVIwQxLRbLu8/GIAUFfTRcvbzZqfwUV
	 rf8I0GJvkpeiYA7OYVE9V7phE3AVR7XIXIaT/hOTsJi0wtvBchGd62vHCp1vCL+nnO
	 LNDmcVP7zqZO0xDNBRiSFIhY9OpPljgIDI8YIe/gtviZUuFKWpZG1O8jApfZbg3N/r
	 rKPWxjUKgn2LM+AoTjoa5qZyU0nhes1r9A3QqjVQOgipr67e4jJmxQ+gVRK88m5Kuw
	 j9neUNX1uiAKmodUnlM26VR0bDRNzJE0U4IpI0T8eKqoydCcp8mQzFJ2KvOfXlhBii
	 pYO2VWTYUkeIw==
Date: Thu, 09 Apr 2026 18:40:29 +0000
To: Taniya Das <taniya.das@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock controllers
Message-ID: <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com> <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: c775f395f3f55a1766c8ed589cec7719a6c679ab
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_114042_629092_639DB029 
X-CRM114-Status: UNSURE (   5.15  )
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

On 09/04/2026 19:10, Taniya Das wrote:
> +=09=09videocc: clock-controller@aaf0000 {
> +=09=09=09compatible =3D "qcom,eliza-videocc";
> +=09=09=09reg =3D <0x0 0xaaf0000 0x0 0x10000>;
> +
> +=09=09=09clocks =3D <&bi_tcxo_div2>,
> +=09=09=09=09 <&sleep_clk>,
> +=09=09=09=09 <&gcc GCC_VIDEO_AHB_CLK>;
> +
> +=09=09=09#clock-cells =3D <1>;
> +=09=09=09#reset-cells =3D <1>;
> +=09=09=09#power-domain-cells =3D <1>;
> +=09=09};
> +
> +=09=09camcc: clock-controller@ade0000 {
> +=09=09=09compatible =3D "qcom,eliza-camcc";
> +=09=09=09reg =3D <0x0 0x0ade0000 0x0 0x20000>;
> +
> +=09=09=09clocks =3D <&gcc GCC_CAMERA_AHB_CLK>,
> +=09=09=09=09 <&bi_tcxo_div2>,
> +=09=09=09=09 <&sleep_clk>;
> +
> +=09=09=09#clock-cells =3D <1>;
> +=09=09=09#reset-cells =3D <1>;
> +=09=09};

This looks odd.

Why do these two controllers have no power-domains ?

---
bod


