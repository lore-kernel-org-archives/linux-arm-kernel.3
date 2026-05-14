Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0FACD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPzV/baLNkVaJccG7G3d5CG6tP06gvG8Jd3kErhl6FY=; b=r0MpinE3LTfuoCnSXiJvqeTqDQ
	gP8z8YLsS4so7Ar+4OEBwK2ZXN9Qa1D7lKpMw7U1jK+gLCxTftkVtu5VcxvhQT5Tjb7IBhH8TpYIi
	zFmHVw5Is3eu42tJ3j07R8EZmxvc01OgyFaMAULJrsrEEamSnkbZWMtiopRufdvKr3QwC902iK+gb
	njIQaxu8Z4jEe7yKV/V+8vSD2YP+xHOswwDIiBAHt8h06YZiaHRAbVGRX5r4l9KgNVpBO9IzetRtQ
	ReKiz2daqPEco0BMYDrtRiX3HEBqg80ZU5enjmK06xxK/WPhqFlRZesE/tnzwqzpOSKCJauA3BzyX
	r29lIUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT9O-00000005B1c-2RBP;
	Thu, 14 May 2026 10:18:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT9J-00000005B0v-49iu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 633BD441C3;
	Thu, 14 May 2026 10:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8261C2BCB3;
	Thu, 14 May 2026 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753917;
	bh=ZGWiAPbTqoxuhJhRPMeTnGjOAtHOa3jNZ5ZiMKaEnxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fp4rGbatiaMOWKd4wH4cmd0T542EPya70ORRMod5CQ24BC2eKMW3AT2LM+cNqlxzN
	 ixzWb8VKTQa5vqphpiA5O/ivx9+BKluroUUGXhIxmTnEo4eYYc7peeJzK2azj9IKeG
	 6vX0OeCyo9GTQCeDEccmjrUrMCAB2ZfFjFnLLHmyCrU3mZe6LyS08xoWuT9yEayW8b
	 2iN2hxLFvcOtHVVL6iMU6Tb9avBr+NFXZJNysP59U9TYcGc1b+k5ONqjtsehdUkLy+
	 QDrn0D92+HPBQG5ZCLd0UPuDX7PM2vVSEg6EYP5TmTmgottHFXvi6x1FwesAqG/LYk
	 9Q3tW8mGsKZYA==
Date: Thu, 14 May 2026 12:18:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Message-ID: <20260514-obedient-crouching-bulldog-7d63a8@quoll>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
 <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031838_045505_C7671291 
X-CRM114-Status: GOOD (  10.84  )
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

On Wed, May 13, 2026 at 08:57:36PM +0530, Taniya Das wrote:
> Eliza Video clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza video clock controller to the existing
> Milos videocc binding and add the dt-bindings header for Eliza.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 2 deletions(-)

Please allow others to actually review your patchsets. You sent v4
immediately without waiting for v3 review.... which did happen. So now
please address somewhere comments for v3.

Best regards,
Krzysztof


