Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C675C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBEtiB/OBUOQgnkgS4sHatpdhYk4cTuNBQ2/FvpDbMc=; b=B0Vjw+tb8z9AeU6C1yJNM9AFTu
	7gDozZk5DDtYJo1NVTKjKfOaD7wUFTrkU7CGRFgJ/qD9Z/pwu+46JcvTwmhFiAzFS/sydcCGHxWwa
	vAsjBwnutGb3sBRPbar9TNXNjtrgZF7YdfWzulNO6GSJorR2Bb86h0d7m9rMbKXaOUtBHWEfnREL8
	5gultWTPWKutCDE3z9km81fozQ9cUhKNPVFnXhrIvO7FeenGhcUPdzXfbGqix/JYLjya8xhI1vSvv
	/gZaXdLbpcA733t3vRK7Qe+Z5kodJIHm8aunW4jyUSwCsPxIScJp+BAPO2cOC9mDCATj+pELwyGzG
	HCoZkcKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWj5-00000004TcT-1xDr;
	Tue, 01 Jul 2025 08:52:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWEi-00000004Ol3-1VTV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:21:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBA955C55C8;
	Tue,  1 Jul 2025 08:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7D7C4CEEE;
	Tue,  1 Jul 2025 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751358063;
	bh=IKeZCcNNQbdeaNTVppkO6cUdRxq1Vqd2h///xUYe4Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPgII8Bp2xOLTGJFW4oR2RScTDXxzOla0kh5UQCZWPcqXs4g8Mq4TvkEGuz1gyNb3
	 4yIZxBXluNgK/ZI1Y61dL9DGvwxiiNiEne95SYwtywSf49qza7R86NoMXxDE82KKB8
	 +BMDw6JqkvhohxYRLnb7Jd8zqgki7QGFOnFHyjqUsiIJDfe0AHUO1YkkrGMHwNEU64
	 V+v3k+vmEHGP4dDHGi1yIndszJqq12EQ1CIYTREdjxtQIrJvHg7CuPWUukFAXSQmcl
	 0a39IoVA31UeaxTKEShRW/ORjm+U6+Pg4oMDL6xlODTRsnL3vYQDaouC7u9TczXH9a
	 GBm50AC+6/yhQ==
Date: Tue, 1 Jul 2025 10:21:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Richard Cochran <richardcochran@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Anusha Rao <quic_anusha@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, 
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com
Subject: Re: [PATCH v2 1/8] dt-bindings: interconnect: Add Qualcomm IPQ5424
 NSSNOC IDs
Message-ID: <20250701-devious-pony-of-prowess-ff36c9@krzk-bin>
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-1-8d392f65102a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-1-8d392f65102a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_012104_441741_46730112 
X-CRM114-Status: GOOD (  10.30  )
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

On Fri, Jun 27, 2025 at 08:09:17PM +0800, Luo Jie wrote:
> Add the NSSNOC master/slave ids for Qualcomm IPQ5424 network subsystem
> (NSS) hardware blocks. These will be used by the gcc-ipq5424 driver
> that provides the interconnect services by using the icc-clk framework.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  include/dt-bindings/interconnect/qcom,ipq5424.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


