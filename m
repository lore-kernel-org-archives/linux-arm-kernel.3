Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE78E6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCWVat/vvC4U5UzbmGe36sanVHdGKWxZUqjzRnXG5aU=; b=FmYzpafNwrkdrUwg42NUk4+qyr
	TBJXSQSD3SqJ0W6Vnad4vEgkdLRGHueY3DqHeMFMQS8wt/nsCm1d4nUGneNEPCRptjolDVIExTqa4
	+XnBEgAhABGysFnegJvQqmvcAmejUAp2TNzKqzGoKROcRt30H1Dw8eBrklYwXXAZMmFyfT6bYN5O1
	VdsVCQ308fXLe7oq0DXJjzW0nOS2AoVBoGTpsv0ioORSqAH5J58h3F+GBWHfaDWdF6G02N1YF4qCC
	4fHtrhJrPtekuVFmy5W3CprPJGdAIKKZd80I3AfS1ww3CRbM1V09yj3B8wih7lasuJlcRa+q8hDu6
	poZfk8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uBF-00000007bid-39Gq;
	Fri, 01 Nov 2024 16:07:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6u0Q-00000007Zrj-0nEH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 957105C3EA1;
	Fri,  1 Nov 2024 15:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242E9C4CECD;
	Fri,  1 Nov 2024 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730476569;
	bh=t7oKgsETFr273A7RvyL2X1/OppxzBtZym5X35T8L0bQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eKVNy96uvXS9yt+HWB4rdfmMIzi7wfVwXUFOcitPN03t+l3CHWWkCIrZjHEvHtCIb
	 E0SErly6kNO7WGiCvO0Y9IcW4O0V+KzE+3HfzUWTamCLp3++wiyVCdPcjSbjD3TplH
	 9LipYT+lDyr8CvjgUr7DP2YR8HB3ZPYYCiu4w/ZcBOamrsECZadRdv2PhNft5+tUTR
	 Hd93CsC8cSHlGjSazxMb/f3P0SoUcYO4FdoFR+sgB7U2X0PS8V6yimtTDbYkH6vy33
	 TLNu3c29FKuZNEmyEz/YOl3b5VLKPaJJSqO7dUAfnJ2NC2A+UrCiHqDF3qyqDRLQZa
	 eSZlgUGw8LDbw==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Jishnu Prakash <quic_jprakash@quicinc.com>
In-Reply-To: <20241021232114.2636083-3-quic_molvera@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-3-quic_molvera@quicinc.com>
Subject: Re: (subset) [PATCH 2/5] dt-bindings: mfd: qcom,spmi-pmic:
 Document PMICs added in SM8750
Message-Id: <173047656485.1921130.11574000081112709760.b4-ty@kernel.org>
Date: Fri, 01 Nov 2024 15:56:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_085610_295845_447E7D8B 
X-CRM114-Status: UNSURE (   6.42  )
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

On Mon, 21 Oct 2024 16:21:11 -0700, Melody Olvera wrote:
> Document compatibles for the added pmd8028 and pmih0108 SPMI PMICs.
> 
> 

Applied, thanks!

[2/5] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs added in SM8750
      commit: 42e34f8446252a3dde70822d7e6f8d7d86ec20f4

--
Lee Jones [李琼斯]


