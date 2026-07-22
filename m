Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3F1C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfewLHW10EN5u2eyfd56Kh/e8+peWlgKCd1UGQyH6ZQ=; b=MT/4s1wR3HNPIcUOGIfpcblRJE
	KX5pmX8ZFfPiPCrQxeYlt5XvpXIbpDN1QfMGY2dr7RYrGaVFq/utzps4OYqCMDl3wSLI1EigPaltv
	Hk/1MpBwBZcgofOSKGZ8lbKfWb3E/Q6Dy23Uu9wasQW4tHItb6R9xvc2NM46XzCidPjMaPcAc4fOn
	jb1GO6+LuQXDgDCm9T7P1g4qnXccAH4bK8UujdLewroUcDolw0pC+THc1WsjKZmrlZSgcgZRBWpB2
	AjzOIlB1B5YrJDGVO2dpqSMWqQVXTe6ZW/gNfkqejYAjiO2k30TG2o4vbpcd2BcjjF89DgKNd/dKk
	MzS+nqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmesY-0000000Crc2-41nY;
	Wed, 22 Jul 2026 21:53:26 +0000
Received: from mail-4318.protonmail.ch ([185.70.43.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmesV-0000000CrbS-1xT3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1784757198; x=1785016398;
	bh=xfewLHW10EN5u2eyfd56Kh/e8+peWlgKCd1UGQyH6ZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cCowEiITeyftg2OJZKzC1i40C1u7Uj8+Od8YBBJND4eA+4fs16cjPYYR1d0ppDf7E
	 OKYf+Gzl8aG2xKhIhVDoQ1i0ijFBUJKzBp5/cEYFXFS2BHeDR3E1a+YasF6cIzh9MG
	 kmRNOoVxqKvmUUSWE1L38A9UwehYMvUySZVM+g6aGAovUruOSHIe8bP2g06NEVtGWU
	 4bvHnOQGrve+etZiDj7avo2hRrgSc+eMZpAYddLUnKh815VJ4EuzB+uIPoGt8aAvth
	 R1I6V0DJGO3kGUjEQxveQIqb5koYZD8Iv+5TWwjjGACnOiLPVE2m0NNqoSkkU9cmlQ
	 TdpsBAZY6E8OQ==
Date: Wed, 22 Jul 2026 21:53:10 +0000
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V output supply
Message-ID: <a971f373-445f-4add-8374-706d7f99c845@nxsw.ie>
In-Reply-To: <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com> <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: f9332d42e8bee0446c36c427c9faa429a0848e0b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_145324_495853_C2A2D774 
X-CRM114-Status: UNSURE (   5.44  )
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

On 22/07/2026 17:12, Hongyang Zhao wrote:
> +=09=09enable-active-high;
> +
> +=09=09pinctrl-0 =3D <&vcc3v3_output_en>;
> +=09=09pinctrl-names =3D "default";
> +
> +=09=09regulator-always-on;
> +=09=09regulator-boot-on;
> +=09};

Seems like a reasonable thing to do for a mezzanine board but, I did a=20
double-take when I saw always-on and boot-on.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


